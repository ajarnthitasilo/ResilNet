import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import 'firmware_config.dart';
import 'ota_checksum.dart';

export 'ota_checksum.dart' show OtaChecksum, OtaControlMessage;

/// สถานะการแฟลชผ่าน BLE OTA
enum OtaPhase {
  idle,
  scanning,
  connecting,
  negotiating,
  transferring,
  verifying,
  rebooting,
  done,
  failed,
}

class OtaResult {
  const OtaResult({required this.success, this.message});

  final bool success;
  final String? message;
}

/// Production BLE OTA client — สอดคล้อง esp32_firmware OtaBleService
class Esp32OtaService extends ChangeNotifier {
  Esp32OtaService({FlutterReactiveBle? ble})
      : _ble = ble ?? FlutterReactiveBle();

  static final otaServiceUuid =
      Uuid.parse('e5f6a7b8-c9d0-4123-e456-789abcdef012');
  static final otaControlCharUuid =
      Uuid.parse('f6a7b8c9-d0e1-4234-f567-89abcdef0123');
  static final otaDataCharUuid =
      Uuid.parse('a7b8c9d0-e1f2-4345-a678-9abcdef01234');

  static const defaultChunkSize = 512;
  static const controlTimeout = Duration(seconds: 20);

  final FlutterReactiveBle _ble;

  OtaPhase _phase = OtaPhase.idle;
  OtaPhase get phase => _phase;

  double _progress = 0;
  double get progress => _progress;

  String? _statusMessage;
  String? get statusMessage => _statusMessage;

  OtaControlMessage? _lastControl;
  OtaControlMessage? get lastControl => _lastControl;

  double _bytesPerSecond = 0;
  double get bytesPerSecond => _bytesPerSecond;

  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<ConnectionStateUpdate>? _connSub;
  StreamSubscription<List<int>>? _notifySub;

  final List<DiscoveredDevice> _discovered = [];
  List<DiscoveredDevice> get discoveredDevices =>
      List.unmodifiable(_discovered);

  final _controlResponses = <Completer<OtaControlMessage>>[];

  /// สแกนหาบอร์ดที่โฆษณา OTA service
  Future<void> startScan() async {
    await stopScan();
    _discovered.clear();
    _setPhase(OtaPhase.scanning, 'กำลังค้นหา ESP32…');
    notifyListeners();

    _scanSub = _ble
        .scanForDevices(
          withServices: [otaServiceUuid],
          scanMode: ScanMode.lowLatency,
        )
        .listen(
          (d) {
            final idx = _discovered.indexWhere((e) => e.id == d.id);
            if (idx >= 0) {
              _discovered[idx] = d;
            } else {
              _discovered.add(d);
            }
            notifyListeners();
          },
          onError: (e) {
            _setPhase(OtaPhase.failed, 'สแกนล้มเหลว: $e');
          },
        );
  }

  Future<void> stopScan() async {
    await _scanSub?.cancel();
    _scanSub = null;
    if (_phase == OtaPhase.scanning) {
      _setPhase(OtaPhase.idle);
    }
  }

  Future<OtaResult> flashFirmware({
    required String deviceId,
    required File firmwareFile,
    required FirmwareKind kind,
    int chunkSize = defaultChunkSize,
  }) async {
    if (!await firmwareFile.exists()) {
      return const OtaResult(
        success: false,
        message: 'ไม่พบไฟล์เฟิร์มแวร์ — ดาวน์โหลดจากหน้าตั้งค่าก่อน',
      );
    }

    final bytes = await firmwareFile.readAsBytes();
    return flashBytes(
      deviceId: deviceId,
      bytes: bytes,
      kind: kind,
      chunkSize: chunkSize,
    );
  }

  Future<OtaResult> flashBytes({
    required String deviceId,
    required Uint8List bytes,
    required FirmwareKind kind,
    int chunkSize = defaultChunkSize,
  }) async {
    await stopScan();
    _progress = 0;
    _bytesPerSecond = 0;
    _lastControl = null;

    try {
      _setPhase(OtaPhase.connecting, 'กำลังเชื่อมต่อ…');
      await _connect(deviceId);
      await _subscribeControl(deviceId);

      final control = QualifiedCharacteristic(
        serviceId: otaServiceUuid,
        characteristicId: otaControlCharUuid,
        deviceId: deviceId,
      );
      final data = QualifiedCharacteristic(
        serviceId: otaServiceUuid,
        characteristicId: otaDataCharUuid,
        deviceId: deviceId,
      );

      _setPhase(OtaPhase.negotiating, 'เตรียมส่ง ${bytes.length} bytes…');
      final crcHex = OtaChecksum.crc32Hex(bytes);
      final md5Hex = OtaChecksum.md5Hex(bytes);
      final beginMsg = await _writeControlAndWait(
        control,
        otaBeginPayload(
          size: bytes.length,
          crc32Hex: crcHex,
          md5Hex: md5Hex,
          kind: kind.name,
        ),
        expectAckStage: 'begin',
      );
      if (beginMsg == null) {
        return const OtaResult(success: false, message: 'begin ไม่ได้รับ ACK');
      }

      _setPhase(OtaPhase.transferring, 'กำลังส่งเฟิร์มแวร์…');
      final started = DateTime.now();
      var offset = 0;
      while (offset < bytes.length) {
        final end = (offset + chunkSize).clamp(0, bytes.length);
        final chunk = bytes.sublist(offset, end);
        await _ble.writeCharacteristicWithoutResponse(data, value: chunk);
        offset = end;
        _progress = offset / bytes.length;
        final elapsed = DateTime.now().difference(started).inMilliseconds;
        if (elapsed > 0) {
          _bytesPerSecond = offset * 1000 / elapsed;
        }
        notifyListeners();
        await Future<void>.delayed(const Duration(milliseconds: 4));
      }

      _setPhase(OtaPhase.verifying, 'ยืนยัน checksum…');
      final commitMsg = await _writeControlAndWait(
        control,
        otaSimpleOp('commit'),
        expectAckStage: 'commit',
        timeout: const Duration(seconds: 30),
      );
      if (commitMsg == null) {
        // บอร์ดอาจ reboot ก่อนส่ง ACK — ถือว่าสำเร็จถ้าส่งครบ
        if (_progress >= 1.0) {
          _setPhase(OtaPhase.rebooting, 'กำลัง Reboot บอร์ด ESP32…');
          await Future<void>.delayed(const Duration(seconds: 3));
          _setPhase(OtaPhase.done, 'แฟลชเสร็จสมบูรณ์');
          return const OtaResult(success: true);
        }
        return const OtaResult(success: false, message: 'commit ไม่ได้รับ ACK');
      }

      _setPhase(OtaPhase.rebooting, 'กำลัง Reboot บอร์ด ESP32…');
      await Future<void>.delayed(const Duration(seconds: 2));
      _setPhase(OtaPhase.done, 'แฟลชเสร็จสมบูรณ์');
      return const OtaResult(success: true);
    } on TimeoutException {
      _setPhase(OtaPhase.failed, 'หมดเวลา');
      return const OtaResult(success: false, message: 'หมดเวลารอการตอบกลับ');
    } catch (e) {
      _setPhase(OtaPhase.failed, e.toString());
      return OtaResult(success: false, message: e.toString());
    } finally {
      await _disconnect();
    }
  }

  Future<void> _connect(String deviceId) async {
    final connected = Completer<void>();
    await _connSub?.cancel();
    _connSub = _ble
        .connectToDevice(
          id: deviceId,
          connectionTimeout: const Duration(seconds: 15),
        )
        .listen((u) {
      if (u.connectionState == DeviceConnectionState.connected &&
          !connected.isCompleted) {
        connected.complete();
      }
    });
    await connected.future.timeout(const Duration(seconds: 18));
  }

  Future<void> _subscribeControl(String deviceId) async {
    await _notifySub?.cancel();
    final c = QualifiedCharacteristic(
      serviceId: otaServiceUuid,
      characteristicId: otaControlCharUuid,
      deviceId: deviceId,
    );
    _notifySub = _ble.subscribeToCharacteristic(c).listen((raw) {
      if (raw.isEmpty) return;
      try {
        final map = jsonDecode(utf8.decode(raw)) as Map<String, dynamic>;
        final msg = OtaControlMessage.fromJson(map);
        _lastControl = msg;
        if (msg.isProgress && msg.total != null && msg.total! > 0) {
          _progress = (msg.received ?? 0) / msg.total!;
          notifyListeners();
        }
        if (_controlResponses.isNotEmpty) {
          final pending = _controlResponses.first;
          if (msg.isError) {
            if (!pending.isCompleted) {
              pending.completeError(Exception(msg.msg ?? 'OTA error'));
            }
            _controlResponses.removeAt(0);
          } else if (msg.isAck || msg.isProgress) {
            if (msg.isAck && !pending.isCompleted) {
              pending.complete(msg);
              _controlResponses.removeAt(0);
            }
          }
        }
        notifyListeners();
      } catch (_) {}
    });
  }

  Future<OtaControlMessage?> _writeControlAndWait(
    QualifiedCharacteristic control,
    String payload, {
    required String expectAckStage,
    Duration timeout = controlTimeout,
  }) async {
    final completer = Completer<OtaControlMessage>();
    _controlResponses.add(completer);
    await _ble.writeCharacteristicWithResponse(
      control,
      value: utf8.encode(payload),
    );
    try {
      final msg = await completer.future.timeout(timeout);
      if (msg.isAck && msg.stage == expectAckStage) return msg;
      if (msg.isError) throw Exception(msg.msg ?? 'OTA error');
      return msg;
    } on TimeoutException {
      _controlResponses.remove(completer);
      rethrow;
    }
  }

  Future<void> _disconnect() async {
    await _notifySub?.cancel();
    await _connSub?.cancel();
    _notifySub = null;
    _connSub = null;
    _controlResponses.clear();
  }

  void _setPhase(OtaPhase phase, [String? message]) {
    _phase = phase;
    _statusMessage = message;
    notifyListeners();
  }

  void reset() {
    _phase = OtaPhase.idle;
    _progress = 0;
    _bytesPerSecond = 0;
    _statusMessage = null;
    _lastControl = null;
    _discovered.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(stopScan());
    unawaited(_disconnect());
    super.dispose();
  }
}

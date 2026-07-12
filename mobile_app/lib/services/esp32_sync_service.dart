import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../core/resilnet_protocol.dart';
import '../models/chat_message.dart';
import 'broadcast_intake_service.dart';
import 'database_service.dart';

/// บริการซิงก์ข้อมูลกับ ESP32 Data Mule Node
///
/// ขั้นตอน:
/// 1) สแกนหา Service UUID ของ Node ในเบื้องหลัง
/// 2) เชื่อมต่ออัตโนมัติเมื่ออยู่ในรัศมี
/// 3) Handshake ID → Push ข้อความใหม่ → Pull ข้อความที่ขาด → Disconnect
class Esp32SyncService extends ChangeNotifier {
  Esp32SyncService({required DatabaseService database, this._broadcastIntake})
    : _db = database;

  final DatabaseService _db;
  final BroadcastIntakeService? _broadcastIntake;
  final _ble = FlutterReactiveBle();

  SyncPhase _phase = SyncPhase.idle;
  SyncPhase get phase => _phase;

  String? _connectedNodeId;
  String? get connectedNodeId => _connectedNodeId;

  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<ConnectionStateUpdate>? _connSub;
  StreamSubscription<List<int>>? _notifySub;
  Timer? _scanTimer;

  final _pendingResponses = <Completer<Map<String, dynamic>>>[];

  /// เริ่มสแกนหา ESP32 Node ในเบื้องหลัง
  Future<void> startBackgroundScan() async {
    if (_scanSub != null) return;
    _setPhase(SyncPhase.scanning);

    _scanSub = _ble
        .scanForDevices(
          withServices: [ResilNetProtocol.nodeServiceUuid],
          scanMode: ScanMode.balanced,
        )
        .listen(
          (device) {
            // เชื่อมต่ออัตโนมัติเมื่อพบ Node (ไม่ต้องกด Pairing)
            if (_phase != SyncPhase.scanning) return;
            unawaited(_connectAndSync(device.id));
          },
          onError: (e) {
            debugPrint('[Esp32Sync] scan error: $e');
          },
        );

    // รีสตาร์ทสแกนทุก 30 วินาทีเพื่อประหยัดพลังงาน
    _scanTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      if (_phase == SyncPhase.syncing) return;
      await _scanSub?.cancel();
      _scanSub = null;
      await startBackgroundScan();
    });
  }

  Future<void> stop() async {
    await _scanSub?.cancel();
    await _connSub?.cancel();
    await _notifySub?.cancel();
    _scanTimer?.cancel();
    _scanSub = null;
    _connSub = null;
    _notifySub = null;
    _scanTimer = null;
    _connectedNodeId = null;
    _setPhase(SyncPhase.idle);
  }

  Future<void> _connectAndSync(String deviceId) async {
    if (_phase == SyncPhase.syncing) return;
    _setPhase(SyncPhase.syncing);
    _connectedNodeId = deviceId;

    try {
      await _scanSub?.cancel();
      _scanSub = null;

      final connected = Completer<void>();
      _connSub = _ble
          .connectToDevice(
            id: deviceId,
            connectionTimeout: const Duration(seconds: 10),
          )
          .listen((update) async {
            if (update.connectionState == DeviceConnectionState.connected) {
              if (!connected.isCompleted) connected.complete();
            }
          });

      await connected.future.timeout(const Duration(seconds: 12));
      await _subscribeSync(deviceId);
      await _runSyncProtocol(deviceId);
    } catch (e) {
      debugPrint('[Esp32Sync] Error: $e');
    } finally {
      _connectedNodeId = null;
      _setPhase(SyncPhase.scanning);
      // กลับมาสแกนต่อ
      unawaited(startBackgroundScan());
    }
  }

  Future<void> _subscribeSync(String deviceId) async {
    final c = QualifiedCharacteristic(
      serviceId: ResilNetProtocol.nodeServiceUuid,
      characteristicId: ResilNetProtocol.nodeSyncCharUuid,
      deviceId: deviceId,
    );
    _notifySub = _ble.subscribeToCharacteristic(c).listen((data) {
      if (data.isEmpty) return;
      try {
        final map = jsonDecode(utf8.decode(data)) as Map<String, dynamic>;
        if (_pendingResponses.isNotEmpty) {
          _pendingResponses.removeAt(0).complete(map);
        }
      } catch (_) {}
    });
  }

  /// โปรโตคอลซิงก์: Handshake → Push → Pull → Done → Disconnect
  Future<void> _runSyncProtocol(String deviceId) async {
    final syncChar = QualifiedCharacteristic(
      serviceId: ResilNetProtocol.nodeServiceUuid,
      characteristicId: ResilNetProtocol.nodeSyncCharUuid,
      deviceId: deviceId,
    );

    // a) Handshake — ส่งรายการ Message ID ที่มือถือมี
    final localIds = await _db.getAllMessageIds();
    final hsReq = jsonEncode({'op': 'hs', 'ids': localIds});
    final hsResp = await _writeAndWait(syncChar, hsReq);
    final nodeIds = (hsResp['ids'] as List<dynamic>? ?? [])
        .cast<String>()
        .toSet();

    // ACK list จาก ESP32: ข้อความที่ ESP32 รับ/บันทึกแล้ว → ถือว่า Delivered
    final acks = (hsResp['acks'] as List<dynamic>? ?? []).cast<String>();
    if (acks.isNotEmpty) {
      await _db.markMessagesDelivered(acks);
    }

    // b) Push — ส่งข้อความที่ยังไม่ได้ซิงก์กับ ESP32
    final toPush = await _db.getMessagesNotSyncedWithEsp32();
    final pushMsgs = toPush.map(_toMule).toList();
    if (pushMsgs.isNotEmpty) {
      final pushReq = jsonEncode({
        'op': 'push',
        'msgs': pushMsgs.map((m) => m.toJson()).toList(),
      });
      final pullResp = await _writeAndWait(syncChar, pushReq);

      // c) Pull — รับข้อความที่ Node มีแต่มือถือยังไม่มี
      await _ingestPullResponse(pullResp, nodeIds);
    } else {
      // ไม่มี push — ขอ pull ข้อความที่ขาด
      final missingOnPhone = nodeIds.difference(localIds.toSet());
      if (missingOnPhone.isNotEmpty) {
        final pullReq = jsonEncode({'op': 'push', 'msgs': <Object>[]});
        final pullResp = await _writeAndWait(syncChar, pullReq);
        await _ingestPullResponse(pullResp, nodeIds);
      }
    }

    // d) แจ้งเสร็จสิ้น → ESP32 จะ disconnect เอง
    await _ble.writeCharacteristicWithResponse(
      syncChar,
      value: utf8.encode(jsonEncode({'op': 'done'})),
    );

    // ทำเครื่องหมายว่าซิงก์กับ ESP32 แล้ว
    for (final m in toPush) {
      await _db.markEsp32Synced(m.id);
      await _db.updateMessageStatus(
        m.id,
        MessageStatus.sent.name,
      ); // Transmitted
    }
  }

  Future<Map<String, dynamic>> _writeAndWait(
    QualifiedCharacteristic char,
    String payload,
  ) async {
    final completer = Completer<Map<String, dynamic>>();
    _pendingResponses.add(completer);
    await _ble.writeCharacteristicWithResponse(
      char,
      value: utf8.encode(payload),
    );
    return completer.future.timeout(const Duration(seconds: 15));
  }

  Future<void> _ingestPullResponse(
    Map<String, dynamic> resp,
    Set<String> nodeIds,
  ) async {
    if (resp['op'] == 'done') return;
    final msgs = resp['msgs'] as List<dynamic>? ?? [];
    for (final raw in msgs) {
      final mule = MuleMessage.fromJson(raw as Map<String, dynamic>);
      if (await _db.isMessageDuplicate(mule.id)) continue;
      final saved = await _db.saveMuleMessage(mule);
      if (saved.isBroadcast) {
        await _broadcastIntake?.processSaved(saved);
      }
    }
  }

  MuleMessage _toMule(ChatMessage msg) {
    if (msg.isBroadcast) {
      return MuleMessage(
        id: msg.id,
        sender: msg.senderId,
        timestamp: msg.timestamp,
        payload: msg.content ?? '',
        ttl: msg.ttl,
        type: 'broadcast',
        signedPayload: msg.encryptedPayload,
        signature: msg.signature,
        lat: msg.alertLat,
        lon: msg.alertLon,
        radiusM: msg.alertRadiusM,
        senderName: msg.senderName,
      );
    }
    return MuleMessage(
      id: msg.id,
      sender: msg.senderId,
      timestamp: msg.timestamp,
      payload: msg.encryptedPayload,
      ttl: msg.ttl,
      type: 'direct',
      encryptedKey: msg.encryptedKey,
      signature: msg.signature,
      receiverId: msg.receiverId,
    );
  }

  void _setPhase(SyncPhase p) {
    _phase = p;
    notifyListeners();
  }
}

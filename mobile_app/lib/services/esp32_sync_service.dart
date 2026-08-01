import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../core/resilnet_protocol.dart';
import '../models/chat_message.dart';
import 'crypto_service.dart';
import 'database_service.dart';

/// บริการซิงก์ข้อมูลกับ ESP32 Data Mule Node
///
/// ขั้นตอน:
/// 1) สแกนหา Service UUID ของ Node ในเบื้องหลัง
/// 2) เชื่อมต่ออัตโนมัติเมื่ออยู่ในรัศมี
/// 3) Handshake ID → Push ข้อความใหม่ → Pull ข้อความที่ขาด → Disconnect
class Esp32SyncService extends ChangeNotifier {
  Esp32SyncService({
    required DatabaseService database,
    this.crypto,
    this.outgoingBulletins,
    this.onBulletin,
  }) : _db = database;

  final DatabaseService _db;
  final CryptoService? crypto;

  /// Public bulletins ที่ยัง active — push เข้า ESP32 store-and-forward
  /// เพื่อให้เครื่องที่เข้ามาทีหลัง (late join) ได้รับตอน offline.
  final List<MuleMessage> Function()? outgoingBulletins;

  /// Ingest raw bulletin wire ที่ pull มาจาก ESP32 (verify ทำใน AppState).
  final Future<bool> Function(String rawWire)? onBulletin;
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

  /// Kick a fresh ESP32 scan/sync so newly posted bulletins land on the mule.
  Future<void> nudgeSync() async {
    if (_phase == SyncPhase.syncing) return;
    debugPrint('[Esp32Sync] nudgeSync phase=$_phase');
    try {
      await _scanSub?.cancel();
      _scanSub = null;
      _scanTimer?.cancel();
      _scanTimer = null;
      if (_phase != SyncPhase.idle) {
        _setPhase(SyncPhase.scanning);
      }
      await startBackgroundScan();
    } catch (e) {
      debugPrint('[Esp32Sync] nudgeSync failed: $e');
    }
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

    // a) Handshake — ส่งรายการ Message ID ที่มือถือมี (รวม bulletin ids
    // เพื่อไม่ให้ node ส่ง bulletin ที่มีอยู่แล้วกลับมา)
    final localIds = await _db.getAllMessageIds();
    final localBulletinIds =
        (outgoingBulletins?.call() ?? const <MuleMessage>[])
            .map((b) => b.id)
            .toList();
    final hsReq = jsonEncode({
      'op': 'hs',
      'ids': [...localIds, ...localBulletinIds],
    });
    final hsResp = await _writeAndWait(syncChar, hsReq);
    final nodeIds = (hsResp['ids'] as List<dynamic>? ?? [])
        .cast<String>()
        .toSet();

    // ACK list จาก ESP32: ข้อความที่ ESP32 รับ/บันทึกแล้ว → ถือว่า Delivered
    final acks = (hsResp['acks'] as List<dynamic>? ?? []).cast<String>();
    if (acks.isNotEmpty) {
      await _db.markMessagesDeliveredNow(acks);
    }

    // b) Push — ข้อความ direct ที่ยังไม่ได้ซิงก์ + public bulletins ที่ node ยังไม่มี
    final toPush = (await _db.getMessagesNotSyncedWithEsp32())
        .where((m) => !m.isBroadcast)
        .toList();
    final bulletins = (outgoingBulletins?.call() ?? const <MuleMessage>[])
        .where((b) => !nodeIds.contains(b.id))
        .toList();
    final pushMsgs = [...toPush.map(_toMule), ...bulletins];
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
      if (mule.type == 'bulletin') {
        // Public bulletin — plaintext + self-contained signature.
        // Verification/dedupe happens in the AppState ingest callback.
        final handler = onBulletin;
        if (handler != null) {
          final ok = await handler(mule.payload);
          debugPrint(
            '[Esp32Sync] bulletin id=${mule.id} ingest=${ok ? 'new' : 'skip'}',
          );
        }
        continue;
      }
      if (mule.isBroadcast) {
        debugPrint('[Esp32Sync] drop legacy broadcast id=${mule.id}');
        continue;
      }
      if (await _db.isMessageDuplicate(mule.id)) continue;
      if (!await _acceptSignedMule(mule)) continue;
      await _db.saveMuleMessage(mule);
    }
  }

  Future<bool> _acceptSignedMule(MuleMessage mule) async {
    final c = crypto;
    if (c == null) {
      debugPrint('[Esp32Sync] drop id=${mule.id} — no crypto');
      return false;
    }
    final receiverId = mule.receiverId ?? '';
    if (receiverId.isEmpty) {
      debugPrint('[Esp32Sync] drop id=${mule.id} — missing receiver');
      return false;
    }
    final peer = await _db.getPeer(mule.sender);
    final pub = peer?.publicKey.trim() ?? '';
    if (pub.isEmpty) {
      debugPrint('[Esp32Sync] drop unknown sender=${mule.sender} id=${mule.id}');
      return false;
    }
    final ok = c.verifyInboundEnvelope(
      signature: mule.signature,
      senderPublicPem: pub,
      encryptedPayload: mule.payload,
      encryptedKey: mule.encryptedKey ?? '',
      senderId: mule.sender,
      receiverId: receiverId,
      timestamp: mule.timestamp,
    );
    if (!ok) {
      debugPrint(
        '[Esp32Sync] drop bad/missing signature id=${mule.id} sender=${mule.sender}',
      );
    }
    return ok;
  }

  MuleMessage _toMule(ChatMessage msg) {
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

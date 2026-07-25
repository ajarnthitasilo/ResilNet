import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../models/chat_message.dart';
import '../models/peer.dart';
import '../services/ack_handler_service.dart';
import '../services/ack_queue_manager.dart';
import '../src/rust/api/dto.dart';
import 'database_service.dart';
import 'resilnet_packet_codec.dart';
import 'resilnet_service.dart';

/// BLE Mesh Routing Engine (multi-hop store-and-forward)
///
/// รับส่งทางกายภาพผ่าน BLE — การตัดสินใจเส้นทาง (Hybrid Router) อยู่ที่ Rust FFI
class BleMeshService extends ChangeNotifier {
  BleMeshService({
    required DatabaseService database,
    required this.myUserId,
    this.resilnet,
    this.ackQueue,
    this.ackHandler,
  }) : _db = database;

  final ResilNetService? resilnet;
  final AckQueueManager? ackQueue;
  final AckHandlerService? ackHandler;

  static final serviceUuid = Uuid.parse('9d2f3bb2-3a5a-4f6e-a0c2-9d62c2d4d2a1');
  static final characteristicUuid = Uuid.parse('ef8a0f1a-7b27-46d8-9e2a-7d66c1f1d9b1');
  static final identityCharacteristicUuid = Uuid.parse('f1c3e5aa-3fb3-4c2e-a8bc-9b0c5bd4f1b7');

  final DatabaseService _db;
  final String myUserId;
  final _ble = FlutterReactiveBle();

  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<ConnectionStateUpdate>? _connSub;
  StreamSubscription<List<int>>? _notifySub;
  Timer? _sendTimer;
  Timer? _cleanupTimer;

  final Map<String, DiscoveredDevice> _nearby = {};
  int get nearbyPeerCount => _nearbyPeers.isNotEmpty ? _nearbyPeers.length : _nearby.length;
  List<Peer> _nearbyPeers = const [];
  List<Peer> get nearbyPeers => _nearbyPeers;

  bool _running = false;
  bool get running => _running;

  String? _connectedDeviceId;
  String? get connectedDeviceId => _connectedDeviceId;

  Future<void> start() async {
    if (_running) return;
    _running = true;
    _wireChunkArqCallbacks();
    notifyListeners();

    _scanSub = _ble
        .scanForDevices(withServices: const [], scanMode: ScanMode.balanced)
        .listen((d) {
      _nearby[d.id] = d;
      unawaited(_handleDiscoveredDevice(d));
    }, onError: (e) {
      debugPrint('[BleMesh] scan error: $e');
    });

    _sendTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      unawaited(_pumpSendQueue());
    });

    _cleanupTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      unawaited(_recomputeNearbyPeers());
    });
  }

  Future<void> stop() async {
    _running = false;
    await _scanSub?.cancel();
    await _connSub?.cancel();
    await _notifySub?.cancel();
    _scanSub = null;
    _connSub = null;
    _notifySub = null;
    _sendTimer?.cancel();
    _sendTimer = null;
    _cleanupTimer?.cancel();
    _cleanupTimer = null;
    _nearby.clear();
    _connectedDeviceId = null;
    _nearbyPeers = const [];
    notifyListeners();
  }

  DateTime _lastIdentityAttempt = DateTime.fromMillisecondsSinceEpoch(0);
  final Set<String> _identityAttempted = {};

  Future<void> _handleDiscoveredDevice(DiscoveredDevice d) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    final parsed = _tryParsePeerFromServiceData(d, now);
    if (parsed != null) {
      await _db.upsertPeer(parsed.copyWith(deviceId: d.id, lastSeen: now));
      return;
    }

    if (_identityAttempted.contains(d.id)) return;
    final since = DateTime.now().difference(_lastIdentityAttempt);
    if (since < const Duration(seconds: 8)) return;
    if (_identityAttempted.length > 12) {
      _identityAttempted.clear();
    }
    _identityAttempted.add(d.id);
    _lastIdentityAttempt = DateTime.now();

    try {
      final peer = await readPeerIdentity(d.id).timeout(const Duration(seconds: 3));
      await _db.upsertPeer(peer.copyWith(deviceId: d.id, lastSeen: now));
    } catch (_) {}
  }

  Peer? _tryParsePeerFromServiceData(DiscoveredDevice d, int now) {
    final data = d.serviceData[_svcDataIdKey];
    if (data == null || data.isEmpty) return null;
    try {
      final obj = jsonDecode(utf8.decode(data)) as Map<String, dynamic>;
      final id = (obj['id'] as String?)?.trim();
      final pub = (obj['pubKey'] as String?)?.trim();
      final name = (obj['name'] as String?)?.trim();
      if (id == null || id.isEmpty || pub == null || pub.isEmpty) return null;
      return Peer(
        id: id,
        publicKey: pub,
        displayName: name,
        isVerifiedIssuer: false,
        isBlocked: false,
        lastSeen: now,
      );
    } catch (_) {
      return null;
    }
  }

  static final _svcDataIdKey = serviceUuid;

  Future<Peer> readPeerIdentity(String deviceId) async {
    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: identityCharacteristicUuid,
      deviceId: deviceId,
    );
    final bytes = await _ble.readCharacteristic(c);
    final obj = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
    final id = (obj['id'] as String?) ?? deviceId;
    final pubKey = (obj['pubKey'] as String?) ?? '';
    final name = obj['name'] as String?;
    if (pubKey.isEmpty) throw StateError('Missing public key');
    return Peer(
      id: id,
      publicKey: pubKey,
      displayName: name,
      isVerifiedIssuer: false,
      isBlocked: false,
      lastSeen: DateTime.now().millisecondsSinceEpoch,
    );
  }

  Future<void> _recomputeNearbyPeers() async {
    _nearbyPeers = await _db.getActivePeers(activeWithinMs: 15000);
    notifyListeners();
    await resilnet?.refreshBlePeerCount(nearbyPeerCount);
  }

  void _wireChunkArqCallbacks() {
    final rust = resilnet;
    if (rust == null) return;
    rust.setBleNackSender(_sendBleNack);
    rust.setBleChunkSender(_sendBleChunk);
  }

  Future<bool> _sendBleNack(Uint8List nackFrame) async {
    final deviceId = _connectedDeviceId;
    if (deviceId == null) return false;
    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );
    try {
      await _ble.writeCharacteristicWithResponse(c, value: nackFrame);
      return true;
    } catch (e) {
      debugPrint('[BleMesh] NACK send failed: $e');
      return false;
    }
  }

  Future<bool> _sendBleChunk({
    required String messageId,
    required int chunkIndex,
    required int ttl,
    required Uint8List payload,
  }) async {
    final deviceId = _connectedDeviceId;
    if (deviceId == null) return false;
    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );
    try {
      await _ble.writeCharacteristicWithResponse(c, value: payload);
      return true;
    } catch (e) {
      debugPrint('[BleMesh] chunk retransmit failed: $e');
      return false;
    }
  }

  Future<void> connect(String deviceId) async {
    await _connSub?.cancel();
    await _notifySub?.cancel();

    _connSub = _ble.connectToDevice(id: deviceId, connectionTimeout: const Duration(seconds: 8)).listen(
      (u) async {
        if (u.connectionState == DeviceConnectionState.connected) {
          _connectedDeviceId = deviceId;
          notifyListeners();
          await _subscribeIncoming(deviceId);
        } else if (u.connectionState == DeviceConnectionState.disconnected) {
          _connectedDeviceId = null;
          notifyListeners();
        }
      },
      onError: (_) {
        _connectedDeviceId = null;
        notifyListeners();
      },
    );
  }

  Future<void> _subscribeIncoming(String deviceId) async {
    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );
    _notifySub = _ble.subscribeToCharacteristic(c).listen((data) async {
      if (data.isEmpty) {
        debugPrint('[BleMesh] drop empty packet from device=$deviceId');
        return;
      }
      try {
        await _handleIncomingBytes(Uint8List.fromList(data));
      } catch (e) {
        debugPrint('[BleMesh] drop malformed packet from device=$deviceId: $e');
      }
    });
  }

  Future<void> _handleIncomingBytes(Uint8List bytes) async {
    final nack = ResilNetNackCodec.tryDecode(bytes);
    if (nack != null) {
      await resilnet?.handleIncomingNack(
        nack,
        transport: ChunkArqTransport.ble,
      );
      return;
    }

    if (ResilNetChunkCodec.isChunked(bytes) ||
        (bytes.isNotEmpty && bytes[0] == 0x7B)) {
      final rust = resilnet;
      if (rust != null && rust.isInitialized) {
        final result = await rust.handleIncomingChunkBytes(
          bytes,
          transport: ChunkArqTransport.ble,
        );
        if (result?.complete != null) return;
        if (ResilNetChunkCodec.isChunked(bytes)) return;
      }
    }

    final ackPacket = ResilNetAckCodec.decodeBatchPacket(bytes);
    if (ackPacket != null) {
      await ackHandler?.handleBatchPacket(ackPacket);
      return;
    }

    final msg = _decodeMessage(bytes);
    await handleIncoming(msg);
  }

  ChatMessage _decodeMessage(Uint8List bytes) {
    final map = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;
    return ChatMessage.fromMap(map);
  }

  /// รับแพ็กเก็ตจาก BLE — ส่งเข้า Rust dedup ก่อน (UI อัปเดตผ่าน Stream ใน AppState)
  Future<void> handleIncoming(ChatMessage msg) async {
    if (await _db.isPeerBlocked(msg.senderId)) {
      debugPrint('[BleMesh] drop blocked sender=${msg.senderId} id=${msg.id}');
      return;
    }

    final rust = resilnet;
    if (rust != null && rust.isInitialized) {
      try {
        final dto = ResilNetPacketCodec.toDto(msg);
        await rust.ingestMessage(
          id: dto.id,
          sender: dto.sender,
          receiver: dto.receiver,
          payload: dto.payload,
          timestampMs: dto.timestamp.toInt(),
          ttl: dto.ttl,
        );
      } catch (e) {
        debugPrint('[BleMesh] Rust ingest rejected id=${msg.id}: $e');
      }
      return;
    }

    await applyIncomingFromRouter(msg);
  }

  /// บันทึกข้อความที่ผ่าน dedup แล้วจาก Rust router
  Future<void> applyIncomingFromRouter(ChatMessage msg) async {
    // Legacy village-broadcast product removed — drop quietly (no UI / no crash).
    if (msg.isBroadcast) {
      debugPrint('[BleMesh] drop legacy broadcast id=${msg.id}');
      return;
    }

    await _db.saveMessage(msg);

    if (msg.receiverId == myUserId) {
      final now = DateTime.now();
      await _db.markMessagesDelivered([msg.id], now);
      if (msg.type == MessageType.direct && msg.senderId != myUserId) {
        await ackQueue?.enqueueDelivered(
          msgId: msg.id,
          targetSenderId: msg.senderId,
          at: now,
        );
      }
    } else if (msg.ttl > 0) {
      final relayed = msg.copyWith(ttl: msg.ttl - 1, status: MessageStatus.relayed);
      await _db.saveMessage(relayed);
      await _db.updateMessageStatus(msg.id, MessageStatus.relayed.name);
    } else {
      debugPrint(
        '[BleMesh] drop no-relay ttl=0 id=${msg.id} sender=${msg.senderId} receiver=${msg.receiverId}',
      );
    }
    notifyListeners();
  }

  /// ส่งคิวข้อความ — ใช้ Rust Hybrid Router เลือกช่องทางก่อนส่ง BLE
  Future<void> _pumpSendQueue() async {
    final deviceId = _connectedDeviceId;
    if (deviceId == null) return;

    final items = await _db.getPendingOrRelayMessages();
    if (items.isEmpty) return;

    for (final msg in items) {
      try {
        ChatMessage toSend = msg;
        final rust = resilnet;
        if (rust != null && rust.isInitialized) {
          final piggyback =
              ackQueue?.drainPiggybackFor(msg.receiverId) ?? const [];
          final dto = ResilNetPacketCodec.toDto(
            msg,
            piggybackAcks: piggyback,
          );
          final routed = await rust.routeMessage(
            id: msg.id,
            sender: msg.senderId,
            receiver: msg.receiverId,
            payload: dto.payload,
            timestampMs: msg.timestamp,
            ttl: msg.ttl,
            payloadTag: dto.payloadTag,
          );
          if (routed.transport == TransportTypeDto.offlineQueue) {
            continue;
          }
          if (routed.transports.contains(TransportTypeDto.nostr) &&
              !routed.transports.contains(TransportTypeDto.bluetoothMesh) &&
              !routed.transports.contains(TransportTypeDto.loRa)) {
            debugPrint(
              '[BleMesh] nostr-only id=${msg.id} — skip BLE hop',
            );
            continue;
          }
          toSend = msg.copyWith(ttl: routed.packet.ttl);
        }

        await _sendBleChunkedMessage(toSend);
        await _db.updateMessageStatus(msg.id, MessageStatus.sent.name);
      } catch (_) {
        break;
      }
    }
    notifyListeners();
  }

  /// Encrypt-then-Chunk ผ่าน BLE (เปิดใช้ NACK ARQ)
  Future<void> _sendBleChunkedMessage(ChatMessage msg) async {
    final deviceId = _connectedDeviceId;
    if (deviceId == null) throw StateError('no BLE connection');

    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );

    final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
    final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
    final rust = resilnet;
    if (rust != null) {
      await rust.chunkArq.registerOutbound(
        messageId: msg.id,
        ttl: msg.ttl,
        chunks: chunks,
        transport: ChunkArqTransport.ble,
      );
    }

    for (var i = 0; i < chunks.length; i++) {
      if (i > 0) {
        await Future<void>.delayed(ResilNetChunkCodec.defaultInterChunkDelay);
      }
      await _ble.writeCharacteristicWithResponse(c, value: chunks[i]);
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter_ble_peripheral/flutter_ble_peripheral.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../core/resilnet_payload_type.dart';
import '../core/payload_kinds.dart';
import '../models/area_presence.dart';
import '../models/chat_message.dart';
import '../models/peer.dart';
import '../services/ack_handler_service.dart';
import '../services/ack_queue_manager.dart';
import '../src/rust/api/dto.dart';
import 'crypto_service.dart';
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
    this.crypto,
    this.resilnet,
    this.ackQueue,
    this.ackHandler,
    bool Function()? shouldPersistHistory,
    void Function(ChatMessage message)? onEphemeralMessage,
    Future<bool> Function(ChatMessage message)? onBulletinMessage,
  })  : _db = database,
        _shouldPersistHistory = shouldPersistHistory ?? (() => true),
        _onEphemeralMessage = onEphemeralMessage,
        _onBulletinMessage = onBulletinMessage;

  final CryptoService? crypto;
  final ResilNetService? resilnet;
  final AckQueueManager? ackQueue;
  final AckHandlerService? ackHandler;
  final bool Function() _shouldPersistHistory;
  final void Function(ChatMessage message)? _onEphemeralMessage;

  /// Public bulletin ingest (verify + dedupe ทำใน AppState).
  /// คืน true เมื่อ bulletin ผ่านการตรวจและถูกรับเข้า.
  final Future<bool> Function(ChatMessage message)? _onBulletinMessage;

  static final serviceUuid = Uuid.parse('9d2f3bb2-3a5a-4f6e-a0c2-9d62c2d4d2a1');
  static final characteristicUuid = Uuid.parse('ef8a0f1a-7b27-46d8-9e2a-7d66c1f1d9b1');
  static final identityCharacteristicUuid = Uuid.parse('f1c3e5aa-3fb3-4c2e-a8bc-9b0c5bd4f1b7');

  final DatabaseService _db;
  final String myUserId;
  final _ble = FlutterReactiveBle();
  final _peripheral = FlutterBlePeripheral();
  bool _advertising = false;
  bool _advertiseInFlight = false;
  Timer? _roleTimer;
  bool _roleAdvertisePhase = true;
  static const _iosScanWindow = Duration(seconds: 5);
  static const _iosAdvertiseWindow = Duration(seconds: 2);

  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<BleStatus>? _bleStatusSub;
  StreamSubscription<ConnectionStateUpdate>? _connSub;
  StreamSubscription<List<int>>? _notifySub;
  Timer? _sendTimer;
  Timer? _cleanupTimer;

  final Map<String, DiscoveredDevice> _nearby = {};
  final Map<String, int> _nearbyLastSeenMs = {};
  int get nearbyPeerCount => _nearbyPeers.isNotEmpty ? _nearbyPeers.length : _nearby.length;
  List<Peer> _nearbyPeers = const [];
  List<Peer> get nearbyPeers => _nearbyPeers;

  bool _running = false;
  bool get running => _running;

  String? _connectedDeviceId;
  String? get connectedDeviceId => _connectedDeviceId;
  DateTime _lastNearbyLog = DateTime.fromMillisecondsSinceEpoch(0);

  Future<void> start() async {
    if (_running) return;
    _running = true;
    _wireChunkArqCallbacks();
    debugPrint('[BLE] start scan+mesh requested');
    notifyListeners();

    _bleStatusSub?.cancel();
    _bleStatusSub = _ble.statusStream.listen((status) {
      debugPrint('[BLE] adapter status=$status');
      if (!_running) return;
      if (status == BleStatus.ready) {
        _kickRadioRoles(force: true);
      }
    });

    _kickRadioRoles(force: true);

    _sendTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      unawaited(_pumpSendQueue());
    });

    _cleanupTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      _pruneStaleNearby();
      unawaited(_recomputeNearbyPeers());
    });
  }

  Future<void> stop() async {
    _running = false;
    _roleTimer?.cancel();
    _roleTimer = null;
    await _stopAdvertising();
    await _scanSub?.cancel();
    await _bleStatusSub?.cancel();
    await _connSub?.cancel();
    await _notifySub?.cancel();
    _scanSub = null;
    _bleStatusSub = null;
    _connSub = null;
    _notifySub = null;
    _sendTimer?.cancel();
    _sendTimer = null;
    _cleanupTimer?.cancel();
    _cleanupTimer = null;
    _nearby.clear();
    _nearbyLastSeenMs.clear();
    _connectedDeviceId = null;
    _nearbyPeers = const [];
    notifyListeners();
  }

  /// iOS cannot run central+peripheral reliably at once — duty-cycle roles.
  /// Android can usually do both; still advertise UUID-only for scan filters.
  void _kickRadioRoles({bool force = false}) {
    _roleTimer?.cancel();
    if (Platform.isIOS) {
      // Desync phones: stagger start + asymmetric scan-heavy windows.
      _roleAdvertisePhase = myUserId.hashCode.isEven;
      final offsetMs = (myUserId.hashCode % 2500).abs() + 400;
      Future<void>.delayed(Duration(milliseconds: offsetMs), () {
        if (!_running) return;
        unawaited(_applyRolePhase());
        _scheduleIosRoleFlip();
      });
    } else {
      _startScanning();
      unawaited(_startAdvertising());
    }
    if (force) {
      debugPrint(
        '[BLE] roles kicked ios=${Platform.isIOS} advertiseFirst=$_roleAdvertisePhase '
        'scan=${_iosScanWindow.inSeconds}s adv=${_iosAdvertiseWindow.inSeconds}s',
      );
    }
  }

  void _scheduleIosRoleFlip() {
    _roleTimer?.cancel();
    void tick() {
      if (!_running) return;
      unawaited(_applyRolePhase());
      _roleAdvertisePhase = !_roleAdvertisePhase;
      final next = _roleAdvertisePhase ? _iosAdvertiseWindow : _iosScanWindow;
      _roleTimer = Timer(next, tick);
    }
    final first = _roleAdvertisePhase ? _iosAdvertiseWindow : _iosScanWindow;
    _roleTimer = Timer(first, tick);
  }

  Future<void> _applyRolePhase() async {
    if (!_running) return;
    if (_roleAdvertisePhase) {
      await _scanSub?.cancel();
      _scanSub = null;
      await _startAdvertising();
    } else {
      await _stopAdvertising();
      _startScanning();
    }
  }

  /// Company id 0xFFFF (internal/testing) + magic "RN" + peer-id prefix.
  static const int _mfgCompanyId = 0xFFFF;
  static const int _fingerprintPrefixLen = 8;

  Uint8List _fingerprintPayload() {
    final id = myUserId.trim();
    final take = id.length < _fingerprintPrefixLen ? id : id.substring(0, _fingerprintPrefixLen);
    return Uint8List.fromList(<int>[
      0x52, // R
      0x4E, // N
      ...utf8.encode(take),
    ]);
  }

  String? _parseFingerprintPeerPrefix(Uint8List manufacturerData) {
    // reactive_ble: first 2 bytes = company id (LE).
    if (manufacturerData.length < 4) return null;
    final company = manufacturerData[0] | (manufacturerData[1] << 8);
    if (company != _mfgCompanyId) return null;
    if (manufacturerData[2] != 0x52 || manufacturerData[3] != 0x4E) return null;
    try {
      final prefix = utf8.decode(manufacturerData.sublist(4)).trim();
      if (prefix.length < 4) return null;
      return prefix;
    } catch (_) {
      return null;
    }
  }

  bool _looksLikeResilNetAdv(DiscoveredDevice d) {
    if (d.serviceData.containsKey(serviceUuid)) return true;
    if (d.serviceUuids.any(
      (u) => u.toString().toLowerCase() == serviceUuid.toString().toLowerCase(),
    )) {
      return true;
    }
    if (_parseFingerprintPeerPrefix(d.manufacturerData) != null) return true;
    final n = d.name.toLowerCase();
    return n.contains('resil');
  }

  /// Advertise ResilNet service UUID / fingerprint so nearby phones can find us.
  ///
  /// iOS ADV packets are tiny: UUID-only and fingerprint-only alternate so both
  /// fit over successive advertise windows. Android can carry both at once.
  Future<void> _startAdvertising() async {
    if (_advertiseInFlight) return;
    _advertiseInFlight = true;
    try {
      final supported = await _peripheral.isSupported;
      if (!supported) {
        debugPrint('[BLE] peripheral advertise unsupported on this device');
        return;
      }
      final fp = _fingerprintPayload();
      final AdvertiseData data;
      if (Platform.isIOS) {
        // Alternate: UUID discovery vs fingerprint binding.
        final useFingerprint = DateTime.now().second.isEven;
        data = useFingerprint
            ? AdvertiseData(
                includeDeviceName: false,
                manufacturerId: _mfgCompanyId,
                manufacturerData: fp,
              )
            : AdvertiseData(
                serviceUuid: serviceUuid.toString(),
                serviceUuids: [serviceUuid.toString()],
                localName: null,
                includeDeviceName: false,
              );
      } else {
        data = AdvertiseData(
          serviceUuid: serviceUuid.toString(),
          serviceUuids: [serviceUuid.toString()],
          localName: 'ResilNet',
          includeDeviceName: false,
          manufacturerId: _mfgCompanyId,
          manufacturerData: fp,
        );
      }
      final state = await _peripheral.start(
        advertiseData: data,
        advertiseSettings: AdvertiseSettings(
          advertiseMode: AdvertiseMode.advertiseModeLowLatency,
          txPowerLevel: AdvertiseTxPower.advertiseTxPowerHigh,
          connectable: true,
          timeout: 0,
        ),
      );
      await Future<void>.delayed(const Duration(milliseconds: 350));
      final ok = await _peripheral.isAdvertising;
      _advertising = ok;
      debugPrint(
        '[BLE] advertising start state=$state isAdvertising=$ok uuid=$serviceUuid',
      );
      if (!ok) {
        try {
          await _peripheral.stop();
        } catch (_) {}
      }
    } catch (e) {
      _advertising = false;
      debugPrint('[BLE] advertising start failed: $e');
    } finally {
      _advertiseInFlight = false;
    }
  }

  Future<void> _stopAdvertising() async {
    try {
      await _peripheral.stop();
      if (_advertising) debugPrint('[BLE] advertising stopped');
    } catch (e) {
      debugPrint('[BLE] advertising stop failed: $e');
    } finally {
      _advertising = false;
    }
  }

  void _startScanning() {
    // Unfiltered + client filter: UUID ads and manufacturer fingerprints both
    // visible (iOS filtered scans miss manufacturer-only windows).
    _startFallbackScan();
  }

  void _startFallbackScan() {
    _scanSub?.cancel();
    debugPrint('[BLE] starting unfiltered ResilNet scan');
    _scanSub = _ble
        .scanForDevices(
          withServices: const [],
          scanMode: ScanMode.lowLatency,
          requireLocationServicesEnabled: false,
        )
        .listen((d) {
          if (_looksLikeResilNetAdv(d)) _onScanHit(d);
        }, onError: (e) {
          debugPrint('[BLE] scan error: $e');
        });
  }

  void _onScanHit(DiscoveredDevice d) {
    _nearby[d.id] = d;
    _nearbyLastSeenMs[d.id] = DateTime.now().millisecondsSinceEpoch;
    final fp = _parseFingerprintPeerPrefix(d.manufacturerData);
    final hasUuid = d.serviceUuids.any(
      (u) => u.toString().toLowerCase() == serviceUuid.toString().toLowerCase(),
    );
    debugPrint(
      '[BLE] discovered device=${d.id} rssi=${d.rssi} '
      'uuid=$hasUuid fp=${fp != null}',
    );
    unawaited(_handleDiscoveredDevice(d));
    unawaited(_recomputeNearbyPeers());
  }

  DateTime _lastIdentityAttempt = DateTime.fromMillisecondsSinceEpoch(0);
  final Set<String> _identityAttempted = {};

  Future<void> _handleDiscoveredDevice(DiscoveredDevice d) async {
    final now = DateTime.now().millisecondsSinceEpoch;

    final parsed = _tryParsePeerFromServiceData(d, now);
    if (parsed != null) {
      await _db.upsertPeer(parsed.copyWith(deviceId: d.id, lastSeen: now));
      debugPrint('[BLE] discovered peer id=${parsed.id} via serviceData');
      unawaited(_recomputeNearbyPeers());
      if (_connectedDeviceId == null) {
        unawaited(connect(d.id));
      }
      return;
    }

    // Manufacturer fingerprint → bind radio id to an already-known keyed peer
    // (QR / prior chat). No OS device name is stored.
    final fp = _parseFingerprintPeerPrefix(d.manufacturerData);
    if (fp != null) {
      final known = await _db.findPeerByIdPrefix(fp);
      if (known != null && known.publicKey.trim().isNotEmpty) {
        await _db.upsertPeer(
          known.copyWith(deviceId: d.id, lastSeen: now),
        );
        debugPrint(
          '[BLE] bound device=${d.id} → peer=${known.id} via fingerprint',
        );
        unawaited(_recomputeNearbyPeers());
        if (_connectedDeviceId == null) {
          unawaited(connect(d.id));
        }
        return;
      }
    }

    // Also try deviceId already linked.
    final byDev = await _db.getPeerByDeviceId(d.id);
    if (byDev != null && byDev.publicKey.trim().isNotEmpty) {
      await _db.upsertPeer(byDev.copyWith(lastSeen: now));
      unawaited(_recomputeNearbyPeers());
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
      debugPrint('[BLE] discovered peer id=${peer.id} via identity characteristic');
      unawaited(_recomputeNearbyPeers());
      if (_connectedDeviceId == null) {
        unawaited(connect(d.id));
      }
    } catch (e) {
      // Expected on iOS phone↔phone: plugin advertises but has no GATT server.
      debugPrint('[BLE] identity read failed device=${d.id}: $e');
    }
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
        geohash: (obj['geo'] as String?)?.trim().toLowerCase(),
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
      geohash: (obj['geo'] as String?)?.trim().toLowerCase(),
      isVerifiedIssuer: false,
      isBlocked: false,
      lastSeen: DateTime.now().millisecondsSinceEpoch,
    );
  }

  void _pruneStaleNearby() {
    final cutoff = DateTime.now().millisecondsSinceEpoch - 60000;
    final stale = _nearbyLastSeenMs.entries
        .where((e) => e.value < cutoff)
        .map((e) => e.key)
        .toList();
    for (final id in stale) {
      _nearby.remove(id);
      _nearbyLastSeenMs.remove(id);
    }
  }

  Future<void> _recomputeNearbyPeers() async {
    // Only messageable (keyed) peers — never list OS names / empty ble: stubs.
    final keyed = await _db.getActivePeers(activeWithinMs: 45000);
    final byId = <String, Peer>{};

    bool prefer(Peer a, Peer b) {
      final score = (Peer p) {
        var s = 0;
        if (p.publicKey.trim().isNotEmpty) s += 20;
        if ((p.deviceId ?? '').trim().isNotEmpty) s += 5;
        if (!p.id.startsWith('ble:')) s += 10;
        return s;
      };
      final sa = score(a);
      final sb = score(b);
      if (sa != sb) return sa > sb;
      return a.lastSeen >= b.lastSeen;
    }

    for (final p in keyed) {
      if (p.publicKey.trim().isEmpty) continue;
      if (p.id.startsWith('ble:')) continue;
      final prev = byId[p.id];
      if (prev == null || prefer(p, prev)) {
        byId[p.id] = p;
      }
    }

    // Live advertisers only bump lastSeen for already-keyed peers (by deviceId).
    final now = DateTime.now().millisecondsSinceEpoch;
    final byDevice = <String, String>{}; // deviceId → peerId
    for (final p in byId.values) {
      final dev = (p.deviceId ?? '').trim();
      if (dev.isNotEmpty) byDevice[dev] = p.id;
    }
    for (final d in _nearby.values) {
      final peerId = byDevice[d.id];
      if (peerId == null) continue;
      final existing = byId[peerId];
      if (existing == null) continue;
      byId[peerId] = existing.copyWith(lastSeen: now);
    }

    final merged = byId.values.toList()
      ..sort((a, b) => b.lastSeen.compareTo(a.lastSeen));

    _nearbyPeers = merged;
    notifyListeners();
    await resilnet?.refreshBlePeerCount(nearbyPeerCount);
    final logNow = DateTime.now();
    if (logNow.difference(_lastNearbyLog) >= const Duration(seconds: 15)) {
      _lastNearbyLog = logNow;
      final unbound = _nearby.length - byDevice.length;
      debugPrint(
        '[BLE] heartbeat nearbyRaw=${_nearby.length} nearbyPeers=${_nearbyPeers.length} '
        'radioOnly=$unbound connected=${_connectedDeviceId != null} advertising=$_advertising',
      );
    }
  }

  /// Anonymous BLE advertisers seen on radio but not yet bound to RSA peer.
  List<AreaPresenceEntry> discoveryPresenceEntries() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final boundDevices = <String>{
      for (final p in _nearbyPeers)
        if ((p.deviceId ?? '').isNotEmpty) p.deviceId!,
    };
    final out = <AreaPresenceEntry>[];
    for (final d in _nearby.values) {
      if (boundDevices.contains(d.id)) continue;
      final prefix = d.id.length >= 4 ? d.id.substring(0, 4) : d.id;
      out.add(
        AreaPresenceEntry(
          id: 'radio:${d.id}',
          label: 'radio·$prefix',
          source: PresenceSource.mesh,
          geohash: null,
          lastSeen: now,
        ),
      );
    }
    out.sort((a, b) => b.lastSeen.compareTo(a.lastSeen));
    return out;
  }

  /// Refresh nearby list after QR import or external lastSeen update.
  Future<void> refreshNearbyPeers() => _recomputeNearbyPeers();

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
    if (_connectedDeviceId == deviceId) return;
    await _connSub?.cancel();
    await _notifySub?.cancel();
    debugPrint('[BLE] connect attempt device=$deviceId');

    _connSub = _ble.connectToDevice(id: deviceId, connectionTimeout: const Duration(seconds: 8)).listen(
      (u) async {
        if (u.connectionState == DeviceConnectionState.connected) {
          _connectedDeviceId = deviceId;
          debugPrint('[BLE] connected device=$deviceId');
          notifyListeners();
          await _subscribeIncoming(deviceId);
        } else if (u.connectionState == DeviceConnectionState.disconnected) {
          debugPrint('[BLE] disconnected device=$deviceId');
          _connectedDeviceId = null;
          notifyListeners();
        }
      },
      onError: (e) {
        debugPrint('[BLE] connect failed device=$deviceId err=$e');
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

  /// บันทึกข้อความที่ผ่าน dedup แล้วจาก Rust router.
  /// Returns false when the envelope was rejected (no persist / no UI).
  Future<bool> applyIncomingFromRouter(ChatMessage msg) async {
    // Legacy village-broadcast product removed — drop quietly (no UI / no crash).
    if (msg.isBroadcast) {
      debugPrint('[BleMesh] drop legacy broadcast id=${msg.id}');
      return false;
    }

    // Geohash presence — update peer cell, never surface as chat.
    // Presence envelopes are intentionally unsigned (mesh UX only).
    if (msg.payloadKind == PayloadKinds.presence) {
      final geo = (msg.content ?? '').trim().toLowerCase();
      if (geo.isNotEmpty) {
        await _db.updatePeerGeohash(msg.senderId, geo);
      }
      notifyListeners();
      return true;
    }

    // Public mesh bulletin — plaintext + self-contained signature.
    // Verified against the embedded senderPk (no prior peer key needed),
    // ingested outside chat history, then relayed one hop while ttl remains.
    if (msg.payloadKind == PayloadKinds.bulletin) {
      final handler = _onBulletinMessage;
      final accepted = handler != null && await handler(msg);
      if (!accepted) return false;
      if (msg.ttl > 0) {
        unawaited(
          sendDirectNow(
            msg.copyWith(ttl: msg.ttl - 1, status: MessageStatus.relayed),
          ),
        );
      }
      notifyListeners();
      return true;
    }

    // Area/mesh notices — bulletin ingest only; never chat history.
    if (msg.payloadKind == PayloadKinds.notice) {
      if (!await _acceptSignedInbound(msg)) {
        return false;
      }
      notifyListeners();
      return true;
    }

    if (!await _acceptSignedInbound(msg)) {
      return false;
    }

    final persist = _shouldPersistHistory();
    if (persist) {
      await _db.saveMessage(msg);
    } else {
      _onEphemeralMessage?.call(msg);
    }

    if (msg.receiverId == myUserId) {
      final now = DateTime.now();
      if (persist) {
        await _db.markMessagesDelivered([msg.id], now);
      }
      if (msg.type == MessageType.direct && msg.senderId != myUserId) {
        await ackQueue?.enqueueDelivered(
          msgId: msg.id,
          targetSenderId: msg.senderId,
          at: now,
        );
      }
    } else if (msg.ttl > 0) {
      final relayed =
          msg.copyWith(ttl: msg.ttl - 1, status: MessageStatus.relayed);
      if (persist) {
        await _db.saveMessage(relayed);
        await _db.updateMessageStatus(msg.id, MessageStatus.relayed.name);
      } else {
        // Store-and-forward without history: one-shot BLE retransmit if linked.
        unawaited(sendDirectNow(relayed));
      }
    } else {
      debugPrint(
        '[BleMesh] drop no-relay ttl=0 id=${msg.id} sender=${msg.senderId} receiver=${msg.receiverId}',
      );
    }
    notifyListeners();
    return true;
  }

  /// Reject chat/control with missing signature, unknown sender, or bad sig.
  Future<bool> _acceptSignedInbound(ChatMessage msg) async {
    final c = crypto;
    if (c == null) {
      debugPrint('[BleMesh] drop id=${msg.id} — no crypto for signature check');
      return false;
    }
    final peer = await _db.getPeer(msg.senderId);
    var pub = peer?.publicKey.trim() ?? '';
    final wirePk = msg.senderPk?.trim() ?? '';

    Future<String?> bootstrapFromWire() async {
      if (msg.receiverId != myUserId || wirePk.isEmpty) return null;
      if (!CryptoService.bindsIdentity(
        rid: msg.senderId,
        publicKeyMaterial: wirePk,
      )) {
        return null;
      }
      try {
        final pem = CryptoService.normalizePublicKey(wirePk);
        await _db.upsertPeer(
          Peer(
            id: msg.senderId,
            publicKey: pem,
            displayName: msg.senderName ?? peer?.displayName,
            isVerifiedIssuer: peer?.isVerifiedIssuer ?? false,
            isBlocked: peer?.isBlocked ?? false,
            lastSeen: DateTime.now().millisecondsSinceEpoch,
          ),
        );
        debugPrint(
          '[BleMesh] bootstrapped sender=${msg.senderId} from wire senderPk',
        );
        return pem;
      } catch (e) {
        debugPrint('[BleMesh] senderPk bootstrap failed: $e');
        return null;
      }
    }

    if (pub.isEmpty) {
      pub = (await bootstrapFromWire()) ?? '';
    }
    if (pub.isEmpty) {
      debugPrint(
        '[BleMesh] drop unknown sender=${msg.senderId} id=${msg.id}',
      );
      return false;
    }

    var ok = c.verifyInboundEnvelope(
      signature: msg.signature,
      senderPublicPem: pub,
      encryptedPayload: msg.encryptedPayload,
      encryptedKey: msg.encryptedKey,
      senderId: msg.senderId,
      receiverId: msg.receiverId,
      timestamp: msg.timestamp,
    );
    // Stale local peer key: refresh from wire senderPk and retry once.
    if (!ok && wirePk.isNotEmpty) {
      final refreshed = await bootstrapFromWire();
      if (refreshed != null && refreshed != pub) {
        ok = c.verifyInboundEnvelope(
          signature: msg.signature,
          senderPublicPem: refreshed,
          encryptedPayload: msg.encryptedPayload,
          encryptedKey: msg.encryptedKey,
          senderId: msg.senderId,
          receiverId: msg.receiverId,
          timestamp: msg.timestamp,
        );
      }
    }
    if (!ok) {
      debugPrint(
        '[BleMesh] drop bad/missing signature id=${msg.id} sender=${msg.senderId}',
      );
    }
    return ok;
  }

  /// Send a sealed message over BLE immediately (no SQLite pending queue).
  Future<void> sendDirectNow(ChatMessage msg) async {
    if (_connectedDeviceId == null) {
      debugPrint('[BleMesh] sendDirectNow skipped — no connection id=${msg.id}');
      return;
    }
    try {
      await _sendBleChunkedMessage(msg);
    } catch (e) {
      debugPrint('[BleMesh] sendDirectNow failed id=${msg.id}: $e');
    }
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

    final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(
      msg,
      payloadType: ResilNetPayloadType.fromMessageKind(msg.payloadKind),
    );
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

import 'dart:async';
import 'dart:convert';

import 'package:ble_peripheral/ble_peripheral.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

import '../core/payload_kinds.dart';
import '../core/platform_caps.dart';
import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../core/resilnet_payload_type.dart';
import '../models/area_presence.dart';
import '../models/ack_entry.dart';
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
///
/// Phone↔phone: GATT peripheral ([ble_peripheral]) accepts writes while
/// advertising; [flutter_reactive_ble] acts as central to fan-out.
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
    void Function(String deviceId)? onLinkReady,
  })  : _db = database,
        _shouldPersistHistory = shouldPersistHistory ?? (() => true),
        _onEphemeralMessage = onEphemeralMessage,
        _onBulletinMessage = onBulletinMessage,
        _onLinkReady = onLinkReady;

  final CryptoService? crypto;
  final ResilNetService? resilnet;
  final AckQueueManager? ackQueue;
  final AckHandlerService? ackHandler;
  final bool Function() _shouldPersistHistory;
  final void Function(ChatMessage message)? _onEphemeralMessage;

  /// Public bulletin ingest (verify + dedupe ทำใน AppState).
  /// คืน true เมื่อ bulletin ผ่านการตรวจและถูกรับเข้า.
  final Future<bool> Function(ChatMessage message)? _onBulletinMessage;

  /// GATT link ready (services + MTU) — AppState uses this for bulletin catch-up.
  final void Function(String deviceId)? _onLinkReady;

  static final serviceUuid = Uuid.parse('9d2f3bb2-3a5a-4f6e-a0c2-9d62c2d4d2a1');
  static final characteristicUuid = Uuid.parse('ef8a0f1a-7b27-46d8-9e2a-7d66c1f1d9b1');
  static final identityCharacteristicUuid = Uuid.parse('f1c3e5aa-3fb3-4c2e-a8bc-9b0c5bd4f1b7');

  static final _serviceUuidStr = serviceUuid.toString();
  static final _meshCharUuidStr = characteristicUuid.toString();
  static final _identityCharUuidStr = identityCharacteristicUuid.toString();

  final DatabaseService _db;
  final String myUserId;
  final _ble = FlutterReactiveBle();
  bool _advertising = false;
  bool _advertiseInFlight = false;
  bool _gattReady = false;
  bool get gattReady => _gattReady;
  bool get isAdvertising => _advertising;
  Future<void>? _gattEnsureInFlight;
  bool _peripheralPoweredOn = false;
  bool _bulletinListenActive = false;
  Timer? _roleTimer;
  Timer? _holdAdvertiseTimer;
  /// Prefer concurrent central+peripheral outside bulletin listen windows.
  final bool _preferConcurrentRadio = true;
  bool _roleAdvertisePhase = true;
  static const _iosScanWindow = Duration(seconds: 3);
  /// Longer advertise so peers can write bulletins while we listen as peripheral.
  static const _iosAdvertiseWindow = Duration(seconds: 7);
  /// Re-assert advertising on Apple — the stack often drops peripheral ADV.
  static const _iosAdvertiseRefresh = Duration(seconds: 7);

  /// Community display name for identity characteristic / presence ads.
  String localDisplayName = '';

  /// Compact RSA public key for identity reads (set by AppState).
  String localPubKeyCompact = '';

  /// Truncated geohash cell for identity reads (optional).
  String? localGeohash;

  StreamSubscription<DiscoveredDevice>? _scanSub;
  StreamSubscription<BleStatus>? _bleStatusSub;
  StreamSubscription<ConnectionStateUpdate>? _connSub;
  StreamSubscription<List<int>>? _notifySub;
  Future<void> _inboundChain = Future.value();
  Timer? _sendTimer;
  Timer? _cleanupTimer;

  final Map<String, DiscoveredDevice> _nearby = {};
  final Map<String, int> _nearbyLastSeenMs = {};
  int get nearbyPeerCount =>
      _nearbyPeers.isNotEmpty ? _nearbyPeers.length : _nearby.length;
  /// Raw BLE advertisers currently in the scan window (may exceed bound peers).
  int get nearbyDeviceCount => _nearby.length;
  /// Live radio ids (CoreBluetooth peripherals) seen in the scan window.
  List<String> get nearbyDeviceIds =>
      _nearby.keys.where((id) => id.trim().isNotEmpty).toList(growable: false);
  List<Peer> _nearbyPeers = const [];
  List<Peer> get nearbyPeers => _nearbyPeers;

  /// Active public bulletins to push via GATT notify when a central subscribes
  /// (phone↔phone catch-up when peer connects to us as central).
  final List<ChatMessage> _recentBulletinNotifyQueue = <ChatMessage>[];
  static const int _maxBulletinNotifyQueue = 32;
  bool _centralSubscribedForNotify = false;
  Future<void>? _notifyFlushInFlight;

  bool _running = false;
  bool get running => _running;

  String? _connectedDeviceId;
  String? get connectedDeviceId => _connectedDeviceId;
  /// Set after GATT service discovery + MTU — safe to write.
  String? _linkReadyDeviceId;
  /// Negotiated ATT MTU per device (default 23 until requestMtu succeeds).
  final Map<String, int> _mtuByDevice = {};
  DateTime _lastNearbyLog = DateTime.fromMillisecondsSinceEpoch(0);

  Future<void> start() async {
    if (_running) return;
    _running = true;
    _wireChunkArqCallbacks();
    debugPrint('[BLE] start scan+mesh requested');
    notifyListeners();

    await _ensureGattServer();

    _bleStatusSub?.cancel();
    _bleStatusSub = _ble.statusStream.listen((status) {
      debugPrint('[BLE] adapter status=$status');
      if (!_running) return;
      if (status == BleStatus.ready) {
        _kickRadioRoles(force: true);
      } else if (status == BleStatus.unsupported ||
          status == BleStatus.unauthorized) {
        debugPrint(
          '[BLE] adapter not usable ($status) — mesh/ESP32 path idle; '
          'Nostr/chat continue',
        );
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
    _bulletinListenActive = false;
    _roleTimer?.cancel();
    _roleTimer = null;
    _holdAdvertiseTimer?.cancel();
    _holdAdvertiseTimer = null;
    await _stopAdvertising();
    try {
      await BlePeripheral.clearServices();
    } catch (_) {}
    _gattReady = false;
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
    _linkReadyDeviceId = null;
    _nearbyPeers = const [];
    notifyListeners();
  }

  /// Stay discoverable + receivable while Notices is open.
  ///
  /// - **macOS**: concurrent ADV+scan (desktop dual-role is usually reliable).
  /// - **iOS**: staggered ADV/scan with a per-device phase offset — Apple phones
  ///   often refuse GATT while also scanning as central.
  Future<void> holdAdvertise({
    Duration duration = const Duration(seconds: 12),
  }) async {
    if (!_running) return;
    _holdAdvertiseTimer?.cancel();
    if (PlatformCaps.isMacOS) {
      _bulletinListenActive = true;
      _roleTimer?.cancel();
      await _ensureGattServer();
      await _startAdvertising();
      _startScanning();
      _roleTimer = Timer.periodic(_iosAdvertiseRefresh, (_) {
        if (!_running || !_bulletinListenActive) return;
        unawaited(_startAdvertising());
      });
      _holdAdvertiseTimer = Timer(duration, () {
        if (!_running) return;
        _bulletinListenActive = false;
        _kickRadioRoles(force: true);
      });
      return;
    }
    if (PlatformCaps.usesIosStyleBle) {
      await _startStaggeredBulletinListen(duration: duration);
    } else {
      await _startAdvertising();
      _startScanning();
    }
  }

  /// Notices sheet open: staggered ADV/scan so both phones can see each other
  /// while remaining receivable most of the time.
  Future<void> enterBulletinListenMode({
    Duration duration = const Duration(seconds: 120),
  }) =>
      holdAdvertise(duration: duration);

  /// Ensure GATT peripheral is set up (advertisable / writable by peers).
  Future<bool> ensureGattReady() async {
    await _ensureGattServer();
    if (!_gattReady) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      await _ensureGattServer();
    }
    return _gattReady;
  }

  Future<void> _startStaggeredBulletinListen({
    required Duration duration,
  }) async {
    _bulletinListenActive = true;
    _roleTimer?.cancel();
    _holdAdvertiseTimer?.cancel();
    await _ensureGattServer();
    // Opposite starting phase from peer when userIds differ — reduces both
    // scanning (invisible) or both advertising (blind) at the same time.
    _roleAdvertisePhase = myUserId.hashCode.isEven;
    final offsetMs = (myUserId.hashCode.abs() % 1800) + 200;
    await Future<void>.delayed(Duration(milliseconds: offsetMs));
    if (!_running || !_bulletinListenActive) return;
    await _applyBulletinListenPhase();
    _scheduleBulletinListenFlip();
    _holdAdvertiseTimer = Timer(duration, () {
      if (!_running) return;
      _bulletinListenActive = false;
      _kickRadioRoles(force: true);
    });
  }

  Future<void> _applyBulletinListenPhase() async {
    if (!_running || !_bulletinListenActive) return;
    if (_roleAdvertisePhase) {
      await _scanSub?.cancel();
      _scanSub = null;
      await _startAdvertising();
      debugPrint('[BLE] bulletin phase=ADV gatt=$_gattReady');
    } else {
      // Brief central pulse to find the peer; ADV resumes on next flip.
      await _stopAdvertising();
      _startScanning();
      debugPrint(
        '[BLE] bulletin phase=SCAN nearbyRaw=${_nearby.length} '
        'gatt=$_gattReady',
      );
    }
  }

  void _scheduleBulletinListenFlip() {
    _roleTimer?.cancel();
    void tick() {
      if (!_running || !_bulletinListenActive) return;
      _roleAdvertisePhase = !_roleAdvertisePhase;
      unawaited(_applyBulletinListenPhase());
      final next =
          _roleAdvertisePhase ? _iosAdvertiseWindow : _iosScanWindow;
      _roleTimer = Timer(next, tick);
    }
    final first =
        _roleAdvertisePhase ? _iosAdvertiseWindow : _iosScanWindow;
    _roleTimer = Timer(first, tick);
  }

  /// Force scan/central mode before outbound fan-out.
  ///
  /// On iPhone: stop advertising and scan hard. On macOS: keep ADV up while
  /// scanning — desktop stacks tolerate dual-role better.
  Future<void> prepareOutboundFanOut({
    Duration settle = const Duration(milliseconds: 2500),
  }) async {
    if (!_running) return;
    _bulletinListenActive = false;
    _holdAdvertiseTimer?.cancel();
    _holdAdvertiseTimer = null;
    if (PlatformCaps.isMacOS) {
      _roleTimer?.cancel();
      _roleTimer = null;
      _startScanning();
      unawaited(_startAdvertising());
      await Future<void>.delayed(settle);
      debugPrint(
        '[BleMesh] prepareOutboundFanOut(mac) nearbyRaw=${_nearby.length} '
        'peers=${_nearbyPeers.length} gatt=$_gattReady adv=$_advertising',
      );
      return;
    }
    if (PlatformCaps.usesIosStyleBle) {
      _roleTimer?.cancel();
      _roleTimer = null;
      _roleAdvertisePhase = false;
      await _stopAdvertising();
      _startScanning();
      await Future<void>.delayed(settle);
      debugPrint(
        '[BleMesh] prepareOutboundFanOut nearbyRaw=${_nearby.length} '
        'peers=${_nearbyPeers.length} gatt=$_gattReady adv=$_advertising',
      );
    } else {
      _startScanning();
      await Future<void>.delayed(settle);
    }
  }

  /// Resume background radio policy after an outbound burst.
  void resumeRadioDutyCycle() {
    if (!_running) return;
    _bulletinListenActive = false;
    _holdAdvertiseTimer?.cancel();
    _holdAdvertiseTimer = null;
    _kickRadioRoles(force: true);
  }

  /// iOS/macOS: prefer concurrent central+peripheral so bulletin receivers stay
  /// connectable while we discover. Legacy flip-flop made phone↔phone miss.
  void _kickRadioRoles({bool force = false}) {
    _roleTimer?.cancel();
    if (PlatformCaps.usesIosStyleBle && !_preferConcurrentRadio) {
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
      if (PlatformCaps.usesIosStyleBle) {
        // Peripheral ADV often dies quietly — refresh periodically.
        _roleTimer = Timer.periodic(_iosAdvertiseRefresh, (_) {
          if (!_running) return;
          unawaited(_startAdvertising());
        });
      }
    }
    if (force) {
      debugPrint(
        '[BLE] roles kicked iosStyle=${PlatformCaps.usesIosStyleBle} '
        'concurrent=$_preferConcurrentRadio gatt=$_gattReady',
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
    if (_preferConcurrentRadio) {
      _startScanning();
      await _startAdvertising();
      return;
    }
    if (_roleAdvertisePhase) {
      await _scanSub?.cancel();
      _scanSub = null;
      await _startAdvertising();
    } else {
      // Legacy: pause ADV while scanning (hurts bulletin receive).
      await _stopAdvertising();
      _startScanning();
    }
  }

  /// Company id 0xFFFF (internal/testing) + magic "RN" + peer-id prefix.
  static const int _mfgCompanyId = 0xFFFF;
  static const int _fingerprintPrefixLen = 8;

  Uint8List _fingerprintPayload() {
    final id = myUserId.trim();
    final take =
        id.length < _fingerprintPrefixLen ? id : id.substring(0, _fingerprintPrefixLen);
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
    final n = d.name.trim().toLowerCase();
    // Darwin ads use localName "ResilNet" (manufacturer fingerprint is ignored).
    return n == 'resilnet' || n.contains('resil');
  }

  bool _uuidEq(String a, String b) => a.toLowerCase() == b.toLowerCase();

  Future<void> _ensureGattServer() async {
    if (_gattReady) return;
    final inflight = _gattEnsureInFlight;
    if (inflight != null) {
      await inflight;
      return;
    }
    final run = _ensureGattServerBody();
    _gattEnsureInFlight = run;
    try {
      await run;
    } finally {
      if (identical(_gattEnsureInFlight, run)) {
        _gattEnsureInFlight = null;
      }
    }
  }

  Future<void> _ensureGattServerBody() async {
    if (_gattReady) return;
    try {
      final supported = await BlePeripheral.isSupported();
      if (!supported) {
        debugPrint('[BLE] GATT peripheral unsupported on this device');
        return;
      }

      try {
        final allowed = await BlePeripheral.askBlePermission();
        debugPrint('[BLE] peripheral permission allowed=$allowed');
        // askBlePermission only *checks* status — do not abort on false:
        // initialize()/CBPeripheralManager still triggers the system prompt
        // when status is notDetermined.
      } catch (e) {
        debugPrint('[BLE] askBlePermission: $e');
      }

      final powered = Completer<void>();
      BlePeripheral.setBleStateChangeCallback((on) {
        _peripheralPoweredOn = on;
        debugPrint('[BLE] peripheral poweredOn=$on');
        if (on && !powered.isCompleted) powered.complete();
        // Retry setup if we previously failed while BT was off.
        if (on && !_gattReady) {
          unawaited(_ensureGattServer());
        }
      });

      await BlePeripheral.initialize();
      // Callback may have been missed if manager was already powered on.
      await Future.any<void>([
        powered.future,
        Future<void>.delayed(const Duration(milliseconds: 1200)),
      ]);

      BlePeripheral.setAdvertisingStatusUpdateCallback((advertising, error) {
        _advertising = advertising;
        if (error != null && error.isNotEmpty) {
          debugPrint('[BLE] advertising status error: $error');
        }
      });
      BlePeripheral.setWriteRequestCallback((deviceId, characteristicId, offset, value) {
        if (!_uuidEq(characteristicId, _meshCharUuidStr)) {
          return WriteRequestResult(status: 0);
        }
        if (value == null || value.isEmpty) {
          return WriteRequestResult(status: 0);
        }
        final bytes = Uint8List.fromList(value);
        debugPrint(
          '[BleMesh] peripheral WRITE from=$deviceId bytes=${bytes.length}',
        );
        _inboundChain = _inboundChain
            .then((_) async {
              try {
                await _handleIncomingBytes(bytes);
              } catch (e) {
                debugPrint('[BleMesh] peripheral write drop: $e');
              }
            })
            .catchError((Object e, StackTrace st) {
              debugPrint('[BleMesh] peripheral inbound chain error: $e');
            });
        return WriteRequestResult(status: 0); // CBATTError.success
      });
      BlePeripheral.setCharacteristicSubscriptionChangeCallback((
        deviceId,
        characteristicId,
        isSubscribed,
        name,
      ) {
        if (!_uuidEq(characteristicId, _meshCharUuidStr)) return;
        _centralSubscribedForNotify = isSubscribed;
        debugPrint(
          '[BleMesh] notify sub device=$deviceId subscribed=$isSubscribed',
        );
        if (isSubscribed) {
          unawaited(_flushBulletinsViaNotify(deviceId: deviceId));
        }
      });
      BlePeripheral.setReadRequestCallback((deviceId, characteristicId, offset, value) {
        if (_uuidEq(characteristicId, _identityCharUuidStr)) {
          final payload = utf8.encode(_identityJson());
          if (offset >= payload.length) {
            return ReadRequestResult(value: Uint8List(0));
          }
          return ReadRequestResult(
            value: Uint8List.fromList(payload.sublist(offset)),
          );
        }
        return ReadRequestResult(value: Uint8List(0));
      });

      Object? lastError;
      for (var attempt = 1; attempt <= 3; attempt++) {
        final added = Completer<void>();
        BlePeripheral.setServiceAddedCallback((serviceId, error) {
          if (added.isCompleted) return;
          if (error != null && error.isNotEmpty) {
            added.completeError(StateError(error));
          } else {
            added.complete();
          }
        });

        try {
          await BlePeripheral.clearServices();
        } catch (_) {}

        try {
          // Do NOT add CCCD 0x2902 manually — CoreBluetooth creates it when
          // notify/indicate is set. Manual CCCD makes addService fail on iOS.
          await BlePeripheral.addService(
            BleService(
              uuid: _serviceUuidStr,
              primary: true,
              characteristics: [
                BleCharacteristic(
                  uuid: _meshCharUuidStr,
                  properties: [
                    CharacteristicProperties.read.index,
                    CharacteristicProperties.write.index,
                    CharacteristicProperties.writeWithoutResponse.index,
                    CharacteristicProperties.notify.index,
                  ],
                  permissions: [
                    AttributePermissions.readable.index,
                    AttributePermissions.writeable.index,
                  ],
                ),
                BleCharacteristic(
                  uuid: _identityCharUuidStr,
                  properties: [CharacteristicProperties.read.index],
                  permissions: [AttributePermissions.readable.index],
                ),
              ],
            ),
          );
          await added.future.timeout(const Duration(seconds: 8));
          _gattReady = true;
          debugPrint(
            '[BLE] GATT peripheral ready uuid=$_serviceUuidStr attempt=$attempt',
          );
          notifyListeners();
          return;
        } catch (e) {
          lastError = e;
          debugPrint('[BLE] addService attempt $attempt failed: $e');
          await Future<void>.delayed(Duration(milliseconds: 400 * attempt));
        }
      }
      _gattReady = false;
      debugPrint('[BLE] GATT peripheral setup failed: $lastError');
      notifyListeners();
    } catch (e) {
      _gattReady = false;
      debugPrint('[BLE] GATT peripheral setup failed: $e');
      notifyListeners();
    }
  }

  String _identityJson() {
    final map = <String, Object?>{
      'id': myUserId,
      'pubKey': localPubKeyCompact.isNotEmpty
          ? localPubKeyCompact
          : (crypto != null
              ? CryptoService.compactPublicKey(crypto!.publicKeyPem)
              : ''),
    };
    final name = localDisplayName.trim();
    if (name.isNotEmpty) map['name'] = name;
    final geo = localGeohash?.trim().toLowerCase();
    if (geo != null && geo.isNotEmpty) map['geo'] = geo;
    return jsonEncode(map);
  }

  /// Advertise connectable ResilNet GATT so nearby phones can write bulletins.
  Future<void> _startAdvertising() async {
    if (_advertiseInFlight) return;
    _advertiseInFlight = true;
    try {
      await _ensureGattServer();
      if (!_gattReady) {
        // One retry after a short delay — common when BT just powered on.
        await Future<void>.delayed(const Duration(milliseconds: 600));
        await _ensureGattServer();
      }
      if (!_gattReady) {
        debugPrint('[BLE] skip advertise — GATT not ready');
        return;
      }
      final fp = _fingerprintPayload();
      final mfg = ManufacturerData(
        manufacturerId: _mfgCompanyId,
        data: fp,
      );
      // Darwin ble_peripheral ignores manufacturerData — localName + service
      // UUID are what nearby iPhones/iPads can actually discover.
      await BlePeripheral.startAdvertising(
        services: [_serviceUuidStr],
        localName: 'ResilNet',
        manufacturerData: mfg,
        addManufacturerDataInScanResponse: !PlatformCaps.usesIosStyleBle,
      );
      await Future<void>.delayed(const Duration(milliseconds: 250));
      final ok = await BlePeripheral.isAdvertising() ?? false;
      _advertising = ok;
      debugPrint(
        '[BLE] advertising isAdvertising=$ok gatt=$_gattReady '
        'uuid=$_serviceUuidStr name=ResilNet',
      );
    } catch (e) {
      _advertising = false;
      debugPrint('[BLE] advertising start failed: $e');
    } finally {
      _advertiseInFlight = false;
    }
  }

  Future<void> _stopAdvertising() async {
    try {
      await BlePeripheral.stopAdvertising();
      if (_advertising) debugPrint('[BLE] advertising stopped');
    } catch (e) {
      debugPrint('[BLE] advertising stop failed: $e');
    } finally {
      _advertising = false;
    }
  }

  void _startScanning() {
    // Unfiltered + client filter: Darwin never sends manufacturerData, but
    // localName "ResilNet" + service UUID (when present) both match here.
    // Service-UUID-only scans miss overflow-area UUIDs on Apple.
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
      if (_connectedDeviceId == null) {
        unawaited(connect(d.id));
      }
      return;
    }

    if (_identityAttempted.contains(d.id)) {
      // Identity already tried — still link for public bulletin catch-up.
      if (_connectedDeviceId == null) {
        unawaited(connect(d.id));
      }
      return;
    }
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
      // Identity may fail while GATT still accepts bulletin writes.
      debugPrint('[BLE] identity read failed device=${d.id}: $e');
      if (_connectedDeviceId == null) {
        unawaited(connect(d.id));
      }
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
    if (_connectedDeviceId == deviceId && _linkReadyDeviceId == deviceId) {
      return;
    }
    await _connSub?.cancel();
    await _notifySub?.cancel();
    _linkReadyDeviceId = null;
    debugPrint('[BLE] connect attempt device=$deviceId');

    _connSub = _ble
        .connectToDevice(
          id: deviceId,
          servicesWithCharacteristicsToDiscover: {
            serviceUuid: [characteristicUuid, identityCharacteristicUuid],
          },
          connectionTimeout: const Duration(seconds: 8),
        )
        .listen(
      (u) async {
        if (u.connectionState == DeviceConnectionState.connected) {
          _connectedDeviceId = deviceId;
          debugPrint('[BLE] connected device=$deviceId');
          notifyListeners();
          try {
            await _ble.discoverAllServices(deviceId);
            final services = await _ble.getDiscoveredServices(deviceId);
            debugPrint(
              '[BLE] discovered services=${services.length} device=$deviceId',
            );
          } catch (e) {
            debugPrint('[BLE] discoverServices failed device=$deviceId: $e');
          }
          await _negotiateMtu(deviceId);
          await _subscribeIncoming(deviceId);
          if (_connectedDeviceId == deviceId) {
            _linkReadyDeviceId = deviceId;
            debugPrint('[BLE] link ready device=$deviceId');
            notifyListeners();
            _onLinkReady?.call(deviceId);
          }
        } else if (u.connectionState == DeviceConnectionState.disconnected) {
          debugPrint('[BLE] disconnected device=$deviceId');
          _connectedDeviceId = null;
          _linkReadyDeviceId = null;
          _mtuByDevice.remove(deviceId);
          notifyListeners();
        }
      },
      onError: (e) {
        debugPrint('[BLE] connect failed device=$deviceId err=$e');
        _connectedDeviceId = null;
        _linkReadyDeviceId = null;
        _mtuByDevice.remove(deviceId);
        notifyListeners();
      },
    );
  }

  Future<void> _negotiateMtu(String deviceId) async {
    try {
      // Without this, ATT writes are capped near 20B and bulletin chunks (~200B) fail.
      final mtu = await _ble.requestMtu(deviceId: deviceId, mtu: 512);
      _mtuByDevice[deviceId] = mtu;
      debugPrint('[BLE] MTU negotiated=$mtu device=$deviceId');
    } catch (e) {
      _mtuByDevice[deviceId] = _mtuByDevice[deviceId] ?? 23;
      debugPrint('[BLE] MTU request failed device=$deviceId: $e');
    }
  }

  Future<void> _subscribeIncoming(String deviceId) async {
    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );
    _notifySub = _ble.subscribeToCharacteristic(c).listen(
      (data) {
        _inboundChain = _inboundChain
            .then((_) async {
              if (data.isEmpty) {
                debugPrint('[BleMesh] drop empty packet from device=$deviceId');
                return;
              }
              try {
                await _handleIncomingBytes(Uint8List.fromList(data));
              } catch (e) {
                debugPrint(
                  '[BleMesh] drop malformed packet from device=$deviceId: $e',
                );
              }
            })
            .catchError((Object e, StackTrace st) {
              debugPrint('[BleMesh] inbound chain error: $e');
            });
      },
      onError: (Object e, StackTrace st) {
        debugPrint('[BleMesh] notify stream error device=$deviceId: $e');
      },
      cancelOnError: false,
    );
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

    // Geohash presence — update peer cell + optional community nick.
    // Presence envelopes are intentionally unsigned (mesh UX only).
    // Content is either a raw geohash or JSON: {"g":"…","n":"nick"}.
    if (msg.payloadKind == PayloadKinds.presence) {
      String? geo;
      String? nick;
      final raw = (msg.content ?? '').trim();
      if (raw.startsWith('{')) {
        try {
          final obj = jsonDecode(raw);
          if (obj is Map) {
            geo = (obj['g'] as String?)?.trim().toLowerCase();
            nick = (obj['n'] as String?)?.trim();
          }
        } catch (_) {}
      } else if (raw.isNotEmpty) {
        geo = raw.toLowerCase();
      }
      nick ??= msg.senderName?.trim();
      if (geo != null && geo.isNotEmpty) {
        await _db.updatePeerGeohash(msg.senderId, geo);
      }
      if (nick != null && nick.isNotEmpty) {
        final existing = await _db.getPeer(msg.senderId);
        if (existing != null) {
          if ((existing.displayName ?? '').trim() != nick) {
            await _db.upsertPeer(existing.copyWith(displayName: nick));
          }
        }
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
          fanOutNow(
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

    // Cache decrypted media plaintext locally so the recipient UI can render
    // without re-decrypting on every chat rebuild (wire still has content=null).
    var inbound = msg;
    if (msg.receiverId == myUserId &&
        (msg.payloadKind == PayloadKinds.image ||
            msg.payloadKind == PayloadKinds.audio)) {
      final c = crypto;
      if (c != null) {
        try {
          final plain = c.decryptFromSender(
            encryptedPayload: msg.encryptedPayload,
            encryptedKey: msg.encryptedKey,
          );
          if (plain.isNotEmpty) {
            inbound = msg.copyWith(content: plain);
          }
        } catch (e) {
          debugPrint(
            '[BleMesh] media decrypt for local cache failed id=${msg.id}: $e',
          );
        }
      }
    }

    final persist = _shouldPersistHistory();
    if (persist) {
      await _db.saveMessage(inbound);
    }

    if (inbound.receiverId == myUserId) {
      final now = DateTime.now();
      if (persist) {
        await _db.markMessagesDelivered([inbound.id], now);
      } else {
        _onEphemeralMessage?.call(
          inbound.copyWith(status: MessageStatus.delivered, deliveredAt: now),
        );
      }
      if (inbound.type == MessageType.direct && inbound.senderId != myUserId) {
        await ackQueue?.enqueueDelivered(
          msgId: inbound.id,
          targetSenderId: inbound.senderId,
          at: now,
        );
      }
    } else {
      if (!persist) {
        _onEphemeralMessage?.call(inbound);
      }
      if (inbound.ttl > 0) {
        final relayed =
            inbound.copyWith(ttl: inbound.ttl - 1, status: MessageStatus.relayed);
        if (persist) {
          await _db.saveMessage(relayed);
          await _db.updateMessageStatus(inbound.id, MessageStatus.relayed.name);
        } else {
          // Store-and-forward without history: one-shot BLE retransmit if linked.
          unawaited(sendDirectNow(relayed));
        }
      } else {
        debugPrint(
          '[BleMesh] drop no-relay ttl=0 id=${inbound.id} sender=${inbound.senderId} receiver=${inbound.receiverId}',
        );
      }
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

  /// Send a sealed/public message over BLE immediately (no SQLite pending queue).
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

  /// Connect (if needed) then send [msg] to a specific BLE peripheral.
  ///
  /// Used for public bulletin fan-out — discovery can list many peers while
  /// only one GATT link is active at a time.
  Future<bool> sendToDevice(
    String deviceId, {
    required ChatMessage msg,
    Duration connectTimeout = const Duration(seconds: 10),
  }) async {
    final id = deviceId.trim();
    if (id.isEmpty) return false;
    try {
      if (_linkReadyDeviceId != id) {
        final ready = Completer<bool>();
        late VoidCallback listener;
        listener = () {
          if (_linkReadyDeviceId == id && !ready.isCompleted) {
            ready.complete(true);
          }
        };
        addListener(listener);
        try {
          await connect(id);
          final ok = await ready.future.timeout(
            connectTimeout,
            onTimeout: () => _linkReadyDeviceId == id,
          );
          if (!ok || _linkReadyDeviceId != id) {
            debugPrint(
              '[BleMesh] sendToDevice connect timeout device=$id id=${msg.id}',
            );
            return false;
          }
        } finally {
          removeListener(listener);
        }
      }
      await _sendBleChunkedMessage(msg);
      return true;
    } catch (e) {
      debugPrint('[BleMesh] sendToDevice failed device=$id id=${msg.id}: $e');
      return false;
    }
  }

  /// Fan-out a public bulletin/presence-style message to every nearby radio
  /// (bound peers + unbound advertisers) plus the current link.
  Future<int> fanOutNow(ChatMessage msg, {Set<String>? alreadySent}) async {
    if (msg.payloadKind == PayloadKinds.bulletin) {
      _queueBulletinForNotify(msg);
    }
    final targets = <String>{};
    for (final p in _nearbyPeers) {
      final d = (p.deviceId ?? '').trim();
      if (d.isNotEmpty) targets.add(d);
    }
    for (final d in _nearby.keys) {
      if (d.trim().isNotEmpty) targets.add(d.trim());
    }
    final current = _connectedDeviceId;
    if (current != null && current.isNotEmpty) targets.add(current);
    if (alreadySent != null) {
      targets.removeWhere(alreadySent.contains);
    }

    if (targets.isEmpty) {
      debugPrint('[BleMesh] fanOutNow skipped — no nearby radios id=${msg.id}');
      // Still try notify: a peer may already be connected to our peripheral.
      return _flushBulletinsViaNotify();
    }

    var sent = 0;
    for (final deviceId in targets) {
      final ok = await sendToDevice(deviceId, msg: msg);
      if (ok) {
        sent++;
        alreadySent?.add(deviceId);
      }
    }
    final notified = await _flushBulletinsViaNotify();
    if (notified > 0 && sent == 0) sent = notified;
    debugPrint(
      '[BleMesh] fanOutNow id=${msg.id} targets=${targets.length} sent=$sent '
      'notify=$notified gatt=$_gattReady',
    );
    return sent;
  }

  void _queueBulletinForNotify(ChatMessage msg) {
    _recentBulletinNotifyQueue.removeWhere((m) => m.id == msg.id);
    _recentBulletinNotifyQueue.add(msg);
    while (_recentBulletinNotifyQueue.length > _maxBulletinNotifyQueue) {
      _recentBulletinNotifyQueue.removeAt(0);
    }
  }

  /// Replace notify catch-up queue with the full set of active mesh bulletins.
  void seedBulletinNotifyQueue(List<ChatMessage> envelopes) {
    _recentBulletinNotifyQueue
      ..clear()
      ..addAll(envelopes.take(_maxBulletinNotifyQueue));
    if (_centralSubscribedForNotify && _recentBulletinNotifyQueue.isNotEmpty) {
      unawaited(_flushBulletinsViaNotify());
    }
  }

  /// Push queued bulletins to subscribed centrals via GATT notify.
  Future<int> _flushBulletinsViaNotify({String? deviceId}) async {
    if (!_gattReady || _recentBulletinNotifyQueue.isEmpty) return 0;
    // Don't claim success when nobody is listening — updateValue is fire-and-forget.
    if (!_centralSubscribedForNotify && deviceId == null) return 0;
    if (_notifyFlushInFlight != null) {
      await _notifyFlushInFlight;
      return 0;
    }
    final done = Completer<void>();
    _notifyFlushInFlight = done.future;
    var pushed = 0;
    try {
      // Snapshot — subscription callback may re-enter.
      final batch = List<ChatMessage>.from(_recentBulletinNotifyQueue);
      for (final msg in batch) {
        final ok = await _notifyBulletinChunks(msg, deviceId: deviceId);
        if (ok) pushed++;
      }
      if (pushed > 0) {
        debugPrint(
          '[BleMesh] notify flush pushed=$pushed '
          'queue=${_recentBulletinNotifyQueue.length} '
          'device=${deviceId ?? 'all'} subscribed=$_centralSubscribedForNotify',
        );
      }
    } catch (e) {
      debugPrint('[BleMesh] notify flush failed: $e');
    } finally {
      done.complete();
      _notifyFlushInFlight = null;
    }
    return pushed;
  }

  Future<bool> _notifyBulletinChunks(
    ChatMessage msg, {
    String? deviceId,
  }) async {
    try {
      final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(
        msg,
        payloadType: ResilNetPayloadType.fromMessageKind(msg.payloadKind),
      );
      // Conservative ATT notify size — iOS rejects oversized updateValue.
      const maxAtt = 180;
      final chunks = ResilNetChunkCodec.encodeChunks(
        ciphertext,
        maxAttPayload: maxAtt,
      );
      for (var i = 0; i < chunks.length; i++) {
        if (i > 0) {
          await Future<void>.delayed(ResilNetChunkCodec.defaultInterChunkDelay);
        }
        await BlePeripheral.updateCharacteristic(
          characteristicId: _meshCharUuidStr,
          value: chunks[i],
          deviceId: deviceId,
        );
      }
      return true;
    } catch (e) {
      debugPrint('[BleMesh] notify bulletin failed id=${msg.id}: $e');
      return false;
    }
  }

  /// Multi-round fan-out for Apple duty/stack flakiness.
  Future<int> fanOutReliable(
    ChatMessage msg, {
    int rounds = 3,
  }) async {
    if (msg.payloadKind == PayloadKinds.bulletin) {
      _queueBulletinForNotify(msg);
    }
    final delivered = <String>{};
    var total = 0;
    for (var i = 0; i < rounds; i++) {
      await prepareOutboundFanOut(
        settle: Duration(milliseconds: 2000 + i * 800),
      );
      final n = await fanOutNow(msg, alreadySent: delivered);
      total += n;
      debugPrint(
        '[BleMesh] fanOutReliable round=${i + 1}/$rounds sent=$n '
        'cumulativeDevices=${delivered.length}',
      );
      if (total > 0 && i >= 1) break;
      if (i + 1 < rounds) {
        await Future<void>.delayed(Duration(milliseconds: 600 + i * 400));
      }
    }
    // Last chance: peer may have subscribed while we were scanning/writing.
    if (total == 0) {
      total += await _flushBulletinsViaNotify();
    }
    return total;
  }

  /// Send a dedicated batched ACK frame over the open BLE link.
  Future<bool> sendAckBatch(BatchAckPacket packet) async {
    final deviceId = _connectedDeviceId;
    if (deviceId == null) {
      debugPrint('[BleMesh] sendAckBatch skipped — no connection');
      return false;
    }
    try {
      final bytes = ResilNetAckCodec.encodeBatchPacket(packet);
      final c = QualifiedCharacteristic(
        serviceId: serviceUuid,
        characteristicId: characteristicUuid,
        deviceId: deviceId,
      );
      await _ble.writeCharacteristicWithResponse(c, value: bytes);
      return true;
    } catch (e) {
      debugPrint('[BleMesh] sendAckBatch failed: $e');
      return false;
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

    if (!_mtuByDevice.containsKey(deviceId) || (_mtuByDevice[deviceId] ?? 0) < 50) {
      await _negotiateMtu(deviceId);
    }

    final c = QualifiedCharacteristic(
      serviceId: serviceUuid,
      characteristicId: characteristicUuid,
      deviceId: deviceId,
    );

    final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(
      msg,
      payloadType: ResilNetPayloadType.fromMessageKind(msg.payloadKind),
    );
    // ATT payload ≈ MTU − 3 (opcode + handle). Stay conservative.
    final mtu = _mtuByDevice[deviceId] ?? 23;
    final maxAtt = (mtu - 3).clamp(20, 512);
    final chunks = ResilNetChunkCodec.encodeChunks(
      ciphertext,
      maxAttPayload: maxAtt,
    );
    debugPrint(
      '[BleMesh] send id=${msg.id} kind=${msg.payloadKind} '
      'cipher=${ciphertext.length}B chunks=${chunks.length} mtu=$mtu att=$maxAtt',
    );
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
      final frame = chunks[i];
      if (frame.length > maxAtt) {
        throw StateError(
          'chunk $i len=${frame.length} exceeds ATT max=$maxAtt (mtu=$mtu)',
        );
      }
      try {
        await _ble.writeCharacteristicWithResponse(c, value: frame);
      } catch (e) {
        // Retry once with write-without-response after a tiny MTU fallback.
        debugPrint('[BleMesh] writeWithResponse failed chunk=$i: $e — retry WWR');
        await _ble.writeCharacteristicWithoutResponse(c, value: frame);
      }
    }
  }
}

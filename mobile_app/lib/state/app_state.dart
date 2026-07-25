import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/resilnet_protocol.dart';
import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../models/ack_entry.dart';
import '../models/chat_message.dart';
import '../services/ack_handler_service.dart';
import '../services/ack_queue_manager.dart';
import '../services/ble_mesh_service.dart';
import '../services/crypto_service.dart';
import '../services/database_service.dart';
import '../services/esp32_sync_service.dart';
import '../services/firmware_service.dart';
import '../services/notification_service.dart';
import '../services/nostr_sync_service.dart';
import '../services/resilnet_packet_codec.dart';
import '../services/resilnet_service.dart';
import '../services/udp_transport_service.dart';
import '../src/rust/api/dto.dart';

class AppState extends ChangeNotifier {
  final crypto = CryptoService();
  final db = DatabaseService();
  final resilnet = ResilNetService();
  final _storage = const FlutterSecureStorage();
  final notifications = NotificationService();

  BleMeshService? _mesh;
  Esp32SyncService? _esp32;
  UdpTransportService? _udp;
  NostrSyncService? _nostr;
  FirmwareService? _firmware;
  late final AckHandlerService _ackHandler;
  AckQueueManager? _ackQueue;
  StreamSubscription<MessagePacketDto>? _rustIncomingSub;
  AppLifecycleState _lifecycleState = AppLifecycleState.resumed;

  AppLifecycleState get lifecycleState => _lifecycleState;

  FirmwareService get firmware {
    final f = _firmware;
    if (f == null) throw StateError('FirmwareService not initialized');
    return f;
  }

  BleMeshService get mesh {
    final m = _mesh;
    if (m == null) throw StateError('Mesh not initialized');
    return m;
  }

  AckHandlerService get ackHandler => _ackHandler;

  AckQueueManager? get ackQueue => _ackQueue;

  Esp32SyncService get esp32 {
    final e = _esp32;
    if (e == null) throw StateError('Esp32Sync not initialized');
    return e;
  }

  UdpTransportService? get udp => _udp;
  bool get isGatewayWifiActive => resilnet.isGatewayWifiActive;
  ChunkTransferState? get chunkTransferState => _udp?.transferState;

  NostrSyncService get nostr {
    final n = _nostr;
    if (n == null) throw StateError('NostrSync not initialized');
    return n;
  }

  /// Compatibility: online = Nostr relays connected or device has internet
  bool get isCloudOnline =>
      (_nostr?.isOnline ?? false) || resilnet.isInternetAvailable;

  bool _initDone = false;
  bool get initDone => _initDone;

  String? _initError;
  String? get initError => _initError;

  bool _permissionsGranted = false;
  bool get permissionsGranted => _permissionsGranted;

  bool _radioPaused = false;
  bool get radioPaused => _radioPaused;

  bool get myUserIdReady {
    try {
      crypto.myUserId;
      return true;
    } catch (_) {
      return false;
    }
  }

  String get myUserId => crypto.myUserId;
  String get myPublicKeyPem => crypto.publicKeyPem;

  static const _kDisplayName = 'resilnet_display_name';
  static const _legacyDefaultDisplayName = 'ชาวบ้านปู่คำ';

  static bool isLegacyDefaultDisplayName(String name) =>
      name.trim() == _legacyDefaultDisplayName;

  static String effectiveDisplayName(String name) =>
      isLegacyDefaultDisplayName(name) ? '' : name.trim();

  String _displayName = '';
  String get displayName => effectiveDisplayName(_displayName);

  static const _kNotificationsEnabled = 'resilnet_notifications_enabled';
  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  static const _kOnboardingDone = 'resilnet_onboarding_done';
  bool _onboardingCompleted = false;
  bool get onboardingCompleted => _onboardingCompleted;

  bool get isReady =>
      _mesh != null &&
      _esp32 != null &&
      _nostr != null &&
      _firmware != null;

  /// สถานะรวมของระบบซิงก์ (BLE + Nostr)
  SyncPhase get syncPhase {
    final e = _esp32;
    final n = _nostr;
    if (e == null || n == null) return SyncPhase.idle;
    if (_radioPaused) return SyncPhase.idle;
    if (e.phase == SyncPhase.syncing) return SyncPhase.syncing;
    if (n.phase == SyncPhase.cloudSync) return SyncPhase.cloudSync;
    if (e.phase == SyncPhase.scanning) return SyncPhase.scanning;
    return SyncPhase.idle;
  }

  void markInitFailed(String message) {
    _initError = message;
    _initDone = true;
    notifyListeners();
  }

  Future<void> retryInit() async {
    _initDone = false;
    _initError = null;
    notifyListeners();
    try {
      await init();
    } catch (e, st) {
      debugPrint('[ResilNet] retryInit failed: $e\n$st');
      markInitFailed(e.toString());
    }
  }

  Future<void> init() async {
    _initError = null;
    try {
      await db.init();
      await crypto.init();

      // เริ่ม Rust Hybrid Router ผ่าน FFI
      await resilnet.initialize();
      await resilnet.subscribeIncoming();
      await _attachRustIncomingHandler();

      _ackHandler = AckHandlerService(
        database: db,
        myUserId: crypto.myUserId,
      );
      _ackHandler.addListener(notifyListeners);

      _ackQueue = AckQueueManager(
        database: db,
        myUserId: crypto.myUserId,
        isHighSpeedTransport: () =>
            resilnet.isInternetAvailable || resilnet.isGatewayWifiActive,
        sendAckBatch: _sendAckBatch,
      );
      await _ackQueue!.restoreFromDatabase();
      _ackQueue!.addListener(notifyListeners);

      resilnet.addListener(() {
        if (resilnet.isInternetAvailable || resilnet.isGatewayWifiActive) {
          _ackQueue?.onTransportUpgraded();
          unawaited(_nostr?.flushOfflineQueue());
        }
      });

      await notifications.init();
      unawaited(notifications.requestPermissions());

      _mesh = BleMeshService(
        database: db,
        myUserId: crypto.myUserId,
        resilnet: resilnet,
        ackQueue: _ackQueue,
        ackHandler: _ackHandler,
      );
      _esp32 = Esp32SyncService(database: db);
      _udp = UdpTransportService(database: db, resilnet: resilnet);
      resilnet.attachUdpTransport(_udp!, crypto: crypto);
      _firmware = FirmwareService();
      await _firmware!.refreshLocalInfo();

      _nostr = NostrSyncService();
      try {
        await _nostr!.start();
      } catch (e, st) {
        debugPrint('[ResilNet] Nostr start failed (offline ok): $e\n$st');
      }

      _esp32!.addListener(notifyListeners);
      _udp!.addListener(notifyListeners);
      _nostr!.addListener(notifyListeners);
      _mesh!.addListener(notifyListeners);

      resilnet.startNetworkMonitoring(blePeerCount: () => _mesh?.nearbyPeerCount ?? 0);
      resilnet.addListener(() {
        if (resilnet.isInternetAvailable) {
          unawaited(_nostr?.flushOfflineQueue());
          unawaited(_nostr?.reconnect());
        }
        notifyListeners();
      });

      final storedName = await _storage.read(key: _kDisplayName);
      if (storedName != null) {
        final trimmed = storedName.trim();
        if (isLegacyDefaultDisplayName(trimmed)) {
          await _storage.delete(key: _kDisplayName);
        } else if (trimmed.isNotEmpty) {
          _displayName = trimmed;
        }
      }
      final prefs = await SharedPreferences.getInstance();
      _notificationsEnabled = prefs.getBool(_kNotificationsEnabled) ?? true;
      _onboardingCompleted = prefs.getBool(_kOnboardingDone) ?? false;

      // ตรวจสิทธิ์ที่มีอยู่แล้ว (ไม่ขึ้น dialog) แล้วค่อยสตาร์ท radio
      _permissionsGranted = await _hasAllRequiredPermissions();
      if (_permissionsGranted) {
        unawaited(_startRadios());
      }
    } finally {
      _initDone = true;
      notifyListeners();
    }
  }

  Future<void> setDisplayName(String v) async {
    final next = effectiveDisplayName(v);
    _displayName = next;
    if (next.isEmpty) {
      await _storage.delete(key: _kDisplayName);
    } else {
      await _storage.write(key: _kDisplayName, value: next);
    }
    notifyListeners();
  }

  /// เรียกจาก `WidgetsBindingObserver` เมื่อสถานะแอปเปลี่ยน
  void handleAppLifecycleState(AppLifecycleState state) {
    _lifecycleState = state;
    if (state == AppLifecycleState.resumed) {
      unawaited(onAppResumed());
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      unawaited(_ackQueue?.persistToDatabase());
    }
  }

  /// กลับมาจาก background — reconnect BLE, Nostr และ Rust stream
  Future<void> onAppResumed() async {
    if (!isReady) return;
    debugPrint('[ResilNet] onAppResumed — reconnecting services');

    try {
      await resilnet.reconnectIncomingBridge();
      await _attachRustIncomingHandler();
    } catch (e, st) {
      debugPrint('[ResilNet] Rust stream reconnect failed: $e\n$st');
    }

    try {
      await resilnet.refreshNetworkStatus(
        blePeerCount: () => _mesh?.nearbyPeerCount ?? 0,
      );
    } catch (e) {
      debugPrint('[ResilNet] network status refresh failed: $e');
    }

    try {
      await _udp?.refresh();
    } catch (e) {
      debugPrint('[ResilNet] UDP refresh failed: $e');
    }

    if (_permissionsGranted && !_radioPaused) {
      try {
        await _reconnectRadios();
      } catch (e) {
        debugPrint('[ResilNet] radio reconnect failed: $e');
      }
    }

    try {
      await _reconnectNostr();
      unawaited(_nostr?.flushOfflineQueue());
    } catch (e) {
      debugPrint('[ResilNet] Nostr reconnect failed: $e');
    }

    notifyListeners();
  }

  Future<void> _attachRustIncomingHandler() async {
    await _rustIncomingSub?.cancel();
    _rustIncomingSub = resilnet.incomingMessages.listen(
      (dto) => unawaited(_onRustIncomingMessage(dto)),
      onError: (e, st) =>
          debugPrint('[ResilNet] incoming handler error: $e\n$st'),
      onDone: () {
        debugPrint('[ResilNet] incoming handler stream done — re-attaching');
        _rustIncomingSub = null;
        unawaited(_attachRustIncomingHandler());
      },
    );
  }

  Future<void> _reconnectRadios() async {
    await _stopRadios();
    await _startRadios();
  }

  Future<void> _reconnectNostr() async {
    final sync = _nostr;
    if (sync == null) return;
    await sync.reconnect();
    await sync.flushOfflineQueue();
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    _notificationsEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kNotificationsEnabled, enabled);
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    _onboardingCompleted = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardingDone, true);
    notifyListeners();
  }

  /// ล้างข้อความทั้งหมดในเครื่อง แล้วคืนพื้นที่ดิสก์ด้วย VACUUM
  Future<int> clearAllMessages() async {
    final deleted = await db.clearAllMessages();
    debugPrint('[ResilNet] clearAllMessages: deleted $deleted local rows');
    notifyListeners();
    return deleted;
  }

  /// ส่งข้อความออกผ่าน Rust Hybrid Router แล้ว fan-out ตาม transports
  Future<RoutedPacketDto> routeOutbound(ChatMessage msg) async {
    final piggyback =
        _ackQueue?.drainPiggybackFor(msg.receiverId) ?? const <AckEntry>[];
    final dto = ResilNetPacketCodec.toDto(msg, piggybackAcks: piggyback);
    final routed = await resilnet.routeMessage(
      id: dto.id,
      sender: dto.sender,
      receiver: dto.receiver,
      payload: dto.payload,
      timestampMs: dto.timestamp.toInt(),
      ttl: dto.ttl,
      payloadTag: dto.payloadTag,
    );

    final transports = routed.transports.isNotEmpty
        ? routed.transports
        : <TransportTypeDto>[routed.transport];

    var markedSent = false;
    for (final transport in transports) {
      switch (transport) {
        case TransportTypeDto.nostr:
          final ok = await _publishOutboundViaNostr(routed.packet);
          if (ok) {
            await db.saveMessage(
              msg.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.sent,
                isSyncedWithCloud: true,
              ),
            );
            markedSent = true;
          } else {
            await db.saveMessage(
              msg.copyWith(status: MessageStatus.pending),
            );
          }
        case TransportTypeDto.bluetoothMesh:
        case TransportTypeDto.loRa:
          await db.saveMessage(
            msg.copyWith(
              ttl: routed.packet.ttl,
              status: markedSent ? MessageStatus.sent : MessageStatus.pending,
            ),
          );
          if (resilnet.isGatewayWifiActive) {
            unawaited(_udp?.pumpSendQueue());
          }
        case TransportTypeDto.offlineQueue:
          await db.saveMessage(msg.copyWith(status: MessageStatus.pending));
          if (resilnet.isGatewayWifiActive) {
            unawaited(_udp?.pumpSendQueue());
          }
      }
    }

    notifyListeners();
    return routed;
  }

  Future<bool> _publishOutboundViaNostr(MessagePacketDto packet) async {
    final sync = _nostr;
    if (sync == null || !sync.running) {
      debugPrint('[ResilNet] Nostr unavailable — keep pending id=${packet.id}');
      return false;
    }
    try {
      return await sync.publishPacket(packet);
    } catch (e, st) {
      debugPrint('[ResilNet] Nostr publish failed id=${packet.id}: $e\n$st');
      return false;
    }
  }

  /// รับข้อความจาก Rust stream หลัง dedup แล้วบันทึกลง DB + อัปเดต UI
  Future<void> _onRustIncomingMessage(MessagePacketDto dto) async {
    try {
      if (dto.payloadTag == PayloadTagDto.ack) {
        final batch = ResilNetAckCodec.decodeBatchPacket(dto.payload);
        if (batch != null) {
          await _ackHandler.handleBatchPacket(batch);
        }
        notifyListeners();
        return;
      }

      final meta = ResilNetPacketCodec.fromDtoWithMeta(dto);
      if (meta.piggybackAcks.isNotEmpty) {
        await _ackHandler.handlePiggybacked(
          meta.piggybackAcks,
          envelopeSenderId: dto.sender,
        );
      }

      final msg = meta.message;
      if (msg == null) return;

      await mesh.applyIncomingFromRouter(msg);
      notifyListeners();
    } catch (e, st) {
      debugPrint('[ResilNet] _onRustIncomingMessage failed: $e\n$st');
    }
  }

  /// มาร์กข้อความที่ยังไม่อ่านในบทสนทนา แล้วคิว READ ACK
  Future<void> markConversationRead(String peerId) async {
    final unread = await db.getUnreadIncomingMessages(myUserId, peerId);
    if (unread.isEmpty) return;
    final now = DateTime.now();
    for (final m in unread) {
      await db.markMessagesRead([m.id], now);
      await _ackQueue?.enqueueRead(
        msgId: m.id,
        targetSenderId: m.senderId,
        at: now,
      );
    }
    notifyListeners();
  }

  Future<bool> _sendAckBatch(BatchAckPacket packet) async {
    final queue = _ackQueue;
    if (queue == null) return false;
    final dto = ResilNetPacketCodec.ackDto(
      packetId: queue.newAckPacketId(),
      senderId: crypto.myUserId,
      receiverId: packet.receiverId,
      batch: packet,
    );
    final routed = await resilnet.routeMessage(
      id: dto.id,
      sender: dto.sender,
      receiver: dto.receiver,
      payload: dto.payload,
      timestampMs: dto.timestamp.toInt(),
      ttl: dto.ttl,
      payloadTag: PayloadTagDto.ack,
    );
    final ts = routed.transports.isNotEmpty ? routed.transports : [routed.transport];
    return !ts.every((t) => t == TransportTypeDto.offlineQueue);
  }

  Future<void> refreshPermissions() async {
    if (!isReady) return;
    _permissionsGranted = await _hasAllRequiredPermissions();
    if (_permissionsGranted && !_radioPaused) {
      unawaited(_startRadios());
    } else if (!_permissionsGranted) {
      await _stopRadios();
    }
    notifyListeners();
  }

  Future<bool> requestPermissions() async {
    if (!isReady) return false;
    final needed = await _requiredPermissions();
    debugPrint(
      '[ResilNet] requestPermissions: asking ${needed.map((p) => p.toString()).join(', ')}',
    );
    final result = await needed.request();
    for (final entry in result.entries) {
      debugPrint('[ResilNet] permission ${entry.key} => ${entry.value}');
    }
    _permissionsGranted = result.values.every(
      (s) => s.isGranted || s.isLimited,
    );
    debugPrint('[ResilNet] permissionsGranted=$_permissionsGranted');
    if (_permissionsGranted && !_radioPaused) {
      unawaited(_startRadios());
    }
    notifyListeners();
    return _permissionsGranted;
  }

  /// หยุด BLE ชั่วคราวตอนเปิดกล้อง (กันชน radio / UI ค้างบน iOS)
  Future<void> pauseRadiosForCamera() async {
    if (_radioPaused) return;
    _radioPaused = true;
    notifyListeners();
    try {
      await _stopRadios();
    } catch (e) {
      debugPrint('[ResilNet] pauseRadiosForCamera: $e');
    }
  }

  /// กลับมาสแกน BLE หลังปิดกล้อง
  Future<void> resumeRadiosAfterCamera() async {
    if (!_radioPaused) return;
    _radioPaused = false;
    notifyListeners();
    if (_permissionsGranted && isReady) {
      unawaited(_startRadios());
    }
  }

  Future<void> _startRadios() async {
    if (!isReady || _radioPaused) return;
    try {
      await mesh.start();
    } catch (e) {
      debugPrint('[ResilNet] mesh.start failed: $e');
    }
    try {
      await esp32.startBackgroundScan();
    } catch (e) {
      debugPrint('[ResilNet] esp32.start failed: $e');
    }
    try {
      await _udp?.start();
    } catch (e) {
      debugPrint('[ResilNet] udp.start failed: $e');
    }
    try {
      await _nostr?.reconnect();
    } catch (e) {
      debugPrint('[ResilNet] nostr.reconnect failed: $e');
    }
  }

  Future<void> _stopRadios() async {
    try {
      await _mesh?.stop();
    } catch (_) {}
    try {
      await _esp32?.stop();
    } catch (_) {}
    try {
      await _udp?.stop();
    } catch (_) {}
    try {
      await _nostr?.stop();
    } catch (_) {}
  }

  Future<bool> _hasAllRequiredPermissions() async {
    final needed = await _requiredPermissions();
    for (final p in needed) {
      final status = await p.status;
      debugPrint('[ResilNet] check $p => $status');
      // iOS bluetooth บางเวอร์ชันคืน limited/restricted ตอนยังไม่เคยขอ
      if (!(status.isGranted || status.isLimited)) return false;
    }
    return true;
  }

  Future<List<Permission>> _requiredPermissions() async {
    // iOS: only Permission.bluetooth (CoreBluetooth) is handled by permission_handler.
    if (Platform.isIOS) {
      return <Permission>[Permission.bluetooth, Permission.locationWhenInUse];
    }
    return <Permission>[
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.bluetoothAdvertise,
      Permission.locationWhenInUse,
    ];
  }

  @override
  void dispose() {
    _rustIncomingSub?.cancel();
    _ackQueue?.dispose();
    _udp?.dispose();
    resilnet.dispose();
    super.dispose();
  }
}

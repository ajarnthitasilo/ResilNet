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
import '../core/geohash.dart';
import '../models/ack_entry.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../services/ack_handler_service.dart';
import '../services/ack_queue_manager.dart';
import '../services/ble_mesh_service.dart';
import '../services/crypto_service.dart';
import '../services/database_service.dart';
import '../services/esp32_sync_service.dart';
import '../services/firmware_service.dart';
import '../services/geo_service.dart';
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

  /// When false (ephemeral mode), sealed payloads are not written to SQLite.
  static const _kSaveMessageHistory = 'resilnet_save_message_history';
  bool _saveMessageHistory = true;
  bool get saveMessageHistory => _saveMessageHistory;

  /// In-memory sealed envelopes for the current process only (ephemeral UI).
  final List<ChatMessage> _sessionMessages = <ChatMessage>[];

  static const _kOnboardingDone = 'resilnet_onboarding_done';
  bool _onboardingCompleted = false;
  bool get onboardingCompleted => _onboardingCompleted;

  /// `null` = follow device locale; otherwise an explicit `en` / `th` override.
  static const _kLocaleOverride = 'resilnet_locale_override';
  String? _localeOverrideCode;
  String? get localeOverrideCode => _localeOverrideCode;

  Locale? get localeOverride {
    final code = _localeOverrideCode;
    if (code == null || code.isEmpty || code == 'system') return null;
    return Locale(code);
  }

  static const _kFeedChannel = 'resilnet_feed_channel';
  static const _kGeoPrecision = 'resilnet_geo_precision';

  FeedChannel _feedChannel = FeedChannel.directs;
  FeedChannel get feedChannel => _feedChannel;

  GeoPrecision _geoPrecision = GeoPrecision.neighborhood;
  GeoPrecision get geoPrecision => _geoPrecision;

  String? _currentGeohash;
  String? get currentGeohash => _currentGeohash;
  bool _geoRefreshing = false;
  bool get geoRefreshing => _geoRefreshing;
  bool _geoNeedsPermission = false;
  bool get geoNeedsPermission => _geoNeedsPermission;
  String? _geoError;
  String? get geoError => _geoError;

  /// IRC-style label for the active geo channel (empty when unknown).
  String get geoChannelLabel {
    final h = _currentGeohash;
    if (h == null || h.isEmpty) return Geohash.channelLabel('');
    return Geohash.channelLabel(Geohash.atPrecision(h, _geoPrecision));
  }

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
        shouldPersistHistory: () => _saveMessageHistory,
        onEphemeralMessage: _rememberSessionMessage,
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
      _saveMessageHistory = prefs.getBool(_kSaveMessageHistory) ?? true;
      _onboardingCompleted = prefs.getBool(_kOnboardingDone) ?? false;
      final loc = prefs.getString(_kLocaleOverride);
      _localeOverrideCode =
          (loc == null || loc.isEmpty || loc == 'system') ? null : loc;
      _feedChannel = FeedChannel.values.firstWhere(
        (e) => e.name == prefs.getString(_kFeedChannel),
        orElse: () => FeedChannel.directs,
      );
      _geoPrecision = GeoPrecision.values.firstWhere(
        (e) => e.name == prefs.getString(_kGeoPrecision),
        orElse: () => GeoPrecision.neighborhood,
      );

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

  Future<void> setSaveMessageHistory(bool enabled) async {
    _saveMessageHistory = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kSaveMessageHistory, enabled);
    if (!enabled) {
      // Leaving messages already on disk alone; new traffic stays ephemeral.
      debugPrint('[ResilNet] message history persistence disabled (ephemeral)');
    }
    notifyListeners();
  }

  void _rememberSessionMessage(ChatMessage msg) {
    if (_saveMessageHistory) return;
    final i = _sessionMessages.indexWhere((m) => m.id == msg.id);
    if (i >= 0) {
      _sessionMessages[i] = msg;
    } else {
      _sessionMessages.add(msg);
      if (_sessionMessages.length > 200) {
        _sessionMessages.removeRange(0, _sessionMessages.length - 200);
      }
    }
  }

  /// Conversation view: SQLite history (if enabled) + sealed session-only envelopes.
  Future<List<ChatMessage>> messagesForConversation(
    String a,
    String b,
  ) async {
    final persisted = _saveMessageHistory
        ? await db.getConversation(a, b)
        : const <ChatMessage>[];
    final session = _sessionMessages.where((m) {
      return (m.senderId == a && m.receiverId == b) ||
          (m.senderId == b && m.receiverId == a);
    });
    final byId = <String, ChatMessage>{
      for (final m in persisted) m.id: m,
      for (final m in session) m.id: m,
    };
    final items = byId.values.toList()
      ..sort((x, y) => x.timestamp.compareTo(y.timestamp));
    return items;
  }

  /// Peer IDs for the home chat list (disk + ephemeral session).
  Future<List<String>> chatPeerIds() async {
    final fromDb =
        _saveMessageHistory ? await db.getChatPeersFor(myUserId) : <String>[];
    final fromSession = <String>{};
    for (final m in _sessionMessages) {
      if (m.senderId == myUserId) {
        fromSession.add(m.receiverId);
      } else if (m.receiverId == myUserId) {
        fromSession.add(m.senderId);
      }
    }
    final merged = <String>{...fromDb, ...fromSession};
    return merged.toList();
  }

  /// Persist sealed chat envelope only when history saving is enabled.
  Future<void> persistChatMessage(ChatMessage msg) async {
    if (_saveMessageHistory) {
      await db.saveMessage(msg);
    } else {
      _rememberSessionMessage(msg);
    }
  }

  Future<void> completeOnboarding() async {
    _onboardingCompleted = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardingDone, true);
    notifyListeners();
  }

  /// Persist language override. Pass `null` to follow the device locale.
  Future<void> setLocaleOverride(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      _localeOverrideCode = null;
      await prefs.setString(_kLocaleOverride, 'system');
    } else {
      _localeOverrideCode = locale.languageCode;
      await prefs.setString(_kLocaleOverride, locale.languageCode);
    }
    notifyListeners();
  }

  Future<void> setFeedChannel(FeedChannel channel) async {
    if (_feedChannel == channel) return;
    _feedChannel = channel;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kFeedChannel, channel.name);
    if (channel == FeedChannel.geo &&
        (_currentGeohash == null || _currentGeohash!.isEmpty)) {
      unawaited(refreshGeohash());
    }
    notifyListeners();
  }

  Future<void> setGeoPrecision(GeoPrecision precision) async {
    if (_geoPrecision == precision) return;
    _geoPrecision = precision;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kGeoPrecision, precision.name);
    notifyListeners();
  }

  /// Resolve device location → geohash for the geo channel label.
  /// Location stays on-device; it is not stamped onto Nostr/mesh ciphertext.
  Future<void> refreshGeohash() async {
    if (_geoRefreshing) return;
    _geoRefreshing = true;
    _geoError = null;
    _geoNeedsPermission = false;
    notifyListeners();
    try {
      final pos = await GeoService.getCurrentPosition();
      if (pos == null) {
        _geoNeedsPermission = true;
        _currentGeohash = null;
      } else {
        _currentGeohash = Geohash.encode(
          pos.latitude,
          pos.longitude,
          precision: GeoPrecision.block.length,
        );
      }
    } catch (e) {
      _geoError = e.toString();
      debugPrint('[ResilNet] refreshGeohash failed: $e');
    } finally {
      _geoRefreshing = false;
      notifyListeners();
    }
  }

  /// ล้างข้อความทั้งหมดในเครื่อง แล้วคืนพื้นที่ดิสก์ด้วย VACUUM
  Future<int> clearAllMessages() async {
    final deleted = await db.clearAllMessages();
    debugPrint('[ResilNet] clearAllMessages: deleted $deleted local rows');
    notifyListeners();
    return deleted;
  }

  /// ส่งข้อความออกผ่าน Rust Hybrid Router แล้ว fan-out ตาม transports
  ///
  /// Privacy: [msg] must already be sealed (RSA-OAEP + AES-GCM). The router and
  /// transports only see opaque bytes — plaintext must not be persisted in [msg.content].
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
            await persistChatMessage(
              msg.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.sent,
                isSyncedWithCloud: true,
              ),
            );
            markedSent = true;
          } else if (_saveMessageHistory) {
            // Offline retry needs a pending row; ephemeral mode skips disk.
            await db.saveMessage(msg.copyWith(status: MessageStatus.pending));
          } else {
            await persistChatMessage(
              msg.copyWith(status: MessageStatus.pending),
            );
          }
        case TransportTypeDto.bluetoothMesh:
        case TransportTypeDto.loRa:
          final outgoing = msg.copyWith(
            ttl: routed.packet.ttl,
            status: markedSent ? MessageStatus.sent : MessageStatus.pending,
          );
          if (_saveMessageHistory) {
            await db.saveMessage(outgoing);
            if (resilnet.isGatewayWifiActive) {
              unawaited(_udp?.pumpSendQueue());
            }
          } else {
            await persistChatMessage(
              outgoing.copyWith(status: MessageStatus.sent),
            );
            // Fan-out without SQLite queue — send sealed bytes immediately.
            unawaited(_mesh?.sendDirectNow(outgoing));
            if (resilnet.isGatewayWifiActive) {
              unawaited(_udp?.sendDirectNow(outgoing));
            }
          }
        case TransportTypeDto.offlineQueue:
          if (_saveMessageHistory) {
            await db.saveMessage(msg.copyWith(status: MessageStatus.pending));
            if (resilnet.isGatewayWifiActive) {
              unawaited(_udp?.pumpSendQueue());
            }
          } else {
            // Rust offline queue still holds opaque bytes; no SQLite history.
            await persistChatMessage(
              msg.copyWith(status: MessageStatus.pending),
            );
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

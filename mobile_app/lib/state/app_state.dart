import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../core/resilnet_protocol.dart';
import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../core/geohash.dart';
import '../core/payload_kinds.dart';
import '../models/area_presence.dart';
import '../models/ble_radio_state.dart';
import '../models/ack_entry.dart';
import '../models/announcement_board.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../models/geo_discovery.dart';
import '../models/local_notice.dart';
import '../models/mesh_retention.dart';
import '../models/notice_expiry.dart';
import '../models/peer.dart';
import '../models/transport_mode.dart';
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
import '../services/secure_storage.dart';
import '../services/screenshot_watch_service.dart';
import '../services/udp_transport_service.dart';
import '../src/rust/api/dto.dart';

class AppState extends ChangeNotifier {
  final crypto = CryptoService();
  final db = DatabaseService();
  final resilnet = ResilNetService();
  final _storage = resilnetSecureStorage;
  final notifications = NotificationService();
  final screenshots = ScreenshotWatchService();

  BleMeshService? _mesh;
  Esp32SyncService? _esp32;
  UdpTransportService? _udp;
  NostrSyncService? _nostr;
  FirmwareService? _firmware;
  late AckHandlerService _ackHandler;
  AckQueueManager? _ackQueue;
  StreamSubscription<MessagePacketDto>? _rustIncomingSub;
  AppLifecycleState _lifecycleState = AppLifecycleState.resumed;
  Timer? _retentionTimer;
  Timer? _meshUiNotifyDebounce;
  DateTime _lastPresenceAnnounce = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _lastGeoRefreshAttempt = DateTime.fromMillisecondsSinceEpoch(0);
  final _uuid = const Uuid();

  VoidCallback? _onAckHandlerChanged;
  VoidCallback? _onAckQueueChanged;
  VoidCallback? _onResilnetFlush;
  VoidCallback? _onResilnetUi;
  VoidCallback? _onEsp32Changed;
  VoidCallback? _onUdpChanged;
  VoidCallback? _onNostrChanged;
  VoidCallback? _onMeshChanged;

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

  /// True when at least one Nostr relay is connected.
  bool get isNostrOnline => _nostr?.isOnline ?? false;

  bool _initDone = false;
  bool get initDone => _initDone;

  String? _initError;
  String? get initError => _initError;

  bool _permissionsGranted = false;
  bool get permissionsGranted => _permissionsGranted;

  bool _radioPaused = false;
  bool get radioPaused => _radioPaused;

  /// BLE mesh radio lifecycle for status UI.
  BleRadioState get bleRadioState {
    if (!permissionsGranted) return BleRadioState.needsPermission;
    if (_radioPaused) return BleRadioState.pausedForCamera;
    if (isReady && (_mesh?.running ?? false)) return BleRadioState.running;
    return BleRadioState.stopped;
  }

  /// Human-readable mesh permission snapshot for Settings (BT + Location).
  Future<({String bt, String loc})> meshPermissionLabels() async {
    final mesh = await _meshPermissions();
    String label(Permission p, PermissionStatus s) {
      if (s.isGranted) return 'ok';
      if (s.isLimited) return 'limited';
      if (s.isPermanentlyDenied) return 'denied';
      return 'off';
    }
    var bt = '—';
    var loc = '—';
    for (final p in mesh) {
      final s = await p.status;
      final name = p.toString();
      if (name.contains('bluetooth')) {
        bt = label(p, s);
      } else if (name.contains('location')) {
        loc = label(p, s);
      }
    }
    return (bt: bt, loc: loc);
  }

  String get bleRadioRunningLabel {
    return switch (bleRadioState) {
      BleRadioState.running => 'running',
      BleRadioState.pausedForCamera => 'paused',
      BleRadioState.stopped => 'stopped',
      BleRadioState.needsPermission => 'needs_permission',
    };
  }

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

  /// Mesh tab auto-delete window for local message history.
  static const _kMeshRetentionDays = 'resilnet_mesh_retention_days';
  MeshRetention _meshRetention = MeshRetention.keep;
  MeshRetention get meshRetention => _meshRetention;

  /// When false, outbound chat is blocked until re-enabled (network stays sealed).
  static const _kE2eeEnabled = 'resilnet_e2ee_enabled';
  bool _e2eeEnabled = true;
  bool get e2eeEnabled => _e2eeEnabled;

  static const _kScreenshotAlerts = 'resilnet_screenshot_alerts';
  bool _screenshotAlerts = true;
  bool get screenshotAlerts => _screenshotAlerts;

  /// When true (default), outbound sealed envelopes may dual-path BLE+Nostr.
  static const _kMeshBridgeEnabled = 'resilnet_mesh_bridge_enabled';
  bool _meshBridgeEnabled = true;
  bool get meshBridgeEnabled => _meshBridgeEnabled;

  static const _kFavoritePeerIds = 'resilnet_favorite_peer_ids';
  final Set<String> _favoritePeerIds = <String>{};
  Set<String> get favoritePeerIds => Set.unmodifiable(_favoritePeerIds);
  final Set<String> _favoriteNearbyNotified = <String>{};
  final Set<String> _favoriteAreaNotified = <String>{};

  static const _kNostrExpiryDays = 'resilnet_nostr_expiry_days';
  NoticeExpiry _nostrExpiry = NoticeExpiry.sevenDays;
  NoticeExpiry get nostrExpiry => _nostrExpiry;

  static const _kNotices = 'resilnet_local_notices';
  final List<LocalNotice> _notices = <LocalNotice>[];
  List<LocalNotice> get notices =>
      List.unmodifiable(_notices.where((n) => !n.isExpired));

  static const _kAnnouncementBoards = 'resilnet_announcement_boards';
  static const _kAnnouncementPosts = 'resilnet_announcement_posts';
  final List<AnnouncementBoard> _boards = <AnnouncementBoard>[];
  final List<AnnouncementPost> _boardPosts = <AnnouncementPost>[];
  /// boardId → private PEM (owner or granted).
  final Map<String, String> _boardPrivateKeys = {};
  /// Pending inbound key requests: requestMsgId → meta
  final List<Map<String, String>> _pendingBoardKeyRequests =
      <Map<String, String>>[];

  List<AnnouncementBoard> get announcementBoards =>
      List.unmodifiable(_boards);
  List<AnnouncementPost> postsForBoard(String boardId) => _boardPosts
      .where((p) => p.boardId == boardId)
      .toList()
    ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  List<Map<String, String>> get pendingBoardKeyRequests =>
      List.unmodifiable(_pendingBoardKeyRequests);

  bool canDecryptBoard(String boardId) =>
      _boardPrivateKeys.containsKey(boardId);

  /// Latest local system lines (screenshot etc.) for UI banners.
  final List<ChatMessage> _systemLines = <ChatMessage>[];
  List<ChatMessage> get systemLines => List.unmodifiable(_systemLines);

  /// In-memory sealed envelopes for the current process only (ephemeral UI).
  final List<ChatMessage> _sessionMessages = <ChatMessage>[];

  /// Bumped when conversation rows / statuses change (chat UI cache invalidation).
  int _chatDataEpoch = 0;
  int get chatDataEpoch => _chatDataEpoch;

  void _bumpChatData() => _chatDataEpoch++;

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
  static const _kTransportMode = 'resilnet_transport_mode';

  FeedChannel _feedChannel = FeedChannel.directs;
  FeedChannel get feedChannel => _feedChannel;

  GeoPrecision _geoPrecision = GeoPrecision.neighborhood;
  GeoPrecision get geoPrecision => _geoPrecision;

  TransportMode _transportMode = TransportMode.auto;
  TransportMode get transportMode => _transportMode;

  /// Anonymous Nostr presence sightings keyed by pubkey hex.
  final Map<String, NostrPresenceSighting> _nostrPresence = {};
  StreamSubscription<GeoPresenceDto>? _geoPresenceSub;
  Timer? _geoPresencePublishTimer;

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
      _onAckHandlerChanged = () {
        _bumpChatData();
        notifyListeners();
      };
      _ackHandler.addListener(_onAckHandlerChanged!);

      _ackQueue = AckQueueManager(
        database: db,
        myUserId: crypto.myUserId,
        isHighSpeedTransport: () =>
            resilnet.isInternetAvailable || resilnet.isGatewayWifiActive,
        sendAckBatch: _sendAckBatch,
      );
      await _ackQueue!.restoreFromDatabase();
      _onAckQueueChanged = notifyListeners;
      _ackQueue!.addListener(_onAckQueueChanged!);

      _onResilnetFlush = () {
        if (resilnet.isInternetAvailable || resilnet.isGatewayWifiActive) {
          _ackQueue?.onTransportUpgraded();
          unawaited(_nostr?.flushOfflineQueue());
        }
      };
      resilnet.addListener(_onResilnetFlush!);

      await notifications.init();
      unawaited(notifications.requestPermissions());

      _mesh = BleMeshService(
        database: db,
        myUserId: crypto.myUserId,
        crypto: crypto,
        resilnet: resilnet,
        ackQueue: _ackQueue,
        ackHandler: _ackHandler,
        shouldPersistHistory: () => _saveMessageHistory,
        onEphemeralMessage: _rememberSessionMessage,
      );
      _esp32 = Esp32SyncService(database: db, crypto: crypto);
      _udp = UdpTransportService(database: db, resilnet: resilnet);
      resilnet.attachUdpTransport(_udp!, crypto: crypto);
      _firmware = FirmwareService();
      await _firmware!.refreshLocalInfo();

      _nostr = NostrSyncService();
      try {
        await _nostr!.start();
        _attachGeoPresenceListener();
      } catch (e, st) {
        debugPrint('[ResilNet] Nostr start failed (offline ok): $e\n$st');
      }

      _onEsp32Changed = notifyListeners;
      _onUdpChanged = notifyListeners;
      _onNostrChanged = notifyListeners;
      _onMeshChanged = () {
        _onMeshPeersChanged();
        _scheduleMeshUiNotify();
      };
      _esp32!.addListener(_onEsp32Changed!);
      _udp!.addListener(_onUdpChanged!);
      _nostr!.addListener(_onNostrChanged!);
      _mesh!.addListener(_onMeshChanged!);

      resilnet.startNetworkMonitoring(blePeerCount: () => _mesh?.nearbyPeerCount ?? 0);
      _onResilnetUi = () {
        if (resilnet.isInternetAvailable) {
          unawaited(_nostr?.flushOfflineQueue());
          unawaited(_nostr?.reconnect());
        }
        notifyListeners();
      };
      resilnet.addListener(_onResilnetUi!);

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
      _meshRetention = MeshRetention.fromDays(
        prefs.getInt(_kMeshRetentionDays),
      );
      _e2eeEnabled = prefs.getBool(_kE2eeEnabled) ?? true;
      _screenshotAlerts = prefs.getBool(_kScreenshotAlerts) ?? true;
      _meshBridgeEnabled = prefs.getBool(_kMeshBridgeEnabled) ?? true;
      _loadFavorites(prefs);
      _nostrExpiry = NoticeExpiry.fromDays(prefs.getInt(_kNostrExpiryDays));
      _loadNotices(prefs);
      await _loadAnnouncementBoards(prefs);
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
      _transportMode = TransportMode.fromName(prefs.getString(_kTransportMode));

      if (_feedChannel == FeedChannel.geo) {
        unawaited(refreshGeohash());
      }

      // ตรวจสิทธิ์ที่มีอยู่แล้ว (ไม่ขึ้น dialog) แล้วค่อยสตาร์ท radio
      _permissionsGranted = await _hasAllRequiredPermissions();
      if (_permissionsGranted) {
        unawaited(_startRadios());
      }
      _startRetentionTimer();
      unawaited(purgeExpiredMessages());
      unawaited(_startScreenshotWatch());
    } finally {
      _initDone = true;
      notifyListeners();
    }
  }

  void _loadNotices(SharedPreferences prefs) {
    _notices.clear();
    final raw = prefs.getString(_kNotices);
    if (raw == null || raw.isEmpty) return;
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      for (final item in list) {
        if (item is Map<String, dynamic>) {
          _notices.add(LocalNotice.fromJson(Map<String, Object?>.from(item)));
        }
      }
      _notices.removeWhere((n) => n.isExpired);
    } catch (e) {
      debugPrint('[ResilNet] load notices failed: $e');
    }
  }

  Future<void> _persistNotices() async {
    final prefs = await SharedPreferences.getInstance();
    final active = _notices.where((n) => !n.isExpired).toList();
    await prefs.setString(
      _kNotices,
      jsonEncode(active.map((n) => n.toJson()).toList()),
    );
  }

  Future<void> _loadAnnouncementBoards(SharedPreferences prefs) async {
    _boards.clear();
    _boardPosts.clear();
    _boardPrivateKeys.clear();
    try {
      final rawB = prefs.getString(_kAnnouncementBoards);
      if (rawB != null && rawB.isNotEmpty) {
        final list = jsonDecode(rawB) as List<dynamic>;
        for (final item in list) {
          if (item is Map<String, dynamic>) {
            _boards.add(
              AnnouncementBoard.fromJson(Map<String, Object?>.from(item)),
            );
          }
        }
      }
      final rawP = prefs.getString(_kAnnouncementPosts);
      if (rawP != null && rawP.isNotEmpty) {
        final list = jsonDecode(rawP) as List<dynamic>;
        for (final item in list) {
          if (item is Map<String, dynamic>) {
            _boardPosts.add(
              AnnouncementPost.fromJson(Map<String, Object?>.from(item)),
            );
          }
        }
      }
    } catch (e) {
      debugPrint('[ResilNet] load boards failed: $e');
    }
    for (final b in _boards) {
      try {
        final priv = await _storage.read(key: 'resilnet_board_priv_${b.id}');
        if (priv != null && priv.isNotEmpty) {
          _boardPrivateKeys[b.id] = priv;
        }
        final grant = await _storage.read(key: 'resilnet_board_grant_${b.id}');
        if (grant != null && grant.isNotEmpty) {
          _boardPrivateKeys[b.id] = grant;
        }
      } catch (e) {
        debugPrint('[ResilNet] load board key ${b.id} failed: $e');
      }
    }
  }

  Future<void> _persistAnnouncementBoards() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kAnnouncementBoards,
      jsonEncode(_boards.map((b) => b.toJson()).toList()),
    );
    await prefs.setString(
      _kAnnouncementPosts,
      jsonEncode(_boardPosts.map((p) => p.toJson()).toList()),
    );
  }

  Future<AnnouncementBoard> createAnnouncementBoard({
    required String title,
  }) async {
    final pair = crypto.generateKeyPairPems();
    final board = AnnouncementBoard(
      id: pair.keyId,
      title: title.trim().isEmpty ? 'Board' : title.trim(),
      ownerId: myUserId,
      publicKeyPem: pair.publicPem,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      allowLocked: true,
      allowOpen: false,
    );
    _boards.insert(0, board);
    await _storage.write(
      key: 'resilnet_board_priv_${board.id}',
      value: pair.privatePem,
    );
    _boardPrivateKeys[board.id] = pair.privatePem;
    await _persistAnnouncementBoards();
    notifyListeners();
    return board;
  }

  /// Import board metadata without private key (for readers before grant).
  Future<void> followAnnouncementBoard(AnnouncementBoard board) async {
    if (_boards.any((b) => b.id == board.id)) return;
    _boards.insert(
      0,
      AnnouncementBoard(
        id: board.id,
        title: board.title,
        ownerId: board.ownerId,
        publicKeyPem: board.publicKeyPem,
        createdAt: board.createdAt,
        allowLocked: board.allowLocked,
        allowOpen: board.allowOpen,
        epoch: board.epoch,
      ),
    );
    await _persistAnnouncementBoards();
    notifyListeners();
  }

  String boardInvitePayload(AnnouncementBoard board) {
    return jsonEncode(board.toJson());
  }

  Future<bool> followBoardFromInviteJson(String raw) async {
    try {
      final m = jsonDecode(raw.trim()) as Map<String, dynamic>;
      final board = AnnouncementBoard.fromJson(Map<String, Object?>.from(m));
      if (board.id.isEmpty || board.publicKeyPem.isEmpty) return false;
      await followAnnouncementBoard(board);
      return true;
    } catch (e) {
      debugPrint('[ResilNet] follow invite failed: $e');
      return false;
    }
  }

  Future<void> updateBoardSettings(
    String boardId, {
    bool? allowLocked,
    bool? allowOpen,
  }) async {
    final i = _boards.indexWhere((b) => b.id == boardId);
    if (i < 0) return;
    final b = _boards[i];
    if (b.ownerId != myUserId) return;
    if (allowLocked != null) b.allowLocked = allowLocked;
    if (allowOpen != null) b.allowOpen = allowOpen;
    await _persistAnnouncementBoards();
    notifyListeners();
  }

AnnouncementBoard? boardById(String id) {
    for (final b in _boards) {
      if (b.id == id) return b;
    }
    return null;
  }

  Future<AnnouncementPost?> postAnnouncement({
    required String boardId,
    required String text,
    required AnnouncementPostMode mode,
  }) async {
    final board = boardById(boardId);
    if (board == null) return null;
    final body = text.trim();
    if (body.isEmpty) return null;
    final isMedia = AnnouncementMedia.isMedia(body);
    // Large photo/voice payloads are internet-only (avoid BLE mesh MTU pain).
    if (isMedia && !resilnet.isInternetAvailable && !(_nostr?.isOnline ?? false)) {
      debugPrint('[ResilNet] announcement media blocked — no internet');
      return null;
    }

    if (mode == AnnouncementPostMode.open) {
      if (!board.allowOpen) return null;
      final post = AnnouncementPost(
        id: _uuid.v4(),
        boardId: boardId,
        authorId: myUserId,
        mode: AnnouncementPostMode.open,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        openText: body,
        epoch: board.epoch,
      );
      _boardPosts.insert(0, post);
      await _persistAnnouncementBoards();
      if (isMedia) {
        unawaited(_fanOutBoardPost(post, internetOnly: true));
      } else {
        // Best-effort fan-out as labeled open notice (explicitly non-E2EE).
        unawaited(
          postNotice(
            scope: 'mesh',
            channelLabel: '#announce',
            text: '[OPEN][${board.title}] $body',
            expiry: NoticeExpiry.oneDay,
          ),
        );
      }
      notifyListeners();
      return post;
    }

    if (!board.allowLocked) return null;
    final ts = DateTime.now().millisecondsSinceEpoch;
    final pkg = crypto.encryptForRecipient(
      plaintext: body,
      receiverPublicPem: board.publicKeyPem,
      senderId: myUserId,
      receiverId: board.id,
      timestamp: ts,
    );
    final post = AnnouncementPost(
      id: _uuid.v4(),
      boardId: boardId,
      authorId: myUserId,
      mode: AnnouncementPostMode.locked,
      createdAt: ts,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      epoch: board.epoch,
    );
    _boardPosts.insert(0, post);
    await _persistAnnouncementBoards();
    unawaited(_fanOutBoardPost(post, internetOnly: isMedia));
    notifyListeners();
    return post;
  }

  Future<void> _fanOutBoardPost(
    AnnouncementPost post, {
    bool internetOnly = false,
  }) async {
    if (!_e2eeEnabled) return;
    final peers = await db.getAllPeers();
    final body = jsonEncode({
      'v': 1,
      'type': PayloadKinds.boardPost,
      'post': post.toJson(),
    });
    await _sendSealedFanOut(
      peers: peers,
      body: body,
      kind: PayloadKinds.boardPost,
      internetOnly: internetOnly,
    );
  }

  Future<void> _handleBoardPostSyncMessage(ChatMessage msg) async {
    if (msg.receiverId != myUserId) return;
    if (msg.payloadKind != PayloadKinds.boardPost) return;
    String plain;
    try {
      plain = crypto.decryptFromSender(
        encryptedPayload: msg.encryptedPayload,
        encryptedKey: msg.encryptedKey,
      );
    } catch (e) {
      debugPrint('[ResilNet] board post sync decrypt failed: $e');
      return;
    }
    try {
      final obj = jsonDecode(plain) as Map<String, dynamic>;
      if ((obj['type'] as String?) != PayloadKinds.boardPost) return;
      final rawPost = obj['post'];
      if (rawPost is! Map) return;
      final post = AnnouncementPost.fromJson(
        Map<String, Object?>.from(rawPost),
      );
      if (boardById(post.boardId) == null) return;
      if (_boardPosts.any((p) => p.id == post.id)) return;
      _boardPosts.insert(0, post);
      await _persistAnnouncementBoards();
      notifyListeners();
    } catch (e) {
      debugPrint('[ResilNet] board post sync parse failed: $e');
    }
  }

  String? decryptAnnouncementPost(AnnouncementPost post) {
    if (post.isOpen) return post.openText;
    final priv = _boardPrivateKeys[post.boardId];
    if (priv == null ||
        post.encryptedPayload == null ||
        post.encryptedKey == null) {
      return null;
    }
    try {
      return crypto.decryptWithPrivatePem(
        privatePem: priv,
        encryptedPayload: post.encryptedPayload!,
        encryptedKey: post.encryptedKey!,
      );
    } catch (e) {
      debugPrint('[ResilNet] board decrypt failed: $e');
      return null;
    }
  }

  /// Prompt C: request board key from owner (sealed 1:1).
  Future<bool> requestBoardAccess(String boardId) async {
    final board = boardById(boardId);
    if (board == null) return false;
    if (board.ownerId == myUserId) return true;
    if (canDecryptBoard(boardId)) return true;
    if (!_e2eeEnabled) return false;

    final owner = await db.getPeer(board.ownerId);
    final ownerPub = owner?.publicKey ?? '';
    if (ownerPub.isEmpty) return false;

    final payload = jsonEncode({
      'v': 1,
      'type': PayloadKinds.boardKeyRequest,
      'boardId': boardId,
      'boardTitle': board.title,
      'requesterId': myUserId,
      'requesterPub': crypto.publicKeyPem,
    });
    final ts = DateTime.now().millisecondsSinceEpoch;
    final pkg = crypto.encryptForRecipient(
      plaintext: payload,
      receiverPublicPem: ownerPub,
      senderId: myUserId,
      receiverId: board.ownerId,
      timestamp: ts,
    );
    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: myUserId,
      receiverId: board.ownerId,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.boardKeyRequest,
    );
    await persistChatMessage(msg);
    await routeOutbound(msg);
    notifyListeners();
    return true;
  }

  /// Prompt C: owner approves — wrap board private key for requester.
  Future<bool> approveBoardKeyRequest({
    required String boardId,
    required String requesterId,
    required String requesterPubPem,
  }) async {
    if (!_e2eeEnabled) return false;
    final board = boardById(boardId);
    if (board == null || board.ownerId != myUserId) return false;
    final priv = _boardPrivateKeys[boardId];
    if (priv == null || priv.isEmpty) return false;

    // Prefer peer DB pubkey; always bind id ↔ hash(pubkey).
    final peer = await db.getPeer(requesterId);
    var pub = (peer?.publicKey.trim().isNotEmpty == true)
        ? peer!.publicKey.trim()
        : CryptoService.normalizePublicKey(requesterPubPem);
    if (pub.isEmpty) return false;
    pub = CryptoService.normalizePublicKey(pub);
    if (CryptoService.publicKeyHash(pub) != requesterId) {
      debugPrint(
        '[ResilNet] approveBoardKeyRequest rejected — pubkey hash != requesterId',
      );
      return false;
    }

    final grantBody = jsonEncode({
      'v': 1,
      'type': PayloadKinds.boardKeyGrant,
      'boardId': boardId,
      'epoch': board.epoch,
      'privatePem': priv,
    });
    final ts = DateTime.now().millisecondsSinceEpoch;
    final pkg = crypto.encryptForRecipient(
      plaintext: grantBody,
      receiverPublicPem: pub,
      senderId: myUserId,
      receiverId: requesterId,
      timestamp: ts,
    );
    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: myUserId,
      receiverId: requesterId,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.boardKeyGrant,
    );
    await persistChatMessage(msg);
    await routeOutbound(msg);
    _pendingBoardKeyRequests.removeWhere(
      (r) => r['boardId'] == boardId && r['requesterId'] == requesterId,
    );
    notifyListeners();
    return true;
  }

  void denyBoardKeyRequest({
    required String boardId,
    required String requesterId,
  }) {
    _pendingBoardKeyRequests.removeWhere(
      (r) => r['boardId'] == boardId && r['requesterId'] == requesterId,
    );
    notifyListeners();
  }

  Future<void> _handleBoardKeyControlMessage(ChatMessage msg) async {
    if (msg.receiverId != myUserId) return;
    if (msg.payloadKind != PayloadKinds.boardKeyRequest &&
        msg.payloadKind != PayloadKinds.boardKeyGrant) {
      return;
    }
    String plain;
    try {
      plain = crypto.decryptFromSender(
        encryptedPayload: msg.encryptedPayload,
        encryptedKey: msg.encryptedKey,
      );
    } catch (e) {
      debugPrint('[ResilNet] board control decrypt failed: $e');
      return;
    }
    try {
      final obj = jsonDecode(plain) as Map<String, dynamic>;
      final type = obj['type'] as String? ?? '';
      if (type == PayloadKinds.boardKeyRequest) {
        final boardId = obj['boardId'] as String? ?? '';
        final requesterId = obj['requesterId'] as String? ?? msg.senderId;
        final requesterPubRaw = obj['requesterPub'] as String? ?? '';
        final title = obj['boardTitle'] as String? ?? '';
        if (boardId.isEmpty || requesterPubRaw.isEmpty) return;
        final requesterPub = CryptoService.normalizePublicKey(requesterPubRaw);
        final boundId = CryptoService.publicKeyHash(requesterPub);
        if (boundId != requesterId || msg.senderId != requesterId) {
          debugPrint(
            '[ResilNet] drop board key request — id/pubkey mismatch '
            'claimed=$requesterId bound=$boundId sender=${msg.senderId}',
          );
          return;
        }
        _pendingBoardKeyRequests.removeWhere(
          (r) => r['boardId'] == boardId && r['requesterId'] == requesterId,
        );
        _pendingBoardKeyRequests.add({
          'boardId': boardId,
          'requesterId': requesterId,
          'requesterPub': requesterPub,
          'boardTitle': title,
          'msgId': msg.id,
        });
        notifyListeners();
      } else if (type == PayloadKinds.boardKeyGrant) {
        final boardId = obj['boardId'] as String? ?? '';
        final privatePem = obj['privatePem'] as String? ?? '';
        if (boardId.isEmpty || privatePem.isEmpty) return;
        await _storage.write(
          key: 'resilnet_board_grant_$boardId',
          value: privatePem,
        );
        _boardPrivateKeys[boardId] = privatePem;
        notifyListeners();
      }
    } catch (e) {
      debugPrint('[ResilNet] board control parse failed: $e');
    }
  }

  Future<void> _startScreenshotWatch() async {
    screenshots.addListener(_onScreenshot);
    await screenshots.start(enabled: _screenshotAlerts);
  }

  void _onScreenshot() {
    if (!_screenshotAlerts) return;
    final ts = screenshots.lastShotAt;
    final line = ChatMessage(
      id: _uuid.v4(),
      senderId: myUserId,
      receiverId: myUserId,
      content: 'screenshot',
      encryptedPayload: PayloadKinds.system,
      encryptedKey: PayloadKinds.system,
      ttl: 0,
      timestamp: ts == 0 ? DateTime.now().millisecondsSinceEpoch : ts,
      status: MessageStatus.sent,
      type: MessageType.direct,
      payloadKind: PayloadKinds.system,
    );
    _systemLines.add(line);
    if (_systemLines.length > 40) {
      _systemLines.removeRange(0, _systemLines.length - 40);
    }
    notifyListeners();
  }

  Future<void> setE2eeEnabled(bool enabled) async {
    _e2eeEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kE2eeEnabled, enabled);
    notifyListeners();
  }

  Future<void> setScreenshotAlerts(bool enabled) async {
    _screenshotAlerts = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kScreenshotAlerts, enabled);
    await screenshots.setEnabled(enabled);
    notifyListeners();
  }

  Future<void> setMeshBridgeEnabled(bool enabled) async {
    if (_meshBridgeEnabled == enabled) return;
    _meshBridgeEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kMeshBridgeEnabled, enabled);
    notifyListeners();
  }

  bool isFavorite(String peerId) => _favoritePeerIds.contains(peerId);

  Future<void> toggleFavorite(String peerId) async {
    final id = peerId.trim();
    if (id.isEmpty) return;
    if (_favoritePeerIds.contains(id)) {
      _favoritePeerIds.remove(id);
      _favoriteNearbyNotified.remove(id);
      _favoriteAreaNotified.remove(id);
    } else {
      _favoritePeerIds.add(id);
    }
    await _persistFavorites();
    notifyListeners();
  }

  void _loadFavorites(SharedPreferences prefs) {
    _favoritePeerIds.clear();
    final raw = prefs.getString(_kFavoritePeerIds);
    if (raw == null || raw.isEmpty) return;
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      for (final item in list) {
        if (item is String && item.isNotEmpty) _favoritePeerIds.add(item);
      }
    } catch (e) {
      debugPrint('[ResilNet] load favorites failed: $e');
    }
  }

  Future<void> _persistFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kFavoritePeerIds,
      jsonEncode(_favoritePeerIds.toList()),
    );
  }

  void _onMeshPeersChanged() {
    unawaited(_notifyFavoriteNearby());
  }

  void _scheduleMeshUiNotify() {
    _meshUiNotifyDebounce?.cancel();
    _meshUiNotifyDebounce = Timer(const Duration(seconds: 1), () {
      if (hasListeners) notifyListeners();
    });
  }

  Future<void> _notifyFavoriteNearby() async {
    if (!_notificationsEnabled || _favoritePeerIds.isEmpty || !isReady) return;
    final nearby = _mesh?.nearbyPeers ?? const [];
    for (final peer in nearby) {
      if (!_favoritePeerIds.contains(peer.id) || peer.isBlocked) continue;
      if (_favoriteNearbyNotified.contains(peer.id)) continue;
      _favoriteNearbyNotified.add(peer.id);
      final name = await db.resolveDisplayName(peer.id);
      final th = _localeOverrideCode == 'th';
      await notifications.showFavoriteAlert(
        id: peer.id.hashCode & 0x7fffffff,
        title: th ? 'คนโปรดอยู่ใกล้' : 'Favorite nearby',
        body: th ? '$name อยู่ใกล้บน mesh' : '$name is nearby on mesh',
      );
    }
    // Drop notified set entries that left nearby so we can re-alert later.
    final nearbyIds = nearby.map((p) => p.id).toSet();
    _favoriteNearbyNotified.removeWhere((id) => !nearbyIds.contains(id));
  }

  Future<void> _notifyFavoriteInArea() async {
    if (!_notificationsEnabled || _favoritePeerIds.isEmpty) return;
    final online = peersOnlineInSelectedArea();
    final onlineIds = online.map((p) => p.id).toSet();
    for (final peer in online) {
      if (!_favoritePeerIds.contains(peer.id) || peer.isBlocked) continue;
      if (_favoriteAreaNotified.contains(peer.id)) continue;
      // Skip if already notified as nearby (same moment).
      if (_favoriteNearbyNotified.contains(peer.id)) continue;
      _favoriteAreaNotified.add(peer.id);
      final name = await db.resolveDisplayName(peer.id);
      final th = _localeOverrideCode == 'th';
      await notifications.showFavoriteAlert(
        id: (peer.id.hashCode ^ 0x51) & 0x7fffffff,
        title: th ? 'คนโปรดในพื้นที่' : 'Favorite in area',
        body: th ? '$name ออนไลน์ในพื้นที่นี้' : '$name is online in this area',
      );
    }
    _favoriteAreaNotified.removeWhere((id) => !onlineIds.contains(id));
  }

  /// Prefer a single transport when mesh bridge is off (no dual-path fan-out).
  List<TransportTypeDto> _applyBridgePolicy(List<TransportTypeDto> transports) {
    if (_meshBridgeEnabled || transports.length <= 1) return transports;
    final hasNostr = transports.contains(TransportTypeDto.nostr);
    final meshLike = transports
        .where(
          (t) =>
              t == TransportTypeDto.bluetoothMesh || t == TransportTypeDto.loRa,
        )
        .toList();
    if (hasNostr && meshLike.isNotEmpty) {
      final ble = _mesh?.nearbyPeerCount ?? 0;
      final picked =
          ble > 0 ? meshLike : const [TransportTypeDto.nostr];
      return picked.isNotEmpty ? picked : transports;
    }
    return transports;
  }

  Future<void> setNostrExpiry(NoticeExpiry expiry) async {
    if (_nostrExpiry == expiry) return;
    _nostrExpiry = expiry;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kNostrExpiryDays, expiry.days);
    // Align mesh retention purge window when a finite keep-time is chosen.
    if (expiry.days > 0) {
      await setMeshRetention(MeshRetention.fromDays(expiry.days));
    }
    notifyListeners();
  }

  List<LocalNotice> noticesForScope(String scope) {
    return notices.where((n) => n.scope == scope).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  /// Pin a public notice on #mesh or Area and fan-out sealed envelopes.
  Future<LocalNotice?> postNotice({
    required String scope,
    required String channelLabel,
    required String text,
    required NoticeExpiry expiry,
    bool urgent = false,
  }) async {
    if (!_e2eeEnabled) return null;
    final body = text.trim();
    if (body.isEmpty) return null;
    final notice = LocalNotice(
      id: _uuid.v4(),
      scope: scope,
      channelLabel: channelLabel,
      text: body,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      expiresAt: expiry.expiresAtMs,
      urgent: urgent,
    );
    _notices.insert(0, notice);
    await _persistNotices();

    final prefix = urgent ? '[URGENT] ' : '';
    final payload = '$prefix${notice.text}';
    if (scope == 'geo') {
      await sendAreaPublicText(payload, kind: PayloadKinds.notice);
    } else {
      await _fanOutToNearby(payload, kind: PayloadKinds.notice);
    }
    notifyListeners();
    return notice;
  }

  Future<int> _fanOutToNearby(
    String text, {
    String kind = PayloadKinds.areaPublic,
  }) async {
    final peers = _mesh?.nearbyPeers ?? const <Peer>[];
    var sent = 0;
    for (final peer in peers) {
      if (peer.id == myUserId || peer.publicKey.isEmpty) continue;
      try {
        final ts = DateTime.now().millisecondsSinceEpoch;
        final pkg = crypto.encryptForRecipient(
          plaintext: text,
          receiverPublicPem: peer.publicKey,
          senderId: myUserId,
          receiverId: peer.id,
          timestamp: ts,
        );
        final msg = ChatMessage(
          id: _uuid.v4(),
          senderId: myUserId,
          receiverId: peer.id,
          encryptedPayload: pkg.encryptedPayload,
          encryptedKey: pkg.encryptedKey,
          signature: pkg.signature,
          ttl: 5,
          timestamp: ts,
          status: MessageStatus.pending,
          type: MessageType.direct,
          payloadKind: kind,
        );
        await persistChatMessage(msg);
        await routeOutbound(msg);
        sent++;
      } catch (e) {
        debugPrint('[ResilNet] fan-out to ${peer.id} failed: $e');
      }
    }
    return sent;
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

    await refreshPermissions();

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

    unawaited(purgeExpiredMessages());
    if (_feedChannel == FeedChannel.geo) {
      if (_currentGeohash == null || _currentGeohash!.isEmpty) {
        unawaited(refreshGeohash());
      } else {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
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
    if (_feedChannel == FeedChannel.geo && _transportMode.usesInternet) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    }
  }

  /// Reconnect Nostr relays and re-sync Area presence (UI action).
  Future<void> reconnectNostrAndSyncGeo() async {
    await _reconnectNostr();
    notifyListeners();
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

  Future<void> setMeshRetention(MeshRetention retention) async {
    if (_meshRetention == retention) return;
    _meshRetention = retention;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kMeshRetentionDays, retention.days);
    _startRetentionTimer();
    unawaited(purgeExpiredMessages());
    notifyListeners();
  }

  void _startRetentionTimer() {
    _retentionTimer?.cancel();
    if (_meshRetention.duration == null) {
      _retentionTimer = null;
      return;
    }
    _retentionTimer = Timer.periodic(const Duration(minutes: 15), (_) {
      unawaited(purgeExpiredMessages());
    });
  }

  /// Purge local history older than the mesh retention window.
  Future<int> purgeExpiredMessages() async {
    final window = _meshRetention.duration;
    if (window == null) return 0;
    final cutoff =
        DateTime.now().millisecondsSinceEpoch - window.inMilliseconds;
    var deleted = 0;
    if (_saveMessageHistory) {
      deleted = await db.deleteMessagesOlderThan(cutoff);
    }
    _sessionMessages.removeWhere((m) => m.timestamp < cutoff);
    if (deleted > 0) {
      debugPrint('[ResilNet] mesh retention purged $deleted rows');
      notifyListeners();
    }
    return deleted;
  }

  void _rememberSessionMessage(ChatMessage msg) {
    if (_saveMessageHistory) return;
    if (!PayloadKinds.isChatVisible(msg.payloadKind)) return;
    final i = _sessionMessages.indexWhere((m) => m.id == msg.id);
    if (i >= 0) {
      _sessionMessages[i] = msg;
    } else {
      _sessionMessages.add(msg);
      if (_sessionMessages.length > 200) {
        _sessionMessages.removeRange(0, _sessionMessages.length - 200);
      }
    }
    _bumpChatData();
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
      if (!PayloadKinds.isChatVisible(m.payloadKind)) return false;
      return (m.senderId == a && m.receiverId == b) ||
          (m.senderId == b && m.receiverId == a);
    });
    final byId = <String, ChatMessage>{
      for (final m in persisted)
        if (PayloadKinds.isChatVisible(m.payloadKind)) m.id: m,
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
      if (!PayloadKinds.isChatVisible(m.payloadKind)) continue;
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
      _bumpChatData();
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
    if (channel == FeedChannel.geo) {
      if (_currentGeohash == null || _currentGeohash!.isEmpty) {
        unawaited(refreshGeohash());
      } else {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
    } else {
      unawaited(_clearNostrGeoSubscription());
      _stopGeoPresencePublishTimer();
    }
    notifyListeners();
  }

  Future<void> setGeoPrecision(GeoPrecision precision) async {
    if (_geoPrecision == precision) return;
    _geoPrecision = precision;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kGeoPrecision, precision.name);
    if (_feedChannel == FeedChannel.geo) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    }
    notifyListeners();
  }

  Future<void> setTransportMode(TransportMode mode) async {
    if (_transportMode == mode) return;
    _transportMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTransportMode, mode.name);
    if (_feedChannel == FeedChannel.geo) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    } else if (!mode.usesInternet) {
      unawaited(_clearNostrGeoSubscription());
    }
    notifyListeners();
  }

  void _attachGeoPresenceListener() {
    final n = _nostr;
    if (n == null) return;
    _geoPresenceSub?.cancel();
    _geoPresenceSub = n.geoPresenceStream.listen(_onNostrGeoPresence);
  }

  void _onNostrGeoPresence(GeoPresenceDto ev) {
    final pkHex = ev.pubkeyHex.trim().toLowerCase();
    if (pkHex.isEmpty) return;
    final createdMs = ev.createdAt.toInt() * 1000;
    final now = DateTime.now().millisecondsSinceEpoch;
    final lastSeen = createdMs > 0 ? createdMs : now;

    final rid = ev.rid.trim();
    final pkRaw = ev.pk.trim();
    debugPrint(
      '[GeoPresence] received rid=${rid.isEmpty ? "anon" : rid} '
      'g=${ev.geohash.trim().toLowerCase()}',
    );
    Peer? boundPeer;
    // Legacy anon events (no rid/pk) remain discover-only; mismatched binding is dropped.
    if (rid.isNotEmpty || pkRaw.isNotEmpty) {
      if (!CryptoService.bindsIdentity(rid: rid, publicKeyMaterial: pkRaw)) {
        debugPrint(
          '[ResilNet] drop geo presence — rid/pk binding failed rid=$rid',
        );
        return;
      }
      if (rid == myUserId) return;
      try {
        final pem = CryptoService.normalizePublicKey(pkRaw);
        boundPeer = Peer(
          id: rid,
          publicKey: pem,
          displayName: ev.nick.trim().isNotEmpty ? ev.nick.trim() : null,
          geohash: ev.geohash.trim().toLowerCase(),
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: lastSeen,
        );
        unawaited(db.upsertPeer(boundPeer));
      } catch (e) {
        debugPrint('[ResilNet] geo presence peer upsert failed: $e');
        return;
      }
    }

    final cacheKey = boundPeer?.id ?? pkHex;
    if (boundPeer != null) {
      // Drop legacy anon row for the same ephemeral Nostr pubkey if present.
      _nostrPresence.remove(pkHex);
    }
    final existing = _nostrPresence[cacheKey];
    if (existing != null) {
      existing.nick = ev.nick.isNotEmpty ? ev.nick : existing.nick;
      existing.geohash = ev.geohash;
      if (lastSeen > existing.lastSeen) existing.lastSeen = lastSeen;
      if (boundPeer != null) {
        existing.resilnetId = boundPeer.id;
        existing.peer = boundPeer;
      }
    } else {
      _nostrPresence[cacheKey] = NostrPresenceSighting(
        pubkeyHex: pkHex,
        nick: ev.nick.isNotEmpty
            ? ev.nick
            : (boundPeer != null
                ? (boundPeer.displayName ??
                    'peer·${rid.length >= 4 ? rid.substring(0, 4) : rid}')
                : 'anon·${pkHex.length >= 4 ? pkHex.substring(0, 4) : pkHex}'),
        geohash: ev.geohash,
        lastSeen: lastSeen,
        resilnetId: boundPeer?.id,
        peer: boundPeer,
      );
    }
    _pruneNostrPresence();
    notifyListeners();
    unawaited(_notifyFavoriteInArea());
  }

  void _pruneNostrPresence() {
    final cutoff = DateTime.now().millisecondsSinceEpoch -
        kNostrPresenceOnlineWindow.inMilliseconds;
    _nostrPresence.removeWhere((_, v) => v.lastSeen < cutoff);
  }

  Future<void> _clearNostrGeoSubscription() async {
    await _nostr?.setGeoPresenceFilter(const []);
  }

  void _stopGeoPresencePublishTimer() {
    _geoPresencePublishTimer?.cancel();
    _geoPresencePublishTimer = null;
  }

  void _ensureGeoPresencePublishTimer() {
    if (!_transportMode.usesInternet) {
      _stopGeoPresencePublishTimer();
      return;
    }
    if (_feedChannel != FeedChannel.geo) {
      _stopGeoPresencePublishTimer();
      return;
    }
    _geoPresencePublishTimer ??= Timer.periodic(
      const Duration(seconds: 60),
      (_) => unawaited(announceGeohashPresence()),
    );
  }

  /// Refresh mesh + Nostr presence for the current Area channel.
  Future<void> syncGeoPresence({bool forceAnnounce = false}) async {
    if (!_transportMode.usesInternet || _feedChannel != FeedChannel.geo) {
      await _clearNostrGeoSubscription();
      if (!_transportMode.usesInternet) _stopGeoPresencePublishTimer();
      await announceGeohashPresence(force: forceAnnounce);
      return;
    }

    final full = _currentGeohash;
    if (full == null || full.isEmpty) {
      await _clearNostrGeoSubscription();
      await announceGeohashPresence(force: forceAnnounce);
      return;
    }

    if (!(_nostr?.isOnline ?? false) && isCloudOnline) {
      await _nostr?.reconnect();
      await _nostr?.refreshStatus();
    }

    if (_nostr?.isOnline ?? false) {
      final cells = Geohash.nostrSubscribeCells(full, _geoPrecision);
      debugPrint('[GeoPresence] subscribe $cells');
      await _nostr?.setGeoPresenceFilter(cells);
      _ensureGeoPresencePublishTimer();
    } else {
      await _clearNostrGeoSubscription();
    }
    await announceGeohashPresence(force: forceAnnounce);
  }

  /// Resolve device location → geohash for the geo channel label.
  /// Also announces truncated geohash presence to nearby peers for Area UX.
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
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
    } catch (e) {
      _geoError = e.toString();
      debugPrint('[ResilNet] refreshGeohash failed: $e');
    } finally {
      _geoRefreshing = false;
      notifyListeners();
    }
  }

  /// Active channel hash at current precision (without `#`).
  String? get selectedAreaHash {
    final h = _currentGeohash;
    if (h == null || h.isEmpty) return null;
    return Geohash.atPrecision(h, _geoPrecision);
  }

  /// Why Area people list is empty (for UI). [none] when not applicable or peers exist.
  GeoDiscoveryEmptyReason get geoDiscoveryEmptyReason {
    if (_feedChannel != FeedChannel.geo) return GeoDiscoveryEmptyReason.none;
    if (_geoNeedsPermission ||
        _currentGeohash == null ||
        _currentGeohash!.isEmpty) {
      return GeoDiscoveryEmptyReason.noLocation;
    }
    if (_transportMode == TransportMode.mesh) {
      return GeoDiscoveryEmptyReason.meshOnly;
    }
    if (_transportMode.usesInternet && !isNostrOnline) {
      return GeoDiscoveryEmptyReason.noNostr;
    }
    if (areaPresenceOnline().isEmpty) {
      return GeoDiscoveryEmptyReason.waiting;
    }
    return GeoDiscoveryEmptyReason.none;
  }

  /// Nostr relay connection label for Area discovery UI, e.g. `2/4`.
  String get nostrRelayLabel {
    final n = _nostr;
    if (n == null) return '0/0';
    return '${n.connectedRelays}/${n.totalRelays}';
  }

  /// Merged Area people list (BLE mesh + anonymous Nostr presence).
  List<AreaPresenceEntry> areaPresenceOnline() {
    _pruneNostrPresence();
    final channel = selectedAreaHash;
    final nearby = _mesh?.nearbyPeers ?? const <Peer>[];
    // Mesh filter: unknown geohash included (BLE bootstrap) when channel set.
    final meshFiltered = (channel == null || channel.isEmpty)
        ? nearby
        : nearby.where((p) {
            final geo = p.geohash?.trim();
            if (geo == null || geo.isEmpty) return true;
            return Geohash.matchesChannel(geo, channel);
          }).toList();

    return mergeAreaPresence(
      meshPeers: meshFiltered,
      nostrSightings: _nostrPresence.values.toList(),
      channel: channel,
      mode: _transportMode,
      nowMs: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Nearby BLE peers considered online in the selected geohash area.
  ///
  /// Used for sealed area fan-out (must have RSA keys). Anonymous Nostr-only
  /// presence is discoverable via [areaPresenceOnline] but not messageable yet.
  List<Peer> peersOnlineInSelectedArea() {
    return areaPresenceOnline()
        .where((e) => e.canMessage)
        .map((e) => e.peer!)
        .toList();
  }

  /// Share our geohash cell with nearby peers / Nostr (not shown as chat).
  Future<void> announceGeohashPresence({bool force = false}) async {
    var full = _currentGeohash;
    if (full == null || full.isEmpty) {
      if (_feedChannel == FeedChannel.geo && _transportMode.usesInternet) {
        final since = DateTime.now().difference(_lastGeoRefreshAttempt);
        if (since >= const Duration(seconds: 30)) {
          _lastGeoRefreshAttempt = DateTime.now();
          unawaited(refreshGeohash());
        }
      }
      return;
    }
    final channel = Geohash.atPrecision(full, _geoPrecision);
    if (channel.isEmpty) return;
    final since = DateTime.now().difference(_lastPresenceAnnounce);
    if (!force && since < const Duration(seconds: 45)) return;
    _lastPresenceAnnounce = DateTime.now();

    // Internet: geohash presence with ResilNet RSA rid+pk (messageable without QR).
    if (_transportMode.usesInternet) {
      if (!(_nostr?.isOnline ?? false) && isCloudOnline) {
        await _nostr?.reconnect();
        await _nostr?.refreshStatus();
      }
      if (_nostr?.isOnline ?? false) {
        final nick = _displayName.trim().isNotEmpty
            ? _displayName.trim()
            : myUserId.substring(0, myUserId.length.clamp(0, 10));
        final relays = nostrRelayLabel;
        debugPrint(
          '[GeoPresence] publish g=$channel rid=$myUserId relays=$relays',
        );
        unawaited(
          _nostr!.publishGeoPresence(
            channel,
            nick: nick,
            rid: myUserId,
            pk: CryptoService.compactPublicKey(crypto.publicKeyPem),
          ),
        );
      }
    }

    // Mesh: sealed presence to nearby BLE peers (existing path).
    if (!_transportMode.usesMesh) return;
    final peers = _mesh?.nearbyPeers ?? const <Peer>[];
    if (peers.isEmpty) return;

    for (final peer in peers) {
      if (peer.id == myUserId || peer.publicKey.isEmpty) continue;
      try {
        final ts = DateTime.now().millisecondsSinceEpoch;
        final msg = ChatMessage(
          id: _uuid.v4(),
          senderId: myUserId,
          receiverId: peer.id,
          content: channel,
          encryptedPayload: PayloadKinds.presence,
          encryptedKey: PayloadKinds.presence,
          ttl: 2,
          timestamp: ts,
          status: MessageStatus.pending,
          type: MessageType.direct,
          payloadKind: PayloadKinds.presence,
        );
        await routeOutbound(msg);
      } catch (e) {
        debugPrint('[ResilNet] presence announce to ${peer.id} failed: $e');
      }
    }
  }

  /// Fan-out sealed 1:1 messages to every peer online in the selected area.
  /// Returns how many envelopes were queued.
  Future<int> sendAreaPublicText(
    String text, {
    String kind = PayloadKinds.areaPublic,
  }) async {
    if (!_e2eeEnabled) return 0;
    final body = text.trim();
    if (body.isEmpty) return 0;
    return _sendSealedFanOut(
      peers: peersOnlineInSelectedArea(),
      body: body,
      kind: kind,
    );
  }

  /// Fan-out sealed media/text to BLE-nearby mesh peers (same crypto as Area).
  Future<int> sendMeshPublicText(
    String text, {
    String kind = PayloadKinds.areaPublic,
  }) async {
    if (!_e2eeEnabled || !isReady) return 0;
    final body = text.trim();
    if (body.isEmpty) return 0;
    return _sendSealedFanOut(
      peers: mesh.nearbyPeers,
      body: body,
      kind: kind,
    );
  }

  Future<int> _sendSealedFanOut({
    required List<Peer> peers,
    required String body,
    required String kind,
    bool internetOnly = false,
  }) async {
    var sent = 0;
    for (final peer in peers) {
      if (peer.id == myUserId || peer.publicKey.isEmpty) continue;
      try {
        final ts = DateTime.now().millisecondsSinceEpoch;
        final pkg = crypto.encryptForRecipient(
          plaintext: body,
          receiverPublicPem: peer.publicKey,
          senderId: myUserId,
          receiverId: peer.id,
          timestamp: ts,
        );
        final msg = ChatMessage(
          id: _uuid.v4(),
          senderId: myUserId,
          receiverId: peer.id,
          encryptedPayload: pkg.encryptedPayload,
          encryptedKey: pkg.encryptedKey,
          signature: pkg.signature,
          ttl: 5,
          timestamp: ts,
          status: MessageStatus.pending,
          type: MessageType.direct,
          payloadKind: kind,
        );
        await persistChatMessage(msg);
        await routeOutbound(msg, internetOnly: internetOnly);
        sent++;
      } catch (e) {
        debugPrint('[ResilNet] sealed fan-out to ${peer.id} failed: $e');
      }
    }
    notifyListeners();
    return sent;
  }

  /// ล้างข้อความทั้งหมดในเครื่อง แล้วคืนพื้นที่ดิสก์ด้วย VACUUM
  Future<int> clearAllMessages() async {
    final deleted = await db.clearAllMessages();
    _sessionMessages.clear();
    debugPrint('[ResilNet] clearAllMessages: deleted $deleted local rows');
    notifyListeners();
    return deleted;
  }

  /// Emergency wipe covers:
  /// - SQLite messages/peers/acks, session/system lines, notices/boards/favorites prefs
  /// - board private keys in secure storage, RSA identity (regenerated)
  /// - Rust offline Nostr queue (dropped, not flushed) + ChunkArq caches
  /// - temp voice files (`resilnet_voice_*`, `resilnet_play_*`)
  /// - Nostr identity restart; radios stopped first
  /// Does not restore plaintext rooms; new keys only.
  Future<void> panicWipeLocalIdentity() async {
    final oldId = myUserIdReady ? myUserId : null;
    debugPrint('[ResilNet] panicWipeLocalIdentity start oldId=$oldId');
    await _stopRadios();

    // Drop queued sealed envelopes BEFORE any post-wipe Nostr flush.
    try {
      final n = await resilnet.clearOfflineQueuePackets();
      debugPrint('[ResilNet] panicWipe cleared offline queue n=$n');
    } catch (e) {
      debugPrint('[ResilNet] panicWipe clearOfflineQueue failed: $e');
    }
    await _deleteTempVoiceFiles();

    try {
      final meshCb = _onMeshChanged;
      if (meshCb != null) _mesh?.removeListener(meshCb);
    } catch (_) {}
    try {
      final ackH = _onAckHandlerChanged;
      if (ackH != null) _ackHandler.removeListener(ackH);
    } catch (_) {}
    try {
      final ackQ = _onAckQueueChanged;
      if (ackQ != null) _ackQueue?.removeListener(ackQ);
      _ackQueue?.dispose();
    } catch (_) {}

    await db.wipeLocalUserData();
    _sessionMessages.clear();
    _systemLines.clear();
    _notices.clear();
    _nostrPresence.clear();
    _favoritePeerIds.clear();
    _favoriteNearbyNotified.clear();
    _favoriteAreaNotified.clear();
    _bumpChatData();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kNotices);
    await prefs.remove(_kFavoritePeerIds);
    await prefs.remove(_kAnnouncementBoards);
    await prefs.remove(_kAnnouncementPosts);
    for (final id in _boardPrivateKeys.keys.toList()) {
      try {
        await _storage.delete(key: 'resilnet_board_priv_$id');
        await _storage.delete(key: 'resilnet_board_grant_$id');
      } catch (_) {}
    }
    _boards.clear();
    _boardPosts.clear();
    _boardPrivateKeys.clear();
    _pendingBoardKeyRequests.clear();
    await prefs.setBool(_kOnboardingDone, false);
    _onboardingCompleted = false;

    try {
      await _storage.delete(key: _kDisplayName);
    } catch (_) {}
    _displayName = '';

    await crypto.wipeAndRegenerate();

    _ackHandler = AckHandlerService(
      database: db,
      myUserId: crypto.myUserId,
    );
    _onAckHandlerChanged = () {
      _bumpChatData();
      notifyListeners();
    };
    _ackHandler.addListener(_onAckHandlerChanged!);

    _ackQueue = AckQueueManager(
      database: db,
      myUserId: crypto.myUserId,
      isHighSpeedTransport: () =>
          resilnet.isInternetAvailable || resilnet.isGatewayWifiActive,
      sendAckBatch: _sendAckBatch,
    );
    await _ackQueue!.restoreFromDatabase();
    _onAckQueueChanged = notifyListeners;
    _ackQueue!.addListener(_onAckQueueChanged!);

    _mesh = BleMeshService(
      database: db,
      myUserId: crypto.myUserId,
      crypto: crypto,
      resilnet: resilnet,
      ackQueue: _ackQueue,
      ackHandler: _ackHandler,
      shouldPersistHistory: () => _saveMessageHistory,
      onEphemeralMessage: _rememberSessionMessage,
    );
    _onMeshChanged = () {
      _onMeshPeersChanged();
      _scheduleMeshUiNotify();
    };
    _mesh!.addListener(_onMeshChanged!);

    try {
      await _nostr?.wipeIdentityAndRestart();
      _attachGeoPresenceListener();
    } catch (e) {
      debugPrint('[ResilNet] panicWipe nostr restart failed: $e');
    }

    notifyListeners();
    debugPrint(
      '[ResilNet] panicWipeLocalIdentity done oldId=$oldId newId=${crypto.myUserId}',
    );
  }

  Future<void> _deleteTempVoiceFiles() async {
    try {
      final dir = await getTemporaryDirectory();
      await for (final entity in dir.list()) {
        final name = entity.uri.pathSegments.isNotEmpty
            ? entity.uri.pathSegments.last
            : '';
        if (name.startsWith('resilnet_voice_') ||
            name.startsWith('resilnet_play_')) {
          try {
            await entity.delete();
          } catch (_) {}
        }
      }
    } catch (e) {
      debugPrint('[ResilNet] temp voice wipe failed: $e');
    }
  }

  /// ส่งข้อความออกผ่าน Rust Hybrid Router แล้ว fan-out ตาม transports
  ///
  /// Privacy: [msg] must already be sealed (RSA-OAEP + AES-GCM). The router and
  /// transports only see opaque bytes — plaintext must not be persisted in [msg.content].
  /// Exception: [PayloadKinds.presence] carries a truncated geohash cell for Area UX
  /// and is never written to chat history.
  Future<RoutedPacketDto> routeOutbound(
    ChatMessage msg, {
    bool internetOnly = false,
  }) async {
    final isPresence = msg.payloadKind == PayloadKinds.presence;
    final piggyback = isPresence
        ? const <AckEntry>[]
        : (_ackQueue?.drainPiggybackFor(msg.receiverId) ?? const <AckEntry>[]);
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

    if (isPresence) {
      // Presence is fire-and-forget metadata — skip chat persistence.
      unawaited(_mesh?.sendDirectNow(msg));
      if (resilnet.isGatewayWifiActive) {
        unawaited(_udp?.sendDirectNow(msg));
      }
      return routed;
    }

    var transports = _applyBridgePolicy(
      routed.transports.isNotEmpty
          ? routed.transports
          : <TransportTypeDto>[routed.transport],
    );
    if (internetOnly) {
      transports = transports
          .where(
            (t) =>
                t == TransportTypeDto.nostr ||
                t == TransportTypeDto.offlineQueue,
          )
          .toList();
      if (transports.isEmpty) {
        transports = const [TransportTypeDto.nostr];
      }
    }

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
          if (internetOnly) continue;
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
            await db.saveMessage(
              msg.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.pending,
              ),
            );
          } else {
            await persistChatMessage(
              msg.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.pending,
              ),
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

      final accepted = await mesh.applyIncomingFromRouter(msg);
      if (!accepted) return;
      if (msg.payloadKind != PayloadKinds.presence) {
        _bumpChatData();
      }
      if (msg.payloadKind == PayloadKinds.boardKeyRequest ||
          msg.payloadKind == PayloadKinds.boardKeyGrant) {
        unawaited(_handleBoardKeyControlMessage(msg));
      }
      if (msg.payloadKind == PayloadKinds.boardPost) {
        unawaited(_handleBoardPostSyncMessage(msg));
      }
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
    _bumpChatData();
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

  /// Re-check permissions and start BLE mesh if allowed.
  Future<void> ensureBleRadiosStarted() async {
    await refreshPermissions();
    if (_permissionsGranted && !_radioPaused && isReady) {
      try {
        if (!(_mesh?.running ?? false)) {
          await _startRadios();
        }
      } catch (e) {
        debugPrint('[ResilNet] ensureBleRadiosStarted failed: $e');
      }
    }
    notifyListeners();
  }

  Future<bool> requestPermissions() async {
    if (!isReady) return false;
    final mesh = await _meshPermissions();
    final needed = <Permission>[...mesh, Permission.microphone];
    debugPrint(
      '[ResilNet] requestPermissions: asking ${needed.map((p) => p.toString()).join(', ')}',
    );
    final result = await needed.request();
    for (final entry in result.entries) {
      debugPrint('[ResilNet] permission ${entry.key} => ${entry.value}');
    }
    // BLE mesh starts when radio permissions are granted; mic is optional here.
    _permissionsGranted = mesh.every((p) {
      final status = result[p];
      return status != null && (status.isGranted || status.isLimited);
    });
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
    final needed = await _meshPermissions();
    for (final p in needed) {
      final status = await p.status;
      debugPrint('[ResilNet] check $p => $status');
      // iOS bluetooth บางเวอร์ชันคืน limited/restricted ตอนยังไม่เคยขอ
      if (!(status.isGranted || status.isLimited)) return false;
    }
    return true;
  }

  Future<List<Permission>> _meshPermissions() async {
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
    _meshUiNotifyDebounce?.cancel();
    screenshots.removeListener(_onScreenshot);
    screenshots.dispose();
    _retentionTimer?.cancel();
    _stopGeoPresencePublishTimer();
    unawaited(_geoPresenceSub?.cancel());
    unawaited(_clearNostrGeoSubscription());
    _rustIncomingSub?.cancel();

    final meshCb = _onMeshChanged;
    if (meshCb != null) _mesh?.removeListener(meshCb);
    final espCb = _onEsp32Changed;
    if (espCb != null) _esp32?.removeListener(espCb);
    final udpCb = _onUdpChanged;
    if (udpCb != null) _udp?.removeListener(udpCb);
    final nostrCb = _onNostrChanged;
    if (nostrCb != null) _nostr?.removeListener(nostrCb);
    final ackH = _onAckHandlerChanged;
    if (ackH != null) {
      try {
        _ackHandler.removeListener(ackH);
      } catch (_) {}
    }
    final ackQ = _onAckQueueChanged;
    if (ackQ != null) _ackQueue?.removeListener(ackQ);
    final flushCb = _onResilnetFlush;
    if (flushCb != null) resilnet.removeListener(flushCb);
    final uiCb = _onResilnetUi;
    if (uiCb != null) resilnet.removeListener(uiCb);

    unawaited(_stopRadios());
    _ackQueue?.dispose();
    _udp?.dispose();
    resilnet.dispose();
    super.dispose();
  }
}

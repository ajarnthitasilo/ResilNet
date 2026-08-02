import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../core/resilnet_protocol.dart';
import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_ack_codec.dart';
import '../core/board_invite_wire.dart';
import '../core/bulletin_wire.dart';
import '../core/direct_message_notify.dart';
import '../core/geohash.dart';
import '../core/identity_invite_wire.dart';
import '../core/media_part_codec.dart';
import '../core/meshtastic_bridge_core.dart';
import '../core/notice_wire.dart';
import '../core/payload_kinds.dart';
import '../core/peer_id.dart';
import '../core/platform_caps.dart';
import '../models/area_presence.dart';
import '../models/ble_radio_state.dart';
import '../models/ack_entry.dart';
import '../models/announcement_board.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../models/geo_discovery.dart';
import '../models/geo_location_result.dart';
import '../models/local_notice.dart';
import '../models/mesh_retention.dart';
import '../models/notice_expiry.dart';
import '../models/peer.dart';
import '../models/push_signal.dart';
import '../models/transport_mode.dart';
import '../services/ack_handler_service.dart';
import '../services/ack_queue_manager.dart';
import '../services/ble_mesh_service.dart';
import '../services/crypto_service.dart';
import '../services/database_service.dart';
import '../services/esp32_sync_service.dart';
import '../services/firmware_service.dart';
import '../services/geo_service.dart';
import '../services/meshtastic_bridge_service.dart';
import '../services/notification_service.dart';
import '../services/nostr_sync_service.dart';
import '../services/resilnet_packet_codec.dart';
import '../services/resilnet_service.dart';
import '../services/secure_kv.dart';
import '../services/screenshot_watch_service.dart';
import '../services/udp_transport_service.dart';
import '../src/rust/api/dto.dart';

class AppState extends ChangeNotifier {
  final crypto = CryptoService();
  final db = DatabaseService();
  final resilnet = ResilNetService();
  final _storage = resilnetSecureKv;
  final notifications = NotificationService();
  final screenshots = ScreenshotWatchService();

  BleMeshService? _mesh;
  Esp32SyncService? _esp32;
  UdpTransportService? _udp;
  NostrSyncService? _nostr;
  FirmwareService? _firmware;
  MeshtasticBridgeService? _meshtasticBridge;
  VoidCallback? _onMeshtasticBridgeChanged;
  late AckHandlerService _ackHandler;
  AckQueueManager? _ackQueue;
  StreamSubscription<MessagePacketDto>? _rustIncomingSub;
  AppLifecycleState _lifecycleState = AppLifecycleState.resumed;
  Timer? _retentionTimer;
  Timer? _meshUiNotifyDebounce;
  Timer? _radioUiNotifyDebounce;
  DateTime _lastPresenceAnnounce = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime _lastGeoRefreshAttempt = DateTime.fromMillisecondsSinceEpoch(0);
  final _uuid = const Uuid();
  final _mediaParts = MediaPartAssembler();
  final String _sessionId = DateTime.now().microsecondsSinceEpoch.toString();
  int _opSeq = 0;
  bool _initStarted = false;
  Future<void>? _initInFlight;
  bool _resumingLifecycle = false;
  bool _reconnectingRadios = false;
  bool _reconnectingNostr = false;
  bool _startingRadios = false;
  bool _stoppingRadios = false;
  DateTime _lastResumeAt = DateTime.fromMillisecondsSinceEpoch(0);
  DateTime? _backgroundedAt;

  VoidCallback? _onAckHandlerChanged;
  VoidCallback? _onAckQueueChanged;
  VoidCallback? _onResilnetFlush;
  VoidCallback? _onResilnetUi;
  VoidCallback? _onEsp32Changed;
  VoidCallback? _onUdpChanged;
  VoidCallback? _onNostrChanged;
  VoidCallback? _onMeshChanged;

  AppLifecycleState get lifecycleState => _lifecycleState;

  String _nextOpId(String scope) => '$scope-${++_opSeq}';

  FirmwareService get firmware {
    final f = _firmware;
    if (f == null) throw StateError('FirmwareService not initialized');
    return f;
  }

  /// Text-only Meshtastic ↔ ResilNet bridge (not E2EE). Null until [init].
  MeshtasticBridgeService? get meshtasticBridge => _meshtasticBridge;

  MeshtasticBridgeMode get meshtasticBridgeMode =>
      _meshtasticBridge?.mode ?? MeshtasticBridgeMode.off;

  static const _kMeshtasticBridgeMode = 'resilnet_meshtastic_bridge_mode';
  static const _kMeshtasticRelayToMesh = 'resilnet_meshtastic_relay_to_mesh';
  static const _kMeshtasticUseMqtt = 'resilnet_meshtastic_use_mqtt';
  static const _kMeshtasticMqttHost = 'resilnet_meshtastic_mqtt_host';
  static const _kMeshtasticMqttPort = 'resilnet_meshtastic_mqtt_port';
  static const _kMeshtasticMqttTopicIn = 'resilnet_meshtastic_mqtt_topic_in';
  static const _kMeshtasticMqttTopicOut = 'resilnet_meshtastic_mqtt_topic_out';
  static const _kMeshtasticMqttUser = 'resilnet_meshtastic_mqtt_user';
  static const _kMeshtasticMqttPass = 'resilnet_meshtastic_mqtt_pass';
  static const _kMeshtasticMqttUseTls = 'resilnet_meshtastic_mqtt_use_tls';
  static const _kMeshtasticMqttAutoReconnect =
      'resilnet_meshtastic_mqtt_auto_reconnect';
  static const _kMeshtasticMqttGatewayFrom =
      'resilnet_meshtastic_mqtt_gateway_from';
  static const _kMeshtasticMqttChannelIndex =
      'resilnet_meshtastic_mqtt_channel_index';
  static const _kMeshtasticMqttRegion = 'resilnet_meshtastic_mqtt_region';
  static const _kMeshtasticMqttRoot = 'resilnet_meshtastic_mqtt_root';
  static const _kMeshtasticMqttDownlinkCh =
      'resilnet_meshtastic_mqtt_downlink_ch';

  bool _meshtasticRelayToMesh = false;
  bool get meshtasticRelayToMesh => _meshtasticRelayToMesh;

  bool _meshtasticMqttPasswordStored = false;
  /// True when a MQTT password is kept in secure storage (value never echoed).
  bool get meshtasticMqttPasswordStored => _meshtasticMqttPasswordStored;

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

  /// Local-only contact aliases (device-only nicknames keyed by peer id).
  final Map<String, String> _contactAliases = <String, String>{};

  /// Bumped when aliases change so list FutureBuilders can be keyed if needed.
  int _contactAliasEpoch = 0;
  int get contactAliasEpoch => _contactAliasEpoch;

  String? contactAlias(String peerId) {
    final id = peerId.trim();
    if (id.isEmpty) return null;
    final a = _contactAliases[id];
    if (a == null || a.isEmpty) return null;
    return a;
  }

  /// UI label: local alias → [fallbackNick] → short peer id.
  String peerDisplayLabel(String peerId, {String? fallbackNick}) {
    final id = peerId.trim();
    final alias = contactAlias(id);
    if (alias != null && alias.isNotEmpty) {
      return peerListLabel(aliasOrNick: alias, id: id);
    }
    return peerListLabel(aliasOrNick: fallbackNick, id: id);
  }

  Future<void> _loadContactAliases() async {
    final map = await db.getAllContactAliases();
    _contactAliases
      ..clear()
      ..addAll(map);
  }

  /// Persist a device-local nickname and refresh listeners immediately.
  Future<void> setContactAlias({
    required String publicKeyHash,
    required String aliasName,
  }) async {
    final id = publicKeyHash.trim();
    if (id.isEmpty) return;
    final alias = aliasName.trim();
    await db.setContactAlias(publicKeyHash: id, aliasName: alias);
    if (alias.isEmpty) {
      _contactAliases.remove(id);
    } else {
      _contactAliases[id] = alias;
    }
    _contactAliasEpoch++;
    notifyListeners();
  }

  AreaPresenceEntry _withLocalAlias(AreaPresenceEntry e) {
    final alias = contactAlias(e.id);
    if (alias == null) return e;
    return AreaPresenceEntry(
      id: e.id,
      label: peerListLabel(aliasOrNick: alias, id: e.id),
      source: e.source,
      geohash: e.geohash,
      lastSeen: e.lastSeen,
      peer: e.peer,
    );
  }

  static const _kNotificationsEnabled = 'resilnet_notifications_enabled';
  bool _notificationsEnabled = true;
  bool get notificationsEnabled => _notificationsEnabled;

  /// Peer id of the open 1:1 [ChatScreen], if any (suppresses DM banners).
  String? _activeChatPeerId;
  String? get activeChatPeerId => _activeChatPeerId;

  void setActiveChatPeerId(String? peerId) {
    final next = peerId?.trim();
    _activeChatPeerId = (next == null || next.isEmpty) ? null : next;
  }

  final Set<String> _directNotifyDedup = {};
  static const _maxDirectNotifyDedup = 512;

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

  /// Pinned #location / area channels (`mesh` or geohash without `#`).
  static const _kPinnedLocationChannels = 'resilnet_pinned_location_channels';
  static const pinnedMeshChannelId = 'mesh';
  static const _maxPinnedLocationChannels = 12;
  final List<String> _pinnedLocationChannels = <String>[];
  List<String> get pinnedLocationChannels =>
      List.unmodifiable(_pinnedLocationChannels);

  /// Pinned feed tabs (directs / mesh / geo) — shown first in the picker.
  static const _kPinnedFeedChannels = 'resilnet_pinned_feed_channels';
  final List<String> _pinnedFeedChannels = <String>[];
  List<String> get pinnedFeedChannels => List.unmodifiable(_pinnedFeedChannels);

  /// Dedupe window for "someone came online" local notifications (any peer).
  final Set<String> _peerOnlineNotified = <String>{};

  /// noticeId → peerIds already fan-out (late-join catch-up).
  final Map<String, Set<String>> _noticeDeliveredTo = {};
  /// noticeId → BLE deviceIds already catch-up delivered.
  final Map<String, Set<String>> _noticeDeliveredToDevice = {};
  String? _lastNoticePublishWarning;
  String? get lastNoticePublishWarning => _lastNoticePublishWarning;

  /// How many BLE radios accepted the last #mesh bulletin fan-out (0 = none).
  int _lastBulletinBleSent = 0;
  int get lastBulletinBleSent => _lastBulletinBleSent;
  Timer? _bulletinCatchUpDebounce;
  Future<void>? _bulletinCatchUpInFlight;
  int _lastPresenceSummaryMesh = -1;
  int _lastPresenceSummaryNostr = -1;
  Timer? _presenceSummaryDebounce;

  static const _kNostrExpiryDays = 'resilnet_nostr_expiry_days';
  NoticeExpiry _nostrExpiry = NoticeExpiry.sevenDays;
  NoticeExpiry get nostrExpiry => _nostrExpiry;

  static const _kNotices = 'resilnet_local_notices';
  static const _kBulletinWires = 'resilnet_bulletin_wires';
  final List<LocalNotice> _notices = <LocalNotice>[];

  /// Raw signed wire ของ public bulletin (คีย์ = bulletinId) — เก็บไว้เพื่อ
  /// rebroadcast/catch-up และ push เข้า ESP32 โดยไม่ต้องเซ็นใหม่.
  final Map<String, String> _bulletinWires = {};
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

  List<AnnouncementBoard> get announcementBoards => List.unmodifiable(_boards);
  List<AnnouncementPost> postsForBoard(String boardId) =>
      _boardPosts.where((p) => p.boardId == boardId).toList()
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

  /// Unread inbound 1:1 DM count (home envelope badge).
  int _unreadDirectCount = 0;
  int get unreadDirectCount => _unreadDirectCount;

  void _bumpChatData() {
    _chatDataEpoch++;
    unawaited(refreshUnreadDirectCount());
  }

  /// Recount unread private DMs (SQLite + ephemeral session).
  Future<void> refreshUnreadDirectCount() async {
    if (!myUserIdReady) {
      if (_unreadDirectCount != 0) {
        _unreadDirectCount = 0;
        notifyListeners();
      }
      return;
    }
    var n = 0;
    if (_saveMessageHistory) {
      n = await db.countUnreadIncomingDirectMessages(myUserId);
    }
    for (final m in _sessionMessages) {
      if (m.receiverId != myUserId) continue;
      if (m.type != MessageType.direct) continue;
      if (!PayloadKinds.isPrivateDm(m.payloadKind)) continue;
      if (m.status != MessageStatus.sent &&
          m.status != MessageStatus.delivered) {
        continue;
      }
      n++;
    }
    if (_unreadDirectCount == n) return;
    _unreadDirectCount = n;
    notifyListeners();
  }

  static const _kOnboardingDone = 'resilnet_onboarding_done';
  static const _kOnboardingDoneSecure = 'resilnet_onboarding_done';
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
  static const _kManualGeohash = 'resilnet_manual_geohash';
  static const _kCachedGeohash = 'resilnet_cached_geohash';

  FeedChannel _feedChannel = FeedChannel.geo;
  FeedChannel get feedChannel => _feedChannel;

  GeoPrecision _geoPrecision = GeoPrecision.region;
  GeoPrecision get geoPrecision => _geoPrecision;

  TransportMode _transportMode = TransportMode.auto;
  TransportMode get transportMode => _transportMode;

  /// Anonymous Nostr presence sightings keyed by pubkey hex.
  final Map<String, NostrPresenceSighting> _nostrPresence = {};
  StreamSubscription<GeoPresenceDto>? _geoPresenceSub;
  StreamSubscription<GeoNoticeDto>? _geoNoticeSub;
  Timer? _geoPresencePublishTimer;
  bool _noticesBackfilling = false;
  bool get noticesBackfilling => _noticesBackfilling;
  int _lastNoticeBackfillCount = 0;
  int get lastNoticeBackfillCount => _lastNoticeBackfillCount;
  DateTime? _lastNoticeBackfillAt;
  DateTime? get lastNoticeBackfillAt => _lastNoticeBackfillAt;
  final Set<String> _seenNostrNoticeEvents = <String>{};

  String? _currentGeohash;
  String? get currentGeohash => _currentGeohash;
  bool _geoRefreshing = false;
  bool get geoRefreshing => _geoRefreshing;
  GeoLocationStatus _geoLocationStatus = GeoLocationStatus.unavailable;
  GeoLocationStatus get geoLocationStatus => _geoLocationStatus;
  bool get geoNeedsPermission =>
      _geoLocationStatus == GeoLocationStatus.needsPermission;
  bool get geoIsManual => _geoLocationStatus == GeoLocationStatus.manual;
  String? _geoError;
  String? get geoError => _geoError;

  /// IRC-style label for the active geo channel (empty when unknown).
  String get geoChannelLabel {
    final h = _currentGeohash;
    if (h == null || h.isEmpty) return Geohash.channelLabel('');
    return Geohash.channelLabel(Geohash.atPrecision(h, _geoPrecision));
  }

  bool get isReady =>
      _mesh != null && _esp32 != null && _nostr != null && _firmware != null;

  /// สถานะรวมของระบบซิงก์ (BLE mesh + Nostr). ESP32 node scan is secondary.
  SyncPhase get syncPhase {
    final e = _esp32;
    final n = _nostr;
    if (e == null || n == null) return SyncPhase.idle;
    if (_radioPaused) return SyncPhase.idle;
    if (e.phase == SyncPhase.syncing) return SyncPhase.syncing;
    if (n.phase == SyncPhase.cloudSync) return SyncPhase.cloudSync;
    // Do not surface ESP32 "scanning for nodes" as the primary mesh status —
    // that label made users think phone↔phone discovery was broken.
    return SyncPhase.idle;
  }

  void markInitFailed(String message) {
    _initError = message;
    _initDone = true;
    notifyListeners();
  }

  Future<void> retryInit() async {
    debugPrint('[Init] retry requested session=$_sessionId');
    _initDone = false;
    _initError = null;
    _initStarted = false;
    notifyListeners();
    try {
      await init(reason: 'retryInit', force: true);
      if (_initError != null) {
        markInitFailed(_initError!);
      }
    } catch (e, st) {
      debugPrint('[ResilNet] retryInit failed: $e\n$st');
      markInitFailed(e.toString());
    }
  }

  /// Explicit recovery path for boot failure:
  /// wipe local identity/data and reinitialize app services.
  Future<void> recoverFromBootFailure() async {
    debugPrint('[Init] recoverFromBootFailure start session=$_sessionId');
    _initDone = false;
    _initError = null;
    notifyListeners();
    try {
      await panicWipeLocalIdentity();
      await init(reason: 'recoverFromBootFailure', force: true);
      if (_initError != null) {
        throw StateError(_initError!);
      }
      debugPrint('[Init] recoverFromBootFailure success');
    } catch (e, st) {
      debugPrint('[ResilNet] recoverFromBootFailure failed: $e\n$st');
      markInitFailed(e.toString());
      rethrow;
    }
  }

  Future<void> init({String reason = 'launch', bool force = false}) async {
    if (_initInFlight != null) {
      debugPrint('[Init] join in-flight reason=$reason session=$_sessionId');
      return _initInFlight!;
    }
    if (_initStarted && !force) {
      debugPrint(
        '[Init] skip already-started reason=$reason session=$_sessionId',
      );
      return;
    }
    _initStarted = true;
    final initOp = _nextOpId('init');
    final runner = _runInit(reason: reason, initOp: initOp);
    _initInFlight = runner;
    try {
      await runner;
    } finally {
      _initInFlight = null;
    }
  }

  Future<void> _runInit({
    required String reason,
    required String initOp,
  }) async {
    final startedAt = DateTime.now();
    debugPrint('[Session] appStart id=$_sessionId');
    debugPrint(
      '[Init] start op=$initOp reason=$reason at=${startedAt.toIso8601String()} session=$_sessionId',
    );
    _initError = null;
    try {
      await db.init();
      try {
        await crypto.init(
          readExpectedUserId: db.getIdentityUserId,
          writeExpectedUserId: db.setIdentityUserId,
          hasLocalUserData: db.hasAnyLocalUserData,
        );
      } on IdentityUnavailableException catch (e) {
        debugPrint('[ResilNet] identity unavailable (no mint): $e');
        _initError = e.toString();
        return;
      }

      // เริ่ม Rust Hybrid Router ผ่าน FFI
      await resilnet.initialize();
      await resilnet.subscribeIncoming();
      await _attachRustIncomingHandler();

      _ackHandler = _buildAckHandler();
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
      // Debounce ACK UI ticks — queue churn must not rebuild the whole tree.
      _onAckQueueChanged = _scheduleRadioUiNotify;
      _ackQueue!.addListener(_onAckQueueChanged!);

      _onResilnetFlush = () {
        if (resilnet.isInternetAvailable || resilnet.isGatewayWifiActive) {
          _ackQueue?.onTransportUpgraded();
          unawaited(_nostr?.flushOfflineQueue());
        }
      };
      resilnet.addListener(_onResilnetFlush!);

      try {
        await notifications.init();
        unawaited(notifications.requestPermissions(reason: 'init'));
      } catch (e) {
        // Never block boot on notification plugin setup (esp. macOS).
        debugPrint('[ResilNet] notifications init soft-fail: $e');
      }

      _mesh = BleMeshService(
        database: db,
        myUserId: crypto.myUserId,
        crypto: crypto,
        resilnet: resilnet,
        ackQueue: _ackQueue,
        ackHandler: _ackHandler,
        shouldPersistHistory: () => _saveMessageHistory,
        onEphemeralMessage: _rememberSessionMessage,
        onBulletinMessage: _onBulletinMessage,
        onLinkReady: _onBleLinkReadyForBulletins,
      );
      _syncMeshIdentity();
      _esp32 = Esp32SyncService(
        database: db,
        crypto: crypto,
        outgoingBulletins: _bulletinsForEsp32,
        onBulletin: (raw) => ingestBulletinRaw(raw, via: 'esp32'),
      );
      _udp = UdpTransportService(database: db, resilnet: resilnet);
      resilnet.attachUdpTransport(_udp!, crypto: crypto);
      _firmware = FirmwareService();
      await _firmware!.refreshLocalInfo();

      _nostr = NostrSyncService();
      final nostrOk = await _nostr!.start();
      if (nostrOk) {
        _attachGeoPresenceListener();
      } else {
        debugPrint(
          '[ResilNet] Nostr start failed (will retry on reconnect): '
          '${_nostr!.lastError}',
        );
      }

      _onEsp32Changed = _scheduleRadioUiNotify;
      _onUdpChanged = _scheduleRadioUiNotify;
      _onNostrChanged = _scheduleRadioUiNotify;
      _onMeshChanged = () {
        _onMeshPeersChanged();
        _scheduleMeshUiNotify();
      };
      _esp32!.addListener(_onEsp32Changed!);
      _udp!.addListener(_onUdpChanged!);
      _nostr!.addListener(_onNostrChanged!);
      _mesh!.addListener(_onMeshChanged!);

      resilnet.startNetworkMonitoring(
        blePeerCount: () => _mesh?.nearbyPeerCount ?? 0,
      );
      _onResilnetUi = () {
        if (resilnet.isInternetAvailable) {
          unawaited(_nostr?.flushOfflineQueue());
        }
        _scheduleRadioUiNotify();
      };
      resilnet.addListener(_onResilnetUi!);

      var storedName = await _storage.read(key: _kDisplayName);
      final prefs = await SharedPreferences.getInstance();
      // SharedPreferences mirror — Keychain write can fail silently on some
      // iOS builds; prefs keep the display name recoverable.
      if (storedName == null || storedName.trim().isEmpty) {
        storedName = prefs.getString(_kDisplayName);
      }
      if (storedName != null) {
        final trimmed = storedName.trim();
        if (isLegacyDefaultDisplayName(trimmed)) {
          await _storage.delete(key: _kDisplayName);
          await prefs.remove(_kDisplayName);
        } else if (trimmed.isNotEmpty) {
          _displayName = trimmed;
        }
      }
      _notificationsEnabled = prefs.getBool(_kNotificationsEnabled) ?? true;
      _saveMessageHistory = prefs.getBool(_kSaveMessageHistory) ?? true;
      _meshRetention = MeshRetention.fromDays(
        prefs.getInt(_kMeshRetentionDays),
      );
      _e2eeEnabled = true;
      // Legacy preference may be false; force-on so send paths never soft-lock.
      if (prefs.getBool(_kE2eeEnabled) == false) {
        await prefs.setBool(_kE2eeEnabled, true);
      }
      _screenshotAlerts = prefs.getBool(_kScreenshotAlerts) ?? true;
      _meshBridgeEnabled = prefs.getBool(_kMeshBridgeEnabled) ?? true;
      _loadFavorites(prefs);
      _loadPinnedChannels(prefs);
      _nostrExpiry = NoticeExpiry.fromDays(prefs.getInt(_kNostrExpiryDays));
      _loadNotices(prefs);
      await _loadAnnouncementBoards(prefs);
      await _loadContactAliases();
      _onboardingCompleted = prefs.getBool(_kOnboardingDone) ?? false;
      if (!_onboardingCompleted) {
        await _restoreOnboardingIfReturningUser(prefs);
      }
      final loc = prefs.getString(_kLocaleOverride);
      _localeOverrideCode = (loc == null || loc.isEmpty || loc == 'system')
          ? null
          : loc;
      _feedChannel = FeedChannel.values.firstWhere(
        (e) => e.name == prefs.getString(_kFeedChannel),
        orElse: () => FeedChannel.geo,
      );
      _geoPrecision = GeoPrecision.values.firstWhere(
        (e) => e.name == prefs.getString(_kGeoPrecision),
        orElse: () => GeoPrecision.region,
      );
      _transportMode = TransportMode.fromName(prefs.getString(_kTransportMode));

      final mtCb = _onMeshtasticBridgeChanged;
      if (mtCb != null) {
        _meshtasticBridge?.removeListener(mtCb);
      }
      _meshtasticBridge?.dispose();
      _meshtasticBridge = MeshtasticBridgeService(
        onIngest: (event) => ingestMeshtasticText(event),
      );
      _onMeshtasticBridgeChanged = () {
        if (!_initDone) return;
        notifyListeners();
      };
      _meshtasticBridge!.addListener(_onMeshtasticBridgeChanged!);
      await _meshtasticBridge!.setMode(
        MeshtasticBridgeModeX.fromPrefs(prefs.getString(_kMeshtasticBridgeMode)),
      );
      _meshtasticRelayToMesh = prefs.getBool(_kMeshtasticRelayToMesh) ?? false;
      final useMqtt = prefs.getBool(_kMeshtasticUseMqtt) ?? false;
      _meshtasticBridge!.setUseMqtt(useMqtt);
      await _applyMeshtasticMqttConfigFromPrefs(prefs);
      final storedPass = await _storage.read(key: _kMeshtasticMqttPass);
      _meshtasticMqttPasswordStored =
          storedPass != null && storedPass.isNotEmpty;

      _restoreStoredGeohash(prefs);
      await _applyBootstrapGeohashIfNeeded(prefs);
      if (_currentGeohash != null &&
          _currentGeohash!.isNotEmpty &&
          _transportMode.usesInternet) {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }

      // Keep Area discovery alive in background (not only while on geo feed).
      if (_transportMode.usesInternet) {
        unawaited(refreshGeohash());
      } else if (_feedChannel == FeedChannel.geo) {
        unawaited(refreshGeohash());
      }

      // ตรวจสิทธิ์ที่มีอยู่แล้ว (ไม่ขึ้น dialog) แล้วค่อยสตาร์ท radio
      _permissionsGranted = await _hasAllRequiredPermissions();
      if (_permissionsGranted) {
        unawaited(_startRadios(reason: 'init-ready'));
      }
      _startRetentionTimer();
      unawaited(purgeExpiredMessages());
      unawaited(_startScreenshotWatch());
      unawaited(refreshUnreadDirectCount());
      debugPrint(
        '[Init] services ready op=$initOp in ${DateTime.now().difference(startedAt).inMilliseconds}ms',
      );
    } finally {
      _initDone = true;
      if (_initError != null) {
        debugPrint('[Init] end op=$initOp status=error error=$_initError');
      } else {
        debugPrint('[Init] end op=$initOp status=ok');
      }
      notifyListeners();
    }
  }

  /// Returning user heuristics when prefs flag was lost (e.g. reinstall).
  /// Panic wipe clears keychain identity + secure flag so intro still shows.
  Future<void> _restoreOnboardingIfReturningUser(
    SharedPreferences prefs,
  ) async {
    try {
      final secureDone =
          (await _storage.read(key: _kOnboardingDoneSecure))?.trim() == '1';
      if (secureDone) {
        await _persistOnboardingDone(prefs);
        debugPrint('[ResilNet] onboarding restored from keychain flag');
        return;
      }
    } catch (e) {
      debugPrint('[ResilNet] onboarding secure read failed: $e');
    }

    final existingPeers = await db.getAllPeers(limit: 1);
    final hasMessages = await db.hasAnyMessages();
    final restoredIdentity = crypto.restoredFromKeychain;
    if (existingPeers.isNotEmpty ||
        _displayName.isNotEmpty ||
        hasMessages ||
        restoredIdentity) {
      await _persistOnboardingDone(prefs);
      debugPrint(
        '[ResilNet] onboarding restored '
        '(peers=${existingPeers.isNotEmpty} name=${_displayName.isNotEmpty} '
        'msgs=$hasMessages identity=$restoredIdentity)',
      );
    }
  }

  Future<void> _persistOnboardingDone(SharedPreferences prefs) async {
    _onboardingCompleted = true;
    await prefs.setBool(_kOnboardingDone, true);
    try {
      await _storage.write(key: _kOnboardingDoneSecure, value: '1');
    } catch (e) {
      debugPrint('[ResilNet] onboarding secure write failed: $e');
    }
  }

  void _loadNotices(SharedPreferences prefs) {
    _notices.clear();
    _bulletinWires.clear();
    final raw = prefs.getString(_kNotices);
    if (raw != null && raw.isNotEmpty) {
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
    final rawWires = prefs.getString(_kBulletinWires);
    if (rawWires != null && rawWires.isNotEmpty) {
      try {
        final map = jsonDecode(rawWires) as Map<String, dynamic>;
        final activeIds = _notices.map((n) => n.id).toSet();
        map.forEach((id, wire) {
          if (wire is String && activeIds.contains(id)) {
            _bulletinWires[id] = wire;
          }
        });
      } catch (e) {
        debugPrint('[ResilNet] load bulletin wires failed: $e');
      }
    }
  }

  Future<void> _persistNotices() async {
    final prefs = await SharedPreferences.getInstance();
    final active = _notices.where((n) => !n.isExpired).toList();
    await prefs.setString(
      _kNotices,
      jsonEncode(active.map((n) => n.toJson()).toList()),
    );
    final activeIds = active.map((n) => n.id).toSet();
    _bulletinWires.removeWhere((id, _) => !activeIds.contains(id));
    await prefs.setString(_kBulletinWires, jsonEncode(_bulletinWires));
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
    // QR / paste: prefer HTTPS go-link (short wrapper on docs site).
    return encodeBoardInviteHttpsLink(board);
  }

  String boardInviteDeepLink(AnnouncementBoard board) {
    return encodeBoardInviteDeepLink(board);
  }

  String boardInviteHttpsLink(AnnouncementBoard board) {
    return encodeBoardInviteHttpsLink(board);
  }

  /// ข้อความเชิญที่อ่านง่าย + HTTPS short link (สำหรับคัดลอก/แชร์)
  String boardInviteShareText(
    AnnouncementBoard board, {
    required String Function(String title) preamble,
  }) {
    return encodeBoardInviteShareText(board: board, preamble: preamble);
  }

  /// รับคำเชิญทุกรูปแบบ: compact JSON, legacy PEM JSON, deep link, ข้อความแชร์
  Future<AnnouncementBoard?> followBoardFromInviteAny(String raw) async {
    final data = parseBoardInvite(raw);
    if (data == null || data.id.isEmpty || data.publicKeyPem.isEmpty) {
      return null;
    }
    await followAnnouncementBoard(data.toBoard());
    return boardById(data.id) ?? data.toBoard();
  }

  /// Backward-compatible alias
  Future<bool> followBoardFromInviteJson(String raw) async {
    final board = await followBoardFromInviteAny(raw);
    return board != null;
  }

  /// คำเชิญจาก deep link ที่รอให้ผู้ใช้ยืนยัน (cold/warm start)
  AnnouncementBoard? _pendingBoardInvite;
  AnnouncementBoard? get pendingBoardInvite => _pendingBoardInvite;

  void clearPendingBoardInvite() {
    if (_pendingBoardInvite == null) return;
    _pendingBoardInvite = null;
    notifyListeners();
  }

  /// Ingest URI จาก app_links — ตั้ง pending ให้ UI ถามยืนยัน
  bool ingestBoardInviteUri(Uri uri) {
    final data = parseBoardInviteDeepLink(uri);
    if (data == null) return false;
    _pendingBoardInvite = data.toBoard();
    notifyListeners();
    debugPrint(
      '[BoardInvite] pending from deep link title=${data.title} id=${data.id}',
    );
    return true;
  }

  // --- Peer / identity invite (QR / deep link / paste) ---

  String identityInvitePayload({String? displayName}) {
    // QR: HTTPS go-link (preferred share/scan surface).
    return encodeIdentityInviteHttpsLink(
      id: myUserId,
      publicKeyPem: crypto.publicKeyPem,
      name: displayName ?? this.displayName,
    );
  }

  /// Compact JSON (legacy QR / paste). Prefer [identityInvitePayload] for new QR.
  String identityInviteJsonPayload({String? displayName}) {
    return encodeIdentityInvite(
      id: myUserId,
      publicKeyPem: crypto.publicKeyPem,
      name: displayName ?? this.displayName,
    );
  }

  String identityInviteDeepLink({String? displayName}) {
    return encodeIdentityInviteDeepLink(
      id: myUserId,
      publicKeyPem: crypto.publicKeyPem,
      name: displayName ?? this.displayName,
    );
  }

  String identityInviteHttpsLink({String? displayName}) {
    return encodeIdentityInviteHttpsLink(
      id: myUserId,
      publicKeyPem: crypto.publicKeyPem,
      name: displayName ?? this.displayName,
    );
  }

  String identityInviteShareText({
    String? displayName,
    required String Function(String label) preamble,
  }) {
    return encodeIdentityInviteShareText(
      id: myUserId,
      publicKeyPem: crypto.publicKeyPem,
      name: displayName ?? this.displayName,
      preamble: preamble,
    );
  }

  IdentityInviteData? _pendingPeerInvite;
  IdentityInviteData? get pendingPeerInvite => _pendingPeerInvite;

  void clearPendingPeerInvite() {
    if (_pendingPeerInvite == null) return;
    _pendingPeerInvite = null;
    notifyListeners();
  }

  bool ingestPeerInviteUri(Uri uri) {
    final data = parseIdentityInviteDeepLink(uri);
    if (data == null) return false;
    _pendingPeerInvite = data;
    notifyListeners();
    debugPrint('[PeerInvite] pending from deep link id=${data.id}');
    return true;
  }

  Future<Peer?> acceptPendingPeerInvite() async {
    final pending = _pendingPeerInvite;
    if (pending == null) return null;
    _pendingPeerInvite = null;
    final peer = await importPeerFromIdentityAny(pending.encodeCompact());
    notifyListeners();
    return peer;
  }

  /// Import peer from identity JSON, deep link, or share text. Returns peer on success.
  Future<Peer?> importPeerFromIdentityAny(String raw) async {
    final data = parseIdentityInvite(raw);
    if (data == null || data.id.isEmpty || data.publicKeyPem.isEmpty) {
      return null;
    }
    if (data.id == myUserId) return null;
    final now = DateTime.now().millisecondsSinceEpoch;
    final peer = data.toPeer(lastSeen: now);
    await db.upsertPeer(peer);
    if (data.name == null || data.name!.isEmpty) {
      // Do not invent a contact alias from the pubkey hash — that makes the
      // UI look like the alias "failed to save" when the user never set one.
    } else {
      final existing = await db.getContactAlias(data.id);
      if (existing == null || existing.isEmpty) {
        await setContactAlias(
          publicKeyHash: data.id,
          aliasName: data.name!,
        );
      }
    }
    await onPeerImportedViaQr(data.id);
    return peer;
  }

  Future<AnnouncementBoard?> acceptPendingBoardInvite() async {
    final pending = _pendingBoardInvite;
    if (pending == null) return null;
    _pendingBoardInvite = null;
    await followAnnouncementBoard(pending);
    notifyListeners();
    return boardById(pending.id) ?? pending;
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
    if (isMedia &&
        !resilnet.isInternetAvailable &&
        !(_nostr?.isOnline ?? false)) {
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
    // E2EE is always on — keep preference true for older builds that read it.
    _e2eeEnabled = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kE2eeEnabled, true);
    if (!enabled) {
      debugPrint(
        '[ResilNet] setE2eeEnabled(false) ignored — E2EE is mandatory',
      );
    }
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

  bool isLocationChannelPinned(String id) {
    final key = _normalizePinnedLocationId(id);
    if (key == null) return false;
    return _pinnedLocationChannels.contains(key);
  }

  Future<void> togglePinnedLocationChannel(String id) async {
    final key = _normalizePinnedLocationId(id);
    if (key == null) return;
    if (_pinnedLocationChannels.contains(key)) {
      _pinnedLocationChannels.remove(key);
    } else {
      _pinnedLocationChannels.remove(key);
      _pinnedLocationChannels.insert(0, key);
      while (_pinnedLocationChannels.length > _maxPinnedLocationChannels) {
        _pinnedLocationChannels.removeLast();
      }
    }
    await _persistPinnedLocationChannels();
    notifyListeners();
  }

  /// Open a pinned location entry (`mesh` or geohash).
  Future<void> openPinnedLocationChannel(String id) async {
    final key = _normalizePinnedLocationId(id);
    if (key == null) return;
    if (key == pinnedMeshChannelId) {
      await setFeedChannel(FeedChannel.mesh);
      return;
    }
    final precision = GeoPrecision.forHashLength(key.length);
    final current = _currentGeohash;
    if (current != null &&
        current.isNotEmpty &&
        (current.startsWith(key) ||
            Geohash.atPrecision(current, precision) == key)) {
      await setGeoPrecision(precision);
    } else {
      final ok = await setManualGeohash(key);
      if (!ok) return;
      await setGeoPrecision(precision);
    }
    await setFeedChannel(FeedChannel.geo);
  }

  bool isFeedChannelPinned(FeedChannel ch) =>
      _pinnedFeedChannels.contains(ch.name);

  Future<void> togglePinnedFeedChannel(FeedChannel ch) async {
    final key = ch.name;
    if (_pinnedFeedChannels.contains(key)) {
      _pinnedFeedChannels.remove(key);
    } else {
      _pinnedFeedChannels.remove(key);
      _pinnedFeedChannels.insert(0, key);
    }
    await _persistPinnedFeedChannels();
    notifyListeners();
  }

  /// Feed channels with pinned tabs first (stable relative order otherwise).
  List<FeedChannel> feedChannelsForPicker() {
    final pinned = <FeedChannel>[];
    final rest = <FeedChannel>[];
    for (final name in _pinnedFeedChannels) {
      for (final ch in FeedChannel.values) {
        if (ch.name == name) {
          pinned.add(ch);
          break;
        }
      }
    }
    for (final ch in FeedChannel.values) {
      if (!pinned.contains(ch)) rest.add(ch);
    }
    return [...pinned, ...rest];
  }

  String? _normalizePinnedLocationId(String raw) {
    final t = raw.trim().toLowerCase();
    if (t.isEmpty) return null;
    if (t == pinnedMeshChannelId || t == '#mesh' || t == 'bluetooth') {
      return pinnedMeshChannelId;
    }
    final hash = Geohash.normalizeFull(t.startsWith('#') ? t.substring(1) : t);
    if (hash.isEmpty) return null;
    return hash;
  }

  void _loadPinnedChannels(SharedPreferences prefs) {
    _pinnedLocationChannels.clear();
    _pinnedFeedChannels.clear();
    try {
      final loc = prefs.getString(_kPinnedLocationChannels);
      if (loc != null && loc.isNotEmpty) {
        final list = jsonDecode(loc) as List<dynamic>;
        for (final item in list) {
          if (item is! String) continue;
          final key = _normalizePinnedLocationId(item);
          if (key != null && !_pinnedLocationChannels.contains(key)) {
            _pinnedLocationChannels.add(key);
          }
        }
      }
    } catch (e) {
      debugPrint('[ResilNet] load pinned location channels failed: $e');
    }
    try {
      final feed = prefs.getString(_kPinnedFeedChannels);
      if (feed != null && feed.isNotEmpty) {
        final list = jsonDecode(feed) as List<dynamic>;
        for (final item in list) {
          if (item is! String || item.isEmpty) continue;
          if (FeedChannel.values.any((c) => c.name == item) &&
              !_pinnedFeedChannels.contains(item)) {
            _pinnedFeedChannels.add(item);
          }
        }
      }
    } catch (e) {
      debugPrint('[ResilNet] load pinned feed channels failed: $e');
    }
  }

  Future<void> _persistPinnedLocationChannels() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kPinnedLocationChannels,
      jsonEncode(_pinnedLocationChannels),
    );
  }

  Future<void> _persistPinnedFeedChannels() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kPinnedFeedChannels,
      jsonEncode(_pinnedFeedChannels),
    );
  }

  void _onMeshPeersChanged() {
    unawaited(_notifyOnlineAppearancesFromMesh());
  }

  void _scheduleMeshUiNotify() {
    _meshUiNotifyDebounce?.cancel();
    _meshUiNotifyDebounce = Timer(const Duration(seconds: 1), () {
      if (hasListeners) notifyListeners();
    });
  }

  /// Coalesce high-frequency ESP32 / UDP / Nostr / connectivity UI ticks.
  void _scheduleRadioUiNotify() {
    if (_radioUiNotifyDebounce?.isActive ?? false) return;
    _radioUiNotifyDebounce = Timer(const Duration(milliseconds: 350), () {
      if (hasListeners) notifyListeners();
    });
  }

  Future<void> _notifyOnlineAppearancesFromMesh() async {
    if (!isReady) return;
    final nearby = _mesh?.nearbyPeers ?? const [];
    final nearbyIds = <String>{};
    for (final peer in nearby) {
      if (peer.id == myUserId || peer.isBlocked) continue;
      nearbyIds.add(peer.id);
      if (_notificationsEnabled) {
        debugPrint('[Notify] enqueue peer=${peer.id} via=mesh');
        await _notifyPeerCameOnline(
          peerId: peer.id,
          displayName: peer.displayName,
          viaMesh: true,
        );
      }
    }
    // Push stored mesh bulletins to every nearby radio (keyed or unbound).
    _scheduleMeshBulletinCatchUp();
    _peerOnlineNotified.removeWhere(
      (id) => id.startsWith('mesh:') && !nearbyIds.contains(id.substring(5)),
    );
    _favoriteNearbyNotified.removeWhere((id) => !nearbyIds.contains(id));
    _schedulePresenceSummaryNotification();
  }

  Future<void> _notifyOnlineAppearancesFromNostr() async {
    final online = areaPresenceOnline();
    final onlineIds = <String>{};
    for (final e in online) {
      if (e.id == myUserId) continue;
      if (!e.source.isInternet) continue;
      onlineIds.add(e.id);
      final peer = e.peer;
      if (peer != null) unawaited(_catchUpNoticesForPeer(peer));
      if (_notificationsEnabled) {
        debugPrint('[Notify] enqueue peer=${e.id} via=nostr');
        await _notifyPeerCameOnline(
          peerId: e.id,
          displayName: e.label,
          viaMesh: false,
        );
      }
    }
    _peerOnlineNotified.removeWhere(
      (id) => id.startsWith('nostr:') && !onlineIds.contains(id.substring(6)),
    );
    _favoriteAreaNotified.removeWhere((id) => !onlineIds.contains(id));
    _schedulePresenceSummaryNotification();
  }

  void _schedulePresenceSummaryNotification() {
    _presenceSummaryDebounce?.cancel();
    _presenceSummaryDebounce = Timer(const Duration(seconds: 2), () {
      unawaited(_publishPresenceSummaryNotification());
    });
  }

  Future<void> _publishPresenceSummaryNotification() async {
    if (!isReady) return;
    final me = myUserIdReady ? myUserId : '';
    final nearbyPeers = _mesh?.nearbyPeers ?? <Peer>[];
    final meshCount = nearbyPeers
        .where((p) => p.id != me && !p.isBlocked)
        .length;
    final nostrCount = _transportMode.usesInternet
        ? areaPresenceOnline()
              .where((e) => e.id != me && e.source.isInternet)
              .length
        : 0;

    if (!_notificationsEnabled) {
      await notifications.clearPresenceSummary();
      _lastPresenceSummaryMesh = -1;
      _lastPresenceSummaryNostr = -1;
      return;
    }

    if (meshCount == 0 && nostrCount == 0) {
      await notifications.clearPresenceSummary();
      _lastPresenceSummaryMesh = 0;
      _lastPresenceSummaryNostr = 0;
      return;
    }

    if (meshCount == _lastPresenceSummaryMesh &&
        nostrCount == _lastPresenceSummaryNostr) {
      return;
    }
    _lastPresenceSummaryMesh = meshCount;
    _lastPresenceSummaryNostr = nostrCount;

    final th = _localeOverrideCode == 'th';
    final title = th ? 'ResilNet — คนออนไลน์' : 'ResilNet — people online';
    final body = th
        ? 'Mesh $meshCount คน · Nostr $nostrCount คน'
        : 'Mesh $meshCount · Nostr $nostrCount';
    await notifications.showPresenceSummary(title: title, body: body);
  }

  Future<void> _notifyPeerCameOnline({
    required String peerId,
    String? displayName,
    required bool viaMesh,
  }) async {
    if (!_notificationsEnabled || !isReady) return;
    if (peerId.isEmpty || peerId == myUserId) return;

    final key = viaMesh ? 'mesh:$peerId' : 'nostr:$peerId';
    if (_peerOnlineNotified.contains(key)) {
      debugPrint(
        '[Notify] skipped peer=$peerId via=${viaMesh ? "mesh" : "nostr"} reason=dedupe-key',
      );
      return;
    }
    // Already alerted via mesh — don't double-notify for the same peer on Nostr.
    if (!viaMesh && _peerOnlineNotified.contains('mesh:$peerId')) {
      _peerOnlineNotified.add(key);
      debugPrint('[Notify] skipped peer=$peerId via=nostr reason=already-mesh');
      return;
    }
    _peerOnlineNotified.add(key);

    final isFav = _favoritePeerIds.contains(peerId);
    if (isFav) {
      if (viaMesh) {
        _favoriteNearbyNotified.add(peerId);
      } else {
        _favoriteAreaNotified.add(peerId);
      }
    }

    final name = (displayName != null && displayName.trim().isNotEmpty)
        ? displayName.trim()
        : await db.resolveDisplayName(peerId);
    final th = _localeOverrideCode == 'th';
    final title = isFav
        ? (viaMesh
              ? (th ? 'คนโปรดอยู่ใกล้' : 'Favorite nearby')
              : (th ? 'คนโปรดในพื้นที่' : 'Favorite in area'))
        : (viaMesh
              ? (th ? 'มีคนออนไลน์บน mesh' : 'Someone nearby on mesh')
              : (th ? 'มีคนออนไลน์ในพื้นที่' : 'Someone online in area'));
    final body = isFav
        ? (viaMesh
              ? (th ? '$name อยู่ใกล้บน mesh' : '$name is nearby on mesh')
              : (th
                    ? '$name ออนไลน์ในพื้นที่นี้'
                    : '$name is online in this area'))
        : (viaMesh
              ? (th ? '$name อยู่ใกล้บน mesh' : '$name is nearby on mesh')
              : (th ? '$name ออนไลน์ผ่าน Nostr' : '$name is online via Nostr'));

    await notifications.showPresenceAlert(
      id: (peerId.hashCode ^ (viaMesh ? 0 : 0x51)) & 0x7fffffff,
      title: title,
      body: body,
    );
    debugPrint(
      '[Notify] sent peer=$peerId via=${viaMesh ? "mesh" : "nostr"} title=$title',
    );
  }

  /// Prefer a single transport when mesh bridge is off (no dual-path fan-out).
  /// Large media (audio/image) always keeps Nostr when available — BLE alone
  /// often cannot carry sealed voice envelopes.
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
      final picked = ble > 0 ? meshLike : const [TransportTypeDto.nostr];
      return picked.isNotEmpty ? picked : transports;
    }
    return transports;
  }

  List<TransportTypeDto> _applyBridgePolicyForMessage(
    ChatMessage msg,
    List<TransportTypeDto> transports,
  ) {
    final kind = msg.payloadKind;
    final isMedia =
        kind == PayloadKinds.audio || kind == PayloadKinds.image;
    if (isMedia && transports.contains(TransportTypeDto.nostr)) {
      // Always keep Nostr for media even when bridge prefers BLE-only.
      final base = _applyBridgePolicy(transports);
      if (base.contains(TransportTypeDto.nostr)) return base;
      return [...base, TransportTypeDto.nostr];
    }
    return _applyBridgePolicy(transports);
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

  Future<void> setMeshtasticBridgeMode(MeshtasticBridgeMode mode) async {
    final b = _meshtasticBridge;
    if (b == null) return;
    await b.setMode(mode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kMeshtasticBridgeMode, mode.prefsValue);
    notifyListeners();
  }

  Future<void> setMeshtasticRelayToMesh(bool value) async {
    _meshtasticRelayToMesh = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kMeshtasticRelayToMesh, value);
    notifyListeners();
  }

  Future<void> setMeshtasticUseMqtt(bool value) async {
    final b = _meshtasticBridge;
    if (b == null) return;
    b.setUseMqtt(value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kMeshtasticUseMqtt, value);
    if (!value) {
      await b.disconnectMqtt();
    }
    notifyListeners();
  }

  Future<void> _applyMeshtasticMqttConfigFromPrefs(SharedPreferences prefs) async {
    final b = _meshtasticBridge;
    if (b == null) return;
    final pass = await _storage.read(key: _kMeshtasticMqttPass) ?? '';
    final chIdx = prefs.getInt(_kMeshtasticMqttChannelIndex);
    b.mqttTransport.applyConfig(
      host: prefs.getString(_kMeshtasticMqttHost) ?? '',
      port: prefs.getInt(_kMeshtasticMqttPort) ?? 1883,
      topicIn: prefs.getString(_kMeshtasticMqttTopicIn) ?? 'msh/2/json/#',
      topicOut: prefs.getString(_kMeshtasticMqttTopicOut) ?? 'msh/2/json/mqtt/',
      username: prefs.getString(_kMeshtasticMqttUser) ?? '',
      password: pass,
      useTls: prefs.getBool(_kMeshtasticMqttUseTls) ?? false,
      autoReconnect: prefs.getBool(_kMeshtasticMqttAutoReconnect) ?? false,
      gatewayFromNodeId: prefs.getInt(_kMeshtasticMqttGatewayFrom) ?? 0,
      downlinkChannelIndex: chIdx,
    );
  }

  Future<void> saveMeshtasticMqttConfig({
    required String host,
    required int port,
    required String topicIn,
    required String topicOut,
    required String username,
    String password = '',
    bool clearPassword = false,
    bool useTls = false,
    bool autoReconnect = false,
    int gatewayFromNodeId = 0,
    int? downlinkChannelIndex,
    String region = '',
    String topicRoot = '',
    String downlinkChannelName = 'mqtt',
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kMeshtasticMqttHost, host.trim());
    await prefs.setInt(_kMeshtasticMqttPort, port);
    await prefs.setString(_kMeshtasticMqttTopicIn, topicIn.trim());
    await prefs.setString(_kMeshtasticMqttTopicOut, topicOut.trim());
    await prefs.setString(_kMeshtasticMqttUser, username.trim());
    await prefs.setBool(_kMeshtasticMqttUseTls, useTls);
    await prefs.setBool(_kMeshtasticMqttAutoReconnect, autoReconnect);
    await prefs.setInt(_kMeshtasticMqttGatewayFrom, gatewayFromNodeId);
    await prefs.setString(_kMeshtasticMqttRegion, region.trim());
    await prefs.setString(_kMeshtasticMqttRoot, topicRoot.trim());
    await prefs.setString(_kMeshtasticMqttDownlinkCh, downlinkChannelName.trim());
    if (downlinkChannelIndex == null) {
      await prefs.remove(_kMeshtasticMqttChannelIndex);
    } else {
      await prefs.setInt(_kMeshtasticMqttChannelIndex, downlinkChannelIndex);
    }
    if (clearPassword) {
      await _storage.delete(key: _kMeshtasticMqttPass);
      _meshtasticMqttPasswordStored = false;
    } else if (password.isNotEmpty) {
      await _storage.write(key: _kMeshtasticMqttPass, value: password);
      _meshtasticMqttPasswordStored = true;
    }
    await _applyMeshtasticMqttConfigFromPrefs(prefs);
    notifyListeners();
  }

  Future<void> clearMeshtasticMqttPassword() async {
    await _storage.delete(key: _kMeshtasticMqttPass);
    _meshtasticMqttPasswordStored = false;
    final prefs = await SharedPreferences.getInstance();
    await _applyMeshtasticMqttConfigFromPrefs(prefs);
    notifyListeners();
  }

  Future<bool> connectMeshtasticMqtt() async {
    final b = _meshtasticBridge;
    if (b == null) return false;
    final prefs = await SharedPreferences.getInstance();
    await _applyMeshtasticMqttConfigFromPrefs(prefs);
    return b.connectMqtt();
  }

  Future<void> disconnectMeshtasticMqtt() async {
    await _meshtasticBridge?.disconnectMqtt();
    notifyListeners();
  }

  /// Mode A: Meshtastic text → local `#meshtastic` notice (+ optional mesh bulletin).
  Future<void> ingestMeshtasticText(MeshtasticTextEvent event) async {
    final body = normalizeBridgeText(event.text);
    if (body.isEmpty) return;
    final notice = LocalNotice(
      id: _uuid.v4(),
      scope: 'mesh',
      channelLabel: MeshtasticBridgeTags.channelLabel,
      text: body,
      createdAt: event.receivedAtMs ?? DateTime.now().millisecondsSinceEpoch,
      expiresAt: NoticeExpiry.sevenDays.expiresAtMs,
      urgent: false,
      senderId: meshtasticSyntheticSenderId(event.fromId),
    );
    _notices.insert(0, notice);
    _noticeDeliveredTo[notice.id] = <String>{};
    await _persistNotices();

    // Optional relay onto ResilNet public mesh (default OFF — local Notices only).
    if (shouldRelayMeshtasticToMesh(
      relayEnabled: _meshtasticRelayToMesh,
      e2eeEnabled: _e2eeEnabled,
    )) {
      final wire = buildSignedBulletin(
        crypto: crypto,
        bulletinId: notice.id,
        text: notice.text,
        createdAt: notice.createdAt,
        expiresAt: notice.expiresAt,
        urgent: false,
        senderName: displayName,
      ).encode();
      _bulletinWires[notice.id] = wire;
      await _persistNotices();
      unawaited(_broadcastBulletin(notice.id, wire));
    }
    notifyListeners();
  }

  Future<void> simulateMeshtasticInbound(String text) async {
    final b = _meshtasticBridge;
    if (b == null) return;
    await b.simulateMeshtasticMessage(text);
  }

  /// Mode B: app → Meshtastic transport (not sealed E2EE).
  Future<bool> sendToMeshtastic(String text) async {
    final b = _meshtasticBridge;
    if (b == null) return false;
    final ok = await b.egressToMeshtastic(text);
    if (!ok) return false;
    final preview = b.lastEgressPreview ?? normalizeBridgeText(text);
    final notice = LocalNotice(
      id: _uuid.v4(),
      scope: 'mesh',
      channelLabel: MeshtasticBridgeTags.channelLabel,
      text: preview,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      expiresAt: NoticeExpiry.oneDay.expiresAtMs,
      urgent: false,
      senderId: myUserIdReady ? myUserId : null,
    );
    _notices.insert(0, notice);
    await _persistNotices();
    notifyListeners();
    return true;
  }

  /// Pin a public notice on #mesh or Area.
  ///
  /// - `geo`: published to the Nostr area board (internet).
  /// - `mesh`: **public bulletin** — plaintext + self-contained signature.
  ///   ไม่ต้องมี key ของผู้รับ ทุกเครื่องในรัศมีอ่านได้ และ ESP32 mule
  ///   เก็บส่งต่อ (store-and-forward) ให้เครื่องที่เข้ามาทีหลัง.
  ///   Late joiners also receive P2P catch-up ([_catchUpNoticesForPeer]).
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
    _lastNoticePublishWarning = null;
    final notice = LocalNotice(
      id: _uuid.v4(),
      scope: scope,
      channelLabel: channelLabel,
      text: body,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      expiresAt: expiry.expiresAtMs,
      urgent: urgent,
      senderId: myUserId,
      senderName: displayName.isEmpty ? null : displayName,
    );
    _notices.insert(0, notice);
    _noticeDeliveredTo[notice.id] = <String>{};
    await _persistNotices();

    debugPrint('[Notice] post id=${notice.id} scope=$scope');

    if (scope == 'geo') {
      final hash = selectedAreaHash;
      if (hash == null || hash.isEmpty) {
        _lastNoticePublishWarning = 'no_area';
        debugPrint('[Notice] nostr-publish skipped — no area hash');
      } else {
        final wireJson = encodeNoticeWire(notice: notice, senderId: myUserId);
        final expiresSec =
            notice.expiresAt == null ? null : notice.expiresAt! ~/ 1000;
        final ok = await _nostr?.publishGeoNotice(
              hash,
              wireJson,
              expiresAtSec: expiresSec,
            ) ??
            false;
        if (!ok) {
          _lastNoticePublishWarning = 'nostr_failed';
          debugPrint('[Notice] nostr-publish failed id=${notice.id} g=$hash');
        } else {
          debugPrint('[Notice] nostr-publish ok id=${notice.id} g=$hash');
          await _markNoticeShared(notice.id);
        }
      }
    } else {
      // #mesh: public bulletin — plaintext + self-contained signature.
      // ไม่ต้องมี key ของ peer และ ESP32 mule เก็บส่งต่อให้เครื่องที่มาทีหลัง
      final wire = buildSignedBulletin(
        crypto: crypto,
        bulletinId: notice.id,
        text: notice.text,
        createdAt: notice.createdAt,
        expiresAt: notice.expiresAt,
        urgent: notice.urgent,
        senderName: displayName,
      ).encode();
      _bulletinWires[notice.id] = wire;
      await _persistNotices();
      final sent = await _broadcastBulletin(notice.id, wire);
      // sharedExternally is marked inside _broadcastBulletin on success.
      debugPrint(
        '[Bulletin] posted id=${notice.id} broadcast=${sent ? 'ok' : 'queued'}',
      );
    }

    notifyListeners();
    return notice;
  }

  /// Mark a notice as having left this device (or arrived from outside).
  Future<void> _markNoticeShared(String noticeId) async {
    final i = _notices.indexWhere((n) => n.id == noticeId);
    if (i < 0) return;
    if (_notices[i].sharedExternally) return;
    _notices[i] = _notices[i].markedShared();
    await _persistNotices();
    notifyListeners();
  }

  /// Delete a notice from this device only.
  ///
  /// Returns whether the notice had already left the device (BLE/Nostr/etc),
  /// so the UI can warn that peers may still have a copy.
  Future<bool> deleteLocalNotice(String noticeId) async {
    final i = _notices.indexWhere((n) => n.id == noticeId);
    if (i < 0) return false;
    final hadLeft = _notices[i].sharedExternally;
    _notices.removeAt(i);
    _bulletinWires.remove(noticeId);
    _noticeDeliveredTo.remove(noticeId);
    _noticeDeliveredToDevice.remove(noticeId);
    await _persistNotices();
    notifyListeners();
    debugPrint('[Notice] deleted local id=$noticeId sharedExternally=$hadLeft');
    return hadLeft;
  }

  /// สร้าง envelope สำหรับ public bulletin (plaintext ใน content เจตนา)
  ChatMessage _bulletinEnvelope(String bulletinId, String wire, {int ttl = 5}) {
    return ChatMessage(
      id: 'bl:$bulletinId',
      senderId: myUserId,
      receiverId: kBulletinBroadcastReceiver,
      content: wire,
      encryptedPayload: PayloadKinds.bulletin,
      encryptedKey: PayloadKinds.bulletin,
      ttl: ttl,
      timestamp: DateTime.now().millisecondsSinceEpoch,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.bulletin,
    );
  }

  /// Broadcast bulletin to nearby radios (fan-out) + optional UDP SoftAP.
  Future<bool> _broadcastBulletin(String bulletinId, String wire) async {
    try {
      final envelope = _bulletinEnvelope(bulletinId, wire);
      final bleConnected = _mesh?.connectedDeviceId != null;
      final nearbyCount = _mesh?.nearbyPeerCount ?? 0;
      final nearbyRaw = _mesh?.nearbyDeviceCount ?? 0;
      final udpActive = resilnet.isGatewayWifiActive;
      final gattReady = _mesh?.gattReady ?? false;
      _lastBulletinBleSent = 0;
      // Make sure our peripheral is up before we claim "no_gatt".
      if (!gattReady) {
        await _mesh?.ensureGattReady();
      }
      final gattNow = _mesh?.gattReady ?? false;
      if (!bleConnected && nearbyRaw == 0 && !udpActive) {
        _lastNoticePublishWarning = 'no_mesh';
        debugPrint(
          '[Bulletin] no BLE/UDP path — stored locally for ESP32 catch-up '
          'id=$bulletinId gatt=$gattNow',
        );
      }
      var bleSent = 0;
      try {
        // Multi-round scan→write; keep ADV up so we remain a relay.
        bleSent = await _mesh?.fanOutReliable(envelope) ?? 0;
        _lastBulletinBleSent = bleSent;
        // Return to staggered listen so we can receive the peer's reply / relay.
        unawaited(
          _mesh?.enterBulletinListenMode(
            duration: const Duration(seconds: 90),
          ),
        );
      } catch (e) {
        debugPrint('[Bulletin] BLE fan-out failed id=$bulletinId: $e');
        _mesh?.resumeRadioDutyCycle();
      }
      var udpOk = false;
      if (udpActive) {
        try {
          await _udp?.sendDirectNow(envelope);
          udpOk = true;
        } catch (e) {
          debugPrint('[Bulletin] UDP send failed id=$bulletinId: $e');
        }
      }
      unawaited(_esp32?.nudgeSync());
      final ok = bleSent > 0 || udpOk;
      debugPrint(
        '[Bulletin] broadcast id=$bulletinId bleSent=$bleSent '
        'nearbyPeers=$nearbyCount nearbyRaw=$nearbyRaw udp=$udpOk '
        'gatt=$gattNow ok=$ok',
      );
      if (!ok) {
        if (nearbyCount > 0 || nearbyRaw > 0 || bleConnected) {
          // Peers/radios seen but GATT write failed — classic iOS role miss.
          _lastNoticePublishWarning = 'ble_send_failed';
        } else if (!gattNow) {
          _lastNoticePublishWarning = 'no_gatt';
        } else {
          _lastNoticePublishWarning ??= 'no_mesh';
        }
      } else {
        _lastNoticePublishWarning = null;
        unawaited(_markNoticeShared(bulletinId));
      }
      return ok;
    } catch (e) {
      debugPrint('[Bulletin] broadcast failed id=$bulletinId: $e');
      return false;
    }
  }

  /// รับ public bulletin จาก wire (BLE peer หรือ ESP32) — ตรวจลายเซ็นจาก
  /// senderPk ที่ฝังมา ไม่ต้องมี peer key ล่วงหน้า. คืน true เมื่อรับใหม่.
  Future<bool> ingestBulletinRaw(String raw, {String via = 'mesh'}) async {
    final wire = parseBulletinWire(raw);
    if (wire == null) {
      debugPrint('[Bulletin] drop malformed wire via=$via');
      return false;
    }
    if (wire.senderId == myUserId) return false;
    if (wire.isExpired) return false;
    if (_notices.any((n) => n.id == wire.bulletinId)) return false;
    if (await db.isPeerBlocked(wire.senderId)) {
      debugPrint('[Bulletin] drop blocked sender=${wire.senderId}');
      return false;
    }
    if (!verifyBulletinWire(wire, crypto)) {
      debugPrint(
        '[Bulletin] drop bad signature id=${wire.bulletinId} sender=${wire.senderId}',
      );
      return false;
    }
    final notice = wire.toLocalNotice();
    _notices.insert(0, notice);
    _bulletinWires[wire.bulletinId] = wire.encode();
    await _persistNotices();

    final nick = (wire.senderName ?? '').trim();
    if (nick.isNotEmpty) {
      try {
        final existing = await db.getPeer(wire.senderId);
        if (existing != null) {
          if ((existing.displayName ?? '').trim() != nick) {
            await db.upsertPeer(existing.copyWith(displayName: nick));
          }
        } else {
          final pem = CryptoService.normalizePublicKey(wire.senderPk);
          await db.upsertPeer(
            Peer(
              id: wire.senderId,
              publicKey: pem,
              displayName: nick,
              isVerifiedIssuer: false,
              isBlocked: false,
              lastSeen: DateTime.now().millisecondsSinceEpoch,
            ),
          );
        }
      } catch (e) {
        debugPrint('[Bulletin] senderName upsert failed: $e');
      }
    }

    notifyListeners();
    final nickLabel = nick.isEmpty ? '-' : nick;
    debugPrint(
      '[Bulletin] ingested id=${wire.bulletinId} from=${wire.senderId} '
      'nick=$nickLabel via=$via',
    );
    // Stay peripheral so we can relay one hop to phones still scanning.
    unawaited(_mesh?.holdAdvertise(duration: const Duration(seconds: 15)));
    return true;
  }

  /// Callback จาก BLE mesh เมื่อพบ bulletin envelope
  Future<bool> _onBulletinMessage(ChatMessage msg) {
    return ingestBulletinRaw(msg.content ?? '', via: 'ble');
  }

  /// Bulletin ที่ยัง active สำหรับ push เข้า ESP32 store-and-forward
  List<MuleMessage> _bulletinsForEsp32() {
    final out = <MuleMessage>[];
    for (final n in _notices) {
      if (n.scope != 'mesh' || n.isExpired) continue;
      final wire = _bulletinWires[n.id];
      if (wire == null) continue;
      out.add(
        MuleMessage(
          id: n.id,
          sender: n.senderId ?? myUserId,
          timestamp: n.createdAt,
          payload: wire,
          ttl: 5,
          type: 'bulletin',
        ),
      );
    }
    return out;
  }

  Future<void> _ingestIncomingNotice(ChatMessage msg) async {
    if (msg.senderId == myUserId) return;
    String plain;
    try {
      plain = crypto.decryptFromSender(
        encryptedPayload: msg.encryptedPayload,
        encryptedKey: msg.encryptedKey,
      );
    } catch (e) {
      debugPrint('[ResilNet] notice decrypt failed: $e');
      return;
    }
    if (plain.isEmpty) return;

    final wire = parseNoticeWire(plain);
    if (wire != null) {
      if (_notices.any((n) => n.id == wire.noticeId)) return;
      final notice = wire.toLocalNotice().withSender(msg.senderId);
      if (notice.isExpired) return;
      _notices.insert(0, notice);
      await _persistNotices();
      notifyListeners();
      debugPrint('[ResilNet] ingested notice id=${wire.noticeId} from ${msg.senderId}');
      return;
    }

    String text = plain;
    var scope = 'geo';
    var channel = geoChannelLabel;
    var noticeId = msg.id;
    var urgent = false;
    int? expiresAt;
    var createdAt = msg.timestamp;
    try {
      final obj = jsonDecode(plain);
      if (obj is Map) {
        final map = Map<String, Object?>.from(obj);
        if ((map['type'] as String?) == 'notice' ||
            map.containsKey('noticeId')) {
          noticeId = (map['noticeId'] as String?)?.trim().isNotEmpty == true
              ? map['noticeId'] as String
              : msg.id;
          scope = (map['scope'] as String?) ?? 'geo';
          channel = (map['channel'] as String?) ?? channel;
          text = (map['text'] as String?) ?? plain;
          urgent = map['urgent'] == true;
          expiresAt = map['expiresAt'] as int?;
          createdAt = (map['createdAt'] as int?) ?? createdAt;
        }
      }
    } catch (_) {
      if (plain.startsWith('[URGENT] ')) {
        urgent = true;
        text = plain.substring(9);
      }
    }

    if (_notices.any((n) => n.id == noticeId)) return;
    final notice = LocalNotice(
      id: noticeId,
      scope: scope,
      channelLabel: channel,
      text: text,
      createdAt: createdAt,
      expiresAt: expiresAt,
      urgent: urgent,
      senderId: msg.senderId,
    );
    if (notice.isExpired) return;
    _notices.insert(0, notice);
    await _persistNotices();
    notifyListeners();
    debugPrint('[ResilNet] ingested notice id=$noticeId from ${msg.senderId}');
  }

  /// Re-send active notices to a newly discovered messageable peer.
  Future<void> _catchUpNoticesForPeer(Peer peer) async {
    if (peer.id == myUserId) return;
    final deviceId = (peer.deviceId ?? '').trim();
    if (deviceId.isEmpty) return;
    await syncMeshBulletinsWithNearby(deviceIds: {deviceId});
  }

  void _onBleLinkReadyForBulletins(String deviceId) {
    _seedBulletinNotifyQueueFromStore();
    unawaited(syncMeshBulletinsWithNearby(deviceIds: {deviceId}));
  }

  void _scheduleMeshBulletinCatchUp() {
    _bulletinCatchUpDebounce?.cancel();
    _bulletinCatchUpDebounce = Timer(const Duration(seconds: 2), () {
      unawaited(syncMeshBulletinsWithNearby());
    });
  }

  void _seedBulletinNotifyQueueFromStore() {
    final mesh = _mesh;
    if (mesh == null) return;
    final envelopes = <ChatMessage>[];
    for (final n in _notices) {
      if (n.scope != 'mesh' || n.isExpired) continue;
      final wire = _bulletinWires[n.id];
      if (wire == null) continue;
      envelopes.add(_bulletinEnvelope(n.id, wire, ttl: 2));
    }
    mesh.seedBulletinNotifyQueue(envelopes);
  }

  /// Push every active #mesh bulletin we hold to nearby BLE radios.
  ///
  /// This is how late joiners receive history: holders push their store when
  /// they see / connect to a peer — there is no central board to pull from.
  Future<int> syncMeshBulletinsWithNearby({Set<String>? deviceIds}) async {
    final mesh = _mesh;
    if (mesh == null || !mesh.running) return 0;
    if (_bulletinCatchUpInFlight != null) {
      await _bulletinCatchUpInFlight;
      return 0;
    }

    final run = () async {
      _seedBulletinNotifyQueueFromStore();
      final targets = <String>{...?deviceIds};
      if (deviceIds == null) {
        for (final p in mesh.nearbyPeers) {
          final d = (p.deviceId ?? '').trim();
          if (d.isNotEmpty) targets.add(d);
        }
        targets.addAll(mesh.nearbyDeviceIds);
        final linked = mesh.connectedDeviceId?.trim();
        if (linked != null && linked.isNotEmpty) targets.add(linked);
      }
      if (targets.isEmpty) {
        debugPrint('[Bulletin] catch-up skip — no nearby radios');
        return 0;
      }

      final active = <({String id, String wire})>[];
      for (final n in _notices) {
        if (n.scope != 'mesh' || n.isExpired) continue;
        final wire = _bulletinWires[n.id];
        if (wire == null) continue;
        active.add((id: n.id, wire: wire));
      }
      if (active.isEmpty) {
        debugPrint('[Bulletin] catch-up skip — no stored mesh bulletins');
        return 0;
      }

      debugPrint(
        '[Bulletin] catch-up start targets=${targets.length} '
        'bulletins=${active.length}',
      );
      var delivered = 0;
      for (final deviceId in targets) {
        for (final item in active) {
          final seen = _noticeDeliveredToDevice.putIfAbsent(
            item.id,
            () => <String>{},
          );
          if (seen.contains(deviceId)) continue;
          try {
            final ok = await mesh.sendToDevice(
              deviceId,
              msg: _bulletinEnvelope(item.id, item.wire, ttl: 2),
            );
            if (ok) {
              seen.add(deviceId);
              delivered++;
              unawaited(_markNoticeShared(item.id));
            }
          } catch (e) {
            debugPrint(
              '[Bulletin] catch-up failed id=${item.id} device=$deviceId: $e',
            );
          }
        }
      }
      debugPrint('[Bulletin] catch-up done deliveredFrames=$delivered');
      return delivered;
    }();

    _bulletinCatchUpInFlight = run.then((_) {});
    try {
      return await run;
    } finally {
      _bulletinCatchUpInFlight = null;
    }
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
    Object? persistError;
    try {
      if (next.isEmpty) {
        await _storage.delete(key: _kDisplayName);
      } else {
        await _storage.write(key: _kDisplayName, value: next);
      }
    } catch (e) {
      persistError = e;
      debugPrint('[ResilNet] Keychain display name failed: $e');
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      if (next.isEmpty) {
        await prefs.remove(_kDisplayName);
      } else {
        await prefs.setString(_kDisplayName, next);
      }
    } catch (e) {
      persistError ??= e;
      debugPrint('[ResilNet] prefs display name failed: $e');
    }
    _syncMeshIdentity();
    notifyListeners();
    unawaited(announceGeohashPresence(force: true));
    unawaited(_mesh?.holdAdvertise());
    if (persistError != null) {
      // In-memory + mesh identity still updated; surface write issues.
      throw persistError;
    }
  }

  void _syncMeshIdentity() {
    final m = _mesh;
    if (m == null) return;
    m.localDisplayName = displayName;
    try {
      m.localPubKeyCompact =
          CryptoService.compactPublicKey(crypto.publicKeyPem);
    } catch (_) {}
    final full = _currentGeohash;
    if (full != null && full.isNotEmpty) {
      m.localGeohash = Geohash.atPrecision(full, _geoPrecision);
    }
  }

  /// เรียกจาก `WidgetsBindingObserver` เมื่อสถานะแอปเปลี่ยน
  void handleAppLifecycleState(AppLifecycleState state) {
    final previous = _lifecycleState;
    _lifecycleState = state;
    debugPrint('[Lifecycle] transition $previous->$state session=$_sessionId');
    if (previous == state) return;
    if (state == AppLifecycleState.resumed) {
      unawaited(onAppResumed(reason: 'lifecycle-resumed'));
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      _backgroundedAt = DateTime.now();
      if (PlatformCaps.isApple) {
        debugPrint(
          '[BLE] Apple background/inactive; discovery may be reduced by system policy '
          '(desktop=${PlatformCaps.isDesktop})',
        );
      }
      // Prefer peripheral advertise so nearby phones can still deliver bulletins.
      unawaited(_mesh?.holdAdvertise(duration: const Duration(seconds: 45)));
      debugPrint('[ACK] persist queue reason=lifecycle-$state');
      unawaited(_ackQueue?.persistToDatabase());
      if (_transportMode.usesInternet) {
        unawaited(announceGeohashPresence(force: true));
      }
    }
  }

  /// กลับมาจาก background — reconnect BLE, Nostr และ Rust stream
  Future<void> onAppResumed({String reason = 'manual'}) async {
    if (!isReady) return;
    if (_resumingLifecycle) {
      debugPrint('[Reconnect] skip resume reason=already-running');
      return;
    }
    final sinceLast = DateTime.now().difference(_lastResumeAt);
    if (sinceLast < const Duration(seconds: 2)) {
      debugPrint(
        '[Reconnect] skip resume reason=debounced sinceMs=${sinceLast.inMilliseconds}',
      );
      return;
    }
    _resumingLifecycle = true;
    _lastResumeAt = DateTime.now();
    final op = _nextOpId('resume');
    debugPrint('[Reconnect] begin op=$op reason=$reason session=$_sessionId');
    final bgSince = _backgroundedAt;
    if (bgSince != null &&
        DateTime.now().difference(bgSince) > const Duration(seconds: 20)) {
      _peerOnlineNotified.clear();
      debugPrint('[Notify] reset dedupe reason=long-background');
    }
    unawaited(notifications.logPermissionStatus(reason: 'resume'));

    await refreshPermissions(startRadiosIfGranted: false);

    try {
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

      try {
        if (_permissionsGranted && !_radioPaused) {
          await _reconnectRadios(reason: 'resume');
        } else {
          await _stopRadios(reason: 'resume-no-permission');
        }
      } catch (e) {
        debugPrint('[ResilNet] radio reconnect failed: $e');
      }

      try {
        await _reconnectNostr(reason: 'resume');
        unawaited(_nostr?.flushOfflineQueue());
      } catch (e) {
        debugPrint('[ResilNet] Nostr reconnect failed: $e');
      }

      unawaited(purgeExpiredMessages());
      unawaited(refreshUnreadDirectCount());
      if (_transportMode.usesInternet || _feedChannel == FeedChannel.geo) {
        if (_currentGeohash == null || _currentGeohash!.isEmpty) {
          unawaited(refreshGeohash());
        } else {
          unawaited(syncGeoPresence(forceAnnounce: true));
        }
      }
      notifyListeners();
    } finally {
      _resumingLifecycle = false;
      debugPrint('[Reconnect] end op=$op reason=$reason');
    }
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

  Future<void> _reconnectRadios({String reason = 'unknown'}) async {
    if (_reconnectingRadios) {
      debugPrint(
        '[Radio] reconnect skip reason=already-running trigger=$reason',
      );
      return;
    }
    _reconnectingRadios = true;
    final op = _nextOpId('radio');
    debugPrint('[Radio] reconnect begin op=$op reason=$reason');
    try {
      await _startRadios(reason: 'reconnect:$reason');
    } finally {
      _reconnectingRadios = false;
      debugPrint('[Radio] reconnect end op=$op reason=$reason');
    }
  }

  Future<void> _reconnectNostr({String reason = 'unknown'}) async {
    final sync = _nostr;
    if (sync == null) return;
    if (_reconnectingNostr) {
      debugPrint(
        '[Nostr] reconnect skip reason=already-running trigger=$reason',
      );
      return;
    }
    _reconnectingNostr = true;
    final op = _nextOpId('nostr');
    debugPrint('[Nostr] reconnect begin op=$op reason=$reason');
    try {
      final ok = await sync.reconnect();
      if (ok || sync.isInitialized) {
        _attachGeoPresenceListener();
      }
      if (ok) {
        await sync.flushOfflineQueue();
      }
      if (_transportMode.usesInternet) {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
      debugPrint(
        '[Nostr] reconnect end op=$op reason=$reason online=${sync.isOnline}',
      );
    } finally {
      _reconnectingNostr = false;
    }
  }

  /// Reconnect Nostr relays and re-sync Area presence (UI action).
  /// Returns true when at least one relay is connected afterwards.
  Future<bool> reconnectNostrAndSyncGeo() async {
    await _reconnectNostr(reason: 'user-action');
    notifyListeners();
    return isNostrOnline;
  }

  /// Snapshot of relay URLs for Settings UI.
  List<({String url, bool connected})> get nostrRelayRows {
    final n = _nostr;
    if (n == null) return const [];
    return [for (final r in n.relays) (url: r.url, connected: r.connected)];
  }

  String? get nostrLastError => _nostr?.lastError;
  bool get nostrReconnecting => _nostr?.reconnecting ?? false;
  bool get nostrInitialized => _nostr?.isInitialized ?? false;

  /// Label for status chips: `0/0`, `0/8`, or `2/8`.
  String get nostrRelayLabel {
    final n = _nostr;
    if (n == null || !n.isInitialized) return '0/0';
    return '${n.connectedRelays}/${n.totalRelays}';
  }

  Future<void> setNotificationsEnabled(bool enabled) async {
    _notificationsEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kNotificationsEnabled, enabled);
    if (!enabled) {
      await notifications.clearPresenceSummary();
      _lastPresenceSummaryMesh = -1;
      _lastPresenceSummaryNostr = -1;
    } else {
      await notifications.requestPermissions(reason: 'settings-toggle');
      _schedulePresenceSummaryNotification();
    }
    notifyListeners();
  }

  /// Local banner for inbound 1:1 DMs (privacy-safe body; no plaintext).
  Future<void> _maybeNotifyDirectMessage(ChatMessage msg) async {
    if (!DirectMessageNotify.shouldNotify(
      notificationsEnabled: _notificationsEnabled,
      isReady: isReady,
      lifecycle: _lifecycleState,
      activeChatPeerId: _activeChatPeerId,
      myUserId: myUserId,
      msg: msg,
      alreadyNotifiedIds: _directNotifyDedup,
    )) {
      return;
    }
    _directNotifyDedup.add(msg.id);
    if (_directNotifyDedup.length > _maxDirectNotifyDedup) {
      _directNotifyDedup.remove(_directNotifyDedup.first);
    }
    try {
      final title = await db.resolveDisplayName(msg.senderId);
      final lang = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      await notifications.showDirectMessage(
        id: DirectMessageNotify.notificationId(msg.id),
        title: title,
        body: PushNotificationCopy.bodyForLocale(lang),
      );
    } catch (e) {
      debugPrint('[Notify] direct DM failed id=${msg.id}: $e');
    }
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

  ChatMessage? _findSessionOutbound(String msgId) {
    for (final m in _sessionMessages) {
      if (m.id == msgId && m.senderId == myUserId) return m;
    }
    return null;
  }

  void _applySessionOutboundStatus(
    String msgId,
    MessageStatus status,
    DateTime at,
  ) {
    final i = _sessionMessages.indexWhere((m) => m.id == msgId);
    if (i < 0) return;
    final m = _sessionMessages[i];
    if (m.senderId != myUserId) return;
    _sessionMessages[i] = m.copyWith(
      status: status,
      deliveredAt: status == MessageStatus.delivered ||
              status == MessageStatus.read
          ? at
          : m.deliveredAt,
      readAt: status == MessageStatus.read ? at : m.readAt,
    );
  }

  AckHandlerService _buildAckHandler() {
    return AckHandlerService(
      database: db,
      myUserId: crypto.myUserId,
      findOutboundExtra: _findSessionOutbound,
      applyOutboundStatus: _applySessionOutboundStatus,
    );
  }

  /// Conversation view: SQLite history (if enabled) + sealed session-only envelopes.
  Future<List<ChatMessage>> messagesForConversation(String a, String b) async {
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
    final fromDb = _saveMessageHistory
        ? await db.getChatPeersFor(myUserId)
        : <String>[];
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

  /// Upgrade a just-handed-off outbound message to `sent`.
  ///
  /// SQLite [DatabaseService.saveMessage] is insert-or-IGNORE, so re-persisting
  /// the same id with status=sent silently no-ops and the row stays `pending`.
  /// Use a targeted UPDATE for history mode; the ephemeral session store
  /// replaces by id, so a plain remember is enough there.
  Future<void> _persistOutboundSent(ChatMessage sent) async {
    if (_saveMessageHistory) {
      await db.markMessageSent(
        sent.id,
        syncedWithCloud: sent.isSyncedWithCloud,
        ttl: sent.ttl,
      );
      _bumpChatData();
    } else {
      _rememberSessionMessage(sent);
    }
  }

  /// Mark outbound as failed (UI shows Retry). Local only.
  Future<void> markMessageFailed(String msgId) async {
    if (_saveMessageHistory) {
      await db.updateMessageStatus(msgId, MessageStatus.failed.name);
    }
    final i = _sessionMessages.indexWhere((m) => m.id == msgId);
    if (i >= 0) {
      _sessionMessages[i] =
          _sessionMessages[i].copyWith(status: MessageStatus.failed);
    }
    _bumpChatData();
    notifyListeners();
  }

  /// Delete a message from this device only (not a remote unsend).
  Future<void> deleteLocalMessage(String msgId) async {
    _sessionMessages.removeWhere((m) => m.id == msgId);
    if (_saveMessageHistory) {
      await db.deleteMessageById(msgId);
    }
    _bumpChatData();
    notifyListeners();
  }

  /// Re-route an outbound message that failed, is pending, or looked “sent”
  /// locally but may not have reached the peer (no delivery ACK yet).
  Future<bool> retryOutbound(ChatMessage msg) async {
    final pending = msg.copyWith(status: MessageStatus.pending);
    await persistChatMessage(pending);
    final isMedia = msg.payloadKind == PayloadKinds.audio ||
        msg.payloadKind == PayloadKinds.image;
    final ok = await routeOutbound(
      pending,
      internetOnly: isMedia && (isNostrOnline || isCloudOnline),
    );
    if (!ok) {
      await markMessageFailed(msg.id);
    }
    return ok;
  }

  /// After QR import: refresh nearby list + force Area presence so both sides
  /// can discover each other without waiting for the periodic timer.
  Future<void> onPeerImportedViaQr(String peerId) async {
    debugPrint('[ResilNet] peer imported via QR id=$peerId');
    try {
      await _mesh?.refreshNearbyPeers();
    } catch (e) {
      debugPrint('[ResilNet] refreshNearby after QR failed: $e');
    }
    final peer = await db.getPeer(peerId);
    if (peer != null) unawaited(_catchUpNoticesForPeer(peer));
    if (_feedChannel == FeedChannel.geo) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    } else if (_transportMode.usesInternet) {
      // Even on Directs/mesh tab, publish once if we already know our geohash.
      unawaited(announceGeohashPresence(force: true));
    }
    _schedulePresenceSummaryNotification();
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await _persistOnboardingDone(prefs);
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
    // Keep Nostr Area discovery running in the background for all feeds
    // when Internet/Auto is selected — otherwise badge stays at 0 on 1:1.
    if (_transportMode.usesInternet) {
      if (_currentGeohash == null || _currentGeohash!.isEmpty) {
        unawaited(refreshGeohash());
      } else {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
    } else if (channel == FeedChannel.geo) {
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
    if (_transportMode.usesInternet || _feedChannel == FeedChannel.geo) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    }
    notifyListeners();
  }

  Future<void> setTransportMode(TransportMode mode) async {
    if (_transportMode == mode) return;
    _transportMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kTransportMode, mode.name);
    if (mode.usesInternet) {
      if (_currentGeohash == null || _currentGeohash!.isEmpty) {
        unawaited(refreshGeohash());
      } else {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
    } else {
      unawaited(_clearNostrGeoSubscription());
      _stopGeoPresencePublishTimer();
      if (_feedChannel == FeedChannel.geo) {
        unawaited(syncGeoPresence(forceAnnounce: true));
      }
    }
    notifyListeners();
  }

  void _attachGeoPresenceListener() {
    final n = _nostr;
    if (n == null) return;
    _geoPresenceSub?.cancel();
    _geoPresenceSub = n.geoPresenceStream.listen(_onNostrGeoPresence);
    _geoNoticeSub?.cancel();
    _geoNoticeSub = n.geoNoticeStream.listen(_onNostrGeoNotice);
  }

  int _geoNoticeBackfillSecs() {
    final days = _nostrExpiry.days;
    final effectiveDays = days <= 0 ? 7 : (days > 7 ? days : 7);
    return effectiveDays * 24 * 3600;
  }

  Future<void> backfillGeoNotices() async {
    if (!_transportMode.usesInternet) return;
    final full = _currentGeohash;
    if (full == null || full.isEmpty) return;
    final n = _nostr;
    if (n == null) return;

    _noticesBackfilling = true;
    notifyListeners();
    try {
      if (!n.isOnline) {
        await n.reconnect();
      }
      if (!n.isOnline) {
        debugPrint('[Notice] backfill skip reason=nostr-offline');
        return;
      }

      final cells = Geohash.nostrSubscribeCells(full, _geoPrecision);
      final since = _geoNoticeBackfillSecs();
      final channel = selectedAreaHash;

      final fetched = await n.fetchGeoNotices(cells, sinceSecsAgo: since);
      var ingested = 0;
      for (final ev in fetched) {
        if (await _ingestGeoNoticeDto(ev, channel: channel)) ingested++;
      }

      await n.setGeoNoticeFilter(cells, sinceSecsAgo: since);

      _lastNoticeBackfillCount = fetched.length;
      _lastNoticeBackfillAt = DateTime.now();
      debugPrint(
        '[Notice] backfill done fetch=${fetched.length} ingested=$ingested cells=$cells',
      );
    } finally {
      _noticesBackfilling = false;
      notifyListeners();
    }
  }

  Future<bool> _ingestGeoNoticeDto(GeoNoticeDto ev, {String? channel}) async {
    final eventId = ev.eventId.trim();
    if (eventId.isNotEmpty) {
      if (_seenNostrNoticeEvents.contains(eventId)) return false;
      _seenNostrNoticeEvents.add(eventId);
    }

    final area = channel ?? selectedAreaHash;
    if (area == null || area.isEmpty) {
      debugPrint('[Notice] drop event=$eventId reason=no-area');
      return false;
    }
    final geo = ev.geohash.trim().toLowerCase();
    if (geo.isEmpty || !Geohash.matchesChannel(geo, area)) {
      debugPrint(
        '[Notice] drop event=$eventId geohash=$geo channel=$area reason=mismatch',
      );
      return false;
    }

    final wire = parseNoticeWire(ev.contentJson);
    if (wire == null) {
      debugPrint('[Notice] drop event=$eventId reason=parse-failed');
      return false;
    }
    if (wire.scope != 'geo') {
      debugPrint('[Notice] drop event=$eventId reason=scope-${wire.scope}');
      return false;
    }
    return _upsertNoticeFromWire(wire);
  }

  void _onNostrGeoNotice(GeoNoticeDto ev) {
    unawaited(_ingestGeoNoticeDto(ev));
  }

  Future<bool> _upsertNoticeFromWire(
    NoticeWireData wire, {
    String? fallbackSenderId,
  }) async {
    if (_notices.any((n) => n.id == wire.noticeId)) return false;
    if (wire.senderId == myUserId || fallbackSenderId == myUserId) {
      return false;
    }
    final notice = wire.toLocalNotice().withSender(
      wire.senderId ?? fallbackSenderId,
    );
    if (notice.isExpired) return false;
    _notices.insert(0, notice);
    await _persistNotices();
    notifyListeners();
    debugPrint('[Notice] backfill ingested id=${notice.id} scope=${notice.scope}');
    return true;
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
    if (boundPeer != null && rid.isNotEmpty) {
      _pruneRotatedPeerPresence(
        newRid: rid,
        nick: ev.nick.trim(),
        geohash: ev.geohash.trim().toLowerCase(),
        keepKey: cacheKey,
      );
    }
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
    unawaited(_notifyOnlineAppearancesFromNostr());
  }

  void _pruneNostrPresence() {
    final cutoff =
        DateTime.now().millisecondsSinceEpoch -
        kNostrPresenceOnlineWindow.inMilliseconds;
    _nostrPresence.removeWhere((_, v) => v.lastSeen < cutoff);
  }

  /// Drop stale rid when the same nick appears in the same geohash cell with a
  /// newer identity (common after remote peer reminted RSA).
  void _pruneRotatedPeerPresence({
    required String newRid,
    required String nick,
    required String geohash,
    required String keepKey,
  }) {
    if (nick.isEmpty || geohash.isEmpty) return;
    final staleKeys = <String>[];
    _nostrPresence.forEach((key, s) {
      if (key == keepKey) return;
      final otherId = s.resilnetId;
      if (otherId != null &&
          otherId != newRid &&
          s.nick == nick &&
          s.geohash.trim().toLowerCase() == geohash) {
        staleKeys.add(key);
      }
    });
    for (final k in staleKeys) {
      final oldId = _nostrPresence[k]?.resilnetId;
      _nostrPresence.remove(k);
      debugPrint('[GeoPresence] pruned rotated identity $oldId -> $newRid');
    }
  }

  /// Latest peer record for outbound E2EE — presence/mesh first, then SQLite.
  Future<Peer?> resolveMessageablePeer(String peerId) async {
    final id = peerId.trim();
    if (id.isEmpty) return null;

    Peer? latest;
    final direct = _nostrPresence[id]?.peer;
    if (direct != null && direct.publicKey.trim().isNotEmpty) {
      latest = direct;
    } else {
      for (final s in _nostrPresence.values) {
        if (s.resilnetId == id &&
            s.peer != null &&
            s.peer!.publicKey.trim().isNotEmpty) {
          latest = s.peer;
          break;
        }
      }
    }
    if (latest == null) {
      for (final p in _mesh?.nearbyPeers ?? const <Peer>[]) {
        if (p.id == id && p.publicKey.trim().isNotEmpty) {
          latest = p;
          break;
        }
      }
    }
    if (latest != null) {
      await db.upsertPeer(latest);
      return latest;
    }
    return db.getPeer(id);
  }

  /// Send a short sealed 1:1 text (hug/slap/mention follow-ups).
  /// Returns false when peer has no known public key.
  Future<bool> sendSealedTextToPeer({
    required String peerId,
    required String text,
  }) async {
    final body = text.trim();
    if (body.isEmpty || !_e2eeEnabled) return false;
    final peer = await resolveMessageablePeer(peerId);
    final pub = peer?.publicKey.trim() ?? '';
    if (peer == null || pub.isEmpty) return false;
    final normalized = CryptoService.normalizePublicKey(pub);
    if (CryptoService.publicKeyHash(normalized) != peer.id) return false;
    final ts = DateTime.now().millisecondsSinceEpoch;
    final pkg = crypto.encryptForRecipient(
      plaintext: body,
      receiverPublicPem: normalized,
      senderId: myUserId,
      receiverId: peer.id,
      timestamp: ts,
    );
    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: myUserId,
      receiverId: peer.id,
      content: body,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.text,
    );
    await persistChatMessage(msg);
    await routeOutbound(msg);
    return true;
  }

  Future<void> setPeerBlocked(String peerId, {required bool blocked}) async {
    await db.setPeerBlocked(peerId, blocked);
    notifyListeners();
  }

  Future<void> _clearNostrGeoSubscription() async {
    await _nostr?.setGeoPresenceFilter(const []);
    await _nostr?.setGeoNoticeFilter(const []);
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
    _geoPresencePublishTimer ??= Timer.periodic(
      const Duration(seconds: 45),
      (_) => unawaited(announceGeohashPresence()),
    );
  }

  /// Refresh mesh + Nostr presence for the current Area channel.
  /// Runs whenever Internet/Auto is selected — not only on the Area feed —
  /// so 1:1 / mesh UIs can still show Nostr-discovered people.
  Future<void> syncGeoPresence({bool forceAnnounce = false}) async {
    if (!_transportMode.usesInternet) {
      await _clearNostrGeoSubscription();
      _stopGeoPresencePublishTimer();
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
      unawaited(backfillGeoNotices());
      _ensureGeoPresencePublishTimer();
    } else {
      await _clearNostrGeoSubscription();
    }
    await announceGeohashPresence(force: forceAnnounce);
  }

  /// Resolve device location → geohash for the geo channel label.
  /// Also announces truncated geohash presence to nearby peers for Area UX.
  /// GPS success overwrites manual geohash; on failure keeps manual/cached cell.
  Future<void> refreshGeohash() async {
    if (_geoRefreshing) return;
    _geoRefreshing = true;
    _geoError = null;
    notifyListeners();
    try {
      final result = await GeoService.resolvePosition();
      if (result.isSuccess) {
        final pos = result.position!;
        _currentGeohash = Geohash.encode(
          pos.latitude,
          pos.longitude,
          precision: GeoPrecision.block.length,
        );
        _geoLocationStatus = GeoLocationStatus.resolved;
        _syncMeshIdentity();
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(_kManualGeohash);
        await prefs.setString(_kCachedGeohash, _currentGeohash!);
        debugPrint(
          '[Geo] gps geohash=$_currentGeohash lastKnown=${result.usedLastKnown}',
        );
        unawaited(syncGeoPresence(forceAnnounce: true));
      } else {
        _geoLocationStatus = result.status;
        debugPrint('[Geo] refresh failed status=${result.status}');
        if (_currentGeohash == null || _currentGeohash!.isEmpty) {
          _geoError = result.status.name;
        }
      }
    } catch (e) {
      _geoError = e.toString();
      debugPrint('[Geo] refreshGeohash failed: $e');
      if (_currentGeohash == null || _currentGeohash!.isEmpty) {
        _geoLocationStatus = GeoLocationStatus.unavailable;
      }
    } finally {
      _geoRefreshing = false;
      notifyListeners();
    }
  }

  /// Clear GPS/manual geohash so Area resets to `#—` until refresh/teleport.
  Future<void> clearStoredGeohash() async {
    _currentGeohash = null;
    _geoLocationStatus = GeoLocationStatus.unavailable;
    _geoError = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kManualGeohash);
    await prefs.remove(_kCachedGeohash);
    await _clearNostrGeoSubscription();
    debugPrint('[Geo] cleared stored geohash');
    notifyListeners();
  }

  /// Set geohash manually (teleport) — for iPads without GPS fix.
  Future<bool> setManualGeohash(String raw) async {
    final normalized = Geohash.normalizeFull(raw);
    if (normalized.isEmpty) {
      debugPrint('[Geo] manual geohash invalid raw=$raw');
      return false;
    }
    _currentGeohash = normalized;
    _geoLocationStatus = GeoLocationStatus.manual;
    _geoError = null;
    _syncMeshIdentity();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kManualGeohash, normalized);
    debugPrint('[Geo] manual geohash set g=$normalized');
    notifyListeners();
    unawaited(syncGeoPresence(forceAnnounce: true));
    return true;
  }

  void _restoreStoredGeohash(SharedPreferences prefs) {
    final manual = prefs.getString(_kManualGeohash)?.trim();
    if (manual != null && manual.isNotEmpty) {
      final normalized = Geohash.normalizeFull(manual);
      if (normalized.isNotEmpty) {
        _currentGeohash = normalized;
        _geoLocationStatus = GeoLocationStatus.manual;
        debugPrint('[Geo] restored manual geohash g=$normalized');
        return;
      }
    }
    final cached = prefs.getString(_kCachedGeohash)?.trim();
    if (cached != null && cached.isNotEmpty) {
      _currentGeohash = cached;
      _geoLocationStatus = GeoLocationStatus.resolved;
      debugPrint('[Geo] restored cached geohash g=$cached');
    }
  }

  /// First launch: bootstrap `#w5` so Area/Nostr discovery works without GPS.
  Future<void> _applyBootstrapGeohashIfNeeded(SharedPreferences prefs) async {
    if (_currentGeohash != null && _currentGeohash!.isNotEmpty) return;
    final hadManual = prefs.containsKey(_kManualGeohash);
    final hadCached = prefs.containsKey(_kCachedGeohash);
    if (hadManual || hadCached) return;

    final normalized = Geohash.normalizeFull(Geohash.bootstrapGeohash);
    if (normalized.isEmpty) return;

    _currentGeohash = normalized;
    _geoLocationStatus = GeoLocationStatus.manual;
    await prefs.setString(_kManualGeohash, normalized);
    debugPrint('[Geo] bootstrap geohash g=$normalized (first launch)');
  }

  /// Active channel hash at current precision (without `#`).
  String? get selectedAreaHash {
    final h = _currentGeohash;
    if (h == null || h.isEmpty) return null;
    return Geohash.atPrecision(h, _geoPrecision);
  }

  /// Why people list is empty (Area / 1:1 with internet discovery).
  GeoDiscoveryEmptyReason get geoDiscoveryEmptyReason {
    final discoveryFeed =
        _feedChannel == FeedChannel.geo || _feedChannel == FeedChannel.directs;
    if (!discoveryFeed) return GeoDiscoveryEmptyReason.none;
    if (_transportMode.usesInternet &&
        (_currentGeohash == null || _currentGeohash!.isEmpty)) {
      return GeoDiscoveryEmptyReason.noLocation;
    }
    if (_transportMode == TransportMode.mesh &&
        _feedChannel == FeedChannel.geo) {
      return GeoDiscoveryEmptyReason.meshOnly;
    }
    if (_transportMode.usesInternet && !isNostrOnline) {
      return GeoDiscoveryEmptyReason.noNostr;
    }
    if (onlinePresenceForUi().isEmpty) {
      return GeoDiscoveryEmptyReason.waiting;
    }
    return GeoDiscoveryEmptyReason.none;
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
    ).map(_withLocalAlias).toList();
  }

  /// People icon / badge for the current feed (excludes self).
  List<AreaPresenceEntry> onlinePresenceForUi() {
    _pruneNostrPresence();
    final me = myUserIdReady ? myUserId : '';
    List<AreaPresenceEntry> list;
    switch (_feedChannel) {
      case FeedChannel.mesh:
        final peers = _mesh?.nearbyPeers ?? const <Peer>[];
        list = [
          for (final p in peers)
            if (p.id != me && p.publicKey.trim().isNotEmpty)
              AreaPresenceEntry(
                id: p.id,
                label: peerDisplayLabel(p.id, fallbackNick: p.displayName),
                source: PresenceSource.mesh,
                geohash: p.geohash,
                lastSeen: p.lastSeen,
                peer: p,
              ),
        ];
        list = _withBleRadioDiscovery(list);
      case FeedChannel.geo:
        list = areaPresenceOnline().where((e) => e.id != me).toList();
        list = _withBleRadioDiscovery(list);
      case FeedChannel.directs:
        // 1:1: show BLE nearby + Nostr area presence when Internet/Auto.
        list = mergeAreaPresence(
          meshPeers: _mesh?.nearbyPeers ?? const <Peer>[],
          nostrSightings: _nostrPresence.values.toList(),
          channel: selectedAreaHash,
          mode: _transportMode,
          nowMs: DateTime.now().millisecondsSinceEpoch,
        ).map(_withLocalAlias).where((e) => e.id != me).toList();
        list = _withBleRadioDiscovery(list);
    }
    return list;
  }

  /// Anonymous BLE advertisers — Mesh transport only, and only when Nostr is empty.
  List<AreaPresenceEntry> _withBleRadioDiscovery(
    List<AreaPresenceEntry> base,
  ) {
    // Auto / Internet: people list is Nostr-only (no duplicate radio· rows).
    if (_transportMode != TransportMode.mesh) return base;

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    if (hasActiveNostrPresenceInChannel(
      sightings: _nostrPresence.values,
      channel: selectedAreaHash,
      nowMs: nowMs,
    )) {
      return base;
    }

    final radio = _mesh?.discoveryPresenceEntries() ?? const <AreaPresenceEntry>[];
    if (radio.isEmpty) return base;
    final seen = base.map((e) => e.id).toSet();
    final out = List<AreaPresenceEntry>.from(base);
    for (final e in radio) {
      if (seen.add(e.id)) out.add(e);
    }
    out.sort((a, b) => b.lastSeen.compareTo(a.lastSeen));
    return out;
  }

  int get onlinePresenceCount => onlinePresenceForUi().length;

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
      if (_transportMode.usesInternet) {
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
    if (!force && since < const Duration(seconds: 30)) return;
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

    // Mesh: unsigned presence fan-out (geohash + community nick).
    if (!_transportMode.usesMesh) return;
    final nick = displayName;
    final presenceBody = jsonEncode({
      'g': channel,
      if (nick.isNotEmpty) 'n': nick,
    });
    try {
      final ts = DateTime.now().millisecondsSinceEpoch;
      final msg = ChatMessage(
        id: _uuid.v4(),
        senderId: myUserId,
        receiverId: kBulletinBroadcastReceiver,
        content: presenceBody,
        encryptedPayload: PayloadKinds.presence,
        encryptedKey: PayloadKinds.presence,
        ttl: 2,
        timestamp: ts,
        status: MessageStatus.pending,
        type: MessageType.direct,
        payloadKind: PayloadKinds.presence,
        senderName: nick.isEmpty ? null : nick,
        senderPk: CryptoService.compactPublicKey(crypto.publicKeyPem),
      );
      await _mesh?.prepareOutboundFanOut();
      final n = await _mesh?.fanOutNow(msg) ?? 0;
      unawaited(_mesh?.holdAdvertise(duration: const Duration(seconds: 12)));
      final nickLabel = nick.isEmpty ? '-' : nick;
      debugPrint(
        '[GeoPresence] mesh fan-out g=$channel nick=$nickLabel sent=$n',
      );
    } catch (e) {
      debugPrint('[ResilNet] mesh presence announce failed: $e');
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
  ///
  /// Also includes messageable Nostr/area peers that already have RSA keys so
  /// public posts still deliver when BLE nearby is empty but Internet peers exist.
  Future<int> sendMeshPublicText(
    String text, {
    String kind = PayloadKinds.areaPublic,
  }) async {
    if (!_e2eeEnabled || !isReady) return 0;
    final body = text.trim();
    if (body.isEmpty) return 0;
    final peers = <Peer>[];
    final seen = <String>{};
    for (final p in mesh.nearbyPeers) {
      if (seen.add(p.id)) peers.add(p);
    }
    for (final e in areaPresenceOnline()) {
      if (!e.canMessage) continue;
      final p = e.peer!;
      if (seen.add(p.id)) peers.add(p);
    }
    return _sendSealedFanOut(peers: peers, body: body, kind: kind);
  }

  Future<int> _sendSealedFanOut({
    required List<Peer> peers,
    required String body,
    required String kind,
    bool internetOnly = false,
  }) async {
    var sent = 0;
    for (final peer in peers) {
      if (peer.id == myUserId) continue;
      final resolved = await resolveMessageablePeer(peer.id) ?? peer;
      final pub = resolved.publicKey.trim();
      if (pub.isEmpty) continue;
      try {
        final normalized = CryptoService.normalizePublicKey(pub);
        if (CryptoService.publicKeyHash(normalized) != resolved.id) {
          debugPrint(
            '[ResilNet] skip sealed fan-out — peer ${resolved.id} pubkey mismatch',
          );
          continue;
        }
        final ts = DateTime.now().millisecondsSinceEpoch;
        final pkg = crypto.encryptForRecipient(
          plaintext: body,
          receiverPublicPem: normalized,
          senderId: myUserId,
          receiverId: resolved.id,
          timestamp: ts,
        );
        // Keep local plaintext for audio/image so the sender can play/view
        // their own fan-out copies (wire still strips content).
        final localContent =
            (kind == PayloadKinds.audio || kind == PayloadKinds.image)
                ? body
                : null;
        final msg = ChatMessage(
          id: _uuid.v4(),
          senderId: myUserId,
          receiverId: resolved.id,
          content: localContent,
          encryptedPayload: pkg.encryptedPayload,
          encryptedKey: pkg.encryptedKey,
          signature: pkg.signature,
          ttl: 5,
          timestamp: ts,
          status: MessageStatus.pending,
          type: MessageType.direct,
          payloadKind: kind,
        );
        // Voice/image always use Nostr (chunked when sealed envelope is large).
        final isMedia =
            kind == PayloadKinds.audio || kind == PayloadKinds.image;
        final preferInternet = internetOnly || isMedia;
        if (preferInternet && !isNostrOnline && !isCloudOnline) {
          debugPrint(
            '[ResilNet] skip sealed fan-out to ${resolved.id} — '
            'media needs Nostr',
          );
          continue;
        }
        if (kind != PayloadKinds.notice) {
          await persistChatMessage(msg);
        }
        final ok = await routeOutbound(msg, internetOnly: preferInternet);
        if (ok) {
          sent++;
        } else {
          debugPrint(
            '[ResilNet] sealed fan-out pending/failed peer=${resolved.id} '
            'internetOnly=$preferInternet',
          );
        }
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
    await _stopRadios(reason: 'panic-wipe', includeNostr: true);

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
    _noticeDeliveredTo.clear();
    _noticeDeliveredToDevice.clear();
    _nostrPresence.clear();
    _favoritePeerIds.clear();
    _favoriteNearbyNotified.clear();
    _favoriteAreaNotified.clear();
    _pinnedLocationChannels.clear();
    _pinnedFeedChannels.clear();
    _peerOnlineNotified.clear();
    _lastPresenceSummaryMesh = -1;
    _lastPresenceSummaryNostr = -1;
    unawaited(notifications.clearPresenceSummary());
    _bumpChatData();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kNotices);
    await prefs.remove(_kFavoritePeerIds);
    await prefs.remove(_kPinnedLocationChannels);
    await prefs.remove(_kPinnedFeedChannels);
    await prefs.remove(_kMeshtasticBridgeMode);
    await prefs.remove(_kMeshtasticRelayToMesh);
    await prefs.remove(_kMeshtasticUseMqtt);
    await prefs.remove(_kMeshtasticMqttHost);
    await prefs.remove(_kMeshtasticMqttPort);
    await prefs.remove(_kMeshtasticMqttTopicIn);
    await prefs.remove(_kMeshtasticMqttTopicOut);
    await prefs.remove(_kMeshtasticMqttUser);
    await prefs.remove(_kMeshtasticMqttUseTls);
    await prefs.remove(_kMeshtasticMqttAutoReconnect);
    await prefs.remove(_kMeshtasticMqttGatewayFrom);
    await prefs.remove(_kMeshtasticMqttChannelIndex);
    await prefs.remove(_kMeshtasticMqttRegion);
    await prefs.remove(_kMeshtasticMqttRoot);
    await prefs.remove(_kMeshtasticMqttDownlinkCh);
    await _storage.delete(key: _kMeshtasticMqttPass);
    _meshtasticRelayToMesh = false;
    _meshtasticMqttPasswordStored = false;
    await _meshtasticBridge?.disconnectMqtt();
    await _meshtasticBridge?.setMode(MeshtasticBridgeMode.off);
    _meshtasticBridge?.setUseMqtt(false);
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
      await _storage.delete(key: _kOnboardingDoneSecure);
    } catch (_) {}

    try {
      await _storage.delete(key: _kDisplayName);
    } catch (_) {}
    _displayName = '';

    await crypto.wipeAndRegenerate();

    _ackHandler = _buildAckHandler();
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
    _onAckQueueChanged = _scheduleRadioUiNotify;
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
      onBulletinMessage: _onBulletinMessage,
      onLinkReady: _onBleLinkReadyForBulletins,
    );
    _syncMeshIdentity();
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
  ///
  /// Returns true when at least one transport accepted the envelope (Nostr publish
  /// OK, or BLE/UDP hand-off). False means still pending / failed.
  Future<bool> routeOutbound(
    ChatMessage msg, {
    bool internetOnly = false,
  }) async {
    // Attach senderPk on the wire so first-contact recipients can verify us.
    final outbound = (msg.senderPk?.trim().isNotEmpty == true)
        ? msg
        : msg.copyWith(
            senderPk: CryptoService.compactPublicKey(crypto.publicKeyPem),
          );
    final isPresence = outbound.payloadKind == PayloadKinds.presence;
    final isBulletin = outbound.payloadKind == PayloadKinds.bulletin;
    final piggyback = isPresence || isBulletin
        ? const <AckEntry>[]
        : (_ackQueue?.drainPiggybackFor(outbound.receiverId) ??
            const <AckEntry>[]);
    final dto = ResilNetPacketCodec.toDto(outbound, piggybackAcks: piggyback);
    final isMedia = outbound.payloadKind == PayloadKinds.audio ||
        outbound.payloadKind == PayloadKinds.image;
    // Board posts can embed large RNMEDIA payloads — use the same Nostr
    // multi-part path when internet-only fan-out exceeds a single event.
    final needsMediaParts = isMedia ||
        (outbound.payloadKind == PayloadKinds.boardPost && internetOnly);

    // Large sealed media: split across multiple Nostr events (relay-safe).
    if (needsMediaParts &&
        (internetOnly || isNostrOnline || isCloudOnline) &&
        dto.payload.length > MediaPartCodec.singleMaxBytes) {
      final partsNeeded =
          (dto.payload.length / MediaPartCodec.maxSliceBytes).ceil();
      if (partsNeeded > MediaPartCodec.maxParts) {
        debugPrint(
          '[MediaPart] refuse id=${outbound.id} sealed=${dto.payload.length} '
          'parts=$partsNeeded > ${MediaPartCodec.maxParts}',
        );
        notifyListeners();
        return false;
      }
      debugPrint(
        '[MediaPart] split id=${outbound.id} dto=${dto.payload.length} '
        'parts~$partsNeeded',
      );
      final ok = await _publishSealedMediaParts(outbound, dto);
      notifyListeners();
      return ok;
    }

    final routed = await resilnet.routeMessage(
      id: dto.id,
      sender: dto.sender,
      receiver: dto.receiver,
      payload: dto.payload,
      timestampMs: dto.timestamp.toInt(),
      ttl: dto.ttl,
      payloadTag: dto.payloadTag,
    );

    if (isPresence || isBulletin) {
      // Presence/bulletin are fire-and-forget — skip chat persistence.
      // Fan-out to every nearby radio (GATT peripheral on peers accepts writes).
      var bleOk = false;
      try {
        await _mesh?.prepareOutboundFanOut();
        final n = await _mesh?.fanOutReliable(outbound, rounds: 2) ?? 0;
        bleOk = n > 0;
        unawaited(_mesh?.holdAdvertise(duration: const Duration(seconds: 15)));
      } catch (e) {
        debugPrint('[ResilNet] bulletin/presence BLE send failed: $e');
        _mesh?.resumeRadioDutyCycle();
      }
      var udpOk = false;
      if (resilnet.isGatewayWifiActive) {
        try {
          await _udp?.sendDirectNow(outbound);
          udpOk = true;
        } catch (e) {
          debugPrint('[ResilNet] bulletin/presence UDP send failed: $e');
        }
      }
      return bleOk || udpOk;
    }

    var transports = _applyBridgePolicyForMessage(
      outbound,
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
    var handedToMesh = false;
    for (final transport in transports) {
      switch (transport) {
        case TransportTypeDto.nostr:
          final ok = await _publishOutboundViaNostr(routed.packet);
          if (ok) {
            await _persistOutboundSent(
              outbound.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.sent,
                isSyncedWithCloud: true,
              ),
            );
            markedSent = true;
          } else if (_saveMessageHistory) {
            // Offline retry needs a pending row; ephemeral mode skips disk.
            await db.saveMessage(
              outbound.copyWith(status: MessageStatus.pending),
            );
          } else {
            await persistChatMessage(
              outbound.copyWith(status: MessageStatus.pending),
            );
          }
        case TransportTypeDto.bluetoothMesh:
        case TransportTypeDto.loRa:
          if (internetOnly) continue;
          final outgoing = outbound.copyWith(
            ttl: routed.packet.ttl,
            status: markedSent ? MessageStatus.sent : MessageStatus.pending,
          );
          if (_saveMessageHistory) {
            await db.saveMessage(outgoing);
            if (resilnet.isGatewayWifiActive) {
              unawaited(_udp?.pumpSendQueue());
            }
            handedToMesh = true;
          } else {
            await persistChatMessage(
              outgoing.copyWith(status: MessageStatus.sent),
            );
            // Fan-out without SQLite queue — send sealed bytes immediately.
            unawaited(_mesh?.sendDirectNow(outgoing));
            if (resilnet.isGatewayWifiActive) {
              unawaited(_udp?.sendDirectNow(outgoing));
            }
            handedToMesh = true;
          }
        case TransportTypeDto.offlineQueue:
          if (_saveMessageHistory) {
            await db.saveMessage(
              outbound.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.pending,
              ),
            );
          } else {
            await persistChatMessage(
              outbound.copyWith(
                ttl: routed.packet.ttl,
                status: MessageStatus.pending,
              ),
            );
          }
      }
    }

    notifyListeners();
    // Media must actually reach Nostr — BLE queue handoff is not delivery.
    if (isMedia || internetOnly) {
      return markedSent;
    }
    return markedSent || handedToMesh;
  }

  /// Publish a large sealed media envelope as multiple Nostr parts.
  Future<bool> _publishSealedMediaParts(
    ChatMessage outbound,
    MessagePacketDto dto,
  ) async {
    late final List<Uint8List> slices;
    try {
      slices = MediaPartCodec.splitPayload(dto.payload);
    } catch (e) {
      debugPrint('[MediaPart] split refused id=${outbound.id}: $e');
      return false;
    }
    if (slices.isEmpty) return false;
    var published = 0;
    for (var i = 0; i < slices.length; i++) {
      final partPayload = MediaPartCodec.encodePart(
        messageId: outbound.id,
        index: i,
        total: slices.length,
        slice: slices[i],
      );
      final partDto = MessagePacketDto(
        id: ResilNetChunkCodec.chunkPacketId(outbound.id, i),
        sender: dto.sender,
        receiver: dto.receiver,
        payload: partPayload,
        timestamp: dto.timestamp,
        ttl: dto.ttl,
        payloadTag: dto.payloadTag,
      );
      final ok = await _publishOutboundViaNostr(partDto);
      if (ok) {
        published++;
      } else {
        debugPrint(
          '[MediaPart] publish failed mid=${outbound.id} part=${i + 1}/${slices.length}',
        );
        break;
      }
    }
    final allOk = published == slices.length;
    if (allOk) {
      await _persistOutboundSent(
        outbound.copyWith(
          status: MessageStatus.sent,
          isSyncedWithCloud: true,
        ),
      );
      debugPrint(
        '[MediaPart] published mid=${outbound.id} parts=$published',
      );
    } else if (_saveMessageHistory) {
      await db.saveMessage(outbound.copyWith(status: MessageStatus.pending));
    } else {
      await persistChatMessage(
        outbound.copyWith(status: MessageStatus.pending),
      );
    }
    return allOk;
  }

  Future<bool> _publishOutboundViaNostr(MessagePacketDto packet) async {
    final sync = _nostr;
    if (sync == null) {
      debugPrint('[ResilNet] Nostr unavailable — keep pending id=${packet.id}');
      return false;
    }
    try {
      if (!sync.running) {
        await sync.start();
        _attachGeoPresenceListener();
      }
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

      // Multi-part sealed media (voice/image) — reassemble before ChatMessage parse.
      var effective = dto;
      if (MediaPartCodec.isMediaPartPayload(dto.payload)) {
        final part = MediaPartCodec.parsePart(dto.payload);
        if (part == null) {
          debugPrint('[MediaPart] drop malformed part id=${dto.id}');
          return;
        }
        final complete = _mediaParts.add(part);
        debugPrint(
          '[MediaPart] recv mid=${part.messageId} '
          '${part.index + 1}/${part.total} complete=${complete != null}',
        );
        if (complete == null) return;
        effective = MessagePacketDto(
          id: part.messageId,
          sender: dto.sender,
          receiver: dto.receiver,
          payload: complete,
          timestamp: dto.timestamp,
          ttl: dto.ttl,
          payloadTag: dto.payloadTag,
        );
      }

      final meta = ResilNetPacketCodec.fromDtoWithMeta(effective);
      if (meta.piggybackAcks.isNotEmpty) {
        await _ackHandler.handlePiggybacked(
          meta.piggybackAcks,
          envelopeSenderId: effective.sender,
        );
      }

      final msg = meta.message;
      if (msg == null) return;

      if (msg.payloadKind == PayloadKinds.bulletin) {
        // Public bulletin — verify + ingest + relay inside mesh service.
        await mesh.applyIncomingFromRouter(msg);
        notifyListeners();
        return;
      }

      if (msg.payloadKind == PayloadKinds.notice) {
        final accepted = await mesh.applyIncomingFromRouter(msg);
        if (accepted) {
          await _ingestIncomingNotice(msg);
        }
        notifyListeners();
        return;
      }

      final accepted = await mesh.applyIncomingFromRouter(msg);
      if (!accepted) return;
      if (msg.payloadKind != PayloadKinds.presence) {
        _bumpChatData();
      }
      if (msg.receiverId == myUserId &&
          msg.senderId != myUserId &&
          PayloadKinds.isPrivateDm(msg.payloadKind)) {
        unawaited(_maybeNotifyDirectMessage(msg));
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
    final now = DateTime.now();
    var changed = false;
    final enqueuedIds = <String>{};
    if (unread.isNotEmpty) {
      debugPrint(
        '[ACK] markConversationRead peer=$peerId unread=${unread.length}',
      );
      for (final m in unread) {
        await db.markMessagesRead([m.id], now);
        await _ackQueue?.enqueueRead(
          msgId: m.id,
          targetSenderId: m.senderId,
          at: now,
        );
        enqueuedIds.add(m.id);
      }
      changed = true;
    }
    // History OFF: incoming lives only in `_sessionMessages` — must enqueue
    // READ here or the sender never gets a receipt.
    for (var i = 0; i < _sessionMessages.length; i++) {
      final m = _sessionMessages[i];
      if (m.senderId != peerId || m.receiverId != myUserId) continue;
      if (m.type != MessageType.direct) continue;
      if (!PayloadKinds.isPrivateDm(m.payloadKind)) continue;
      if (m.status == MessageStatus.read) continue;
      if (!enqueuedIds.contains(m.id)) {
        debugPrint(
          '[ACK] markConversationRead session READ msgId=${m.id} peer=$peerId',
        );
        await _ackQueue?.enqueueRead(
          msgId: m.id,
          targetSenderId: m.senderId,
          at: now,
        );
        enqueuedIds.add(m.id);
      }
      _sessionMessages[i] = m.copyWith(status: MessageStatus.read, readAt: now);
      changed = true;
    }
    if (!changed) return;
    _bumpChatData();
    // READ receipts should reach the sender promptly — don't wait for the
    // deferred mesh timer / batch threshold.
    unawaited(_ackQueue?.flush());
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
    // routeMessage only selects transports — must actually publish/hand-off
    // (same as routeOutbound). Returning "not offlineQueue" without sending
    // made flush drop DELIVERED/READ ACKs while the sender stayed on "sent".
    final transports = routed.transports.isNotEmpty
        ? routed.transports
        : <TransportTypeDto>[routed.transport];
    final toSend = routed.packet;
    var ok = false;
    for (final transport in transports) {
      switch (transport) {
        case TransportTypeDto.nostr:
          if (await _publishOutboundViaNostr(toSend)) {
            ok = true;
          }
        case TransportTypeDto.bluetoothMesh:
        case TransportTypeDto.loRa:
          if (await (_mesh?.sendAckBatch(packet) ?? false)) {
            ok = true;
          }
        case TransportTypeDto.offlineQueue:
          break;
      }
    }
    if (resilnet.isGatewayWifiActive) {
      if (await resilnet.sendViaGatewayUdp(toSend)) {
        ok = true;
      }
    }
    if (!ok) {
      debugPrint(
        '[ACK] send batch failed receiver=${packet.receiverId} '
        'count=${packet.batchAcks.length} transports=$transports',
      );
    }
    return ok;
  }

  Future<void> refreshPermissions({bool startRadiosIfGranted = true}) async {
    if (!isReady) return;
    _permissionsGranted = await _hasAllRequiredPermissions();
    if (startRadiosIfGranted && _permissionsGranted && !_radioPaused) {
      unawaited(_startRadios(reason: 'refresh-permissions'));
    } else if (!_permissionsGranted) {
      await _stopRadios(reason: 'permissions-missing');
    }
    notifyListeners();
  }

  /// Re-check permissions and start BLE mesh if allowed.
  Future<void> ensureBleRadiosStarted() async {
    await refreshPermissions();
    if (_permissionsGranted && !_radioPaused && isReady) {
      try {
        if (!(_mesh?.running ?? false)) {
          await _startRadios(reason: 'ensure-ble-radios-started');
        }
      } catch (e) {
        debugPrint('[ResilNet] ensureBleRadiosStarted failed: $e');
      }
    }
    notifyListeners();
  }

  Future<bool> requestPermissions() async {
    if (!isReady) return false;

    // macOS: permission_handler has no bluetooth/mic channel — continue and
    // let the OS prompt via CoreBluetooth / AVFoundation when radios start.
    if (PlatformCaps.isMacOS) {
      debugPrint('[ResilNet] requestPermissions: macOS skip plugin — grant');
      _permissionsGranted = true;
      if (!_radioPaused) {
        unawaited(_startRadios(reason: 'request-permissions-macos'));
      }
      notifyListeners();
      return true;
    }

    final mesh = await _meshPermissions();
    final needed = <Permission>[...mesh, Permission.microphone];
    debugPrint(
      '[ResilNet] requestPermissions: asking ${needed.map((p) => p.toString()).join(', ')}',
    );
    Map<Permission, PermissionStatus> result;
    try {
      result = await needed.request();
    } catch (e) {
      debugPrint('[ResilNet] requestPermissions plugin failed: $e');
      // Soft-continue on desktop-like failures so the user is not stuck.
      if (PlatformCaps.isDesktop) {
        _permissionsGranted = true;
        if (!_radioPaused) {
          unawaited(_startRadios(reason: 'request-permissions-desktop-soft'));
        }
        notifyListeners();
        return true;
      }
      rethrow;
    }
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
      unawaited(_startRadios(reason: 'request-permissions-granted'));
    }
    notifyListeners();
    return _permissionsGranted;
  }

  /// หยุด BLE ชั่วคราวตอนเปิดกล้อง (กันชน radio / UI ค้างบน iOS).
  /// ไม่หยุด Nostr — ไม่งั้น geo presence จะเงียบหลังสแกน QR.
  Future<void> pauseRadiosForCamera() async {
    if (_radioPaused) return;
    _radioPaused = true;
    notifyListeners();
    try {
      await _mesh?.stop();
    } catch (e) {
      debugPrint('[ResilNet] pause mesh for camera: $e');
    }
    try {
      await _esp32?.stop();
    } catch (e) {
      debugPrint('[ResilNet] pause esp32 for camera: $e');
    }
  }

  /// กลับมาสแกน BLE หลังปิดกล้อง
  Future<void> resumeRadiosAfterCamera() async {
    if (!_radioPaused) return;
    _radioPaused = false;
    notifyListeners();
    if (_permissionsGranted && isReady) {
      unawaited(_startRadios(reason: 'camera-resume'));
    }
    if (_transportMode.usesInternet || _feedChannel == FeedChannel.geo) {
      unawaited(syncGeoPresence(forceAnnounce: true));
    }
  }

  Future<void> _startRadios({String reason = 'unknown'}) async {
    if (!isReady || _radioPaused) return;
    if (_startingRadios) {
      debugPrint('[Radio] start skip reason=already-running trigger=$reason');
      return;
    }
    _startingRadios = true;
    final op = _nextOpId('radio-start');
    debugPrint(
      '[Radio] start begin op=$op reason=$reason permissions=$_permissionsGranted paused=$_radioPaused',
    );
    try {
      if (!PlatformCaps.meshBleAttempted) {
        debugPrint(
          '[Radio] skip BLE/ESP32 on this platform — Nostr/UDP still available',
        );
      } else {
        try {
          _syncMeshIdentity();
          await mesh.start();
          debugPrint('[BLE] mesh.start ok');
        } catch (e) {
          // Soft-fail: desktop or denied BT must not block Nostr/chat.
          debugPrint(
            '[ResilNet] mesh.start failed (continuing without mesh): $e',
          );
        }
        try {
          await esp32.startBackgroundScan();
        } catch (e) {
          debugPrint('[ResilNet] esp32.start failed (continuing): $e');
        }
      }
      try {
        await _udp?.start();
      } catch (e) {
        debugPrint('[ResilNet] udp.start failed: $e');
      }
    } finally {
      _startingRadios = false;
      debugPrint('[Radio] start end op=$op reason=$reason');
    }
  }

  Future<void> _stopRadios({
    String reason = 'unknown',
    bool includeNostr = false,
  }) async {
    if (_stoppingRadios) {
      debugPrint('[Radio] stop skip reason=already-running trigger=$reason');
      return;
    }
    _stoppingRadios = true;
    final op = _nextOpId('radio-stop');
    debugPrint(
      '[Radio] stop begin op=$op reason=$reason includeNostr=$includeNostr',
    );
    try {
      try {
        await _mesh?.stop();
      } catch (_) {}
      try {
        await _esp32?.stop();
      } catch (_) {}
      try {
        await _udp?.stop();
      } catch (_) {}
      if (includeNostr) {
        try {
          await _nostr?.stop();
        } catch (_) {}
      }
    } finally {
      _stoppingRadios = false;
      debugPrint('[Radio] stop end op=$op reason=$reason');
    }
  }

  Future<bool> _hasAllRequiredPermissions() async {
    // macOS: permission_handler often has no BT/notification channel — never
    // block boot. Radios start best-effort; user can grant via System Settings.
    if (PlatformCaps.isMacOS) {
      debugPrint('[ResilNet] macOS skip permission_handler gate');
      return true;
    }
    try {
      final needed = await _meshPermissions();
      for (final p in needed) {
        final status = await p.status;
        debugPrint('[ResilNet] check $p => $status');
        // iOS bluetooth บางเวอร์ชันคืน limited/restricted ตอนยังไม่เคยขอ
        if (!(status.isGranted || status.isLimited)) return false;
      }
      return true;
    } catch (e) {
      debugPrint('[ResilNet] permission check failed (soft): $e');
      return false;
    }
  }

  Future<List<Permission>> _meshPermissions() async {
    // iOS/macOS: CoreBluetooth via Permission.bluetooth (+ location for scan policy).
    if (PlatformCaps.isApple) {
      return <Permission>[Permission.bluetooth, Permission.locationWhenInUse];
    }
    if (!PlatformCaps.meshBleAttempted) {
      // Windows/Linux: no mesh BLE stack yet — treat as granted so app/Nostr runs.
      return const <Permission>[];
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
    _radioUiNotifyDebounce?.cancel();
    screenshots.removeListener(_onScreenshot);
    screenshots.dispose();
    _retentionTimer?.cancel();
    _stopGeoPresencePublishTimer();
    unawaited(_geoPresenceSub?.cancel());
    unawaited(_geoNoticeSub?.cancel());
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

    final mtCb = _onMeshtasticBridgeChanged;
    if (mtCb != null) _meshtasticBridge?.removeListener(mtCb);
    _meshtasticBridge?.dispose();
    _meshtasticBridge = null;

    unawaited(_stopRadios(reason: 'dispose', includeNostr: true));
    _ackQueue?.dispose();
    _udp?.dispose();
    resilnet.dispose();
    super.dispose();
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../core/resilnet_protocol.dart';
import '../src/rust/api/dto.dart';
import '../src/rust/api/nostr_api.dart';
import 'secure_kv.dart';

/// Cloud replacement — Nostr relay pool via Rust FFI (account-less secp256k1).
class NostrSyncService extends ChangeNotifier {
  NostrSyncService({SecureKv? storage}) : _storage = storage ?? resilnetSecureKv;

  static const _kSecretHex = 'resilnet_nostr_secret_hex';
  static const _keychainTimeout = Duration(seconds: 4);
  static const _initTimeout = Duration(seconds: 25);

  final SecureKv _storage;

  NostrPoolStatusDto? _status;
  bool _running = false;
  bool _publishing = false;
  bool _reconnecting = false;
  String? _lastError;
  Timer? _statusPoll;
  StreamSubscription<GeoPresenceDto>? _presenceSub;
  StreamSubscription<GeoNoticeDto>? _noticeSub;
  final _presenceController = StreamController<GeoPresenceDto>.broadcast();
  final _noticeController = StreamController<GeoNoticeDto>.broadcast();

  bool get running => _running;
  bool get reconnecting => _reconnecting;
  String? get lastError => _lastError;
  NostrPoolStatusDto? get status => _status;
  String get npub => _status?.npub ?? '';
  String get pubkeyHex => _status?.pubkeyHex ?? '';
  int get connectedRelays => _status?.connectedRelays ?? 0;
  int get totalRelays => _status?.totalRelays ?? 0;
  bool get isOnline => (_status?.connectedRelays ?? 0) > 0;
  /// True after a successful [start] that produced a status with relay URLs.
  bool get isInitialized =>
      _running && (_status?.initialized == true || totalRelays > 0);
  List<RelayStatusDto> get relays =>
      _status?.relays ?? const <RelayStatusDto>[];

  /// Anonymous geohash presence events (kind 20050).
  Stream<GeoPresenceDto> get geoPresenceStream => _presenceController.stream;

  /// Public geohash notice events (kind 20051).
  Stream<GeoNoticeDto> get geoNoticeStream => _noticeController.stream;

  SyncPhase get phase =>
      _publishing || _reconnecting ? SyncPhase.cloudSync : SyncPhase.idle;

  Future<String?> _readSecretSafe() async {
    try {
      return await _storage
          .read(key: _kSecretHex)
          .timeout(_keychainTimeout, onTimeout: () {
        debugPrint('[Nostr] keychain read timed out');
        return null;
      });
    } catch (e) {
      debugPrint('[Nostr] keychain read failed: $e');
      return null;
    }
  }

  Future<void> _writeSecretSafe(String secret) async {
    try {
      await _storage
          .write(key: _kSecretHex, value: secret)
          .timeout(_keychainTimeout);
    } catch (e) {
      // Don't fail init — Rust already has the identity for this process.
      debugPrint('[Nostr] keychain write failed (non-fatal): $e');
    }
  }

  /// Start pool with retries. Does not throw — sets [lastError] on failure.
  Future<bool> start({List<String>? relayUrls, int maxAttempts = 3}) async {
    if (_running && isInitialized) {
      await refreshStatus();
      return isOnline || totalRelays > 0;
    }
    _lastError = null;
    notifyListeners();

    Object? lastErr;
    for (var attempt = 1; attempt <= maxAttempts; attempt++) {
      try {
        final stored = await _readSecretSafe();
        final result = await initNostr(
          secretKeyHex: (stored != null && stored.isNotEmpty) ? stored : null,
          relayUrls: relayUrls,
        ).timeout(
          _initTimeout,
          onTimeout: () => throw TimeoutException('initNostr'),
        );
        if (result.secretKeyHex.isNotEmpty && result.secretKeyHex != stored) {
          await _writeSecretSafe(result.secretKeyHex);
        }
        _status = result.status;
        _running = true;
        _lastError = null;
        await _attachPresenceStream();
        await _attachNoticeStream();
        _logRelaySnapshot('started attempt=$attempt');
        notifyListeners();
        _ensureStatusPoll();
        unawaited(_pollUntilOnlineOrGiveUp());
        return true;
      } catch (e, st) {
        lastErr = e;
        _lastError = '$e';
        _running = false;
        debugPrint('[Nostr] start attempt $attempt/$maxAttempts failed: $e\n$st');
        notifyListeners();
        if (attempt < maxAttempts) {
          await Future<void>.delayed(Duration(milliseconds: 400 * attempt));
        }
      }
    }
    _lastError = lastErr?.toString() ?? 'start_failed';
    notifyListeners();
    return false;
  }

  Future<void> _attachNoticeStream() async {
    await _noticeSub?.cancel();
    try {
      _noticeSub = nostrSubscribeGeoNotices().listen(
        (ev) {
          if (!_noticeController.isClosed) {
            _noticeController.add(ev);
          }
        },
        onError: (e) => debugPrint('[Nostr] notice stream error: $e'),
      );
    } catch (e) {
      debugPrint('[Nostr] notice subscribe failed: $e');
    }
  }

  Future<void> _attachPresenceStream() async {
    await _presenceSub?.cancel();
    try {
      _presenceSub = nostrSubscribeGeoPresence().listen(
        (ev) {
          if (!_presenceController.isClosed) {
            _presenceController.add(ev);
          }
        },
        onError: (e) => debugPrint('[Nostr] presence stream error: $e'),
      );
    } catch (e) {
      debugPrint('[Nostr] presence subscribe failed: $e');
    }
  }

  void _ensureStatusPoll() {
    _statusPoll?.cancel();
    _statusPoll = Timer.periodic(const Duration(seconds: 8), (_) {
      if (!_running) return;
      unawaited(_statusTick());
    });
  }

  Future<void> _statusTick() async {
    await refreshStatus();
    if (_running &&
        isInitialized &&
        !isOnline &&
        !_reconnecting) {
      debugPrint('[Nostr] status tick offline — reconnecting');
      unawaited(reconnect());
    }
  }

  void _stopStatusPoll() {
    _statusPoll?.cancel();
    _statusPoll = null;
  }

  Future<void> _pollUntilOnlineOrGiveUp({int maxAttempts = 8}) async {
    for (var i = 0; i < maxAttempts; i++) {
      if (!_running) return;
      await refreshStatus();
      if (isOnline) {
        _logRelaySnapshot('online');
        return;
      }
      await Future<void>.delayed(const Duration(seconds: 2));
    }
    _logRelaySnapshot('still offline after poll');
  }

  void _logRelaySnapshot(String reason) {
    final urls = relays
        .map((r) => '${r.connected ? "+" : "-"}${r.url}')
        .join(', ');
    debugPrint(
      '[Nostr] $reason relays=$connectedRelays/$totalRelays [$urls]'
      '${_lastError != null ? " err=$_lastError" : ""}',
    );
  }

  Future<void> refreshStatus() async {
    try {
      _status = await getNostrStatus();
      if (isOnline) _lastError = null;
      final relaysText = '$connectedRelays/$totalRelays';
      if (!isOnline) {
        _lastError ??= 'offline relays=$relaysText';
      }
      debugPrint('[Nostr] status relays=$relaysText reconnecting=$_reconnecting');
      notifyListeners();
    } catch (e) {
      debugPrint('[Nostr] status failed: $e');
    }
  }

  /// Force start or reconnect. Returns true when ≥1 relay is connected.
  Future<bool> reconnect() async {
    if (_reconnecting) return isOnline;
    _reconnecting = true;
    notifyListeners();
    try {
      if (!_running || !isInitialized) {
        final ok = await start();
        if (!ok) return false;
        if (isOnline) return true;
        // Started but still 0 connected — try Rust reconnect once.
      }
      try {
        await nostrReconnect().timeout(const Duration(seconds: 20));
      } catch (e) {
        // NotInitialized → fall back to start.
        debugPrint('[Nostr] nostrReconnect: $e — retrying start');
        _running = false;
        final ok = await start();
        if (!ok) return false;
      }
      await refreshStatus();
      if (!isOnline) {
        await _pollUntilOnlineOrGiveUp(maxAttempts: 6);
      }
      if (!isOnline) {
        _lastError ??= 'no_relays';
      } else {
        _lastError = null;
      }
      _logRelaySnapshot(isOnline ? 'reconnect ok' : 'reconnect failed');
      return isOnline;
    } catch (e) {
      _lastError = '$e';
      debugPrint('[Nostr] reconnect failed: $e');
      return false;
    } finally {
      _reconnecting = false;
      notifyListeners();
    }
  }

  /// Ensure ≥1 relay before publish; one reconnect attempt if offline.
  Future<bool> ensureOnlineForPublish() async {
    if (!_running || !isInitialized) {
      final ok = await start();
      if (!ok) return false;
    }
    await refreshStatus();
    if (isOnline) return true;
    return reconnect();
  }

  /// Publish routed packet to Nostr relays. Returns true on success.
  Future<bool> publishPacket(MessagePacketDto packet) async {
    _publishing = true;
    notifyListeners();
    try {
      if (!await ensureOnlineForPublish()) {
        debugPrint('[Nostr] publish skipped — relays offline id=${packet.id}');
        return false;
      }
      final id = await nostrPublishPacket(packet: packet);
      debugPrint('[Nostr] published event=$id msg=${packet.id}');
      await refreshStatus();
      return id.isNotEmpty;
    } catch (e, st) {
      _lastError = '$e';
      debugPrint('[Nostr] publish failed: $e\n$st');
      return false;
    } finally {
      _publishing = false;
      notifyListeners();
    }
  }

  /// Geohash presence (ephemeral Nostr key; include rid+pk for messageable discovery).
  Future<bool> publishGeoPresence(
    String geohash, {
    required String nick,
    required String rid,
    required String pk,
  }) async {
    final g = geohash.trim().toLowerCase();
    if (g.isEmpty) return false;
    try {
      if (!isOnline) {
        await ensureOnlineForPublish();
      }
      if (!isOnline) return false;
      debugPrint('[GeoPresence] publish g=$g rid=$rid relays=$connectedRelays/$totalRelays');
      final id = await nostrPublishGeoPresence(
        geohash: g,
        nick: nick,
        rid: rid,
        pk: pk,
      );
      debugPrint('[Nostr] geo presence published event=$id g=$g rid=$rid');
      return id.isNotEmpty;
    } catch (e) {
      debugPrint('[Nostr] geo presence publish failed: $e');
      return false;
    }
  }

  Future<void> setGeoNoticeFilter(
    List<String> geohashes, {
    int? sinceSecsAgo,
  }) async {
    if (!_running) return;
    try {
      debugPrint(
        '[Notice] subscribe cells=$geohashes since=${sinceSecsAgo ?? "default"}',
      );
      await nostrSetGeoNoticeFilter(
        geohashes: geohashes,
        sinceSecsAgo:
            sinceSecsAgo == null ? null : BigInt.from(sinceSecsAgo),
      );
    } catch (e) {
      debugPrint('[Nostr] set geo notice filter failed: $e');
    }
  }

  /// One-shot fetch of historical geo notices (kind 20051) from connected relays.
  Future<List<GeoNoticeDto>> fetchGeoNotices(
    List<String> geohashes, {
    int? sinceSecsAgo,
  }) async {
    if (!_running) return const [];
    try {
      if (!isOnline) {
        await ensureOnlineForPublish();
      }
      if (!isOnline) return const [];
      final events = await nostrFetchGeoNotices(
        geohashes: geohashes,
        sinceSecsAgo:
            sinceSecsAgo == null ? null : BigInt.from(sinceSecsAgo),
      );
      debugPrint(
        '[Notice] backfill fetch count=${events.length} cells=$geohashes',
      );
      return events;
    } catch (e) {
      debugPrint('[Notice] backfill fetch failed: $e');
      return const [];
    }
  }

  Future<bool> publishGeoNotice(
    String geohash,
    String contentJson, {
    int? expiresAtSec,
  }) async {
    final g = geohash.trim().toLowerCase();
    if (g.isEmpty || contentJson.trim().isEmpty) return false;
    try {
      if (!isOnline) {
        await ensureOnlineForPublish();
      }
      if (!isOnline) return false;
      debugPrint('[Notice] nostr-publish g=$g relays=$connectedRelays/$totalRelays');
      final id = await nostrPublishGeoNotice(
        geohash: g,
        contentJson: contentJson,
        expiresAt:
            expiresAtSec == null ? null : BigInt.from(expiresAtSec),
      );
      debugPrint('[Notice] nostr-publish ok event=$id g=$g');
      return id.isNotEmpty;
    } catch (e) {
      debugPrint('[Notice] nostr-publish failed: $e');
      return false;
    }
  }

  Future<void> setGeoPresenceFilter(List<String> geohashes) async {
    if (!_running) return;
    try {
      debugPrint('[GeoPresence] subscribe cells=$geohashes');
      await nostrSetGeoPresenceFilter(geohashes: geohashes);
    } catch (e) {
      debugPrint('[Nostr] set geo filter failed: $e');
    }
  }

  Future<int> flushOfflineQueue() async {
    try {
      if (!isOnline) {
        await ensureOnlineForPublish();
      }
      final n = await flushOfflineQueueToNostr();
      debugPrint('[Nostr] flushed $n offline packets');
      await refreshStatus();
      return n;
    } catch (e) {
      debugPrint('[Nostr] flush failed: $e');
      return 0;
    }
  }

  Future<void> stop() async {
    _stopStatusPoll();
    await _presenceSub?.cancel();
    _presenceSub = null;
    await _noticeSub?.cancel();
    _noticeSub = null;
    try {
      await nostrSetGeoPresenceFilter(geohashes: const []);
      await nostrSetGeoNoticeFilter(geohashes: const []);
    } catch (_) {}
    _running = false;
    notifyListeners();
  }

  Future<void> wipeIdentityAndRestart({List<String>? relayUrls}) async {
    await stop();
    for (var attempt = 0; attempt < 3; attempt++) {
      try {
        await _storage.delete(key: _kSecretHex);
      } catch (e) {
        debugPrint('[Nostr] wipe secret attempt ${attempt + 1}: $e');
      }
      final remaining = await _readSecretSafe();
      if (remaining == null || remaining.isEmpty) break;
      if (attempt == 2) {
        try {
          await _storage.deleteAll();
        } catch (e) {
          debugPrint('[Nostr] wipe deleteAll failed: $e');
        }
      }
    }
    _status = null;
    _lastError = null;
    await start(relayUrls: relayUrls);
  }

  @override
  void dispose() {
    _stopStatusPoll();
    unawaited(stop());
    unawaited(_presenceController.close());
    super.dispose();
  }
}

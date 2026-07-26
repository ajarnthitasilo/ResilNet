import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/resilnet_protocol.dart';
import '../src/rust/api/dto.dart';
import '../src/rust/api/nostr_api.dart';

/// Cloud replacement — Nostr relay pool via Rust FFI (account-less secp256k1).
class NostrSyncService extends ChangeNotifier {
  NostrSyncService();

  static const _kSecretHex = 'resilnet_nostr_secret_hex';
  final _storage = const FlutterSecureStorage();

  NostrPoolStatusDto? _status;
  bool _running = false;
  bool _publishing = false;
  StreamSubscription<GeoPresenceDto>? _presenceSub;
  final _presenceController = StreamController<GeoPresenceDto>.broadcast();

  bool get running => _running;
  NostrPoolStatusDto? get status => _status;
  String get npub => _status?.npub ?? '';
  String get pubkeyHex => _status?.pubkeyHex ?? '';
  int get connectedRelays => _status?.connectedRelays ?? 0;
  int get totalRelays => _status?.totalRelays ?? 0;
  bool get isOnline => (_status?.connectedRelays ?? 0) > 0;

  /// Anonymous geohash presence events (kind 20050).
  Stream<GeoPresenceDto> get geoPresenceStream => _presenceController.stream;

  SyncPhase get phase =>
      _publishing ? SyncPhase.cloudSync : SyncPhase.idle;

  Future<void> start({List<String>? relayUrls}) async {
    if (_running) return;
    final stored = await _storage.read(key: _kSecretHex);
    try {
      final result = await initNostr(
        secretKeyHex: (stored != null && stored.isNotEmpty) ? stored : null,
        relayUrls: relayUrls,
      );
      if (result.secretKeyHex.isNotEmpty && result.secretKeyHex != stored) {
        await _storage.write(key: _kSecretHex, value: result.secretKeyHex);
      }
      _status = result.status;
      _running = true;
      await _attachPresenceStream();
      notifyListeners();
      debugPrint(
        '[Nostr] started npub=${_status?.npub} '
        'relays=${_status?.connectedRelays}/${_status?.totalRelays}',
      );
    } catch (e, st) {
      debugPrint('[Nostr] start failed: $e\n$st');
      rethrow;
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

  Future<void> refreshStatus() async {
    try {
      _status = await getNostrStatus();
      notifyListeners();
    } catch (e) {
      debugPrint('[Nostr] status failed: $e');
    }
  }

  Future<void> reconnect() async {
    try {
      await nostrReconnect();
      await refreshStatus();
    } catch (e) {
      debugPrint('[Nostr] reconnect failed: $e');
    }
  }

  /// Publish routed packet to Nostr relays. Returns true on success.
  Future<bool> publishPacket(MessagePacketDto packet) async {
    _publishing = true;
    notifyListeners();
    try {
      final id = await nostrPublishPacket(packet: packet);
      debugPrint('[Nostr] published event=$id msg=${packet.id}');
      await refreshStatus();
      return true;
    } catch (e, st) {
      debugPrint('[Nostr] publish failed: $e\n$st');
      return false;
    } finally {
      _publishing = false;
      notifyListeners();
    }
  }

  /// Anonymous geohash presence (ephemeral key on Rust side).
  Future<bool> publishGeoPresence(String geohash) async {
    final g = geohash.trim().toLowerCase();
    if (g.isEmpty || !_running) return false;
    try {
      final id = await nostrPublishGeoPresence(geohash: g);
      debugPrint('[Nostr] geo presence published event=$id g=$g');
      return id.isNotEmpty;
    } catch (e) {
      debugPrint('[Nostr] geo presence publish failed: $e');
      return false;
    }
  }

  /// Subscribe relays to presence for these geohash cells (`[]` clears).
  Future<void> setGeoPresenceFilter(List<String> geohashes) async {
    if (!_running) return;
    try {
      await nostrSetGeoPresenceFilter(geohashes: geohashes);
    } catch (e) {
      debugPrint('[Nostr] set geo filter failed: $e');
    }
  }

  Future<int> flushOfflineQueue() async {
    try {
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
    await _presenceSub?.cancel();
    _presenceSub = null;
    try {
      await nostrSetGeoPresenceFilter(geohashes: const []);
    } catch (_) {}
    _running = false;
    notifyListeners();
  }

  /// Panic wipe: delete stored Nostr secret and start a fresh identity.
  Future<void> wipeIdentityAndRestart({List<String>? relayUrls}) async {
    await stop();
    try {
      await _storage.delete(key: _kSecretHex);
    } catch (e) {
      debugPrint('[Nostr] wipe secret failed: $e');
    }
    _status = null;
    await start(relayUrls: relayUrls);
  }

  @override
  void dispose() {
    unawaited(stop());
    unawaited(_presenceController.close());
    super.dispose();
  }
}

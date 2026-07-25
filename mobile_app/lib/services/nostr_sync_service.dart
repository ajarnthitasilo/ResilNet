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

  bool get running => _running;
  NostrPoolStatusDto? get status => _status;
  String get npub => _status?.npub ?? '';
  String get pubkeyHex => _status?.pubkeyHex ?? '';
  int get connectedRelays => _status?.connectedRelays ?? 0;
  int get totalRelays => _status?.totalRelays ?? 0;
  bool get isOnline => (_status?.connectedRelays ?? 0) > 0;

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
    _running = false;
    notifyListeners();
  }
}

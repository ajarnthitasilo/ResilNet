import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data/trusted_keys_default.dart';
import '../models/peer.dart';
import '../models/trusted_keys_manifest.dart';
import 'database_service.dart';

/// จัดการ Trusted List ของคณะกรรมการหมู่บ้าน (Verified Issuers)
///
/// แหล่งข้อมูล: bundled defaults + SecureStorage (ไม่มี cloud registry แล้ว)
class TrustedKeysService extends ChangeNotifier {
  TrustedKeysService({required DatabaseService database}) : _db = database;

  static const _kTrustedKeysJson = 'resilnet_trusted_keys_json';

  final DatabaseService _db;
  final _storage = const FlutterSecureStorage();

  TrustedKeysManifest _manifest = TrustedKeysManifest.fromJson(
    jsonDecode(kDefaultTrustedKeysJson) as Map<String, dynamic>,
  );

  TrustedKeysManifest get manifest => _manifest;
  int get issuerCount => _manifest.issuers.length;

  Future<void> init() async {
    final raw = await _storage.read(key: _kTrustedKeysJson);
    if (raw != null && raw.trim().isNotEmpty) {
      try {
        _manifest = _parseAndValidate(raw);
      } catch (e) {
        debugPrint('[TrustedKeys] invalid stored JSON, using default: $e');
        _manifest = TrustedKeysManifest.fromJson(
          jsonDecode(kDefaultTrustedKeysJson) as Map<String, dynamic>,
        );
      }
    }
    await _syncIssuersToPeers();
    notifyListeners();
  }

  /// Reload bundled defaults when local list is empty.
  Future<bool> reloadDefaultsIfEmpty() async {
    if (_manifest.issuers.isNotEmpty) return false;
    _manifest = TrustedKeysManifest.fromJson(
      jsonDecode(kDefaultTrustedKeysJson) as Map<String, dynamic>,
    );
    await _storage.write(key: _kTrustedKeysJson, value: kDefaultTrustedKeysJson);
    await _syncIssuersToPeers();
    notifyListeners();
    return true;
  }

  TrustedKeysManifest _parseAndValidate(String raw) {
    final obj = jsonDecode(raw) as Map<String, dynamic>;
    final manifest = TrustedKeysManifest.fromJson(obj);
    if (manifest.version < 1) {
      throw FormatException('trusted_keys version must be >= 1');
    }
    return manifest;
  }

  bool isTrustedIssuer(String publicKeyHash) {
    final id = publicKeyHash.trim();
    if (id.isEmpty) return false;
    return _manifest.issuers.any((i) => i.id == id);
  }

  TrustedIssuer? issuerFor(String publicKeyHash) {
    final id = publicKeyHash.trim();
    for (final i in _manifest.issuers) {
      if (i.id == id) return i;
    }
    return null;
  }

  Set<String> get trustedIds => _manifest.issuers.map((e) => e.id).toSet();

  /// บันทึก JSON ลง SecureStorage และอัปเดต peers (เฉพาะเมื่อใหม่กว่า)
  Future<bool> applyRemoteJson(String raw) async {
    final remote = _parseAndValidate(raw);

    final isBootstrap = _manifest.timestamp == 0 && _manifest.issuers.isEmpty;
    final isNewer = remote.isNewerThan(_manifest);
    if (!isNewer && !isBootstrap) {
      if (remote.version < _manifest.version ||
          (remote.version == _manifest.version &&
              remote.timestamp <= _manifest.timestamp)) {
        debugPrint(
          '[TrustedKeys] rejected stale/downgrade remote v=${remote.version} ts=${remote.timestamp}',
        );
        return false;
      }
    }
    if (!isNewer && isBootstrap && remote.issuers.isEmpty) {
      debugPrint('[TrustedKeys] remote empty on bootstrap — skipped');
      return false;
    }

    await _storage.write(key: _kTrustedKeysJson, value: raw);
    _manifest = remote;
    await _syncIssuersToPeers();
    notifyListeners();
    debugPrint(
      '[TrustedKeys] applied v=${remote.version} ts=${remote.timestamp} issuers=${remote.issuers.length}',
    );
    return true;
  }

  Future<bool> applyRemoteManifest(TrustedKeysManifest remote) async {
    return applyRemoteJson(jsonEncode(remote.toJson()));
  }

  Future<void> _syncIssuersToPeers() async {
    for (final issuer in _manifest.issuers) {
      final existing = await _db.getPeer(issuer.id);
      var pub = issuer.publicKeyPem?.trim() ?? '';
      if (pub.isEmpty) pub = existing?.publicKey.trim() ?? '';
      await _db.upsertPeer(
        Peer(
          id: issuer.id,
          publicKey: pub,
          displayName: issuer.name,
          lastSeen: DateTime.now().millisecondsSinceEpoch,
          isBlocked: existing?.isBlocked ?? false,
          isVerifiedIssuer: true,
        ),
      );
    }
  }
}

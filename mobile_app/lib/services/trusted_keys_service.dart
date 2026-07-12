import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../data/trusted_keys_default.dart';
import '../models/peer.dart';
import '../models/trusted_keys_manifest.dart';
import 'database_service.dart';
import 'supabase_config.dart';
import 'supabase_row_mapper.dart';

/// จัดการ Trusted List ของคณะกรรมการหมู่บ้าน (Verified Issuers)
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

  /// ดึงรายชื่อกรรมการจากตาราง `committee_keys` (หลัก)
  /// fallback: trusted_keys.json ใน Storage
  Future<bool> fetchFromSupabase(SupabaseClient supabase) async {
    try {
      final rows = await supabase
          .from(SupabaseConfig.committeeKeysTable)
          .select();
      final list = (rows as List).cast<Map<String, dynamic>>();
      if (list.isNotEmpty) {
        return applyRemoteManifest(_manifestFromCommitteeRows(list));
      }
      debugPrint(
        '[TrustedKeys] committee_keys empty — trying Storage fallback',
      );
    } catch (e) {
      debugPrint('[TrustedKeys] committee_keys fetch failed: $e');
    }

    try {
      final bucket = SupabaseConfig.trustedKeysBucket;
      final path = SupabaseConfig.trustedKeysPath;
      final bytes = await supabase.storage.from(bucket).download(path);
      final raw = utf8.decode(bytes);
      return applyRemoteJson(raw);
    } catch (e) {
      debugPrint('[TrustedKeys] Storage fallback failed: $e');
      return false;
    }
  }

  TrustedKeysManifest _manifestFromCommitteeRows(
    List<Map<String, dynamic>> rows,
  ) {
    final issuers = <TrustedIssuer>[];
    var maxTs = 0;

    for (final row in rows) {
      if (!SupabaseRowMapper.isActive(row)) continue;

      final id = SupabaseRowMapper.pickString(row, [
        'public_key_hash',
        'key_hash',
        'sender_id',
      ]);
      if (id.isEmpty) continue;

      final name = SupabaseRowMapper.pickString(row, [
        'display_name',
        'name',
        'sender_name',
      ]);
      final pem = SupabaseRowMapper.pickString(row, [
        'public_key_pem',
        'public_key',
        'pub_key',
      ]);

      issuers.add(
        TrustedIssuer(
          id: id,
          name: name.isEmpty ? null : name,
          publicKeyPem: pem.isEmpty ? null : pem,
        ),
      );

      final ts = SupabaseRowMapper.updatedAtMs(row);
      if (ts > maxTs) maxTs = ts;
    }

    return TrustedKeysManifest(
      version: 2,
      timestamp: maxTs > 0 ? maxTs : DateTime.now().millisecondsSinceEpoch,
      issuers: issuers,
    );
  }

  Future<bool> applyRemoteManifest(TrustedKeysManifest remote) async {
    final raw = jsonEncode(remote.toJson());
    return applyRemoteJson(raw);
  }

  Future<void> _syncIssuersToPeers() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    for (final issuer in _manifest.issuers) {
      final existing = await _db.getPeer(issuer.id);
      var pub = issuer.publicKeyPem?.trim() ?? '';
      if (pub.isEmpty) pub = existing?.publicKey.trim() ?? '';
      await _db.upsertPeer(
        Peer(
          id: issuer.id,
          publicKey: pub,
          displayName: issuer.name ?? existing?.displayName,
          isVerifiedIssuer: true,
          isBlocked: existing?.isBlocked ?? false,
          lastSeen: existing?.lastSeen ?? now,
          deviceId: existing?.deviceId,
        ),
      );
    }
  }
}

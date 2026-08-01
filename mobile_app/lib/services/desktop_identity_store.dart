import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Desktop (macOS) identity fallback when Keychain SecItem fails (-34018).
///
/// Stores RSA PEMs under Application Support with restrictive file mode.
/// Not used on iOS/Android — those keep Keychain/Keystore only.
class DesktopIdentityStore {
  DesktopIdentityStore._();
  static final instance = DesktopIdentityStore._();

  static const _dirName = 'resilnet_identity';
  static const _fileName = 'rsa_identity.json';

  Future<File> _file() async {
    final base = await getApplicationSupportDirectory();
    final dir = Directory(p.join(base.path, _dirName));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return File(p.join(dir.path, _fileName));
  }

  Future<({String? priv, String? pub})> read() async {
    try {
      final f = await _file();
      if (!await f.exists()) return (priv: null, pub: null);
      final raw = await f.readAsString();
      if (raw.trim().isEmpty) return (priv: null, pub: null);
      final obj = jsonDecode(raw);
      if (obj is! Map) return (priv: null, pub: null);
      final priv = (obj['privatePem'] as String?)?.trim();
      final pub = (obj['publicPem'] as String?)?.trim();
      return (
        priv: (priv == null || priv.isEmpty) ? null : priv,
        pub: (pub == null || pub.isEmpty) ? null : pub,
      );
    } catch (e) {
      debugPrint('[DesktopIdentity] read failed: $e');
      return (priv: null, pub: null);
    }
  }

  Future<void> write({required String privatePem, required String publicPem}) async {
    final f = await _file();
    final payload = jsonEncode({
      'v': 1,
      'privatePem': privatePem,
      'publicPem': publicPem,
    });
    await f.writeAsString(payload, flush: true);
    try {
      await Process.run('chmod', ['600', f.path]);
    } catch (_) {}
    debugPrint('[DesktopIdentity] wrote ${f.path}');
  }

  Future<void> clear() async {
    try {
      final f = await _file();
      if (await f.exists()) await f.delete();
    } catch (e) {
      debugPrint('[DesktopIdentity] clear failed: $e');
    }
  }
}

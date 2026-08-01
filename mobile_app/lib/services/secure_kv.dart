import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'secure_storage.dart';

/// Platform secure key-value API (Keychain on iOS/Android, file on macOS).
///
/// macOS ad-hoc builds trigger Keychain "Allow" prompts / -34018; denying
/// those bricks boot. File-backed storage avoids SecItem entirely.
abstract class SecureKv {
  Future<String?> read({required String key});
  Future<void> write({required String key, required String value});
  Future<void> delete({required String key});
  Future<void> deleteAll();
}

SecureKv get resilnetSecureKv =>
    Platform.isMacOS ? DesktopFileSecureKv.instance : KeychainSecureKv.instance;

class KeychainSecureKv implements SecureKv {
  KeychainSecureKv(this._storage);

  static final instance = KeychainSecureKv(resilnetSecureStorage);
  final FlutterSecureStorage _storage;

  @override
  Future<String?> read({required String key}) => _storage.read(key: key);

  @override
  Future<void> write({required String key, required String value}) =>
      _storage.write(key: key, value: value);

  @override
  Future<void> delete({required String key}) => _storage.delete(key: key);

  @override
  Future<void> deleteAll() => _storage.deleteAll();
}

class DesktopFileSecureKv implements SecureKv {
  DesktopFileSecureKv._();
  static final instance = DesktopFileSecureKv._();

  static const _dirName = 'resilnet_secure_kv';
  static const _fileName = 'kv.json';

  Future<File> _file() async {
    final base = await getApplicationSupportDirectory();
    final dir = Directory(p.join(base.path, _dirName));
    if (!await dir.exists()) await dir.create(recursive: true);
    return File(p.join(dir.path, _fileName));
  }

  Future<Map<String, String>> _load() async {
    try {
      final f = await _file();
      if (!await f.exists()) return {};
      final raw = await f.readAsString();
      if (raw.trim().isEmpty) return {};
      final obj = jsonDecode(raw);
      if (obj is! Map) return {};
      final out = <String, String>{};
      for (final e in obj.entries) {
        final k = e.key.toString();
        final v = e.value;
        if (v is String) out[k] = v;
      }
      return out;
    } catch (e) {
      debugPrint('[SecureKv] load failed: $e');
      return {};
    }
  }

  Future<void> _save(Map<String, String> map) async {
    final f = await _file();
    await f.writeAsString(jsonEncode(map), flush: true);
    try {
      await Process.run('chmod', ['600', f.path]);
    } catch (_) {}
  }

  @override
  Future<String?> read({required String key}) async {
    final map = await _load();
    return map[key];
  }

  @override
  Future<void> write({required String key, required String value}) async {
    final map = await _load();
    map[key] = value;
    await _save(map);
  }

  @override
  Future<void> delete({required String key}) async {
    final map = await _load();
    if (map.remove(key) != null) await _save(map);
  }

  @override
  Future<void> deleteAll() async {
    await _save({});
  }
}

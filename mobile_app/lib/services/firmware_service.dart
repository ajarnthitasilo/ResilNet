import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'firmware_config.dart';

/// แหล่งที่มาของไฟล์เฟิร์มแวร์ที่พร้อมใช้แฟลช
enum FirmwareSource {
  onlineLatest,
  offlineCached,
  offlineBundledBaseline,
  unavailable,
}

/// ผลการ resolve เฟิร์มแวร์ที่ดีที่สุดที่หาได้ตอนนี้
class ResolvedFirmware {
  const ResolvedFirmware({
    required this.source,
    this.file,
    this.version,
    this.error,
  });

  final FirmwareSource source;
  final File? file;
  final String? version;
  final String? error;

  bool get isUsable => file != null && source != FirmwareSource.unavailable;
}

/// ดาวน์โหลด/จัดการไฟล์เฟิร์มแวร์ `.bin` แบบ Hybrid:
/// online-first แล้ว fallback เป็น cache ในเครื่อง → baseline ที่ฝังมากับแอป
class FirmwareService extends ChangeNotifier {
  FirmwareService({
    http.Client Function()? httpClientFactory,
    Future<ByteData> Function(String assetPath)? assetLoader,
    Directory? firmwareDirOverride,
    String Function(FirmwareKind kind)? urlResolver,
  })  : _httpClientFactory = httpClientFactory ?? http.Client.new,
        _assetLoader = assetLoader ?? rootBundle.load,
        _firmwareDirOverride = firmwareDirOverride,
        _urlResolver = urlResolver ?? FirmwareConfig.resolveDownloadUrl;

  final http.Client Function() _httpClientFactory;
  final Future<ByteData> Function(String assetPath) _assetLoader;
  final Directory? _firmwareDirOverride;
  final String Function(FirmwareKind kind) _urlResolver;

  final Map<FirmwareKind, _FirmwareLocalInfo> _local = {};
  final Map<FirmwareKind, _DownloadProgress> _downloads = {};
  Map<String, dynamic>? _baselineManifest;

  FirmwareKind? get activeDownload => _downloads.entries
      .where((e) => e.value.inProgress)
      .map((e) => e.key)
      .firstOrNull;

  bool isDownloading(FirmwareKind kind) =>
      _downloads[kind]?.inProgress ?? false;

  double? downloadProgress(FirmwareKind kind) => _downloads[kind]?.fraction;

  /// โหลดข้อมูลไฟล์ที่มีอยู่ในเครื่อง (เรียกครั้งแรกก่อนแสดง UI)
  Future<void> refreshLocalInfo() async {
    for (final kind in FirmwareKind.values) {
      final file = await _localFile(kind);
      if (await file.exists()) {
        final stat = await file.stat();
        final meta = await _readMeta(kind);
        _local[kind] = _FirmwareLocalInfo(
          path: file.path,
          sizeBytes: stat.size,
          modifiedAt: stat.modified,
          source: meta?.source ?? FirmwareSource.offlineCached,
          version: meta?.version,
        );
      } else {
        _local.remove(kind);
      }
    }
    notifyListeners();
  }

  Future<File?> localFile(FirmwareKind kind) async {
    await refreshLocalInfo();
    final info = _local[kind];
    if (info == null) return null;
    return File(info.path);
  }

  String? localPath(FirmwareKind kind) => _local[kind]?.path;

  int? localSizeBytes(FirmwareKind kind) => _local[kind]?.sizeBytes;

  DateTime? localModifiedAt(FirmwareKind kind) => _local[kind]?.modifiedAt;

  bool hasLocalFirmware(FirmwareKind kind) => _local.containsKey(kind);

  /// แหล่งที่มาของไฟล์ในเครื่อง (จาก metadata sidecar)
  FirmwareSource? localSource(FirmwareKind kind) => _local[kind]?.source;

  String? localVersion(FirmwareKind kind) => _local[kind]?.version;

  /// Resolve เฟิร์มแวร์ที่ดีที่สุดตามลำดับ:
  /// 1) ดาวน์โหลดออนไลน์ (ถ้าตั้ง URL ไว้)
  /// 2) ไฟล์ cache ในเครื่อง (ตรวจ checksum ถ้ามี metadata)
  /// 3) baseline ที่ฝังมากับแอป (ตรวจ checksum + minCompatibleVersion)
  Future<ResolvedFirmware> ensureFirmware(FirmwareKind kind) async {
    // 1) online-first
    final url = _urlResolver(kind);
    if (url.trim().isNotEmpty) {
      try {
        final file = await download(kind);
        return ResolvedFirmware(
          source: FirmwareSource.onlineLatest,
          file: file,
          version: _local[kind]?.version,
        );
      } catch (e) {
        debugPrint('FirmwareService: online download failed, fallback: $e');
      }
    }

    // 2) cached copy
    final cached = await _verifiedCachedFile(kind);
    if (cached != null) {
      return ResolvedFirmware(
        source: FirmwareSource.offlineCached,
        file: cached,
        version: _local[kind]?.version,
      );
    }

    // 3) bundled baseline
    return extractBundledBaseline(kind);
  }

  /// แตกไฟล์ baseline จาก asset ลง local dir (ตรวจ sha256 + compat ก่อน)
  Future<ResolvedFirmware> extractBundledBaseline(FirmwareKind kind) async {
    final Map<String, dynamic> manifest;
    final Uint8List bytes;
    try {
      manifest = await _loadBaselineManifest();
      final data = await _assetLoader(kind.baselineAssetPath);
      bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    } catch (e) {
      return ResolvedFirmware(
        source: FirmwareSource.unavailable,
        error: 'baseline asset missing: $e',
      );
    }

    final artifact =
        (manifest['artifacts'] as Map<String, dynamic>?)?[kind.manifestKey]
            as Map<String, dynamic>?;
    final expectedSha = artifact?['sha256'] as String?;
    final baselineVersion = manifest['appVersion'] as String? ?? 'unknown';

    // Compatibility guard: baseline เก่าเกินไป → ห้ามแฟลช ต้องออนไลน์
    final minCompat = FirmwareConfig.minCompatibleVersion.trim().isNotEmpty
        ? FirmwareConfig.minCompatibleVersion.trim()
        : (manifest['minCompatibleVersion'] as String? ?? '');
    if (minCompat.isNotEmpty &&
        !FirmwareConfig.isVersionAtLeast(baselineVersion, minCompat)) {
      return ResolvedFirmware(
        source: FirmwareSource.unavailable,
        version: baselineVersion,
        error: 'baseline $baselineVersion < minCompatible $minCompat',
      );
    }

    // Checksum guard
    if (expectedSha != null && expectedSha.isNotEmpty) {
      final actual = sha256.convert(bytes).toString();
      if (actual != expectedSha.toLowerCase()) {
        return ResolvedFirmware(
          source: FirmwareSource.unavailable,
          version: baselineVersion,
          error: 'baseline checksum mismatch',
        );
      }
    }

    final file = await _localFile(kind);
    final tmp = File('${file.path}.part');
    await tmp.parent.create(recursive: true);
    await tmp.writeAsBytes(bytes, flush: true);
    if (await file.exists()) await file.delete();
    await tmp.rename(file.path);
    await _writeMeta(
      kind,
      _FirmwareMeta(
        source: FirmwareSource.offlineBundledBaseline,
        version: baselineVersion,
        sha256Hex: expectedSha ?? sha256.convert(bytes).toString(),
      ),
    );
    await refreshLocalInfo();

    return ResolvedFirmware(
      source: FirmwareSource.offlineBundledBaseline,
      file: file,
      version: baselineVersion,
    );
  }

  /// ดาวน์โหลด `.bin` จาก URL ที่กำหนดใน [FirmwareConfig]
  Future<File> download(FirmwareKind kind) async {
    if (isDownloading(kind)) {
      throw StateError('กำลังดาวน์โหลด ${kind.title} อยู่แล้ว');
    }

    final url = _urlResolver(kind);
    if (url.isEmpty) {
      throw StateError(
        'ยังไม่ได้ตั้ง URL เฟิร์มแวร์\n'
        'ใช้ --dart-define=RESILNET_FW_STANDALONE_URL=... หรือ RESILNET_FIRMWARE_BASE_URL',
      );
    }

    _downloads[kind] = _DownloadProgress(inProgress: true, received: 0, total: 0);
    notifyListeners();

    try {
      final client = _httpClientFactory();
      final request = http.Request('GET', Uri.parse(url));
      final response = await client.send(request);

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw HttpException(
          'ดาวน์โหลดไม่สำเร็จ HTTP ${response.statusCode}',
          uri: Uri.parse(url),
        );
      }

      final total = response.contentLength ?? 0;
      final bytes = <int>[];
      await for (final chunk in response.stream) {
        bytes.addAll(chunk);
        _downloads[kind] = _DownloadProgress(
          inProgress: true,
          received: bytes.length,
          total: total > 0 ? total : bytes.length,
        );
        notifyListeners();
      }
      client.close();

      if (bytes.isEmpty) {
        throw const HttpException('ไฟล์เฟิร์มแวร์ว่างเปล่า');
      }

      final dir = await _firmwareDir();
      final file = File(p.join(dir.path, kind.localFileName));
      final tmp = File('${file.path}.part');
      await tmp.writeAsBytes(bytes, flush: true);
      if (await file.exists()) await file.delete();
      await tmp.rename(file.path);

      await _writeMeta(
        kind,
        _FirmwareMeta(
          source: FirmwareSource.onlineLatest,
          version: null,
          sha256Hex: sha256.convert(bytes).toString(),
        ),
      );

      final stat = await file.stat();
      _local[kind] = _FirmwareLocalInfo(
        path: file.path,
        sizeBytes: stat.size,
        modifiedAt: stat.modified,
        source: FirmwareSource.onlineLatest,
        version: null,
      );
      return file;
    } finally {
      _downloads.remove(kind);
      notifyListeners();
    }
  }

  Future<void> deleteLocal(FirmwareKind kind) async {
    final file = await _localFile(kind);
    if (await file.exists()) {
      await file.delete();
    }
    final meta = File('${file.path}.meta.json');
    if (await meta.exists()) {
      await meta.delete();
    }
    _local.remove(kind);
    notifyListeners();
  }

  /// คืน cached file เฉพาะเมื่อ checksum ตรงกับ metadata (ถ้ามี)
  Future<File?> _verifiedCachedFile(FirmwareKind kind) async {
    final file = await _localFile(kind);
    if (!await file.exists()) return null;

    final meta = await _readMeta(kind);
    if (meta?.sha256Hex != null && meta!.sha256Hex!.isNotEmpty) {
      final actual = sha256.convert(await file.readAsBytes()).toString();
      if (actual != meta.sha256Hex!.toLowerCase()) {
        debugPrint('FirmwareService: cached checksum mismatch — discarding');
        await deleteLocal(kind);
        return null;
      }
    }
    return file;
  }

  Future<Map<String, dynamic>> _loadBaselineManifest() async {
    final cached = _baselineManifest;
    if (cached != null) return cached;
    final data = await _assetLoader(FirmwareConfig.baselineManifestAsset);
    final jsonStr = utf8.decode(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    );
    final manifest = jsonDecode(jsonStr) as Map<String, dynamic>;
    _baselineManifest = manifest;
    return manifest;
  }

  Future<_FirmwareMeta?> _readMeta(FirmwareKind kind) async {
    final file = await _localFile(kind);
    final metaFile = File('${file.path}.meta.json');
    if (!await metaFile.exists()) return null;
    try {
      final map =
          jsonDecode(await metaFile.readAsString()) as Map<String, dynamic>;
      return _FirmwareMeta(
        source: FirmwareSource.values.firstWhere(
          (s) => s.name == map['source'],
          orElse: () => FirmwareSource.offlineCached,
        ),
        version: map['version'] as String?,
        sha256Hex: map['sha256'] as String?,
      );
    } catch (_) {
      return null;
    }
  }

  Future<void> _writeMeta(FirmwareKind kind, _FirmwareMeta meta) async {
    final file = await _localFile(kind);
    final metaFile = File('${file.path}.meta.json');
    await metaFile.writeAsString(
      jsonEncode({
        'source': meta.source.name,
        'version': meta.version,
        'sha256': meta.sha256Hex,
      }),
      flush: true,
    );
  }

  Future<Directory> _firmwareDir() async {
    final override = _firmwareDirOverride;
    final Directory dir;
    if (override != null) {
      dir = Directory(p.join(override.path, 'firmware'));
    } else {
      final base = await getApplicationDocumentsDirectory();
      dir = Directory(p.join(base.path, 'firmware'));
    }
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  Future<File> _localFile(FirmwareKind kind) async {
    final dir = await _firmwareDir();
    return File(p.join(dir.path, kind.localFileName));
  }
}

class _FirmwareLocalInfo {
  _FirmwareLocalInfo({
    required this.path,
    required this.sizeBytes,
    required this.modifiedAt,
    required this.source,
    this.version,
  });

  final String path;
  final int sizeBytes;
  final DateTime modifiedAt;
  final FirmwareSource source;
  final String? version;
}

class _FirmwareMeta {
  _FirmwareMeta({
    required this.source,
    required this.version,
    required this.sha256Hex,
  });

  final FirmwareSource source;
  final String? version;
  final String? sha256Hex;
}

class _DownloadProgress {
  _DownloadProgress({
    required this.inProgress,
    required this.received,
    required this.total,
  });

  final bool inProgress;
  final int received;
  final int total;

  double get fraction => total > 0 ? received / total : 0;
}

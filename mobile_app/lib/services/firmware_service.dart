import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'firmware_config.dart';

/// ดาวน์โหลดและจัดการไฟล์เฟิร์มแวร์ `.bin` ในเครื่อง
class FirmwareService extends ChangeNotifier {
  final Map<FirmwareKind, _FirmwareLocalInfo> _local = {};
  final Map<FirmwareKind, _DownloadProgress> _downloads = {};

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
        _local[kind] = _FirmwareLocalInfo(
          path: file.path,
          sizeBytes: stat.size,
          modifiedAt: stat.modified,
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

  /// ดาวน์โหลด `.bin` จาก URL ที่กำหนดใน [FirmwareConfig]
  Future<File> download(FirmwareKind kind) async {
    if (isDownloading(kind)) {
      throw StateError('กำลังดาวน์โหลด ${kind.title} อยู่แล้ว');
    }

    final url = FirmwareConfig.resolveDownloadUrl(kind);
    if (url.isEmpty) {
      throw StateError(
        'ยังไม่ได้ตั้ง URL เฟิร์มแวร์\n'
        'ใช้ --dart-define=RESILNET_FW_STANDALONE_URL=... หรือ RESILNET_FIRMWARE_BASE_URL',
      );
    }

    _downloads[kind] = _DownloadProgress(inProgress: true, received: 0, total: 0);
    notifyListeners();

    try {
      final client = http.Client();
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

      final dir = await _firmwareDir();
      final file = File(p.join(dir.path, kind.localFileName));
      final tmp = File('${file.path}.part');
      await tmp.writeAsBytes(bytes, flush: true);
      if (await file.exists()) await file.delete();
      await tmp.rename(file.path);

      final stat = await file.stat();
      _local[kind] = _FirmwareLocalInfo(
        path: file.path,
        sizeBytes: stat.size,
        modifiedAt: stat.modified,
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
    _local.remove(kind);
    notifyListeners();
  }

  Future<Directory> _firmwareDir() async {
    final base = await getApplicationDocumentsDirectory();
    final dir = Directory(p.join(base.path, 'firmware'));
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
  });

  final String path;
  final int sizeBytes;
  final DateTime modifiedAt;
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

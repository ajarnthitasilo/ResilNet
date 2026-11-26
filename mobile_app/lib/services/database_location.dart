import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/// ชื่อไฟล์ฐานข้อมูลข้อความ
const String kDatabaseFileName = 'resilnet.db';

/// ไฟล์พ่วงที่ SQLite สร้างได้ (ต้องย้ายตามไปด้วยถ้ามี)
const List<String> kSqliteSidecarSuffixes = <String>['-wal', '-shm', '-journal'];

/// ผลลัพธ์ของการหาที่เก็บฐานข้อมูล
@immutable
class DatabaseLocation {
  const DatabaseLocation({required this.path, this.migratedFrom, this.note});

  /// ไฟล์ที่จะเปิดใช้งานจริง
  final String path;

  /// ไม่ใช่ null เมื่อการบูตครั้งนี้คัดลอกฐานข้อมูลเก่ามาให้
  final String? migratedFrom;

  /// ข้อความสั้น ๆ สำหรับ log
  final String? note;

  @override
  String toString() =>
      'DatabaseLocation(path: $path, migratedFrom: $migratedFrom, note: $note)';
}

bool get _isDesktop =>
    !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

/// หาที่เก็บฐานข้อมูล และย้ายของเก่ามาให้ถ้าจำเป็น
///
/// เดสก์ท็อป (macOS/Windows/Linux): ใช้ [getApplicationSupportDirectory] ให้ตรงกับ
/// `DesktopIdentityStore` และ `DesktopFileSecureKv` เพราะบน macOS ที่ไม่ sandbox
/// `getDatabasesPath()` ชี้ไปที่ `~/Documents` ซึ่งอาจถูก iCloud ซิงก์ขึ้นคลาวด์
///
/// มือถือ: ไม่แตะ — Android `getDatabasesPath()` คือโฟลเดอร์ส่วนตัวของแอปอยู่แล้ว
/// (`/data/data/<pkg>/databases`) และ iOS ก็อยู่ใน sandbox ของแอป การย้ายจึงไม่ช่วย
/// อะไร แต่เสี่ยงกับเครื่องที่ใช้งานได้ดีอยู่แล้ว
Future<DatabaseLocation> resolveDatabaseLocation({
  Duration legacyProbeTimeout = const Duration(seconds: 5),
}) async {
  if (!_isDesktop) {
    final dir = await getDatabasesPath();
    return DatabaseLocation(
      path: p.join(dir, kDatabaseFileName),
      note: 'mobile-default',
    );
  }

  final support = await getApplicationSupportDirectory();

  String? legacyDir;
  try {
    legacyDir = await getDatabasesPath().timeout(legacyProbeTimeout);
  } catch (e) {
    // ที่เก็บเดิมอาจค้าง (เช่น iCloud กำลังค้าง) — ห้ามให้แอปค้างตอนบูต
    legacyDir = null;
    debugPrint('[DB] legacy path probe failed: $e');
  }

  return migrateDatabaseIfNeeded(
    newDir: support.path,
    legacyDir: legacyDir,
    legacyProbeTimeout: legacyProbeTimeout,
  );
}

/// คัดลอกฐานข้อมูลจากที่เก็บเดิมมาที่ใหม่แบบไม่ทำข้อมูลหาย
///
/// กฎ:
/// * มีไฟล์ที่ใหม่อยู่แล้ว -> ใช้ของใหม่ ไม่แตะของเก่า
/// * มีแต่ของเก่า -> คัดลอกไปไฟล์ชั่วคราว เทียบขนาด + นับจำนวนข้อความ แล้วจึง rename
/// * ไม่มีทั้งคู่ -> ติดตั้งใหม่ ใช้ที่ใหม่
/// * ของเก่าอ่านไม่ได้/ค้าง -> ไม่ค้างรอ ใช้ที่ใหม่
/// * คัดลอกค้างกลางทางจากรอบก่อน -> ลบไฟล์ชั่วคราวแล้วเริ่มใหม่
/// * ล้มเหลวกลางทาง -> เก็บของเก่าไว้ใช้ต่อ (ไม่เคยลบไฟล์ต้นฉบับ)
@visibleForTesting
Future<DatabaseLocation> migrateDatabaseIfNeeded({
  required String newDir,
  required String? legacyDir,
  Duration legacyProbeTimeout = const Duration(seconds: 5),
  Duration copyTimeout = const Duration(seconds: 60),
  Duration countTimeout = const Duration(seconds: 15),
  Future<int?> Function(String path)? countMessages,
}) async {
  final newPath = p.join(newDir, kDatabaseFileName);
  final tmpPath = '$newPath.migrating';

  await Directory(newDir).create(recursive: true);

  // เศษจากรอบที่ถูกขัดจังหวะ
  await _deleteQuietly(tmpPath);

  final newFile = File(newPath);
  if (await newFile.exists() && await newFile.length() > 0) {
    return DatabaseLocation(path: newPath, note: 'already-at-new-path');
  }

  if (legacyDir == null) {
    return DatabaseLocation(path: newPath, note: 'legacy-dir-unavailable');
  }
  if (p.equals(legacyDir, newDir)) {
    return DatabaseLocation(path: newPath, note: 'legacy-dir-same');
  }

  final oldPath = p.join(legacyDir, kDatabaseFileName);
  final oldFile = File(oldPath);

  final int oldLen;
  try {
    final exists = await oldFile.exists().timeout(legacyProbeTimeout);
    if (!exists) {
      return DatabaseLocation(path: newPath, note: 'fresh-install');
    }
    oldLen = await oldFile.length().timeout(legacyProbeTimeout);
  } catch (e) {
    return DatabaseLocation(path: newPath, note: 'legacy-unreadable: $e');
  }

  if (oldLen == 0) {
    return DatabaseLocation(path: newPath, note: 'legacy-empty');
  }

  var renamed = false;
  try {
    await oldFile.copy(tmpPath).timeout(copyTimeout);

    final copiedLen = await File(tmpPath).length();
    if (copiedLen != oldLen) {
      throw StateError('size mismatch: copied $copiedLen of $oldLen bytes');
    }

    // นับแถวเป็นการตรวจเพิ่ม ถ้านับไม่ได้หรือช้าเกินไปก็ยอมใช้การเทียบขนาดอย่างเดียว
    // แต่ถ้านับได้ทั้งคู่แล้วไม่ตรง ถือว่าล้มเหลว ห้ามสลับ
    final counter = countMessages ?? countMessagesReadOnly;
    final oldCount = await _countOrNull(counter, oldPath, countTimeout);
    final newCount = await _countOrNull(counter, tmpPath, countTimeout);
    if (oldCount != null && newCount != null && oldCount != newCount) {
      throw StateError('row count mismatch: copied $newCount of $oldCount rows');
    }

    await File(tmpPath).rename(newPath);
    renamed = true;

    for (final suffix in kSqliteSidecarSuffixes) {
      try {
        final sidecar = File('$oldPath$suffix');
        if (await sidecar.exists().timeout(legacyProbeTimeout)) {
          await sidecar.copy('$newPath$suffix').timeout(copyTimeout);
        }
      } catch (e) {
        debugPrint('[DB] sidecar $suffix copy skipped: $e');
      }
    }

    return DatabaseLocation(
      path: newPath,
      migratedFrom: oldPath,
      note: 'migrated bytes=$oldLen rows=${oldCount ?? -1}',
    );
  } catch (e) {
    await _deleteQuietly(tmpPath);
    if (renamed) {
      // ย้ายสำเร็จแล้ว ล้มเหลวทีหลังก็ใช้ของใหม่ได้
      return DatabaseLocation(
        path: newPath,
        migratedFrom: oldPath,
        note: 'migrated-with-warning: $e',
      );
    }
    await _deleteQuietly(newPath);
    // ไม่เคยลบต้นฉบับ: ใช้ที่เก็บเดิมต่อไปดีกว่าเสี่ยงข้อมูลหาย
    return DatabaseLocation(path: oldPath, note: 'migration-failed: $e');
  }
}

/// นับจำนวนข้อความแบบอ่านอย่างเดียว คืน null ถ้านับไม่ได้ (ไม่ถือเป็นข้อผิดพลาด)
@visibleForTesting
Future<int?> countMessagesReadOnly(String path) async {
  Database? db;
  try {
    db = await openReadOnlyDatabase(path);
    final rows = await db.rawQuery('SELECT COUNT(*) AS c FROM messages');
    if (rows.isEmpty) return null;
    final v = rows.first['c'];
    if (v is int) return v;
    return int.tryParse('$v');
  } catch (e) {
    debugPrint('[DB] row count skipped for $path: $e');
    return null;
  } finally {
    try {
      await db?.close();
    } catch (_) {}
  }
}

/// นับแถวแบบมีเพดานเวลา คืน null ถ้านับไม่ได้หรือช้าเกินไป
/// (ที่เก็บเดิมอยู่บน iCloud ได้ จึงต้องไม่ปล่อยให้ค้างตอนบูต)
Future<int?> _countOrNull(
  Future<int?> Function(String path) counter,
  String path,
  Duration timeout,
) async {
  try {
    return await counter(path).timeout(timeout);
  } catch (e) {
    debugPrint('[DB] row count unavailable for $path: $e');
    return null;
  }
}

Future<void> _deleteQuietly(String path) async {
  try {
    final f = File(path);
    if (await f.exists()) await f.delete();
  } catch (e) {
    debugPrint('[DB] delete skipped for $path: $e');
  }
}

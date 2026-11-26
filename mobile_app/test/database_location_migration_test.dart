import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;
import 'package:resilnet/services/database_location.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// สร้างไฟล์ฐานข้อมูลจริงที่มีตาราง messages และข้อความ [rows] แถว
Future<void> _makeDb(String path, {int rows = 0}) async {
  final db = await databaseFactoryFfi.openDatabase(path);
  await db.execute(
    'CREATE TABLE messages (id TEXT PRIMARY KEY, content TEXT)',
  );
  for (var i = 0; i < rows; i++) {
    await db.insert('messages', {'id': 'm$i', 'content': 'hello $i'});
  }
  await db.close();
}

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  late Directory tmp;
  late String oldDir;
  late String newDir;

  setUp(() async {
    tmp = await Directory.systemTemp.createTemp('resilnet_db_migration');
    oldDir = p.join(tmp.path, 'old');
    newDir = p.join(tmp.path, 'new');
    await Directory(oldDir).create(recursive: true);
  });

  tearDown(() async {
    if (await tmp.exists()) await tmp.delete(recursive: true);
  });

  String oldDb() => p.join(oldDir, kDatabaseFileName);
  String newDb() => p.join(newDir, kDatabaseFileName);

  test('มีฐานข้อมูลเก่าอยู่ที่เดียว -> คัดลอกมาที่ใหม่ ของเก่าไม่ถูกลบ', () async {
    await _makeDb(oldDb(), rows: 3);
    final before = await File(oldDb()).length();

    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
    );

    expect(loc.path, newDb());
    expect(loc.migratedFrom, oldDb());
    expect(await File(newDb()).exists(), isTrue);
    expect(await File(newDb()).length(), before);

    // ต้นฉบับยังอยู่ครบ
    expect(await File(oldDb()).exists(), isTrue);
    expect(await File(oldDb()).length(), before);

    // ข้อความครบ 3 แถวในไฟล์ใหม่
    expect(await countMessagesReadOnly(newDb()), 3);

    // ไม่เหลือไฟล์ชั่วคราว
    expect(await File('${newDb()}.migrating').exists(), isFalse);
  });

  test('มีทั้งสองที่ -> ใช้ของใหม่ ไม่เขียนทับ ไม่แตะของเก่า', () async {
    await _makeDb(oldDb(), rows: 2);
    await Directory(newDir).create(recursive: true);
    await _makeDb(newDb(), rows: 7);

    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
    );

    expect(loc.path, newDb());
    expect(loc.migratedFrom, isNull);
    expect(loc.note, 'already-at-new-path');
    expect(await countMessagesReadOnly(newDb()), 7);
    expect(await countMessagesReadOnly(oldDb()), 2);
  });

  test('ไม่มีทั้งสองที่ (ติดตั้งใหม่) -> ใช้ที่ใหม่ ไม่สร้างไฟล์ค้างไว้', () async {
    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
    );

    expect(loc.path, newDb());
    expect(loc.migratedFrom, isNull);
    expect(loc.note, 'fresh-install');
    expect(await File(newDb()).exists(), isFalse);
    expect(await Directory(newDir).exists(), isTrue);
  });

  test('ที่เก็บเดิมอ่านไม่ได้/ค้าง -> ไม่ค้างรอ ใช้ที่ใหม่', () async {
    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: null,
    );

    expect(loc.path, newDb());
    expect(loc.note, 'legacy-dir-unavailable');
  });

  test('ไฟล์ชั่วคราวค้างจากรอบก่อน -> ถูกลบแล้วย้ายใหม่สำเร็จ', () async {
    await _makeDb(oldDb(), rows: 4);
    await Directory(newDir).create(recursive: true);
    await File('${newDb()}.migrating').writeAsString('ขยะจากรอบที่ถูกขัดจังหวะ');

    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
    );

    expect(loc.migratedFrom, oldDb());
    expect(await countMessagesReadOnly(newDb()), 4);
    expect(await File('${newDb()}.migrating').exists(), isFalse);
  });

  test('ไฟล์ว่างเปล่าที่ที่ใหม่ -> ไม่นับว่ามีของใหม่ ย้ายของเก่ามาทับ', () async {
    await _makeDb(oldDb(), rows: 5);
    await Directory(newDir).create(recursive: true);
    await File(newDb()).writeAsBytes(const <int>[]);

    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
    );

    expect(loc.migratedFrom, oldDb());
    expect(await countMessagesReadOnly(newDb()), 5);
  });

  test('นับแถวไม่ตรง -> ไม่สลับ ยังใช้ของเก่าต่อ', () async {
    await _makeDb(oldDb(), rows: 3);

    var call = 0;
    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
      countMessages: (_) async => call++ == 0 ? 3 : 1,
    );

    expect(loc.path, oldDb(), reason: 'ต้องถอยไปใช้ของเก่า');
    expect(loc.note, contains('migration-failed'));
    expect(await File(newDb()).exists(), isFalse);
    expect(await File('${newDb()}.migrating').exists(), isFalse);
    // ต้นฉบับยังอยู่
    expect(await countMessagesReadOnly(oldDb()), 3);
  });

  test('นับแถวค้าง (เช่น iCloud ค้าง) -> ไม่ค้างรอ ย้ายต่อด้วยการเทียบขนาด', () async {
    await _makeDb(oldDb(), rows: 6);

    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
      countTimeout: const Duration(milliseconds: 200),
      countMessages: (_) => Future<int?>.delayed(
        const Duration(seconds: 30),
        () => 999,
      ),
    );

    expect(loc.path, newDb());
    expect(loc.migratedFrom, oldDb());
    expect(loc.note, contains('rows=-1'), reason: 'นับไม่ได้ แต่ขนาดตรง');
    expect(await countMessagesReadOnly(newDb()), 6);
  });

  test('ไฟล์พ่วง -wal/-shm ถูกย้ายตามไปด้วย', () async {
    await _makeDb(oldDb(), rows: 1);
    await File('${oldDb()}-wal').writeAsString('wal');
    await File('${oldDb()}-shm').writeAsString('shm');

    // ไม่เปิดฐานข้อมูลเพื่อนับแถว เพราะ SQLite จะเขียนไฟล์พ่วงทับเอง
    final loc = await migrateDatabaseIfNeeded(
      newDir: newDir,
      legacyDir: oldDir,
      countMessages: (_) async => null,
    );

    expect(loc.migratedFrom, oldDb());
    expect(
      await File('${newDb()}-wal').readAsBytes(),
      await File('${oldDb()}-wal').readAsBytes(),
    );
    expect(
      await File('${newDb()}-shm').readAsBytes(),
      await File('${oldDb()}-shm').readAsBytes(),
    );
    // ไม่มี -journal ที่ต้นทาง ก็ต้องไม่สร้างขึ้นมาเอง
    expect(await File('${newDb()}-journal').exists(), isFalse);
  });
}

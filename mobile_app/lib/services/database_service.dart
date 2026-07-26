import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../core/resilnet_protocol.dart';
import '../models/chat_message.dart';
import '../models/peer.dart';

class DatabaseService {
  Database? _db;

  Future<void> init() async {
    if (_db != null) return;
    final dbPath = await getDatabasesPath();
    final path = p.join(dbPath, 'resilnet.db');
    _db = await _openDatabaseAt(path);
  }

  /// In-memory SQLite สำหรับ unit tests
  @visibleForTesting
  Future<void> initForTest() async {
    if (_db != null) return;
    _db = await _openDatabaseAt(inMemoryDatabasePath);
  }

  Future<Database> _openDatabaseAt(String path) async {
    return openDatabase(
      path,
      version: 11,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE messages (
            id TEXT PRIMARY KEY,
            cloudId INTEGER,
            senderId TEXT NOT NULL,
            senderName TEXT,
            receiverId TEXT NOT NULL,
            content TEXT,
            encryptedPayload TEXT NOT NULL,
            encryptedKey TEXT NOT NULL,
            signature TEXT,
            type TEXT NOT NULL,
            isBroadcast INTEGER NOT NULL DEFAULT 0,
            isSyncedWithCloud INTEGER NOT NULL DEFAULT 0,
            isSyncedWithEsp32 INTEGER NOT NULL DEFAULT 0,
            ttl INTEGER NOT NULL,
            timestamp INTEGER NOT NULL,
            status TEXT NOT NULL,
            alertLat REAL,
            alertLon REAL,
            alertRadiusM REAL,
            payloadKind TEXT NOT NULL DEFAULT 'text',
            deliveredAt INTEGER,
            readAt INTEGER
          )
        ''');
        await db.execute(
          'CREATE INDEX idx_messages_receiver ON messages(receiverId)',
        );
        await db.execute(
          'CREATE INDEX idx_messages_status ON messages(status)',
        );
        await db.execute(
          'CREATE INDEX idx_messages_timestamp ON messages(timestamp)',
        );
        await db.execute(
          'CREATE INDEX idx_messages_sender_timestamp ON messages(senderId, timestamp)',
        );
        await db.execute(
          'CREATE INDEX idx_messages_rate_limit ON messages(senderId, isBroadcast, timestamp)',
        );

        await db.execute('''
          CREATE TABLE peers (
            id TEXT PRIMARY KEY,
            deviceId TEXT,
            publicKey TEXT NOT NULL,
            displayName TEXT,
            geohash TEXT,
            isVerifiedIssuer INTEGER NOT NULL DEFAULT 0,
            isBlocked INTEGER NOT NULL DEFAULT 0,
            lastSeen INTEGER NOT NULL
          )
        ''');
        await db.execute('CREATE INDEX idx_peers_lastSeen ON peers(lastSeen)');
        await db.execute('CREATE INDEX idx_peers_deviceId ON peers(deviceId)');
        await db.execute('CREATE INDEX idx_peers_geohash ON peers(geohash)');

        await db.execute('''
          CREATE TABLE blocked_peers (
            id TEXT PRIMARY KEY,
            blockedAt INTEGER NOT NULL
          )
        ''');

        // รายชื่อผู้ติดต่อแบบ Local-only (เพื่อความเป็นส่วนตัวของ E2EE)
        // - publicKeyHash: User ID (Public Key Hash)
        // - aliasName: ชื่อเล่นที่ผู้ใช้ตั้งเอง
        await db.execute('''
          CREATE TABLE contacts (
            publicKeyHash TEXT PRIMARY KEY,
            aliasName TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE pending_acks (
            dedupKey TEXT PRIMARY KEY,
            msgId TEXT NOT NULL,
            ackType TEXT NOT NULL,
            timestamp INTEGER NOT NULL,
            targetSenderId TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // messages: add type for broadcast support
          await db.execute(
            "ALTER TABLE messages ADD COLUMN type TEXT NOT NULL DEFAULT 'direct'",
          );
          // peers
          await db.execute('''
            CREATE TABLE IF NOT EXISTS peers (
              id TEXT PRIMARY KEY,
              deviceId TEXT,
              publicKey TEXT NOT NULL,
              displayName TEXT,
              isVerifiedIssuer INTEGER NOT NULL DEFAULT 0,
              lastSeen INTEGER NOT NULL
            )
          ''');
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_peers_lastSeen ON peers(lastSeen)',
          );
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_peers_deviceId ON peers(deviceId)',
          );
        }

        if (oldVersion < 3) {
          // messages: add isBroadcast (compat with "type")
          await db.execute(
            "ALTER TABLE messages ADD COLUMN isBroadcast INTEGER NOT NULL DEFAULT 0",
          );
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_messages_sender_timestamp ON messages(senderId, timestamp)',
          );

          // peers: add isBlocked
          await db.execute(
            "ALTER TABLE peers ADD COLUMN isBlocked INTEGER NOT NULL DEFAULT 0",
          );

          // blocked_peers table
          await db.execute('''
            CREATE TABLE IF NOT EXISTS blocked_peers (
              id TEXT PRIMARY KEY,
              blockedAt INTEGER NOT NULL
            )
          ''');
        }

        if (oldVersion < 4) {
          await db.execute('ALTER TABLE peers ADD COLUMN deviceId TEXT');
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_peers_deviceId ON peers(deviceId)',
          );
        }

        if (oldVersion < 5) {
          await db.execute('ALTER TABLE messages ADD COLUMN senderName TEXT');
          await db.execute('ALTER TABLE messages ADD COLUMN content TEXT');
          await db.execute(
            'ALTER TABLE messages ADD COLUMN isSyncedWithCloud INTEGER NOT NULL DEFAULT 0',
          );
          await db.execute(
            'ALTER TABLE messages ADD COLUMN isSyncedWithEsp32 INTEGER NOT NULL DEFAULT 0',
          );
        }

        if (oldVersion < 6) {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS contacts (
              publicKeyHash TEXT PRIMARY KEY,
              aliasName TEXT NOT NULL
            )
          ''');
        }

        if (oldVersion < 7) {
          await db.execute('ALTER TABLE messages ADD COLUMN cloudId INTEGER');
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_messages_cloudId ON messages(cloudId)',
          );
        }

        if (oldVersion < 8) {
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_messages_rate_limit '
            'ON messages(senderId, isBroadcast, timestamp)',
          );
        }

        if (oldVersion < 9) {
          await db.execute('ALTER TABLE messages ADD COLUMN alertLat REAL');
          await db.execute('ALTER TABLE messages ADD COLUMN alertLon REAL');
          await db.execute('ALTER TABLE messages ADD COLUMN alertRadiusM REAL');
        }

        if (oldVersion < 10) {
          await db.execute(
            "ALTER TABLE messages ADD COLUMN payloadKind TEXT NOT NULL DEFAULT 'text'",
          );
          await db.execute('ALTER TABLE messages ADD COLUMN deliveredAt INTEGER');
          await db.execute('ALTER TABLE messages ADD COLUMN readAt INTEGER');
          await db.execute('''
            CREATE TABLE IF NOT EXISTS pending_acks (
              dedupKey TEXT PRIMARY KEY,
              msgId TEXT NOT NULL,
              ackType TEXT NOT NULL,
              timestamp INTEGER NOT NULL,
              targetSenderId TEXT NOT NULL
            )
          ''');
        }

        if (oldVersion < 11) {
          await db.execute('ALTER TABLE peers ADD COLUMN geohash TEXT');
          await db.execute(
            'CREATE INDEX IF NOT EXISTS idx_peers_geohash ON peers(geohash)',
          );
        }
      },
    );
  }

  Database get _database {
    final db = _db;
    if (db == null) {
      throw StateError('DatabaseService.init() must be called first');
    }
    return db;
  }

  Future<void> saveMessage(ChatMessage msg) async {
    await _database.insert(
      'messages',
      msg.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<bool> isMessageDuplicate(String msgId) async {
    final rows = await _database.query(
      'messages',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [msgId],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  Future<List<ChatMessage>> getPendingOrRelayMessages() async {
    final rows = await _database.query(
      'messages',
      where: 'status IN (?, ?)',
      whereArgs: [MessageStatus.pending.name, MessageStatus.relayed.name],
      orderBy: 'timestamp ASC',
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  Future<void> updateMessageStatus(String msgId, String status) async {
    await _database.update(
      'messages',
      {'status': status},
      where: 'id = ?',
      whereArgs: [msgId],
    );
  }

  /// อัปเดตสถานะ Delivered จากรายการ ACK (ESP32/Cloud/Hybrid ACK)
  Future<void> markMessagesDelivered(
    List<String> ids,
    DateTime ts,
  ) async {
    if (ids.isEmpty) return;
    await _database.transaction((txn) async {
      for (final id in ids) {
        await txn.update(
          'messages',
          {
            'status': MessageStatus.delivered.name,
            'deliveredAt': ts.millisecondsSinceEpoch,
          },
          where: 'id = ? AND status != ?',
          whereArgs: [id, MessageStatus.read.name],
        );
      }
    });
  }

  /// Legacy helper — ใช้ timestamp ปัจจุบัน
  Future<void> markMessagesDeliveredNow(List<String> ids) =>
      markMessagesDelivered(ids, DateTime.now());

  /// อัปเดตสถานะ Read จากรายการ ACK
  Future<void> markMessagesRead(List<String> ids, DateTime ts) async {
    if (ids.isEmpty) return;
    await _database.transaction((txn) async {
      for (final id in ids) {
        await txn.update(
          'messages',
          {
            'status': MessageStatus.read.name,
            'readAt': ts.millisecondsSinceEpoch,
            'deliveredAt': ts.millisecondsSinceEpoch,
          },
          where: 'id = ?',
          whereArgs: [id],
        );
      }
    });
  }

  /// ข้อความที่ยังไม่ได้อ่านในบทสนทนา (ฝั่งผู้รับ)
  Future<List<ChatMessage>> getUnreadIncomingMessages(
    String myUserId,
    String peerId,
  ) async {
    final rows = await _database.query(
      'messages',
      where:
          'senderId = ? AND receiverId = ? AND status IN (?, ?)',
      whereArgs: [
        peerId,
        myUserId,
        MessageStatus.delivered.name,
        MessageStatus.sent.name,
      ],
      orderBy: 'timestamp ASC',
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  /// บันทึก pending ACK ลง SQLite (persist ก่อน background/terminate)
  Future<void> savePendingAcks(List<Map<String, Object?>> rows) async {
    final batch = _database.batch();
    for (final row in rows) {
      batch.insert(
        'pending_acks',
        row,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<Map<String, Object?>>> loadPendingAcks() async {
    return _database.query('pending_acks');
  }

  Future<void> clearPendingAcksByKeys(List<String> dedupKeys) async {
    if (dedupKeys.isEmpty) return;
    final placeholders = List.filled(dedupKeys.length, '?').join(',');
    await _database.delete(
      'pending_acks',
      where: 'dedupKey IN ($placeholders)',
      whereArgs: dedupKeys,
    );
  }

  Future<void> clearAllPendingAcks() async {
    await _database.delete('pending_acks');
  }

  Future<Map<String, Object?>?> getMessageRowById(String id) async {
    final rows = await _database.query(
      'messages',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first;
  }

  Future<ChatMessage?> getMessageByCloudId(int cloudId) async {
    final rows = await _database.query(
      'messages',
      where: 'cloudId = ?',
      whereArgs: [cloudId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return ChatMessage.fromMap(rows.first);
  }

  Future<void> setCloudIdForLocalMessage({
    required String localId,
    required int cloudId,
  }) async {
    await _database.update(
      'messages',
      {'cloudId': cloudId, 'isSyncedWithCloud': 1},
      where: 'id = ?',
      whereArgs: [localId],
    );
  }

  /// ตรวจว่าข้อความถูก sync ขึ้น cloud สำเร็จแล้วหรือยัง
  Future<bool> isMessageCloudSynced(String msgId) async {
    final row = await getMessageRowById(msgId);
    if (row == null) return false;
    return (row['isSyncedWithCloud'] as int? ?? 0) == 1;
  }

  Future<List<ChatMessage>> getConversation(String a, String b) async {
    final rows = await _database.query(
      'messages',
      where:
          '((senderId = ? AND receiverId = ?) OR (senderId = ? AND receiverId = ?))'
          " AND IFNULL(payloadKind, 'text') != 'presence'",
      whereArgs: [a, b, b, a],
      orderBy: 'timestamp ASC',
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  Future<List<String>> getChatPeersFor(String myId) async {
    final rows = await _database.rawQuery(
      '''
      SELECT DISTINCT
        CASE
          WHEN senderId = ? THEN receiverId
          ELSE senderId
        END AS peerId
      FROM messages
      WHERE (senderId = ? OR receiverId = ?)
        AND type != ?
        AND receiverId != ?
        AND IFNULL(payloadKind, 'text') != 'presence'
      ORDER BY MAX(timestamp) DESC
    ''',
      [
        myId,
        myId,
        myId,
        MessageType.broadcast.name,
        ResilNetIds.broadcastReceiverId,
      ],
    );
    return rows
        .map((e) => e['peerId'] as String)
        .where(
          (e) => e.isNotEmpty && e != ResilNetIds.broadcastReceiverId,
        )
        .toList();
  }

  Future<void> upsertPeer(Peer peer) async {
    final existing = await getPeer(peer.id);
    final merged = existing == null
        ? peer
        : peer.copyWith(
            // Preserve presence / name when a BLE scan omits them.
            geohash: peer.geohash ?? existing.geohash,
            displayName: peer.displayName ?? existing.displayName,
            deviceId: peer.deviceId ?? existing.deviceId,
          );
    await _database.insert(
      'peers',
      merged.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updatePeerGeohash(String peerId, String geohash) async {
    final h = geohash.trim().toLowerCase();
    if (peerId.isEmpty || h.isEmpty) return;
    final existing = await getPeer(peerId);
    if (existing == null) {
      // Presence may arrive before identity — skip until peer row exists.
      return;
    }
    if (existing.geohash == h) return;
    await upsertPeer(existing.copyWith(geohash: h));
  }

  /// Delete sealed chat rows older than [cutoffMs] (epoch millis).
  Future<int> deleteMessagesOlderThan(int cutoffMs) async {
    return _database.delete(
      'messages',
      where: 'timestamp < ?',
      whereArgs: [cutoffMs],
    );
  }

  Future<Peer?> getPeer(String peerId) async {
    final rows = await _database.query(
      'peers',
      where: 'id = ?',
      whereArgs: [peerId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Peer.fromMap(rows.first);
  }

  Future<Peer?> getPeerByDeviceId(String deviceId) async {
    final rows = await _database.query(
      'peers',
      where: 'deviceId = ?',
      whereArgs: [deviceId],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return Peer.fromMap(rows.first);
  }

  Future<List<Peer>> getActivePeers({required int activeWithinMs}) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    final rows = await _database.query(
      'peers',
      where: 'isBlocked = 0 AND lastSeen >= ?',
      whereArgs: [now - activeWithinMs],
      orderBy: 'lastSeen DESC',
      limit: 200,
    );
    return rows.map(Peer.fromMap).toList();
  }

  Future<List<Peer>> getAllPeers({int limit = 500}) async {
    final rows = await _database.query(
      'peers',
      orderBy: 'lastSeen DESC',
      limit: limit,
    );
    return rows.map(Peer.fromMap).toList();
  }

  Future<void> setPeerBlocked(String peerId, bool blocked) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await _database.update(
      'peers',
      {'isBlocked': blocked ? 1 : 0},
      where: 'id = ?',
      whereArgs: [peerId],
    );
    if (blocked) {
      await _database.insert('blocked_peers', {
        'id': peerId,
        'blockedAt': now,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } else {
      await _database.delete(
        'blocked_peers',
        where: 'id = ?',
        whereArgs: [peerId],
      );
    }
  }

  Future<bool> isPeerBlocked(String peerId) async {
    final rows = await _database.query(
      'blocked_peers',
      columns: ['id'],
      where: 'id = ?',
      whereArgs: [peerId],
      limit: 1,
    );
    if (rows.isNotEmpty) return true;
    final p = await getPeer(peerId);
    return p?.isBlocked == true;
  }

  /// รายการ Message ID ทั้งหมด (ใช้ Handshake กับ ESP32)
  Future<List<String>> getAllMessageIds() async {
    final rows = await _database.query('messages', columns: ['id']);
    return rows.map((r) => r['id'] as String).toList();
  }

  /// ข้อความที่ยังไม่ได้ซิงก์กับ ESP32 Node
  Future<List<ChatMessage>> getMessagesNotSyncedWithEsp32() async {
    final rows = await _database.query(
      'messages',
      where: 'isSyncedWithEsp32 = 0',
      orderBy: 'timestamp ASC',
      limit: 50,
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  /// ข้อความที่ยังไม่ได้ซิงก์กับ Cloud
  Future<List<ChatMessage>> getMessagesNotSyncedWithCloud() async {
    final rows = await _database.query(
      'messages',
      where: "isSyncedWithCloud = 0 AND type != ?",
      whereArgs: [MessageType.broadcast.name],
      orderBy: 'timestamp ASC',
      limit: 100,
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  Future<void> markEsp32Synced(String msgId) async {
    await _database.update(
      'messages',
      {'isSyncedWithEsp32': 1},
      where: 'id = ?',
      whereArgs: [msgId],
    );
  }

  Future<void> markCloudSynced(String msgId) async {
    await _database.update(
      'messages',
      {'isSyncedWithCloud': 1},
      where: 'id = ?',
      whereArgs: [msgId],
    );
  }

  /// บันทึกข้อความจาก ESP32 Mule Node
  Future<ChatMessage> saveMuleMessage(MuleMessage mule) async {
    final isBroadcast = mule.isBroadcast;
    final signed = mule.signedPayload?.trim() ?? '';
    final msg = ChatMessage(
      id: mule.id,
      senderId: mule.sender,
      senderName: mule.senderName,
      receiverId: isBroadcast
          ? ResilNetIds.broadcastReceiverId
          : (mule.receiverId ?? ResilNetIds.broadcastReceiverId),
      content: isBroadcast
          ? (mule.payload.isNotEmpty ? mule.payload : null)
          : null,
      encryptedPayload: isBroadcast
          ? (signed.isNotEmpty ? signed : mule.payload)
          : mule.payload,
      encryptedKey: mule.encryptedKey ?? '',
      signature: mule.signature,
      ttl: mule.ttl,
      timestamp: mule.timestamp,
      status: MessageStatus.delivered,
      type: isBroadcast ? MessageType.broadcast : MessageType.direct,
      isSyncedWithEsp32: true,
      alertLat: mule.lat,
      alertLon: mule.lon,
      alertRadiusM: mule.radiusM,
    );
    await saveMessage(msg);
    return msg;
  }

  /// ตั้งชื่อเล่นให้ผู้ติดต่อ (Local-only)
  Future<void> setContactAlias({
    required String publicKeyHash,
    required String aliasName,
  }) async {
    final alias = aliasName.trim();
    if (alias.isEmpty) {
      await _database.delete(
        'contacts',
        where: 'publicKeyHash = ?',
        whereArgs: [publicKeyHash],
      );
      return;
    }
    await _database.insert('contacts', {
      'publicKeyHash': publicKeyHash,
      'aliasName': alias,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<String?> getContactAlias(String publicKeyHash) async {
    final rows = await _database.query(
      'contacts',
      columns: ['aliasName'],
      where: 'publicKeyHash = ?',
      whereArgs: [publicKeyHash],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return rows.first['aliasName'] as String?;
  }

  /// ชื่อที่ควรแสดงใน UI: Alias (ถ้ามี) → ชื่อใน peers.displayName → fallback เป็น id
  Future<String> resolveDisplayName(String publicKeyHash) async {
    final alias = await getContactAlias(publicKeyHash);
    if (alias != null && alias.trim().isNotEmpty) return alias.trim();
    final peer = await getPeer(publicKeyHash);
    final n = peer?.displayName?.trim();
    if (n != null && n.isNotEmpty) return n;
    return publicKeyHash;
  }

  /// ลบข้อความทั้งหมดใน SQLite และคืนพื้นที่ดิสก์ด้วย VACUUM
  ///
  /// หมายเหตุ Hybrid (Supabase): ฟังก์ชันนี้ลบเฉพาะ local เท่านั้น
  /// ให้เรียก [SupabaseSyncService.clearCloudMessagesForUser] ผ่าน AppState
  /// ก่อนหรือหลัง เพื่อให้ cloud สอดคล้องกับการล้างของผู้ใช้
  Future<int> clearAllMessages() async {
    final deleted = await _database.delete('messages');
    await _database.execute('VACUUM');
    return deleted;
  }

  /// Panic wipe: messages, peers, blocks, aliases, pending ACKs.
  Future<void> wipeLocalUserData() async {
    await _database.delete('messages');
    await _database.delete('peers');
    await _database.delete('blocked_peers');
    await _database.delete('contacts');
    await _database.delete('pending_acks');
    await _database.execute('VACUUM');
  }
}

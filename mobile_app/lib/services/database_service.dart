import 'package:path/path.dart' as p;
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
    _db = await openDatabase(
      path,
      version: 9,
      onConfigure: (db) async {
        // Composite index สำหรับ rate-limit query และ broadcast discovery
        await db.execute(
          'CREATE INDEX IF NOT EXISTS idx_messages_rate_limit '
          'ON messages(senderId, isBroadcast, timestamp)',
        );
      },
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
            alertRadiusM REAL
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
            isVerifiedIssuer INTEGER NOT NULL DEFAULT 0,
            isBlocked INTEGER NOT NULL DEFAULT 0,
            lastSeen INTEGER NOT NULL
          )
        ''');
        await db.execute('CREATE INDEX idx_peers_lastSeen ON peers(lastSeen)');
        await db.execute('CREATE INDEX idx_peers_deviceId ON peers(deviceId)');

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

  /// อัปเดตสถานะ Delivered จากรายการ ACK (ESP32/Cloud)
  Future<void> markMessagesDelivered(List<String> ids) async {
    if (ids.isEmpty) return;
    final placeholders = List.filled(ids.length, '?').join(',');
    await _database.update(
      'messages',
      {'status': MessageStatus.delivered.name},
      where: 'id IN ($placeholders)',
      whereArgs: ids,
    );
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

  /// ใช้สำหรับอัปโหลดขึ้น Supabase: status=Pending และยังไม่เคย sync cloud
  Future<List<ChatMessage>> getPendingMessagesForSupabase({
    int limit = 100,
  }) async {
    final rows = await _database.query(
      'messages',
      where: "status = ? AND isSyncedWithCloud = 0 AND type != ?",
      whereArgs: [MessageStatus.pending.name, MessageType.broadcast.name],
      orderBy: 'timestamp ASC',
      limit: limit,
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  /// Broadcast alerts รออัปโหลด Supabase (dual-channel)
  Future<List<ChatMessage>> getPendingBroadcastsForSupabase({
    int limit = 50,
  }) async {
    final rows = await _database.query(
      'messages',
      where: "type = ? AND isSyncedWithCloud = 0",
      whereArgs: [MessageType.broadcast.name],
      orderBy: 'timestamp ASC',
      limit: limit,
    );
    return rows.map(ChatMessage.fromMap).toList();
  }

  Future<List<ChatMessage>> getConversation(String a, String b) async {
    final rows = await _database.query(
      'messages',
      where:
          '(senderId = ? AND receiverId = ?) OR (senderId = ? AND receiverId = ?)',
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
      WHERE senderId = ? OR receiverId = ?
      ORDER BY MAX(timestamp) DESC
    ''',
      [myId, myId, myId],
    );
    return rows
        .map((e) => e['peerId'] as String)
        .where((e) => e.isNotEmpty)
        .toList();
  }

  Future<void> upsertPeer(Peer peer) async {
    await _database.insert(
      'peers',
      peer.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Broadcast-driven discovery: เพิ่ม/อัปเดต displayName จาก senderName ในประกาศ
  /// คืน true เมื่อมีการ insert หรือ update displayName (ข้ามถ้าชื่อเดิมแล้ว — ลด I/O)
  Future<bool> upsertPeerDisplayNameFromBroadcast({
    required String senderId,
    required String senderName,
  }) async {
    final name = senderName.trim();
    if (name.isEmpty) return false;

    final now = DateTime.now().millisecondsSinceEpoch;
    final existing = await getPeer(senderId);

    if (existing == null) {
      await _database.insert('peers', {
        'id': senderId,
        'displayName': name,
        'publicKey': '',
        'isVerifiedIssuer': 0,
        'isBlocked': 0,
        'lastSeen': now,
      }, conflictAlgorithm: ConflictAlgorithm.ignore);
      return true;
    }

    final current = existing.displayName?.trim() ?? '';
    if (current == name) return false;

    await _database.update(
      'peers',
      {'displayName': name, 'lastSeen': now},
      where: 'id = ?',
      whereArgs: [senderId],
    );
    return true;
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

  Future<List<Peer>> getVerifiedIssuers() async {
    final rows = await _database.query(
      'peers',
      where: 'isVerifiedIssuer = 1 AND isBlocked = 0',
      orderBy: 'displayName ASC',
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

  /// Rate limit: max 1 broadcast / 2 minutes per sender.
  Future<bool> isBroadcastRateLimited(String senderId, int nowMs) async {
    final minTs = nowMs - 2 * 60 * 1000;
    final rows = await _database.query(
      'messages',
      columns: ['id'],
      where: 'senderId = ? AND isBroadcast = 1 AND timestamp >= ?',
      whereArgs: [senderId, minTs],
      limit: 1,
    );
    return rows.isNotEmpty;
  }

  Future<List<ChatMessage>> getBroadcastFeed({
    int limit = 200,
    Set<String>? trustedSenderIds,
  }) async {
    final rows = await _database.query(
      'messages',
      where: 'type = ?',
      whereArgs: [MessageType.broadcast.name],
      orderBy: 'timestamp DESC',
      limit: limit,
    );
    var items = rows.map(ChatMessage.fromMap).toList();
    if (trustedSenderIds != null && trustedSenderIds.isNotEmpty) {
      items = items
          .where((m) => trustedSenderIds.contains(m.senderId))
          .toList();
    }
    return items;
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
}

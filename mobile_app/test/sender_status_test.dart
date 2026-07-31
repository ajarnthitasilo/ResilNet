import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:resilnet/models/ack_entry.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/ack_handler_service.dart';
import 'package:resilnet/services/database_service.dart';

ChatMessage _outbound({
  required String id,
  required String senderId,
  required String receiverId,
  MessageStatus status = MessageStatus.pending,
}) {
  return ChatMessage(
    id: id,
    senderId: senderId,
    receiverId: receiverId,
    content: 'local-preview',
    encryptedPayload: base64Encode(utf8.encode('{"ct":"test"}')),
    encryptedKey: 'enc-key',
    ttl: 5,
    timestamp: 1_700_000_000_000,
    status: status,
    type: MessageType.direct,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }

  group('Outbound status pending -> sent (history mode)', () {
    late DatabaseService db;

    setUp(() async {
      db = DatabaseService();
      await db.initForTest();
    });

    test('regression: saveMessage cannot upgrade an existing pending row',
        () async {
      const id = 'm-1';
      await db.saveMessage(
        _outbound(id: id, senderId: 'me', receiverId: 'peer'),
      );
      // Re-persisting a "sent" copy via saveMessage is insert-or-IGNORE -> no-op.
      await db.saveMessage(
        _outbound(
          id: id,
          senderId: 'me',
          receiverId: 'peer',
          status: MessageStatus.sent,
        ),
      );
      final row = await db.getMessageRowById(id);
      expect(row?['status'], MessageStatus.pending.name);
    });

    test('markMessageSent upgrades pending -> sent, sets synced/ttl, keeps body',
        () async {
      const id = 'm-2';
      await db.saveMessage(
        _outbound(id: id, senderId: 'me', receiverId: 'peer'),
      );

      await db.markMessageSent(id, syncedWithCloud: true, ttl: 4);

      final row = await db.getMessageRowById(id);
      expect(row?['status'], MessageStatus.sent.name);
      expect(row?['isSyncedWithCloud'], 1);
      expect(row?['ttl'], 4);
      // Local plaintext preview must be preserved (not clobbered).
      expect(row?['content'], 'local-preview');
    });

    test('markMessageSent recovers a failed message', () async {
      const id = 'm-failed';
      await db.saveMessage(
        _outbound(
          id: id,
          senderId: 'me',
          receiverId: 'peer',
          status: MessageStatus.failed,
        ),
      );

      await db.markMessageSent(id, syncedWithCloud: true);

      final row = await db.getMessageRowById(id);
      expect(row?['status'], MessageStatus.sent.name);
    });

    test('markMessageSent never downgrades delivered/read', () async {
      const id = 'm-3';
      await db.saveMessage(
        _outbound(
          id: id,
          senderId: 'me',
          receiverId: 'peer',
          status: MessageStatus.read,
        ),
      );

      await db.markMessageSent(id, syncedWithCloud: true);

      final row = await db.getMessageRowById(id);
      expect(row?['status'], MessageStatus.read.name);
    });
  });

  group('ACK receipts reach session-only outbound (history disabled)', () {
    late DatabaseService db;

    setUp(() async {
      db = DatabaseService();
      await db.initForTest();
    });

    test('delivered + read upgrade the in-memory session copy', () async {
      const me = 'me';
      const peer = 'peer';

      // Simulate the ephemeral session store owned by AppState.
      final session = <ChatMessage>[
        _outbound(id: 'sess-1', senderId: me, receiverId: peer),
        _outbound(id: 'sess-2', senderId: me, receiverId: peer),
      ];

      final handler = AckHandlerService(
        database: db,
        myUserId: me,
        findOutboundExtra: (id) {
          for (final m in session) {
            if (m.id == id && m.senderId == me) return m;
          }
          return null;
        },
        applyOutboundStatus: (id, status, ts) {
          for (var i = 0; i < session.length; i++) {
            if (session[i].id != id) continue;
            session[i] = session[i].copyWith(
              status: status,
              deliveredAt: ts,
              readAt: status == MessageStatus.read ? ts : session[i].readAt,
            );
          }
        },
      );

      final ts = DateTime.utc(2026, 7, 20, 9, 0);
      final packet = BatchAckPacket(
        senderId: peer,
        receiverId: me,
        batchAcks: [
          AckEntry(
            msgId: 'sess-1',
            type: AckType.delivered,
            timestamp: ts.millisecondsSinceEpoch,
            targetSenderId: me,
          ),
          AckEntry(
            msgId: 'sess-2',
            type: AckType.read,
            timestamp: ts.millisecondsSinceEpoch,
            targetSenderId: me,
          ),
        ],
      );

      await handler.handleBatchPacket(packet);

      expect(
        session.firstWhere((m) => m.id == 'sess-1').status,
        MessageStatus.delivered,
      );
      expect(
        session.firstWhere((m) => m.id == 'sess-2').status,
        MessageStatus.read,
      );
      // No SQLite rows were ever written for these session-only messages.
      expect(await db.getMessageRowById('sess-1'), isNull);
    });
  });
}

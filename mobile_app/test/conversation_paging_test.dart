import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Guards the chat/Watch paging contract.
///
/// Before this, the thread and every Apple Watch snapshot read (and decrypted)
/// a conversation's entire history. These tests pin the paged reads so a later
/// redesign cannot quietly go back to loading everything.
///
/// `initForTest()` opens the shared in-memory database, so every test works in
/// its own conversation (`peer` id) instead of assuming an empty table.
void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  Future<DatabaseService> seed({
    required String peer,
    required int count,
  }) async {
    final db = DatabaseService();
    await db.initForTest();
    for (var i = 0; i < count; i++) {
      await db.saveMessage(
        ChatMessage(
          id: '$peer-m$i',
          senderId: i.isEven ? 'me' : peer,
          receiverId: i.isEven ? peer : 'me',
          encryptedPayload: 'x',
          encryptedKey: 'y',
          ttl: 5,
          // Ascending timestamps: m0 oldest, m(count-1) newest.
          timestamp: 1000 + i,
          status: MessageStatus.delivered,
          type: MessageType.direct,
        ),
      );
    }
    return db;
  }

  group('getConversation paging', () {
    test('no limit returns the whole thread, oldest first', () async {
      final db = await seed(peer: 'p-all', count: 10);
      final all = await db.getConversation('me', 'p-all');
      expect(all.length, 10);
      expect(all.first.id, 'p-all-m0');
      expect(all.last.id, 'p-all-m9');
    });

    test(
      'limit keeps the NEWEST n but still returns them oldest first',
      () async {
        final db = await seed(peer: 'p-page', count: 120);
        final page = await db.getConversation('me', 'p-page', limit: 50);
        expect(page.length, 50);
        // Newest 50 of 120 => m70..m119.
        expect(page.first.id, 'p-page-m70');
        expect(page.last.id, 'p-page-m119');
        // Ordering must stay ascending so the reversed ListView renders in order.
        for (var i = 1; i < page.length; i++) {
          expect(
            page[i].timestamp >= page[i - 1].timestamp,
            isTrue,
            reason: 'page must be sorted oldest → newest',
          );
        }
      },
    );

    test('limit larger than the thread returns everything', () async {
      final db = await seed(peer: 'p-small', count: 5);
      final page = await db.getConversation('me', 'p-small', limit: 50);
      expect(page.length, 5);
      expect(page.first.id, 'p-small-m0');
    });

    test('limit of zero or null is treated as unlimited', () async {
      final db = await seed(peer: 'p-zero', count: 7);
      expect((await db.getConversation('me', 'p-zero', limit: 0)).length, 7);
      expect((await db.getConversation('me', 'p-zero', limit: null)).length, 7);
    });
  });

  group('counts used by the UI', () {
    test('countConversation sees rows the page did not load', () async {
      final db = await seed(peer: 'p-count', count: 120);
      final page = await db.getConversation('me', 'p-count', limit: 50);
      final total = await db.countConversation('me', 'p-count');
      expect(total, 120);
      // This is exactly the "load earlier messages" condition in the thread.
      expect(total > page.length, isTrue);
    });

    test('countUnreadIncomingFromPeer counts only inbound unread', () async {
      final db = DatabaseService();
      await db.initForTest();
      ChatMessage msg(String id, String from, String to, MessageStatus st) =>
          ChatMessage(
            id: id,
            senderId: from,
            receiverId: to,
            encryptedPayload: 'x',
            encryptedKey: 'y',
            ttl: 5,
            timestamp: 1,
            status: st,
            type: MessageType.direct,
          );
      await db.saveMessage(
        msg('u-a', 'u-them', 'u-me', MessageStatus.delivered),
      );
      await db.saveMessage(msg('u-b', 'u-them', 'u-me', MessageStatus.sent));
      await db.saveMessage(msg('u-c', 'u-them', 'u-me', MessageStatus.read));
      await db.saveMessage(
        msg('u-d', 'u-me', 'u-them', MessageStatus.delivered),
      );
      await db.saveMessage(
        msg('u-e', 'u-other', 'u-me', MessageStatus.delivered),
      );

      expect(await db.countUnreadIncomingFromPeer('u-me', 'u-them'), 2);
      expect(await db.countUnreadIncomingFromPeer('u-me', 'u-other'), 1);
      expect(await db.countUnreadIncomingFromPeer('u-me', 'u-nobody'), 0);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// Guards the chat-list row metadata contract.
///
/// The 1:1 list shows a last-activity stamp and an unread badge per peer. Both
/// come from [DatabaseService.getDirectChatSummaries], which must stay two
/// grouped queries (no per-row reads) and must never need a message body —
/// plaintext belongs to the screenshot-protected chat screen only.
///
/// `initForTest()` opens the shared in-memory database, so each test uses its
/// own ids instead of assuming an empty table.
void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  Future<DatabaseService> db() async {
    final d = DatabaseService();
    await d.initForTest();
    return d;
  }

  Future<void> save(
    DatabaseService d, {
    required String id,
    required String from,
    required String to,
    required int ts,
    MessageStatus status = MessageStatus.delivered,
    MessageType type = MessageType.direct,
    String payloadKind = 'text',
  }) =>
      d.saveMessage(
        ChatMessage(
          id: id,
          senderId: from,
          receiverId: to,
          encryptedPayload: 'x',
          encryptedKey: 'y',
          ttl: 5,
          timestamp: ts,
          status: status,
          type: type,
          payloadKind: payloadKind,
        ),
      );

  test('last activity is the newest message in either direction', () async {
    final d = await db();
    const me = 'me-last';
    await save(d, id: 'l1', from: me, to: 'p-last', ts: 1000);
    await save(d, id: 'l2', from: 'p-last', to: me, ts: 3000);
    await save(d, id: 'l3', from: me, to: 'p-last', ts: 2000);

    final out = await d.getDirectChatSummaries(me);
    expect(out['p-last']?.lastTs, 3000);
  });

  test('unread counts inbound sent/delivered only', () async {
    final d = await db();
    const me = 'me-unread';
    await save(d, id: 'u1', from: 'p-unread', to: me, ts: 10);
    await save(
      d,
      id: 'u2',
      from: 'p-unread',
      to: me,
      ts: 20,
      status: MessageStatus.sent,
    );
    // Already read inbound, and my own outbound: neither is unread.
    await save(
      d,
      id: 'u3',
      from: 'p-unread',
      to: me,
      ts: 30,
      status: MessageStatus.read,
    );
    await save(d, id: 'u4', from: me, to: 'p-unread', ts: 40);

    final out = await d.getDirectChatSummaries(me);
    expect(out['p-unread']?.unread, 2);
    expect(out['p-unread']?.lastTs, 40);
  });

  test('presence and notice rows never reach the list', () async {
    final d = await db();
    const me = 'me-kinds';
    await save(d, id: 'k1', from: 'p-kinds', to: me, ts: 100);
    await save(
      d,
      id: 'k2',
      from: 'p-kinds',
      to: me,
      ts: 900,
      payloadKind: 'presence',
    );
    await save(
      d,
      id: 'k3',
      from: 'p-kinds',
      to: me,
      ts: 800,
      payloadKind: 'notice',
    );

    final out = await d.getDirectChatSummaries(me);
    expect(out['p-kinds']?.lastTs, 100);
    expect(out['p-kinds']?.unread, 1);
  });

  test('broadcasts are not conversations', () async {
    final d = await db();
    const me = 'me-bcast';
    await save(
      d,
      id: 'b1',
      from: me,
      to: ResilNetIds.broadcastReceiverId,
      ts: 500,
      type: MessageType.broadcast,
    );

    final out = await d.getDirectChatSummaries(me);
    expect(out.containsKey(ResilNetIds.broadcastReceiverId), isFalse);
  });

  test('a peer with no messages has no entry', () async {
    final d = await db();
    final out = await d.getDirectChatSummaries('me-empty');
    expect(out['p-never-wrote'], isNull);
  });
}

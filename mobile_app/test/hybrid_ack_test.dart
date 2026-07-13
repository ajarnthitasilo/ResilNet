import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:resilnet/core/resilnet_ack_codec.dart';
import 'package:resilnet/models/ack_entry.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/ack_handler_service.dart';
import 'package:resilnet/services/ack_queue_manager.dart';
import 'package:resilnet/services/database_service.dart';

ChatMessage _outboundMsg({
  required String id,
  required String senderId,
  required String receiverId,
  MessageStatus status = MessageStatus.sent,
}) {
  return ChatMessage(
    id: id,
    senderId: senderId,
    receiverId: receiverId,
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

  group('AckQueueManager hybrid routing', () {
    late DatabaseService db;

    setUp(() async {
      db = DatabaseService();
      await db.initForTest();
    });

    test('Wi-Fi mode flushes ACKs instantly', () async {
      final flushed = <BatchAckPacket>[];
      final mgr = AckQueueManager(
        database: db,
        myUserId: 'user-me',
        isHighSpeedTransport: () => true,
        sendAckBatch: (packet) async {
          flushed.add(packet);
          return true;
        },
        wifiFlushDelay: const Duration(milliseconds: 80),
      );

      await mgr.enqueueDelivered(
        msgId: 'msg-wifi-1',
        targetSenderId: 'peer-a',
      );

      await Future<void>.delayed(const Duration(milliseconds: 150));

      expect(flushed, hasLength(1));
      expect(flushed.first.batchAcks, hasLength(1));
      expect(flushed.first.receiverId, 'peer-a');
      expect(mgr.pendingCount, 0);
      mgr.dispose();
    });

    test('Mesh mode buffers ACKs and flushes on deferred timer', () async {
      final flushed = <BatchAckPacket>[];
      final mgr = AckQueueManager(
        database: db,
        myUserId: 'user-me',
        isHighSpeedTransport: () => false,
        sendAckBatch: (packet) async {
          flushed.add(packet);
          return true;
        },
        deferredInterval: const Duration(milliseconds: 120),
        meshThreshold: 5,
      );

      await mgr.enqueueDelivered(
        msgId: 'msg-mesh-timer',
        targetSenderId: 'peer-b',
      );
      expect(flushed, isEmpty);
      expect(mgr.pendingCount, 1);

      await Future<void>.delayed(const Duration(milliseconds: 200));

      expect(flushed, hasLength(1));
      expect(mgr.pendingCount, 0);
      mgr.dispose();
    });

    test('Mesh mode flushes immediately when threshold reached', () async {
      final flushed = <BatchAckPacket>[];
      final mgr = AckQueueManager(
        database: db,
        myUserId: 'user-me',
        isHighSpeedTransport: () => false,
        sendAckBatch: (packet) async {
          flushed.add(packet);
          return true;
        },
        deferredInterval: const Duration(seconds: 30),
        meshThreshold: 5,
      );

      for (var i = 0; i < 5; i++) {
        await mgr.enqueueDelivered(
          msgId: 'msg-th-$i',
          targetSenderId: 'peer-c',
        );
      }

      expect(flushed, hasLength(1));
      expect(flushed.first.batchAcks, hasLength(5));
      expect(mgr.pendingCount, 0);
      mgr.dispose();
    });

    test('Piggyback drains pending ACKs for outgoing receiver', () async {
      final mgr = AckQueueManager(
        database: db,
        myUserId: 'user-me',
        isHighSpeedTransport: () => false,
        sendAckBatch: (_) async => true,
        meshThreshold: 99,
      );

      await mgr.enqueueDelivered(
        msgId: 'msg-pb-1',
        targetSenderId: 'peer-d',
      );
      await mgr.enqueueRead(
        msgId: 'msg-pb-2',
        targetSenderId: 'peer-other',
      );

      final piggyback = mgr.drainPiggybackFor('peer-d');
      expect(piggyback, hasLength(1));
      expect(piggyback.first.msgId, 'msg-pb-1');
      expect(mgr.pendingCount, 1);
      mgr.dispose();
    });
  });

  group('Batched ACK packet + SQLite', () {
    late DatabaseService db;
    late AckHandlerService handler;

    setUp(() async {
      db = DatabaseService();
      await db.initForTest();
      handler = AckHandlerService(database: db, myUserId: 'sender-me');
    });

    test('PayloadType 0x05 batch updates all message statuses', () async {
      const sender = 'sender-me';
      const receiver = 'receiver-them';
      final ts = DateTime.utc(2026, 7, 12, 12, 0);

      await db.saveMessage(
        _outboundMsg(id: 'ack-msg-1', senderId: sender, receiverId: receiver),
      );
      await db.saveMessage(
        _outboundMsg(id: 'ack-msg-2', senderId: sender, receiverId: receiver),
      );

      final packet = BatchAckPacket(
        senderId: receiver,
        receiverId: sender,
        batchAcks: [
          AckEntry(
            msgId: 'ack-msg-1',
            type: AckType.delivered,
            timestamp: ts.millisecondsSinceEpoch,
            targetSenderId: sender,
          ),
          AckEntry(
            msgId: 'ack-msg-2',
            type: AckType.read,
            timestamp: ts.millisecondsSinceEpoch,
            targetSenderId: sender,
          ),
        ],
      );

      final wire = ResilNetAckCodec.encodeBatchPacket(packet);
      final decoded = ResilNetAckCodec.decodeBatchPacket(wire);
      expect(decoded, isNotNull);

      await handler.handleBatchPacket(decoded!);

      final row1 = await db.getMessageRowById('ack-msg-1');
      final row2 = await db.getMessageRowById('ack-msg-2');
      expect(row1?['status'], MessageStatus.delivered.name);
      expect(row2?['status'], MessageStatus.read.name);
      expect(row2?['readAt'], ts.millisecondsSinceEpoch);
    });

    test('Duplicate ACK entries are ignored idempotently', () async {
      const sender = 'sender-me';
      const receiver = 'receiver-them';
      final ts = DateTime.utc(2026, 7, 12, 13, 0);

      await db.saveMessage(
        _outboundMsg(id: 'dup-msg', senderId: sender, receiverId: receiver),
      );

      final entry = AckEntry(
        msgId: 'dup-msg',
        type: AckType.delivered,
        timestamp: ts.millisecondsSinceEpoch,
        targetSenderId: sender,
      );
      final packet = BatchAckPacket(
        senderId: receiver,
        receiverId: sender,
        batchAcks: [entry],
      );

      await handler.handleBatchPacket(packet);
      await handler.handleBatchPacket(packet);

      final row = await db.getMessageRowById('dup-msg');
      expect(row?['status'], MessageStatus.delivered.name);
    });
  });
}

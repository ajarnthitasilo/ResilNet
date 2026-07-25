import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/geohash.dart';
import 'package:resilnet/core/payload_kinds.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/models/mesh_retention.dart';
import 'package:resilnet/models/peer.dart';
import 'package:resilnet/services/database_service.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  });

  group('MeshRetention', () {
    test('fromDays maps known windows', () {
      expect(MeshRetention.fromDays(null), MeshRetention.keep);
      expect(MeshRetention.fromDays(0), MeshRetention.keep);
      expect(MeshRetention.fromDays(1), MeshRetention.oneDay);
      expect(MeshRetention.fromDays(3), MeshRetention.threeDays);
      expect(MeshRetention.fromDays(7), MeshRetention.sevenDays);
    });

    test('duration is null only for keep', () {
      expect(MeshRetention.keep.duration, isNull);
      expect(MeshRetention.oneDay.duration, const Duration(days: 1));
      expect(MeshRetention.threeDays.duration, const Duration(days: 3));
      expect(MeshRetention.sevenDays.duration, const Duration(days: 7));
    });
  });

  group('PayloadKinds', () {
    test('presence is not chat-visible', () {
      expect(PayloadKinds.isChatVisible(PayloadKinds.presence), isFalse);
      expect(PayloadKinds.isChatVisible(PayloadKinds.text), isTrue);
      expect(PayloadKinds.isChatVisible(PayloadKinds.areaPublic), isTrue);
    });
  });

  group('area peer geohash filter', () {
    test('matchesChannel filters peers in selected area', () {
      const channel = 'w1z0';
      final peers = [
        Peer(
          id: 'a',
          publicKey: 'pk',
          geohash: 'w1z0xx',
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: 1,
        ),
        Peer(
          id: 'b',
          publicKey: 'pk',
          geohash: 'dr5r',
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: 1,
        ),
        Peer(
          id: 'c',
          publicKey: 'pk',
          geohash: null,
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: 1,
        ),
      ];
      final online = peers.where((p) {
        final geo = p.geohash?.trim();
        if (geo == null || geo.isEmpty) return true;
        return Geohash.matchesChannel(geo, channel);
      }).toList();
      expect(online.map((e) => e.id), ['a', 'c']);
    });
  });

  group('DatabaseService retention', () {
    test('deleteMessagesOlderThan removes stale rows', () async {
      final db = DatabaseService();
      await db.initForTest();
      final now = DateTime.now().millisecondsSinceEpoch;
      await db.saveMessage(
        ChatMessage(
          id: 'old',
          senderId: 'me',
          receiverId: 'them',
          encryptedPayload: 'x',
          encryptedKey: 'y',
          ttl: 5,
          timestamp: now - const Duration(days: 10).inMilliseconds,
          status: MessageStatus.sent,
          type: MessageType.direct,
        ),
      );
      await db.saveMessage(
        ChatMessage(
          id: 'fresh',
          senderId: 'me',
          receiverId: 'them',
          encryptedPayload: 'x',
          encryptedKey: 'y',
          ttl: 5,
          timestamp: now - const Duration(hours: 1).inMilliseconds,
          status: MessageStatus.sent,
          type: MessageType.direct,
        ),
      );
      final deleted = await db.deleteMessagesOlderThan(
        now - const Duration(days: 3).inMilliseconds,
      );
      expect(deleted, 1);
      final remaining = await db.getConversation('me', 'them');
      expect(remaining.map((m) => m.id), ['fresh']);
    });

    test('upsertPeer preserves geohash when omitted', () async {
      final db = DatabaseService();
      await db.initForTest();
      await db.upsertPeer(
        Peer(
          id: 'p1',
          publicKey: 'pk',
          geohash: 'w1z0',
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: 1,
        ),
      );
      await db.upsertPeer(
        Peer(
          id: 'p1',
          publicKey: 'pk',
          geohash: null,
          isVerifiedIssuer: false,
          isBlocked: false,
          lastSeen: 2,
        ),
      );
      final got = await db.getPeer('p1');
      expect(got?.geohash, 'w1z0');
      expect(got?.lastSeen, 2);
    });
  });
}

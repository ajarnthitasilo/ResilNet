import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/bulletin_wire.dart';
import 'package:resilnet/core/payload_kinds.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  late CryptoService alice;
  late CryptoService bob;

  setUpAll(() {
    alice = CryptoService();
    final aliceKeys = alice.generateKeyPairPems();
    alice.useInMemoryKeys(
      publicPem: aliceKeys.publicPem,
      privatePem: aliceKeys.privatePem,
    );

    bob = CryptoService();
    final bobKeys = bob.generateKeyPairPems();
    bob.useInMemoryKeys(
      publicPem: bobKeys.publicPem,
      privatePem: bobKeys.privatePem,
    );
  });

  BulletinWireData signedSample({String text = 'จุดแจกน้ำที่ศาลาวัด 9 โมง'}) {
    return buildSignedBulletin(
      crypto: alice,
      bulletinId: 'b-001',
      text: text,
      createdAt: 1700000000000,
      expiresAt: 1700000000000 + 3 * 24 * 3600 * 1000,
      urgent: true,
      senderName: 'Alice',
    );
  }

  test('bulletin verifies WITHOUT receiver knowing sender key beforehand', () {
    final wire = signedSample().encode();

    // Bob has no peer record for Alice — verification uses the embedded pk.
    final parsed = parseBulletinWire(wire);
    expect(parsed, isNotNull);
    expect(verifyBulletinWire(parsed!, bob), isTrue);
    expect(parsed.senderId, alice.myUserId);
    expect(parsed.text, contains('จุดแจกน้ำ'));
    expect(parsed.urgent, isTrue);
  });

  test('tampered text fails verification', () {
    final original = signedSample();
    final map = original.toJson();
    map['text'] = 'ปลอมประกาศ';
    final tampered = parseBulletinWire(jsonEncode(map));
    expect(tampered, isNotNull);
    expect(verifyBulletinWire(tampered!, bob), isFalse);
  });

  test('spoofed senderId (identity binding mismatch) fails', () {
    final original = signedSample();
    final map = original.toJson();
    map['senderId'] = bob.myUserId; // claim to be Bob, pk is Alice's
    final spoofed = parseBulletinWire(jsonEncode(map));
    expect(spoofed, isNotNull);
    expect(verifyBulletinWire(spoofed!, bob), isFalse);
  });

  test('signature by a different key fails', () {
    final original = signedSample();
    final map = original.toJson();
    // Replace pk with Bob's so binding check needs Bob's id too.
    map['senderId'] = bob.myUserId;
    map['senderPk'] = CryptoService.compactPublicKey(bob.publicKeyPem);
    final forged = parseBulletinWire(jsonEncode(map));
    expect(forged, isNotNull);
    // Binding passes (Bob's id ↔ Bob's pk) but signature is Alice's → reject.
    expect(verifyBulletinWire(forged!, bob), isFalse);
  });

  test('malformed / missing fields are rejected by parser', () {
    expect(parseBulletinWire(''), isNull);
    expect(parseBulletinWire('not json'), isNull);
    expect(parseBulletinWire('{"type":"notice"}'), isNull);
    expect(
      parseBulletinWire('{"type":"mesh_bulletin","bulletinId":"x"}'),
      isNull,
    );
  });

  test('expiry is honored', () {
    final expired = buildSignedBulletin(
      crypto: alice,
      bulletinId: 'b-old',
      text: 'expired',
      createdAt: 1000,
      expiresAt: 2000,
    );
    expect(expired.isExpired, isTrue);
    final fresh = buildSignedBulletin(
      crypto: alice,
      bulletinId: 'b-new',
      text: 'fresh',
      createdAt: DateTime.now().millisecondsSinceEpoch,
    );
    expect(fresh.isExpired, isFalse);
  });

  test('bulletin kind is never chat-visible; DMs unaffected', () {
    expect(PayloadKinds.isChatVisible(PayloadKinds.bulletin), isFalse);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.bulletin), isFalse);
    expect(PayloadKinds.isChatVisible(PayloadKinds.text), isTrue);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.text), isTrue);
  });

  test('toLocalNotice maps to #mesh scope with sender attribution', () {
    final n = signedSample().toLocalNotice();
    expect(n.scope, 'mesh');
    expect(n.channelLabel, '#mesh');
    expect(n.senderId, alice.myUserId);
    expect(n.urgent, isTrue);
  });
}

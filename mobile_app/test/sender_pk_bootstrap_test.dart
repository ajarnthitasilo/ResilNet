import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  test('wire senderPk binds to senderId and verifies envelope', () {
    final alice = CryptoService();
    final aliceKeys = alice.generateKeyPairPems();
    alice.useInMemoryKeys(
      publicPem: aliceKeys.publicPem,
      privatePem: aliceKeys.privatePem,
    );
    final aliceId = CryptoService.publicKeyHash(aliceKeys.publicPem);

    final bob = CryptoService();
    final bobKeys = bob.generateKeyPairPems();
    final bobId = CryptoService.publicKeyHash(bobKeys.publicPem);

    const ts = 1_700_000_000_000;
    final pkg = alice.encryptForRecipient(
      plaintext: '{"v":1,"b64":"AQID","ext":"m4a"}',
      receiverPublicPem: bobKeys.publicPem,
      senderId: aliceId,
      receiverId: bobId,
      timestamp: ts,
    );

    final msg = ChatMessage(
      id: 'voice-1',
      senderId: aliceId,
      receiverId: bobId,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: 'audio',
      senderPk: CryptoService.compactPublicKey(aliceKeys.publicPem),
    );

    expect(
      CryptoService.bindsIdentity(
        rid: msg.senderId,
        publicKeyMaterial: msg.senderPk!,
      ),
      isTrue,
    );

    final pem = CryptoService.normalizePublicKey(msg.senderPk!);
    expect(
      bob.verifyInboundEnvelope(
        signature: msg.signature,
        senderPublicPem: pem,
        encryptedPayload: msg.encryptedPayload,
        encryptedKey: msg.encryptedKey,
        senderId: msg.senderId,
        receiverId: msg.receiverId,
        timestamp: msg.timestamp,
      ),
      isTrue,
    );

    final wire = msg.toMap();
    expect(wire['senderPk'], isNotEmpty);
    final roundTrip = ChatMessage.fromMap(wire);
    expect(roundTrip.senderPk, msg.senderPk);
  });
}

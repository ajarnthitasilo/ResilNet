import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  test('forged senderId fails verifyInboundEnvelope', () {
    final alice = CryptoService();
    final aliceKeys = alice.generateKeyPairPems();
    alice.useInMemoryKeys(
      publicPem: aliceKeys.publicPem,
      privatePem: aliceKeys.privatePem,
    );

    final bob = CryptoService();
    final bobKeys = bob.generateKeyPairPems();

    const aliceId = 'alice-claimed-id';
    const bobId = 'bob-id';
    const forgedSenderId = 'victim-id';
    const ts = 1_700_000_000_000;

    final pkg = alice.encryptForRecipient(
      plaintext: 'hello sealed',
      receiverPublicPem: bobKeys.publicPem,
      senderId: aliceId,
      receiverId: bobId,
      timestamp: ts,
    );

    final legit = bob.verifyInboundEnvelope(
      signature: pkg.signature,
      senderPublicPem: aliceKeys.publicPem,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      senderId: aliceId,
      receiverId: bobId,
      timestamp: ts,
    );
    expect(legit, isTrue);

    final forged = bob.verifyInboundEnvelope(
      signature: pkg.signature,
      senderPublicPem: aliceKeys.publicPem,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      senderId: forgedSenderId,
      receiverId: bobId,
      timestamp: ts,
    );
    expect(forged, isFalse);

    expect(
      bob.verifyInboundEnvelope(
        signature: '',
        senderPublicPem: aliceKeys.publicPem,
        encryptedPayload: pkg.encryptedPayload,
        encryptedKey: pkg.encryptedKey,
        senderId: aliceId,
        receiverId: bobId,
        timestamp: ts,
      ),
      isFalse,
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/board_invite_wire.dart';
import 'package:resilnet/core/identity_invite_wire.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  late CryptoService alice;

  setUpAll(() {
    alice = CryptoService();
    final keys = alice.generateKeyPairPems();
    alice.useInMemoryKeys(
      publicPem: keys.publicPem,
      privatePem: keys.privatePem,
    );
  });

  test('identity invite round-trips via deep link', () {
    final link = encodeIdentityInviteDeepLink(
      id: alice.myUserId,
      publicKeyPem: alice.publicKeyPem,
      name: 'Alice',
    );
    expect(link, startsWith('resilnet://peer/invite?d='));
    final parsed = parseIdentityInvite(link);
    expect(parsed, isNotNull);
    expect(parsed!.id, alice.myUserId);
    expect(parsed.name, 'Alice');
    expect(
      CryptoService.bindsIdentity(
        rid: parsed.id,
        publicKeyMaterial: parsed.publicKeyPem,
      ),
      isTrue,
    );
  });

  test('identity JSON is not parsed as board invite', () {
    final json = encodeIdentityInvite(
      id: alice.myUserId,
      publicKeyPem: alice.publicKeyPem,
      name: 'Alice',
    );
    expect(parseIdentityInvite(json), isNotNull);
    expect(parseBoardInvite(json), isNull);
  });

  test('board invite is not parsed as identity', () {
    final boardJson =
        '{"v":1,"type":"board_invite","id":"b1","title":"T",'
        '"ownerId":"o1","pk":"${CryptoService.compactPublicKey(alice.publicKeyPem)}",'
        '"createdAt":1,"allowLocked":true,"allowOpen":false,"epoch":1}';
    expect(parseBoardInvite(boardJson), isNotNull);
    expect(parseIdentityInvite(boardJson), isNull);
  });

  test('looksLikePublicKeyHash matches SHA-256 base64url length', () {
    expect(looksLikePublicKeyHash(alice.myUserId), isTrue);
    expect(looksLikePublicKeyHash('short'), isFalse);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  test('generateKeyPairPems produces unique public key hashes', () {
    final crypto = CryptoService();
    final a = crypto.generateKeyPairPems();
    final b = crypto.generateKeyPairPems();
    expect(a.keyId, isNot(equals(b.keyId)));
    expect(CryptoService.publicKeyHash(a.publicPem), equals(a.keyId));
  });

  test('publicKeyHash is stable for same PEM', () {
    final crypto = CryptoService();
    final pair = crypto.generateKeyPairPems();
    final h1 = CryptoService.publicKeyHash(pair.publicPem);
    final h2 = CryptoService.publicKeyHash(pair.publicPem);
    expect(h1, equals(h2));
    expect(h1, equals(pair.keyId));
  });
}

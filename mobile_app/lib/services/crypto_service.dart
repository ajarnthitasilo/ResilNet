import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/asn1.dart' as asn1;
import 'package:pointycastle/export.dart' as pc;

class CryptoService {
  static const _kPrivatePem = 'resilnet_rsa_private_pem';
  static const _kPublicPem = 'resilnet_rsa_public_pem';
  static const _keychainTimeout = Duration(seconds: 3);

  final _storage = const FlutterSecureStorage();

  String? _publicPem;
  String? _privatePem;

  Future<void> init() async {
    try {
      _privatePem = await _storage
          .read(key: _kPrivatePem)
          .timeout(_keychainTimeout);
      _publicPem =
          await _storage.read(key: _kPublicPem).timeout(_keychainTimeout);
    } catch (e) {
      debugPrint('[Crypto] Keychain read timeout/fail: $e');
    }

    if (_privatePem != null && _publicPem != null) return;

    await _generateAndPersist();
  }

  /// Panic wipe: drop RSA identity from secure storage and mint a new keypair.
  Future<void> wipeAndRegenerate() async {
    try {
      await _storage.delete(key: _kPrivatePem).timeout(_keychainTimeout);
      await _storage.delete(key: _kPublicPem).timeout(_keychainTimeout);
    } catch (e) {
      debugPrint('[Crypto] wipe delete failed: $e');
    }
    _privatePem = null;
    _publicPem = null;
    await _generateAndPersist();
  }

  Future<void> _generateAndPersist() async {
    final pair = _generateRsaKeyPair();
    final privatePem = _encodePrivateKeyToPem(
      pair.privateKey as pc.RSAPrivateKey,
    );
    final publicPem = _encodePublicKeyToPem(pair.publicKey as pc.RSAPublicKey);

    _privatePem = privatePem;
    _publicPem = publicPem;

    // Persist best-effort — อย่าบล็อก startup ถ้า Keychain ค้าง
    try {
      await _storage
          .write(key: _kPrivatePem, value: privatePem)
          .timeout(_keychainTimeout);
      await _storage
          .write(key: _kPublicPem, value: publicPem)
          .timeout(_keychainTimeout);
    } catch (e) {
      debugPrint('[Crypto] Keychain write timeout — using in-memory keys: $e');
    }
  }

  String get publicKeyPem {
    final v = _publicPem;
    if (v == null) throw StateError('CryptoService not initialized');
    return v;
  }

  String get privateKeyPem {
    final v = _privatePem;
    if (v == null) throw StateError('CryptoService not initialized');
    return v;
  }

  String get myUserId => _publicKeyHash(publicKeyPem);

  /// Build QR/identity JSON data for in-person key exchange.
  ///
  /// ใช้รูปแบบย่อ (`pk` = public key แบบ compact) เพื่อลดขนาด QR
  /// และลดโอกาส UI ค้างตอนเรนเดอร์
  Map<String, Object?> identityJson({required String displayName}) {
    return {
      'v': 1,
      'id': myUserId,
      'pk': compactPublicKey(publicKeyPem),
      'name': displayName,
    };
  }

  /// รูปแบบเก่า (เต็ม PEM) — เก็บไว้เพื่อความเข้ากันได้
  Map<String, Object?> identityJsonLegacy({required String displayName}) {
    return {'id': myUserId, 'pubKey': publicKeyPem, 'name': displayName};
  }

  /// ตัด header/footer/newline ของ PEM เหลือเฉพาะ base64
  static String compactPublicKey(String pem) {
    return pem
        .replaceAll('-----BEGIN RSA PUBLIC KEY-----', '')
        .replaceAll('-----END RSA PUBLIC KEY-----', '')
        .replaceAll('-----BEGIN PUBLIC KEY-----', '')
        .replaceAll('-----END PUBLIC KEY-----', '')
        .replaceAll(RegExp(r'\s+'), '');
  }

  /// รับได้ทั้ง compact (`pk`) และ PEM เต็ม (`pubKey`)
  static String normalizePublicKey(String raw) {
    final t = raw.trim();
    if (t.contains('BEGIN')) return t;
    final chunked = _chunkStatic(t);
    return '-----BEGIN RSA PUBLIC KEY-----\n$chunked\n-----END RSA PUBLIC KEY-----';
  }

  static String _chunkStatic(String s, [int chunkSize = 64]) {
    final b = StringBuffer();
    for (var i = 0; i < s.length; i += chunkSize) {
      b.writeln(
        s.substring(i, i + chunkSize > s.length ? s.length : i + chunkSize),
      );
    }
    return b.toString().trimRight();
  }

  /// Hash = SHA-256(publicKeyPem) encoded as base64Url (no padding).
  String _publicKeyHash(String publicPem) {
    final digest = crypto.sha256.convert(utf8.encode(publicPem));
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

  ({String encryptedPayload, String encryptedKey, String signature})
  encryptForRecipient({
    required String plaintext,
    required String receiverPublicPem,
    required String senderId,
    required String receiverId,
    required int timestamp,
  }) {
    final aesKey = _randomBytes(32);
    final iv = _randomBytes(12); // GCM recommended

    final aes = enc.Encrypter(enc.AES(enc.Key(aesKey), mode: enc.AESMode.gcm));
    final encrypted = aes.encrypt(plaintext, iv: enc.IV(iv));

    final payloadObj = <String, Object?>{
      'v': 1,
      'iv': base64Encode(iv),
      'ct': encrypted.base64,
    };
    final encryptedPayload = base64Encode(utf8.encode(jsonEncode(payloadObj)));

    final receiverPub =
        enc.RSAKeyParser().parse(receiverPublicPem) as pc.RSAPublicKey;
    final rsa = enc.Encrypter(
      enc.RSA(publicKey: receiverPub, encoding: enc.RSAEncoding.OAEP),
    );
    final encryptedKey = rsa.encryptBytes(aesKey).base64;

    final signature = _signPackage(
      encryptedKey: encryptedKey,
      encryptedPayload: encryptedPayload,
      senderId: senderId,
      receiverId: receiverId,
      timestamp: timestamp,
    );

    return (
      encryptedPayload: encryptedPayload,
      encryptedKey: encryptedKey,
      signature: signature,
    );
  }

  String signText({
    required String senderId,
    required String receiverId,
    required int timestamp,
    required String payload,
  }) {
    final priv = enc.RSAKeyParser().parse(privateKeyPem) as pc.RSAPrivateKey;
    final signer = enc.Signer(
      enc.RSASigner(enc.RSASignDigest.SHA256, privateKey: priv),
    );
    final input = '$senderId|$receiverId|$timestamp|$payload';
    return signer.sign(input).base64;
  }

  bool verifyText({
    required String senderPublicPem,
    required String senderId,
    required String receiverId,
    required int timestamp,
    required String payload,
    required String signature,
  }) {
    final pub = enc.RSAKeyParser().parse(senderPublicPem) as pc.RSAPublicKey;
    final signer = enc.Signer(
      enc.RSASigner(enc.RSASignDigest.SHA256, publicKey: pub),
    );
    final input = '$senderId|$receiverId|$timestamp|$payload';
    return signer.verify64(input, signature);
  }

  String decryptFromSender({
    required String encryptedPayload,
    required String encryptedKey,
  }) {
    final privateKey =
        enc.RSAKeyParser().parse(privateKeyPem) as pc.RSAPrivateKey;
    final rsa = enc.Encrypter(
      enc.RSA(privateKey: privateKey, encoding: enc.RSAEncoding.OAEP),
    );
    final aesKey = rsa.decryptBytes(enc.Encrypted.fromBase64(encryptedKey));

    final decodedPayload = utf8.decode(base64Decode(encryptedPayload));
    final obj = jsonDecode(decodedPayload) as Map<String, dynamic>;
    final iv = base64Decode(obj['iv'] as String);
    final ct = obj['ct'] as String;

    final aes = enc.Encrypter(
      enc.AES(enc.Key(Uint8List.fromList(aesKey)), mode: enc.AESMode.gcm),
    );
    final plaintext = aes.decrypt(enc.Encrypted.fromBase64(ct), iv: enc.IV(iv));
    return plaintext;
  }

  bool verifySignature({
    required String signature,
    required String senderPublicPem,
    required String encryptedPayload,
    required String encryptedKey,
    required String senderId,
    required String receiverId,
    required int timestamp,
  }) {
    final pub = enc.RSAKeyParser().parse(senderPublicPem) as pc.RSAPublicKey;
    final signer = enc.Signer(
      enc.RSASigner(enc.RSASignDigest.SHA256, publicKey: pub),
    );
    final input = _packageString(
      encryptedKey: encryptedKey,
      encryptedPayload: encryptedPayload,
      senderId: senderId,
      receiverId: receiverId,
      timestamp: timestamp,
    );
    return signer.verify64(input, signature);
  }

  String _signPackage({
    required String encryptedPayload,
    required String encryptedKey,
    required String senderId,
    required String receiverId,
    required int timestamp,
  }) {
    final priv = enc.RSAKeyParser().parse(privateKeyPem) as pc.RSAPrivateKey;
    final signer = enc.Signer(
      enc.RSASigner(enc.RSASignDigest.SHA256, privateKey: priv),
    );
    final input = _packageString(
      encryptedKey: encryptedKey,
      encryptedPayload: encryptedPayload,
      senderId: senderId,
      receiverId: receiverId,
      timestamp: timestamp,
    );
    return signer.sign(input).base64;
  }

  String _packageString({
    required String encryptedPayload,
    required String encryptedKey,
    required String senderId,
    required String receiverId,
    required int timestamp,
  }) {
    return '$senderId|$receiverId|$timestamp|$encryptedKey|$encryptedPayload';
  }

  Uint8List _randomBytes(int length) {
    final r = Random.secure();
    return Uint8List.fromList(
      List<int>.generate(length, (_) => r.nextInt(256)),
    );
  }

  pc.AsymmetricKeyPair<pc.PublicKey, pc.PrivateKey> _generateRsaKeyPair() {
    final rnd = pc.FortunaRandom();
    final seed = _randomBytes(32);
    rnd.seed(pc.KeyParameter(seed));

    final gen = pc.RSAKeyGenerator()
      ..init(
        pc.ParametersWithRandom(
          pc.RSAKeyGeneratorParameters(BigInt.parse('65537'), 2048, 64),
          rnd,
        ),
      );
    return gen.generateKeyPair();
  }

  String _encodePublicKeyToPem(pc.RSAPublicKey publicKey) {
    final seq = asn1.ASN1Sequence(
      elements: [
        asn1.ASN1Integer(publicKey.modulus),
        asn1.ASN1Integer(publicKey.publicExponent),
      ],
    );
    final bytes = seq.encode();
    final b64 = base64Encode(bytes);
    return '-----BEGIN RSA PUBLIC KEY-----\n${_chunk(b64)}\n-----END RSA PUBLIC KEY-----';
  }

  String _encodePrivateKeyToPem(pc.RSAPrivateKey privateKey) {
    final n = privateKey.n!;
    final d = privateKey.privateExponent!;
    final p = privateKey.p!;
    final q = privateKey.q!;
    final e = privateKey.publicExponent!;
    final dP = d % (p - BigInt.one);
    final dQ = d % (q - BigInt.one);
    final qInv = q.modInverse(p);

    final seq = asn1.ASN1Sequence(
      elements: [
        asn1.ASN1Integer(BigInt.zero),
        asn1.ASN1Integer(n),
        asn1.ASN1Integer(e),
        asn1.ASN1Integer(d),
        asn1.ASN1Integer(p),
        asn1.ASN1Integer(q),
        asn1.ASN1Integer(dP),
        asn1.ASN1Integer(dQ),
        asn1.ASN1Integer(qInv),
      ],
    );
    final b64 = base64Encode(seq.encode());
    return '-----BEGIN RSA PRIVATE KEY-----\n${_chunk(b64)}\n-----END RSA PRIVATE KEY-----';
  }

  String _chunk(String s, [int chunkSize = 64]) {
    final b = StringBuffer();
    for (var i = 0; i < s.length; i += chunkSize) {
      b.writeln(
        s.substring(i, i + chunkSize > s.length ? s.length : i + chunkSize),
      );
    }
    return b.toString().trimRight();
  }
}

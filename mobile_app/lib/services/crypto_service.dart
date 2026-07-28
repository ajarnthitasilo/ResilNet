import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pointycastle/asn1.dart' as asn1;
import 'package:pointycastle/export.dart' as pc;

import 'secure_storage.dart';

/// Keychain temporarily unavailable — do **not** mint a new identity.
class IdentityUnavailableException implements Exception {
  IdentityUnavailableException(this.message, {this.userMessage});
  final String message;

  /// Short message safe to show on the boot error screen.
  final String? userMessage;

  @override
  String toString() => userMessage ?? message;
}

class CryptoService {
  static const _kPrivatePem = 'resilnet_rsa_private_pem';
  static const _kPublicPem = 'resilnet_rsa_public_pem';
  static const _keychainTimeout = Duration(seconds: 5);
  static const _wipeTimeout = Duration(seconds: 12);

  final FlutterSecureStorage _storage;
  final FlutterSecureStorage _legacyStorage;

  String? _publicPem;
  String? _privatePem;
  bool _restoredFromKeychain = false;
  Future<String?> Function()? _readExpectedUserId;
  Future<void> Function(String userId)? _writeExpectedUserId;
  Future<bool> Function()? _hasLocalUserData;

  CryptoService({
    FlutterSecureStorage? storage,
    FlutterSecureStorage? legacyStorage,
  })  : _storage = storage ?? resilnetSecureStorage,
        _legacyStorage = legacyStorage ?? resilnetLegacyGroupSecureStorage;

  /// True when RSA keys were loaded from Keychain (not minted this session).
  /// Used to skip onboarding after reinstall when prefs were cleared.
  bool get restoredFromKeychain => _restoredFromKeychain;

  /// Load identity from Keychain with retries + legacy migration.
  ///
  /// Only mints a new keypair when Keychain reads succeed and both keys are
  /// absent (true first install). Timeouts / read failures throw
  /// [IdentityUnavailableException] instead of silently replacing identity.
  ///
  /// When [readExpectedUserId] or [hasLocalUserData] indicate a returning user
  /// but Keychain is empty, init refuses to mint and throws.
  Future<void> init({
    Future<String?> Function()? readExpectedUserId,
    Future<void> Function(String userId)? writeExpectedUserId,
    Future<bool> Function()? hasLocalUserData,
  }) async {
    _readExpectedUserId = readExpectedUserId;
    _writeExpectedUserId = writeExpectedUserId;
    _hasLocalUserData = hasLocalUserData;
    Object? lastErr;

    // 1) Canonical default-group Keychain (fixes -34018 boot failure).
    for (var attempt = 1; attempt <= 4; attempt++) {
      final result = await _tryReadIdentityPair(_storage);
      if (result.readOk) {
        final applied = await _applyReadResult(result, migrateFromLegacy: false);
        if (applied) return;
        lastErr = StateError('partial identity in keychain');
        debugPrint('[Crypto] partial identity keys — retry $attempt/4');
      } else {
        lastErr = result.error;
        debugPrint(
          '[Crypto] keychain read failed attempt $attempt/4: ${result.error}',
        );
      }
      if (attempt < 4) {
        await Future<void>.delayed(Duration(milliseconds: 350 * attempt));
      }
    }

    // 2) Best-effort recover from legacy shared-group Keychain, then migrate.
    final legacy = await _tryReadIdentityPair(_legacyStorage);
    if (legacy.readOk) {
      final applied = await _applyReadResult(legacy, migrateFromLegacy: true);
      if (applied) return;
      lastErr ??= StateError('partial identity in legacy keychain');
    } else if (legacy.error != null) {
      debugPrint('[Crypto] legacy keychain read skipped: ${legacy.error}');
      // -34018 on legacy is expected; do not treat as fatal if primary was empty.
    }

    // If primary reads succeeded as empty earlier we would have minted already.
    // Reaching here means primary never got a clean empty/success read.
    final primaryProbe = await _tryReadIdentityPair(_storage);
    if (primaryProbe.readOk) {
      final applied =
          await _applyReadResult(primaryProbe, migrateFromLegacy: false);
      if (applied) return;
    } else {
      lastErr = primaryProbe.error ?? lastErr;
    }

    final entitlement = _looksLikeMissingEntitlement(lastErr);
    throw IdentityUnavailableException(
      'Keychain unavailable — identity not loaded '
      '(will not mint a new key). Last error: $lastErr',
      userMessage: entitlement
          ? 'ไม่สามารถเข้าถึง Keychain ได้ (สิทธิ์ระบบ) — กดลองอีกครั้ง '
              'หากยังไม่สำเร็จ ให้ติดตั้งเวอร์ชันล่าสุดใหม่'
          : 'ไม่สามารถโหลดตัวตนจาก Keychain ได้ — กดลองอีกครั้ง',
    );
  }

  /// Returns true when init can finish (restored or minted).
  Future<bool> _applyReadResult(
    ({String? priv, String? pub, bool readOk, Object? error}) result, {
    required bool migrateFromLegacy,
  }) async {
    if (!result.readOk) return false;
    final priv = result.priv?.trim();
    final pub = result.pub?.trim();
    if (priv != null &&
        priv.isNotEmpty &&
        pub != null &&
        pub.isNotEmpty) {
      _privatePem = priv;
      _publicPem = pub;
      _restoredFromKeychain = true;
      if (migrateFromLegacy) {
        await _migrateIdentityToCanonical(priv, pub);
        debugPrint('[Crypto] identity migrated from legacy keychain group');
      } else {
        debugPrint('[Crypto] identity restored from keychain');
      }
      await _persistExpectedUserId();
      await _verifyPersistedKeys();
      return true;
    }
    if ((priv == null || priv.isEmpty) && (pub == null || pub.isEmpty)) {
      if (migrateFromLegacy) return false;
      await _refuseMintIfReturningUser();
      _restoredFromKeychain = false;
      await _generateAndPersist();
      await _persistExpectedUserId();
      debugPrint('[Crypto] first-install identity minted id=${myUserId}');
      return true;
    }
    return false;
  }

  Future<void> _refuseMintIfReturningUser() async {
    final expected = await _readExpectedUserId?.call();
    if (expected != null && expected.isNotEmpty) {
      debugPrint(
        '[Crypto] keychain empty but expected identity $expected — refuse mint',
      );
      throw IdentityUnavailableException(
        'Keychain empty but expected identity $expected',
        userMessage:
            'ไม่พบกุญแจตัวตนใน Keychain แต่เครื่องนี้เคยใช้งานแล้ว — กดลองอีกครั้ง '
            'หากยังไม่สำเร็จ ให้ติดตั้งเวอร์ชันล่าสุดใหม่',
      );
    }
    final hasData = await _hasLocalUserData?.call() ?? false;
    if (hasData) {
      debugPrint('[Crypto] keychain empty but local data exists — refuse mint');
      throw IdentityUnavailableException(
        'Keychain empty but local user data exists',
        userMessage:
            'ไม่พบกุญแจตัวตนใน Keychain แต่มีข้อมูลแชท/เพื่อนในเครื่อง — กดลองอีกครั้ง',
      );
    }
  }

  Future<void> _persistExpectedUserId() async {
    final writer = _writeExpectedUserId;
    if (writer == null) return;
    try {
      await writer(myUserId);
    } catch (e) {
      debugPrint('[Crypto] identity fingerprint write failed: $e');
    }
  }

  Future<void> _verifyPersistedKeys() async {
    final storedPriv = await _readKey(_kPrivatePem);
    final storedPub = await _readKey(_kPublicPem);
    if (storedPriv != _privatePem || storedPub != _publicPem) {
      debugPrint('[Crypto] identity read-back verify failed');
      throw IdentityUnavailableException(
        'Keychain read-back verify failed',
        userMessage: 'บันทึกกุญแจตัวตนไม่สมบูรณ์ — กดลองอีกครั้ง',
      );
    }
  }

  Future<void> _migrateIdentityToCanonical(String priv, String pub) async {
    await _storage
        .write(key: _kPrivatePem, value: priv)
        .timeout(_wipeTimeout);
    await _storage.write(key: _kPublicPem, value: pub).timeout(_wipeTimeout);
    final storedPriv = await _readKey(_kPrivatePem);
    final storedPub = await _readKey(_kPublicPem);
    if (storedPriv != priv || storedPub != pub) {
      throw IdentityUnavailableException(
        'Legacy identity migrate verify failed',
        userMessage: 'ย้ายกุญแจตัวตนไม่สำเร็จ — กดลองอีกครั้ง',
      );
    }
  }

  bool _looksLikeMissingEntitlement(Object? err) {
    final s = '$err';
    return s.contains('-34018') ||
        s.contains('entitlement') ||
        s.contains('Unexpected security result');
  }

  Future<({String? priv, String? pub, bool readOk, Object? error})>
      _tryReadIdentityPair(FlutterSecureStorage storage) async {
    try {
      final priv =
          await storage.read(key: _kPrivatePem).timeout(_keychainTimeout);
      final pub =
          await storage.read(key: _kPublicPem).timeout(_keychainTimeout);
      return (priv: priv, pub: pub, readOk: true, error: null);
    } catch (e) {
      return (priv: null, pub: null, readOk: false, error: e);
    }
  }

  /// Panic wipe: drop RSA identity from secure storage and mint a new keypair.
  Future<String> wipeAndRegenerate() async {
    final oldId = _publicPem != null ? myUserId : null;
    await _wipeStoredIdentityKeys();
    _privatePem = null;
    _publicPem = null;
    _restoredFromKeychain = false;
    await _generateAndPersist(requirePersist: true);

    final newId = myUserId;
    await _persistExpectedUserId();
    if (oldId != null && oldId == newId) {
      throw StateError('Identity wipe failed: public key hash unchanged');
    }
    debugPrint('[Crypto] wipeAndRegenerate $oldId -> $newId');
    return newId;
  }

  Future<void> _wipeStoredIdentityKeys() async {
    for (final store in [_storage, _legacyStorage]) {
      for (var attempt = 0; attempt < 3; attempt++) {
        try {
          await store.delete(key: _kPrivatePem).timeout(_wipeTimeout);
          await store.delete(key: _kPublicPem).timeout(_wipeTimeout);
        } catch (e) {
          debugPrint('[Crypto] wipe delete attempt ${attempt + 1}: $e');
        }
      }
      try {
        await store.deleteAll().timeout(_wipeTimeout);
      } catch (e) {
        debugPrint('[Crypto] wipe deleteAll failed: $e');
      }
    }

    final priv = await _readKey(_kPrivatePem);
    final pub = await _readKey(_kPublicPem);
    if (priv != null || pub != null) {
      throw StateError('Identity wipe failed: RSA keys still in secure storage');
    }
  }

  Future<String?> _readKey(String key) async {
    try {
      return await _storage.read(key: key).timeout(_keychainTimeout);
    } catch (e) {
      debugPrint('[Crypto] read $key failed: $e');
      return null;
    }
  }

  Future<void> _generateAndPersist({bool requirePersist = true}) async {
    final pair = _generateRsaKeyPair();
    final privatePem = _encodePrivateKeyToPem(
      pair.privateKey as pc.RSAPrivateKey,
    );
    final publicPem = _encodePublicKeyToPem(pair.publicKey as pc.RSAPublicKey);

    _privatePem = privatePem;
    _publicPem = publicPem;

    try {
      await _storage
          .write(key: _kPrivatePem, value: privatePem)
          .timeout(_wipeTimeout);
      await _storage
          .write(key: _kPublicPem, value: publicPem)
          .timeout(_wipeTimeout);
    } catch (e) {
      debugPrint('[Crypto] identity write-failed: $e');
      if (requirePersist) {
        throw IdentityUnavailableException(
          'Identity persist failed: $e',
          userMessage: 'บันทึกกุญแจตัวตนไม่สำเร็จ — กดลองอีกครั้ง',
        );
      }
    }

    if (requirePersist) {
      final storedPriv = await _readKey(_kPrivatePem);
      final storedPub = await _readKey(_kPublicPem);
      if (storedPriv != privatePem || storedPub != publicPem) {
        debugPrint('[Crypto] identity write verify failed');
        throw IdentityUnavailableException(
          'Identity persist verify failed',
          userMessage: 'บันทึกกุญแจตัวตนไม่สมบูรณ์ — กดลองอีกครั้ง',
        );
      }
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

  String get myUserId => publicKeyHash(publicKeyPem);

  /// Hash = SHA-256(publicKeyPem) encoded as base64Url (no padding).
  /// Same algorithm used for `myUserId` and QR `id`.
  static String publicKeyHash(String publicPem) {
    final digest = crypto.sha256.convert(utf8.encode(publicPem));
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }

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

  /// True when [rid] equals hash of normalized [publicKeyMaterial] (QR / Nostr binding).
  static bool bindsIdentity({
    required String rid,
    required String publicKeyMaterial,
  }) {
    final id = rid.trim();
    final raw = publicKeyMaterial.trim();
    if (id.isEmpty || raw.isEmpty) return false;
    try {
      final pem = normalizePublicKey(raw);
      return publicKeyHash(pem) == id;
    } catch (_) {
      return false;
    }
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
    return decryptWithPrivatePem(
      privatePem: privateKeyPem,
      encryptedPayload: encryptedPayload,
      encryptedKey: encryptedKey,
    );
  }

  /// Decrypt using an arbitrary RSA private PEM (e.g. announcement board key).
  String decryptWithPrivatePem({
    required String privatePem,
    required String encryptedPayload,
    required String encryptedKey,
  }) {
    final privateKey =
        enc.RSAKeyParser().parse(privatePem) as pc.RSAPrivateKey;
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

  /// Mint a fresh RSA-2048 keypair (e.g. for an announcement board).
  ({String publicPem, String privatePem, String keyId}) generateKeyPairPems() {
    final pair = _generateRsaKeyPair();
    final privatePem = _encodePrivateKeyToPem(
      pair.privateKey as pc.RSAPrivateKey,
    );
    final publicPem = _encodePublicKeyToPem(pair.publicKey as pc.RSAPublicKey);
    return (
      publicPem: publicPem,
      privatePem: privatePem,
      keyId: publicKeyHash(publicPem),
    );
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

  /// Verify a sealed inbound envelope. Returns false on missing/invalid signature.
  bool verifyInboundEnvelope({
    required String? signature,
    required String senderPublicPem,
    required String encryptedPayload,
    required String encryptedKey,
    required String senderId,
    required String receiverId,
    required int timestamp,
  }) {
    final sig = signature?.trim() ?? '';
    if (sig.isEmpty || senderPublicPem.trim().isEmpty) return false;
    try {
      return verifySignature(
        signature: sig,
        senderPublicPem: senderPublicPem,
        encryptedPayload: encryptedPayload,
        encryptedKey: encryptedKey,
        senderId: senderId,
        receiverId: receiverId,
        timestamp: timestamp,
      );
    } catch (e) {
      debugPrint('[Crypto] verifyInboundEnvelope failed: $e');
      return false;
    }
  }

  /// In-memory keys for unit tests (skips secure storage).
  void useInMemoryKeys({
    required String publicPem,
    required String privatePem,
  }) {
    _publicPem = publicPem;
    _privatePem = privatePem;
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

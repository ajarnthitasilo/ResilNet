import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/models/area_presence.dart';
import 'package:resilnet/models/peer.dart';
import 'package:resilnet/models/transport_mode.dart';
import 'package:resilnet/services/crypto_service.dart';

void main() {
  group('CryptoService.bindsIdentity', () {
    test('accepts rid == hash(pk) for compact and PEM', () {
      final c = CryptoService();
      final keys = c.generateKeyPairPems();
      final rid = keys.keyId;
      final compact = CryptoService.compactPublicKey(keys.publicPem);

      expect(
        CryptoService.bindsIdentity(
          rid: rid,
          publicKeyMaterial: keys.publicPem,
        ),
        isTrue,
      );
      expect(
        CryptoService.bindsIdentity(rid: rid, publicKeyMaterial: compact),
        isTrue,
      );
    });

    test('rejects mismatched rid/pk and empty fields', () {
      final a = CryptoService().generateKeyPairPems();
      final b = CryptoService().generateKeyPairPems();

      expect(
        CryptoService.bindsIdentity(
          rid: a.keyId,
          publicKeyMaterial: b.publicPem,
        ),
        isFalse,
      );
      expect(
        CryptoService.bindsIdentity(rid: '', publicKeyMaterial: a.publicPem),
        isFalse,
      );
      expect(
        CryptoService.bindsIdentity(rid: a.keyId, publicKeyMaterial: ''),
        isFalse,
      );
    });
  });

  group('mergeAreaPresence Nostr-bound peer', () {
    test('bound Nostr sighting is messageable and merges with mesh', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final peer = Peer(
        id: 'rid-abc',
        publicKey: '-----BEGIN RSA PUBLIC KEY-----\nMII\n-----END RSA PUBLIC KEY-----',
        displayName: 'Pad',
        geohash: 'w4r',
        isVerifiedIssuer: false,
        isBlocked: false,
        lastSeen: now,
      );
      final list = mergeAreaPresence(
        meshPeers: [peer],
        nostrSightings: [
          NostrPresenceSighting(
            pubkeyHex: 'aabbccdd',
            nick: 'Pad',
            geohash: 'w4r',
            lastSeen: now,
            resilnetId: 'rid-abc',
            peer: peer,
          ),
        ],
        channel: 'w4r',
        mode: TransportMode.auto,
        nowMs: now,
      );
      expect(list, hasLength(1));
      expect(list.first.canMessage, isTrue);
      expect(list.first.source, PresenceSource.both);
      expect(list.first.id, 'rid-abc');
    });
  });
}

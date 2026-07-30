import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/geohash.dart';
import 'package:resilnet/core/peer_id.dart';
import 'package:resilnet/models/area_presence.dart';
import 'package:resilnet/models/peer.dart';
import 'package:resilnet/models/transport_mode.dart';

void main() {
  group('formatShortPeerId', () {
    test('truncates long hashes to 6 chars with ellipsis', () {
      expect(
        formatShortPeerId('abcdef0123456789'),
        'abcdef...',
      );
    });

    test('keeps short ids as-is', () {
      expect(formatShortPeerId('abc'), 'abc');
      expect(formatShortPeerId('abcdef'), 'abcdef');
    });

    test('respects custom length clamped 4–12', () {
      expect(formatShortPeerId('abcdefghijklmno', len: 4), 'abcd...');
      expect(formatShortPeerId('abcdefghijklmno', len: 8), 'abcdefgh...');
    });
  });

  group('peerListLabel', () {
    test('ignores OS Bluetooth names and shows short id', () {
      expect(
        peerListLabel(aliasOrNick: 'iPad', id: 'mwhfyZabcdef'),
        'mwhfyZ...',
      );
      expect(
        peerListLabel(aliasOrNick: 'iPhone ‘s Ajarn', id: 'aabbccddeeff'),
        'aabbcc...',
      );
    });

    test('keeps real human aliases', () {
      expect(peerListLabel(aliasOrNick: 'Pad', id: 'aabbccddeeff'), 'Pad');
    });

    test('merge drops empty-key BLE stubs', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final list = mergeAreaPresence(
        meshPeers: [
          Peer(
            id: 'ble:deadbeef',
            publicKey: '',
            displayName: 'iPad',
            isVerifiedIssuer: false,
            isBlocked: false,
            lastSeen: now,
          ),
          Peer(
            id: 'mwhfyZabcdef01',
            publicKey: 'pk',
            isVerifiedIssuer: false,
            isBlocked: false,
            lastSeen: now,
          ),
        ],
        nostrSightings: const [],
        channel: null,
        mode: TransportMode.mesh,
        nowMs: now,
      );
      expect(list, hasLength(1));
      expect(list.first.id, 'mwhfyZabcdef01');
      expect(list.first.label, 'mwhfyZ...');
    });
  });

  group('formatAnonSender', () {
    test('uses first 4 chars of pubkey hash', () {
      expect(formatAnonSender('bxslCiCwjb'), 'anon·bxsl');
      expect(formatAnonSender('ABCD1234'), 'anon·ABCD');
    });

    test('handles short and empty ids', () {
      expect(formatAnonSender('ab'), 'anon·ab');
      expect(formatAnonSender(null), 'anon·????');
      expect(formatAnonSender('  '), 'anon·????');
    });
  });

  group('presence online window', () {
    test('sightings within 240s stay online', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final list = mergeAreaPresence(
        meshPeers: const [],
        nostrSightings: [
          NostrPresenceSighting(
            pubkeyHex: 'peer01',
            nick: 'Pad',
            geohash: 'w5jt8',
            lastSeen: now - const Duration(seconds: 200).inMilliseconds,
          ),
        ],
        channel: 'w5jt8',
        mode: TransportMode.internet,
        nowMs: now,
      );
      expect(list, hasLength(1));
      expect(list.first.label, 'Pad');
    });

    test('mesh label falls back to short id', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      final list = mergeAreaPresence(
        meshPeers: [
          Peer(
            id: 'aabbccddeeff00112233',
            publicKey: 'pk',
            isVerifiedIssuer: false,
            isBlocked: false,
            lastSeen: now,
          ),
        ],
        nostrSightings: const [],
        channel: null,
        mode: TransportMode.mesh,
        nowMs: now,
      );
      expect(list.first.label, 'aabbcc...');
    });
  });

  group('bootstrap geohash', () {
    test('default region prefix is w5', () {
      expect(Geohash.bootstrapGeohash, 'w5');
      expect(Geohash.normalizeFull('w5'), 'w5');
      expect(Geohash.atPrecision('w5', GeoPrecision.region), 'w5');
    });
  });

  group('BLE radio discovery entry', () {
    test('radio rows are not messageable', () {
      const e = AreaPresenceEntry(
        id: 'radio:deadbeef',
        label: 'radio·dead',
        source: PresenceSource.mesh,
        geohash: null,
        lastSeen: 0,
      );
      expect(e.isBleRadioDiscovery, isTrue);
      expect(e.canMessage, isFalse);
    });
  });

  group('hasActiveNostrPresenceInChannel', () {
    test('true when sighting online in channel', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      expect(
        hasActiveNostrPresenceInChannel(
          sightings: [
            NostrPresenceSighting(
              pubkeyHex: 'aa',
              nick: 'x',
              geohash: 'w5jt8',
              lastSeen: now,
            ),
          ],
          channel: 'w5',
          nowMs: now,
        ),
        isTrue,
      );
    });

    test('false when only stale sightings', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      expect(
        hasActiveNostrPresenceInChannel(
          sightings: [
            NostrPresenceSighting(
              pubkeyHex: 'aa',
              nick: 'x',
              geohash: 'w5',
              lastSeen: now - const Duration(minutes: 10).inMilliseconds,
            ),
          ],
          channel: 'w5',
          nowMs: now,
        ),
        isFalse,
      );
    });

    test('false when channel mismatch', () {
      final now = DateTime.now().millisecondsSinceEpoch;
      expect(
        hasActiveNostrPresenceInChannel(
          sightings: [
            NostrPresenceSighting(
              pubkeyHex: 'aa',
              nick: 'x',
              geohash: 'dr5rs',
              lastSeen: now,
            ),
          ],
          channel: 'w5',
          nowMs: now,
        ),
        isFalse,
      );
    });
  });
}

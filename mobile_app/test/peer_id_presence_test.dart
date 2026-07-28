import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/peer_id.dart';
import 'package:resilnet/models/area_presence.dart';
import 'package:resilnet/models/peer.dart';
import 'package:resilnet/models/transport_mode.dart';

void main() {
  group('formatShortPeerId', () {
    test('truncates long hashes to 6 chars with ellipsis', () {
      expect(
        formatShortPeerId('abcdef0123456789'),
        'abcdef…',
      );
    });

    test('keeps short ids as-is', () {
      expect(formatShortPeerId('abc'), 'abc');
      expect(formatShortPeerId('abcdef'), 'abcdef');
    });

    test('respects custom length clamped 4–12', () {
      expect(formatShortPeerId('abcdefghijklmno', len: 4), 'abcd…');
      expect(formatShortPeerId('abcdefghijklmno', len: 8), 'abcdefgh…');
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
      expect(list.first.label, 'aabbcc…');
    });
  });
}

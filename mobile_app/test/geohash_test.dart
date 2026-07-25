import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/geohash.dart';

void main() {
  group('Geohash.encode', () {
    test('encodes Chiang Mai area to expected prefix', () {
      // ~18.7883, 98.9853 — Chiang Mai
      final h = Geohash.encode(18.7883, 98.9853, precision: 7);
      expect(h.length, 7);
      expect(h, matches(RegExp(r'^[0-9b-hjkmnp-z]+$')));
      // Stable known sample (standard geohash for ~Chiang Mai)
      expect(h, 'w5q6ukq');
    });

    test('higher precision extends lower precision prefix', () {
      final city = Geohash.encode(18.7883, 98.9853, precision: 5);
      final block = Geohash.encode(18.7883, 98.9853, precision: 7);
      expect(block.startsWith(city), isTrue);
    });
  });

  group('Geohash channel helpers', () {
    test('atPrecision truncates', () {
      expect(
        Geohash.atPrecision('w5q6uj7', GeoPrecision.city),
        'w5q6u',
      );
    });

    test('matchesChannel uses prefix', () {
      expect(Geohash.matchesChannel('w5q6uj7', 'w5q6u'), isTrue);
      expect(Geohash.matchesChannel('w5q6u', 'w5q6uj7'), isTrue);
      expect(Geohash.matchesChannel('xyz', 'w5q6u'), isFalse);
    });

    test('channelLabel adds hash', () {
      expect(Geohash.channelLabel('w5q6u'), '#w5q6u');
      expect(Geohash.channelLabel('#abc'), '#abc');
    });
  });
}

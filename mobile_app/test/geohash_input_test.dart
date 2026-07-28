import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/geohash.dart';

void main() {
  group('Geohash.parseInput', () {
    test('parses plain and hashed input', () {
      expect(Geohash.parseInput('w5'), 'w5');
      expect(Geohash.parseInput('#w5jt8'), 'w5jt8');
      expect(Geohash.parseInput('W5JT8'), 'w5jt8');
    });

    test('rejects invalid characters', () {
      expect(Geohash.parseInput(''), isNull);
      expect(Geohash.parseInput('w'), isNull);
      expect(Geohash.parseInput('hello'), isNull);
      expect(Geohash.parseInput('w5!'), isNull);
    });
  });

  group('Geohash.normalizeFull', () {
    test('truncates to block precision', () {
      expect(Geohash.normalizeFull('w5jt8xyz'), 'w5jt8xy');
    });

    test('keeps short prefixes', () {
      expect(Geohash.normalizeFull('w5'), 'w5');
    });
  });
}

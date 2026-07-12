import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/services/geo_service.dart';

void main() {
  group('GeoService.calculateDistanceMeters (Haversine)', () {
    test('returns 0 for identical coordinates', () {
      const lat = 18.7883;
      const lon = 98.9853;

      final d = GeoService.calculateDistanceMeters(
        lat1: lat,
        lon1: lon,
        lat2: lat,
        lon2: lon,
      );

      expect(d, closeTo(0, 0.01));
    });

    test('equator: 1 degree longitude ≈ 111.2 km', () {
      final d = GeoService.calculateDistanceMeters(
        lat1: 0,
        lon1: 0,
        lat2: 0,
        lon2: 1,
      );

      // ~111.32 km at equator
      expect(d, closeTo(111_195, 500));
    });

    test('Paris to London ≈ 343 km', () {
      // อ้างอิงระยะทาง great-circle มาตรฐาน (~343.5 km)
      final d = GeoService.calculateDistanceMeters(
        lat1: 48.8567,
        lon1: 2.2950,
        lat2: 51.5074,
        lon2: -0.1278,
      );

      expect(d, closeTo(341_473, 3_000));
    });

    test('symmetry: A→B equals B→A', () {
      const latA = 18.7883;
      const lonA = 98.9853;
      const latB = 18.8000;
      const lonB = 99.0000;

      final ab = GeoService.calculateDistanceMeters(
        lat1: latA,
        lon1: lonA,
        lat2: latB,
        lon2: lonB,
      );
      final ba = GeoService.calculateDistanceMeters(
        lat1: latB,
        lon1: lonB,
        lat2: latA,
        lon2: lonA,
      );

      expect(ab, closeTo(ba, 0.01));
    });
  });
}

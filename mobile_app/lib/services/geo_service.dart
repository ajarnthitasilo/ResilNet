import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../models/geo_location_result.dart';

/// บริการพิกัดและคำนวณระยะทาง (Haversine)
class GeoService {
  /// ระยะทางเป็นเมตร ระหว่างสองพิกัด (Haversine)
  static double calculateDistanceMeters({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    const earthRadiusM = 6371000.0;
    final dLat = _toRad(lat2 - lat1);
    final dLon = _toRad(lon2 - lon1);
    final a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRad(lat1)) *
            math.cos(_toRad(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusM * c;
  }

  static double _toRad(double deg) => deg * math.pi / 180.0;

  static const _lastKnownMaxAge = Duration(minutes: 30);

  /// Resolve current device position with iPad-friendly fallbacks.
  static Future<GeoLocationResult> resolvePosition() async {
    final enabled = await Geolocator.isLocationServiceEnabled();
    if (!enabled) {
      debugPrint('[Geo] services disabled');
      return const GeoLocationResult(status: GeoLocationStatus.servicesDisabled);
    }

    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }
    if (perm == LocationPermission.denied ||
        perm == LocationPermission.deniedForever) {
      debugPrint('[Geo] permission denied perm=$perm');
      return const GeoLocationResult(status: GeoLocationStatus.needsPermission);
    }

    final preferCoarseFirst = Platform.isIOS;
    final accuracies = preferCoarseFirst
        ? const [
            LocationAccuracy.medium,
            LocationAccuracy.low,
            LocationAccuracy.high,
          ]
        : const [
            LocationAccuracy.high,
            LocationAccuracy.medium,
            LocationAccuracy.low,
          ];
    final timeLimit = preferCoarseFirst ? 22 : 14;

    for (final accuracy in accuracies) {
      try {
        final pos = await Geolocator.getCurrentPosition(
          locationSettings: LocationSettings(
            accuracy: accuracy,
            timeLimit: Duration(seconds: timeLimit),
          ),
        );
        debugPrint(
          '[Geo] fix ok accuracy=$accuracy lat=${pos.latitude} lon=${pos.longitude}',
        );
        return GeoLocationResult(
          status: GeoLocationStatus.resolved,
          position: pos,
        );
      } catch (e) {
        debugPrint('[Geo] getCurrentPosition accuracy=$accuracy failed: $e');
      }
    }

    try {
      final last = await Geolocator.getLastKnownPosition();
      if (last != null) {
        final age = DateTime.now().difference(last.timestamp);
        if (age <= _lastKnownMaxAge) {
          debugPrint('[Geo] using lastKnown age=${age.inSeconds}s');
          return GeoLocationResult(
            status: GeoLocationStatus.resolved,
            position: last,
            usedLastKnown: true,
          );
        }
        debugPrint('[Geo] lastKnown too old age=${age.inMinutes}m');
      }
    } catch (e) {
      debugPrint('[Geo] getLastKnownPosition failed: $e');
    }

    debugPrint('[Geo] unavailable — no fix');
    return const GeoLocationResult(status: GeoLocationStatus.unavailable);
  }

  /// Legacy helper — returns position or null.
  static Future<Position?> getCurrentPosition() async {
    final result = await resolvePosition();
    return result.position;
  }
}

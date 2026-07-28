import 'package:geolocator/geolocator.dart';

/// Result of attempting to resolve device location into a geohash cell.
enum GeoLocationStatus {
  /// GPS/Wi‑Fi fix resolved successfully.
  resolved,

  /// User set geohash manually (teleport).
  manual,

  /// Location permission denied.
  needsPermission,

  /// System location services disabled.
  servicesDisabled,

  /// Timed out or no fix (common on Wi‑Fi iPads).
  unavailable,
}

/// Outcome from [GeoService.resolvePosition].
class GeoLocationResult {
  const GeoLocationResult({
    required this.status,
    this.position,
    this.usedLastKnown = false,
  });

  final GeoLocationStatus status;
  final Position? position;
  final bool usedLastKnown;

  bool get isSuccess =>
      status == GeoLocationStatus.resolved && position != null;
}

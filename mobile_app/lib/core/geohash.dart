/// Geohash encode/decode (Bitchat-compatible precision ladder).
///
/// Used for **local channel scoping / discovery UX only**.
/// ResilNet messages remain 1:1 E2EE — geohash is never a plaintext broadcast room.
library;

/// Bitchat-style geographic channel precision (character length of geohash).
enum GeoPrecision {
  region(2),
  province(4),
  city(5),
  neighborhood(6),
  block(7);

  const GeoPrecision(this.length);
  final int length;
}

/// Pure Dart geohash (base32) without third-party deps.
class Geohash {
  Geohash._();

  static const _base32 = '0123456789bcdefghjkmnpqrstuvwxyz';
  static const _bits = [16, 8, 4, 2, 1];

  /// Encode WGS84 lat/lon to a geohash of [precision] characters.
  static String encode(
    double latitude,
    double longitude, {
    int precision = 7,
  }) {
    if (precision < 1 || precision > 12) {
      throw ArgumentError.value(precision, 'precision', 'must be 1–12');
    }
    var latMin = -90.0;
    var latMax = 90.0;
    var lonMin = -180.0;
    var lonMax = 180.0;
    final buf = StringBuffer();
    var bit = 0;
    var ch = 0;
    var even = true;

    while (buf.length < precision) {
      if (even) {
        final mid = (lonMin + lonMax) / 2;
        if (longitude >= mid) {
          ch |= _bits[bit];
          lonMin = mid;
        } else {
          lonMax = mid;
        }
      } else {
        final mid = (latMin + latMax) / 2;
        if (latitude >= mid) {
          ch |= _bits[bit];
          latMin = mid;
        } else {
          latMax = mid;
        }
      }
      even = !even;
      if (bit < 4) {
        bit++;
      } else {
        buf.write(_base32[ch]);
        bit = 0;
        ch = 0;
      }
    }
    return buf.toString();
  }

  /// Truncate / normalize an existing hash to [precision] (prefix match semantics).
  static String atPrecision(String hash, GeoPrecision precision) {
    final h = hash.trim().toLowerCase();
    if (h.isEmpty) return '';
    if (h.length <= precision.length) return h;
    return h.substring(0, precision.length);
  }

  /// True when [candidate] is in the same cell as [channel] (prefix).
  static bool matchesChannel(String candidate, String channel) {
    final c = channel.trim().toLowerCase();
    final x = candidate.trim().toLowerCase();
    if (c.isEmpty || x.isEmpty) return false;
    return x.startsWith(c) || c.startsWith(x);
  }

  /// IRC-style channel label, e.g. `#dr5rsj7`.
  static String channelLabel(String hash) {
    final h = hash.trim().toLowerCase();
    if (h.isEmpty) return '#—';
    return h.startsWith('#') ? h : '#$h';
  }
}

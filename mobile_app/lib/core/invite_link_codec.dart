import 'dart:convert';
import 'dart:io';

/// Shared invite payload packing for deep links / HTTPS go-links.
///
/// Wire `d=` values:
/// - **v1 (plain):** base64url(UTF-8 JSON)
/// - **v2 (gzip):** `z.` + base64url(gzip(UTF-8 JSON)) when smaller
class InviteLinkCodec {
  InviteLinkCodec._();

  static const httpsGoBase = 'https://ajarnthitasilo.github.io/ResilNet/go/';
  static const typeBoard = 'b';
  static const typePeer = 'p';

  /// Pack JSON string into a URL-safe `d` parameter (prefer gzip when shorter).
  static String packPayload(String json) {
    final raw = utf8.encode(json);
    final plain = base64Url.encode(raw).replaceAll('=', '');
    try {
      final gz = gzip.encode(raw);
      final packed = 'z.${base64Url.encode(gz).replaceAll('=', '')}';
      if (packed.length < plain.length) return packed;
    } catch (_) {
      // Fall through to plain.
    }
    return plain;
  }

  /// Unpack `d` from a link into a UTF-8 JSON string.
  static String? unpackPayload(String d) {
    final trimmed = d.trim();
    if (trimmed.isEmpty) return null;
    try {
      if (trimmed.startsWith('z.')) {
        final b64 = trimmed.substring(2);
        final pad = '=' * ((4 - b64.length % 4) % 4);
        final bytes = gzip.decode(base64Url.decode('$b64$pad'));
        return utf8.decode(bytes);
      }
      final pad = '=' * ((4 - trimmed.length % 4) % 4);
      return utf8.decode(base64Url.decode('$trimmed$pad'));
    } catch (_) {
      return null;
    }
  }

  static String httpsGoLink({required String type, required String d}) =>
      '$httpsGoBase?t=$type&d=$d';

  /// True when [uri] is our GitHub Pages invite landing (`…/go/` or `…/go/index.html`).
  static bool isHttpsGoUri(Uri uri) {
    if (uri.scheme != 'https' && uri.scheme != 'http') return false;
    final host = uri.host.toLowerCase();
    if (host != 'ajarnthitasilo.github.io') return false;
    final path = uri.path.toLowerCase();
    return path.contains('/resilnet/go');
  }

  static String? httpsGoType(Uri uri) =>
      uri.queryParameters['t']?.trim().toLowerCase();

  static String? httpsGoPayload(Uri uri) =>
      uri.queryParameters['d']?.trim();
}

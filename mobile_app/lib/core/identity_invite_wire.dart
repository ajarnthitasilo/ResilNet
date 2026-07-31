import 'dart:convert';

import '../models/peer.dart';
import '../services/crypto_service.dart';

/// Deep link: `resilnet://peer/invite?d=<base64url(identity-json)>`
const kPeerInviteScheme = 'resilnet';
const kPeerInviteHost = 'peer';
const kPeerInvitePath = '/invite';

/// Identity / peer invite — compact QR JSON with public key (no private key).
class IdentityInviteData {
  IdentityInviteData({
    required this.id,
    required this.publicKeyPem,
    this.name,
  });

  final String id;
  final String publicKeyPem;
  final String? name;

  Peer toPeer({required int lastSeen}) => Peer(
        id: id,
        publicKey: publicKeyPem,
        displayName: name,
        isVerifiedIssuer: false,
        isBlocked: false,
        lastSeen: lastSeen,
      );

  Map<String, Object?> toCompactJson() => {
        'v': 1,
        'id': id,
        'pk': CryptoService.compactPublicKey(publicKeyPem),
        if (name != null && name!.trim().isNotEmpty) 'name': name!.trim(),
      };

  String encodeCompact() => jsonEncode(toCompactJson());
}

/// Encode identity JSON for QR / paste (same shape as Identity screen QR).
String encodeIdentityInvite({
  required String id,
  required String publicKeyPem,
  String? name,
}) =>
    IdentityInviteData(
      id: id,
      publicKeyPem: publicKeyPem,
      name: name,
    ).encodeCompact();

String encodeIdentityInviteDeepLink({
  required String id,
  required String publicKeyPem,
  String? name,
}) {
  final compact = encodeIdentityInvite(
    id: id,
    publicKeyPem: publicKeyPem,
    name: name,
  );
  final b64 = base64Url.encode(utf8.encode(compact)).replaceAll('=', '');
  return '$kPeerInviteScheme://$kPeerInviteHost$kPeerInvitePath?d=$b64';
}

String encodeIdentityInviteShareText({
  required String id,
  required String publicKeyPem,
  String? name,
  required String Function(String label) preamble,
}) {
  final label = (name != null && name.trim().isNotEmpty) ? name.trim() : id;
  final link = encodeIdentityInviteDeepLink(
    id: id,
    publicKeyPem: publicKeyPem,
    name: name,
  );
  return '${preamble(label)}\n$link';
}

/// Parse identity from deep link, share text, or compact/legacy JSON.
IdentityInviteData? parseIdentityInvite(String raw) {
  final t = raw.trim();
  if (t.isEmpty) return null;

  final fromLink = parseIdentityInviteDeepLinkString(t);
  if (fromLink != null) return fromLink;

  final payload = _extractIdentityPayload(t);
  if (payload == null) return null;
  return _parseIdentityJson(payload);
}

IdentityInviteData? parseIdentityInviteDeepLink(Uri uri) {
  if (uri.scheme != kPeerInviteScheme) return null;
  if (uri.host != kPeerInviteHost) return null;
  final path = uri.path.isEmpty ? '' : uri.path;
  if (path != kPeerInvitePath && path != 'invite') return null;
  final d = uri.queryParameters['d']?.trim() ?? '';
  if (d.isEmpty) return null;
  try {
    final pad = '=' * ((4 - d.length % 4) % 4);
    final jsonStr = utf8.decode(base64Url.decode('$d$pad'));
    return _parseIdentityJson(jsonStr);
  } catch (_) {
    return null;
  }
}

IdentityInviteData? parseIdentityInviteDeepLinkString(String raw) {
  final t = raw.trim();
  if (!t.contains('$kPeerInviteScheme://')) return null;
  final match = RegExp(
    r'resilnet://peer/invite\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  final url = match?.group(0) ?? t;
  try {
    return parseIdentityInviteDeepLink(Uri.parse(url));
  } catch (_) {
    return null;
  }
}

/// True when [raw] looks like a standalone public-key hash (SHA-256 base64url).
bool looksLikePublicKeyHash(String raw) {
  final t = raw.trim();
  // SHA-256 digest → 43 base64url chars (no padding).
  return RegExp(r'^[A-Za-z0-9_-]{43}$').hasMatch(t);
}

String? _extractIdentityPayload(String text) {
  final linkMatch = RegExp(
    r'resilnet://peer/invite\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(text);
  if (linkMatch != null) return linkMatch.group(0);

  final start = text.indexOf('{');
  final end = text.lastIndexOf('}');
  if (start >= 0 && end > start) {
    return text.substring(start, end + 1);
  }
  return null;
}

IdentityInviteData? _parseIdentityJson(String raw) {
  try {
    // Deep-link URL mistakenly passed here.
    if (raw.startsWith('resilnet://')) {
      return parseIdentityInviteDeepLinkString(raw);
    }
    final obj = jsonDecode(raw);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);

    final type = (map['type'] as String?)?.trim();
    // Board invites must not be treated as identity.
    if (type == 'board_invite' ||
        map.containsKey('ownerId') ||
        map.containsKey('title')) {
      return null;
    }

    final id = (map['id'] as String?)?.trim() ?? '';
    final pkRaw = ((map['pk'] ?? map['pubKey']) as String?)?.trim() ?? '';
    if (id.isEmpty || pkRaw.isEmpty) return null;

    final pem = CryptoService.normalizePublicKey(pkRaw);
    if (!CryptoService.bindsIdentity(rid: id, publicKeyMaterial: pem)) {
      return null;
    }

    final name = (map['name'] as String?)?.trim();
    return IdentityInviteData(
      id: id,
      publicKeyPem: pem,
      name: name?.isEmpty == true ? null : name,
    );
  } catch (_) {
    return null;
  }
}

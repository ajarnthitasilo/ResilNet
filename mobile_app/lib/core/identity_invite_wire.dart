import 'dart:convert';

import '../models/peer.dart';
import '../services/crypto_service.dart';
import 'invite_link_codec.dart';

/// Deep link: `resilnet://peer/invite?d=<payload>` (alias `resilnet://p?d=`)
const kPeerInviteScheme = 'resilnet';
const kPeerInviteHost = 'peer';
const kPeerInvitePath = '/invite';
const kPeerInviteAliasHost = 'p';

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

String _identityInviteD({
  required String id,
  required String publicKeyPem,
  String? name,
}) =>
    InviteLinkCodec.packPayload(
      encodeIdentityInvite(id: id, publicKeyPem: publicKeyPem, name: name),
    );

String encodeIdentityInviteDeepLink({
  required String id,
  required String publicKeyPem,
  String? name,
}) {
  final d = _identityInviteD(
    id: id,
    publicKeyPem: publicKeyPem,
    name: name,
  );
  return '$kPeerInviteScheme://$kPeerInviteHost$kPeerInvitePath?d=$d';
}

String encodeIdentityInviteAliasDeepLink({
  required String id,
  required String publicKeyPem,
  String? name,
}) {
  final d = _identityInviteD(
    id: id,
    publicKeyPem: publicKeyPem,
    name: name,
  );
  return '$kPeerInviteScheme://$kPeerInviteAliasHost?d=$d';
}

String encodeIdentityInviteHttpsLink({
  required String id,
  required String publicKeyPem,
  String? name,
}) {
  final d = _identityInviteD(
    id: id,
    publicKeyPem: publicKeyPem,
    name: name,
  );
  return InviteLinkCodec.httpsGoLink(type: InviteLinkCodec.typePeer, d: d);
}

String encodeIdentityInviteShareText({
  required String id,
  required String publicKeyPem,
  String? name,
  required String Function(String label) preamble,
}) {
  final label = (name != null && name.trim().isNotEmpty) ? name.trim() : id;
  final link = encodeIdentityInviteHttpsLink(
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
  if (payload != t) {
    final nested = parseIdentityInvite(payload);
    if (nested != null) return nested;
  }
  return _parseIdentityJson(payload);
}

IdentityInviteData? parseIdentityInviteDeepLink(Uri uri) {
  if (InviteLinkCodec.isHttpsGoUri(uri)) {
    if (InviteLinkCodec.httpsGoType(uri) != InviteLinkCodec.typePeer) {
      return null;
    }
    return _parseFromD(InviteLinkCodec.httpsGoPayload(uri) ?? '');
  }

  if (uri.scheme != kPeerInviteScheme) return null;
  final host = uri.host.toLowerCase();
  if (host == kPeerInviteAliasHost) {
    return _parseFromD(uri.queryParameters['d']?.trim() ?? '');
  }
  if (host != kPeerInviteHost) return null;
  final path = uri.path.isEmpty ? '' : uri.path;
  if (path != kPeerInvitePath && path != 'invite' && path != '/') {
    return null;
  }
  return _parseFromD(uri.queryParameters['d']?.trim() ?? '');
}

IdentityInviteData? _parseFromD(String d) {
  if (d.isEmpty) return null;
  final jsonStr = InviteLinkCodec.unpackPayload(d);
  if (jsonStr == null) return null;
  return _parseIdentityJson(jsonStr);
}

IdentityInviteData? parseIdentityInviteDeepLinkString(String raw) {
  final t = raw.trim();

  final httpsMatch = RegExp(
    r'https?://ajarnthitasilo\.github\.io/ResilNet/go/?\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  if (httpsMatch != null) {
    try {
      final parsed =
          parseIdentityInviteDeepLink(Uri.parse(httpsMatch.group(0)!));
      if (parsed != null) return parsed;
    } catch (_) {}
  }

  if (!t.toLowerCase().contains('$kPeerInviteScheme://')) return null;
  final match = RegExp(
    r'resilnet://(?:peer/invite|p)\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  final url = match?.group(0);
  if (url == null) return null;
  try {
    return parseIdentityInviteDeepLink(Uri.parse(url));
  } catch (_) {
    return null;
  }
}

/// True when [raw] looks like a standalone public-key hash (SHA-256 base64url).
bool looksLikePublicKeyHash(String raw) {
  final t = raw.trim();
  return RegExp(r'^[A-Za-z0-9_-]{43}$').hasMatch(t);
}

String? _extractIdentityPayload(String text) {
  final httpsMatch = RegExp(
    r'https?://ajarnthitasilo\.github\.io/ResilNet/go/?\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(text);
  if (httpsMatch != null) return httpsMatch.group(0);

  final linkMatch = RegExp(
    r'resilnet://(?:peer/invite|p)\?[^\s]+',
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
    if (raw.startsWith('resilnet://') || raw.startsWith('http')) {
      return parseIdentityInviteDeepLinkString(raw);
    }
    final obj = jsonDecode(raw);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);

    final type = (map['type'] as String?)?.trim();
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

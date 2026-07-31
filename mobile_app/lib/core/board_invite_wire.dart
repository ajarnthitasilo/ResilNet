import 'dart:convert';

import '../models/announcement_board.dart';
import '../services/crypto_service.dart';
import 'invite_link_codec.dart';

/// Scheme สำหรับ deep link เชิญเข้ากระดานชุมชน
const kBoardInviteScheme = 'resilnet';
const kBoardInviteHost = 'board';
const kBoardInvitePath = '/invite';
/// Short alias: `resilnet://b?d=…`
const kBoardInviteAliasHost = 'b';

/// Compact board invite — ไม่มี private key, ใช้ `pk` แทน PEM เต็ม
class BoardInviteData {
  BoardInviteData({
    required this.id,
    required this.title,
    required this.ownerId,
    required this.publicKeyPem,
    required this.createdAt,
    this.allowLocked = true,
    this.allowOpen = false,
    this.epoch = 1,
  });

  final String id;
  final String title;
  final String ownerId;
  final String publicKeyPem;
  final int createdAt;
  final bool allowLocked;
  final bool allowOpen;
  final int epoch;

  AnnouncementBoard toBoard() => AnnouncementBoard(
        id: id,
        title: title,
        ownerId: ownerId,
        publicKeyPem: publicKeyPem,
        createdAt: createdAt,
        allowLocked: allowLocked,
        allowOpen: allowOpen,
        epoch: epoch,
      );

  static BoardInviteData fromBoard(AnnouncementBoard board) => BoardInviteData(
        id: board.id,
        title: board.title,
        ownerId: board.ownerId,
        publicKeyPem: board.publicKeyPem,
        createdAt: board.createdAt,
        allowLocked: board.allowLocked,
        allowOpen: board.allowOpen,
        epoch: board.epoch,
      );

  /// Canonical compact JSON map (wire v1)
  Map<String, Object?> toCompactJson() => {
        'v': 1,
        'type': 'board_invite',
        'id': id,
        'title': title,
        'ownerId': ownerId,
        'pk': CryptoService.compactPublicKey(publicKeyPem),
        'createdAt': createdAt,
        'allowLocked': allowLocked,
        'allowOpen': allowOpen,
        'epoch': epoch,
      };

  String encodeCompact() => jsonEncode(toCompactJson());
}

/// Encode compact invite JSON จากกระดาน
String encodeBoardInvite(AnnouncementBoard board) =>
    BoardInviteData.fromBoard(board).encodeCompact();

String _boardInviteD(AnnouncementBoard board) =>
    InviteLinkCodec.packPayload(encodeBoardInvite(board));

/// Deep link: `resilnet://board/invite?d=<payload>` (also alias `resilnet://b?d=`)
String encodeBoardInviteDeepLink(AnnouncementBoard board) {
  final d = _boardInviteD(board);
  return '$kBoardInviteScheme://$kBoardInviteHost$kBoardInvitePath?d=$d';
}

/// Short custom-scheme alias.
String encodeBoardInviteAliasDeepLink(AnnouncementBoard board) {
  final d = _boardInviteD(board);
  return '$kBoardInviteScheme://$kBoardInviteAliasHost?d=$d';
}

/// HTTPS go-link (preferred for share / QR).
String encodeBoardInviteHttpsLink(AnnouncementBoard board) {
  final d = _boardInviteD(board);
  return InviteLinkCodec.httpsGoLink(type: InviteLinkCodec.typeBoard, d: d);
}

/// ข้อความแชร์ที่อ่านง่าย (preamble + HTTPS short link)
String encodeBoardInviteShareText({
  required AnnouncementBoard board,
  required String Function(String title) preamble,
}) {
  final link = encodeBoardInviteHttpsLink(board);
  return '${preamble(board.title)}\n\n$link';
}

BoardInviteData? parseBoardInvite(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  final fromLink = parseBoardInviteDeepLinkString(trimmed);
  if (fromLink != null) return fromLink;

  final extracted = _extractInvitePayload(trimmed);
  if (extracted != null && extracted != trimmed) {
    final nested = parseBoardInvite(extracted);
    if (nested != null) return nested;
  }

  return _parseInviteJson(trimmed);
}

BoardInviteData? parseBoardInviteDeepLink(Uri uri) {
  // HTTPS go landing: …/go/?t=b&d=…
  if (InviteLinkCodec.isHttpsGoUri(uri)) {
    if (InviteLinkCodec.httpsGoType(uri) != InviteLinkCodec.typeBoard) {
      return null;
    }
    final d = InviteLinkCodec.httpsGoPayload(uri) ?? '';
    return _parseFromD(d);
  }

  if (uri.scheme != kBoardInviteScheme) return null;

  final host = uri.host.toLowerCase();
  if (host == kBoardInviteAliasHost) {
    return _parseFromD(uri.queryParameters['d']?.trim() ?? '');
  }
  if (host != kBoardInviteHost) return null;
  final path = uri.path.isEmpty ? '/' : uri.path;
  if (path != kBoardInvitePath && path != 'invite' && path != '/') {
    return null;
  }
  return _parseFromD(uri.queryParameters['d']?.trim() ?? '');
}

BoardInviteData? _parseFromD(String d) {
  if (d.isEmpty) return null;
  final jsonStr = InviteLinkCodec.unpackPayload(d);
  if (jsonStr == null) return null;
  return _parseInviteJson(jsonStr);
}

BoardInviteData? parseBoardInviteDeepLinkString(String raw) {
  final t = raw.trim();

  final httpsMatch = RegExp(
    r'https?://ajarnthitasilo\.github\.io/ResilNet/go/?\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  if (httpsMatch != null) {
    try {
      final parsed = parseBoardInviteDeepLink(Uri.parse(httpsMatch.group(0)!));
      if (parsed != null) return parsed;
    } catch (_) {}
  }

  if (!t.toLowerCase().contains('$kBoardInviteScheme://')) return null;
  final match = RegExp(
    r'resilnet://(?:board/invite|b)\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  final url = match?.group(0);
  if (url == null) return null;
  try {
    return parseBoardInviteDeepLink(Uri.parse(url));
  } catch (_) {
    return null;
  }
}

String? _extractInvitePayload(String text) {
  final httpsMatch = RegExp(
    r'https?://ajarnthitasilo\.github\.io/ResilNet/go/?\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(text);
  if (httpsMatch != null) return httpsMatch.group(0);

  final linkMatch = RegExp(
    r'resilnet://(?:board/invite|b)\?[^\s]+',
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

BoardInviteData? _parseInviteJson(String raw) {
  try {
    if (raw.startsWith('resilnet://') || raw.startsWith('http')) {
      return parseBoardInviteDeepLinkString(raw);
    }
    final obj = jsonDecode(raw);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);

    final id = (map['id'] as String?)?.trim() ?? '';
    if (id.isEmpty) return null;

    final pkRaw = ((map['pk'] ?? map['publicKeyPem']) as String?)?.trim() ?? '';
    if (pkRaw.isEmpty) return null;

    String pem;
    try {
      pem = CryptoService.normalizePublicKey(pkRaw);
    } catch (_) {
      return null;
    }

    final type = (map['type'] as String?)?.trim();
    final isBoard = type == 'board_invite' ||
        map.containsKey('ownerId') ||
        map.containsKey('title') ||
        map.containsKey('publicKeyPem');
    if (!isBoard) return null;
    if (type != null &&
        type.isNotEmpty &&
        type != 'board_invite' &&
        map['publicKeyPem'] == null) {
      return null;
    }

    return BoardInviteData(
      id: id,
      title: (map['title'] as String?)?.trim().isNotEmpty == true
          ? (map['title'] as String).trim()
          : 'Board',
      ownerId: (map['ownerId'] as String?)?.trim() ?? '',
      publicKeyPem: pem,
      createdAt: (map['createdAt'] as int?) ?? 0,
      allowLocked: map['allowLocked'] as bool? ?? true,
      allowOpen: map['allowOpen'] as bool? ?? false,
      epoch: (map['epoch'] as int?) ?? 1,
    );
  } catch (_) {
    return null;
  }
}

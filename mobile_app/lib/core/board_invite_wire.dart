import 'dart:convert';

import '../models/announcement_board.dart';
import '../services/crypto_service.dart';

/// Scheme สำหรับ deep link เชิญเข้ากระดานชุมชน
const kBoardInviteScheme = 'resilnet';
const kBoardInviteHost = 'board';
const kBoardInvitePath = '/invite';

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

/// Deep link: `resilnet://board/invite?d=<base64url(compact-json)>`
String encodeBoardInviteDeepLink(AnnouncementBoard board) {
  final compact = encodeBoardInvite(board);
  final b64 = base64Url.encode(utf8.encode(compact)).replaceAll('=', '');
  return '$kBoardInviteScheme://$kBoardInviteHost$kBoardInvitePath?d=$b64';
}

/// ข้อความแชร์ที่อ่านง่าย (preamble + deep link)
String encodeBoardInviteShareText({
  required AnnouncementBoard board,
  required String Function(String title) preamble,
}) {
  final link = encodeBoardInviteDeepLink(board);
  return '${preamble(board.title)}\n\n$link';
}

BoardInviteData? parseBoardInvite(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;

  // Deep link first
  final fromLink = parseBoardInviteDeepLinkString(trimmed);
  if (fromLink != null) return fromLink;

  // Extract deep link or JSON from a multi-line share message
  final extracted = _extractInvitePayload(trimmed);
  if (extracted != null && extracted != trimmed) {
    final nested = parseBoardInvite(extracted);
    if (nested != null) return nested;
  }

  return _parseInviteJson(trimmed);
}

BoardInviteData? parseBoardInviteDeepLink(Uri uri) {
  if (uri.scheme != kBoardInviteScheme) return null;
  if (uri.host != kBoardInviteHost) return null;
  final path = uri.path.isEmpty ? '/' : uri.path;
  if (path != kBoardInvitePath && path != 'invite') return null;
  final d = uri.queryParameters['d']?.trim() ?? '';
  if (d.isEmpty) return null;
  try {
    final padded = d.padRight(d.length + (4 - d.length % 4) % 4, '=');
    final jsonStr = utf8.decode(base64Url.decode(padded));
    return _parseInviteJson(jsonStr);
  } catch (_) {
    return null;
  }
}

BoardInviteData? parseBoardInviteDeepLinkString(String raw) {
  final t = raw.trim();
  if (!t.contains('$kBoardInviteScheme://')) return null;
  // Find the first resilnet:// URL in the string
  final match = RegExp(
    r'resilnet://board/invite\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(t);
  final url = match?.group(0) ?? t;
  try {
    return parseBoardInviteDeepLink(Uri.parse(url));
  } catch (_) {
    return null;
  }
}

String? _extractInvitePayload(String text) {
  final linkMatch = RegExp(
    r'resilnet://board/invite\?[^\s]+',
    caseSensitive: false,
  ).firstMatch(text);
  if (linkMatch != null) return linkMatch.group(0);

  // First JSON object in the text
  final start = text.indexOf('{');
  final end = text.lastIndexOf('}');
  if (start >= 0 && end > start) {
    return text.substring(start, end + 1);
  }
  return null;
}

BoardInviteData? _parseInviteJson(String raw) {
  try {
    final obj = jsonDecode(raw);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);

    final id = (map['id'] as String?)?.trim() ?? '';
    if (id.isEmpty) return null;

    // Compact `pk` or legacy `publicKeyPem`
    final pkRaw = ((map['pk'] ?? map['publicKeyPem']) as String?)?.trim() ?? '';
    if (pkRaw.isEmpty) return null;

    String pem;
    try {
      pem = CryptoService.normalizePublicKey(pkRaw);
    } catch (_) {
      return null;
    }

    final type = (map['type'] as String?)?.trim();
    // Accept typed board_invite and legacy full board JSON (no type / has publicKeyPem)
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

import 'dart:convert';

import '../models/local_notice.dart';

/// Parsed notice payload from P2P sealed wire or Nostr plaintext JSON.
class NoticeWireData {
  NoticeWireData({
    required this.noticeId,
    required this.scope,
    required this.channel,
    required this.text,
    required this.createdAt,
    this.expiresAt,
    this.urgent = false,
    this.senderId,
  });

  final String noticeId;
  final String scope;
  final String channel;
  final String text;
  final int createdAt;
  final int? expiresAt;
  final bool urgent;
  final String? senderId;

  LocalNotice toLocalNotice() {
    return LocalNotice(
      id: noticeId,
      scope: scope,
      channelLabel: channel,
      text: text,
      createdAt: createdAt,
      expiresAt: expiresAt,
      urgent: urgent,
      senderId: senderId,
      sharedExternally: true,
    );
  }
}

NoticeWireData? parseNoticeWire(String raw) {
  final trimmed = raw.trim();
  if (trimmed.isEmpty) return null;
  try {
    final obj = jsonDecode(trimmed);
    if (obj is! Map) return null;
    final map = Map<String, Object?>.from(obj);
    if ((map['type'] as String?) != 'notice' && !map.containsKey('noticeId')) {
      return null;
    }
    final noticeId = (map['noticeId'] as String?)?.trim();
    if (noticeId == null || noticeId.isEmpty) return null;
    final text = (map['text'] as String?)?.trim() ?? '';
    if (text.isEmpty) return null;
    return NoticeWireData(
      noticeId: noticeId,
      scope: (map['scope'] as String?) ?? 'geo',
      channel: (map['channel'] as String?) ?? '',
      text: text,
      createdAt: (map['createdAt'] as int?) ??
          DateTime.now().millisecondsSinceEpoch,
      expiresAt: map['expiresAt'] as int?,
      urgent: map['urgent'] == true,
      senderId: (map['senderId'] as String?)?.trim(),
    );
  } catch (_) {
    return null;
  }
}

String encodeNoticeWire({
  required LocalNotice notice,
  String? senderId,
}) {
  return jsonEncode({
    'v': 1,
    'type': 'notice',
    'noticeId': notice.id,
    'scope': notice.scope,
    'channel': notice.channelLabel,
    'text': notice.text,
    'urgent': notice.urgent,
    'createdAt': notice.createdAt,
    'expiresAt': notice.expiresAt,
    if (senderId != null && senderId.isNotEmpty) 'senderId': senderId,
  });
}

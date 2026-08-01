/// Local public notice pinned to #mesh or a geohash area.
class LocalNotice {
  LocalNotice({
    required this.id,
    required this.scope, // 'mesh' | 'geo'
    required this.channelLabel,
    required this.text,
    required this.createdAt,
    this.expiresAt,
    this.urgent = false,
    this.senderId,
    this.senderName,
  });

  final String id;
  final String scope;
  final String channelLabel;
  final String text;
  final int createdAt;
  final int? expiresAt;
  final bool urgent;

  /// Author peer id (pubkey hash). Set for both local posts and received notices.
  final String? senderId;

  /// Community display name carried on the wire (optional).
  final String? senderName;

  bool get isExpired {
    final e = expiresAt;
    if (e == null) return false;
    return DateTime.now().millisecondsSinceEpoch >= e;
  }

  Map<String, Object?> toJson() => {
        'id': id,
        'scope': scope,
        'channelLabel': channelLabel,
        'text': text,
        'createdAt': createdAt,
        'expiresAt': expiresAt,
        'urgent': urgent,
        if (senderId != null) 'senderId': senderId,
        if (senderName != null && senderName!.isNotEmpty)
          'senderName': senderName,
      };

  static LocalNotice fromJson(Map<String, Object?> json) {
    return LocalNotice(
      id: json['id'] as String,
      scope: json['scope'] as String? ?? 'mesh',
      channelLabel: json['channelLabel'] as String? ?? '',
      text: json['text'] as String? ?? '',
      createdAt: json['createdAt'] as int? ?? 0,
      expiresAt: json['expiresAt'] as int?,
      urgent: json['urgent'] as bool? ?? false,
      senderId: json['senderId'] as String?,
      senderName: (json['senderName'] as String?)?.trim(),
    );
  }

  LocalNotice withSender(String? sender, {String? name}) {
    return LocalNotice(
      id: id,
      scope: scope,
      channelLabel: channelLabel,
      text: text,
      createdAt: createdAt,
      expiresAt: expiresAt,
      urgent: urgent,
      senderId: sender ?? senderId,
      senderName: name ?? senderName,
    );
  }
}

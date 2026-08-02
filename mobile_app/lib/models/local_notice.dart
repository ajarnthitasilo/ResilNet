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
    this.sharedExternally = false,
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

  /// True once this notice left the device (BLE/UDP/Nostr/ESP32 catch-up) or
  /// was received from elsewhere. Used to decide delete UX warnings.
  final bool sharedExternally;

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
        'sharedExternally': sharedExternally,
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
      sharedExternally: json['sharedExternally'] as bool? ?? false,
    );
  }

  LocalNotice copyWith({
    String? id,
    String? scope,
    String? channelLabel,
    String? text,
    int? createdAt,
    int? expiresAt,
    bool? urgent,
    String? senderId,
    String? senderName,
    bool? sharedExternally,
  }) {
    return LocalNotice(
      id: id ?? this.id,
      scope: scope ?? this.scope,
      channelLabel: channelLabel ?? this.channelLabel,
      text: text ?? this.text,
      createdAt: createdAt ?? this.createdAt,
      expiresAt: expiresAt ?? this.expiresAt,
      urgent: urgent ?? this.urgent,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      sharedExternally: sharedExternally ?? this.sharedExternally,
    );
  }

  LocalNotice withSender(String? sender, {String? name}) {
    return copyWith(
      senderId: sender ?? senderId,
      senderName: name ?? senderName,
    );
  }

  LocalNotice markedShared() => copyWith(sharedExternally: true);
}

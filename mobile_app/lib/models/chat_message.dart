enum MessageStatus { pending, sent, relayed, delivered, read }

enum MessageType { direct, broadcast }

class ResilNetIds {
  static const broadcastReceiverId = 'BROADCAST';
}

class ChatMessage {
  ChatMessage({
    required this.id,
    this.cloudId,
    required this.senderId,
    required this.receiverId,
    required this.encryptedPayload,
    required this.encryptedKey,
    required this.ttl,
    required this.timestamp,
    required this.status,
    required this.type,
    this.senderName,
    this.content,
    this.signature,
    this.isSyncedWithCloud = false,
    this.isSyncedWithEsp32 = false,
    this.alertLat,
    this.alertLon,
    this.alertRadiusM,
    this.payloadKind = 'text',
    this.deliveredAt,
    this.readAt,
    this.senderPk,
  });

  final String id;
  final int? cloudId;
  final String senderId;
  final String? senderName;
  final String receiverId;
  final String? content;
  final String encryptedPayload;
  final String encryptedKey;
  final int ttl;
  final int timestamp;
  final MessageStatus status;
  final MessageType type;
  final String? signature;
  final bool isSyncedWithCloud;
  final bool isSyncedWithEsp32;
  final double? alertLat;
  final double? alertLon;
  final double? alertRadiusM;
  final String payloadKind;
  final DateTime? deliveredAt;
  final DateTime? readAt;

  /// Compact RSA public key of the sender (wire-only bootstrap; not stored in SQLite).
  /// Lets recipients verify + upsert the peer without prior QR / presence.
  final String? senderPk;

  bool get isBroadcast =>
      type == MessageType.broadcast ||
      receiverId == ResilNetIds.broadcastReceiverId;

  ChatMessage copyWith({
    String? id,
    int? cloudId,
    String? senderId,
    String? senderName,
    String? receiverId,
    String? content,
    String? encryptedPayload,
    String? encryptedKey,
    int? ttl,
    int? timestamp,
    MessageStatus? status,
    MessageType? type,
    String? signature,
    bool? isSyncedWithCloud,
    bool? isSyncedWithEsp32,
    double? alertLat,
    double? alertLon,
    double? alertRadiusM,
    String? payloadKind,
    DateTime? deliveredAt,
    DateTime? readAt,
    String? senderPk,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      cloudId: cloudId ?? this.cloudId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      receiverId: receiverId ?? this.receiverId,
      content: content ?? this.content,
      encryptedPayload: encryptedPayload ?? this.encryptedPayload,
      encryptedKey: encryptedKey ?? this.encryptedKey,
      ttl: ttl ?? this.ttl,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      type: type ?? this.type,
      signature: signature ?? this.signature,
      isSyncedWithCloud: isSyncedWithCloud ?? this.isSyncedWithCloud,
      isSyncedWithEsp32: isSyncedWithEsp32 ?? this.isSyncedWithEsp32,
      alertLat: alertLat ?? this.alertLat,
      alertLon: alertLon ?? this.alertLon,
      alertRadiusM: alertRadiusM ?? this.alertRadiusM,
      payloadKind: payloadKind ?? this.payloadKind,
      deliveredAt: deliveredAt ?? this.deliveredAt,
      readAt: readAt ?? this.readAt,
      senderPk: senderPk ?? this.senderPk,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'cloudId': cloudId,
      'senderId': senderId,
      'senderName': senderName,
      'receiverId': receiverId,
      'content': content,
      'encryptedPayload': encryptedPayload,
      'encryptedKey': encryptedKey,
      'signature': signature,
      'type': type.name,
      'isBroadcast': isBroadcast ? 1 : 0,
      'isSyncedWithCloud': isSyncedWithCloud ? 1 : 0,
      'isSyncedWithEsp32': isSyncedWithEsp32 ? 1 : 0,
      'alertLat': alertLat,
      'alertLon': alertLon,
      'alertRadiusM': alertRadiusM,
      'payloadKind': payloadKind,
      'ttl': ttl,
      'timestamp': timestamp,
      'status': status.name,
      'deliveredAt': deliveredAt?.millisecondsSinceEpoch,
      'readAt': readAt?.millisecondsSinceEpoch,
      if (senderPk != null && senderPk!.trim().isNotEmpty) 'senderPk': senderPk,
    };
  }

  static ChatMessage fromMap(Map<String, Object?> map) {
    final statusName = (map['status'] as String?) ?? MessageStatus.pending.name;
    final status = MessageStatus.values.firstWhere(
      (e) => e.name == statusName,
      orElse: () => MessageStatus.pending,
    );

    final typeName = (map['type'] as String?) ?? MessageType.direct.name;
    final type = MessageType.values.firstWhere(
      (e) => e.name == typeName,
      orElse: () => MessageType.direct,
    );

    final deliveredMs = map['deliveredAt'] as int?;
    final readMs = map['readAt'] as int?;

    return ChatMessage(
      id: map['id'] as String,
      cloudId: (map['cloudId'] as int?),
      senderId: map['senderId'] as String,
      senderName: map['senderName'] as String?,
      receiverId: map['receiverId'] as String,
      content: map['content'] as String?,
      encryptedPayload: map['encryptedPayload'] as String,
      encryptedKey: map['encryptedKey'] as String,
      signature: map['signature'] as String?,
      ttl: (map['ttl'] as int?) ?? 5,
      timestamp: (map['timestamp'] as int?) ?? 0,
      status: status,
      type: type,
      isSyncedWithCloud: (map['isSyncedWithCloud'] as int? ?? 0) == 1,
      isSyncedWithEsp32: (map['isSyncedWithEsp32'] as int? ?? 0) == 1,
      alertLat: (map['alertLat'] as num?)?.toDouble(),
      alertLon: (map['alertLon'] as num?)?.toDouble(),
      alertRadiusM: (map['alertRadiusM'] as num?)?.toDouble(),
      payloadKind: (map['payloadKind'] as String?) ?? 'text',
      deliveredAt:
          deliveredMs != null ? DateTime.fromMillisecondsSinceEpoch(deliveredMs) : null,
      readAt: readMs != null ? DateTime.fromMillisecondsSinceEpoch(readMs) : null,
      senderPk: map['senderPk'] as String?,
    );
  }
}

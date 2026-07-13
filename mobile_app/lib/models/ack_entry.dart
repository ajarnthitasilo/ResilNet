/// ประเภท ACK สำหรับ delivery / read receipt
enum AckType {
  delivered('DELIVERED'),
  read('READ');

  const AckType(this.wireName);
  final String wireName;

  static AckType? fromWire(String? value) {
    if (value == null) return null;
    for (final t in AckType.values) {
      if (t.wireName == value) return t;
    }
    return null;
  }
}

/// รายการ ACK เดี่ยวใน batch
class AckEntry {
  const AckEntry({
    required this.msgId,
    required this.type,
    required this.timestamp,
    required this.targetSenderId,
  });

  final String msgId;
  final AckType type;
  final int timestamp;

  /// Reverse-path unicast — ส่งกลับไปยังผู้ส่งต้นทางเดิม
  final String targetSenderId;

  String get dedupKey => '${msgId}:${type.wireName}:$timestamp';

  Map<String, Object?> toJson() => {
        'msgId': msgId,
        'type': type.wireName,
        'timestamp': timestamp,
      };

  factory AckEntry.fromJson(
    Map<String, Object?> json, {
    required String targetSenderId,
  }) {
    return AckEntry(
      msgId: json['msgId'] as String,
      type: AckType.fromWire(json['type'] as String?) ?? AckType.delivered,
      timestamp: (json['timestamp'] as num?)?.toInt() ??
          DateTime.now().millisecondsSinceEpoch,
      targetSenderId: targetSenderId,
    );
  }
}

/// Batched ACK packet (`PayloadType 0x05`)
class BatchAckPacket {
  const BatchAckPacket({
    required this.senderId,
    required this.receiverId,
    required this.batchAcks,
  });

  final String senderId;
  final String receiverId;
  final List<AckEntry> batchAcks;

  Map<String, Object?> toJson() => {
        'batchAcks': batchAcks.map((e) => e.toJson()).toList(),
        'senderId': senderId,
        'receiverId': receiverId,
      };

  factory BatchAckPacket.fromJson(Map<String, Object?> json) {
    final senderId = json['senderId'] as String? ?? '';
    final receiverId = json['receiverId'] as String? ?? '';
    final raw = json['batchAcks'] as List<dynamic>? ?? const [];
    final acks = raw
        .map((e) => AckEntry.fromJson(
              Map<String, Object?>.from(e as Map),
              targetSenderId: senderId,
            ))
        .toList();
    return BatchAckPacket(
      senderId: senderId,
      receiverId: receiverId,
      batchAcks: acks,
    );
  }
}

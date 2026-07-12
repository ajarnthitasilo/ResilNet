class MessageModel {
  const MessageModel({
    required this.id,
    required this.createdAt,
    required this.payload,
    required this.senderId,
  });

  /// Supabase: id(int8) -> Dart ใช้ int
  final int id;
  final DateTime createdAt;
  final String payload;
  final String senderId;

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: (map['id'] as num).toInt(),
      createdAt: DateTime.parse(map['created_at'] as String),
      payload: map['payload'] as String,
      senderId: map['sender_id'] as String,
    );
  }
}

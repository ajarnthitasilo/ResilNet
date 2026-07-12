import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/chat_message.dart';
import '../src/rust/api/dto.dart';

/// แปลง `ChatMessage` ↔ `MessagePacketDto` สำหรับ FFI
class ResilNetPacketCodec {
  /// แปลงข้อความแชตเป็น DTO ส่งเข้า Rust router
  static MessagePacketDto toDto(ChatMessage msg) {
    return MessagePacketDto(
      id: msg.id,
      sender: msg.senderId,
      receiver: msg.receiverId,
      payload: Uint8List.fromList(utf8.encode(jsonEncode(msg.toMap()))),
      timestamp: BigInt.from(msg.timestamp),
      ttl: msg.ttl,
    );
  }

  /// ถอด DTO จาก Rust stream กลับเป็น `ChatMessage`
  static ChatMessage fromDto(MessagePacketDto dto) {
    final map = jsonDecode(utf8.decode(dto.payload)) as Map<String, Object?>;
    return ChatMessage.fromMap(map);
  }
}

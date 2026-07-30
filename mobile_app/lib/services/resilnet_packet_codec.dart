import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../core/payload_kinds.dart';
import '../core/resilnet_ack_codec.dart';
import '../core/resilnet_payload_type.dart';
import '../models/ack_entry.dart';
import '../models/chat_message.dart';
import '../src/rust/api/dto.dart';

/// แปลง `ChatMessage` ↔ `MessagePacketDto` สำหรับ FFI (+ piggyback ACK envelope)
class ResilNetPacketCodec {
  /// แปลดข้อความแชตเป็น DTO ส่งเข้า Rust router
  static MessagePacketDto toDto(
    ChatMessage msg, {
    ResilNetPayloadType? payloadType,
    List<AckEntry> piggybackAcks = const [],
  }) {
    final type = payloadType ??
        ResilNetPayloadType.fromMessageKind(msg.payloadKind);
    // Strip local-only plaintext preview before anything hits the wire.
    // Presence packets carry the geohash cell in `content` intentionally.
    // Public bulletins carry signed plaintext JSON in `content` by design.
    final wireMap = Map<String, Object?>.from(msg.toMap());
    if (msg.payloadKind != PayloadKinds.presence &&
        msg.payloadKind != PayloadKinds.bulletin) {
      wireMap['content'] = null;
    }
    final payload = piggybackAcks.isEmpty
        ? Uint8List.fromList(utf8.encode(jsonEncode(wireMap)))
        : ResilNetAckCodec.wrapChatEnvelope(
            messageMap: wireMap,
            piggybackAcks: piggybackAcks,
          );
    return MessagePacketDto(
      id: msg.id,
      sender: msg.senderId,
      receiver: msg.receiverId,
      payload: payload,
      timestamp: BigInt.from(msg.timestamp),
      ttl: msg.ttl,
      payloadTag: type.toDto(),
    );
  }

  /// สร้าง DTO สำหรับ dedicated batched ACK packet
  static MessagePacketDto ackDto({
    required String packetId,
    required String senderId,
    required String receiverId,
    required BatchAckPacket batch,
    int ttl = 3,
  }) {
    return MessagePacketDto(
      id: packetId,
      sender: senderId,
      receiver: receiverId,
      payload: ResilNetAckCodec.encodeBatchPacket(batch),
      timestamp: BigInt.from(DateTime.now().millisecondsSinceEpoch),
      ttl: ttl,
      payloadTag: PayloadTagDto.ack,
    );
  }

  /// ถอด DTO จาก Rust stream กลับเป็น `ChatMessage` (+ piggyback ถ้ามี)
  static ({ChatMessage? message, List<AckEntry> piggybackAcks}) fromDtoWithMeta(
    MessagePacketDto dto,
  ) {
    if (dto.payloadTag == PayloadTagDto.ack) {
      return (message: null, piggybackAcks: const []);
    }

    final unwrapped = ResilNetAckCodec.unwrapChatEnvelope(dto.payload);
    if (unwrapped == null) {
      return (message: fromDto(dto), piggybackAcks: const []);
    }

    final msg = ChatMessage.fromMap(unwrapped.body);
    final kind = ResilNetPayloadType.fromDto(dto.payloadTag).messageKind;
    final withKind =
        msg.payloadKind == kind ? msg : msg.copyWith(payloadKind: kind);

    final piggyback = unwrapped.piggybackAcks
        .map(
          (e) => AckEntry(
            msgId: e.msgId,
            type: e.type,
            timestamp: e.timestamp,
            targetSenderId: dto.sender,
          ),
        )
        .toList();

    return (message: withKind, piggybackAcks: piggyback);
  }

  /// ถอด DTO จาก Rust stream กลับเป็น `ChatMessage`
  static ChatMessage fromDto(MessagePacketDto dto) {
    final parsed = fromDtoWithMeta(dto);
    if (parsed.message != null) return parsed.message!;
    final map = jsonDecode(utf8.decode(dto.payload)) as Map<String, Object?>;
    final msg = ChatMessage.fromMap(map);
    final kind = ResilNetPayloadType.fromDto(dto.payloadTag).messageKind;
    if (msg.payloadKind == kind) return msg;
    return msg.copyWith(payloadKind: kind);
  }
}

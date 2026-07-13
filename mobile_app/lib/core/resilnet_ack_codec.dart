import 'dart:convert';
import 'dart:typed_data';

import '../models/ack_entry.dart';
import 'resilnet_payload_type.dart';

/// Encode/decode Batched ACK (`PayloadType 0x05`) และ piggyback metadata
class ResilNetAckCodec {
  ResilNetAckCodec._();

  static const envelopeVersion = 2;

  /// สร้าง payload bytes สำหรับ dedicated ACK packet
  static Uint8List encodeBatchPacket(BatchAckPacket packet) {
    final inner = Uint8List.fromList(utf8.encode(jsonEncode(packet.toJson())));
    return ResilNetPayloadType.wrapWithTag(inner, ResilNetPayloadType.ack);
  }

  /// ถอด batch ACK จาก payload (ตรวจ wire tag 0x05)
  static BatchAckPacket? decodeBatchPacket(Uint8List payload) {
    final unwrapped = ResilNetPayloadType.unwrapPayloadTag(payload);
    if (unwrapped.type != ResilNetPayloadType.ack) return null;
    try {
      final map = jsonDecode(utf8.decode(unwrapped.inner)) as Map<String, Object?>;
      return BatchAckPacket.fromJson(map);
    } catch (_) {
      return null;
    }
  }

  /// ห่อ chat envelope พร้อม piggyback ACKs (metadata นอก E2EE body)
  static Uint8List wrapChatEnvelope({
    required Map<String, Object?> messageMap,
    List<AckEntry> piggybackAcks = const [],
  }) {
    final envelope = <String, Object?>{
      'v': envelopeVersion,
      'kind': 'chat',
      'body': messageMap,
      if (piggybackAcks.isNotEmpty)
        'piggybackAcks': piggybackAcks.map((e) => e.toJson()).toList(),
    };
    return Uint8List.fromList(utf8.encode(jsonEncode(envelope)));
  }

  /// ถอด chat envelope — คืน body + piggyback ACKs (ถ้ามี)
  static ({
    Map<String, Object?> body,
    List<AckEntry> piggybackAcks,
  })? unwrapChatEnvelope(Uint8List payload) {
    try {
      final map = jsonDecode(utf8.decode(payload)) as Map<String, Object?>;
      if (map['v'] != envelopeVersion) {
        return (body: map, piggybackAcks: const []);
      }
      final body = Map<String, Object?>.from(
        (map['body'] as Map?)?.cast<String, Object?>() ?? map,
      );
      final senderId = body['senderId'] as String? ?? '';
      final raw = map['piggybackAcks'] as List<dynamic>? ?? const [];
      final piggyback = raw
          .map(
            (e) => AckEntry.fromJson(
              Map<String, Object?>.from(e as Map),
              targetSenderId: senderId,
            ),
          )
          .toList();
      return (body: body, piggybackAcks: piggyback);
    } catch (_) {
      return null;
    }
  }

  /// ดึง piggyback ACKs จาก envelope โดยตั้ง targetSenderId จากผู้ส่ง envelope
  static List<AckEntry> piggybackFromEnvelope(
    Map<String, Object?> envelope,
    String ackSenderId,
  ) {
    final raw = envelope['piggybackAcks'] as List<dynamic>? ?? const [];
    return raw
        .map(
          (e) => AckEntry.fromJson(
            Map<String, Object?>.from(e as Map),
            targetSenderId: ackSenderId,
          ),
        )
        .toList();
  }
}

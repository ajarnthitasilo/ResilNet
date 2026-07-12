import 'dart:typed_data';

import 'resilnet_protocol.dart';

/// ช่องทางที่รองรับ NACK ARQ (LoRa = passive เท่านั้น)
enum ChunkArqTransport {
  wifiUdp,
  ble,
  /// Half-duplex guard: ไม่ยิง NACK บน LoRa
  lora,
}

/// Control frame types (byte 2 หลัง magic RN)
class ResilNetControlFrameType {
  ResilNetControlFrameType._();

  static const nack = 0x01;
}

/// NACK frame ที่ถอดแล้ว
class NackFrame {
  const NackFrame({
    required this.msgId,
    required this.missingIndices,
  });

  final int msgId;
  final List<int> missingIndices;
}

/// NACK Control Frame ≤ 16 bytes:
/// `RN`(2) + frameType(1) + msg_id(2 LE) + missing_count(1) + missing_indices(N)
class ResilNetNackCodec {
  ResilNetNackCodec._();

  static const maxFrameLen = 16;
  static const headerLen = 6;

  static bool isNackFrame(Uint8List data) {
    if (data.length < headerLen || data.length > maxFrameLen) return false;
    if (data[0] != ResilNetProtocol.radioMagicHi ||
        data[1] != ResilNetProtocol.radioMagicLo) {
      return false;
    }
    return data[2] == ResilNetControlFrameType.nack;
  }

  static NackFrame? tryDecode(Uint8List data) {
    if (!isNackFrame(data)) return null;
    final msgId = data[3] | (data[4] << 8);
    final count = data[5];
    if (data.length != headerLen + count) return null;
    if (count == 0) return null;
    final indices = <int>[];
    for (var i = 0; i < count; i++) {
      indices.add(data[headerLen + i]);
    }
    return NackFrame(msgId: msgId, missingIndices: indices);
  }

  static Uint8List encode({
    required int msgId,
    required List<int> missingIndices,
  }) {
    if (missingIndices.isEmpty) {
      throw ArgumentError('missingIndices must not be empty');
    }
    final unique = missingIndices.toSet().toList()..sort();
    if (unique.length > maxFrameLen - headerLen) {
      throw ArgumentError('too many missing indices for NACK frame');
    }
    final frame = Uint8List(headerLen + unique.length);
    frame[0] = ResilNetProtocol.radioMagicHi;
    frame[1] = ResilNetProtocol.radioMagicLo;
    frame[2] = ResilNetControlFrameType.nack;
    frame[3] = msgId & 0xFF;
    frame[4] = (msgId >> 8) & 0xFF;
    frame[5] = unique.length;
    for (var i = 0; i < unique.length; i++) {
      frame[headerLen + i] = unique[i];
    }
    return frame;
  }
}

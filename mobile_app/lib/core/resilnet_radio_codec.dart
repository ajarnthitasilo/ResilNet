import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../src/rust/api/dto.dart';
import 'resilnet_protocol.dart';

/// แพ็กเก็ตวิทยุไบนารี — สอดคล้องกับ `ResilNetRadioPacket` บน ESP32
class ResilNetRadioPacket {
  ResilNetRadioPacket({
    required Uint8List packetId,
    required this.ttl,
    required Uint8List payload,
  })  : packetId = _assertPacketId(packetId),
        payload = _assertPayload(payload);

  final Uint8List packetId;
  final int ttl;
  final Uint8List payload;

  static Uint8List _assertPacketId(Uint8List id) {
    if (id.length != 16) {
      throw ArgumentError('packet_id must be 16 bytes, got ${id.length}');
    }
    return id;
  }

  static Uint8List _assertPayload(Uint8List data) {
    if (data.length > ResilNetProtocol.radioMaxPayloadLen) {
      throw ArgumentError(
        'payload exceeds ${ResilNetProtocol.radioMaxPayloadLen} bytes',
      );
    }
    return data;
  }
}

/// CRC16-CCITT + framed protocol (RN magic + body + CRC16 LE)
class ResilNetRadioCodec {
  ResilNetRadioCodec._();

  static const _headerLen = 2 + 16 + 1 + 2;
  static const _trailerLen = 2;

  static int crc16Ccitt(Uint8List data) {
    var crc = 0xFFFF;
    for (final byte in data) {
      crc ^= byte << 8;
      for (var bit = 0; bit < 8; bit++) {
        if ((crc & 0x8000) != 0) {
          crc = ((crc << 1) ^ 0x1021) & 0xFFFF;
        } else {
          crc = (crc << 1) & 0xFFFF;
        }
      }
    }
    return crc;
  }

  static String packetIdToUuid(Uint8List bytes) {
    if (bytes.length != 16) {
      throw ArgumentError('packet_id must be 16 bytes');
    }
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
  }

  static Uint8List uuidToPacketId(String uuid) {
    final hex = uuid.replaceAll('-', '');
    if (hex.length != 32) {
      throw ArgumentError('invalid UUID: $uuid');
    }
    final out = Uint8List(16);
    for (var i = 0; i < 16; i++) {
      out[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
    }
    return out;
  }

  static Uint8List encodeFrame(ResilNetRadioPacket packet) {
    final bodyLen = 16 + 1 + 2 + packet.payload.length;
    final frame = Uint8List(_headerLen + packet.payload.length + _trailerLen);
    var idx = 0;
    frame[idx++] = ResilNetProtocol.radioMagicHi;
    frame[idx++] = ResilNetProtocol.radioMagicLo;
    frame.setRange(idx, idx + 16, packet.packetId);
    idx += 16;
    frame[idx++] = packet.ttl & 0xFF;
    frame[idx++] = packet.payload.length & 0xFF;
    frame[idx++] = (packet.payload.length >> 8) & 0xFF;
    frame.setRange(idx, idx + packet.payload.length, packet.payload);
    idx += packet.payload.length;
    final crc = crc16Ccitt(Uint8List.sublistView(frame, 2, 2 + bodyLen));
    frame[idx++] = crc & 0xFF;
    frame[idx] = (crc >> 8) & 0xFF;
    return frame;
  }

  static ResilNetRadioPacket? decodeFrame(Uint8List data) {
    if (data.length < _headerLen + _trailerLen) return null;
    if (data[0] != ResilNetProtocol.radioMagicHi ||
        data[1] != ResilNetProtocol.radioMagicLo) {
      return null;
    }

    const idxStart = 2;
    final packetId = Uint8List.fromList(data.sublist(idxStart, idxStart + 16));
    final ttl = data[idxStart + 16];
    final payloadLen = data[idxStart + 17] | (data[idxStart + 18] << 8);
    if (payloadLen > ResilNetProtocol.radioMaxPayloadLen) return null;

    final bodyEnd = idxStart + 16 + 1 + 2 + payloadLen;
    if (data.length < bodyEnd + 2) return null;

    final recvCrc = data[bodyEnd] | (data[bodyEnd + 1] << 8);
    final calcCrc = crc16Ccitt(
      Uint8List.sublistView(data, 2, bodyEnd),
    );
    if (recvCrc != calcCrc) return null;

    final payload = Uint8List.fromList(
      data.sublist(idxStart + 19, bodyEnd),
    );
    return ResilNetRadioPacket(packetId: packetId, ttl: ttl, payload: payload);
  }

  /// รูปแบบ raw BLE gateway: packet_id(16) + ttl(1) + len(2 LE) + payload
  static ResilNetRadioPacket? decodeRawBle(Uint8List data) {
    if (data.length < 19) return null;
    final packetId = Uint8List.fromList(data.sublist(0, 16));
    final ttl = data[16];
    final payloadLen = data[17] | (data[18] << 8);
    if (payloadLen > ResilNetProtocol.radioMaxPayloadLen) return null;
    if (data.length < 19 + payloadLen) return null;
    final payload = Uint8List.fromList(data.sublist(19, 19 + payloadLen));
    return ResilNetRadioPacket(packetId: packetId, ttl: ttl, payload: payload);
  }

  static ResilNetRadioPacket? decodeDatagram(Uint8List data) {
    return decodeFrame(data) ?? decodeRawBle(data);
  }

  /// สร้าง radio packet จาก payload ที่พร้อมส่งแล้ว (รวม chunked frame)
  static ResilNetRadioPacket fromRadioPayload({
    required String packetId,
    required int ttl,
    required Uint8List payload,
  }) {
    return ResilNetRadioPacket(
      packetId: uuidToPacketId(packetId),
      ttl: ttl,
      payload: payload,
    );
  }

  static ResilNetRadioPacket fromMessagePacketDto(MessagePacketDto dto) {
    if (dto.payload.length > ResilNetProtocol.radioMaxPayloadLen) {
      throw ArgumentError(
        'MessagePacketDto.payload too large for radio (${dto.payload.length} > '
        '${ResilNetProtocol.radioMaxPayloadLen}). Use chunked send instead.',
      );
    }
    return fromRadioPayload(
      packetId: dto.id,
      ttl: dto.ttl,
      payload: Uint8List.fromList(dto.payload),
    );
  }

  static MessagePacketDto toMessagePacketDto(ResilNetRadioPacket packet) {
    final id = packetIdToUuid(packet.packetId);
    try {
      final map =
          jsonDecode(utf8.decode(packet.payload)) as Map<String, Object?>;
      return MessagePacketDto(
        id: id,
        sender: map['senderId'] as String,
        receiver: map['receiverId'] as String,
        payload: packet.payload,
        timestamp: BigInt.from((map['timestamp'] as num?)?.toInt() ?? 0),
        ttl: packet.ttl,
      );
    } catch (e, st) {
      debugPrint('[ResilNetRadioCodec] payload JSON parse failed: $e\n$st');
      rethrow;
    }
  }
}

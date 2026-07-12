import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

/// CRC32 (IEEE) — ตรงกับ OtaManager บน ESP32
class OtaChecksum {
  OtaChecksum._();

  static const int _poly = 0xEDB88320;

  static int crc32(Uint8List data) {
    var crc = 0xFFFFFFFF;
    for (final b in data) {
      crc ^= b;
      for (var i = 0; i < 8; i++) {
        final mask = -(crc & 1);
        crc = (crc >> 1) ^ (_poly & mask);
      }
    }
    return (~crc) & 0xFFFFFFFF;
  }

  static String crc32Hex(Uint8List data) {
    return crc32(data).toRadixString(16).padLeft(8, '0');
  }

  static String md5Hex(Uint8List data) {
    return crypto.md5.convert(data).toString();
  }
}

class OtaControlMessage {
  OtaControlMessage({
    required this.op,
    this.stage,
    this.seq,
    this.received,
    this.total,
    this.msg,
  });

  factory OtaControlMessage.fromJson(Map<String, dynamic> json) {
    return OtaControlMessage(
      op: json['op'] as String? ?? '',
      stage: json['stage'] as String?,
      seq: (json['seq'] as num?)?.toInt(),
      received: (json['received'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      msg: json['msg'] as String?,
    );
  }

  final String op;
  final String? stage;
  final int? seq;
  final int? received;
  final int? total;
  final String? msg;

  bool get isAck => op == 'ack';
  bool get isError => op == 'error';
  bool get isProgress => op == 'progress';
}

String otaBeginPayload({
  required int size,
  required String crc32Hex,
  required String md5Hex,
  required String kind,
}) {
  return jsonEncode({
    'op': 'begin',
    'size': size,
    'crc32': crc32Hex,
    'md5': md5Hex,
    'kind': kind,
  });
}

String otaSimpleOp(String op) => jsonEncode({'op': op});

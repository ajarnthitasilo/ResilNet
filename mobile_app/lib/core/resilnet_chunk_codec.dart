import 'dart:convert';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

import '../models/chat_message.dart';
import 'payload_kinds.dart';
import 'resilnet_payload_type.dart';
import 'resilnet_radio_codec.dart';

/// สถานะความคืบหน้าการส่ง/รับ Chunk
class ChunkTransferState {
  const ChunkTransferState({
    required this.sending,
    required this.current,
    required this.total,
  });

  final bool sending;
  final int current;
  final int total;

  String get label =>
      sending ? 'กำลังส่ง $current/$total...' : 'กำลังรับ $current/$total...';

  bool get isActive => total > 0 && current < total;
}

/// ผลลัพธ์จากการสะสม Chunk
class ChunkIngestResult {
  const ChunkIngestResult({
    this.complete,
    this.received,
    this.total,
    this.msgId,
  });

  /// Ciphertext ที่ประกอบครบแล้ว (null ถ้ายังไม่ครบ)
  final Uint8List? complete;

  /// จำนวน chunk ที่ได้รับแล้ว / ทั้งหมด (สำหรับแสดง progress)
  final int? received;
  final int? total;

  /// CRC16 msg_id ของข้อความที่กำลังประกอบ (สำหรับ NACK ARQ)
  final int? msgId;
}

/// Encrypt-then-Chunk / Reassemble-then-Decrypt protocol สำหรับ Radio MTU 230B
///
/// Header 8 bytes (LE):
///   msg_id(2) | total_chunks(1) | chunk_index(1) | total_len(2) | checksum(2)
class ResilNetChunkCodec {
  ResilNetChunkCodec._();

  static const chunkHeaderLen = 8;
  static const chunkThreshold = 190;
  static const maxChunkDataLen = 200;

  /// ระยะเวลารอประกอบ chunk ก่อนทิ้ง buffer (สภาวะ mesh ไม่เสถียร)
  static const defaultAssemblyTtl = Duration(seconds: 45);

  /// หน่วงระหว่างยิง chunk ลด burst / buffer overflow บน ESP32/BLE
  static const defaultInterChunkDelay = Duration(milliseconds: 30);

  /// CRC16-CCITT — ใช้ร่วมกับ [ResilNetRadioCodec.crc16Ccitt]
  static int crc16(Uint8List data) => ResilNetRadioCodec.crc16Ccitt(data);

  /// สร้าง UUID ที่ถูกต้องสำหรับ packet_id ของแต่ละ chunk (หลีกเลี่ยง dedup ชนกัน)
  static String chunkPacketId(String messageId, int index) {
    final digest = crypto.sha256.convert(
      utf8.encode('$messageId#chunk$index'),
    );
    final bytes = digest.bytes.sublist(0, 16);
    final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
    return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-'
        '${hex.substring(12, 16)}-${hex.substring(16, 20)}-'
        '${hex.substring(20, 32)}';
  }

  /// สร้าง ciphertext bundle จากข้อความที่เข้ารหัสแล้ว (Encrypt-then-Chunk ขั้นที่ 1).
  ///
  /// Mirrors [ResilNetPacketCodec.toDto]: strip local plaintext previews, but
  /// **keep** `content` for presence / public `mesh_bulletin`. Always preserve
  /// the application [ChatMessage.payloadKind] (never replace with the wire
  /// tag name `"text"` — that broke bulletin delivery over BLE/UDP).
  static Uint8List ciphertextFromMessage(
    ChatMessage msg, {
    ResilNetPayloadType payloadType = ResilNetPayloadType.text,
  }) {
    final wireMap = Map<String, Object?>.from(msg.toMap());
    if (msg.payloadKind != PayloadKinds.presence &&
        msg.payloadKind != PayloadKinds.bulletin) {
      wireMap['content'] = null;
    }
    wireMap['payloadKind'] = msg.payloadKind;
    final json = jsonEncode(wireMap);
    return wrapWithPayloadTag(
      Uint8List.fromList(utf8.encode(json)),
      payloadType,
    );
  }

  /// ใส่ wire tag นำหน้า ciphertext (0x01–0x04)
  static Uint8List wrapWithPayloadTag(
    Uint8List inner,
    ResilNetPayloadType type,
  ) {
    return Uint8List.fromList([type.wireTag, ...inner]);
  }

  /// ถอด wire tag จาก ciphertext ที่ประกอบครบแล้ว
  static ({ResilNetPayloadType type, Uint8List inner}) unwrapPayloadTag(
    Uint8List bundled,
  ) {
    if (bundled.isEmpty) {
      return (type: ResilNetPayloadType.text, inner: bundled);
    }
    final tag = bundled[0];
    final known = ResilNetPayloadType.values
        .any((t) => t.wireTag == tag);
    if (!known) {
      return (type: ResilNetPayloadType.text, inner: bundled);
    }
    return (
      type: ResilNetPayloadType.fromWireTag(tag),
      inner: Uint8List.sublistView(bundled, 1),
    );
  }

  /// ถอด ciphertext bundle กลับเป็น [ChatMessage] (หลัง Reassemble)
  static ChatMessage? chatMessageFromCiphertext(Uint8List ciphertext) {
    try {
      final unwrapped = unwrapPayloadTag(ciphertext);
      final map =
          jsonDecode(utf8.decode(unwrapped.inner)) as Map<String, Object?>;
      return ChatMessage.fromMap(map);
    } catch (_) {
      return null;
    }
  }

  /// ดึง payload type จาก ciphertext bundle
  static ResilNetPayloadType payloadTypeFromCiphertext(Uint8List ciphertext) {
    return unwrapPayloadTag(ciphertext).type;
  }

  /// แบ่ง ciphertext พร้อม tag เป็น radio frames
  static List<Uint8List> encodeChunksForMessage(
    ChatMessage msg, {
    ResilNetPayloadType? payloadType,
  }) {
    final type = payloadType ??
        ResilNetPayloadType.fromMessageKind(msg.payloadKind);
    return encodeChunks(ciphertextFromMessage(msg, payloadType: type));
  }

  /// ดึง msg_id จาก chunk list (ใช้ลง OutboundChunkCache)
  static int? msgIdFromChunks(List<Uint8List> chunks) {
    if (chunks.isEmpty) return null;
    if (isChunked(chunks.first)) {
      return parseChunkFrame(chunks.first).msgId;
    }
    return crc16(chunks.first);
  }

  /// แบ่ง ciphertext เป็น radio payload frames (Encrypt-then-Chunk ขั้นที่ 2–3)
  ///
  /// ถ้า ciphertext พอดีในหนึ่ง ATT write ([maxAttPayload] = MTU−3) คืน list
  /// เดียวโดยไม่มี header — ไม่เช่นนั้นแบ่งเป็น framed chunks
  static List<Uint8List> encodeChunks(
    Uint8List ciphertext, {
    int maxAttPayload = maxChunkDataLen + chunkHeaderLen,
  }) {
    final att = maxAttPayload.clamp(20, 512);
    if (ciphertext.length <= att) {
      return [Uint8List.fromList(ciphertext)];
    }

    final maxData = (att - chunkHeaderLen).clamp(8, maxChunkDataLen);
    final msgId = crc16(ciphertext);
    final checksum = crc16(ciphertext);
    final totalLen = ciphertext.length;
    final totalChunks = (totalLen + maxData - 1) ~/ maxData;
    if (totalChunks > 255) {
      throw ArgumentError('ciphertext too large: $totalChunks chunks');
    }

    final frames = <Uint8List>[];
    for (var i = 0; i < totalChunks; i++) {
      final start = i * maxData;
      final end = start + maxData > totalLen ? totalLen : start + maxData;
      final data = Uint8List.sublistView(ciphertext, start, end);
      frames.add(
        _buildChunkFrame(
          msgId: msgId,
          totalChunks: totalChunks,
          chunkIndex: i,
          totalLen: totalLen,
          checksum: checksum,
          data: data,
        ),
      );
    }
    return frames;
  }

  /// ตรวจว่า payload เป็น chunked frame (มี header 8 bytes)
  static bool isChunked(Uint8List payload) {
    if (payload.length < chunkHeaderLen + 1) return false;
    final totalChunks = payload[2];
    final chunkIndex = payload[3];
    final totalLen = payload[4] | (payload[5] << 8);
    if (totalChunks < 2 || totalChunks > 255) return false;
    if (chunkIndex >= totalChunks) return false;
    if (totalLen < 2) return false;
    final dataLen = payload.length - chunkHeaderLen;
    if (dataLen < 1 || dataLen > maxChunkDataLen) return false;
    // Allow framed payloads under the legacy 190B threshold — required when
    // ATT MTU is small and a short bulletin still needs multiple writes.
    return true;
  }

  static ({
    int msgId,
    int totalChunks,
    int chunkIndex,
    int totalLen,
    int checksum,
    Uint8List data,
  }) parseChunkFrame(Uint8List payload) {
    if (!isChunked(payload)) {
      throw ArgumentError('not a chunked payload');
    }
    final msgId = payload[0] | (payload[1] << 8);
    final totalChunks = payload[2];
    final chunkIndex = payload[3];
    final totalLen = payload[4] | (payload[5] << 8);
    final checksum = payload[6] | (payload[7] << 8);
    final data = Uint8List.sublistView(payload, chunkHeaderLen);
    return (
      msgId: msgId,
      totalChunks: totalChunks,
      chunkIndex: chunkIndex,
      totalLen: totalLen,
      checksum: checksum,
      data: data,
    );
  }

  static Uint8List _buildChunkFrame({
    required int msgId,
    required int totalChunks,
    required int chunkIndex,
    required int totalLen,
    required int checksum,
    required Uint8List data,
  }) {
    final frame = Uint8List(chunkHeaderLen + data.length);
    frame[0] = msgId & 0xFF;
    frame[1] = (msgId >> 8) & 0xFF;
    frame[2] = totalChunks & 0xFF;
    frame[3] = chunkIndex & 0xFF;
    frame[4] = totalLen & 0xFF;
    frame[5] = (totalLen >> 8) & 0xFF;
    frame[6] = checksum & 0xFF;
    frame[7] = (checksum >> 8) & 0xFF;
    frame.setRange(chunkHeaderLen, frame.length, data);
    return frame;
  }
}

/// สะสม Chunk ตาม msg_id แล้วประกอบ ciphertext เมื่อครบ
///
/// ใช้ร่วมกับ [ChunkArqService] สำหรับ NACK-based Selective Repeat ARQ
class ChunkReassembler {
  ChunkReassembler({Duration? assemblyTtl})
      : assemblyTtl = assemblyTtl ?? ResilNetChunkCodec.defaultAssemblyTtl;

  final Duration assemblyTtl;
  final Map<int, _ChunkAssembly> _pending = {};

  int get pendingCount => _pending.length;

  /// ชิ้นที่ยังไม่ได้รับสำหรับ [msgId] — ใช้เป็น hook สำหรับ Selective Repeat ARQ
  Set<int>? missingChunkIndices(int msgId) {
    final assembly = _pending[msgId];
    if (assembly == null) return null;
    return {
      for (var i = 0; i < assembly.totalChunks; i++)
        if (!assembly.chunks.containsKey(i)) i,
    };
  }

  /// ทิ้ง assembly ที่เกิน [assemblyTtl] — คืนจำนวนที่ลบ
  int purgeExpired({DateTime? now}) {
    final clock = now ?? DateTime.now();
    final expired = <int>[];
    for (final entry in _pending.entries) {
      if (clock.difference(entry.value.startedAt) > assemblyTtl) {
        expired.add(entry.key);
      }
    }
    for (final id in expired) {
      _pending.remove(id);
    }
    return expired.length;
  }

  /// รับ chunk payload แล้วคืน ciphertext ที่ประกอบครบ (หรือ progress)
  ChunkIngestResult ingest(Uint8List payload, {DateTime? now}) {
    purgeExpired(now: now);

    if (!ResilNetChunkCodec.isChunked(payload)) {
      return ChunkIngestResult(complete: Uint8List.fromList(payload));
    }

    final frame = ResilNetChunkCodec.parseChunkFrame(payload);
    final clock = now ?? DateTime.now();
    final assembly = _pending.putIfAbsent(
      frame.msgId,
      () => _ChunkAssembly(
        totalChunks: frame.totalChunks,
        totalLen: frame.totalLen,
        checksum: frame.checksum,
        startedAt: clock,
      ),
    );

    if (assembly.totalChunks != frame.totalChunks ||
        assembly.totalLen != frame.totalLen ||
        assembly.checksum != frame.checksum) {
      _pending.remove(frame.msgId);
      return const ChunkIngestResult();
    }

    assembly.chunks[frame.chunkIndex] = frame.data;
    assembly.lastChunkAt = clock;
    final received = assembly.chunks.length;

    if (received < frame.totalChunks) {
      return ChunkIngestResult(
        received: received,
        total: frame.totalChunks,
        msgId: frame.msgId,
      );
    }

    _pending.remove(frame.msgId);
    final assembled = assembly.assemble();
    if (assembled == null) {
      return ChunkIngestResult(msgId: frame.msgId);
    }

    final calcChecksum = ResilNetChunkCodec.crc16(assembled);
    if (calcChecksum != frame.checksum) {
      return ChunkIngestResult(msgId: frame.msgId);
    }

    return ChunkIngestResult(
      complete: assembled,
      received: frame.totalChunks,
      total: frame.totalChunks,
      msgId: frame.msgId,
    );
  }

  void reset() => _pending.clear();
}

class _ChunkAssembly {
  _ChunkAssembly({
    required this.totalChunks,
    required this.totalLen,
    required this.checksum,
    required this.startedAt,
  }) : lastChunkAt = startedAt;

  final int totalChunks;
  final int totalLen;
  final int checksum;
  final DateTime startedAt;
  DateTime lastChunkAt;
  final Map<int, Uint8List> chunks = {};

  Uint8List? assemble() {
    if (chunks.length != totalChunks) return null;
    final out = Uint8List(totalLen);
    var offset = 0;
    for (var i = 0; i < totalChunks; i++) {
      final part = chunks[i];
      if (part == null) return null;
      out.setRange(offset, offset + part.length, part);
      offset += part.length;
    }
    if (offset != totalLen) return null;
    return out;
  }
}

import 'package:flutter/foundation.dart';

import '../core/resilnet_ack_codec.dart';
import '../models/ack_entry.dart';
import '../models/chat_message.dart';
import 'database_service.dart';

/// ประมวลผล ACK ขาเข้า — batch DB update + dedup + UI notify
class AckHandlerService extends ChangeNotifier {
  AckHandlerService({
    required this.database,
    required this.myUserId,
    this.findOutboundExtra,
    this.applyOutboundStatus,
  });

  final DatabaseService database;
  final String myUserId;

  /// Lookup outbound ที่ไม่อยู่ใน DB (history OFF → `_sessionMessages`)
  final ChatMessage? Function(String msgId)? findOutboundExtra;

  /// อัปเดตสถานะ outbound นอก DB (session) หลัง apply สำเร็จ
  final void Function(String msgId, MessageStatus status, DateTime at)?
      applyOutboundStatus;

  final Set<String> _processedAckKeys = {};
  static const _maxDedupCache = 4096;

  /// ประมวลผล dedicated ACK packet (`PayloadType 0x05`)
  Future<void> handleBatchPacket(BatchAckPacket packet) async {
    if (packet.receiverId != myUserId) {
      debugPrint(
        '[ACK] drop batch receiver mismatch packet=${packet.receiverId} me=$myUserId',
      );
      return;
    }
    await _applyAckEntries(packet.batchAcks);
  }

  /// ประมวลผล piggybacked ACKs จาก chat envelope
  Future<void> handlePiggybacked(
    List<AckEntry> entries, {
    required String envelopeSenderId,
  }) async {
    final normalized = entries
        .map(
          (e) => AckEntry(
            msgId: e.msgId,
            type: e.type,
            timestamp: e.timestamp,
            targetSenderId: envelopeSenderId,
          ),
        )
        .toList();
    await _applyAckEntries(normalized);
  }

  /// ตรวจว่า payload เป็น ACK batch
  bool isAckPayload(Uint8List payload) {
    return ResilNetAckCodec.decodeBatchPacket(payload) != null;
  }

  Future<void> tryHandleRawPayload(Uint8List payload) async {
    final packet = ResilNetAckCodec.decodeBatchPacket(payload);
    if (packet != null) {
      await handleBatchPacket(packet);
    }
  }

  Future<void> _applyAckEntries(List<AckEntry> entries) async {
    final delivered = <String, DateTime>{};
    final read = <String, DateTime>{};

    for (final e in entries) {
      // Resolve outbound first — do NOT burn dedup when missing (history-off
      // race / late session remember); otherwise a legitimate retry is suppressed.
      final msg = await _findOutboundMessage(e.msgId);
      if (msg == null) {
        debugPrint(
          '[ACK] drop msgId=${e.msgId} type=${e.type.wireName} reason=not-outbound-or-missing',
        );
        continue;
      }

      if (_seen(e.dedupKey)) {
        debugPrint('[ACK] drop duplicate key=${e.dedupKey}');
        continue;
      }

      final ts = DateTime.fromMillisecondsSinceEpoch(e.timestamp);
      switch (e.type) {
        case AckType.delivered:
          if (_canUpgrade(msg.status, MessageStatus.delivered)) {
            delivered.putIfAbsent(e.msgId, () => ts);
            debugPrint(
              '[ACK] apply delivered msgId=${e.msgId} ${msg.status.name}->delivered',
            );
          } else {
            debugPrint(
              '[ACK] drop delivered msgId=${e.msgId} reason=stale status=${msg.status.name}',
            );
          }
        case AckType.read:
          if (_canUpgrade(msg.status, MessageStatus.read)) {
            read[e.msgId] = ts;
            debugPrint(
              '[ACK] apply read msgId=${e.msgId} ${msg.status.name}->read',
            );
          } else {
            debugPrint(
              '[ACK] drop read msgId=${e.msgId} reason=stale status=${msg.status.name}',
            );
          }
      }
    }

    if (delivered.isNotEmpty) {
      for (final entry in delivered.entries) {
        await database.markMessagesDelivered([entry.key], entry.value);
        applyOutboundStatus?.call(
          entry.key,
          MessageStatus.delivered,
          entry.value,
        );
      }
    }
    if (read.isNotEmpty) {
      for (final entry in read.entries) {
        await database.markMessagesRead([entry.key], entry.value);
        applyOutboundStatus?.call(
          entry.key,
          MessageStatus.read,
          entry.value,
        );
      }
    }

    if (delivered.isNotEmpty || read.isNotEmpty) {
      notifyListeners();
    }
  }

  bool _seen(String key) {
    if (_processedAckKeys.contains(key)) return true;
    _processedAckKeys.add(key);
    if (_processedAckKeys.length > _maxDedupCache) {
      _processedAckKeys.remove(_processedAckKeys.first);
    }
    return false;
  }

  bool _canUpgrade(MessageStatus current, MessageStatus next) {
    const order = {
      MessageStatus.pending: 0,
      MessageStatus.sent: 1,
      MessageStatus.relayed: 2,
      MessageStatus.delivered: 3,
      MessageStatus.read: 4,
    };
    return (order[next] ?? 0) > (order[current] ?? 0);
  }

  Future<ChatMessage?> _findOutboundMessage(String msgId) async {
    final rows = await database.getMessageRowById(msgId);
    if (rows != null) {
      final msg = ChatMessage.fromMap(rows);
      if (msg.senderId == myUserId) return msg;
    }
    final extra = findOutboundExtra?.call(msgId);
    if (extra != null && extra.senderId == myUserId) return extra;
    return null;
  }
}

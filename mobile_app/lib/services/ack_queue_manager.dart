import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

import '../core/resilnet_ack_codec.dart';
import '../models/ack_entry.dart';
import 'database_service.dart';

/// Smart ACK buffer — Deferred Timer, Threshold, Piggybacking + Wi-Fi instant flush
class AckQueueManager extends ChangeNotifier {
  AckQueueManager({
    required this.database,
    required this.myUserId,
    required this.isHighSpeedTransport,
    required this.sendAckBatch,
    this.deferredInterval = const Duration(seconds: 30),
    this.meshThreshold = 5,
    this.wifiFlushDelay = const Duration(milliseconds: 400),
  });

  final DatabaseService database;
  final String myUserId;
  final bool Function() isHighSpeedTransport;
  final Future<bool> Function(BatchAckPacket packet) sendAckBatch;

  final Duration deferredInterval;
  final int meshThreshold;
  final Duration wifiFlushDelay;

  final _uuid = const Uuid();
  final List<AckEntry> _buffer = [];
  final Set<String> _dedupKeys = {};
  Timer? _deferredTimer;
  Timer? _wifiFlushTimer;
  bool _flushing = false;

  int get pendingCount => _buffer.length;

  /// โหลด pending ACKs จาก SQLite ตอนเริ่มแอป
  Future<void> restoreFromDatabase() async {
    final rows = await database.loadPendingAcks();
    for (final row in rows) {
      final key = row['dedupKey'] as String;
      if (_dedupKeys.contains(key)) continue;
      _dedupKeys.add(key);
      _buffer.add(
        AckEntry(
          msgId: row['msgId'] as String,
          type: AckType.fromWire(row['ackType'] as String?) ??
              AckType.delivered,
          timestamp: row['timestamp'] as int,
          targetSenderId: row['targetSenderId'] as String,
        ),
      );
    }
    _scheduleDeferredFlush();
    if (isHighSpeedTransport()) {
      _scheduleWifiFlush();
    }
  }

  /// Persist buffer ก่อน background / terminate
  Future<void> persistToDatabase() async {
    if (_buffer.isEmpty) {
      await database.clearAllPendingAcks();
      return;
    }
    await database.clearAllPendingAcks();
    await database.savePendingAcks(
      _buffer
          .map(
            (e) => {
              'dedupKey': e.dedupKey,
              'msgId': e.msgId,
              'ackType': e.type.wireName,
              'timestamp': e.timestamp,
              'targetSenderId': e.targetSenderId,
            },
          )
          .toList(),
    );
  }

  /// คิว DELIVERED / READ ACK (dedup ภายใน buffer)
  Future<void> enqueue(AckEntry entry) async {
    if (_dedupKeys.contains(entry.dedupKey)) return;
    _dedupKeys.add(entry.dedupKey);
    _buffer.add(entry);
    await _persistSingle(entry);
    notifyListeners();

    if (isHighSpeedTransport()) {
      _scheduleWifiFlush();
      return;
    }

    if (_buffer.length >= meshThreshold) {
      await flush();
      return;
    }
    _scheduleDeferredFlush();
  }

  Future<void> enqueueDelivered({
    required String msgId,
    required String targetSenderId,
    DateTime? at,
  }) =>
      enqueue(
        AckEntry(
          msgId: msgId,
          type: AckType.delivered,
          timestamp: (at ?? DateTime.now()).millisecondsSinceEpoch,
          targetSenderId: targetSenderId,
        ),
      );

  Future<void> enqueueRead({
    required String msgId,
    required String targetSenderId,
    DateTime? at,
  }) =>
      enqueue(
        AckEntry(
          msgId: msgId,
          type: AckType.read,
          timestamp: (at ?? DateTime.now()).millisecondsSinceEpoch,
          targetSenderId: targetSenderId,
        ),
      );

  /// Piggyback: ดึง ACKs ที่ปลายทางตรงกับผู้รับข้อความที่กำลังส่ง
  List<AckEntry> drainPiggybackFor(String outgoingReceiverId) {
    final matching = <AckEntry>[];
    final remaining = <AckEntry>[];
    for (final e in _buffer) {
      if (e.targetSenderId == outgoingReceiverId) {
        matching.add(e);
      } else {
        remaining.add(e);
      }
    }
    if (matching.isEmpty) return const [];

    _buffer
      ..clear()
      ..addAll(remaining);
    for (final e in matching) {
      _dedupKeys.remove(e.dedupKey);
      unawaited(database.clearPendingAcksByKeys([e.dedupKey]));
    }
    notifyListeners();
    return matching;
  }

  /// เรียกเมื่อ transport กลับมาเป็น high-speed
  void onTransportUpgraded() {
    _scheduleWifiFlush();
  }

  /// Flush ทุก ACK ที่ค้าง (retry ถ้าล้มเหลว — คง buffer)
  Future<void> flush() async {
    if (_flushing || _buffer.isEmpty) return;
    _flushing = true;
    _deferredTimer?.cancel();
    _wifiFlushTimer?.cancel();

    final snapshot = List<AckEntry>.from(_buffer);
    final byTarget = <String, List<AckEntry>>{};
    for (final e in snapshot) {
      byTarget.putIfAbsent(e.targetSenderId, () => []).add(e);
    }

    final sentKeys = <String>[];
    var allOk = true;

    for (final entry in byTarget.entries) {
      final packet = BatchAckPacket(
        senderId: myUserId,
        receiverId: entry.key,
        batchAcks: entry.value,
      );
      final ok = await sendAckBatch(packet);
      if (ok) {
        sentKeys.addAll(entry.value.map((e) => e.dedupKey));
      } else {
        allOk = false;
      }
    }

    if (sentKeys.isNotEmpty) {
      _buffer.removeWhere((e) => sentKeys.contains(e.dedupKey));
      for (final k in sentKeys) {
        _dedupKeys.remove(k);
      }
      await database.clearPendingAcksByKeys(sentKeys);
    }

    _flushing = false;
    notifyListeners();

    if (!allOk && _buffer.isNotEmpty) {
      _scheduleDeferredFlush();
    }
  }

  Uint8List buildStandaloneAckPayload(BatchAckPacket packet) {
    return ResilNetAckCodec.encodeBatchPacket(packet);
  }

  String newAckPacketId() => _uuid.v4();

  void _scheduleDeferredFlush() {
    _deferredTimer?.cancel();
    if (_buffer.isEmpty || isHighSpeedTransport()) return;
    _deferredTimer = Timer(deferredInterval, () {
      unawaited(flush());
    });
  }

  void _scheduleWifiFlush() {
    _wifiFlushTimer?.cancel();
    if (_buffer.isEmpty) return;
    _wifiFlushTimer = Timer(wifiFlushDelay, () {
      unawaited(flush());
    });
  }

  Future<void> _persistSingle(AckEntry entry) async {
    await database.savePendingAcks([
      {
        'dedupKey': entry.dedupKey,
        'msgId': entry.msgId,
        'ackType': entry.type.wireName,
        'timestamp': entry.timestamp,
        'targetSenderId': entry.targetSenderId,
      },
    ]);
  }

  @override
  void dispose() {
    _deferredTimer?.cancel();
    _wifiFlushTimer?.cancel();
    super.dispose();
  }
}

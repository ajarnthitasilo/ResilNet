import 'dart:async';

import 'package:flutter/foundation.dart';

import '../core/resilnet_chunk_codec.dart';
import '../core/resilnet_nack_codec.dart';
import '../src/rust/api/router_api.dart';

/// เก็บ chunk ที่ส่งออกไปสำหรับ selective retransmit
class OutboundChunkCache {
  OutboundChunkCache({Duration? cacheTtl})
      : cacheTtl = cacheTtl ?? ResilNetChunkCodec.defaultAssemblyTtl;

  final Duration cacheTtl;
  final Map<int, _CachedOutbound> _entries = {};

  int get entryCount => _entries.length;

  void store({
    required String messageId,
    required int msgId,
    required int ttl,
    required List<Uint8List> chunks,
  }) {
    final chunkMap = <int, Uint8List>{};
    for (var i = 0; i < chunks.length; i++) {
      chunkMap[i] = Uint8List.fromList(chunks[i]);
    }
    _entries[msgId] = _CachedOutbound(
      messageId: messageId,
      msgId: msgId,
      ttl: ttl,
      chunks: chunkMap,
      sentAt: DateTime.now(),
    );
  }

  /// คืน chunk payloads สำหรับ retransmit (null ถ้าไม่มีใน cache)
  List<({int index, Uint8List payload})>? chunksForRetransmit(
    int msgId,
    List<int> indices,
  ) {
    final entry = _entries[msgId];
    if (entry == null) return null;
    final out = <({int index, Uint8List payload})>[];
    for (final idx in indices) {
      final chunk = entry.chunks[idx];
      if (chunk == null) return null;
      out.add((index: idx, payload: chunk));
    }
    return out;
  }

  String? messageIdFor(int msgId) => _entries[msgId]?.messageId;
  int? ttlFor(int msgId) => _entries[msgId]?.ttl;

  bool canRetry(int msgId, {int maxRetries = 3}) {
    final entry = _entries[msgId];
    if (entry == null) return false;
    return entry.nackRetryCount < maxRetries;
  }

  void recordRetry(int msgId) {
    final entry = _entries[msgId];
    if (entry != null) entry.nackRetryCount++;
  }

  void remove(int msgId) => _entries.remove(msgId);

  int purgeExpired({DateTime? now}) {
    final clock = now ?? DateTime.now();
    final expired = <int>[];
    for (final e in _entries.entries) {
      if (clock.difference(e.value.sentAt) > cacheTtl) {
        expired.add(e.key);
      }
    }
    for (final id in expired) {
      _entries.remove(id);
    }
    return expired.length;
  }

  void reset() => _entries.clear();
}

class _CachedOutbound {
  _CachedOutbound({
    required this.messageId,
    required this.msgId,
    required this.ttl,
    required this.chunks,
    required this.sentAt,
  });

  final String messageId;
  final int msgId;
  final int ttl;
  final Map<int, Uint8List> chunks;
  final DateTime sentAt;
  int nackRetryCount = 0;
}

/// Serialize async mutations ป้องกัน race ใน Dart stream handlers (reentrant-safe)
class _SerialExecutor {
  Future<void> _tail = Future<void>.value();
  int _depth = 0;

  Future<T> run<T>(Future<T> Function() task) {
    if (_depth > 0) {
      return task();
    }
    final completer = Completer<T>();
    _tail = _tail.then((_) async {
      _depth++;
      try {
        completer.complete(await task());
      } catch (e, st) {
        completer.completeError(e, st);
      } finally {
        _depth--;
      }
    });
    return completer.future;
  }

  void runSync(void Function() task) {
    if (_depth > 0) {
      task();
      return;
    }
    _tail = _tail.then((_) {
      _depth++;
      try {
        task();
      } finally {
        _depth--;
      }
    });
  }
}

/// NACK-based Selective Repeat ARQ coordinator
class ChunkArqService {
  ChunkArqService({
    required this.reassembler,
    this.onSendNack,
    this.onRetransmitChunk,
    Duration? gapTimeout,
    Duration? nackCooldown,
    int? maxNackRetries,
  })  : gapTimeout = gapTimeout ?? const Duration(milliseconds: 300),
        nackCooldown = nackCooldown ?? const Duration(milliseconds: 500),
        maxNackRetries = maxNackRetries ?? 3;

  final ChunkReassembler reassembler;
  final OutboundChunkCache outboundCache = OutboundChunkCache();
  final _executor = _SerialExecutor();

  final Future<void> Function(Uint8List nackFrame, ChunkArqTransport transport)?
      onSendNack;
  final Future<bool> Function({
    required String messageId,
    required int chunkIndex,
    required int ttl,
    required Uint8List payload,
    required ChunkArqTransport transport,
  })? onRetransmitChunk;

  final Duration gapTimeout;
  final Duration nackCooldown;
  final int maxNackRetries;

  final Map<int, Timer> _gapTimers = {};
  final Map<int, DateTime> _lastNackAt = {};

  /// ลงทะเบียน chunk ที่ส่งออก (ฝั่ง sender)
  Future<void> registerOutbound({
    required String messageId,
    required int ttl,
    required List<Uint8List> chunks,
    ChunkArqTransport transport = ChunkArqTransport.wifiUdp,
  }) async {
    if (transport == ChunkArqTransport.lora) return;
    if (chunks.length <= 1 && !ResilNetChunkCodec.isChunked(chunks.first)) {
      return;
    }
    final msgId = ResilNetChunkCodec.msgIdFromChunks(chunks);
    if (msgId == null) return;
    await _executor.run(() async {
      outboundCache.store(
        messageId: messageId,
        msgId: msgId,
        ttl: ttl,
        chunks: chunks,
      );
    });
  }

  /// รับ chunk ขาเข้า — คืน ingest result หลัง reassemble
  Future<ChunkIngestResult> onChunkReceived(
    Uint8List payload, {
    required ChunkArqTransport transport,
    DateTime? now,
  }) async {
    return _executor.run(() async {
      if (ResilNetChunkCodec.isChunked(payload)) {
        final frame = ResilNetChunkCodec.parseChunkFrame(payload);
        if (_shouldDedupChunk(frame.msgId, frame.chunkIndex)) {
          return const ChunkIngestResult();
        }
      }

      final result = reassembler.ingest(payload, now: now);
      final msgId = result.msgId;
      if (msgId != null) {
        if (result.complete != null) {
          _clearNackState(msgId);
          outboundCache.remove(msgId);
          _clearChunkDedup(msgId);
        } else if (transport != ChunkArqTransport.lora) {
          _scheduleGapNack(msgId, transport);
        }
      }
      return result;
    });
  }

  /// รับ NACK — retransmit เฉพาะชิ้นที่ขาด
  Future<void> onNackReceived(
    NackFrame nack, {
    required ChunkArqTransport transport,
  }) async {
    if (transport == ChunkArqTransport.lora) return;
    await _executor.run(() async {
      outboundCache.purgeExpired();
      if (!outboundCache.canRetry(nack.msgId, maxRetries: maxNackRetries)) {
        debugPrint(
          '[ChunkArq] max NACK retries reached msg_id=${nack.msgId}',
        );
        outboundCache.remove(nack.msgId);
        return;
      }

      final chunks = outboundCache.chunksForRetransmit(
        nack.msgId,
        nack.missingIndices,
      );
      if (chunks == null || chunks.isEmpty) return;

      final messageId = outboundCache.messageIdFor(nack.msgId);
      final ttl = outboundCache.ttlFor(nack.msgId);
      if (messageId == null || ttl == null) return;

      final retransmit = onRetransmitChunk;
      if (retransmit == null) return;

      outboundCache.recordRetry(nack.msgId);
      for (var i = 0; i < chunks.length; i++) {
        if (i > 0) {
          await Future<void>.delayed(
            ResilNetChunkCodec.defaultInterChunkDelay,
          );
        }
        final c = chunks[i];
        await retransmit(
          messageId: messageId,
          chunkIndex: c.index,
          ttl: ttl,
          payload: c.payload,
          transport: transport,
        );
      }
    });
  }

  void _scheduleGapNack(int msgId, ChunkArqTransport transport) {
    _gapTimers[msgId]?.cancel();
    _gapTimers[msgId] = Timer(gapTimeout, () {
      unawaited(_maybeEmitNack(msgId, transport));
    });
  }

  Future<void> _maybeEmitNack(int msgId, ChunkArqTransport transport) async {
    if (transport == ChunkArqTransport.lora) return;
    await _executor.run(() async {
      final missing = reassembler.missingChunkIndices(msgId);
      if (missing == null || missing.isEmpty) return;

      final now = DateTime.now();
      final last = _lastNackAt[msgId];
      if (last != null && now.difference(last) < nackCooldown) {
        _scheduleGapNack(msgId, transport);
        return;
      }

      final sendNack = onSendNack;
      if (sendNack == null) return;

      final indices = missing.toList()..sort();
      final frame = ResilNetNackCodec.encode(
        msgId: msgId,
        missingIndices: indices,
      );
      _lastNackAt[msgId] = now;
      debugPrint(
        '[ChunkArq] NACK msg_id=$msgId missing=$indices transport=$transport',
      );
      await sendNack(frame, transport);
      _scheduleGapNack(msgId, transport);
    });
  }

  void _clearNackState(int msgId) {
    _gapTimers.remove(msgId)?.cancel();
    _lastNackAt.remove(msgId);
  }

  void purgeStale({DateTime? now}) {
    _executor.runSync(() {
      final dropped = outboundCache.purgeExpired(now: now);
      reassembler.purgeExpired(now: now);
      if (dropped > 0) {
        debugPrint('[ChunkArq] purged $dropped outbound cache entries');
      }
    });
  }

  void dispose() {
    for (final t in _gapTimers.values) {
      t.cancel();
    }
    _gapTimers.clear();
    _lastNackAt.clear();
    outboundCache.reset();
    reassembler.reset();
  }

  /// Drop in-flight chunk reassembly / outbound cache (panic wipe).
  void clearAllCaches() {
    for (final t in _gapTimers.values) {
      t.cancel();
    }
    _gapTimers.clear();
    _lastNackAt.clear();
    outboundCache.reset();
    reassembler.reset();
  }

  bool _shouldDedupChunk(int msgId, int chunkIndex) {
    try {
      if (!isRouterInitialized()) return false;
      return !checkChunkDedup(msgId: msgId, chunkIndex: chunkIndex);
    } catch (_) {
      return false;
    }
  }

  void _clearChunkDedup(int msgId) {
    try {
      if (isRouterInitialized()) {
        clearChunkStream(msgId: msgId);
      }
    } catch (_) {}
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

import 'package:resilnet/core/resilnet_chunk_codec.dart';
import 'package:resilnet/core/resilnet_nack_codec.dart';
import 'package:resilnet/core/resilnet_radio_codec.dart';
import 'package:resilnet/models/chat_message.dart';
import 'package:resilnet/services/chunk_arq_service.dart';

void main() {
  group('ResilNetChunkCodec', () {
    test('single frame when ciphertext <= 190 bytes', () {
      final data = Uint8List.fromList(List.filled(100, 0xAB));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      expect(chunks.length, 1);
      expect(chunks[0], data);
      expect(ResilNetChunkCodec.isChunked(chunks[0]), isFalse);
    });

    test('splits ciphertext > 190 bytes into chunked frames', () {
      final data = Uint8List.fromList(List.filled(500, 0xCD));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      expect(chunks.length, greaterThan(1));
      for (final chunk in chunks) {
        expect(chunk.length, lessThanOrEqualTo(8 + 200));
        expect(ResilNetChunkCodec.isChunked(chunk), isTrue);
        expect(
          chunk.length - ResilNetChunkCodec.chunkHeaderLen,
          lessThanOrEqualTo(ResilNetChunkCodec.maxChunkDataLen),
        );
      }
    });

    test('reassembles 1KB ciphertext with checksum verification', () {
      final plaintext = 'x' * 1024;
      final ciphertext = Uint8List.fromList(utf8.encode(plaintext));
      expect(ciphertext.length, greaterThan(190));

      final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
      final reassembler = ChunkReassembler();
      Uint8List? assembled;

      for (final chunk in chunks) {
        final result = reassembler.ingest(chunk);
        if (result.received != null) {
          expect(result.received!, lessThanOrEqualTo(result.total!));
        }
        assembled = result.complete ?? assembled;
      }

      expect(assembled, isNotNull);
      expect(assembled, ciphertext);
      expect(utf8.decode(assembled!), plaintext);
    });

    test('rejects reassembly when checksum mismatches', () {
      final data = Uint8List.fromList(List.filled(400, 0xEF));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      // Corrupt last chunk data
      final last = Uint8List.fromList(chunks.last);
      last[last.length - 1] ^= 0xFF;

      final reassembler = ChunkReassembler();
      Uint8List? assembled;
      for (var i = 0; i < chunks.length - 1; i++) {
        reassembler.ingest(chunks[i]);
      }
      final result = reassembler.ingest(last);
      assembled = result.complete;
      expect(assembled, isNull);
    });

    test('ChatMessage round-trip through chunk codec', () {
      final msg = ChatMessage(
        id: 'test-msg-id',
        senderId: 'sender-hash',
        receiverId: 'receiver-hash',
        encryptedPayload: 'ep-${'a' * 300}',
        encryptedKey: 'ek-${'b' * 100}',
        signature: 'sig-test',
        ttl: 5,
        timestamp: 1700000000000,
        status: MessageStatus.pending,
        type: MessageType.direct,
      );

      final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
      expect(ciphertext.length, greaterThan(190));

      final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
      final reassembler = ChunkReassembler();
      ChatMessage? restored;

      for (final chunk in chunks) {
        final result = reassembler.ingest(chunk);
        if (result.complete != null) {
          restored = ResilNetChunkCodec.chatMessageFromCiphertext(
            result.complete!,
          );
        }
      }

      expect(restored, isNotNull);
      expect(restored!.id, msg.id);
      expect(restored.senderId, msg.senderId);
      expect(restored.encryptedPayload, msg.encryptedPayload);
    });

    test('chunked frames fit within radio MTU 230 bytes', () {
      final data = Uint8List.fromList(List.filled(1024, 0x42));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      for (final chunk in chunks) {
        expect(
          chunk.length,
          lessThanOrEqualTo(230),
          reason: 'chunk payload must fit radio MTU',
        );
      }
    });

    test('purges incomplete assembly after TTL expires', () {
      final data = Uint8List.fromList(List.filled(600, 0x99));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      final frame0 = ResilNetChunkCodec.parseChunkFrame(chunks[0]);
      final reassembler = ChunkReassembler(
        assemblyTtl: const Duration(seconds: 30),
      );
      final t0 = DateTime(2026, 1, 1, 12, 0, 0);

      reassembler.ingest(chunks[0], now: t0);
      expect(reassembler.pendingCount, 1);
      expect(reassembler.missingChunkIndices(frame0.msgId), isNotEmpty);

      final dropped = reassembler.purgeExpired(
        now: t0.add(const Duration(seconds: 31)),
      );
      expect(dropped, 1);
      expect(reassembler.pendingCount, 0);
    });

    test('missingChunkIndices reports gaps for selective repeat ARQ hook', () {
      final data = Uint8List.fromList(List.filled(500, 0x77));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      final frame0 = ResilNetChunkCodec.parseChunkFrame(chunks[0]);
      final frame2 = ResilNetChunkCodec.parseChunkFrame(chunks[2]);
      final reassembler = ChunkReassembler();

      reassembler.ingest(chunks[0]);
      reassembler.ingest(chunks[2]);

      final missing = reassembler.missingChunkIndices(frame0.msgId);
      expect(missing, isNotNull);
      expect(missing, contains(1));
      expect(missing, isNot(contains(0)));
      expect(missing, isNot(contains(frame2.chunkIndex)));
    });

    test('UDP transport simulation: encode → radio frame → decode → reassemble',
        () {
      final msg = ChatMessage(
        id: 'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
        senderId: 'alice',
        receiverId: 'bob',
        encryptedPayload: base64Encode(utf8.encode('{"v":1,"iv":"aa","ct":"' + 'c' * 400 + '"}')),
        encryptedKey: base64Encode(List.filled(128, 0x11)),
        signature: 'sig',
        ttl: 5,
        timestamp: 1,
        status: MessageStatus.pending,
        type: MessageType.direct,
      );

      final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
      final chunkPayloads = ResilNetChunkCodec.encodeChunks(ciphertext);

      final reassembler = ChunkReassembler();
      for (var i = 0; i < chunkPayloads.length; i++) {
        final radio = ResilNetRadioCodec.fromRadioPayload(
          packetId: ResilNetChunkCodec.chunkPacketId(msg.id, i),
          ttl: msg.ttl,
          payload: chunkPayloads[i],
        );
        final frame = ResilNetRadioCodec.encodeFrame(radio);
        expect(frame.length, lessThanOrEqualTo(21 + 230 + 2));

        final decoded = ResilNetRadioCodec.decodeFrame(frame);
        expect(decoded, isNotNull);

        final result = reassembler.ingest(decoded!.payload);
        if (i < chunkPayloads.length - 1) {
          expect(result.complete, isNull);
        } else {
          expect(result.complete, isNotNull);
          final restored = ResilNetChunkCodec.chatMessageFromCiphertext(
            result.complete!,
          );
          expect(restored?.id, msg.id);
        }
      }
    });
  });

  group('NACK ARQ', () {
    ChatMessage _largeTestMessage() {
      return ChatMessage(
        id: 'arq-test-msg-001',
        senderId: 'sender-a',
        receiverId: 'receiver-b',
        encryptedPayload: 'ep-${'x' * 400}',
        encryptedKey: 'ek-${'y' * 120}',
        signature: 'sig-arq',
        ttl: 5,
        timestamp: 1700000000001,
        status: MessageStatus.pending,
        type: MessageType.direct,
      );
    }

    test('encodes NACK frame with missing_indices = [1]', () {
      const msgId = 0xABCD;
      final frame = ResilNetNackCodec.encode(
        msgId: msgId,
        missingIndices: [1],
      );
      expect(frame.length, lessThanOrEqualTo(16));
      final decoded = ResilNetNackCodec.tryDecode(frame);
      expect(decoded, isNotNull);
      expect(decoded!.msgId, msgId);
      expect(decoded.missingIndices, [1]);
    });

    test('sender retransmits only missing chunk from OutboundChunkCache', () async {
      final msg = _largeTestMessage();
      final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
      final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
      final msgId = ResilNetChunkCodec.msgIdFromChunks(chunks)!;

      final cache = OutboundChunkCache();
      cache.store(messageId: msg.id, msgId: msgId, ttl: msg.ttl, chunks: chunks);

      final toRetransmit = cache.chunksForRetransmit(msgId, [1]);
      expect(toRetransmit, isNotNull);
      expect(toRetransmit!.length, 1);
      expect(toRetransmit.first.index, 1);
      expect(toRetransmit.first.payload, chunks[1]);
    });

    test('selective retransmit reassembles after missing chunk 1', () async {
      final msg = _largeTestMessage();
      final ciphertext = ResilNetChunkCodec.ciphertextFromMessage(msg);
      final chunks = ResilNetChunkCodec.encodeChunks(ciphertext);
      final msgId = ResilNetChunkCodec.msgIdFromChunks(chunks)!;
      expect(chunks.length, greaterThanOrEqualTo(3));

      final reassembler = ChunkReassembler();
      final retransmitted = <int>[];
      ChunkIngestResult? finalResult;

      late ChunkArqService arq;
      arq = ChunkArqService(
        reassembler: reassembler,
        gapTimeout: Duration.zero,
        nackCooldown: Duration.zero,
        onRetransmitChunk: ({
          required String messageId,
          required int chunkIndex,
          required int ttl,
          required Uint8List payload,
          required ChunkArqTransport transport,
        }) async {
          retransmitted.add(chunkIndex);
          finalResult = await arq.onChunkReceived(payload, transport: transport);
          return true;
        },
      );

      await arq.registerOutbound(
        messageId: msg.id,
        ttl: msg.ttl,
        chunks: chunks,
        transport: ChunkArqTransport.wifiUdp,
      );

      for (var i = 0; i < chunks.length; i++) {
        if (i == 1) continue;
        await arq.onChunkReceived(chunks[i], transport: ChunkArqTransport.wifiUdp);
      }

      expect(reassembler.missingChunkIndices(msgId), {1});

      final nack = NackFrame(msgId: msgId, missingIndices: [1]);
      expect(
        ResilNetNackCodec.encode(
          msgId: msgId,
          missingIndices: nack.missingIndices,
        ).length,
        lessThanOrEqualTo(16),
      );

      await arq.onNackReceived(nack, transport: ChunkArqTransport.wifiUdp);

      expect(retransmitted, [1]);
      expect(reassembler.missingChunkIndices(msgId), isNull);
      expect(finalResult?.complete, isNotNull);

      final restored = ResilNetChunkCodec.chatMessageFromCiphertext(
        finalResult!.complete!,
      );
      expect(restored?.id, msg.id);
      expect(restored?.encryptedPayload, msg.encryptedPayload);
      expect(restored?.encryptedKey, msg.encryptedKey);
      expect(utf8.decode(finalResult!.complete!), utf8.decode(ciphertext));
    });

    test('max NACK retries stops retransmit after 3 attempts', () async {
      final msg = _largeTestMessage();
      final chunks = ResilNetChunkCodec.encodeChunks(
        ResilNetChunkCodec.ciphertextFromMessage(msg),
      );
      final msgId = ResilNetChunkCodec.msgIdFromChunks(chunks)!;

      var retransmitCount = 0;
      final arq = ChunkArqService(
        reassembler: ChunkReassembler(),
        onRetransmitChunk: ({
          required String messageId,
          required int chunkIndex,
          required int ttl,
          required Uint8List payload,
          required ChunkArqTransport transport,
        }) async {
          retransmitCount++;
          return true;
        },
      );

      await arq.registerOutbound(
        messageId: msg.id,
        ttl: msg.ttl,
        chunks: chunks,
        transport: ChunkArqTransport.wifiUdp,
      );

      final nack = NackFrame(msgId: msgId, missingIndices: [1]);
      for (var i = 0; i < 5; i++) {
        await arq.onNackReceived(nack, transport: ChunkArqTransport.wifiUdp);
      }
      expect(retransmitCount, 3);
    });

    test('LoRa transport skips NACK emission', () async {
      final reassembler = ChunkReassembler();
      var nackSent = false;
      final arq = ChunkArqService(
        reassembler: reassembler,
        gapTimeout: Duration.zero,
        onSendNack: (_, __) async => nackSent = true,
      );

      final data = Uint8List.fromList(List.filled(500, 0x55));
      final chunks = ResilNetChunkCodec.encodeChunks(data);
      await arq.onChunkReceived(chunks[0], transport: ChunkArqTransport.lora);
      await Future<void>.delayed(const Duration(milliseconds: 5));
      expect(nackSent, isFalse);
    });
  });
}

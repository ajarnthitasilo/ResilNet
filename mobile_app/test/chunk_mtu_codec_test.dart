import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/resilnet_chunk_codec.dart';

void main() {
  test('encodeChunks respects small ATT MTU and reassembles', () {
    final data = Uint8List.fromList(List.generate(400, (i) => i % 256));
    final chunks = ResilNetChunkCodec.encodeChunks(data, maxAttPayload: 20);
    expect(chunks.length, greaterThan(1));
    for (final c in chunks) {
      expect(c.length, lessThanOrEqualTo(20));
      expect(ResilNetChunkCodec.isChunked(c), isTrue);
    }
    final r = ChunkReassembler();
    Uint8List? complete;
    for (final c in chunks) {
      final res = r.ingest(c);
      if (res.complete != null) complete = res.complete;
    }
    expect(complete, isNotNull);
    expect(complete!.length, 400);
    expect(complete, data);
  });
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/media_part_codec.dart';

void main() {
  test('media parts round-trip reassemble sealed payload', () {
    final full = Uint8List.fromList(
      utf8.encode(jsonEncode({'hello': 'world', 'pad': 'x' * 50000})),
    );
    expect(full.length, greaterThan(MediaPartCodec.singleMaxBytes));

    final slices = MediaPartCodec.splitPayload(full);
    expect(slices.length, greaterThan(1));

    final assembler = MediaPartAssembler();
    Uint8List? complete;
    for (var i = 0; i < slices.length; i++) {
      final encoded = MediaPartCodec.encodePart(
        messageId: 'msg-1',
        index: i,
        total: slices.length,
        slice: slices[i],
      );
      expect(MediaPartCodec.isMediaPartPayload(encoded), isTrue);
      final part = MediaPartCodec.parsePart(encoded)!;
      complete = assembler.add(part);
      if (i < slices.length - 1) {
        expect(complete, isNull);
      }
    }
    expect(complete, isNotNull);
    expect(complete!.length, full.length);
    expect(complete, orderedEquals(full));
  });
}

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/services/audio_recorder_service.dart';

void main() {
  group('detectAudioExt', () {
    test('detects m4a ftyp header', () {
      final bytes = Uint8List.fromList([
        0, 0, 0, 0,
        0x66, 0x74, 0x79, 0x70,
        ...List.filled(80, 0),
      ]);
      expect(detectAudioExt(bytes), 'm4a');
      expect(isValidAudioBytes(bytes), isTrue);
    });

    test('detects opus OggS header', () {
      final bytes = Uint8List.fromList([
        0x4F, 0x67, 0x67, 0x53,
        ...List.filled(80, 0),
      ]);
      expect(detectAudioExt(bytes), 'opus');
      expect(isValidAudioBytes(bytes), isTrue);
    });

    test('rejects tiny payloads', () {
      expect(isValidAudioBytes(Uint8List(10)), isFalse);
    });
  });
}

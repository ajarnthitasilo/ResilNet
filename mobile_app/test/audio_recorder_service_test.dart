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

    test('accepts large non-magic payloads for draft preview', () {
      expect(isValidAudioBytes(Uint8List(300)), isTrue);
    });
  });

  group('size caps', () {
    test('raw cap allows longer voice with multipart Nostr', () {
      expect(AudioRecorderService.maxBytes, greaterThanOrEqualTo(200 * 1024));
      expect(AudioRecorderService.maxDuration.inSeconds, greaterThanOrEqualTo(20));
    });
  });
}

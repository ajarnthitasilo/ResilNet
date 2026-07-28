import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/voice_payload.dart';

void main() {
  group('VoicePayload', () {
    final sample = Uint8List.fromList([0, 0, 0, 0, 0x66, 0x74, 0x79, 0x70]);

    test('encodeWire round-trip', () {
      final wire = VoicePayload.encodeWire(bytes: sample, ext: 'm4a');
      final decoded = VoicePayload.decode(wire);
      expect(decoded, isNotNull);
      expect(decoded!.bytes, sample);
      expect(decoded.ext, 'm4a');
    });

    test('decode legacy raw base64', () {
      final legacy = base64Encode(sample);
      final decoded = VoicePayload.decode(legacy);
      expect(decoded, isNotNull);
      expect(decoded!.bytes, sample);
    });

    test('decode rejects empty', () {
      expect(VoicePayload.decode(''), isNull);
      expect(VoicePayload.decode('not-base64!!!'), isNull);
    });
  });
}

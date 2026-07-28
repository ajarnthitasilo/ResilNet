import 'dart:convert';
import 'dart:typed_data';

import 'package:resilnet/services/audio_recorder_service.dart';

/// Wire + local-cache JSON for E2EE voice notes: `{v, b64, ext}`.
class VoicePayload {
  VoicePayload._();

  static const wireVersion = 1;

  static String encodeWire({
    required Uint8List bytes,
    required String ext,
  }) {
    return jsonEncode({
      'v': wireVersion,
      'b64': base64Encode(bytes),
      'ext': ext.trim().toLowerCase().isEmpty ? 'm4a' : ext.trim().toLowerCase(),
    });
  }

  /// Decode wire plaintext or sender local cache (same JSON shape).
  /// Legacy: raw base64 string without JSON wrapper.
  static ({Uint8List bytes, String ext})? decode(String plaintext) {
    final trimmed = plaintext.trim();
    if (trimmed.isEmpty) return null;

    try {
      final obj = jsonDecode(trimmed);
      if (obj is Map) {
        final map = Map<String, dynamic>.from(obj);
        final b64 = (map['b64'] as String?)?.trim();
        if (b64 == null || b64.isEmpty) return null;
        final raw = base64Decode(b64);
        if (raw.isEmpty) return null;
        final ext = (map['ext'] as String?)?.trim().toLowerCase();
        return (
          bytes: Uint8List.fromList(raw),
          ext: (ext != null && ext.isNotEmpty) ? ext : detectAudioExt(raw),
        );
      }
    } catch (_) {
      // Fall through to legacy raw base64.
    }

    try {
      final raw = base64Decode(trimmed);
      if (raw.isEmpty) return null;
      return (bytes: Uint8List.fromList(raw), ext: detectAudioExt(raw));
    } catch (_) {
      return null;
    }
  }
}

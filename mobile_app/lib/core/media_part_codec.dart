import 'dart:convert';
import 'dart:typed_data';

/// Split a large sealed DTO payload across multiple Nostr publishes.
///
/// Each part is a small JSON envelope; the receiver reassembles the original
/// utf8 ChatMessage JSON (already E2EE) before normal ingest.
class MediaPartCodec {
  MediaPartCodec._();

  static const marker = 'mp';
  static const version = 1;

  /// Max raw slice per part. After JSON+base64+Nostr wrapping stays under
  /// typical public-relay content limits (~64–100KB).
  static const maxSliceBytes = 24 * 1024;

  /// Above this sealed DTO size, use multi-part Nostr instead of one event.
  static const singleMaxBytes = 36 * 1024;

  /// Hard cap on number of Nostr parts.
  ///
  /// Sealed chat JSON is ~2.3× raw image bytes (base64 + AES + envelope).
  /// 24 × 24KiB ≈ 576KiB sealed ≈ ~250KiB JPEG after compression.
  static const maxParts = 24;

  /// Approx max raw media bytes that fit in [maxParts] after seal overhead.
  static const maxRawMediaBytes = 220 * 1024;

  static bool isMediaPartPayload(Uint8List payload) {
    try {
      final obj = jsonDecode(utf8.decode(payload));
      if (obj is! Map) return false;
      return obj['t'] == marker && obj['v'] == version;
    } catch (_) {
      return false;
    }
  }

  static List<Uint8List> splitPayload(Uint8List full) {
    if (full.isEmpty) return const [];
    final out = <Uint8List>[];
    for (var off = 0; off < full.length; off += maxSliceBytes) {
      final end = (off + maxSliceBytes < full.length)
          ? off + maxSliceBytes
          : full.length;
      out.add(Uint8List.sublistView(full, off, end));
    }
    if (out.length > maxParts) {
      throw StateError(
        'media too large for Nostr parts (${out.length} > $maxParts)',
      );
    }
    return out;
  }

  static Uint8List encodePart({
    required String messageId,
    required int index,
    required int total,
    required Uint8List slice,
  }) {
    final map = <String, Object?>{
      'v': version,
      't': marker,
      'mid': messageId,
      'i': index,
      'n': total,
      'b64': base64Encode(slice),
    };
    return Uint8List.fromList(utf8.encode(jsonEncode(map)));
  }

  static MediaPart? parsePart(Uint8List payload) {
    try {
      final obj = jsonDecode(utf8.decode(payload));
      if (obj is! Map) return null;
      final map = Map<String, dynamic>.from(obj);
      if (map['t'] != marker || map['v'] != version) return null;
      final mid = (map['mid'] as String?)?.trim() ?? '';
      final i = (map['i'] as num?)?.toInt();
      final n = (map['n'] as num?)?.toInt();
      final b64 = (map['b64'] as String?)?.trim() ?? '';
      if (mid.isEmpty || i == null || n == null || n <= 0 || i < 0 || i >= n) {
        return null;
      }
      if (n > maxParts) return null;
      if (b64.isEmpty) return null;
      return MediaPart(
        messageId: mid,
        index: i,
        total: n,
        slice: Uint8List.fromList(base64Decode(b64)),
      );
    } catch (_) {
      return null;
    }
  }
}

class MediaPart {
  const MediaPart({
    required this.messageId,
    required this.index,
    required this.total,
    required this.slice,
  });

  final String messageId;
  final int index;
  final int total;
  final Uint8List slice;
}

/// In-memory reassembly of [MediaPartCodec] slices (keyed by message id).
class MediaPartAssembler {
  final Map<String, _Assembly> _byId = {};

  static const ttl = Duration(minutes: 3);

  /// Returns the full sealed DTO payload when all parts are present.
  Uint8List? add(MediaPart part) {
    _prune();
    final existing = _byId[part.messageId];
    final assembly = existing ??
        _Assembly(total: part.total, updatedAt: DateTime.now());
    if (existing == null) {
      _byId[part.messageId] = assembly;
    } else if (existing.total != part.total) {
      // Conflicting totals — reset.
      assembly.parts.clear();
      assembly.total = part.total;
    }
    assembly.parts[part.index] = part.slice;
    assembly.updatedAt = DateTime.now();
    if (assembly.parts.length != assembly.total) return null;
    final lengths = <int>[];
    var totalLen = 0;
    for (var i = 0; i < assembly.total; i++) {
      final slice = assembly.parts[i];
      if (slice == null) return null;
      lengths.add(slice.length);
      totalLen += slice.length;
    }
    final out = Uint8List(totalLen);
    var offset = 0;
    for (var i = 0; i < assembly.total; i++) {
      final slice = assembly.parts[i]!;
      out.setRange(offset, offset + slice.length, slice);
      offset += slice.length;
    }
    _byId.remove(part.messageId);
    return out;
  }

  void _prune() {
    final cutoff = DateTime.now().subtract(ttl);
    _byId.removeWhere((_, a) => a.updatedAt.isBefore(cutoff));
  }
}

class _Assembly {
  _Assembly({required this.total, required this.updatedAt});

  int total;
  DateTime updatedAt;
  final Map<int, Uint8List> parts = {};
}

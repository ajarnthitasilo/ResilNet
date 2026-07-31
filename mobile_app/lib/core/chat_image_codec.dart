import 'dart:typed_data';

import 'package:image/image.dart' as img;

/// Compress gallery/camera bytes until they fit the Nostr media-part budget.
///
/// Chat images are E2EE'd as a sealed JSON envelope (~2.3× raw JPEG), then
/// split across [MediaPartCodec] Nostr events. Stay under
/// [targetOnlineBytes] / [targetOfflineBytes] (margin below
/// MediaPartCodec.maxRawMediaBytes) so part counts stay low and delivery
/// is reliable. Does not touch text/ACK transport paths.
class ChatImageCodec {
  ChatImageCodec._();

  /// Prefer well under MediaPartCodec.maxRawMediaBytes so seal+parts succeed.
  static const targetOnlineBytes = 100 * 1024;
  static const targetOfflineBytes = 72 * 1024;

  static const _minSide = 320;
  static const _minQuality = 28;

  /// Returns JPEG bytes ≤ [maxBytes], or null if impossible at the floor.
  static Uint8List? compressToBudget(
    Uint8List input, {
    required int maxBytes,
  }) {
    if (input.isEmpty) return null;
    if (input.length <= maxBytes && _looksLikeJpeg(input)) {
      return input;
    }

    final decoded = img.decodeImage(input);
    if (decoded == null) return null;

    var frame = img.bakeOrientation(decoded);
    var quality = 70;
    var maxSide = frame.width > frame.height ? frame.width : frame.height;
    if (maxSide > 1280) maxSide = 1280;

    Uint8List? best;

    for (var attempt = 0; attempt < 16; attempt++) {
      final resized = _resizeMaxSide(frame, maxSide);
      final encoded = Uint8List.fromList(
        img.encodeJpg(resized, quality: quality),
      );
      if (best == null || encoded.length < best.length) {
        best = encoded;
      }
      if (encoded.length <= maxBytes) {
        return encoded;
      }

      if (quality > _minQuality + 10) {
        quality -= 8;
      } else if (quality > _minQuality) {
        quality = _minQuality;
      } else if (maxSide > _minSide) {
        maxSide = (maxSide * 0.75).round().clamp(_minSide, maxSide);
        quality = 55;
      } else {
        break;
      }
    }

    if (best != null && best.length <= maxBytes) return best;
    return null;
  }

  static int budgetForConnectivity({required bool online}) =>
      online ? targetOnlineBytes : targetOfflineBytes;

  static img.Image _resizeMaxSide(img.Image src, int maxSide) {
    final long = src.width > src.height ? src.width : src.height;
    if (long <= maxSide) return src;
    if (src.width >= src.height) {
      return img.copyResize(
        src,
        width: maxSide,
        interpolation: img.Interpolation.average,
      );
    }
    return img.copyResize(
      src,
      height: maxSide,
      interpolation: img.Interpolation.average,
    );
  }

  static bool _looksLikeJpeg(Uint8List bytes) {
    return bytes.length >= 3 &&
        bytes[0] == 0xff &&
        bytes[1] == 0xd8 &&
        bytes[2] == 0xff;
  }
}

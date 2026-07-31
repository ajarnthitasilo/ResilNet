import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:resilnet/core/chat_image_codec.dart';

Uint8List _noisyJpeg({int w = 1600, int h = 1200}) {
  final image = img.Image(width: w, height: h);
  for (var y = 0; y < h; y++) {
    for (var x = 0; x < w; x++) {
      final v = (x * 37 + y * 91) & 0xff;
      image.setPixelRgb(x, y, v, (v * 3) & 0xff, (v * 7) & 0xff);
    }
  }
  return Uint8List.fromList(img.encodeJpg(image, quality: 92));
}

void main() {
  test('compressToBudget shrinks oversized JPEG under online target', () {
    final raw = _noisyJpeg();
    expect(raw.length, greaterThan(ChatImageCodec.targetOnlineBytes));

    final out = ChatImageCodec.compressToBudget(
      raw,
      maxBytes: ChatImageCodec.targetOnlineBytes,
    );
    expect(out, isNotNull);
    expect(out!.length, lessThanOrEqualTo(ChatImageCodec.targetOnlineBytes));
    expect(out[0], 0xff);
    expect(out[1], 0xd8);
  });

  test('compressToBudget returns input when already small JPEG', () {
    final tiny = img.Image(width: 32, height: 32);
    img.fill(tiny, color: img.ColorRgb8(1, 2, 3));
    final raw = Uint8List.fromList(img.encodeJpg(tiny, quality: 50));
    expect(raw.length, lessThan(ChatImageCodec.targetOfflineBytes));

    final out = ChatImageCodec.compressToBudget(
      raw,
      maxBytes: ChatImageCodec.targetOfflineBytes,
    );
    expect(out, same(raw));
  });

  test('budgetForConnectivity picks online vs offline targets', () {
    expect(
      ChatImageCodec.budgetForConnectivity(online: true),
      ChatImageCodec.targetOnlineBytes,
    );
    expect(
      ChatImageCodec.budgetForConnectivity(online: false),
      ChatImageCodec.targetOfflineBytes,
    );
  });
}

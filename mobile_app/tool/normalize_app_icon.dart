import 'dart:io';

import 'package:image/image.dart' as img;

void main() {
  final srcPath = 'assets/icon/app_icon.png';
  final bytes = File(srcPath).readAsBytesSync();
  final decoded = img.decodeImage(bytes);
  if (decoded == null) {
    stderr.writeln('Failed to decode $srcPath');
    exit(1);
  }
  stdout.writeln('source: ${decoded.width}x${decoded.height}');

  // Square canvas 1024 with navy fill matching icon background
  const size = 1024;
  final navy = img.ColorRgb8(0x0B, 0x1A, 0x3A);
  final canvas = img.Image(width: size, height: size);
  img.fill(canvas, color: navy);

  // Fit source inside square with padding so logo isn't clipped by iOS mask
  const pad = 48;
  final maxW = size - pad * 2;
  final maxH = size - pad * 2;
  final scale = (maxW / decoded.width < maxH / decoded.height)
      ? maxW / decoded.width
      : maxH / decoded.height;
  final tw = (decoded.width * scale).round();
  final th = (decoded.height * scale).round();
  final resized = img.copyResize(
    decoded,
    width: tw,
    height: th,
    interpolation: img.Interpolation.cubic,
  );
  final ox = ((size - tw) / 2).round();
  final oy = ((size - th) / 2).round();
  img.compositeImage(canvas, resized, dstX: ox, dstY: oy);

  File('assets/icon/app_icon_user_original.bin').writeAsBytesSync(bytes);
  File(srcPath).writeAsBytesSync(img.encodePng(canvas, level: 6));
  stdout.writeln('Wrote square PNG ${size}x$size -> $srcPath');
}

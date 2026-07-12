import 'dart:io';
import 'dart:math' as math;

import 'package:image/image.dart' as img;

void main() {
  // Master icon for flutter_launcher_icons
  // Navy background + thicker solid emerald strokes (same green) + cyan chat bubble
  const size = 1024;
  final canvas = img.Image(width: size, height: size);

  // Clearer navy (not near-black) + original emerald green
  final navyTop = img.ColorRgb8(0x0E, 0x27, 0x55);
  final navyBottom = img.ColorRgb8(0x08, 0x18, 0x3A);
  final emerald = img.ColorRgb8(0x10, 0xB9, 0x81); // สีเขียวเดิม
  final cyan = img.ColorRgb8(0x7D, 0xD3, 0xFC);

  for (var y = 0; y < size; y++) {
    final t = y / (size - 1);
    final row = img.ColorRgb8(
      (navyTop.r + (navyBottom.r - navyTop.r) * t).round(),
      (navyTop.g + (navyBottom.g - navyTop.g) * t).round(),
      (navyTop.b + (navyBottom.b - navyTop.b) * t).round(),
    );
    for (var x = 0; x < size; x++) {
      canvas.setPixel(x, y, row);
    }
  }

  // Solid thick stroke via stamped circles (no hatched drawLine artifacts)
  void strokeLine(
    math.Point<double> a,
    math.Point<double> b, {
    required img.Color color,
    int thickness = 36,
  }) {
    final dx = b.x - a.x;
    final dy = b.y - a.y;
    final len = math.sqrt(dx * dx + dy * dy);
    if (len < 0.001) return;
    final radius = math.max(1, (thickness / 2).round());
    final steps = math.max(1, (len / math.max(1.0, radius * 0.4)).ceil());
    for (var i = 0; i <= steps; i++) {
      final t = i / steps;
      img.fillCircle(
        canvas,
        x: (a.x + dx * t).round(),
        y: (a.y + dy * t).round(),
        radius: radius,
        color: color,
      );
    }
  }

  void strokePoly(
    List<math.Point<double>> pts, {
    required img.Color color,
    int thickness = 36,
  }) {
    for (var i = 0; i < pts.length; i++) {
      strokeLine(
        pts[i],
        pts[(i + 1) % pts.length],
        color: color,
        thickness: thickness,
      );
    }
  }

  void node(math.Point<double> p, {int radius = 34}) {
    img.fillCircle(
      canvas,
      x: p.x.round(),
      y: p.y.round(),
      radius: radius,
      color: emerald,
    );
  }

  // Shield (flat top → point)
  final shield = <math.Point<double>>[
    const math.Point(336, 240),
    const math.Point(688, 240),
    const math.Point(708, 430),
    const math.Point(512, 710),
    const math.Point(316, 430),
  ];
  strokePoly(shield, color: emerald, thickness: 48);

  // Inner arc
  const arcCx = 512.0;
  const arcCy = 385.0;
  const arcR = 96.0;
  for (var i = 0; i < 72; i++) {
    final t0 = math.pi + (math.pi * i / 72);
    final t1 = math.pi + (math.pi * (i + 1) / 72);
    strokeLine(
      math.Point(arcCx + math.cos(t0) * arcR, arcCy + math.sin(t0) * arcR),
      math.Point(arcCx + math.cos(t1) * arcR, arcCy + math.sin(t1) * arcR),
      color: emerald,
      thickness: 36,
    );
  }

  // Keyhole
  img.fillCircle(canvas, x: 512, y: 545, radius: 30, color: emerald);
  strokeLine(
    const math.Point(512, 560),
    const math.Point(512, 625),
    color: emerald,
    thickness: 28,
  );

  // Mesh around shield
  final nodes = <math.Point<double>>[
    const math.Point(240, 350),
    const math.Point(210, 520),
    const math.Point(290, 650),
    const math.Point(410, 770),
    const math.Point(512, 815),
    const math.Point(614, 770),
    const math.Point(770, 630),
    const math.Point(815, 455),
    const math.Point(770, 310),
  ];

  final attach = <math.Point<double>>[
    const math.Point(336, 295),
    const math.Point(316, 430),
    const math.Point(372, 610),
    const math.Point(512, 710),
    const math.Point(652, 610),
    const math.Point(708, 430),
    const math.Point(688, 295),
  ];

  strokeLine(attach[0], nodes[0], color: emerald, thickness: 30);
  strokeLine(nodes[0], nodes[1], color: emerald, thickness: 28);
  strokeLine(attach[1], nodes[1], color: emerald, thickness: 28);
  strokeLine(nodes[1], nodes[2], color: emerald, thickness: 28);
  strokeLine(attach[2], nodes[2], color: emerald, thickness: 28);
  strokeLine(nodes[2], nodes[3], color: emerald, thickness: 28);
  strokeLine(nodes[3], nodes[4], color: emerald, thickness: 28);
  strokeLine(attach[3], nodes[4], color: emerald, thickness: 30);
  strokeLine(nodes[4], nodes[5], color: emerald, thickness: 28);
  strokeLine(nodes[5], nodes[6], color: emerald, thickness: 28);
  strokeLine(attach[4], nodes[6], color: emerald, thickness: 28);
  strokeLine(nodes[6], nodes[7], color: emerald, thickness: 28);
  strokeLine(attach[5], nodes[7], color: emerald, thickness: 28);
  strokeLine(nodes[7], nodes[8], color: emerald, thickness: 28);
  strokeLine(attach[6], nodes[8], color: emerald, thickness: 30);

  for (final n in nodes) {
    node(n, radius: 32);
  }
  node(nodes[0], radius: 36);
  node(nodes[4], radius: 36);
  node(nodes[8], radius: 36);

  // Chat bubble: navy fill + cyan outline (stamped), so it stays outline-only
  const bx1 = 605.0;
  const by1 = 635.0;
  const bx2 = 870.0;
  const by2 = 825.0;
  const br = 46.0;

  img.fillRect(
    canvas,
    x1: bx1.round(),
    y1: by1.round(),
    x2: bx2.round(),
    y2: by2.round(),
    radius: br.round(),
    color: navyBottom,
  );

  // Rounded-rect outline
  strokeLine(
    math.Point(bx1 + br, by1),
    math.Point(bx2 - br, by1),
    color: cyan,
    thickness: 22,
  );
  strokeLine(
    math.Point(bx1 + br, by2),
    math.Point(bx2 - br, by2),
    color: cyan,
    thickness: 22,
  );
  strokeLine(
    math.Point(bx1, by1 + br),
    math.Point(bx1, by2 - br),
    color: cyan,
    thickness: 22,
  );
  strokeLine(
    math.Point(bx2, by1 + br),
    math.Point(bx2, by2 - br),
    color: cyan,
    thickness: 22,
  );

  void cornerArc(double ox, double oy, double start, double sweep) {
    const segs = 20;
    for (var i = 0; i < segs; i++) {
      final a0 = start + sweep * i / segs;
      final a1 = start + sweep * (i + 1) / segs;
      strokeLine(
        math.Point(ox + math.cos(a0) * br, oy + math.sin(a0) * br),
        math.Point(ox + math.cos(a1) * br, oy + math.sin(a1) * br),
        color: cyan,
        thickness: 22,
      );
    }
  }

  cornerArc(bx1 + br, by1 + br, math.pi, math.pi / 2); // TL
  cornerArc(bx2 - br, by1 + br, -math.pi / 2, math.pi / 2); // TR
  cornerArc(bx1 + br, by2 - br, math.pi / 2, math.pi / 2); // BL
  cornerArc(bx2 - br, by2 - br, 0, math.pi / 2); // BR

  // Tail outline
  strokeLine(
    const math.Point(675, by2),
    const math.Point(625, 885),
    color: cyan,
    thickness: 20,
  );
  strokeLine(
    const math.Point(625, 885),
    const math.Point(735, by2 + 6),
    color: cyan,
    thickness: 20,
  );
  img.fillPolygon(
    canvas,
    vertices: [
      img.Point(682, by2 - 2),
      img.Point(640, 865),
      img.Point(722, by2 + 2),
    ],
    color: navyBottom,
  );

  // Three dots
  img.fillCircle(canvas, x: 690, y: 730, radius: 18, color: cyan);
  img.fillCircle(canvas, x: 735, y: 730, radius: 18, color: cyan);
  img.fillCircle(canvas, x: 780, y: 730, radius: 18, color: cyan);

  final out = File('assets/icon/app_icon.png');
  out.parent.createSync(recursive: true);
  out.writeAsBytesSync(img.encodePng(canvas, level: 6));
  stdout.writeln('Wrote ${out.path}');
}

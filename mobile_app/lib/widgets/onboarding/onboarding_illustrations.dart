import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

/// Legacy mesh illustration (theme-aware). Interactive onboarding uses
/// [OnboardingDemoPanel] instead.
class MeshNetworkIllustration extends StatelessWidget {
  const MeshNetworkIllustration({super.key, required this.t});

  final double t;

  @override
  Widget build(BuildContext context) {
    final on = Theme.of(context).colorScheme.onSurface;
    return CustomPaint(
      painter: _MeshPainter(t: t, onSurface: on),
      size: const Size(280, 220),
    );
  }
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({required this.t, required this.onSurface});

  final double t;
  final Color onSurface;

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final nodes = <Offset>[
      Offset(cx, cy - 58),
      Offset(cx - 72, cy + 18),
      Offset(cx + 72, cy + 18),
      Offset(cx, cy + 62),
    ];
    const emerald = ResilNetTheme.emerald;
    const light = ResilNetTheme.channelGreen;

    final linePaint = Paint()
      ..color = emerald.withValues(alpha: 0.35)
      ..strokeWidth = 2.2
      ..style = PaintingStyle.stroke;

    for (var i = 0; i < nodes.length; i++) {
      for (var j = i + 1; j < nodes.length; j++) {
        canvas.drawLine(nodes[i], nodes[j], linePaint);
      }
    }

    for (var i = 0; i < nodes.length; i++) {
      final pulse = 1 + 0.12 * math.sin(t * math.pi * 2 + i * 1.2);
      final r = (i == 0 ? 22.0 : 16.0) * pulse;
      final glow = Paint()
        ..color = light.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(nodes[i], r + 6, glow);
      canvas.drawCircle(
        nodes[i],
        r,
        Paint()..color = i == 0 ? emerald : light,
      );
      canvas.drawCircle(
        nodes[i],
        r * 0.45,
        Paint()..color = Colors.white.withValues(alpha: 0.85),
      );
    }

    final house = RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(cx, cy + 4), width: 36, height: 28),
      const Radius.circular(6),
    );
    canvas.drawRRect(
      house,
      Paint()..color = onSurface.withValues(alpha: 0.12),
    );
  }

  @override
  bool shouldRepaint(covariant _MeshPainter old) =>
      old.t != t || old.onSurface != onSurface;
}

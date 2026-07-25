import 'dart:math' as math;

import 'package:flutter/material.dart';

/// โทนสว่างกว่าแอปหลัก แต่ยังเป็น emerald + navy
class OnboardingPalette {
  static const bgTop = Color(0xFFEAF6F2);
  static const bgBottom = Color(0xFFD4EDE4);
  static const navy = Color(0xFF0F172A);
  static const navySoft = Color(0xFF334155);
  static const emerald = Color(0xFF10B981);
  static const emeraldLight = Color(0xFF6EE7B7);
  static const card = Color(0xFFF8FFFC);
}

/// หน้า 1: เครือข่าย Mesh ในชุมชน
class MeshNetworkIllustration extends StatelessWidget {
  const MeshNetworkIllustration({super.key, required this.t});

  final double t;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MeshPainter(t: t),
      size: const Size(280, 220),
    );
  }
}

class _MeshPainter extends CustomPainter {
  _MeshPainter({required this.t});

  final double t;

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

    final linePaint = Paint()
      ..color = OnboardingPalette.emerald.withValues(alpha: 0.35)
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
        ..color = OnboardingPalette.emeraldLight.withValues(alpha: 0.35)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
      canvas.drawCircle(nodes[i], r + 6, glow);
      canvas.drawCircle(
        nodes[i],
        r,
        Paint()
          ..color = i == 0
              ? OnboardingPalette.emerald
              : OnboardingPalette.emeraldLight,
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
      Paint()..color = OnboardingPalette.navy.withValues(alpha: 0.12),
    );
  }

  @override
  bool shouldRepaint(covariant _MeshPainter old) => old.t != t;
}

/// หน้า 2: สแกน QR เพิ่มเพื่อน
class QrFriendIllustration extends StatelessWidget {
  const QrFriendIllustration({super.key, required this.t});

  final double t;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _QrPainter(t: t),
      size: const Size(280, 220),
    );
  }
}

class _QrPainter extends CustomPainter {
  _QrPainter({required this.t});

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final phone = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 130,
        height: 200,
      ),
      const Radius.circular(22),
    );
    canvas.drawRRect(
      phone,
      Paint()..color = OnboardingPalette.navy.withValues(alpha: 0.88),
    );
    canvas.drawRRect(
      phone,
      Paint()
        ..color = OnboardingPalette.emerald.withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    final qrRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2 - 8),
      width: 78,
      height: 78,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(qrRect, const Radius.circular(10)),
      Paint()..color = Colors.white,
    );

    final cell = 9.0;
    final origin = qrRect.topLeft + const Offset(10, 10);
    final pattern = [
      [1, 1, 1, 0, 1, 0, 1],
      [1, 0, 1, 0, 0, 1, 0],
      [1, 1, 1, 1, 0, 1, 1],
      [0, 1, 0, 1, 1, 0, 1],
      [1, 0, 1, 0, 1, 1, 0],
      [0, 1, 1, 1, 0, 1, 1],
    ];
    final dotPaint = Paint()..color = OnboardingPalette.navy;
    for (var r = 0; r < pattern.length; r++) {
      for (var c = 0; c < pattern[r].length; c++) {
        if (pattern[r][c] == 1) {
          canvas.drawRect(
            Rect.fromLTWH(
              origin.dx + c * cell,
              origin.dy + r * cell,
              cell - 1.5,
              cell - 1.5,
            ),
            dotPaint,
          );
        }
      }
    }

    final scanY = qrRect.top + (qrRect.height * ((t % 1.0)));
    canvas.drawLine(
      Offset(qrRect.left, scanY),
      Offset(qrRect.right, scanY),
      Paint()
        ..color = OnboardingPalette.emerald
        ..strokeWidth = 2.5,
    );

    final badge = Offset(size.width / 2 + 58, size.height / 2 - 52);
    canvas.drawCircle(badge, 18, Paint()..color = OnboardingPalette.emerald);
    canvas.drawCircle(badge, 14, Paint()..color = Colors.white);
    canvas.drawCircle(
      badge.translate(-4, 2),
      4,
      Paint()..color = OnboardingPalette.navySoft,
    );
    canvas.drawCircle(
      badge.translate(6, 2),
      4,
      Paint()..color = OnboardingPalette.navySoft,
    );
  }

  @override
  bool shouldRepaint(covariant _QrPainter old) => old.t != t;
}

/// หน้า 3: ส่งข้อความเข้ารหัส
class ChatMessageIllustration extends StatelessWidget {
  const ChatMessageIllustration({super.key, required this.t});

  final double t;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ChatPainter(t: t),
      size: const Size(280, 220),
    );
  }
}

class _ChatPainter extends CustomPainter {
  _ChatPainter({required this.t});

  final double t;

  void _bubble(Canvas canvas, RRect rect, Color color) {
    canvas.drawRRect(rect, Paint()..color = color);
    canvas.drawRRect(
      rect,
      Paint()
        ..color = OnboardingPalette.emerald.withValues(alpha: 0.2)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.2,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final card = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: 230,
        height: 170,
      ),
      const Radius.circular(20),
    );
    canvas.drawRRect(card, Paint()..color = OnboardingPalette.card);
    canvas.drawRRect(
      card,
      Paint()
        ..color = OnboardingPalette.emerald.withValues(alpha: 0.25)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );

    final slide = Curves.easeOut.transform((t * 0.8).clamp(0.0, 1.0));
    final left = RRect.fromRectAndRadius(
      Rect.fromLTWH(36, 52 - 8 * (1 - slide), 120, 34),
      const Radius.circular(14),
    );
    final right = RRect.fromRectAndRadius(
      Rect.fromLTWH(124, 98 + 10 * (1 - slide), 130, 38),
      const Radius.circular(14),
    );
    _bubble(
      canvas,
      left,
      OnboardingPalette.emeraldLight.withValues(alpha: 0.55),
    );
    _bubble(canvas, right, OnboardingPalette.emerald.withValues(alpha: 0.85));

    final emojiPaint = TextPainter(
      text: const TextSpan(text: '😊', style: TextStyle(fontSize: 18)),
      textDirection: TextDirection.ltr,
    )..layout();
    emojiPaint.paint(canvas, Offset(right.left + 12, right.top + 8));

    final send = Offset(size.width / 2 + 72, size.height / 2 + 58);
    final bob = 3 * math.sin(t * math.pi * 2);
    canvas.drawCircle(
      send.translate(0, bob),
      16,
      Paint()..color = OnboardingPalette.emerald,
    );
    final arrow = Path()
      ..moveTo(send.dx - 5, send.dy + bob - 1)
      ..lineTo(send.dx + 6, send.dy + bob)
      ..lineTo(send.dx - 5, send.dy + bob + 1)
      ..close();
    canvas.drawPath(arrow, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant _ChatPainter old) => old.t != t;
}

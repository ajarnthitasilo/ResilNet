import 'dart:math';

import 'package:flutter/material.dart';

class Identicon extends StatelessWidget {
  const Identicon({super.key, required this.id, this.size = 36});

  final String id;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = _colorFromId(id);
    final label = id.isEmpty
        ? '?'
        : id.substring(0, min(2, id.length)).toUpperCase();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.22),
        borderRadius: BorderRadius.circular(size / 3),
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.white.withValues(alpha: 0.9),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }

  Color _colorFromId(String s) {
    var h = 0;
    for (final u in s.codeUnits) {
      h = 0x1fffffff & (h + u);
      h = 0x1fffffff & (h + ((0x0007ffff & h) << 10));
      h ^= (h >> 6);
    }
    h = 0x1fffffff & (h + ((0x03ffffff & h) << 3));
    h ^= (h >> 11);
    h = 0x1fffffff & (h + ((0x00003fff & h) << 15));

    final hue = (h % 360).toDouble();
    return HSVColor.fromAHSV(1, hue, 0.62, 0.88).toColor();
  }
}

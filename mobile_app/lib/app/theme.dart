import 'package:flutter/material.dart';

class ResilNetTheme {
  static const deepNavy = Color(0xFF0F172A);
  static const deepNavy2 = Color(0xFF0B1224);
  static const emerald = Color(0xFF10B981);

  static ThemeData dark() {
    final scheme = ColorScheme.fromSeed(
      seedColor: emerald,
      brightness: Brightness.dark,
      surface: deepNavy,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme.copyWith(
        primary: emerald,
        secondary: emerald,
        surface: deepNavy,
      ),
      scaffoldBackgroundColor: deepNavy,
      appBarTheme: const AppBarTheme(
        backgroundColor: deepNavy,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF111B33),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF111B33),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: emerald, width: 1.4),
        ),
      ),
    );
  }
}

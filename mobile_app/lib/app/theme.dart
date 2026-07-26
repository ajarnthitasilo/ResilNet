import 'package:flutter/material.dart';

/// Dark, minimal ResilNet look — bitchat-inspired clarity, ResilNet emerald identity.
class ResilNetTheme {
  static const deepNavy = Color(0xFF0B1224);
  static const deepNavy2 = Color(0xFF0A0F1C);
  static const surface = Color(0xFF141C2E);
  static const surfaceSoft = Color(0xCC141C2E);
  static const emerald = Color(0xFF10B981);
  static const channelGreen = Color(0xFF3DDC84);
  static const identityOrange = Color(0xFFFF8A3D);
  static const gradientTop = Color(0xFF0B1A33);
  static const gradientBottom = Color(0xFF1A1030);

  static const scaffoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientTop, gradientBottom],
  );

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
        secondary: channelGreen,
        surface: deepNavy,
      ),
      scaffoldBackgroundColor: deepNavy,
      dividerColor: Colors.white.withValues(alpha: 0.08),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: surface.withValues(alpha: 0.55),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        selectedColor: Colors.white.withValues(alpha: 0.16),
        labelStyle: const TextStyle(color: Colors.white70, fontSize: 13),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide.none,
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white.withValues(alpha: 0.14);
            }
            return Colors.transparent;
          }),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          side: WidgetStateProperty.all(BorderSide.none),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceSoft,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: emerald.withValues(alpha: 0.5)),
        ),
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      ),
    );
  }
}

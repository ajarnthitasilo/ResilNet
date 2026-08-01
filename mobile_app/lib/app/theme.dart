import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ResilNet look — emerald identity; follows system light/dark via [ThemeMode.system].
///
/// Light mode aims for a soft **liquid glass** feel (frosted translucent panels).
/// Dark mode keeps the existing deep-navy mesh aesthetic.
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

  /// Soft cool canvas under frosted panels (not flat white).
  static const lightCanvas = Color(0xFFE8F0F6);
  static const lightSurface = Color(0xF2FFFFFF);
  static const lightGlass = Color(0xB8FFFFFF);
  static const lightGlassBorder = Color(0x66FFFFFF);
  static const lightGradientTop = Color(0xFFDCEEF0);
  static const lightGradientMid = Color(0xFFE8F2F8);
  static const lightGradientBottom = Color(0xFFF0E8F4);

  static const scaffoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientTop, gradientBottom],
  );

  static const scaffoldGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightGradientTop, lightGradientMid, lightGradientBottom],
    stops: [0.0, 0.45, 1.0],
  );

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static LinearGradient scaffoldGradientFor(BuildContext context) =>
      isDark(context) ? scaffoldGradient : scaffoldGradientLight;

  static BoxDecoration pageDecoration(BuildContext context) => BoxDecoration(
        gradient: scaffoldGradientFor(context),
      );

  static Color mutedOnSurface(BuildContext context, {double alpha = 0.55}) =>
      Theme.of(context).colorScheme.onSurface.withValues(alpha: alpha);

  /// Soft surface fill for status chips / bars (adapts to light/dark).
  static Color barSurface(BuildContext context) => isDark(context)
      ? deepNavy
      : Colors.white.withValues(alpha: 0.55);

  static Color barBorder(BuildContext context) => isDark(context)
      ? Colors.white.withValues(alpha: 0.06)
      : Colors.white.withValues(alpha: 0.65);

  /// Panel / chip fill that reads as glass in light mode.
  static Color glassFill(BuildContext context, {double darkAlpha = 0.06}) =>
      isDark(context)
          ? Colors.white.withValues(alpha: darkAlpha)
          : Colors.white.withValues(alpha: 0.55);

  static Color glassBorder(BuildContext context) => isDark(context)
      ? Colors.white.withValues(alpha: 0.08)
      : Colors.white.withValues(alpha: 0.7);

  /// Frosted panel decoration — blur when supported, solid fallback otherwise.
  static BoxDecoration glassDecoration(
    BuildContext context, {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    double blurSigma = 18,
  }) {
    final dark = isDark(context);
    return BoxDecoration(
      borderRadius: borderRadius,
      color: dark
          ? surface.withValues(alpha: 0.55)
          : Colors.white.withValues(alpha: 0.48),
      border: Border.all(
        color: dark
            ? Colors.white.withValues(alpha: 0.08)
            : Colors.white.withValues(alpha: 0.72),
      ),
      boxShadow: dark
          ? null
          : [
              BoxShadow(
                color: const Color(0xFF0F172A).withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
    );
  }

  /// Wrap [child] in a frosted glass panel (BackdropFilter + border).
  static Widget glassPanel({
    required BuildContext context,
    required Widget child,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    EdgeInsetsGeometry? padding,
    double blurSigma = 18,
  }) {
    final deco = glassDecoration(
      context,
      borderRadius: borderRadius,
      blurSigma: blurSigma,
    );
    final content = padding == null ? child : Padding(padding: padding, child: child);
    if (isDark(context)) {
      return DecoratedBox(decoration: deco, child: content);
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: DecoratedBox(decoration: deco, child: content),
      ),
    );
  }

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
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: deepNavy,
      dividerColor: Colors.white.withValues(alpha: 0.08),
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(
      seedColor: emerald,
      brightness: Brightness.light,
      surface: const Color(0xFFF7FBFD),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme.copyWith(
        primary: const Color(0xFF0D9488),
        secondary: const Color(0xFF059669),
        surface: const Color(0xF2FFFFFF),
        onSurface: const Color(0xFF0F172A),
        surfaceContainerHighest: Colors.white.withValues(alpha: 0.72),
      ),
      scaffoldBackgroundColor: lightCanvas,
      dividerColor: const Color(0xFF0F172A).withValues(alpha: 0.08),
      iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withValues(alpha: 0.35),
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: const Color(0xFF0F172A),
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        actionsIconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: Colors.white.withValues(alpha: 0.55),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: Colors.white.withValues(alpha: 0.88),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.white.withValues(alpha: 0.82),
        modalBackgroundColor: Colors.white.withValues(alpha: 0.88),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white.withValues(alpha: 0.55),
        selectedColor: emerald.withValues(alpha: 0.18),
        labelStyle: const TextStyle(color: Color(0xFF334155), fontSize: 13),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.65)),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return emerald.withValues(alpha: 0.16);
            }
            return Colors.white.withValues(alpha: 0.35);
          }),
          foregroundColor: WidgetStateProperty.all(const Color(0xFF0F172A)),
          side: WidgetStateProperty.all(
            BorderSide(color: Colors.white.withValues(alpha: 0.65)),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.62),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: emerald.withValues(alpha: 0.55)),
        ),
        hintStyle: TextStyle(
          color: const Color(0xFF0F172A).withValues(alpha: 0.35),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      ),
    );
  }
}

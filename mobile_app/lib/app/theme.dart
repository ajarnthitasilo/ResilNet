import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ResilNet look — emerald identity; follows system light/dark via [ThemeMode.system].
///
/// Soft **liquid glass** for panels, snack bars, dialogs, menus, and sheets
/// in both light and dark (frosted translucent surfaces over the mesh canvas).
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

  /// Soft cool canvas under frosted panels (never flat white).
  static const lightCanvas = Color(0xFFD4E4EC);
  static const lightSurface = Color(0xCCEAF4F8);
  static const lightGlass = Color(0x99E8F4F8);
  static const lightGlassBorder = Color(0x99FFFFFF);
  static const lightGradientTop = Color(0xFFB8D9DE);
  static const lightGradientMid = Color(0xFFD2E4F0);
  static const lightGradientBottom = Color(0xFFE0D4EA);

  static const scaffoldGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [gradientTop, gradientBottom],
  );

  static const scaffoldGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [lightGradientTop, lightGradientMid, lightGradientBottom],
    stops: [0.0, 0.48, 1.0],
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
      : const Color(0xFFEFF6FA).withValues(alpha: 0.62);

  static Color barBorder(BuildContext context) => isDark(context)
      ? Colors.white.withValues(alpha: 0.06)
      : const Color(0xFF0F172A).withValues(alpha: 0.08);

  /// Panel / chip fill that reads as glass in light mode.
  static Color glassFill(BuildContext context, {double darkAlpha = 0.06}) =>
      isDark(context)
          ? Colors.white.withValues(alpha: darkAlpha)
          : const Color(0xFFEAF4F8).withValues(alpha: 0.58);

  static Color glassBorder(BuildContext context) => isDark(context)
      ? Colors.white.withValues(alpha: 0.08)
      : Colors.white.withValues(alpha: 0.55);

  /// Frosted panel decoration — translucent fill + soft edge highlight.
  static BoxDecoration glassDecoration(
    BuildContext context, {
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(16)),
    double blurSigma = 22,
  }) {
    final dark = isDark(context);
    return BoxDecoration(
      borderRadius: borderRadius,
      color: dark
          ? surface.withValues(alpha: 0.52)
          : const Color(0xFFEAF4F8).withValues(alpha: 0.48),
      border: Border.all(
        color: dark
            ? Colors.white.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.62),
      ),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF0F172A).withValues(alpha: dark ? 0.35 : 0.08),
          blurRadius: dark ? 20 : 28,
          offset: const Offset(0, 10),
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
    double blurSigma = 22,
  }) {
    final deco = glassDecoration(
      context,
      borderRadius: borderRadius,
      blurSigma: blurSigma,
    );
    final content =
        padding == null ? child : Padding(padding: padding, child: child);
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: DecoratedBox(decoration: deco, child: content),
      ),
    );
  }

  static SnackBarThemeData _snackBarTheme(ColorScheme cs) => SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Colors.transparent,
        contentTextStyle: TextStyle(color: cs.onSurface),
        actionTextColor: cs.primary,
        disabledActionTextColor: cs.onSurface.withValues(alpha: 0.38),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        insetPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      );

  static DialogThemeData _dialogTheme({required bool dark}) => DialogThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        barrierColor: Colors.black.withValues(alpha: dark ? 0.42 : 0.28),
      );

  static PopupMenuThemeData _popupMenuTheme({required bool dark}) =>
      PopupMenuThemeData(
        color: dark
            ? surface.withValues(alpha: 0.78)
            : const Color(0xFFEAF4F8).withValues(alpha: 0.82),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(
            color: dark
                ? Colors.white.withValues(alpha: 0.14)
                : Colors.white.withValues(alpha: 0.55),
          ),
        ),
      );

  static BottomSheetThemeData _bottomSheetTheme({required bool dark}) =>
      BottomSheetThemeData(
        backgroundColor: dark
            ? surface.withValues(alpha: 0.82)
            : const Color(0xFFEAF4F8).withValues(alpha: 0.86),
        modalBackgroundColor: dark
            ? surface.withValues(alpha: 0.9)
            : const Color(0xFFF0F7FA).withValues(alpha: 0.9),
        elevation: 0,
        modalElevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
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
      snackBarTheme: _snackBarTheme(scheme.copyWith(
        primary: emerald,
        onSurface: Colors.white,
      )),
      dialogTheme: _dialogTheme(dark: true),
      popupMenuTheme: _popupMenuTheme(dark: true),
      bottomSheetTheme: _bottomSheetTheme(dark: true),
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
      surface: lightSurface,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: scheme.copyWith(
        primary: const Color(0xFF0D9488),
        secondary: const Color(0xFF059669),
        surface: lightSurface,
        onSurface: const Color(0xFF0F172A),
        surfaceContainerHighest: const Color(0xCCEAF4F8),
      ),
      scaffoldBackgroundColor: lightCanvas,
      dividerColor: const Color(0xFF0F172A).withValues(alpha: 0.08),
      iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFFEAF4F8).withValues(alpha: 0.42),
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: const Color(0xFF0F172A),
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        actionsIconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFEAF4F8).withValues(alpha: 0.55),
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.55)),
        ),
      ),
      snackBarTheme: _snackBarTheme(scheme.copyWith(
        primary: const Color(0xFF0D9488),
        onSurface: const Color(0xFF0F172A),
      )),
      dialogTheme: _dialogTheme(dark: false),
      popupMenuTheme: _popupMenuTheme(dark: false),
      bottomSheetTheme: _bottomSheetTheme(dark: false),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFEAF4F8).withValues(alpha: 0.55),
        selectedColor: emerald.withValues(alpha: 0.18),
        labelStyle: const TextStyle(color: Color(0xFF334155), fontSize: 13),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: BorderSide(color: Colors.white.withValues(alpha: 0.5)),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return emerald.withValues(alpha: 0.16);
            }
            return const Color(0xFFEAF4F8).withValues(alpha: 0.4);
          }),
          foregroundColor: WidgetStateProperty.all(const Color(0xFF0F172A)),
          side: WidgetStateProperty.all(
            BorderSide(color: Colors.white.withValues(alpha: 0.5)),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFEAF4F8).withValues(alpha: 0.62),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.55)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.55)),
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

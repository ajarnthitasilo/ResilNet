import 'package:flutter/material.dart';

/// Semantic colour tokens for ResilNet.
///
/// Screens must read colours from here (`context.tokens`) instead of writing
/// hex literals or `Colors.white54`, so light/dark both stay correct and a
/// restyle happens in one file. Values are the ones the app already shipped —
/// this is a consolidation, not a repaint.
@immutable
class ResilNetTokens extends ThemeExtension<ResilNetTokens> {
  const ResilNetTokens({
    required this.brand,
    required this.channel,
    required this.identity,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
    required this.scanning,
    required this.favorite,
    required this.readReceipt,
    required this.pickerSurface,
    required this.bubbleMine,
    required this.bubbleTheirs,
    required this.inviteBanner,
    required this.onInviteBanner,
    required this.link,
    required this.recording,
    required this.pageGradient,
  });

  /// Brand accent — identity, send button, "live" states.
  final Color brand;

  /// Public channel accent (#mesh / geo labels).
  final Color channel;

  /// Identity / key material accent.
  final Color identity;

  final Color success;
  final Color warning;
  final Color danger;
  final Color info;

  /// Radio is scanning / warming up.
  final Color scanning;

  /// Starred peer.
  final Color favorite;

  /// Double tick when the peer has read the message.
  final Color readReceipt;

  /// Emoji picker chrome.
  final Color pickerSurface;

  /// Chat bubbles.
  final Color bubbleMine;
  final Color bubbleTheirs;

  /// Inline "this looks like an invite" banner above the composer.
  final Color inviteBanner;
  final Color onInviteBanner;

  /// Tappable link / deep-link affordance inside a message.
  final Color link;

  /// Live microphone / recording indicator.
  final Color recording;

  /// Full-page background wash.
  final Gradient pageGradient;

  static const _emerald = Color(0xFF10B981);

  static const dark = ResilNetTokens(
    brand: _emerald,
    channel: Color(0xFF3DDC84),
    identity: Color(0xFFFF8A3D),
    success: _emerald,
    warning: Color(0xFFFFB74D),
    danger: Color(0xFFFF6B6B),
    info: Color(0xFF64B5F6),
    scanning: Color(0xFFFFD54F),
    favorite: Color(0xFFFFD54F),
    readReceipt: Color(0xFF53BDEB),
    pickerSurface: Color(0xFF1A2332),
    bubbleMine: Color(0x3310B981),
    bubbleTheirs: Color(0x8C141C2E),
    inviteBanner: Color(0xFF1A3A2A),
    onInviteBanner: Color(0xFFE8F5EE),
    link: Color(0xFF5AC8FA),
    recording: Color(0xFFFF3B30),
    pageGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xFF0B1A33), Color(0xFF1A1030)],
    ),
  );

  static const light = ResilNetTokens(
    brand: Color(0xFF0D9488),
    channel: Color(0xFF0F8A4C),
    identity: Color(0xFFC2560F),
    success: Color(0xFF0D9488),
    warning: Color(0xFFB4620A),
    danger: Color(0xFFC62828),
    info: Color(0xFF1565C0),
    scanning: Color(0xFF9A6B00),
    favorite: Color(0xFFC08A00),
    readReceipt: Color(0xFF1E88C7),
    pickerSurface: Color(0xFFEAF4F8),
    bubbleMine: Color(0x2E0D9488),
    bubbleTheirs: Color(0xA6EAF4F8),
    inviteBanner: Color(0xFFD6EFE2),
    onInviteBanner: Color(0xFF0F3D2A),
    link: Color(0xFF0B6CA8),
    recording: Color(0xFFC62828),
    pageGradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFB8D9DE), Color(0xFFD2E4F0), Color(0xFFE0D4EA)],
      stops: [0.0, 0.48, 1.0],
    ),
  );

  @override
  ResilNetTokens copyWith({
    Color? brand,
    Color? channel,
    Color? identity,
    Color? success,
    Color? warning,
    Color? danger,
    Color? info,
    Color? scanning,
    Color? favorite,
    Color? readReceipt,
    Color? pickerSurface,
    Color? bubbleMine,
    Color? bubbleTheirs,
    Color? inviteBanner,
    Color? onInviteBanner,
    Color? link,
    Color? recording,
    Gradient? pageGradient,
  }) {
    return ResilNetTokens(
      brand: brand ?? this.brand,
      channel: channel ?? this.channel,
      identity: identity ?? this.identity,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      info: info ?? this.info,
      scanning: scanning ?? this.scanning,
      favorite: favorite ?? this.favorite,
      readReceipt: readReceipt ?? this.readReceipt,
      pickerSurface: pickerSurface ?? this.pickerSurface,
      bubbleMine: bubbleMine ?? this.bubbleMine,
      bubbleTheirs: bubbleTheirs ?? this.bubbleTheirs,
      inviteBanner: inviteBanner ?? this.inviteBanner,
      onInviteBanner: onInviteBanner ?? this.onInviteBanner,
      link: link ?? this.link,
      recording: recording ?? this.recording,
      pageGradient: pageGradient ?? this.pageGradient,
    );
  }

  @override
  ResilNetTokens lerp(ThemeExtension<ResilNetTokens>? other, double t) {
    if (other is! ResilNetTokens) return this;
    return ResilNetTokens(
      brand: Color.lerp(brand, other.brand, t)!,
      channel: Color.lerp(channel, other.channel, t)!,
      identity: Color.lerp(identity, other.identity, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      info: Color.lerp(info, other.info, t)!,
      scanning: Color.lerp(scanning, other.scanning, t)!,
      favorite: Color.lerp(favorite, other.favorite, t)!,
      readReceipt: Color.lerp(readReceipt, other.readReceipt, t)!,
      pickerSurface: Color.lerp(pickerSurface, other.pickerSurface, t)!,
      bubbleMine: Color.lerp(bubbleMine, other.bubbleMine, t)!,
      bubbleTheirs: Color.lerp(bubbleTheirs, other.bubbleTheirs, t)!,
      inviteBanner: Color.lerp(inviteBanner, other.inviteBanner, t)!,
      onInviteBanner: Color.lerp(onInviteBanner, other.onInviteBanner, t)!,
      link: Color.lerp(link, other.link, t)!,
      recording: Color.lerp(recording, other.recording, t)!,
      pageGradient: t < 0.5 ? pageGradient : other.pageGradient,
    );
  }
}

extension ResilNetTokensX on BuildContext {
  /// Semantic colours for the current theme.
  ///
  /// Falls back to the palette matching the current brightness, so widgets
  /// still render under a bare [ThemeData] (e.g. in widget tests).
  ResilNetTokens get tokens {
    final theme = Theme.of(this);
    return theme.extension<ResilNetTokens>() ??
        (theme.brightness == Brightness.dark
            ? ResilNetTokens.dark
            : ResilNetTokens.light);
  }
}

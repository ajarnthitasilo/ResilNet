import 'dart:io' show Platform;

/// Shared platform capability checks for mobile + macOS desktop.
///
/// Windows/Linux are not mesh targets yet — callers should soft-disable BLE
/// there without blocking Nostr / identity / chat.
class PlatformCaps {
  PlatformCaps._();

  static bool get isApple => Platform.isIOS || Platform.isMacOS;

  /// CoreBluetooth-style constraints (central+peripheral duty-cycle).
  static bool get usesIosStyleBle => Platform.isIOS || Platform.isMacOS;

  /// BLE mesh / ESP32 mule path is attempted on these platforms.
  static bool get meshBleAttempted =>
      Platform.isAndroid || Platform.isIOS || Platform.isMacOS;

  /// Desktop shell (windowed) — keep Nostr-first if mesh fails.
  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  static bool get isMacOS => Platform.isMacOS;
}

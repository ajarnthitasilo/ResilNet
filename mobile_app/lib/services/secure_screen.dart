import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Blocks screenshots / screen recording on sensitive chat surfaces.
///
/// Android: [FLAG_SECURE] (captures come out black).
/// iOS: hosts FlutterView inside a secure UITextField canvas so captures
/// blank without the old window.layer reparent layout bug.
/// macOS: disables window sharing for screen capture APIs.
class SecureScreen {
  SecureScreen._();

  static const _channel = MethodChannel('com.ajarnnarin.resilnet/secure_screen');
  static int _holders = 0;

  /// Enter a sensitive screen (1:1 chat, announcement board). Ref-counted.
  static Future<void> acquire() async {
    _holders++;
    if (_holders == 1) {
      await _setEnabled(true);
    }
  }

  /// Leave a sensitive screen.
  static Future<void> release() async {
    if (_holders <= 0) return;
    _holders--;
    if (_holders == 0) {
      await _setEnabled(false);
    }
  }

  static Future<void> _setEnabled(bool enabled) async {
    if (kIsWeb) return;
    if (!(Platform.isAndroid || Platform.isIOS || Platform.isMacOS)) return;
    try {
      await _channel.invokeMethod<void>('setSecure', {'enabled': enabled});
    } catch (e) {
      debugPrint('[SecureScreen] setSecure($enabled) failed: $e');
    }
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenshot_callback_plus/flutter_screenshot_callback_plus.dart';

/// Watches OS screenshot events and notifies listeners (chat/system UX).
class ScreenshotWatchService extends ChangeNotifier
    implements IScreenshotCallback {
  ScreenshotCallback? _callback;
  bool _enabled = true;
  int _lastShotAt = 0;

  bool get enabled => _enabled;
  int get lastShotAt => _lastShotAt;

  Future<void> start({required bool enabled}) async {
    _enabled = enabled;
    await stop();
    if (!_enabled) return;
    try {
      _callback = ScreenshotCallback();
      _callback!.setInterfaceScreenshotCallback(this);
      _callback!.startScreenshot();
    } catch (e) {
      debugPrint('[ResilNet] screenshot watch unavailable: $e');
    }
  }

  Future<void> setEnabled(bool enabled) async {
    if (_enabled == enabled) return;
    await start(enabled: enabled);
  }

  Future<void> stop() async {
    try {
      _callback?.stopScreenshot();
    } catch (_) {}
    _callback = null;
  }

  @override
  void screenshotCallback(String data) {
    if (!_enabled) return;
    _lastShotAt = DateTime.now().millisecondsSinceEpoch;
    notifyListeners();
  }

  @override
  void deniedPermission() {
    debugPrint('[ResilNet] screenshot watch permission denied');
  }

  @override
  void dispose() {
    unawaited(stop());
    super.dispose();
  }
}

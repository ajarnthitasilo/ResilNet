import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:screenshot_callback/screenshot_callback.dart';

/// Watches OS screenshot events and notifies listeners (chat/system UX).
class ScreenshotWatchService extends ChangeNotifier {
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
      await _callback!.initialize();
      _callback!.addListener(() {
        _lastShotAt = DateTime.now().millisecondsSinceEpoch;
        notifyListeners();
      });
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
      await _callback?.dispose();
    } catch (_) {}
    _callback = null;
  }

  @override
  void dispose() {
    unawaited(stop());
    super.dispose();
  }
}

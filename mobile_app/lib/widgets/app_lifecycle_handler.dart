import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../services/watch_sync_service.dart';
import '../state/app_state.dart';

/// ฟัง AppLifecycle และส่งต่อให้ [AppState] reconnect เมื่อ resume
class AppLifecycleHandler extends StatefulWidget {
  const AppLifecycleHandler({super.key, required this.child});

  final Widget child;

  @override
  State<AppLifecycleHandler> createState() => _AppLifecycleHandlerState();
}

class _AppLifecycleHandlerState extends State<AppLifecycleHandler>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    context.read<AppState>().handleAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Keep Watch applicationContext warm whenever iPhone comes foreground.
      unawaited(WatchSyncService.instance.pushSnapshot());
    }
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    context.read<AppState>().onDeviceLocalesChanged();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

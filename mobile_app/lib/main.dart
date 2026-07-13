import 'dart:async';

import 'package:flutter/material.dart';

import 'app_launcher.dart' deferred as launcher;
import 'boot_splash.dart';

/// Entry เบาที่สุด — ไม่โหลด Rust/Firebase/Supabase ก่อน paint เฟรมแรก
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const BootSplashApp());

  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(_loadAndLaunch());
  });
}

Future<void> _loadAndLaunch() async {
  try {
    await launcher.loadLibrary().timeout(
      const Duration(seconds: 15),
      onTimeout: () => throw TimeoutException('loadLibrary'),
    );
    await launcher.launchFullApp();
  } catch (e, st) {
    debugPrint('[ResilNet] deferred launch failed: $e\n$st');
    runApp(
      BootSplashApp(
        errorMessage: e.toString(),
        onRetry: () {
          runApp(const BootSplashApp());
          unawaited(_loadAndLaunch());
        },
      ),
    );
  }
}

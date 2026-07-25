import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/theme.dart';
import 'screens/chat_list_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/permission_screen.dart';
import 'state/app_state.dart';
import 'widgets/app_lifecycle_handler.dart';

/// โหลดหลังเฟรม BootSplash — Rust / Nostr / BLE
Future<void> launchFullApp() async {
  final appState = AppState();
  runApp(ResilNetApp(appState: appState));
  await Future<void>.delayed(Duration.zero);
  await _bootstrap(appState);
}

Future<void> _bootstrap(AppState appState) async {
  try {
    await appState.init().timeout(
      const Duration(seconds: 25),
      onTimeout: () {
        debugPrint('[ResilNet] AppState.init timed out (25s)');
        throw TimeoutException('AppState.init');
      },
    );
    debugPrint('[ResilNet] AppState.init complete');
  } catch (e, st) {
    debugPrint('[ResilNet] startup init failed: $e\n$st');
    appState.markInitFailed(e.toString());
  }
}

class ResilNetApp extends StatelessWidget {
  const ResilNetApp({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: appState,
      child: AppLifecycleHandler(
        child: MaterialApp(
          title: 'ResilNet',
          debugShowCheckedModeBanner: false,
          theme: ResilNetTheme.dark(),
          home: Consumer<AppState>(
            builder: (context, s, _) {
              if (!s.initDone) {
                return const _BootScreen();
              }
              if (s.initError != null && !s.isReady) {
                return _BootErrorScreen(message: s.initError!);
              }
              if (!s.permissionsGranted) return const PermissionScreen();
              if (!s.onboardingCompleted) return const OnboardingScreen();
              return const ChatListScreen();
            },
          ),
        ),
      ),
    );
  }
}

class _BootScreen extends StatelessWidget {
  const _BootScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1224),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'ResilNet',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF10B981),
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 18),
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
          ],
        ),
      ),
    );
  }
}

class _BootErrorScreen extends StatelessWidget {
  const _BootErrorScreen({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1224),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.orangeAccent, size: 42),
              const SizedBox(height: 16),
              Text(
                'เริ่มระบบไม่สำเร็จ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => context.read<AppState>().retryInit(),
                child: const Text('ลองอีกครั้ง'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

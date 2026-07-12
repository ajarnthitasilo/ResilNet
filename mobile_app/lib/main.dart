import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/theme.dart';
import 'screens/chat_list_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/permission_screen.dart';
import 'services/init_supabase.dart';
import 'state/app_state.dart';
import 'widgets/app_lifecycle_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // แสดง UI ทันที — อย่า await init หนักก่อน runApp (กันหน้าขาวค้าง)
  final appState = AppState();
  runApp(ResilNetApp(appState: appState));

  // init ต่อในพื้นหลัง พร้อม timeout กันค้างถาวร
  try {
    final supabaseOk = await initSupabase().timeout(
      const Duration(seconds: 8),
      onTimeout: () {
        debugPrint('[ResilNet] Supabase init timed out — continue offline');
        return false;
      },
    );
    await appState.init(enableSupabase: supabaseOk).timeout(
      const Duration(seconds: 45),
      onTimeout: () {
        debugPrint('[ResilNet] AppState.init timed out');
        throw TimeoutException('AppState.init');
      },
    );
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
            const SizedBox(height: 14),
            Text(
              'กำลังเตรียมระบบ…',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
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
    final s = context.read<AppState>();
    return Scaffold(
      backgroundColor: const Color(0xFF0B1224),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, color: Colors.orangeAccent, size: 40),
              const SizedBox(height: 12),
              Text(
                'เริ่มระบบไม่สำเร็จ',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.white70),
              ),
              const SizedBox(height: 18),
              FilledButton(
                onPressed: () => s.retryInit(),
                child: const Text('ลองอีกครั้ง'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app/glass_overlays.dart';
import 'app/theme.dart';
import 'l10n/l10n_ext.dart';
import 'l10n/supported_locales.dart';
import 'screens/chat_list_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/permission_screen.dart';
import 'state/app_state.dart';
import 'widgets/app_lifecycle_handler.dart';
import 'widgets/board_invite_link_listener.dart';

/// โหลดหลังเฟรม BootSplash — Rust / Nostr / BLE
Future<void> launchFullApp() async {
  debugPrint('[Bootstrap] launchFullApp');
  final appState = AppState();
  runApp(ResilNetApp(appState: appState));
  await Future<void>.delayed(Duration.zero);
  await _bootstrap(appState);
}

Future<void> _bootstrap(AppState appState) async {
  try {
    debugPrint('[Bootstrap] init begin');
    await appState
        .init(reason: 'bootstrap')
        .timeout(
          const Duration(seconds: 25),
          onTimeout: () {
            debugPrint('[ResilNet] AppState.init timed out (25s)');
            throw TimeoutException('AppState.init');
          },
        );
    debugPrint('[Bootstrap] init complete');
  } catch (e, st) {
    debugPrint('[Bootstrap] init failed: $e\n$st');
    appState.markInitFailed(e.toString());
  }
}

class ResilNetApp extends StatefulWidget {
  const ResilNetApp({super.key, required this.appState});

  final AppState appState;

  @override
  State<ResilNetApp> createState() => _ResilNetAppState();
}

class _ResilNetAppState extends State<ResilNetApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: widget.appState,
      child: AppLifecycleHandler(
        child: BoardInviteLinkListener(
          navigatorKey: _navigatorKey,
          child: Consumer<AppState>(
            builder: (context, s, _) {
              return MaterialApp(
                navigatorKey: _navigatorKey,
                onGenerateTitle: (context) => context.l10n.appTitle,
                debugShowCheckedModeBanner: false,
                theme: ResilNetTheme.light(),
                darkTheme: ResilNetTheme.dark(),
                themeMode: ThemeMode.system,
                locale: s.localeOverride,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeListResolutionCallback: (deviceLocales, supported) {
                  if (s.localeOverride != null) return s.localeOverride;
                  // Follow the device automatically when Settings = system.
                  return resolveDeviceLocale(deviceLocales);
                },
                localeResolutionCallback: (deviceLocale, supported) {
                  if (s.localeOverride != null) return s.localeOverride;
                  if (deviceLocale == null) return const Locale('en');
                  return resolveDeviceLocale([deviceLocale]);
                },
                home: !s.initDone
                    ? const _BootScreen()
                    : (s.initError != null && !s.isReady)
                    ? _BootErrorScreen(message: s.initError!)
                    : !s.permissionsGranted
                    ? const PermissionScreen()
                    : !s.onboardingCompleted
                    ? const OnboardingScreen()
                    : const ChatListScreen(),
              );
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
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.appTitle,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ResilNetTheme.emerald,
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

class _BootErrorScreen extends StatefulWidget {
  const _BootErrorScreen({required this.message});

  final String message;

  @override
  State<_BootErrorScreen> createState() => _BootErrorScreenState();
}

class _BootErrorScreenState extends State<_BootErrorScreen> {
  bool _recovering = false;

  Future<void> _runRecovery() async {
    final l10n = context.l10n;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return GlassAlertDialog(
          title: Text(l10n.bootRecoveryConfirmTitle),
          content: Text(l10n.bootRecoveryConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              child: Text(l10n.bootRecoveryAction),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !mounted) return;

    setState(() => _recovering = true);
    try {
      await context.read<AppState>().recoverFromBootFailure();
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(GlassSnackBar(content: Text(l10n.bootRecoverySuccess)));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(GlassSnackBar(content: Text(l10n.bootRecoveryFailed('$e'))));
    } finally {
      if (mounted) {
        setState(() => _recovering = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.orangeAccent,
                size: 42,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.bootFailedTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                widget.message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _recovering
                    ? null
                    : () => context.read<AppState>().retryInit(),
                child: Text(l10n.retry),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _recovering ? null : _runRecovery,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side: const BorderSide(color: Colors.redAccent),
                ),
                child: Text(l10n.bootRecoveryAction),
              ),
              if (_recovering) ...[
                const SizedBox(height: 16),
                const SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.bootRecoveryRunning,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

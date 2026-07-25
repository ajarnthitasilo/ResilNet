import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'l10n/l10n_ext.dart';

/// Boot UI เบาที่สุด — ไม่ import AppState / Rust / Nostr
/// ใช้ภาษาของระบบจนกว่าแอปเต็มจะโหลด preference
class BootSplashApp extends StatelessWidget {
  const BootSplashApp({super.key, this.errorMessage, this.onRetry});

  final String? errorMessage;
  final VoidCallback? onRetry;

  static const _bg = Color(0xFF0B1224);
  static const _accent = Color(0xFF10B981);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Builder(
        builder: (context) {
          final l10n = context.l10n;
          return Scaffold(
            backgroundColor: _bg,
            body: Center(
              child: errorMessage == null
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          l10n.appTitle,
                          style: const TextStyle(
                            color: _accent,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 18),
                        const SizedBox(
                          width: 28,
                          height: 28,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: _accent,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          l10n.preparingSystem,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.orangeAccent,
                            size: 40,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.bootFailedTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            errorMessage!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          if (onRetry != null) ...[
                            const SizedBox(height: 18),
                            FilledButton(
                              onPressed: onRetry,
                              child: Text(l10n.retry),
                            ),
                          ],
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}

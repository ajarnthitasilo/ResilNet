import 'package:flutter/material.dart';

/// Boot UI เบาที่สุด — ไม่ import AppState / Rust / Firebase / Supabase
class BootSplashApp extends StatelessWidget {
  const BootSplashApp({super.key, this.errorMessage, this.onRetry});

  final String? errorMessage;
  final VoidCallback? onRetry;

  static const _bg = Color(0xFF0B1224);
  static const _accent = Color(0xFF10B981);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResilNet',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _bg,
        body: Center(
          child: errorMessage == null
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'ResilNet',
                      style: TextStyle(
                        color: _accent,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 18),
                    SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: _accent,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'กำลังเตรียมระบบ…',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.error_outline,
                          color: Colors.orangeAccent, size: 40),
                      const SizedBox(height: 12),
                      const Text(
                        'เริ่มระบบไม่สำเร็จ',
                        style: TextStyle(
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
                          child: const Text('ลองอีกครั้ง'),
                        ),
                      ],
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

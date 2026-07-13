import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'supabase_config.dart';

/// เรียกใช้ครั้งเดียวตอนเริ่มแอป
///
/// ถ้ายังไม่ได้ใส่ URL/Key จริง หรือเน็ตช้า จะข้ามไป (แอปยังใช้ BLE/offline ได้)
Future<bool> initSupabase() async {
  final url = SupabaseConfig.url.trim();
  final key = SupabaseConfig.anonKey.trim();

  final looksPlaceholder =
      url.contains('[') ||
      key.contains('[') ||
      url.isEmpty ||
      key.isEmpty ||
      !url.startsWith('https://') ||
      url.contains('/rest/v1');

  if (looksPlaceholder) {
    debugPrint('[ResilNet] Supabase skipped: URL/key not configured correctly');
    return false;
  }

  try {
    await Supabase.initialize(
      url: url,
      publishableKey: key,
    ).timeout(const Duration(seconds: 3));
    debugPrint('[ResilNet] Supabase initialized');
    return true;
  } catch (e, st) {
    debugPrint('[ResilNet] Supabase init failed/timeout: $e\n$st');
    return false;
  }
}

/// สร้าง session แบบ anonymous เพื่อ INSERT ผ่าน RLS `authenticated`
Future<void> ensureSupabaseAuthSession() async {
  try {
    final client = Supabase.instance.client;
    if (client.auth.currentSession != null) return;
    await client.auth.signInAnonymously().timeout(const Duration(seconds: 3));
    debugPrint('[ResilNet] Supabase anonymous session ready');
  } catch (e, st) {
    debugPrint('[ResilNet] Supabase anonymous sign-in failed: $e\n$st');
  }
}

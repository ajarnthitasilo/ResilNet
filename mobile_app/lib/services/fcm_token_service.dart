import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/push_signal.dart';
import 'supabase_config.dart';

/// Register and refresh FCM device tokens in `users_profiles`.
class FcmTokenService {
  FcmTokenService({required this.supabase});

  final SupabaseClient supabase;

  Future<void> upsertToken({
    required String userId,
    required String fcmToken,
  }) async {
    if (userId.isEmpty || fcmToken.isEmpty) return;

    final platform = Platform.isIOS
        ? 'ios'
        : Platform.isAndroid
            ? 'android'
            : 'unknown';

    await supabase.from(SupabaseConfig.usersProfilesTable).upsert({
      'user_id': userId,
      'fcm_token': fcmToken,
      'platform': platform,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    });
    debugPrint('[FcmToken] upserted token for user=$userId platform=$platform');
  }

  Future<void> clearToken(String userId) async {
    if (userId.isEmpty) return;
    await supabase
        .from(SupabaseConfig.usersProfilesTable)
        .update({'fcm_token': null})
        .eq('user_id', userId);
  }
}

/// Invoke zero-knowledge push trigger (metadata only — no ciphertext).
class PushTriggerService {
  PushTriggerService({required this.supabase});

  final SupabaseClient supabase;

  Future<void> sendMessageSignal({
    required String receiverId,
    required String senderId,
    required String messageId,
  }) async {
    if (receiverId.isEmpty || messageId.isEmpty) return;
    try {
      await supabase.functions.invoke(
        SupabaseConfig.sendPushSignalFunction,
        body: {
          'type': PushSignalType.msgSignal,
          'receiver_id': receiverId,
          'sender_id': senderId,
          'message_id': messageId,
        },
      );
      debugPrint(
        '[PushTrigger] signal sent receiver=$receiverId msg=$messageId',
      );
    } catch (e) {
      debugPrint('[PushTrigger] invoke failed (non-fatal): $e');
    }
  }
}

/// Verify FCM wire payloads never leak plaintext (used in tests + debug).
class PushPayloadPrivacyGuard {
  PushPayloadPrivacyGuard._();

  static const forbiddenKeys = {
    'content',
    'text',
    'body',
    'message',
    'encrypted_payload',
    'encrypted_key',
    'plaintext',
  };

  static bool isMetadataOnly(Map<String, dynamic> data) {
    for (final key in data.keys) {
      final lower = key.toLowerCase();
      if (forbiddenKeys.contains(lower)) return false;
      final value = data[key];
      if (value is String && _looksLikePlaintext(value)) return false;
    }
    return data.containsKey('message_id') || data.containsKey('sender_id');
  }

  static bool _looksLikePlaintext(String value) {
    if (value.length < 8) return false;
    try {
      base64Decode(value);
      return false;
    } catch (_) {
      return value.contains(' ') && !value.startsWith('cloud:');
    }
  }
}

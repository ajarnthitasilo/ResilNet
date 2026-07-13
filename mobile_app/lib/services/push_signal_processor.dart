import 'package:flutter/foundation.dart';

import '../models/chat_message.dart';
import '../models/push_signal.dart';
import 'crypto_service.dart';
import 'database_service.dart';
import 'notification_service.dart';
import 'supabase_sync_service.dart';

/// Fetch encrypted cloud row → decrypt on-device → show local notification.
class PushSignalProcessor {
  PushSignalProcessor({
    required this.database,
    required this.crypto,
    required this.notifications,
    required this.myUserId,
    this.supabaseSync,
    this.notificationsEnabled = true,
    this.isAppInForeground,
  });

  final DatabaseService database;
  final CryptoService crypto;
  final NotificationService notifications;
  final String myUserId;
  SupabaseSyncService? supabaseSync;
  bool notificationsEnabled;
  final bool Function()? isAppInForeground;

  Future<void> handleSignal(PushSignal signal) async {
    if (!signal.isMessageSignal) return;
    if (!notificationsEnabled) return;
    if (signal.senderId == myUserId) return;
    if (signal.messageId.isEmpty) return;

    try {
      final cloudId = int.tryParse(signal.messageId);
      if (cloudId == null) return;

      ChatMessage? msg = await database.getMessageByCloudId(cloudId);
      if (msg == null) {
        final sync = supabaseSync;
        if (sync == null) {
          await _showGeneric(signal);
          return;
        }
        msg = await sync.fetchAndIngestDirectMessage(cloudId);
      }

      if (msg == null) {
        await _showGeneric(signal);
        return;
      }

      if (msg.receiverId != myUserId) return;
      if (await database.isPeerBlocked(msg.senderId)) return;

      final body = _decryptPreview(msg);
      await notifications.showDirectMessage(
        id: cloudId % 2147483647,
        title: PushNotificationCopy.title,
        body: body,
      );
    } catch (e, st) {
      debugPrint('[PushSignal] handle failed: $e\n$st');
      await _showGeneric(signal);
    }
  }

  String _decryptPreview(ChatMessage msg) {
    if (msg.payloadKind == 'audio') {
      return '🎤 ข้อความเสียง';
    }
    try {
      final plain = crypto.decryptFromSender(
        encryptedPayload: msg.encryptedPayload,
        encryptedKey: msg.encryptedKey,
      );
      final snippet = plain.length > 80 ? '${plain.substring(0, 80)}…' : plain;
      return snippet;
    } catch (_) {
      return PushNotificationCopy.genericBody;
    }
  }

  Future<void> _showGeneric(PushSignal signal) async {
    await notifications.showDirectMessage(
      id: signal.messageId.hashCode.abs() % 2147483647,
      title: PushNotificationCopy.title,
      body: PushNotificationCopy.genericBody,
    );
  }

  /// Foreground realtime path — skip if user is already viewing chat.
  Future<void> handleIngestedDirectMessage(ChatMessage msg) async {
    if (!notificationsEnabled) return;
    if (msg.receiverId != myUserId) return;
    if (msg.senderId == myUserId) return;
    if (isAppInForeground?.call() ?? false) return;
    if (await database.isPeerBlocked(msg.senderId)) return;

    final body = _decryptPreview(msg);
    final id = (msg.cloudId ?? msg.timestamp) % 2147483647;
    await notifications.showDirectMessage(
      id: id,
      title: PushNotificationCopy.title,
      body: body,
    );
  }
}

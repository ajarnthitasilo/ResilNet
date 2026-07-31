import 'package:flutter/widgets.dart';

import '../models/chat_message.dart';
import 'payload_kinds.dart';

/// Pure rules for when to fire a local 1:1 DM notification.
class DirectMessageNotify {
  DirectMessageNotify._();

  /// Avoid colliding with [NotificationService.presenceSummaryNotificationId].
  static const _presenceSummaryId = 71001;

  static int notificationId(String msgId) {
    var id = msgId.hashCode & 0x7fffffff;
    if (id == 0 || id == _presenceSummaryId) {
      id = (id ^ 0x5f3759df) & 0x7fffffff;
      if (id == 0) id = 71002;
    }
    return id;
  }

  /// Whether a local banner should be shown for this inbound envelope.
  static bool shouldNotify({
    required bool notificationsEnabled,
    required bool isReady,
    required AppLifecycleState lifecycle,
    required String? activeChatPeerId,
    required String myUserId,
    required ChatMessage msg,
    required Set<String> alreadyNotifiedIds,
  }) {
    if (!notificationsEnabled || !isReady) return false;
    if (myUserId.isEmpty) return false;
    if (msg.receiverId != myUserId || msg.senderId == myUserId) return false;
    if (msg.type != MessageType.direct) return false;
    if (!PayloadKinds.isPrivateDm(msg.payloadKind)) return false;
    if (msg.id.trim().isEmpty) return false;
    if (alreadyNotifiedIds.contains(msg.id)) return false;

    final foreground = lifecycle == AppLifecycleState.resumed;
    if (foreground &&
        activeChatPeerId != null &&
        activeChatPeerId == msg.senderId) {
      return false;
    }
    return true;
  }
}

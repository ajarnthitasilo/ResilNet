/// Privacy-first push signal metadata (zero plaintext on FCM/APNs wire)
class PushSignalType {
  static const msgSignal = 'MSG_SIGNAL';
}

/// Generic notification copy — never includes decrypted content on the wire.
class PushNotificationCopy {
  static const title = 'ResilNet';
  static const genericBody = 'คุณมีข้อความใหม่';
  static const genericBodyEn = 'You have a new message';

  static String bodyForLocale(String? languageCode) =>
      languageCode == 'en' ? genericBodyEn : genericBody;
}

/// Parsed FCM/APNs data payload (metadata only).
class PushSignal {
  const PushSignal({
    required this.type,
    required this.senderId,
    required this.messageId,
  });

  final String type;
  final String senderId;
  final String messageId;

  bool get isMessageSignal => type == PushSignalType.msgSignal;

  /// Build zero-knowledge FCM `data` map (no plaintext).
  Map<String, String> toDataPayload() => {
        'type': type,
        'sender_id': senderId,
        'message_id': messageId,
      };

  factory PushSignal.fromRemoteData(Map<String, dynamic> data) {
    return PushSignal(
      type: data['type'] as String? ?? PushSignalType.msgSignal,
      senderId: data['sender_id'] as String? ?? '',
      messageId: data['message_id'] as String? ?? '',
    );
  }

  /// Edge Function / webhook body (metadata only).
  Map<String, String> toTriggerBody() => {
        'type': type,
        'sender_id': senderId,
        'receiver_id': '', // filled by caller
        'message_id': messageId,
      };
}

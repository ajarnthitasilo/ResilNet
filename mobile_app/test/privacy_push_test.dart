import 'package:flutter_test/flutter_test.dart';

import 'package:resilnet/models/push_signal.dart';
import 'package:resilnet/services/fcm_token_service.dart';

void main() {
  group('Privacy-first push payloads', () {
    test('PushSignal data payload contains metadata only', () {
      const signal = PushSignal(
        type: PushSignalType.msgSignal,
        senderId: 'sender-hash-abc',
        messageId: '42',
      );

      final data = signal.toDataPayload();
      expect(data['type'], PushSignalType.msgSignal);
      expect(data['sender_id'], 'sender-hash-abc');
      expect(data['message_id'], '42');
      expect(data.containsKey('content'), isFalse);
      expect(data.containsKey('encrypted_payload'), isFalse);
      expect(data.containsKey('encrypted_key'), isFalse);
    });

    test('PushPayloadPrivacyGuard rejects plaintext fields', () {
      expect(
        PushPayloadPrivacyGuard.isMetadataOnly({
          'type': 'MSG_SIGNAL',
          'sender_id': 'abc',
          'message_id': '99',
        }),
        isTrue,
      );

      expect(
        PushPayloadPrivacyGuard.isMetadataOnly({
          'type': 'MSG_SIGNAL',
          'sender_id': 'abc',
          'message_id': '99',
          'content': 'secret hello world',
        }),
        isFalse,
      );

      expect(
        PushPayloadPrivacyGuard.isMetadataOnly({
          'type': 'MSG_SIGNAL',
          'encrypted_payload': 'YWJjZGVm',
        }),
        isFalse,
      );
    });

    test('generic notification copy never includes sender plaintext', () {
      expect(PushNotificationCopy.title, 'ResilNet');
      expect(PushNotificationCopy.genericBody, 'คุณมีข้อความใหม่');
      expect(PushNotificationCopy.genericBody.contains('sender'), isFalse);
    });

    test('PushSignal.fromRemoteData round-trips FCM data map', () {
      final signal = PushSignal.fromRemoteData({
        'type': 'MSG_SIGNAL',
        'sender_id': 'peer-1',
        'message_id': '1001',
      });
      expect(signal.isMessageSignal, isTrue);
      expect(signal.senderId, 'peer-1');
      expect(signal.messageId, '1001');
    });
  });
}

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/direct_message_notify.dart';
import 'package:resilnet/core/payload_kinds.dart';
import 'package:resilnet/models/chat_message.dart';

ChatMessage _dm({
  required String id,
  required String sender,
  required String receiver,
  String kind = PayloadKinds.text,
}) {
  return ChatMessage(
    id: id,
    senderId: sender,
    receiverId: receiver,
    encryptedPayload: 'e',
    encryptedKey: 'k',
    ttl: 5,
    timestamp: 1,
    status: MessageStatus.delivered,
    type: MessageType.direct,
    payloadKind: kind,
  );
}

void main() {
  const me = 'me';
  const peer = 'peer';

  test('notifies when backgrounded', () {
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.paused,
        activeChatPeerId: null,
        myUserId: me,
        msg: _dm(id: '1', sender: peer, receiver: me),
        alreadyNotifiedIds: {},
      ),
      isTrue,
    );
  });

  test('skips when viewing that peer in foreground', () {
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.resumed,
        activeChatPeerId: peer,
        myUserId: me,
        msg: _dm(id: '1', sender: peer, receiver: me),
        alreadyNotifiedIds: {},
      ),
      isFalse,
    );
  });

  test('notifies in foreground when another chat is open', () {
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.resumed,
        activeChatPeerId: 'other',
        myUserId: me,
        msg: _dm(id: '1', sender: peer, receiver: me),
        alreadyNotifiedIds: {},
      ),
      isTrue,
    );
  });

  test('skips toggle off, outbound, presence, and dedupe', () {
    final msg = _dm(id: '1', sender: peer, receiver: me);
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: false,
        isReady: true,
        lifecycle: AppLifecycleState.paused,
        activeChatPeerId: null,
        myUserId: me,
        msg: msg,
        alreadyNotifiedIds: {},
      ),
      isFalse,
    );
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.paused,
        activeChatPeerId: null,
        myUserId: me,
        msg: _dm(id: '2', sender: me, receiver: peer),
        alreadyNotifiedIds: {},
      ),
      isFalse,
    );
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.paused,
        activeChatPeerId: null,
        myUserId: me,
        msg: _dm(id: '3', sender: peer, receiver: me, kind: PayloadKinds.presence),
        alreadyNotifiedIds: {},
      ),
      isFalse,
    );
    expect(
      DirectMessageNotify.shouldNotify(
        notificationsEnabled: true,
        isReady: true,
        lifecycle: AppLifecycleState.paused,
        activeChatPeerId: null,
        myUserId: me,
        msg: msg,
        alreadyNotifiedIds: {'1'},
      ),
      isFalse,
    );
  });

  test('notificationId is stable and avoids presence summary id', () {
    final a = DirectMessageNotify.notificationId('abc');
    final b = DirectMessageNotify.notificationId('abc');
    expect(a, b);
    expect(a, isNot(71001));
    expect(a, greaterThan(0));
  });
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/chat_message.dart';
import '../screens/chat_screen.dart';
import '../state/app_state.dart';

/// Bridges AppState ↔ Apple Watch via MethodChannel + WatchConnectivity (iOS).
///
/// Watch UI is native SwiftUI; crypto/mesh always run on the iPhone.
class WatchSyncService {
  WatchSyncService._();

  static const _channel = MethodChannel('com.ajarnnarin.resilnet/watch');
  static const maxShortTextChars = 160;
  static const _maxChats = 12;
  static const _maxMessages = 20;

  static WatchSyncService? _instance;
  static WatchSyncService get instance => _instance ??= WatchSyncService._();

  AppState? _appState;
  GlobalKey<NavigatorState>? _navigatorKey;
  Timer? _debounce;
  Timer? _retryTimer;
  Timer? _heartbeat;
  bool _bound = false;
  bool _lastPushOk = false;
  int _pushAttempts = 0;

  bool get _supported =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  bool get lastPushOk => _lastPushOk;

  void bind({
    required AppState appState,
    required GlobalKey<NavigatorState> navigatorKey,
  }) {
    if (!_supported) return;
    _appState = appState;
    _navigatorKey = navigatorKey;
    if (!_bound) {
      _bound = true;
      _channel.setMethodCallHandler(_onMethodCall);
      appState.addListener(_onAppStateChanged);
      debugPrint('[WatchSync] bound handler');
      _heartbeat?.cancel();
      // Keep Watch warm while iPhone app is alive.
      _heartbeat = Timer.periodic(const Duration(seconds: 8), (_) {
        unawaited(pushSnapshot());
      });
    }
    unawaited(_pushBurst());
  }

  void dispose() {
    _debounce?.cancel();
    _retryTimer?.cancel();
    _heartbeat?.cancel();
    _appState?.removeListener(_onAppStateChanged);
    _bound = false;
  }

  void _onAppStateChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 450), () {
      unawaited(pushSnapshot());
    });
  }

  /// Push several times after bind/resume until native ack succeeds.
  Future<void> _pushBurst() async {
    _retryTimer?.cancel();
    for (var i = 0; i < 12; i++) {
      await pushSnapshot();
      if (_lastPushOk) {
        debugPrint('[WatchSync] push ok on attempt ${i + 1}');
        return;
      }
      await Future<void>.delayed(Duration(milliseconds: 500 + (i * 250)));
    }
    _retryTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_lastPushOk) {
        _retryTimer?.cancel();
        return;
      }
      unawaited(pushSnapshot());
    });
  }

  Future<dynamic> _onMethodCall(MethodCall call) async {
    debugPrint('[WatchSync] native->dart ${call.method}');
    final s = _appState;
    if (s == null || !s.myUserIdReady) {
      return {'ok': false, 'error': 'phone_not_ready'};
    }
    switch (call.method) {
      case 'requestSnapshot':
        final ok = await pushSnapshot();
        return {'ok': ok};
      case 'sendShortText':
        Map<String, dynamic> args = {};
        final raw = call.arguments;
        if (raw is Map) {
          args = raw.map((k, v) => MapEntry(k.toString(), v));
        }
        final peerId = (args['peerId'] as String?)?.trim() ?? '';
        final text = (args['text'] as String?)?.trim() ?? '';
        debugPrint(
          '[WatchSync] sendShortText peer=${peerId.length > 8 ? peerId.substring(0, 8) : peerId} len=${text.length}',
        );
        if (peerId.isEmpty || text.isEmpty) {
          return {'ok': false, 'error': 'invalid_args'};
        }
        if (text.length > maxShortTextChars) {
          return {'ok': false, 'error': 'too_long'};
        }
        if (!s.e2eeEnabled) {
          return {'ok': false, 'error': 'e2ee_off'};
        }
        try {
          final peer = await s.resolveMessageablePeer(peerId);
          final pub = peer?.publicKey.trim() ?? '';
          if (peer == null || pub.isEmpty) {
            return {'ok': false, 'error': 'no_peer_key'};
          }
          final sent = await s.sendSealedTextToPeer(peerId: peerId, text: text);
          if (sent) {
            await pushSnapshot();
            return {'ok': true, 'error': null};
          }
          return {'ok': false, 'error': 'send_failed'};
        } catch (e) {
          debugPrint('[WatchSync] sendShortText error: $e');
          return {'ok': false, 'error': 'send_failed'};
        }
      case 'openChat':
        final args = (call.arguments as Map?)?.cast<String, dynamic>() ?? {};
        final peerId = (args['peerId'] as String?)?.trim() ?? '';
        if (peerId.isEmpty) return {'ok': false, 'error': 'invalid_args'};
        final opened = _openChatOnPhone(peerId);
        return {
          'ok': opened,
          'error': opened ? null : 'phone_ui_unavailable',
        };
      default:
        throw MissingPluginException(call.method);
    }
  }

  bool _openChatOnPhone(String peerId) {
    final nav = _navigatorKey?.currentState;
    if (nav == null) return false;
    nav.push(
      MaterialPageRoute<void>(
        builder: (_) => ChatScreen(peerId: peerId),
      ),
    );
    return true;
  }

  Future<bool> pushSnapshot() async {
    if (!_supported) return false;
    final s = _appState;
    // Identity alone is enough for Status tab — don't wait for full mesh/nostr ready.
    if (s == null || !s.myUserIdReady) {
      debugPrint('[WatchSync] push skip idReady=${s?.myUserIdReady}');
      return false;
    }
    _pushAttempts++;
    try {
      final snapshot = await _buildSnapshot(s);
      // JSON string avoids NSDictionary cast failures on the iOS side.
      final result = await _channel.invokeMethod<dynamic>(
        'updateSnapshotJson',
        jsonEncode(snapshot),
      );
      final resultMap = result is Map ? Map<String, dynamic>.from(result) : null;
      final ackOk = resultMap?['ok'] == true;
      final ackId = resultMap?['identityShort']?.toString() ?? '';
      if (!ackOk || ackId.isEmpty) {
        _lastPushOk = false;
        debugPrint('[WatchSync] push rejected by native: $result');
        return false;
      }
      _lastPushOk = true;
      final chats = (snapshot['chats'] as List?)?.length ?? 0;
      debugPrint(
        '[WatchSync] pushed #$_pushAttempts id=$ackId chats=$chats',
      );
      _retryTimer?.cancel();
      return true;
    } on MissingPluginException catch (e) {
      _lastPushOk = false;
      debugPrint('[WatchSync] MissingPluginException: $e');
      return false;
    } catch (e) {
      _lastPushOk = false;
      debugPrint('[WatchSync] pushSnapshot failed: $e');
      return false;
    }
  }

  Future<Map<String, dynamic>> _buildSnapshot(AppState s) async {
    final myId = s.myUserId;
    final shortId = myId.length <= 8 ? myId : myId.substring(0, 8);
    final chats = <Map<String, dynamic>>[];

    try {
      final peerIds = await s.db.getChatPeersFor(myId);
      for (final peerId in peerIds.take(_maxChats)) {
        final msgs = await s.db.getConversation(myId, peerId);
        final recent = msgs.length > _maxMessages
            ? msgs.sublist(msgs.length - _maxMessages)
            : msgs;
        var unread = 0;
        for (final m in msgs) {
          if (m.receiverId == myId &&
              (m.status == MessageStatus.delivered ||
                  m.status == MessageStatus.sent)) {
            unread++;
          }
        }
        final last = recent.isEmpty ? null : recent.last;
        chats.add({
          'peerId': peerId,
          'name': s.peerDisplayLabel(peerId),
          'unread': unread,
          'lastPreview': _preview(last),
          'lastTs': last?.timestamp ?? 0,
          'messages': [
            for (final m in recent)
              {
                'id': m.id,
                'fromMe': m.senderId == myId,
                'text': _preview(m),
                'ts': m.timestamp,
              },
          ],
        });
      }
    } catch (e) {
      debugPrint('[WatchSync] chat snapshot partial: $e');
    }

    return {
      'identityShort': shortId,
      'displayName': s.displayName,
      'transport': s.transportMode.name,
      'unreadDirects': s.unreadDirectCount,
      'onlineCount': s.isReady ? s.peersOnlineInSelectedArea().length : 0,
      'updatedAt': DateTime.now().millisecondsSinceEpoch,
      'chats': chats,
      'phoneReady': true,
    };
  }

  String _preview(ChatMessage? m) {
    if (m == null) return '';
    final raw = (m.content ?? '').trim();
    if (raw.isEmpty) {
      final kind = m.payloadKind;
      if (kind.contains('image')) return '[image]';
      if (kind.contains('voice') || kind.contains('audio')) return '[voice]';
      return '[message]';
    }
    if (raw.length <= 120) return raw;
    return '${raw.substring(0, 117)}…';
  }
}

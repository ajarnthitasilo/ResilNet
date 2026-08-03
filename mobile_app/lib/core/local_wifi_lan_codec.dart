import 'dart:convert';
import 'dart:typed_data';

import '../models/chat_message.dart';

/// ResilNet phone↔phone LAN over UDP (not ESP32 SoftAP gateway :4210).
class LocalWifiLanCodec {
  LocalWifiLanCodec._();

  static const port = 4211;
  static const version = 1;
  static const typeAnnounce = 'a';
  static const typeMessage = 'm';

  /// Peer announce / presence on the LAN.
  static Uint8List encodeAnnounce({
    required String peerId,
    required String compactPk,
    required String nick,
    required int timestampMs,
  }) {
    final map = <String, Object?>{
      'v': version,
      't': typeAnnounce,
      'id': peerId,
      'pk': compactPk,
      'n': nick,
      'ts': timestampMs,
    };
    return Uint8List.fromList(utf8.encode(jsonEncode(map)));
  }

  static LocalWifiAnnounce? decodeAnnounce(Uint8List bytes) {
    final map = _decodeMap(bytes);
    if (map == null || map['t'] != typeAnnounce) return null;
    final id = (map['id'] as String?)?.trim() ?? '';
    final pk = (map['pk'] as String?)?.trim() ?? '';
    if (id.isEmpty || pk.isEmpty) return null;
    return LocalWifiAnnounce(
      peerId: id,
      compactPk: pk,
      nick: (map['n'] as String?)?.trim() ?? '',
      timestampMs: (map['ts'] as num?)?.toInt() ?? 0,
    );
  }

  /// Sealed chat envelope (same map shape as [ChatMessage.toMap] on the wire).
  static Uint8List encodeMessage({
    required String messageId,
    required String fromId,
    required String toId,
    required Map<String, Object?> messageMap,
    required int timestampMs,
  }) {
    final body = base64Encode(utf8.encode(jsonEncode(messageMap)));
    final map = <String, Object?>{
      'v': version,
      't': typeMessage,
      'id': messageId,
      'from': fromId,
      'to': toId,
      'body': body,
      'ts': timestampMs,
    };
    return Uint8List.fromList(utf8.encode(jsonEncode(map)));
  }

  static ChatMessage? decodeMessage(Uint8List bytes) {
    final map = _decodeMap(bytes);
    if (map == null || map['t'] != typeMessage) return null;
    final bodyB64 = (map['body'] as String?)?.trim() ?? '';
    if (bodyB64.isEmpty) return null;
    try {
      final raw = utf8.decode(base64Decode(bodyB64));
      final msgMap = jsonDecode(raw);
      if (msgMap is! Map) return null;
      final asMap = <String, Object?>{};
      msgMap.forEach((k, v) {
        asMap['$k'] = v;
      });
      return ChatMessage.fromMap(asMap);
    } catch (_) {
      return null;
    }
  }

  static Map<String, dynamic>? _decodeMap(Uint8List bytes) {
    try {
      final raw = utf8.decode(bytes);
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      final v = (decoded['v'] as num?)?.toInt() ?? 0;
      if (v != version) return null;
      return Map<String, dynamic>.from(decoded);
    } catch (_) {
      return null;
    }
  }
}

class LocalWifiAnnounce {
  const LocalWifiAnnounce({
    required this.peerId,
    required this.compactPk,
    required this.nick,
    required this.timestampMs,
  });

  final String peerId;
  final String compactPk;
  final String nick;
  final int timestampMs;
}

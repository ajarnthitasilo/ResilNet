import 'dart:convert';

/// Pure Meshtastic MQTT JSON helpers (no broker I/O).
///
/// Uplink (gateway → MQTT) text shape (approx.):
/// ```json
/// {
///   "type": "text",
///   "from": 123,
///   "sender": "!aabbccdd",
///   "payload": { "text": "hello" }
/// }
/// ```
///
/// Downlink (MQTT → gateway `sendtext`):
/// ```json
/// {
///   "from": <gateway decimal node id>,
///   "type": "sendtext",
///   "payload": "hello",
///   "channel": 0
/// }
/// ```
/// See https://meshtastic.org/docs/software/integrations/mqtt/

class MeshtasticMqttParsedText {
  const MeshtasticMqttParsedText({
    required this.text,
    this.fromId,
    this.type,
  });

  final String text;
  final String? fromId;
  final String? type;
}

/// Non-text uplink types we intentionally skip.
const Set<String> kMeshtasticMqttIgnoredTypes = {
  'sendposition',
  'telemetry',
  'nodeinfo',
  'position',
  'waypoint',
  'neighborinfo',
  'traceroute',
  'detection',
  'paxcounter',
  'remotehardware',
  'range_test',
  'storeforward',
};

/// Build JSON topic root: `msh/2/json` or `msh/{region}/2/json`.
String buildMeshtasticJsonTopicRoot({String? region}) {
  final r = (region ?? '').trim();
  if (r.isEmpty) return 'msh/2/json';
  return 'msh/$r/2/json';
}

/// Resolve topic root for Apply: Region wins when set; else free-form root.
String resolveMeshtasticTopicRoot({
  String? region,
  String? topicRoot,
}) {
  final r = (region ?? '').trim();
  if (r.isNotEmpty) {
    return buildMeshtasticJsonTopicRoot(region: r);
  }
  final root = (topicRoot ?? '').trim().replaceAll(RegExp(r'/+$'), '');
  if (root.isNotEmpty) return root;
  return buildMeshtasticJsonTopicRoot();
}

/// Subscribe wildcard under the JSON root.
String buildMeshtasticTopicIn(String root) {
  final r = root.trim().replaceAll(RegExp(r'/+$'), '');
  return '$r/#';
}

/// Downlink publish topic (default channel name `mqtt`).
String buildMeshtasticTopicOut(
  String root, {
  String downlinkChannel = 'mqtt',
}) {
  final r = root.trim().replaceAll(RegExp(r'/+$'), '');
  final ch = downlinkChannel.trim().isEmpty ? 'mqtt' : downlinkChannel.trim();
  return '$r/$ch/';
}

/// Parse inbound MQTT body → text + synthetic from id, or null if not text.
MeshtasticMqttParsedText? parseMeshtasticMqttInbound(String raw) {
  final t = raw.trim();
  if (t.isEmpty) return null;

  if (!t.startsWith('{')) {
    return MeshtasticMqttParsedText(text: t);
  }

  Object? decoded;
  try {
    decoded = jsonDecode(t);
  } catch (_) {
    return MeshtasticMqttParsedText(text: t);
  }
  if (decoded is! Map) return MeshtasticMqttParsedText(text: t);

  final map = Map<String, dynamic>.from(
    decoded.map((k, v) => MapEntry(k.toString(), v)),
  );

  final typeRaw = map['type'];
  final type = typeRaw is String ? typeRaw.trim().toLowerCase() : null;
  if (type != null && kMeshtasticMqttIgnoredTypes.contains(type)) {
    return null;
  }
  // Downlink echoes / control — do not ingest as mesh chat.
  if (type == 'sendtext' || type == 'sendposition') {
    return null;
  }

  final text = _extractTextField(map);
  if (text == null || text.trim().isEmpty) return null;

  final fromId = _extractFromId(map);
  return MeshtasticMqttParsedText(
    text: text.trim(),
    fromId: fromId,
    type: type,
  );
}

String? _extractTextField(Map<String, dynamic> map) {
  final payload = map['payload'];
  if (payload is String && payload.trim().isEmpty) return null;
  if (payload is String) return payload;
  if (payload is Map) {
    final p = Map<String, dynamic>.from(
      payload.map((k, v) => MapEntry(k.toString(), v)),
    );
    for (final key in ['text', 'message', 'msg']) {
      final v = p[key];
      if (v is String && v.trim().isNotEmpty) return v;
    }
  }
  for (final key in ['text', 'message', 'msg']) {
    final v = map[key];
    if (v is String && v.trim().isNotEmpty) return v;
  }
  return null;
}

String? _extractFromId(Map<String, dynamic> map) {
  final sender = map['sender'];
  if (sender is String && sender.trim().isNotEmpty) return sender.trim();
  final from = map['from'];
  if (from is int) return from.toString();
  if (from is num) return from.toInt().toString();
  if (from is String && from.trim().isNotEmpty) return from.trim();
  return null;
}

/// Encode downlink `sendtext` envelope for a Meshtastic gateway.
String encodeMeshtasticSendText({
  required String text,
  required int fromNodeId,
  int? channel,
  int? toNodeId,
}) {
  final body = <String, Object?>{
    'from': fromNodeId,
    'type': 'sendtext',
    'payload': text,
  };
  if (channel != null) body['channel'] = channel;
  if (toNodeId != null) body['to'] = toNodeId;
  return jsonEncode(body);
}

/// Parse `!aabbccdd` hex node id → unsigned 32-bit decimal (Meshtastic MQTT `from`).
int? meshtasticNodeIdToDecimal(String raw) {
  var s = raw.trim();
  if (s.startsWith('!')) s = s.substring(1);
  if (s.isEmpty) return null;
  // Already decimal digits
  final asInt = int.tryParse(s);
  if (asInt != null && !s.contains(RegExp(r'[a-fA-F]'))) {
    return asInt;
  }
  final hex = int.tryParse(s, radix: 16);
  if (hex == null) return null;
  return hex.toUnsigned(32);
}

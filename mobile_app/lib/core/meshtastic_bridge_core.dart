/// Shared helpers for Meshtastic ↔ ResilNet text bridge (not E2EE).
library;

/// Loop / origin tags embedded in plaintext.
class MeshtasticBridgeTags {
  MeshtasticBridgeTags._();

  static const viaMeshtastic = '[via:mt]';
  static const viaResilNet = '[via:rn]';
  static const channelLabel = '#meshtastic';
  static const maxTextChars = 180;
  static const dedupeTtlMs = 5 * 60 * 1000;
  static const minIntervalMs = 2000;

  /// Synthetic sender ids are not ResilNet peer hashes.
  static const senderPrefix = 'mt:';
}

enum MeshtasticBridgeMode {
  /// Bridge idle.
  off,

  /// Meshtastic → ResilNet.
  ingestA,

  /// ResilNet → Meshtastic.
  egressB,
}

extension MeshtasticBridgeModeX on MeshtasticBridgeMode {
  String get prefsValue => name;

  static MeshtasticBridgeMode fromPrefs(String? raw) {
    for (final m in MeshtasticBridgeMode.values) {
      if (m.name == raw) return m;
    }
    return MeshtasticBridgeMode.off;
  }

  bool get isIngest => this == MeshtasticBridgeMode.ingestA;
  bool get isEgress => this == MeshtasticBridgeMode.egressB;
}

class MeshtasticTextEvent {
  const MeshtasticTextEvent({
    required this.text,
    this.fromId,
    this.receivedAtMs,
  });

  final String text;
  final String? fromId;
  final int? receivedAtMs;
}

/// True for `#meshtastic` notices or tagged bridge plaintext.
bool isMeshtasticBridgeNotice({
  required String channelLabel,
  required String text,
}) {
  if (channelLabel == MeshtasticBridgeTags.channelLabel) return true;
  if (bridgeTextHasTag(text, MeshtasticBridgeTags.viaMeshtastic)) return true;
  if (bridgeTextHasTag(text, MeshtasticBridgeTags.viaResilNet)) return true;
  return false;
}

/// Display label for notices — never treat as ResilNet peer id.
String meshtasticNoticeSenderLabel(String? senderId, {String fallback = 'Meshtastic'}) {
  final id = (senderId ?? '').trim();
  if (id.isEmpty) return fallback;
  if (id.startsWith(MeshtasticBridgeTags.senderPrefix)) {
    final rest = id.substring(MeshtasticBridgeTags.senderPrefix.length).trim();
    return rest.isEmpty ? fallback : '$fallback · $rest';
  }
  // Legacy demo ids
  if (id == 'meshtastic' || id.startsWith('meshtastic')) {
    return id == 'meshtastic' ? fallback : '$fallback · $id';
  }
  return '$fallback · $id';
}

bool isMeshtasticSyntheticSender(String? senderId) {
  final id = (senderId ?? '').trim();
  if (id.isEmpty) return false;
  if (id.startsWith(MeshtasticBridgeTags.senderPrefix)) return true;
  if (id == 'meshtastic' || id.startsWith('meshtastic')) return true;
  return false;
}

String meshtasticSyntheticSenderId(String? fromId) {
  final raw = (fromId ?? '').trim();
  if (raw.isEmpty) return '${MeshtasticBridgeTags.senderPrefix}unknown';
  if (raw.startsWith(MeshtasticBridgeTags.senderPrefix)) return raw;
  return '${MeshtasticBridgeTags.senderPrefix}$raw';
}

/// Normalize whitespace + hard truncate (no tag reservation).
String normalizeBridgeText(String raw) {
  var t = raw.trim().replaceAll(RegExp(r'\s+'), ' ');
  if (t.length <= MeshtasticBridgeTags.maxTextChars) return t;
  if (MeshtasticBridgeTags.maxTextChars <= 1) {
    return t.substring(0, MeshtasticBridgeTags.maxTextChars);
  }
  return '${t.substring(0, MeshtasticBridgeTags.maxTextChars - 1)}…';
}

bool bridgeTextHasTag(String text, String tag) =>
    text.toLowerCase().contains(tag.toLowerCase());

/// Prefix [tag] and truncate so the result always fits [maxTextChars].
String ensureTag(String text, String tag) {
  final cleaned = text.trim().replaceAll(RegExp(r'\s+'), ' ');
  if (cleaned.isEmpty) return cleaned;
  if (bridgeTextHasTag(cleaned, tag)) {
    return normalizeBridgeText(cleaned);
  }
  final prefix = '$tag ';
  final max = MeshtasticBridgeTags.maxTextChars;
  if (prefix.length >= max) {
    return prefix.substring(0, max);
  }
  final budget = max - prefix.length;
  var body = cleaned;
  if (body.length > budget) {
    if (budget <= 1) {
      body = body.substring(0, budget);
    } else {
      body = '${body.substring(0, budget - 1)}…';
    }
  }
  return '$prefix$body';
}

String stripBridgeTags(String text) {
  var t = text;
  t = t.replaceAll(MeshtasticBridgeTags.viaMeshtastic, '');
  t = t.replaceAll(MeshtasticBridgeTags.viaResilNet, '');
  return normalizeBridgeText(t);
}

/// Mode A mesh bulletin relay — default product path is local-only.
bool shouldRelayMeshtasticToMesh({
  required bool relayEnabled,
  required bool e2eeEnabled,
}) =>
    relayEnabled && e2eeEnabled;

/// Simple time-bucketed dedupe keys.
class BridgeDedupeCache {
  BridgeDedupeCache({this.ttlMs = MeshtasticBridgeTags.dedupeTtlMs});

  final int ttlMs;
  final Map<String, int> _seen = {};

  bool accept(String key, {int? nowMs}) {
    final now = nowMs ?? DateTime.now().millisecondsSinceEpoch;
    _purge(now);
    if (_seen.containsKey(key)) return false;
    _seen[key] = now;
    return true;
  }

  void _purge(int now) {
    _seen.removeWhere((_, t) => now - t > ttlMs);
  }

  void clear() => _seen.clear();
}

String bridgeDedupeKey(String text, {String? fromId, int? nowMs}) {
  final norm = normalizeBridgeText(text).toLowerCase();
  final bucket = (nowMs ?? DateTime.now().millisecondsSinceEpoch) ~/ 60000;
  return '${fromId ?? ''}|$bucket|$norm';
}

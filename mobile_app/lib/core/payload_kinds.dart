/// Application-level [ChatMessage.payloadKind] values.
///
/// Wire tags still map unknown kinds to text; these strings drive local UX.
class PayloadKinds {
  PayloadKinds._();

  static const text = 'text';
  static const audio = 'audio';
  static const image = 'image';

  /// Compact geohash presence (not shown in chat UI).
  static const presence = 'presence';

  /// Area fan-out still delivered as sealed 1:1 envelopes.
  static const areaPublic = 'area_public';

  /// Mesh/area public notice (fan-out sealed envelopes).
  static const notice = 'notice';

  /// Local system line (screenshot, etc.) — not relayed.
  static const system = 'system';

  static bool isChatVisible(String? kind) {
    final k = (kind ?? text).trim();
    return k != presence;
  }

  static bool isSystemLine(String? kind) => (kind ?? '') == system;
}

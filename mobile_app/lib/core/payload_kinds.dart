/// Application-level [ChatMessage.payloadKind] values.
///
/// Wire tags still map unknown kinds to text; these strings drive local UX.
class PayloadKinds {
  PayloadKinds._();

  static const text = 'text';
  static const audio = 'audio';

  /// Compact geohash presence (not shown in chat UI).
  static const presence = 'presence';

  /// Area fan-out still delivered as sealed 1:1 envelopes.
  static const areaPublic = 'area_public';

  static bool isChatVisible(String? kind) {
    final k = (kind ?? text).trim();
    return k != presence;
  }
}

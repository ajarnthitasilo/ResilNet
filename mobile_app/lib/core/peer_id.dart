/// Short display form of a ResilNet public-key hash / peer id.
///
/// Full ids stay available for copy / crypto; lists use a short prefix so
/// titles do not wrap across two lines.
String formatShortPeerId(String id, {int len = 6}) {
  final trimmed = id.trim();
  if (trimmed.isEmpty) return trimmed;
  final n = len.clamp(4, 12);
  if (trimmed.length <= n) return trimmed;
  return '${trimmed.substring(0, n)}…';
}

/// Anonymous notice attribution: `anon·` + first 4 chars of pubkey hash.
String formatAnonSender(String? senderId) {
  final id = (senderId ?? '').trim();
  if (id.isEmpty) return 'anon·????';
  final prefix = id.length >= 4 ? id.substring(0, 4) : id;
  return 'anon·$prefix';
}

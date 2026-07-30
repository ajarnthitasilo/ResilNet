/// Short display form of a ResilNet public-key hash / peer id.
///
/// Full ids stay available for copy / crypto; lists use a short prefix so
/// titles do not wrap across two lines.
String formatShortPeerId(String id, {int len = 6}) {
  final trimmed = id.trim();
  if (trimmed.isEmpty) return trimmed;
  final n = len.clamp(4, 12);
  if (trimmed.length <= n) return trimmed;
  return '${trimmed.substring(0, n)}...';
}

/// List-row label: human alias when present, otherwise first 6 id chars.
///
/// Long hash-like "names" (no spaces, mostly alnum, length > 12) are treated
/// as ids and shortened so lists stay one line.
String peerListLabel({String? aliasOrNick, String? id}) {
  final alias = (aliasOrNick ?? '').trim();
  final fallback = (id ?? '').trim();
  // Never surface OS Bluetooth names (iPad/iPhone/…) — stay anonymous.
  if (alias.isNotEmpty &&
      !_looksLikePeerHash(alias) &&
      !_looksLikeOsDeviceName(alias)) {
    if (alias.length > 28) return '${alias.substring(0, 6)}...';
    return alias;
  }
  final source = (alias.isNotEmpty && !_looksLikeOsDeviceName(alias))
      ? alias
      : fallback;
  return formatShortPeerId(source);
}

bool _looksLikePeerHash(String value) {
  if (value.length <= 12) return false;
  if (value.contains(' ')) return false;
  // Peer ids / pubkey hashes are typically long base64url / hex without spaces.
  final alnum = RegExp(r'^[A-Za-z0-9+/=_-]+$');
  return alnum.hasMatch(value);
}

/// BLE often exposes the phone's system name; treat those as non-aliases.
bool _looksLikeOsDeviceName(String value) {
  final v = value.trim().toLowerCase();
  if (v.isEmpty) return true;
  if (v == 'resilnet' || v == 'resilnet ble' || v.startsWith('ble:')) {
    return true;
  }
  const prefixes = [
    'ipad',
    'iphone',
    'ipod',
    'apple watch',
    'macbook',
    'imac',
    'galaxy',
    'pixel',
    'sm-',
  ];
  for (final p in prefixes) {
    if (v == p || v.startsWith('$p ') || v.startsWith(p)) return true;
  }
  return false;
}

/// Anonymous notice attribution: `anon·` + first 4 chars of pubkey hash.
String formatAnonSender(String? senderId) {
  final id = (senderId ?? '').trim();
  if (id.isEmpty) return 'anon·????';
  final prefix = id.length >= 4 ? id.substring(0, 4) : id;
  return 'anon·$prefix';
}

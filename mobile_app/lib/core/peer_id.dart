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

/// List-row label: human alias / community nick when present, else short id.
///
/// Only collapses the label when [aliasOrNick] is literally the peer id (or a
/// truncated form of it). Real nicknames — even long alphanumeric ones — show.
String peerListLabel({String? aliasOrNick, String? id}) {
  final alias = (aliasOrNick ?? '').trim();
  final fallback = (id ?? '').trim();
  // Never surface OS Bluetooth names (iPad/iPhone/…) — stay anonymous.
  if (alias.isNotEmpty && !_looksLikeOsDeviceName(alias)) {
    if (_isRedundantIdAlias(alias, fallback)) {
      return formatShortPeerId(fallback.isNotEmpty ? fallback : alias);
    }
    if (alias.length > 28) return '${alias.substring(0, 28)}…';
    return alias;
  }
  return formatShortPeerId(fallback);
}

/// True when [alias] is just the peer id (or the old auto short-hash alias).
bool _isRedundantIdAlias(String alias, String id) {
  if (id.isEmpty) {
    if (alias.length <= 12) return false;
    if (alias.contains(' ')) return false;
    return RegExp(r'^[A-Za-z0-9+/=_-]+$').hasMatch(alias);
  }
  if (alias == id) return true;
  if (id.startsWith(alias) && alias.length >= 4 && alias.length <= 12) {
    return true;
  }
  if (alias.endsWith('...')) {
    final stem = alias.substring(0, alias.length - 3);
    if (stem.length >= 4 && id.startsWith(stem)) return true;
  }
  return false;
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

import '../core/geohash.dart';
import '../core/peer_id.dart';
import 'peer.dart';
import 'transport_mode.dart';

/// One row in the Area people list (BLE peer and/or Nostr presence).
class AreaPresenceEntry {
  const AreaPresenceEntry({
    required this.id,
    required this.label,
    required this.source,
    required this.geohash,
    required this.lastSeen,
    this.peer,
  });

  /// Stable id: RSA peer id (mesh / bound Nostr) or `nostr:<pubkeyHex>` (legacy anon).
  final String id;

  /// Display label (resolved name or anon nick).
  final String label;

  final PresenceSource source;

  final String? geohash;

  final int lastSeen;

  /// Non-null when this entry can open a sealed 1:1 chat.
  final Peer? peer;

  bool get isBleRadioDiscovery => id.startsWith('radio:');

  bool get canMessage => !isBleRadioDiscovery && peer != null && peer!.publicKey.isNotEmpty;
}

enum PresenceSource {
  mesh,
  internet,
  both;

  bool get isMesh => this == PresenceSource.mesh || this == PresenceSource.both;

  bool get isInternet =>
      this == PresenceSource.internet || this == PresenceSource.both;
}

/// In-memory cache of Nostr presence for a geohash channel.
class NostrPresenceSighting {
  NostrPresenceSighting({
    required this.pubkeyHex,
    required this.nick,
    required this.geohash,
    required this.lastSeen,
    this.resilnetId,
    this.peer,
  });

  /// Ephemeral Nostr event pubkey (not ResilNet RSA id).
  final String pubkeyHex;
  String nick;
  String geohash;
  int lastSeen;

  /// Bound ResilNet user id when rid+pk verified.
  String? resilnetId;

  /// Messageable peer when RSA binding present.
  Peer? peer;

  /// Prefer ResilNet id so mesh + Nostr merge on the same key.
  String get listId {
    final rid = resilnetId?.trim() ?? '';
    if (rid.isNotEmpty) return rid;
    return 'nostr:$pubkeyHex';
  }

  AreaPresenceEntry toEntry() => AreaPresenceEntry(
        id: listId,
        label: peerListLabel(
          aliasOrNick: nick.isNotEmpty ? nick : peer?.displayName,
          id: listId,
        ),
        source: PresenceSource.internet,
        geohash: geohash,
        lastSeen: lastSeen,
        peer: peer,
      );
}

/// TTL for considering a Nostr presence sighting still "online".
/// Slightly longer than publish interval so badges do not flicker to zero.
const Duration kNostrPresenceOnlineWindow = Duration(seconds: 240);

/// True when any Nostr presence in [sightings] is still online in [channel].
bool hasActiveNostrPresenceInChannel({
  required Iterable<NostrPresenceSighting> sightings,
  required String? channel,
  required int nowMs,
}) {
  final cutoff = nowMs - kNostrPresenceOnlineWindow.inMilliseconds;
  for (final s in sightings) {
    if (s.lastSeen < cutoff) continue;
    if (channel != null &&
        channel.isNotEmpty &&
        !Geohash.matchesChannel(s.geohash, channel)) {
      continue;
    }
    return true;
  }
  return false;
}

/// Merge BLE peers + Nostr sightings for the Area people list.
List<AreaPresenceEntry> mergeAreaPresence({
  required List<Peer> meshPeers,
  required List<NostrPresenceSighting> nostrSightings,
  required String? channel,
  required TransportMode mode,
  required int nowMs,
}) {
  final map = <String, AreaPresenceEntry>{};

  if (mode.usesMesh) {
    for (final p in meshPeers) {
      // Discovery-only BLE stubs (no RSA key) are not listed — anonymous
      // messageable peers only, one row per id.
      if (p.publicKey.trim().isEmpty) continue;
      final geo = p.geohash?.trim();
      if (channel != null && channel.isNotEmpty) {
        if (geo != null &&
            geo.isNotEmpty &&
            !Geohash.matchesChannel(geo, channel)) {
          continue;
        }
      }
      map[p.id] = AreaPresenceEntry(
        id: p.id,
        label: peerListLabel(aliasOrNick: p.displayName, id: p.id),
        source: PresenceSource.mesh,
        geohash: p.geohash,
        lastSeen: p.lastSeen,
        peer: p,
      );
    }
  }

  if (mode.usesInternet) {
    final cutoff = nowMs - kNostrPresenceOnlineWindow.inMilliseconds;
    for (final s in nostrSightings) {
      if (s.lastSeen < cutoff) continue;
      if (channel != null &&
          channel.isNotEmpty &&
          !Geohash.matchesChannel(s.geohash, channel)) {
        continue;
      }
      final id = s.listId;
      final existing = map[id];
      if (existing != null) {
        map[id] = AreaPresenceEntry(
          id: existing.id,
          label: peerListLabel(
            aliasOrNick: s.nick.isNotEmpty ? s.nick : existing.label,
            id: existing.id,
          ),
          source: PresenceSource.both,
          geohash: s.geohash.isNotEmpty ? s.geohash : existing.geohash,
          lastSeen:
              s.lastSeen > existing.lastSeen ? s.lastSeen : existing.lastSeen,
          // Prefer bound Nostr peer pubkey if mesh row lacked one (unlikely).
          peer: existing.peer ?? s.peer,
        );
      } else {
        map[id] = s.toEntry();
      }
    }
  }

  final list = map.values.toList()
    ..sort((a, b) => b.lastSeen.compareTo(a.lastSeen));
  return list;
}

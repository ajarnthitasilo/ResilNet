import '../core/geohash.dart';
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

  bool get canMessage => peer != null && peer!.publicKey.isNotEmpty;
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
        label: nick.isNotEmpty
            ? nick
            : (peer?.displayName?.trim().isNotEmpty == true
                ? peer!.displayName!.trim()
                : listId),
        source: PresenceSource.internet,
        geohash: geohash,
        lastSeen: lastSeen,
        peer: peer,
      );
}

/// TTL for considering a Nostr presence sighting still "online".
const Duration kNostrPresenceOnlineWindow = Duration(seconds: 180);

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
        label: p.displayName?.trim().isNotEmpty == true
            ? p.displayName!.trim()
            : p.id,
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
          label: s.nick.isNotEmpty ? s.nick : existing.label,
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

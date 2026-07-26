import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'chat_screen.dart';

/// รายการสมาชิกในเครือข่าย (จาก SQLite peers)
class PeerListScreen extends StatefulWidget {
  const PeerListScreen({super.key});

  @override
  State<PeerListScreen> createState() => _PeerListScreenState();
}

class _PeerListScreenState extends State<PeerListScreen> {
  static const _activeWindowMs = 15000;

  Future<void> _refresh() async {
    if (mounted) setState(() {});
  }

  String _connectionLabel(AppLocalizations l10n, Peer peer, Set<String> nearbyIds) {
    if (peer.isBlocked) return l10n.peersBlocked;
    if (nearbyIds.contains(peer.id)) return l10n.peersNearbyBle;
    final age = DateTime.now().millisecondsSinceEpoch - peer.lastSeen;
    if (age <= _activeWindowMs) return l10n.peersRecentlyOnline;
    if (age < 5 * 60 * 1000) {
      return l10n.peersSeenMinutesAgo((age / 60000).ceil());
    }
    return l10n.peersOffline;
  }

  Color _connectionColor(AppLocalizations l10n, String label) {
    if (label == l10n.peersBlocked) return Colors.redAccent;
    if (label == l10n.peersNearbyBle || label == l10n.peersRecentlyOnline) {
      return ResilNetTheme.emerald;
    }
    return Colors.white54;
  }

  Future<void> _toggleBlock(AppState s, Peer peer) async {
    final next = !peer.isBlocked;
    await s.db.setPeerBlocked(peer.id, next);
    if (!mounted) return;
    final l10n = context.l10n;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          next ? l10n.peersBlockedSnack(peer.id) : l10n.peersUnblockedSnack,
        ),
      ),
    );
    await _refresh();
  }

  Future<void> _openChat(String peerId) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(peerId: peerId)));
    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();

    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.peersTitle),
        actions: [
          IconButton(
            tooltip: l10n.peersRefreshTooltip,
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Peer>>(
        future: s.db.getAllPeers(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final peers = List<Peer>.from(snap.data ?? const <Peer>[]);
          if (peers.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  l10n.peersEmpty,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ),
            );
          }

          peers.sort((a, b) {
            final af = s.isFavorite(a.id) ? 0 : 1;
            final bf = s.isFavorite(b.id) ? 0 : 1;
            if (af != bf) return af.compareTo(bf);
            return b.lastSeen.compareTo(a.lastSeen);
          });

          final nearbyIds = s.isReady
              ? s.mesh.nearbyPeers.map((p) => p.id).toSet()
              : <String>{};

          return ListView.separated(
            padding: const EdgeInsets.all(14),
            itemCount: peers.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final peer = peers[i];
              final conn = _connectionLabel(l10n, peer, nearbyIds);
              return Card(
                child: ListTile(
                  leading: Identicon(id: peer.id),
                  title: FutureBuilder<String>(
                    future: s.db.resolveDisplayName(peer.id),
                    builder: (context, nameSnap) {
                      final name = nameSnap.data ?? peer.id;
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (s.isFavorite(peer.id))
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.amberAccent,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        conn,
                        style: TextStyle(
                          color: _connectionColor(l10n, conn),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        peer.id,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white54,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (action) async {
                      switch (action) {
                        case 'chat':
                          await _openChat(peer.id);
                        case 'favorite':
                          await s.toggleFavorite(peer.id);
                          await _refresh();
                        case 'block':
                          await _toggleBlock(s, peer);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'chat',
                        child: Text(l10n.peersOpenChat),
                      ),
                      PopupMenuItem(
                        value: 'favorite',
                        child: Text(
                          s.isFavorite(peer.id)
                              ? l10n.favoritesRemove
                              : l10n.favoritesAdd,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'block',
                        child: Text(
                          peer.isBlocked
                              ? l10n.peersUnblockAction
                              : l10n.peersBlockAction,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => _openChat(peer.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

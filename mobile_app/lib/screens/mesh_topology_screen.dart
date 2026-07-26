import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'chat_screen.dart';

/// Read-only mesh topology: connected link, nearby BLE, known peers.
class MeshTopologyScreen extends StatelessWidget {
  const MeshTopologyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.topologyTitle)),
      body: Container(
        decoration: const BoxDecoration(gradient: ResilNetTheme.scaffoldGradient),
        child: FutureBuilder<List<Peer>>(
          future: s.db.getAllPeers(),
          builder: (context, snap) {
            final peers = snap.data ?? const <Peer>[];
            final nearby = s.isReady ? s.mesh.nearbyPeers : const <Peer>[];
            final nearbyIds = nearby.map((p) => p.id).toSet();
            final connectedId = s.isReady ? s.mesh.connectedDeviceId : null;
            Peer? connectedPeer;
            if (connectedId != null) {
              for (final p in peers) {
                if (p.deviceId == connectedId) {
                  connectedPeer = p;
                  break;
                }
              }
            }

            if (peers.isEmpty && nearby.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    l10n.topologyEmpty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ),
              );
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  l10n.topologySubtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white54,
                      ),
                ),
                const SizedBox(height: 16),
                if (connectedPeer != null) ...[
                  _section(context, l10n.topologyConnectedNow),
                  _tile(context, s, connectedPeer, highlight: true),
                  const SizedBox(height: 12),
                ],
                if (nearby.isNotEmpty) ...[
                  _section(context, l10n.topologyNearby),
                  for (final p in nearby)
                    if (connectedPeer?.id != p.id) _tile(context, s, p),
                  const SizedBox(height: 12),
                ],
                _section(context, l10n.topologyKnown),
                for (final p in peers)
                  if (!nearbyIds.contains(p.id)) _tile(context, s, p),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _section(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: ResilNetTheme.emerald,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  Widget _tile(
    BuildContext context,
    AppState s,
    Peer peer, {
    bool highlight = false,
  }) {
    final name = peer.displayName?.trim().isNotEmpty == true
        ? peer.displayName!.trim()
        : peer.id;
    return Card(
      color: highlight
          ? ResilNetTheme.emerald.withValues(alpha: 0.12)
          : null,
      child: ListTile(
        leading: Identicon(id: peer.id),
        title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: Text(
          [
            if (s.isFavorite(peer.id)) '★',
            if (peer.geohash != null && peer.geohash!.isNotEmpty)
              '#${peer.geohash}',
            peer.id,
          ].where((e) => e.isNotEmpty).join(' · '),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.white54,
                fontFamily: 'monospace',
              ),
        ),
        trailing: peer.isBlocked
            ? const Icon(Icons.block, color: Colors.redAccent, size: 18)
            : const Icon(Icons.chevron_right, size: 18),
        onTap: peer.isBlocked
            ? null
            : () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(peerId: peer.id),
                  ),
                );
              },
      ),
    );
  }
}

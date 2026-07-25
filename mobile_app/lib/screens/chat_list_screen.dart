import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/geohash.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../models/mesh_retention.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import '../widgets/mesh_status_bar.dart';
import 'chat_screen.dart';
import 'identity_screen.dart';
import 'peer_list_screen.dart';
import 'settings_screen.dart';

String _feedSubtitle(AppLocalizations l10n, FeedChannel channel) {
  return switch (channel) {
    FeedChannel.directs => l10n.feedDirectsSubtitle,
    FeedChannel.mesh => l10n.feedMeshSubtitle,
    FeedChannel.geo => l10n.feedGeoSubtitle,
  };
}

String _geoPrecisionLabel(AppLocalizations l10n, GeoPrecision p) {
  return switch (p) {
    GeoPrecision.region => l10n.geoPrecisionRegion,
    GeoPrecision.province => l10n.geoPrecisionProvince,
    GeoPrecision.city => l10n.geoPrecisionCity,
    GeoPrecision.neighborhood => l10n.geoPrecisionNeighborhood,
    GeoPrecision.block => l10n.geoPrecisionBlock,
  };
}

String _meshRetentionLabel(AppLocalizations l10n, MeshRetention r) {
  return switch (r) {
    MeshRetention.keep => l10n.meshRetentionKeep,
    MeshRetention.oneDay => l10n.meshRetention1Day,
    MeshRetention.threeDays => l10n.meshRetention3Days,
    MeshRetention.sevenDays => l10n.meshRetention7Days,
  };
}

/// Home feed with Bitchat-inspired channel switching.
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _peerController = TextEditingController();

  Future<void> _setAlias(BuildContext context, String peerId) async {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final existing = await s.db.getContactAlias(peerId) ?? '';
    final controller = TextEditingController(text: existing);

    if (!context.mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(l10n.aliasTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.aliasHintBody,
                style: Theme.of(ctx).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: l10n.aliasLabel,
                  hintText: l10n.aliasHint,
                ),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
    if (ok != true) return;
    await s.db.setContactAlias(
      publicKeyHash: peerId,
      aliasName: controller.text,
    );
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _peerController.dispose();
    super.dispose();
  }

  Future<void> _openPeer(BuildContext context, String peerId) async {
    if (!mounted) return;
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(peerId: peerId)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.communityTitle),
        actions: [
          PopupMenuButton<String>(
            tooltip: l10n.notificationsTooltip,
            icon: Icon(
              s.notificationsEnabled
                  ? Icons.notifications_active_outlined
                  : Icons.notifications_off_outlined,
            ),
            itemBuilder: (context) => [
              CheckedPopupMenuItem(
                value: 'enabled',
                checked: s.notificationsEnabled,
                child: Text(l10n.enableMessageNotifications),
              ),
            ],
            onSelected: (v) {
              if (v == 'enabled') {
                s.setNotificationsEnabled(!s.notificationsEnabled);
              }
            },
          ),
          IconButton(
            tooltip: l10n.networkMembersTooltip,
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const PeerListScreen())),
            icon: const Icon(Icons.groups_outlined),
          ),
          IconButton(
            tooltip: l10n.settings,
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
            icon: const Icon(Icons.settings_outlined),
          ),
          IconButton(
            tooltip: l10n.identityQrTooltip,
            onPressed: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const IdentityScreen())),
            icon: const Icon(Icons.badge_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          const MeshStatusBar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
            child: SegmentedButton<FeedChannel>(
              segments: [
                ButtonSegment(
                  value: FeedChannel.directs,
                  label: Text(l10n.feedDirects),
                  icon: const Icon(Icons.lock_outline, size: 16),
                ),
                ButtonSegment(
                  value: FeedChannel.mesh,
                  label: Text(l10n.feedMesh),
                  icon: const Icon(Icons.bluetooth, size: 16),
                ),
                ButtonSegment(
                  value: FeedChannel.geo,
                  label: Text(l10n.feedGeo),
                  icon: const Icon(Icons.public, size: 16),
                ),
              ],
              selected: {s.feedChannel},
              onSelectionChanged: (set) {
                s.setFeedChannel(set.first);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _feedSubtitle(l10n, s.feedChannel),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
              ),
            ),
          ),
          if (s.feedChannel == FeedChannel.directs) ...[
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _peerController,
                      decoration: InputDecoration(hintText: l10n.peerIdHint),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FilledButton(
                    onPressed: () {
                      final peer = _peerController.text.trim();
                      if (peer.isEmpty) return;
                      _openPeer(context, peer);
                    },
                    child: Text(l10n.start),
                  ),
                ],
              ),
            ),
            Expanded(child: _DirectsBody(onOpen: _openPeer, onAlias: _setAlias)),
          ] else if (s.feedChannel == FeedChannel.mesh)
            Expanded(child: _MeshBody(onOpen: _openPeer))
          else
            Expanded(child: _GeoBody(onOpen: _openPeer)),
        ],
      ),
    );
  }
}

class _DirectsBody extends StatelessWidget {
  const _DirectsBody({required this.onOpen, required this.onAlias});

  final Future<void> Function(BuildContext context, String peerId) onOpen;
  final Future<void> Function(BuildContext context, String peerId) onAlias;

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    return FutureBuilder<List<String>>(
      future: s.chatPeerIds(),
      builder: (context, snap) {
        final peers = snap.data ?? const <String>[];
        if (peers.isEmpty) {
          return Center(
            child: Text(
              l10n.directsEmpty,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.65),
                  ),
              textAlign: TextAlign.center,
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          itemCount: peers.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, i) {
            final peerId = peers[i];
            return Card(
              child: ListTile(
                title: FutureBuilder<String>(
                  future: s.db.resolveDisplayName(peerId),
                  builder: (context, nameSnap) {
                    final name = nameSnap.data ?? peerId;
                    return Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    );
                  },
                ),
                subtitle: Text(l10n.directsSubtitle),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => onOpen(context, peerId),
                onLongPress: () => onAlias(context, peerId),
              ),
            );
          },
        );
      },
    );
  }
}

class _MeshBody extends StatelessWidget {
  const _MeshBody({required this.onOpen});

  final Future<void> Function(BuildContext context, String peerId) onOpen;

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    if (!s.isReady) {
      return const Center(child: CircularProgressIndicator());
    }
    final nearby = s.mesh.nearbyPeers;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.meshIntro,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.meshRetentionTitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(height: 4),
              Text(
                l10n.meshRetentionSubtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final r in MeshRetention.values)
                    ChoiceChip(
                      label: Text(_meshRetentionLabel(l10n, r)),
                      selected: s.meshRetention == r,
                      onSelected: (_) => s.setMeshRetention(r),
                    ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: nearby.isEmpty
              ? Center(
                  child: Text(
                    s.mesh.running
                        ? l10n.meshEmptyRunning
                        : l10n.meshEmptyStopped,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  itemCount: nearby.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final Peer peer = nearby[i];
                    final shortId = peer.id.length > 12
                        ? '${peer.id.substring(0, 12)}…'
                        : peer.id;
                    return Card(
                      child: ListTile(
                        leading: Identicon(id: peer.id),
                        title: FutureBuilder<String>(
                          future: s.db.resolveDisplayName(peer.id),
                          builder: (context, nameSnap) {
                            return Text(
                              nameSnap.data ?? peer.displayName ?? peer.id,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                        subtitle: Text('${l10n.meshNearbyPrefix} • $shortId'),
                        trailing: const Icon(Icons.lock_outline),
                        onTap: () => onOpen(context, peer.id),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _GeoBody extends StatefulWidget {
  const _GeoBody({required this.onOpen});

  final Future<void> Function(BuildContext context, String peerId) onOpen;

  @override
  State<_GeoBody> createState() => _GeoBodyState();
}

class _GeoBodyState extends State<_GeoBody> {
  final _publicController = TextEditingController();
  bool _sendingPublic = false;

  @override
  void dispose() {
    _publicController.dispose();
    super.dispose();
  }

  Future<void> _sendPublic(AppState s) async {
    final text = _publicController.text.trim();
    if (text.isEmpty || _sendingPublic) return;
    setState(() => _sendingPublic = true);
    try {
      final n = await s.sendAreaPublicText(text);
      if (!mounted) return;
      _publicController.clear();
      final l10n = context.l10n;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.geoPublicSent(n))),
      );
    } finally {
      if (mounted) setState(() => _sendingPublic = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final online = s.peersOnlineInSelectedArea();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      s.geoChannelLabel,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontFamily: 'monospace',
                            letterSpacing: 0.5,
                          ),
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.refreshLocationTooltip,
                    onPressed:
                        s.geoRefreshing ? null : () => s.refreshGeohash(),
                    icon: s.geoRefreshing
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.my_location),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final p in GeoPrecision.values)
                    ChoiceChip(
                      label: Text(
                        '${_geoPrecisionLabel(l10n, p)} (${p.length})',
                      ),
                      selected: s.geoPrecision == p,
                      onSelected: (_) => s.setGeoPrecision(p),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                l10n.geoIntro,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
              ),
              if (s.geoNeedsPermission) ...[
                const SizedBox(height: 8),
                Text(
                  l10n.geoErrorPermission,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.orangeAccent,
                      ),
                ),
              ],
              if (s.geoError != null) ...[
                const SizedBox(height: 8),
                Text(
                  s.geoError!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.orangeAccent,
                      ),
                ),
              ],
            ],
          ),
        ),
        if (online.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _publicController,
                    enabled: !_sendingPublic,
                    decoration: InputDecoration(
                      hintText: l10n.geoPublicHint,
                    ),
                    minLines: 1,
                    maxLines: 3,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _sendPublic(s),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _sendingPublic ? null : () => _sendPublic(s),
                  child: _sendingPublic
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.geoPublicSend),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 8),
            child: Text(
              l10n.geoPublicHelp(online.length),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
            ),
          ),
        ],
        Expanded(
          child: online.isEmpty
              ? Center(
                  child: Text(
                    l10n.geoEmpty(s.geoChannelLabel),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withValues(alpha: 0.65),
                        ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  itemCount: online.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final peer = online[i];
                    return Card(
                      child: ListTile(
                        leading: Identicon(id: peer.id),
                        title: FutureBuilder<String>(
                          future: s.db.resolveDisplayName(peer.id),
                          builder: (context, nameSnap) {
                            return Text(
                              nameSnap.data ?? peer.displayName ?? peer.id,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          },
                        ),
                        subtitle: Text(
                          peer.geohash == null || peer.geohash!.isEmpty
                              ? l10n.geoPeerNearbySubtitle
                              : l10n.geoPeerSubtitle(s.geoChannelLabel),
                        ),
                        trailing: const Icon(Icons.lock_outline),
                        onTap: () => widget.onOpen(context, peer.id),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

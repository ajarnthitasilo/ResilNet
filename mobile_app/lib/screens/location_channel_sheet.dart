import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/geohash.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../state/app_state.dart';

/// Bitchat-style location channel picker (mesh + geohash ladder with ~radius).
Future<void> showLocationChannelSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _LocationChannelSheet(),
  );
}

class _LocationChannelSheet extends StatefulWidget {
  const _LocationChannelSheet();

  @override
  State<_LocationChannelSheet> createState() => _LocationChannelSheetState();
}

class _LocationChannelSheetState extends State<_LocationChannelSheet> {
  final _teleport = TextEditingController();

  @override
  void dispose() {
    _teleport.dispose();
    super.dispose();
  }

  String _precisionLabel(AppLocalizations l10n, GeoPrecision p) {
    return switch (p) {
      GeoPrecision.region => l10n.geoPrecisionRegion,
      GeoPrecision.province => l10n.geoPrecisionProvince,
      GeoPrecision.city => l10n.geoPrecisionCity,
      GeoPrecision.neighborhood => l10n.geoPrecisionNeighborhood,
      GeoPrecision.block => l10n.geoPrecisionBlock,
    };
  }

  int _peopleCount(AppState s, {required bool mesh}) {
    if (mesh) return s.isReady ? s.mesh.nearbyPeers.length : 0;
    return s.areaPresenceOnline().length;
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final full = s.currentGeohash;
    final meshSelected = s.feedChannel == FeedChannel.mesh;
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.82,
      decoration: const BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.fromLTRB(16, 14, 16, 12 + bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.locationSheetTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Text(
            l10n.locationSheetIntro,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                _row(
                  context,
                  title: 'mesh',
                  count: _peopleCount(s, mesh: true),
                  subtitle: l10n.locationMeshSubtitle,
                  selected: meshSelected,
                  accent: true,
                  onTap: () {
                    s.setFeedChannel(FeedChannel.mesh);
                    Navigator.pop(context);
                  },
                ),
                for (final p in [
                  GeoPrecision.block,
                  GeoPrecision.neighborhood,
                  GeoPrecision.city,
                  GeoPrecision.province,
                  GeoPrecision.region,
                ]) ...[
                  const Divider(height: 1, color: Colors.white12),
                  Builder(
                    builder: (context) {
                      final hash = full == null || full.isEmpty
                          ? '—'
                          : Geohash.atPrecision(full, p);
                      final selected = !meshSelected &&
                          s.feedChannel == FeedChannel.geo &&
                          s.geoPrecision == p;
                      // Count for selected precision uses live presence when active.
                      final count = selected
                          ? _peopleCount(s, mesh: false)
                          : null;
                      return _row(
                        context,
                        title: _precisionLabel(l10n, p),
                        count: count,
                        subtitle:
                            '#$hash • ${p.approxRadiusLabel}',
                        selected: selected,
                        onTap: () async {
                          await s.setFeedChannel(FeedChannel.geo);
                          await s.setGeoPrecision(p);
                          if (context.mounted) Navigator.pop(context);
                        },
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _teleport,
                  decoration: InputDecoration(
                    hintText: l10n.locationTeleportHint,
                    isDense: true,
                  ),
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () {
                  // Teleport is a future UX hook — refresh location for now.
                  s.refreshGeohash();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.mood_outlined, size: 18),
                label: Text(l10n.locationTeleport),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
    int? count,
    bool accent = false,
  }) {
    final l10n = context.l10n;
    final countLabel = count == null
        ? '[? people]'
        : '[${l10n.onlinePeopleCount(count)}]';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: accent ? const Color(0xFF7EB6FF) : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              countLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white54,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white54,
              fontFamily: 'monospace',
            ),
      ),
      trailing: selected
          ? const Icon(Icons.check, color: Colors.white)
          : const Icon(Icons.bookmark_border, size: 20, color: Colors.white54),
      onTap: onTap,
    );
  }
}

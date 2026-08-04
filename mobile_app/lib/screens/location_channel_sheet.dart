import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/geohash.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

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
  String? _teleportError;

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

  Future<void> _teleportToGeohash(AppState s) async {
    final raw = _teleport.text.trim();
    final parsed = Geohash.parseInput(raw);
    if (parsed == null) {
      setState(() => _teleportError = context.l10n.geoTeleportInvalid);
      return;
    }
    setState(() => _teleportError = null);
    final ok = await s.setManualGeohash(parsed);
    if (!mounted) return;
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(context.l10n.geoTeleportInvalid)),
      );
      return;
    }
    await s.setFeedChannel(FeedChannel.geo);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(
        content: Text(
          context.l10n.geoTeleportOk(Geohash.channelLabel(parsed)),
        ),
      ),
    );
    Navigator.pop(context);
  }

  Future<void> _selectPinned(AppState s, String id) async {
    await s.openPinnedLocationChannel(id);
    if (mounted) Navigator.pop(context);
  }

  String _pinnedTitle(AppLocalizations l10n, String id) {
    if (id == AppState.pinnedMeshChannelId) return 'mesh';
    return Geohash.channelLabel(id);
  }

  String _pinnedSubtitle(AppLocalizations l10n, String id) {
    if (id == AppState.pinnedMeshChannelId) {
      return l10n.locationMeshSubtitle;
    }
    final p = GeoPrecision.forHashLength(id.length);
    return '${_precisionLabel(l10n, p)} • ${p.approxRadiusLabel}';
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final full = s.currentGeohash;
    final meshSelected = s.feedChannel == FeedChannel.mesh;
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final muted = ResilNetTheme.mutedOnSurface(context);
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final pinned = s.pinnedLocationChannels;

    return ResilNetTheme.glassPanel(
      context: context,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      blurSigma: 28,
      padding: EdgeInsets.fromLTRB(16, 14, 16, 12 + bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.82,
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
                  color: muted,
                ),
          ),
          if (s.geoIsManual) ...[
            const SizedBox(height: 8),
            Text(
              l10n.geoManualActive(s.geoChannelLabel),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: const Color(0xFF7EB6FF),
                  ),
            ),
          ],
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                if (pinned.isNotEmpty) ...[
                  Text(
                    l10n.channelPinsTitle,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ResilNetTheme.emerald,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  for (final id in pinned)
                    _row(
                      context,
                      title: _pinnedTitle(l10n, id),
                      count: id == AppState.pinnedMeshChannelId
                          ? _peopleCount(s, mesh: true)
                          : (s.feedChannel == FeedChannel.geo &&
                                  s.selectedAreaHash == id
                              ? _peopleCount(s, mesh: false)
                              : null),
                      subtitle: _pinnedSubtitle(l10n, id),
                      selected: id == AppState.pinnedMeshChannelId
                          ? meshSelected
                          : (!meshSelected &&
                              s.feedChannel == FeedChannel.geo &&
                              s.selectedAreaHash == id),
                      pinned: true,
                      onTap: () => unawaited(_selectPinned(s, id)),
                      onPin: () => unawaited(s.togglePinnedLocationChannel(id)),
                    ),
                  Divider(
                    height: 20,
                    color: onSurface.withValues(alpha: 0.12),
                  ),
                ],
                _row(
                  context,
                  title: 'mesh',
                  count: _peopleCount(s, mesh: true),
                  subtitle: l10n.locationMeshSubtitle,
                  selected: meshSelected,
                  accent: true,
                  pinned: s.isLocationChannelPinned(AppState.pinnedMeshChannelId),
                  onTap: () {
                    s.setFeedChannel(FeedChannel.mesh);
                    Navigator.pop(context);
                  },
                  onPin: () => unawaited(
                    s.togglePinnedLocationChannel(AppState.pinnedMeshChannelId),
                  ),
                ),
                for (final p in [
                  GeoPrecision.block,
                  GeoPrecision.neighborhood,
                  GeoPrecision.city,
                  GeoPrecision.province,
                  GeoPrecision.region,
                ]) ...[
                  Divider(
                    height: 1,
                    color: onSurface.withValues(alpha: 0.1),
                  ),
                  Builder(
                    builder: (context) {
                      final hash = full == null || full.isEmpty
                          ? null
                          : Geohash.atPrecision(full, p);
                      final selected = !meshSelected &&
                          s.feedChannel == FeedChannel.geo &&
                          s.geoPrecision == p;
                      final count = selected
                          ? _peopleCount(s, mesh: false)
                          : null;
                      final canPin = hash != null && hash.isNotEmpty;
                      return _row(
                        context,
                        title: _precisionLabel(l10n, p),
                        count: count,
                        subtitle: '#${hash ?? '—'} • ${p.approxRadiusLabel}',
                        selected: selected,
                        pinned: canPin && s.isLocationChannelPinned(hash),
                        onTap: () async {
                          await s.setFeedChannel(FeedChannel.geo);
                          await s.setGeoPrecision(p);
                          if (context.mounted) Navigator.pop(context);
                        },
                        onPin: canPin
                            ? () => unawaited(
                                  s.togglePinnedLocationChannel(hash),
                                )
                            : null,
                      );
                    },
                  ),
                ],
              ],
            ),
          ),
          Text(
            l10n.geoTeleportHint,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: muted,
                ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _teleport,
                  decoration: InputDecoration(
                    hintText: l10n.locationTeleportHint,
                    isDense: true,
                    errorText: _teleportError,
                  ),
                  style: const TextStyle(fontFamily: 'monospace'),
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _teleportToGeohash(s),
                ),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: () => _teleportToGeohash(s),
                icon: const Icon(Icons.near_me_outlined, size: 18),
                label: Text(l10n.locationTeleport),
              ),
              IconButton(
                tooltip: l10n.channelPinTooltip,
                onPressed: () async {
                  final parsed = Geohash.parseInput(_teleport.text);
                  if (parsed == null) {
                    setState(
                      () => _teleportError = context.l10n.geoTeleportInvalid,
                    );
                    return;
                  }
                  setState(() => _teleportError = null);
                  await s.togglePinnedLocationChannel(parsed);
                },
                icon: Icon(
                  () {
                    final parsed = Geohash.parseInput(_teleport.text);
                    if (parsed == null) return Icons.push_pin_outlined;
                    return s.isLocationChannelPinned(parsed)
                        ? Icons.push_pin
                        : Icons.push_pin_outlined;
                  }(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextButton.icon(
            onPressed: s.geoRefreshing ? null : () => s.refreshGeohash(),
            icon: s.geoRefreshing
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.my_location_outlined, size: 18),
            label: Text(l10n.geoRefreshLocation),
          ),
        ],
      ),
      ),
    );
  }

  Widget _row(
    BuildContext context, {
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
    required VoidCallback? onPin,
    bool pinned = false,
    int? count,
    bool accent = false,
  }) {
    final l10n = context.l10n;
    final onSurface = Theme.of(context).colorScheme.onSurface;
    final muted = ResilNetTheme.mutedOnSurface(context);
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
              color: accent ? const Color(0xFF7EB6FF) : onSurface,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              countLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: muted,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: muted,
              fontFamily: 'monospace',
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onPin != null)
            IconButton(
              tooltip: pinned ? l10n.channelUnpinTooltip : l10n.channelPinTooltip,
              visualDensity: VisualDensity.compact,
              onPressed: onPin,
              icon: Icon(
                pinned ? Icons.push_pin : Icons.push_pin_outlined,
                size: 20,
                color: pinned ? ResilNetTheme.emerald : muted,
              ),
            ),
          if (selected)
            Icon(Icons.check, color: onSurface)
          else
            const SizedBox(width: 24),
        ],
      ),
      onTap: onTap,
    );
  }
}

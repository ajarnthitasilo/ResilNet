import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../models/transport_mode.dart';
import '../state/app_state.dart';

Future<void> showFeedChannelSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => const _FeedChannelSheet(),
  );
}

class _FeedChannelSheet extends StatelessWidget {
  const _FeedChannelSheet();

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final muted = ResilNetTheme.mutedOnSurface(context);
    final channels = s.feedChannelsForPicker();
    return Container(
      decoration: BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradientFor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.channelPinsHint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: muted),
          ),
          const SizedBox(height: 8),
          for (final ch in channels)
            ListTile(
              leading: Icon(switch (ch) {
                FeedChannel.directs => Icons.lock_outline,
                FeedChannel.mesh => Icons.bluetooth,
                FeedChannel.geo => Icons.public,
              }),
              title: Text(switch (ch) {
                FeedChannel.directs => l10n.feedDirects,
                FeedChannel.mesh => l10n.feedMesh,
                FeedChannel.geo => l10n.feedGeo,
              }),
              subtitle: Text(switch (ch) {
                FeedChannel.directs => l10n.feedDirectsSubtitle,
                FeedChannel.mesh => l10n.feedMeshSubtitle,
                FeedChannel.geo => l10n.feedGeoSubtitle,
              }),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    tooltip: s.isFeedChannelPinned(ch)
                        ? l10n.channelUnpinTooltip
                        : l10n.channelPinTooltip,
                    visualDensity: VisualDensity.compact,
                    onPressed: () => unawaited(s.togglePinnedFeedChannel(ch)),
                    icon: Icon(
                      s.isFeedChannelPinned(ch)
                          ? Icons.push_pin
                          : Icons.push_pin_outlined,
                      size: 20,
                      color: s.isFeedChannelPinned(ch)
                          ? ResilNetTheme.emerald
                          : muted,
                    ),
                  ),
                  if (s.feedChannel == ch)
                    const Icon(Icons.check)
                  else
                    const SizedBox(width: 24),
                ],
              ),
              onTap: () {
                s.setFeedChannel(ch);
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

Future<void> showTransportModeSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) => const _TransportModeSheet(),
  );
}

class _TransportModeSheet extends StatelessWidget {
  const _TransportModeSheet();

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final muted = ResilNetTheme.mutedOnSurface(context);
    final items = <(TransportMode, String, IconData)>[
      (TransportMode.mesh, l10n.transportModeMesh, Icons.bluetooth),
      (TransportMode.internet, l10n.transportModeInternet, Icons.public),
      (TransportMode.auto, l10n.transportModeAuto, Icons.sync_alt),
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradientFor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.transportModeTitle,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            l10n.transportModeSubtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: muted,
                ),
          ),
          const SizedBox(height: 8),
          for (final item in items)
            ListTile(
              leading: Icon(item.$3),
              title: Text(item.$2),
              trailing: s.transportMode == item.$1
                  ? const Icon(Icons.check)
                  : null,
              onTap: () {
                s.setTransportMode(item.$1);
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

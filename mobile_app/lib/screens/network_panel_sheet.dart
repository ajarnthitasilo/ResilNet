import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/glass_overlays.dart';
import '../app/theme.dart';
import '../app/tokens.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../state/app_state.dart';
import 'feed_channel_sheet.dart';
import 'home_node_bridge_sheet.dart';
import 'local_wifi_link_sheet.dart';
import 'location_channel_sheet.dart';
import 'notices_sheet.dart';

/// One labelled place for every "how am I connected" control.
///
/// These used to be unlabelled icons crowded into the home app bar (transport
/// mode, area channel, bulletins) plus two entries buried in the overflow menu
/// (local Wi-Fi, home node). Each row still opens exactly the same sheet as
/// before — nothing changed except that the controls now have names and live
/// where people already look for connection state: the status bar.
Future<void> showNetworkPanelSheet(BuildContext context) {
  return showGlassModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => const _NetworkPanelSheet(),
  );
}

class _NetworkPanelSheet extends StatelessWidget {
  const _NetworkPanelSheet();

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final tokens = context.tokens;
    final muted = ResilNetTheme.mutedOnSurface(context);

    final transportLabel = switch (s.transportMode.name) {
      'mesh' => l10n.transportModeMesh,
      'internet' => l10n.transportModeInternet,
      _ => l10n.transportModeAuto,
    };
    final transportIcon = switch (s.transportMode.name) {
      'mesh' => Icons.bluetooth_searching,
      'internet' => Icons.wifi,
      _ => Icons.sync_alt,
    };

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.networkPanelTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    l10n.networkPanelSubtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: muted),
                  ),
                ],
              ),
            ),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(transportIcon),
                    title: Text(l10n.transportModeTitle),
                    subtitle: Text(transportLabel),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      unawaited(showTransportModeSheet(context));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.place_outlined),
                    title: Text(l10n.locationPickerTooltip),
                    subtitle: Text(
                      s.geoChannelLabel,
                      style: const TextStyle(fontFamily: 'monospace'),
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      unawaited(showLocationChannelSheet(context));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.campaign_outlined),
                    title: Text(l10n.noticesOpen),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      final scope = s.feedChannel == FeedChannel.mesh
                          ? 'mesh'
                          : 'geo';
                      Navigator.pop(context);
                      unawaited(showNoticesSheet(context, initialScope: scope));
                    },
                  ),
                  const Divider(height: 8),
                  ListTile(
                    leading: const Icon(Icons.wifi_lock_outlined),
                    title: Text(l10n.localWifiTitle),
                    subtitle: Text(l10n.localWifiSubtitle, maxLines: 2),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      unawaited(showLocalWifiLinkSheet(context));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.home_work_outlined,
                      color: s.lxmfBridgeEnabled && s.lxmfBridge?.online == true
                          ? tokens.success
                          : null,
                    ),
                    title: Text(l10n.lxmfBridgeTitle),
                    subtitle: Text(
                      s.lxmfBridgeEnabled
                          ? (s.lxmfBridge?.online == true
                                ? l10n.lxmfBridgeStatusOnline
                                : l10n.lxmfBridgeStatusOffline)
                          : l10n.lxmfBridgeDisabledHint,
                      maxLines: 2,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      unawaited(showHomeNodeBridgeSheet(context));
                    },
                  ),
                  const Divider(height: 8),
                  ListTile(
                    leading: const Icon(Icons.tune),
                    title: Text(l10n.channelPickerTooltip),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pop(context);
                      unawaited(showFeedChannelSheet(context));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

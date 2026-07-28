import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../models/geo_discovery.dart';
import '../models/geo_location_result.dart';
import '../screens/location_channel_sheet.dart';
import '../state/app_state.dart';

/// Empty-state panel for Area / online-people discovery with actionable hints.
class GeoDiscoveryEmptyPanel extends StatelessWidget {
  const GeoDiscoveryEmptyPanel({super.key, this.channelLabel});

  final String? channelLabel;

  String _message(
    AppLocalizations l10n,
    AppState s,
    GeoDiscoveryEmptyReason reason,
  ) {
    if (reason == GeoDiscoveryEmptyReason.noLocation) {
      return switch (s.geoLocationStatus) {
        GeoLocationStatus.needsPermission => l10n.geoEmptyNeedsPermission,
        GeoLocationStatus.servicesDisabled => l10n.geoEmptyServicesDisabled,
        GeoLocationStatus.unavailable => l10n.geoEmptyNoGpsFix,
        _ => l10n.geoEmptyNoLocation,
      };
    }
    return switch (reason) {
      GeoDiscoveryEmptyReason.noLocation => l10n.geoEmptyNoLocation,
      GeoDiscoveryEmptyReason.noNostr => l10n.geoEmptyNoNostr,
      GeoDiscoveryEmptyReason.meshOnly => l10n.geoEmptyMeshOnly,
      GeoDiscoveryEmptyReason.waiting => l10n.geoEmptyWaiting(
          channelLabel ?? l10n.geoChannelFallback,
        ),
      GeoDiscoveryEmptyReason.none => l10n.onlinePeopleEmpty,
    };
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final reason = s.geoDiscoveryEmptyReason;
    final showActions = reason == GeoDiscoveryEmptyReason.noLocation ||
        reason == GeoDiscoveryEmptyReason.noNostr;
    final noGeohash =
        s.currentGeohash == null || s.currentGeohash!.isEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (s.feedChannel != FeedChannel.mesh &&
                s.transportMode.usesInternet) ...[
              Text(
                l10n.geoDiscoveryStatus(
                  s.geoChannelLabel,
                  s.nostrRelayLabel,
                ),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white38,
                      fontFamily: 'monospace',
                    ),
              ),
              const SizedBox(height: 10),
            ],
            Text(
              _message(l10n, s, reason),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white54,
                    height: 1.4,
                  ),
            ),
            if (noGeohash && s.geoLocationStatus != GeoLocationStatus.manual) ...[
              const SizedBox(height: 8),
              Text(
                l10n.geoEmptyTeleportHint,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white38,
                    ),
              ),
            ],
            if (reason == GeoDiscoveryEmptyReason.noNostr &&
                s.nostrLastError != null &&
                s.nostrLastError!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                l10n.nostrReconnectFailedDetail(s.nostrLastError!),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.orangeAccent.withValues(alpha: 0.9),
                      fontFamily: 'monospace',
                    ),
              ),
            ],
            if (showActions) ...[
              const SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (reason == GeoDiscoveryEmptyReason.noLocation) ...[
                    FilledButton.tonalIcon(
                      onPressed: s.geoRefreshing
                          ? null
                          : () => s.refreshGeohash(),
                      icon: s.geoRefreshing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.my_location_outlined, size: 18),
                      label: Text(l10n.geoRefreshLocation),
                    ),
                    FilledButton.tonalIcon(
                      onPressed: () => showLocationChannelSheet(context),
                      icon: const Icon(Icons.edit_location_alt_outlined,
                          size: 18),
                      label: Text(l10n.geoSetGeohashManually),
                    ),
                  ],
                  if (reason == GeoDiscoveryEmptyReason.noNostr)
                    FilledButton.tonalIcon(
                      onPressed: s.nostrReconnecting
                          ? null
                          : () async {
                              final ok = await s.reconnectNostrAndSyncGeo();
                              if (!context.mounted) return;
                              final err = s.nostrLastError;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    ok
                                        ? l10n.nostrReconnectOk(
                                            s.nostr.connectedRelays,
                                            s.nostr.totalRelays,
                                          )
                                        : (err != null && err.isNotEmpty)
                                            ? l10n.nostrReconnectFailedDetail(
                                                err,
                                              )
                                            : l10n.nostrReconnectFailed,
                                  ),
                                ),
                              );
                            },
                      icon: s.nostrReconnecting
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.cloud_sync_outlined, size: 18),
                      label: Text(
                        s.nostrReconnecting
                            ? l10n.nostrReconnecting
                            : l10n.geoReconnectNostr,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

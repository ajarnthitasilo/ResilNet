import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../models/geo_discovery.dart';
import '../state/app_state.dart';

/// Empty-state panel for Area / online-people discovery with actionable hints.
class GeoDiscoveryEmptyPanel extends StatelessWidget {
  const GeoDiscoveryEmptyPanel({super.key, this.channelLabel});

  final String? channelLabel;

  String _message(AppLocalizations l10n, GeoDiscoveryEmptyReason reason) {
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

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (s.feedChannel.name == 'geo' && s.transportMode.usesInternet) ...[
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
              _message(l10n, reason),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white54,
                    height: 1.4,
                  ),
            ),
            if (showActions) ...[
              const SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (reason == GeoDiscoveryEmptyReason.noLocation)
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
                  if (reason == GeoDiscoveryEmptyReason.noNostr)
                    FilledButton.tonalIcon(
                      onPressed: () => s.reconnectNostrAndSyncGeo(),
                      icon: const Icon(Icons.cloud_sync_outlined, size: 18),
                      label: Text(l10n.geoReconnectNostr),
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

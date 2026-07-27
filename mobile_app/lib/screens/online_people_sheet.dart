import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/area_presence.dart';
import '../models/feed_channel.dart';
import '../widgets/geo_discovery_empty.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'chat_screen.dart';

/// People online for #mesh / Area — anon discovery + 1:1 when messageable.
Future<void> showOnlinePeopleSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _OnlinePeopleSheet(),
  );
}

class _OnlinePeopleSheet extends StatelessWidget {
  const _OnlinePeopleSheet();

  List<AreaPresenceEntry> _entries(AppState s) {
    if (s.feedChannel == FeedChannel.mesh) {
      final peers = s.isReady ? s.mesh.nearbyPeers : const [];
      return [
        for (final p in peers)
          AreaPresenceEntry(
            id: p.id,
            label: p.displayName?.trim().isNotEmpty == true
                ? p.displayName!.trim()
                : p.id,
            source: PresenceSource.mesh,
            geohash: p.geohash,
            lastSeen: p.lastSeen,
            peer: p,
          ),
      ];
    }
    return s.areaPresenceOnline();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final entries = _entries(s);
    final channel = s.feedChannel == FeedChannel.mesh
        ? '#mesh'
        : s.geoChannelLabel;

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.75,
      decoration: const BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.onlinePeopleTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      channel,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ResilNetTheme.channelGreen,
                            fontFamily: 'monospace',
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          if (s.feedChannel == FeedChannel.geo && s.transportMode.usesInternet) ...[
            Text(
              l10n.geoDiscoveryStatus(s.geoChannelLabel, s.nostrRelayLabel),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white38,
                    fontFamily: 'monospace',
                  ),
            ),
            const SizedBox(height: 4),
          ],
          Text(
            l10n.onlinePeopleCount(entries.length),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white54,
                ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: entries.isEmpty
                ? GeoDiscoveryEmptyPanel(channelLabel: channel)
                : ListView.separated(
                    itemCount: entries.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 8),
                    itemBuilder: (context, i) {
                      final e = entries[i];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Identicon(id: e.id),
                        title: Text(
                          e.label,
                          style: TextStyle(
                            color: e.source.isInternet
                                ? const Color(0xFFFF9F43)
                                : ResilNetTheme.identityOrange,
                          ),
                        ),
                        subtitle: Text(
                          !e.canMessage
                              ? l10n.geoPeerNostrSubtitle(channel)
                              : e.source.isInternet && !e.source.isMesh
                                  ? l10n.geoPeerInternetSubtitle(channel)
                                  : l10n.geoPeerSubtitle(channel),
                        ),
                        trailing: Icon(
                          e.canMessage
                              ? Icons.lock_outline
                              : Icons.travel_explore_outlined,
                          size: 18,
                        ),
                        onTap: () {
                          if (!e.canMessage) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.geoPeerDiscoverOnlySnack),
                              ),
                            );
                            return;
                          }
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(peerId: e.peer!.id),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

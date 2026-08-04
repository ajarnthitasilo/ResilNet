import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/peer_id.dart';
import '../l10n/l10n_ext.dart';
import '../models/local_wifi_link.dart';
import '../services/local_wifi_link_service.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'chat_screen.dart';
import 'identity_screen.dart';

/// Local Wi‑Fi link (no internet): Hotspot nearby vs Router LAN.
Future<void> showLocalWifiLinkSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _LocalWifiLinkSheet(),
  );
}

class _LocalWifiLinkSheet extends StatelessWidget {
  const _LocalWifiLinkSheet();

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final link = s.localWifi;
    final l10n = context.l10n;
    final height = MediaQuery.sizeOf(context).height * 0.88;

    return ResilNetTheme.glassPanel(
      context: context,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      blurSigma: 28,
      child: SizedBox(
        height: height,
        child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: link == null
              ? Center(child: Text(l10n.localWifiUnavailable))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.localWifiTitle,
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
                      l10n.localWifiSubtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(context),
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.localWifiNotGatewayHint,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(
                              context,
                              alpha: 0.55,
                            ),
                          ),
                    ),
                    const SizedBox(height: 14),
                    SegmentedButton<LocalWifiMode>(
                      segments: [
                        ButtonSegment(
                          value: LocalWifiMode.hotspot,
                          label: Text(l10n.localWifiModeHotspot),
                          icon: const Icon(Icons.wifi_tethering, size: 18),
                        ),
                        ButtonSegment(
                          value: LocalWifiMode.router,
                          label: Text(l10n.localWifiModeRouter),
                          icon: const Icon(Icons.router_outlined, size: 18),
                        ),
                      ],
                      selected: {link.mode},
                      onSelectionChanged: (set) {
                        link.setMode(set.first);
                        if (set.first == LocalWifiMode.router) {
                          unawaited(link.prepareRouter());
                        }
                      },
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: link.mode == LocalWifiMode.hotspot
                          ? _HotspotPane(link: link)
                          : _RouterPane(link: link),
                    ),
                  ],
                ),
        ),
      ),
      ),
    );
  }
}

class _HotspotPane extends StatelessWidget {
  const _HotspotPane({required this.link});

  final LocalWifiLinkService link;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    switch (link.phase) {
      case LocalWifiPhase.hostSetup:
        return _HostSetup(link: link);
      case LocalWifiPhase.joinSetup:
        return _JoinSetup(link: link);
      case LocalWifiPhase.hostWaiting:
        return _ActiveSession(
          link: link,
          title: l10n.localWifiHostWaiting,
        );
      case LocalWifiPhase.joinConnectedLan:
      case LocalWifiPhase.discovering:
        return _ActiveSession(
          link: link,
          title: l10n.localWifiDiscovering,
        );
      case LocalWifiPhase.peersFound:
        return _ActiveSession(
          link: link,
          title: l10n.localWifiPeersFound,
        );
      case LocalWifiPhase.error:
        return _StatusBlock(
          icon: Icons.error_outline,
          title: l10n.localWifiErrorTitle,
          body: link.errorMessage ?? l10n.localWifiErrorBody,
          actionLabel: l10n.localWifiStop,
          onAction: () => link.stop(),
        );
      default:
        return ListView(
          children: [
            Text(
              l10n.localWifiHotspotIntro,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: link.beginHostSetup,
              icon: const Icon(Icons.podcasts_outlined),
              label: Text(l10n.localWifiHostAction),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: link.beginJoinSetup,
              icon: const Icon(Icons.login),
              label: Text(l10n.localWifiJoinAction),
            ),
          ],
        );
    }
  }
}

class _HostSetup extends StatelessWidget {
  const _HostSetup({required this.link});

  final LocalWifiLinkService link;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      children: [
        Text(
          l10n.localWifiHostSteps,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => unawaited(link.startHostWaiting()),
          icon: const Icon(Icons.hourglass_top),
          label: Text(l10n.localWifiHostReady),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => link.stop(),
          child: Text(l10n.cancel),
        ),
      ],
    );
  }
}

class _JoinSetup extends StatelessWidget {
  const _JoinSetup({required this.link});

  final LocalWifiLinkService link;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ListView(
      children: [
        Text(
          l10n.localWifiJoinSteps,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => unawaited(link.startJoinSearch()),
          icon: const Icon(Icons.search),
          label: Text(l10n.localWifiJoinReady),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => link.stop(),
          child: Text(l10n.cancel),
        ),
      ],
    );
  }
}

class _RouterPane extends StatelessWidget {
  const _RouterPane({required this.link});

  final LocalWifiLinkService link;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (link.phase == LocalWifiPhase.routerNoWifi) {
      return _StatusBlock(
        icon: Icons.wifi_off_outlined,
        title: l10n.localWifiRouterNoWifiTitle,
        body: l10n.localWifiRouterNoWifiBody,
        actionLabel: l10n.localWifiRefreshNetwork,
        onAction: () => unawaited(link.prepareRouter()),
      );
    }
    if (link.phase == LocalWifiPhase.routerIsolatedHint) {
      return _StatusBlock(
        icon: Icons.device_unknown_outlined,
        title: l10n.localWifiIsolationTitle,
        body: l10n.localWifiIsolationBody,
        actionLabel: l10n.localWifiStop,
        onAction: () => link.stop(),
      );
    }
    if (link.phase == LocalWifiPhase.discovering ||
        link.phase == LocalWifiPhase.peersFound) {
      return _ActiveSession(
        link: link,
        title: l10n.localWifiDiscovering,
      );
    }

    // idle / routerReady / stopped
    return ListView(
      children: [
        Text(
          l10n.localWifiRouterIntro,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(height: 1.45),
        ),
        const SizedBox(height: 12),
        _NetworkChip(link: link),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: () => unawaited(link.startDiscovering()),
          icon: const Icon(Icons.search),
          label: Text(l10n.localWifiRouterSearch),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () => unawaited(link.prepareRouter()),
          child: Text(l10n.localWifiRefreshNetwork),
        ),
      ],
    );
  }
}

class _ActiveSession extends StatelessWidget {
  const _ActiveSession({required this.link, required this.title});

  final LocalWifiLinkService link;
  final String title;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final discovering = link.phase == LocalWifiPhase.discovering ||
        link.phase == LocalWifiPhase.hostWaiting ||
        link.phase == LocalWifiPhase.joinConnectedLan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            if (discovering && link.peers.isEmpty) ...[
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Text(title, style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _NetworkChip(link: link),
        if (link.stubDiscovery) ...[
          const SizedBox(height: 8),
          Text(
            l10n.localWifiStubBanner,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Colors.orangeAccent.withValues(alpha: 0.9),
                ),
          ),
        ] else ...[
          const SizedBox(height: 8),
          Text(
            l10n.localWifiLiveBanner,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ResilNetTheme.emerald.withValues(alpha: 0.95),
                ),
          ),
        ],
        const SizedBox(height: 10),
        Expanded(
          child: link.peers.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      link.mode == LocalWifiMode.router
                          ? l10n.localWifiEmptyRouter
                          : l10n.localWifiEmptyHotspot,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(context),
                          ),
                    ),
                  ),
                )
              : ListView.separated(
                  itemCount: link.peers.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (context, i) {
                    final p = link.peers[i];
                    return ListTile(
                      leading: Identicon(id: p.id, size: 36),
                      title: Text(p.label),
                      subtitle: Text(
                        p.canMessage
                            ? l10n.localWifiPeerReady
                            : l10n.localWifiPeerNeedKey,
                        style: TextStyle(
                          color: p.canMessage
                              ? ResilNetTheme.emerald
                              : ResilNetTheme.mutedOnSurface(context),
                        ),
                      ),
                      trailing: Text(
                        formatShortPeerId(p.id),
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                      onTap: () {
                        if (!p.canMessage || p.id.startsWith('lan:')) {
                          Navigator.pop(context);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const IdentityScreen(),
                            ),
                          );
                          return;
                        }
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(peerId: p.id),
                          ),
                        );
                      },
                    );
                  },
                ),
        ),
        if (link.mode == LocalWifiMode.router && link.peers.isEmpty) ...[
          TextButton(
            onPressed: link.markIsolatedHint,
            child: Text(l10n.localWifiIsolationHelp),
          ),
        ],
        OutlinedButton.icon(
          onPressed: () => link.stop(),
          icon: const Icon(Icons.stop_circle_outlined),
          label: Text(l10n.localWifiStop),
        ),
      ],
    );
  }
}

class _NetworkChip extends StatelessWidget {
  const _NetworkChip({required this.link});

  final LocalWifiLinkService link;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ssid = (link.ssid ?? '').trim();
    final ip = (link.localIp ?? '').trim();
    final text = [
      if (ssid.isNotEmpty) ssid else l10n.localWifiSsidUnknown,
      if (ip.isNotEmpty) ip,
    ].join(' · ');
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: ResilNetTheme.glassDecoration(
          context,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontFamily: 'monospace',
              ),
        ),
      ),
    );
  }
}

class _StatusBlock extends StatelessWidget {
  const _StatusBlock({
    required this.icon,
    required this.title,
    required this.body,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String body;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Icon(icon, size: 40, color: ResilNetTheme.emerald),
        const SizedBox(height: 12),
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ResilNetTheme.mutedOnSurface(context),
                height: 1.45,
              ),
        ),
        const SizedBox(height: 16),
        FilledButton(onPressed: onAction, child: Text(actionLabel)),
      ],
    );
  }
}

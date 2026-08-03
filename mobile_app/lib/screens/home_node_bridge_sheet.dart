import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';

/// Product UI for Mac/Pi LXMF home-node bridge (no raw JSON).
Future<void> showHomeNodeBridgeSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _HomeNodeBridgeSheet(),
  );
}

class _HomeNodeBridgeSheet extends StatefulWidget {
  const _HomeNodeBridgeSheet();

  @override
  State<_HomeNodeBridgeSheet> createState() => _HomeNodeBridgeSheetState();
}

class _HomeNodeBridgeSheetState extends State<_HomeNodeBridgeSheet> {
  late final TextEditingController _urlCtrl;
  bool _checking = false;
  bool _urlReady = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_urlReady) return;
    final s = context.read<AppState>();
    _urlCtrl = TextEditingController(text: s.lxmfBridgeBaseUrl);
    _urlReady = true;
  }

  @override
  void dispose() {
    if (_urlReady) _urlCtrl.dispose();
    super.dispose();
  }

  Future<void> _saveUrlAndCheck(AppState s) async {
    setState(() => _checking = true);
    try {
      await s.setLxmfBridgeBaseUrl(_urlCtrl.text);
      _urlCtrl.text = s.lxmfBridgeBaseUrl;
      await s.refreshLxmfBridgeStatus();
    } finally {
      if (mounted) setState(() => _checking = false);
    }
  }

  Future<void> _copyDest(String dest) async {
    await Clipboard.setData(ClipboardData(text: dest));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(context.l10n.lxmfBridgeDestCopied)),
    );
  }

  Future<void> _addLink(AppState s) async {
    final l10n = context.l10n;
    final peers = await s.messageablePeersForInvite();
    if (!mounted) return;
    if (peers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.lxmfBridgeNoPeers)),
      );
      return;
    }

    Peer selected = peers.first;
    final destCtrl = TextEditingController(
      text: s.lxmfDestForPeer(selected.id),
    );

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setLocal) {
            return AlertDialog(
              title: Text(l10n.lxmfBridgeAddLink),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(l10n.lxmfBridgePickPeer),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<Peer>(
                      // ignore: deprecated_member_use
                      value: selected,
                      items: [
                        for (final p in peers)
                          DropdownMenuItem(
                            value: p,
                            child: Text(
                              s.peerDisplayLabel(
                                p.id,
                                fallbackNick: p.displayName,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                      onChanged: (p) {
                        if (p == null) return;
                        setLocal(() {
                          selected = p;
                          destCtrl.text = s.lxmfDestForPeer(p.id);
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: destCtrl,
                      decoration: InputDecoration(
                        labelText: l10n.lxmfBridgePeerDest,
                        hintText: l10n.lxmfBridgePeerDestHint,
                      ),
                      minLines: 1,
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx, false),
                  child: Text(l10n.cancel),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text(l10n.lxmfBridgeSaveLink),
                ),
              ],
            );
          },
        );
      },
    );

    final peer = selected;
    final destRaw = destCtrl.text;
    destCtrl.dispose();
    if (ok != true || !mounted) return;

    final err = await s.upsertLxmfPeerDest(
      peerId: peer.id,
      lxmfDest: destRaw,
    );
    if (!mounted) return;
    if (err != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.lxmfBridgeInvalidDest)),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.lxmfBridgeLinkSaved)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final bridge = s.lxmfBridge;
    final height = MediaQuery.sizeOf(context).height * 0.88;
    final map = s.lxmfPeerDestMap;
    final dest = bridge?.lxmfDestination?.trim() ?? '';
    final muted = ResilNetTheme.mutedOnSurface(context);

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradientFor(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: muted.withValues(alpha: 0.35),
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.lxmfBridgeTitle,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 6),
              Text(
                l10n.lxmfBridgeSubtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: muted,
                    ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  children: [
                    SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      secondary: Icon(
                        Icons.home_work_outlined,
                        color: s.lxmfBridgeEnabled && bridge?.online == true
                            ? ResilNetTheme.emerald
                            : muted,
                      ),
                      title: Text(l10n.lxmfBridgeEnable),
                      subtitle: Text(
                        s.lxmfBridgeEnabled
                            ? (bridge?.online == true
                                ? l10n.lxmfBridgeStatusOnline
                                : l10n.lxmfBridgeStatusOffline)
                            : l10n.lxmfBridgeDisabledHint,
                      ),
                      value: s.lxmfBridgeEnabled,
                      onChanged: (v) => unawaited(s.setLxmfBridgeEnabled(v)),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _urlCtrl,
                      decoration: InputDecoration(
                        labelText: l10n.lxmfBridgeBaseUrl,
                        hintText: '192.168.1.10:8766',
                        helperText: l10n.lxmfBridgeBaseUrlHelper,
                      ),
                      keyboardType: TextInputType.url,
                      onSubmitted: (_) => unawaited(_saveUrlAndCheck(s)),
                    ),
                    const SizedBox(height: 10),
                    FilledButton.tonalIcon(
                      onPressed: _checking
                          ? null
                          : () => unawaited(_saveUrlAndCheck(s)),
                      icon: _checking
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.wifi_tethering),
                      label: Text(l10n.lxmfBridgeCheckConnection),
                    ),
                    if (s.lxmfBridgeEnabled) ...[
                      const SizedBox(height: 12),
                      Card(
                        elevation: 0,
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withValues(alpha: 0.45),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bridge?.online == true
                                    ? l10n.lxmfBridgeStatusOnline
                                    : l10n.lxmfBridgeOffline(
                                        bridge?.lastError ?? '—',
                                      ),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              if (dest.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                Text(
                                  l10n.lxmfBridgeYourDest,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(color: muted),
                                ),
                                const SizedBox(height: 4),
                                SelectableText(
                                  dest,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontFamily: 'monospace'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: TextButton.icon(
                                    onPressed: () => unawaited(_copyDest(dest)),
                                    icon: const Icon(Icons.copy, size: 18),
                                    label: Text(l10n.lxmfBridgeCopyDest),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    Text(
                      l10n.lxmfBridgeLinkedPeers,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.lxmfBridgeLinkedPeersHint,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: muted,
                          ),
                    ),
                    const SizedBox(height: 8),
                    if (map.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          l10n.lxmfBridgeNoLinks,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: muted),
                        ),
                      )
                    else
                      ...map.entries.map((e) {
                        final label = s.peerDisplayLabel(e.key);
                        final shortDest = e.value.length > 12
                            ? '${e.value.substring(0, 12)}…'
                            : e.value;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Identicon(id: e.key, size: 36),
                          title: Text(label),
                          subtitle: Text(
                            shortDest,
                            style: const TextStyle(fontFamily: 'monospace'),
                          ),
                          trailing: IconButton(
                            tooltip: l10n.lxmfBridgeRemoveLink,
                            onPressed: () =>
                                unawaited(s.removeLxmfPeerDest(e.key)),
                            icon: const Icon(Icons.link_off_outlined),
                          ),
                          onTap: () async {
                            final ctrl = TextEditingController(text: e.value);
                            final save = await showDialog<bool>(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text(label),
                                content: TextField(
                                  controller: ctrl,
                                  decoration: InputDecoration(
                                    labelText: l10n.lxmfBridgePeerDest,
                                  ),
                                  minLines: 1,
                                  maxLines: 2,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, false),
                                    child: Text(l10n.cancel),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(ctx, true),
                                    child: Text(l10n.lxmfBridgeSaveLink),
                                  ),
                                ],
                              ),
                            );
                            final raw = ctrl.text;
                            ctrl.dispose();
                            if (save != true || !context.mounted) return;
                            final err = await s.upsertLxmfPeerDest(
                              peerId: e.key,
                              lxmfDest: raw,
                            );
                            if (!context.mounted) return;
                            if (err != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.lxmfBridgeInvalidDest),
                                ),
                              );
                            }
                          },
                        );
                      }),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => unawaited(_addLink(s)),
                      icon: const Icon(Icons.person_add_alt_1_outlined),
                      label: Text(l10n.lxmfBridgeAddLink),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.lxmfBridgeHelp,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: muted.withValues(alpha: 0.7),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/app_version.dart';
import '../core/docs_links.dart';
import '../l10n/l10n_ext.dart';
import '../l10n/supported_locales.dart';
import '../models/notice_expiry.dart';
import '../models/gateway_radio_mode.dart';
import '../models/transport_mode.dart';
import '../app/tokens.dart';
import '../state/app_state.dart';
import '../widgets/cached_future_builder.dart';
import '../widgets/page_shell.dart';
import 'announcements_screen.dart';
import 'esp32_firmware_screen.dart';
import 'home_node_bridge_sheet.dart';
import 'info_sheet.dart';
import 'local_wifi_link_sheet.dart';
import 'mesh_topology_screen.dart';
import 'meshtastic_bridge_screen.dart';
import 'panic_wipe.dart';
import '../widgets/app_recovery_actions.dart';
import '../app/glass_overlays.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

/// One titled group of settings.
///
/// Settings used to be a single flat 600-line list with bare text headings;
/// grouping them lets each section render as a card and lets the search field
/// filter whole sections instead of scrolling for them.
class _SettingsSection {
  const _SettingsSection({
    required this.title,
    required this.children,
    this.subtitle,
    this.keywords = const <String>[],
    this.danger = false,
  });

  final String title;
  final String? subtitle;
  final List<String> keywords;
  final List<Widget> children;
  final bool danger;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    if (title.toLowerCase().contains(q)) return true;
    if ((subtitle ?? '').toLowerCase().contains(q)) return true;
    return keywords.any((k) => k.toLowerCase().contains(q));
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.section});

  final _SettingsSection section;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: ResilNetTheme.glassPanel(
        context: context,
        borderRadius: BorderRadius.circular(18),
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              section.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: section.danger ? scheme.error : null,
                  ),
            ),
            if (section.subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                section.subtitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(context),
                    ),
              ),
            ],
            const SizedBox(height: 10),
            ...section.children,
          ],
        ),
      ),
    );
  }
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _clearing = false;
  bool _wiping = false;
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _pickLanguage(BuildContext context, AppState s) async {
    final l10n = context.l10n;
    final selected = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final height = MediaQuery.sizeOf(ctx).height * 0.75;
        final current = s.localeOverrideCode;
        return ResilNetTheme.glassPanel(
          context: ctx,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          blurSigma: 28,
          child: SizedBox(
          height: height,
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(l10n.language, style: Theme.of(ctx).textTheme.titleLarge),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView(
                    children: [
                      RadioListTile<String>(
                        value: 'system',
                        // ignore: deprecated_member_use
                        groupValue: current ?? 'system',
                        title: Text(l10n.languageSystem),
                        subtitle: Text(l10n.languageSubtitle),
                        onChanged: (v) => Navigator.pop(ctx, v),
                      ),
                      const Divider(),
                      for (final o in kAppLocaleOptions)
                        RadioListTile<String>(
                          value: o.id,
                          // ignore: deprecated_member_use
                          groupValue: current ?? 'system',
                          title: Text(o.nativeName),
                          subtitle: Text(o.englishName),
                          onChanged: (v) => Navigator.pop(ctx, v),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        );
      },
    );
    if (selected == null || !context.mounted) return;
    if (selected == 'system') {
      await s.setLocaleOverrideId(null);
    } else {
      await s.setLocaleOverrideId(selected);
    }
  }

  Future<void> _confirmClearLocation(AppState s) async {
    if (_clearing || _wiping) return;
    final l10n = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return GlassAlertDialog(
          title: Text(l10n.settingsClearLocationConfirmTitle),
          content: Text(l10n.settingsClearLocationConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.settingsClearLocationAction),
            ),
          ],
        );
      },
    );
    if (ok != true || !mounted) return;
    await s.clearStoredGeohash();
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(content: Text(context.l10n.settingsClearLocationSnack)),
    );
  }

  Future<void> _confirmClearMessages() async {
    if (_clearing || _wiping) return;
    final l10n = context.l10n;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return GlassAlertDialog(
          title: Text(l10n.settingsClearConfirmTitle),
          content: Text(l10n.settingsClearConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.settingsClearAction),
            ),
          ],
        );
      },
    );

    if (ok != true || !mounted) return;

    setState(() => _clearing = true);
    try {
      await context.read<AppState>().clearAllMessages();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(context.l10n.settingsClearedSnack)),
      );
    } finally {
      if (mounted) setState(() => _clearing = false);
    }
  }

  Future<void> _confirmPanicWipe() async {
    if (_clearing || _wiping) return;
    setState(() => _wiping = true);
    try {
      final wiped = await confirmAndPanicWipe(context);
      if (!mounted || !wiped) return;
    } finally {
      if (mounted) setState(() => _wiping = false);
    }
  }

  Widget _searchField(AppLocalizations l10n) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: TextField(
          controller: _searchController,
          onChanged: (v) => setState(() => _query = v),
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: l10n.settingsSearchHint,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _query.isEmpty
                ? null
                : IconButton(
                    tooltip: l10n.cancel,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _query = '');
                    },
                  ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = context.watch<AppState>();
    final override = s.localeOverrideCode;

    final sections = <_SettingsSection>[
      _SettingsSection(
        title: l10n.language,
        subtitle: l10n.languageSubtitle,
        keywords: [l10n.languageSystem, 'language', 'ภาษา'],
        children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.translate),
              title: Text(l10n.language),
              subtitle: Text(
                () {
                  if (override == null) return l10n.languageSystem;
                  for (final o in kAppLocaleOptions) {
                    if (o.id == override) return o.menuLabel;
                  }
                  return override;
                }(),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => unawaited(_pickLanguage(context, s)),
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.localWifiTitle,
        subtitle: l10n.localWifiSubtitle,
        keywords: ['wifi', 'lan', 'hotspot', 'ไวไฟ'],
        children: [
            FilledButton.tonalIcon(
              onPressed: () => unawaited(showLocalWifiLinkSheet(context)),
              icon: const Icon(Icons.wifi_lock_outlined),
              label: Text(l10n.localWifiTitle),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.localWifiNotGatewayHint,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context, alpha: 0.55),
                  ),
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.lxmfBridgeTitle,
        subtitle: l10n.lxmfBridgeSubtitle,
        keywords: ['lxmf', 'reticulum', 'home node', 'bridge'],
        children: [
            FilledButton.tonalIcon(
              onPressed: () => unawaited(showHomeNodeBridgeSheet(context)),
              icon: Icon(
                Icons.home_work_outlined,
                color: s.lxmfBridgeEnabled && s.lxmfBridge?.online == true
                    ? ResilNetTheme.emerald
                    : null,
              ),
              label: Text(l10n.lxmfBridgeOpen),
            ),
            const SizedBox(height: 8),
            Text(
              s.lxmfBridgeEnabled
                  ? (s.lxmfBridge?.online == true
                      ? l10n.lxmfBridgeStatusOnline
                      : l10n.lxmfBridgeStatusOffline)
                  : l10n.lxmfBridgeDisabledHint,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context, alpha: 0.55),
                  ),
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.appRecoverySection,
        subtitle: l10n.appRecoverySectionSubtitle,
        keywords: [
          l10n.appHardRecoverAction,
          l10n.appSessionResetAction,
          'recover',
          'reset',
          'กู้คืน',
        ],
        children: [
            FilledButton.icon(
              onPressed: s.recovering
                  ? null
                  : () => unawaited(
                        runAppRecoveryAction(
                          context,
                          busyLabel: l10n.appHardRecovering,
                          action: (state) =>
                              state.hardRecoverApp(reason: 'settings'),
                        ),
                      ),
              icon: const Icon(Icons.healing_outlined),
              label: Text(l10n.appHardRecoverAction),
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: s.recovering
                  ? null
                  : () async {
                      final ok = await showDialog<bool>(
                        context: context,
                        builder: (ctx) => GlassAlertDialog(
                          title: Text(l10n.appSessionResetConfirmTitle),
                          content: Text(l10n.appSessionResetConfirmBody),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx, false),
                              child: Text(l10n.cancel),
                            ),
                            FilledButton(
                              onPressed: () => Navigator.pop(ctx, true),
                              child: Text(l10n.appSessionResetAction),
                            ),
                          ],
                        ),
                      );
                      if (ok != true || !context.mounted) return;
                      await runAppRecoveryAction(
                        context,
                        busyLabel: l10n.appSessionResetRunning,
                        action: (state) =>
                            state.resetAppSession(reason: 'settings'),
                      );
                    },
              icon: const Icon(Icons.restart_alt),
              label: Text(l10n.appSessionResetAction),
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.settingsPrivacy,
        keywords: [
          l10n.settingsE2eeTitle,
          l10n.enableMessageNotifications,
          l10n.settingsScreenshotTitle,
          l10n.meshBridgeTitle,
          l10n.gatewayRadioTitle,
          l10n.transportModeTitle,
          l10n.nostrSectionTitle,
          l10n.nostrTorTitle,
          l10n.settingsNostrExpiryTitle,
          'e2ee',
          'tor',
          'nostr',
          'relay',
          'lora',
          'halow',
          'bluetooth',
          'ความเป็นส่วนตัว',
        ],
        children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.lock_outline,
                color: context.tokens.success,
              ),
              title: Text(l10n.settingsE2eeTitle),
              subtitle: Text(l10n.settingsE2eeSubtitle),
              trailing: Icon(
                Icons.check_circle,
                color: context.tokens.success,
                size: 22,
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.notifications_outlined),
              title: Text(l10n.enableMessageNotifications),
              subtitle: Text(l10n.settingsNotificationsSubtitle),
              value: s.notificationsEnabled,
              onChanged: (v) => unawaited(s.setNotificationsEnabled(v)),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.screenshot_monitor_outlined),
              title: Text(l10n.settingsScreenshotTitle),
              subtitle: Text(l10n.settingsScreenshotSubtitle),
              value: s.screenshotAlerts,
              onChanged: s.setScreenshotAlerts,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                s.meshBridgeEnabled ? Icons.hub : Icons.hub_outlined,
                color: s.meshBridgeEnabled
                    ? ResilNetTheme.emerald
                    : ResilNetTheme.mutedOnSurface(context),
              ),
              title: Text(l10n.meshBridgeTitle),
              subtitle: Text(l10n.meshBridgeSubtitle),
              value: s.meshBridgeEnabled,
              onChanged: s.setMeshBridgeEnabled,
            ),
            const SizedBox(height: 12),
            Text(l10n.gatewayRadioTitle),
            const SizedBox(height: 4),
            Text(
              l10n.gatewayRadioSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context),
                  ),
            ),
            const SizedBox(height: 10),
            SegmentedButton<GatewayRadioMode>(
              segments: [
                ButtonSegment(
                  value: GatewayRadioMode.lora,
                  label: Text(l10n.gatewayRadioLora),
                ),
                ButtonSegment(
                  value: GatewayRadioMode.halow,
                  label: Text(l10n.gatewayRadioHalow),
                  enabled: s.gatewayHalowCapable,
                ),
                ButtonSegment(
                  value: GatewayRadioMode.auto,
                  label: Text(l10n.gatewayRadioAuto),
                ),
              ],
              selected: {s.gatewayRadioMode},
              onSelectionChanged: s.gatewayHalowCapable || s.isGatewayWifiActive
                  ? (set) => unawaited(s.setGatewayRadioMode(set.first))
                  : null,
            ),
            if (!s.gatewayHalowCapable && s.isGatewayWifiActive) ...[
              const SizedBox(height: 6),
              Text(
                l10n.gatewayRadioHalowUnavailable,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(context),
                    ),
              ),
            ],
            if (s.isGatewayWifiActive) ...[
              const SizedBox(height: 6),
              Text(
                l10n.gatewayRadioSharedWarning,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.amberAccent.withValues(alpha: 0.9),
                    ),
              ),
            ],
            const SizedBox(height: 12),
            Text(l10n.transportModeTitle),
            const SizedBox(height: 4),
            Text(
              l10n.transportModeSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context),
                  ),
            ),
            const SizedBox(height: 10),
            SegmentedButton<TransportMode>(
              segments: [
                ButtonSegment(
                  value: TransportMode.mesh,
                  label: Text(l10n.transportModeMesh),
                ),
                ButtonSegment(
                  value: TransportMode.internet,
                  label: Text(l10n.transportModeInternet),
                ),
                ButtonSegment(
                  value: TransportMode.auto,
                  label: Text(l10n.transportModeAuto),
                ),
              ],
              selected: {s.transportMode},
              onSelectionChanged: (set) => s.setTransportMode(set.first),
            ),
            const SizedBox(height: 12),
            CachedFutureBuilder<({String bt, String loc})>(
              // Re-read permission labels when the radio state changes, not on
              // every unrelated AppState tick.
              epoch: s.bleRadioState,
              load: () => s.meshPermissionLabels(),
              builder: (context, snap) {
                final bt = snap.data?.bt ?? '…';
                final loc = snap.data?.loc ?? '…';
                final ble = s.bleRadioRunningLabel;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      l10n.meshBleStatusDetail(bt, loc, ble),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(context),
                            fontFamily: 'monospace',
                          ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => s.ensureBleRadiosStarted(),
                      icon: const Icon(Icons.bluetooth_searching, size: 18),
                      label: Text(l10n.meshBleEnsureAction),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            Text(l10n.nostrSectionTitle),
            const SizedBox(height: 4),
            Text(
              l10n.nostrSectionSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context),
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              s.isNostrOnline
                  ? l10n.nostrStatusOnline(
                      s.nostr.connectedRelays,
                      s.nostr.totalRelays,
                    )
                  : s.nostrInitialized
                      ? l10n.nostrStatusOffline
                      : l10n.nostrStatusNotInit,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: s.isNostrOnline
                        ? ResilNetTheme.emerald
                        : Colors.orangeAccent,
                  ),
            ),
            if (s.nostrLastError != null && s.nostrLastError!.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                l10n.nostrReconnectFailedDetail(s.nostrLastError!),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.orangeAccent.withValues(alpha: 0.9),
                      fontFamily: 'monospace',
                    ),
              ),
            ],
            if (s.nostrRelayRows.isNotEmpty) ...[
              const SizedBox(height: 8),
              for (final row in s.nostrRelayRows)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        size: 8,
                        color: row.connected
                            ? ResilNetTheme.emerald
                            : ResilNetTheme.mutedOnSurface(
                                context,
                                alpha: 0.28,
                              ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          row.url.replaceFirst('wss://', ''),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                fontFamily: 'monospace',
                                color: ResilNetTheme.mutedOnSurface(
                                  context,
                                  alpha: 0.72,
                                ),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: s.nostrReconnecting
                  ? null
                  : () async {
                      final ok = await s.reconnectNostrAndSyncGeo();
                      if (!context.mounted) return;
                      final err = s.nostrLastError;
                      ScaffoldMessenger.of(context).showSnackBar(
                        GlassSnackBar(
                          content: Text(
                            ok
                                ? l10n.nostrReconnectOk(
                                    s.nostr.connectedRelays,
                                    s.nostr.totalRelays,
                                  )
                                : (err != null && err.isNotEmpty)
                                    ? l10n.nostrReconnectFailedDetail(err)
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
                    : l10n.nostrReconnectAction,
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                s.nostrTorEnabled
                    ? Icons.vpn_lock
                    : Icons.vpn_lock_outlined,
                color: s.nostrTorEnabled
                    ? ResilNetTheme.emerald
                    : ResilNetTheme.mutedOnSurface(context),
              ),
              title: Text(l10n.nostrTorTitle),
              subtitle: Text(l10n.nostrTorSubtitle),
              value: s.nostrTorEnabled,
              onChanged: s.nostrReconnecting
                  ? null
                  : (v) async {
                      await s.setNostrTorEnabled(v);
                      if (!context.mounted) return;
                      final err = s.nostrLastError;
                      if (v && !s.isNostrOnline) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          GlassSnackBar(
                            content: Text(
                              (err != null && err.isNotEmpty)
                                  ? l10n.nostrTorFailedDetail(err)
                                  : l10n.nostrTorFailed,
                            ),
                          ),
                        );
                      }
                    },
            ),
            const SizedBox(height: 16),
            Text(l10n.settingsNostrExpiryTitle),
            const SizedBox(height: 4),
            Text(
              l10n.settingsNostrExpirySubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ResilNetTheme.mutedOnSurface(context),
                  ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                for (final e in NoticeExpiry.values)
                  ChoiceChip(
                    label: Text(switch (e) {
                      NoticeExpiry.forever => '∞',
                      NoticeExpiry.oneDay => '1d',
                      NoticeExpiry.threeDays => '3d',
                      NoticeExpiry.sevenDays => '7d',
                    }),
                    selected: s.nostrExpiry == e,
                    onSelected: (_) => s.setNostrExpiry(e),
                  ),
              ],
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.settingsDevices,
        keywords: [
          l10n.settingsClearLocationTitle,
          l10n.announceOpen,
          l10n.topologyOpen,
          l10n.mtBridgeTitle,
          l10n.settingsFirmwareTitle,
          'esp32',
          'firmware',
          'meshtastic',
          'geohash',
          'อุปกรณ์',
        ],
        children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.location_off_outlined),
              title: Text(l10n.settingsClearLocationTitle),
              subtitle: Text(
                s.geoChannelLabel == '#—'
                    ? l10n.settingsClearLocationSubtitle
                    : '${l10n.settingsClearLocationSubtitle}\n${s.geoChannelLabel}${s.geoIsManual ? ' (manual)' : ''}',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => _confirmClearLocation(s),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.campaign_outlined),
              title: Text(l10n.announceOpen),
              subtitle: Text(l10n.announceTitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => openAnnouncementsScreen(context),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.share_outlined),
              title: Text(l10n.topologyOpen),
              subtitle: Text(l10n.topologySubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const MeshTopologyScreen()),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.cell_tower_outlined),
              title: Text(l10n.mtBridgeTitle),
              subtitle: Text(l10n.mtBridgeSettingsSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MeshtasticBridgeScreen(),
                  ),
                );
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.download_outlined),
              title: Text(l10n.settingsFirmwareTitle),
              subtitle: Text(l10n.settingsFirmwareSubtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Esp32FirmwareScreen()),
                );
              },
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.settingsData,
        subtitle: l10n.settingsDataHint,
        keywords: [
          l10n.settingsSaveHistoryTitle,
          l10n.settingsClearTitle,
          'history',
          'ประวัติ',
          'ลบ',
        ],
        children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                s.saveMessageHistory
                    ? Icons.history
                    : Icons.history_toggle_off,
              ),
              title: Text(l10n.settingsSaveHistoryTitle),
              subtitle: Text(l10n.settingsSaveHistorySubtitle),
              value: s.saveMessageHistory,
              onChanged: (v) => s.setSaveMessageHistory(v),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.delete_sweep_outlined,
                color: _clearing || _wiping
                    ? ResilNetTheme.mutedOnSurface(context, alpha: 0.38)
                    : Colors.redAccent,
              ),
              title: Text(l10n.settingsClearTitle),
              subtitle: Text(l10n.settingsClearSubtitle),
              trailing: _clearing
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right),
              enabled: !_clearing && !_wiping,
              onTap: _confirmClearMessages,
            ),
        ],
      ),
      _SettingsSection(
        title: l10n.dangerZoneTitle,
        subtitle: l10n.dangerZoneSubtitle,
        danger: true,
        keywords: [
          l10n.panicWipeTitle,
          l10n.docsGuideTitle,
          'wipe',
          'ล้าง',
          'ฉุกเฉิน',
        ],
        children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.warning_amber_rounded,
                color: _wiping
                    ? ResilNetTheme.mutedOnSurface(context, alpha: 0.38)
                    : context.tokens.danger,
              ),
              title: Text(
                l10n.panicWipeTitle,
                style: TextStyle(color: context.tokens.danger),
              ),
              subtitle: Text(l10n.panicWipeSubtitle),
              trailing: _wiping
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Icon(Icons.chevron_right, color: context.tokens.danger),
              enabled: !_clearing && !_wiping,
              onTap: _confirmPanicWipe,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.menu_book_outlined),
              title: Text(l10n.docsGuideTitle),
              subtitle: Text(l10n.docsGuideSubtitle),
              trailing: const Icon(Icons.open_in_new, size: 20),
              onTap: () => DocsLinks.openUserGuideOrSnack(context),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.infoOpen),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showInfoSheet(context),
            ),
        ],
      ),
    ];

    final visible = sections.where((x) => x.matches(_query)).toList();

    return ResilNetPage(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
          children: [
            _searchField(l10n),
            for (final section in visible) _SettingsCard(section: section),
            if (visible.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  l10n.settingsSearchEmpty(_query),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(context),
                      ),
                ),
              ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                l10n.settingsVersion(kAppVersion),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(context, alpha: 0.4),
                    ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
    );
  }
}

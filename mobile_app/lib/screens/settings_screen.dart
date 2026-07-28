import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/app_version.dart';
import '../l10n/l10n_ext.dart';
import '../models/notice_expiry.dart';
import '../models/transport_mode.dart';
import '../state/app_state.dart';
import 'announcements_screen.dart';
import 'esp32_firmware_screen.dart';
import 'info_sheet.dart';
import 'mesh_topology_screen.dart';
import 'panic_wipe.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _clearing = false;
  bool _wiping = false;

  Future<void> _confirmClearLocation(AppState s) async {
    if (_clearing || _wiping) return;
    final l10n = context.l10n;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
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
      SnackBar(content: Text(context.l10n.settingsClearLocationSnack)),
    );
  }

  Future<void> _confirmClearMessages() async {
    if (_clearing || _wiping) return;
    final l10n = context.l10n;

    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
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
        SnackBar(content: Text(context.l10n.settingsClearedSnack)),
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

  Widget _section(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = context.watch<AppState>();
    final override = s.localeOverrideCode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: Container(
        decoration: const BoxDecoration(gradient: ResilNetTheme.scaffoldGradient),
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            _section(l10n.language),
            Text(
              l10n.languageSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
            ),
            const SizedBox(height: 12),
            SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: 'system',
                  label: Text(l10n.languageSystem),
                ),
                ButtonSegment(value: 'th', label: Text(l10n.languageThai)),
                ButtonSegment(value: 'en', label: Text(l10n.languageEnglish)),
              ],
              selected: {override ?? 'system'},
              onSelectionChanged: (set) {
                final next = set.first;
                if (next == 'system') {
                  s.setLocaleOverride(null);
                } else {
                  s.setLocaleOverride(Locale(next));
                }
              },
            ),
            const SizedBox(height: 28),
            _section(l10n.settingsPrivacy),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.lock_outline,
                color: ResilNetTheme.emerald,
              ),
              title: Text(l10n.settingsE2eeTitle),
              subtitle: Text(l10n.settingsE2eeSubtitle),
              trailing: const Icon(
                Icons.check_circle,
                color: ResilNetTheme.emerald,
                size: 22,
              ),
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
                    : Colors.white54,
              ),
              title: Text(l10n.meshBridgeTitle),
              subtitle: Text(l10n.meshBridgeSubtitle),
              value: s.meshBridgeEnabled,
              onChanged: s.setMeshBridgeEnabled,
            ),
            const SizedBox(height: 12),
            Text(l10n.transportModeTitle),
            const SizedBox(height: 4),
            Text(
              l10n.transportModeSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
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
            FutureBuilder<({String bt, String loc})>(
              future: s.meshPermissionLabels(),
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
                            color: Colors.white.withValues(alpha: 0.55),
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
                    color: Colors.white.withValues(alpha: 0.55),
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
                            : Colors.white24,
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
                                color: Colors.white54,
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
                        SnackBar(
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
            const SizedBox(height: 16),
            Text(l10n.settingsNostrExpiryTitle),
            const SizedBox(height: 4),
            Text(
              l10n.settingsNostrExpirySubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: [
                for (final e in NoticeExpiry.values)
                  ChoiceChip(
                    label: Text(
                      e == NoticeExpiry.forever
                          ? '∞'
                          : e == NoticeExpiry.oneDay
                              ? '1d'
                              : e == NoticeExpiry.threeDays
                                  ? '3d'
                                  : '7d',
                    ),
                    selected: s.nostrExpiry == e,
                    onSelected: (_) => s.setNostrExpiry(e),
                  ),
              ],
            ),
            const SizedBox(height: 24),
            _section(l10n.settingsDevices),
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
            const SizedBox(height: 24),
            _section(l10n.settingsData),
            Text(
              l10n.settingsDataHint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
            ),
            const SizedBox(height: 8),
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
                color: _clearing || _wiping ? Colors.white38 : Colors.redAccent,
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
            const SizedBox(height: 28),
            _section(l10n.dangerZoneTitle),
            Text(
              l10n.dangerZoneSubtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
            ),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.warning_amber_rounded,
                color: _wiping ? Colors.white38 : Colors.redAccent,
              ),
              title: Text(
                l10n.panicWipeTitle,
                style: const TextStyle(color: Colors.redAccent),
              ),
              subtitle: Text(l10n.panicWipeSubtitle),
              trailing: _wiping
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.chevron_right, color: Colors.redAccent),
              enabled: !_clearing && !_wiping,
              onTap: _confirmPanicWipe,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.infoOpen),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => showInfoSheet(context),
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                l10n.settingsVersion(kAppVersion),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.4),
                    ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

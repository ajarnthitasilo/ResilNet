import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/app_version.dart';
import '../l10n/l10n_ext.dart';
import '../models/notice_expiry.dart';
import '../models/transport_mode.dart';
import '../state/app_state.dart';
import 'esp32_firmware_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _clearing = false;

  Future<void> _confirmClearMessages() async {
    if (_clearing) return;
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
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: Icon(
                s.e2eeEnabled ? Icons.lock_outline : Icons.lock_open,
                color: s.e2eeEnabled ? ResilNetTheme.emerald : Colors.orangeAccent,
              ),
              title: Text(l10n.settingsE2eeTitle),
              subtitle: Text(l10n.settingsE2eeSubtitle),
              value: s.e2eeEnabled,
              onChanged: s.setE2eeEnabled,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.screenshot_monitor_outlined),
              title: Text(l10n.settingsScreenshotTitle),
              subtitle: Text(l10n.settingsScreenshotSubtitle),
              value: s.screenshotAlerts,
              onChanged: s.setScreenshotAlerts,
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
            const SizedBox(height: 8),
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
            const SizedBox(height: 28),
            _section(l10n.settingsDevices),
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
                color: _clearing ? Colors.white38 : Colors.redAccent,
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
              enabled: !_clearing,
              onTap: _confirmClearMessages,
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

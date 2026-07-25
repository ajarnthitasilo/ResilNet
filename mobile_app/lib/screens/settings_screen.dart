import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_version.dart';
import '../l10n/l10n_ext.dart';
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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = context.watch<AppState>();
    final override = s.localeOverrideCode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(l10n.language, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            l10n.languageSubtitle,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.65),
                ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: SegmentedButton<String>(
                segments: [
                  ButtonSegment(
                    value: 'system',
                    label: Text(l10n.languageSystem),
                    icon: const Icon(Icons.phone_android, size: 16),
                  ),
                  ButtonSegment(
                    value: 'th',
                    label: Text(l10n.languageThai),
                  ),
                  ButtonSegment(
                    value: 'en',
                    label: Text(l10n.languageEnglish),
                  ),
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
            ),
          ),
          const SizedBox(height: 24),
          Text(l10n.settingsDevices, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
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
          ),
          const SizedBox(height: 24),
          Text(l10n.settingsData, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            l10n.settingsDataHint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.65),
                ),
          ),
          const SizedBox(height: 12),
          Card(
            child: SwitchListTile(
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
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
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
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              l10n.settingsVersion(kAppVersion),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Colors.white.withValues(alpha: 0.45),
                  ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

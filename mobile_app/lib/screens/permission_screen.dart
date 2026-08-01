import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/platform_caps.dart';
import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  bool _requesting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final s = context.read<AppState>();
      if (PlatformCaps.isMacOS) {
        // No permission_handler on macOS — continue into the app immediately.
        if (s.isReady && !s.permissionsGranted) {
          await s.requestPermissions();
        } else {
          await s.refreshPermissions();
        }
        return;
      }
      await s.refreshPermissions();
    });
  }

  Future<void> _request() async {
    debugPrint('[ResilNet] PermissionScreen: button pressed');
    final s = context.read<AppState>();
    final l10n = context.l10n;
    if (!s.isReady) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.permissionNotReadySnack)),
      );
      return;
    }
    setState(() => _requesting = true);
    try {
      final granted = await s.requestPermissions();
      debugPrint(
        '[ResilNet] PermissionScreen: request finished granted=$granted',
      );
      if (!mounted) return;
      if (!granted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.permissionDeniedSnack)),
        );
      }
    } catch (e, st) {
      debugPrint('[ResilNet] PermissionScreen: request ERROR $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.permissionFailedSnack('$e'))),
      );
    } finally {
      if (mounted) setState(() => _requesting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.communityTitle)),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text(
              l10n.permissionTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(
              l10n.permissionBody,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.78),
                    height: 1.4,
                  ),
            ),
            const SizedBox(height: 18),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.shield, color: ResilNetTheme.emerald),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        l10n.permissionE2ee,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _requesting ? null : _request,
                child: _requesting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        s.permissionsGranted
                            ? l10n.permissionReady
                            : l10n.permissionRequest,
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                l10n.permissionFooter,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

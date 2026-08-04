import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../models/app_recovery.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

/// Run Soft / Hard / Session recovery with a blocking progress dialog.
Future<void> runAppRecoveryAction(
  BuildContext context, {
  required Future<AppRecoveryReport> Function(AppState s) action,
  required String busyLabel,
}) async {
  final s = context.read<AppState>();
  final l10n = context.l10n;
  if (s.recovering) {
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(content: Text(l10n.appRecoveryBusy)),
    );
    return;
  }

  // Close stuck modal sheets / dialogs on the root navigator when possible.
  final rootNav = Navigator.of(context, rootNavigator: true);
  var pops = 0;
  while (pops < 6 && rootNav.canPop()) {
    final route = ModalRoute.of(context);
    if (route is PopupRoute) {
      rootNav.pop();
      pops++;
      continue;
    }
    break;
  }

  if (!context.mounted) return;

  showDialog<void>(
    context: context,
    barrierDismissible: false,
    useRootNavigator: true,
    builder: (ctx) {
      return PopScope(
        canPop: false,
        child: GlassAlertDialog(
          content: Row(
            children: [
              const SizedBox(
                width: 28,
                height: 28,
                child: CircularProgressIndicator(strokeWidth: 2.4),
              ),
              const SizedBox(width: 16),
              Expanded(child: Text(busyLabel)),
            ],
          ),
        ),
      );
    },
  );

  AppRecoveryReport report;
  try {
    report = await action(s);
  } catch (e) {
    report = AppRecoveryReport(
      outcome: AppRecoveryOutcome.failed,
      notes: ['exception:$e'],
    );
  }

  if (context.mounted) {
    Navigator.of(context, rootNavigator: true).pop(); // dialog
  }
  if (!context.mounted) return;

  final message = switch (report.outcome) {
    AppRecoveryOutcome.ok => l10n.appRecoveryOk,
    AppRecoveryOutcome.partial => l10n.appRecoveryPartial,
    AppRecoveryOutcome.failed => l10n.appRecoveryFailed,
  };
  ScaffoldMessenger.of(context).showSnackBar(
    GlassSnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    ),
  );
}

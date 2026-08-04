import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

/// Shared confirm + [AppState.panicWipeLocalIdentity].
Future<bool> confirmAndPanicWipe(BuildContext context) async {
  final l10n = context.l10n;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      return GlassAlertDialog(
        title: Text(l10n.panicWipeConfirmTitle),
        content: Text(l10n.panicWipeConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(l10n.panicWipeAction),
          ),
        ],
      );
    },
  );
  if (ok != true || !context.mounted) return false;

  try {
    await context.read<AppState>().panicWipeLocalIdentity();
  } catch (e, st) {
    debugPrint('[ResilNet] panicWipe failed: $e\n$st');
    if (!context.mounted) return false;
    ScaffoldMessenger.of(context).showSnackBar(
      GlassSnackBar(content: Text(l10n.panicWipeFailed('$e'))),
    );
    return false;
  }

  if (!context.mounted) return true;
  Navigator.of(context).popUntil((route) => route.isFirst);
  if (!context.mounted) return true;
  ScaffoldMessenger.of(context).showSnackBar(
    GlassSnackBar(content: Text(context.l10n.panicWipeSnack)),
  );
  return true;
}

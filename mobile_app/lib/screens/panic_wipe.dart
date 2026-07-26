import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';

/// Shared confirm + [AppState.panicWipeLocalIdentity].
Future<bool> confirmAndPanicWipe(BuildContext context) async {
  final l10n = context.l10n;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      return AlertDialog(
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

  await context.read<AppState>().panicWipeLocalIdentity();
  if (!context.mounted) return true;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(context.l10n.panicWipeSnack)),
  );
  return true;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../l10n/app_localizations.dart';

/// Long-press / force-touch actions for board or peer invites.
Future<void> showInviteActionsSheet({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String shortLink,
  required String fullLink,
  required String acceptLabel,
  required Future<void> Function() onAccept,
}) async {
  final l10n = AppLocalizations.of(context);
  // When the primary action is already "copy short link", skip the duplicate
  // outlined copy button (identity / board QR long-press flows).
  final copyIsPrimary = acceptLabel == l10n.inviteCopyShortLink;
  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(title, style: Theme.of(ctx).textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                      color: Theme.of(ctx)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.7),
                    ),
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: () async {
                  Navigator.pop(ctx);
                  await onAccept();
                },
                icon: Icon(
                  copyIsPrimary
                      ? Icons.link
                      : Icons.check_circle_outline,
                ),
                label: Text(acceptLabel),
              ),
              if (!copyIsPrimary) ...[
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: shortLink));
                    if (ctx.mounted) {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.inviteLinkCopied)),
                      );
                    }
                  },
                  icon: const Icon(Icons.link),
                  label: Text(l10n.inviteCopyShortLink),
                ),
              ],
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () async {
                  final box = context.findRenderObject() as RenderBox?;
                  final origin = box != null
                      ? box.localToGlobal(Offset.zero) & box.size
                      : null;
                  await SharePlus.instance.share(
                    ShareParams(
                      text: shortLink,
                      sharePositionOrigin: origin,
                    ),
                  );
                  if (ctx.mounted) Navigator.pop(ctx);
                },
                icon: const Icon(Icons.share_outlined),
                label: Text(l10n.inviteShareLink),
              ),
              Theme(
                data: Theme.of(ctx).copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  title: Text(l10n.inviteShowFullLink),
                  children: [
                    SelectableText(
                      fullLink,
                      style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                            fontFamily: 'monospace',
                          ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: fullLink),
                          );
                          if (ctx.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.inviteLinkCopied)),
                            );
                          }
                        },
                        child: Text(l10n.inviteCopyFullLink),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../app/theme.dart';
import '../core/peer_id.dart';
import '../l10n/app_localizations.dart';
import '../state/app_state.dart';
import 'identicon.dart';

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
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () async {
                  Navigator.pop(ctx);
                  if (!context.mounted) return;
                  await showInviteSendToChatSheet(
                    context: context,
                    shortLink: shortLink,
                  );
                },
                icon: const Icon(Icons.chat_bubble_outline),
                label: Text(l10n.inviteSendInChat),
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

/// Pick a messageable peer and send [shortLink] as a sealed 1:1 text.
Future<void> showInviteSendToChatSheet({
  required BuildContext context,
  required String shortLink,
}) async {
  final l10n = AppLocalizations.of(context);
  final s = context.read<AppState>();
  final peers = await s.messageablePeersForInvite();
  if (!context.mounted) return;

  await showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (ctx) {
      final height = MediaQuery.sizeOf(ctx).height * 0.55;
      return SafeArea(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.inviteSendInChat,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.inviteSendInChatHint,
                  style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(ctx),
                      ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: peers.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              l10n.inviteSendInChatEmpty,
                              textAlign: TextAlign.center,
                              style: Theme.of(ctx).textTheme.bodyMedium?.copyWith(
                                    color: ResilNetTheme.mutedOnSurface(ctx),
                                  ),
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: peers.length,
                          separatorBuilder: (_, _) => const Divider(height: 1),
                          itemBuilder: (_, i) {
                            final peer = peers[i];
                            return FutureBuilder<String>(
                              future: s.db.resolveDisplayName(peer.id),
                              builder: (context, snap) {
                                final label = peerListLabel(
                                  aliasOrNick: snap.data ?? peer.displayName,
                                  id: peer.id,
                                );
                                return ListTile(
                                  leading: Identicon(id: peer.id, size: 36),
                                  title: Text(label),
                                  subtitle: Text(
                                    formatShortPeerId(peer.id),
                                    style: const TextStyle(fontFamily: 'monospace'),
                                  ),
                                  onTap: () async {
                                    Navigator.pop(ctx);
                                    final ok = await s.sendSealedTextToPeer(
                                      peerId: peer.id,
                                      text: shortLink,
                                    );
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          ok
                                              ? l10n.inviteSentToChat
                                              : l10n.chatNeedPeerKey,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

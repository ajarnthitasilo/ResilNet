import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../models/feed_channel.dart';
import '../models/notice_expiry.dart';
import '../state/app_state.dart';

/// Result of intercepting a leading `/` compose command.
class SlashHandleResult {
  const SlashHandleResult({required this.handled, this.feedback});

  final bool handled;
  final String? feedback;
}

/// Parses `/help`, `/who`, `/drop …` for home + 1:1 compose.
class SlashCommands {
  SlashCommands._();

  static Future<SlashHandleResult> tryHandle({
    required String raw,
    required AppState state,
    required AppLocalizations l10n,
    required FeedChannel channel,
  }) async {
    final text = raw.trim();
    if (!text.startsWith('/')) {
      return const SlashHandleResult(handled: false);
    }

    final parts = text.split(RegExp(r'\s+'));
    final cmd = parts.first.toLowerCase();
    final rest =
        text.length > cmd.length ? text.substring(cmd.length).trim() : '';

    switch (cmd) {
      case '/help':
        return SlashHandleResult(handled: true, feedback: l10n.slashHelpBody);
      case '/who':
        return SlashHandleResult(
          handled: true,
          feedback: _whoList(state, l10n, channel),
        );
      case '/drop':
        if (rest.isEmpty) {
          return SlashHandleResult(
            handled: true,
            feedback: l10n.slashDropNeedText,
          );
        }
        final scope = channel == FeedChannel.geo ? 'geo' : 'mesh';
        final label =
            channel == FeedChannel.geo ? state.geoChannelLabel : '#mesh';
        final expiry = state.nostrExpiry == NoticeExpiry.forever
            ? NoticeExpiry.oneDay
            : state.nostrExpiry;
        final notice = await state.postNotice(
          scope: scope,
          channelLabel: label,
          text: rest,
          expiry: expiry,
        );
        if (notice == null) {
          return SlashHandleResult(
            handled: true,
            feedback: l10n.settingsE2eeTitle,
          );
        }
        return SlashHandleResult(
          handled: true,
          feedback: l10n.slashDropDone(label),
        );
      default:
        return SlashHandleResult(handled: true, feedback: l10n.slashUnknown);
    }
  }

  static String _whoList(
    AppState state,
    AppLocalizations l10n,
    FeedChannel channel,
  ) {
    final lines = <String>[];
    switch (channel) {
      case FeedChannel.directs:
      case FeedChannel.mesh:
        if (!state.isReady) return l10n.slashWhoEmpty;
        for (final p in state.mesh.nearbyPeers) {
          if (p.isBlocked) continue;
          final name = p.displayName?.trim();
          lines.add(
            (name != null && name.isNotEmpty) ? '$name (${p.id})' : p.id,
          );
        }
      case FeedChannel.geo:
        for (final e in state.areaPresenceOnline()) {
          lines.add(e.label);
        }
    }
    if (lines.isEmpty) return l10n.slashWhoEmpty;
    return '${l10n.slashWhoTitle(lines.length)}\n${lines.join('\n')}';
  }

  static void showFeedback(
    BuildContext context, {
    required AppLocalizations l10n,
    required String? feedback,
  }) {
    if (feedback == null || feedback.isEmpty) return;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.slashHelpTitle),
        content: SingleChildScrollView(child: Text(feedback)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.close),
          ),
        ],
      ),
    );
  }
}

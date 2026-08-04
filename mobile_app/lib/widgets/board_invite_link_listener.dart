import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/peer_id.dart';
import '../l10n/l10n_ext.dart';
import '../screens/announcements_screen.dart';
import '../screens/chat_screen.dart';
import '../state/app_state.dart';
import '../app/glass_overlays.dart';

/// ฟัง deep link `resilnet://board/invite?...` และ `resilnet://peer/invite?...`
class BoardInviteLinkListener extends StatefulWidget {
  const BoardInviteLinkListener({
    super.key,
    required this.child,
    required this.navigatorKey,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  State<BoardInviteLinkListener> createState() =>
      _BoardInviteLinkListenerState();
}

class _BoardInviteLinkListenerState extends State<BoardInviteLinkListener> {
  StreamSubscription<Uri>? _sub;
  AppState? _appState;
  bool _promptOpen = false;

  BuildContext? get _navContext => widget.navigatorKey.currentContext;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  void _ingestUri(AppState s, Uri uri) {
    if (s.ingestBoardInviteUri(uri)) return;
    s.ingestPeerInviteUri(uri);
  }

  Future<void> _start() async {
    if (!mounted) return;
    final s = context.read<AppState>();
    _appState = s;
    s.addListener(_onAppState);
    final appLinks = AppLinks();
    try {
      final initial = await appLinks.getInitialLink();
      if (initial != null) {
        _ingestUri(s, initial);
      }
    } catch (e) {
      debugPrint('[InviteLink] getInitialLink failed: $e');
    }
    _sub = appLinks.uriLinkStream.listen(
      (uri) {
        if (!mounted) return;
        _ingestUri(context.read<AppState>(), uri);
      },
      onError: (e) => debugPrint('[InviteLink] uri stream error: $e'),
    );
    _onAppState();
  }

  void _onAppState() {
    final s = _appState;
    if (s == null || !s.isReady || _promptOpen) return;
    if (s.pendingBoardInvite != null) {
      unawaited(_promptFollowBoard(s));
      return;
    }
    if (s.pendingPeerInvite != null) {
      unawaited(_promptAddPeer(s));
    }
  }

  Future<void> _promptFollowBoard(AppState s) async {
    final pending = s.pendingBoardInvite;
    final ctx = _navContext;
    if (pending == null || ctx == null || !ctx.mounted) return;
    _promptOpen = true;
    final l10n = ctx.l10n;
    final ok = await showDialog<bool>(
      context: ctx,
      builder: (dialogCtx) => GlassAlertDialog(
        title: Text(l10n.announceConfirmFollowTitle),
        content: Text(l10n.announceConfirmFollowBody(pending.title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            child: Text(l10n.announceConfirmFollow),
          ),
        ],
      ),
    );
    _promptOpen = false;
    if (!mounted) return;
    if (ok == true) {
      final board = await s.acceptPendingBoardInvite();
      final navCtx = _navContext;
      if (board != null && navCtx != null && navCtx.mounted) {
        ScaffoldMessenger.of(navCtx).showSnackBar(
          GlassSnackBar(content: Text(l10n.announceFollowOkNamed(board.title))),
        );
        unawaited(openAnnouncementsScreen(navCtx));
      }
    } else {
      s.clearPendingBoardInvite();
    }
  }

  Future<void> _promptAddPeer(AppState s) async {
    final pending = s.pendingPeerInvite;
    final ctx = _navContext;
    if (pending == null || ctx == null || !ctx.mounted) return;
    _promptOpen = true;
    final l10n = ctx.l10n;
    final label = (pending.name != null && pending.name!.isNotEmpty)
        ? pending.name!
        : formatShortPeerId(pending.id);
    final ok = await showDialog<bool>(
      context: ctx,
      builder: (dialogCtx) => GlassAlertDialog(
        title: Text(l10n.peerConfirmAddTitle),
        content: Text(l10n.peerConfirmAddBody(label)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogCtx, true),
            child: Text(l10n.peerConfirmAdd),
          ),
        ],
      ),
    );
    _promptOpen = false;
    if (!mounted) return;
    if (ok == true) {
      final peer = await s.acceptPendingPeerInvite();
      final navCtx = _navContext;
      if (peer != null && navCtx != null && navCtx.mounted) {
        ScaffoldMessenger.of(navCtx).showSnackBar(
          GlassSnackBar(content: Text(l10n.peerAddedOk(label))),
        );
        unawaited(
          Navigator.of(navCtx).push(
            MaterialPageRoute(builder: (_) => ChatScreen(peerId: peer.id)),
          ),
        );
      }
    } else {
      s.clearPendingPeerInvite();
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    _appState?.removeListener(_onAppState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

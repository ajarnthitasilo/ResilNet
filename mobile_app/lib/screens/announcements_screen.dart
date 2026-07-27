import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/announcement_board.dart';
import '../state/app_state.dart';

Future<void> openAnnouncementsScreen(BuildContext context) {
  return Navigator.of(context).push(
    MaterialPageRoute(builder: (_) => const AnnouncementsScreen()),
  );
}

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  String? _selectedBoardId;
  final _compose = TextEditingController();
  AnnouncementPostMode _mode = AnnouncementPostMode.locked;
  bool _posting = false;

  @override
  void dispose() {
    _compose.dispose();
    super.dispose();
  }

  Future<void> _followInvite(AppState s) async {
    final l10n = context.l10n;
    final ctrl = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.announceFollow),
        content: TextField(
          controller: ctrl,
          maxLines: 6,
          decoration: InputDecoration(hintText: l10n.announceFollowHint),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.announceFollow),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final done = await s.followBoardFromInviteJson(ctrl.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(done ? l10n.announceFollowOk : l10n.announceFollowFail),
      ),
    );
  }

  Future<void> _createBoard(AppState s) async {
    final l10n = context.l10n;
    final name = TextEditingController(text: l10n.announceDefaultTitle);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.announceCreate),
        content: TextField(
          controller: name,
          decoration: InputDecoration(hintText: l10n.announceCreateHint),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.announceCreate),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final board = await s.createAnnouncementBoard(title: name.text);
    setState(() => _selectedBoardId = board.id);
  }

  Future<void> _post(AppState s, AnnouncementBoard board) async {
    if (_posting) return;
    final text = _compose.text.trim();
    if (text.isEmpty) return;
    final l10n = context.l10n;

    var mode = _mode;
    if (mode == AnnouncementPostMode.open && !board.allowOpen) {
      mode = AnnouncementPostMode.locked;
    }
    if (mode == AnnouncementPostMode.locked && !board.allowLocked) {
      if (!board.allowOpen) return;
      mode = AnnouncementPostMode.open;
    }

    if (mode == AnnouncementPostMode.open) {
      final confirm = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.announceOpenConfirmTitle),
          content: Text(l10n.announceOpenConfirmBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.orangeAccent),
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10n.announcePostAction),
            ),
          ],
        ),
      );
      if (confirm != true || !mounted) return;
    }

    setState(() => _posting = true);
    try {
      final post = await s.postAnnouncement(
        boardId: board.id,
        text: text,
        mode: mode,
      );
      if (post != null) _compose.clear();
    } finally {
      if (mounted) setState(() => _posting = false);
    }
  }

  Future<void> _requestAccess(AppState s, String boardId) async {
    final l10n = context.l10n;
    final ok = await s.requestBoardAccess(boardId);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok ? l10n.announceRequestSent : l10n.announceRequestFailed),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final boards = s.announcementBoards;
    final boardId = _selectedBoardId ??
        (boards.isNotEmpty ? boards.first.id : null);
    final board = boardId == null ? null : s.boardById(boardId);
    final posts = boardId == null ? const <AnnouncementPost>[] : s.postsForBoard(boardId);
    final pending = s.pendingBoardKeyRequests;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.announceTitle),
        actions: [
          IconButton(
            tooltip: l10n.announceFollow,
            onPressed: () => _followInvite(s),
            icon: const Icon(Icons.link),
          ),
          IconButton(
            tooltip: l10n.announceCreate,
            onPressed: () => _createBoard(s),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: ResilNetTheme.scaffoldGradient),
        child: boards.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.announceEmpty,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: () => _createBoard(s),
                        child: Text(l10n.announceCreate),
                      ),
                    ],
                  ),
                ),
              )
            : Column(
                children: [
                  if (pending.isNotEmpty)
                    Material(
                      color: Colors.orange.withValues(alpha: 0.15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
                            child: Text(
                              l10n.announcePendingRequests,
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          for (final r in pending)
                            ListTile(
                              dense: true,
                              title: Text(r['boardTitle'] ?? r['boardId'] ?? ''),
                              subtitle: Text(r['requesterId'] ?? ''),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextButton(
                                    onPressed: () => s.denyBoardKeyRequest(
                                      boardId: r['boardId'] ?? '',
                                      requesterId: r['requesterId'] ?? '',
                                    ),
                                    child: Text(l10n.announceDeny),
                                  ),
                                  FilledButton(
                                    onPressed: () async {
                                      await s.approveBoardKeyRequest(
                                        boardId: r['boardId'] ?? '',
                                        requesterId: r['requesterId'] ?? '',
                                        requesterPubPem: r['requesterPub'] ?? '',
                                      );
                                    },
                                    child: Text(l10n.announceApprove),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      children: [
                        for (final b in boards)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(b.title),
                              selected: b.id == boardId,
                              onSelected: (_) =>
                                  setState(() => _selectedBoardId = b.id),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (board != null) ...[
                    if (board.ownerId == s.myUserId)
                      ExpansionTile(
                        title: Text(l10n.announceSettings),
                        children: [
                          SwitchListTile(
                            title: Text(l10n.announceAllowLocked),
                            subtitle: Text(l10n.announceAllowLockedSub),
                            value: board.allowLocked,
                            onChanged: (v) => s.updateBoardSettings(
                              board.id,
                              allowLocked: v,
                            ),
                          ),
                          SwitchListTile(
                            title: Text(l10n.announceAllowOpen),
                            subtitle: Text(l10n.announceAllowOpenSub),
                            value: board.allowOpen,
                            onChanged: (v) => s.updateBoardSettings(
                              board.id,
                              allowOpen: v,
                            ),
                          ),
                          ListTile(
                            dense: true,
                            title: Text(l10n.announceOwner),
                            subtitle: Text(board.id, maxLines: 1),
                          ),
                          ListTile(
                            leading: const Icon(Icons.copy),
                            title: Text(l10n.announceCopyInvite),
                            onTap: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: s.boardInvitePayload(board),
                                ),
                              );
                              if (!context.mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(l10n.announceInviteCopied),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    else if (s.canDecryptBoard(board.id))
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          l10n.announceGranted,
                          style: TextStyle(color: ResilNetTheme.emerald),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: OutlinedButton.icon(
                          onPressed: () => _requestAccess(s, board.id),
                          icon: const Icon(Icons.key_outlined),
                          label: Text(l10n.announceRequestAccess),
                        ),
                      ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: posts.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 8),
                        itemBuilder: (context, i) {
                          final p = posts[i];
                          final plain = s.decryptAnnouncementPost(p);
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: p.isOpen
                                          ? Colors.orangeAccent.withValues(
                                              alpha: 0.25,
                                            )
                                          : ResilNetTheme.emerald.withValues(
                                              alpha: 0.2,
                                            ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      p.isOpen
                                          ? l10n.announceOpenBadge
                                          : l10n.announceLockedBadge,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    plain ?? l10n.announceLockedPlaceholder,
                                    style: TextStyle(
                                      color: plain == null
                                          ? Colors.white54
                                          : Colors.white,
                                      fontStyle: plain == null
                                          ? FontStyle.italic
                                          : FontStyle.normal,
                                    ),
                                  ),
                                  if (plain == null &&
                                      !p.isOpen &&
                                      board.ownerId != s.myUserId &&
                                      !s.canDecryptBoard(board.id)) ...[
                                    const SizedBox(height: 8),
                                    TextButton(
                                      onPressed: () =>
                                          _requestAccess(s, board.id),
                                      child: Text(l10n.announceRequestAccess),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SafeArea(
                      top: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ChoiceChip(
                                  label: Text(l10n.announceModeLocked),
                                  selected: _mode == AnnouncementPostMode.locked,
                                  onSelected: board.allowLocked
                                      ? (_) => setState(
                                            () => _mode =
                                                AnnouncementPostMode.locked,
                                          )
                                      : null,
                                ),
                                const SizedBox(width: 8),
                                ChoiceChip(
                                  label: Text(l10n.announceModeOpen),
                                  selected: _mode == AnnouncementPostMode.open,
                                  onSelected: board.allowOpen
                                      ? (_) => setState(
                                            () =>
                                                _mode = AnnouncementPostMode.open,
                                          )
                                      : null,
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _compose,
                                    minLines: 1,
                                    maxLines: 3,
                                    decoration: InputDecoration(
                                      hintText: l10n.announceComposeHint,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                IconButton.filled(
                                  onPressed: _posting
                                      ? null
                                      : () => _post(s, board),
                                  icon: _posting
                                      ? const SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        )
                                      : const Icon(Icons.send),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}

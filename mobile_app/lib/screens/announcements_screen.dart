import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../app/theme.dart';
import '../core/chat_image_codec.dart';
import '../core/voice_payload.dart';
import '../l10n/l10n_ext.dart';
import '../models/announcement_board.dart';
import '../services/audio_recorder_service.dart';
import '../services/mic_permission.dart';
import '../services/photos_permission.dart';
import '../services/secure_screen.dart';
import '../state/app_state.dart';
import '../widgets/invite_actions_sheet.dart';
import 'qr_capture_screen.dart';
import 'voice_record_sheet.dart';

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
  final _audio = AudioRecorderService();
  AnnouncementPostMode _mode = AnnouncementPostMode.locked;
  bool _posting = false;

  @override
  void initState() {
    super.initState();
    unawaited(SecureScreen.acquire());
  }

  @override
  void dispose() {
    unawaited(SecureScreen.release());
    _compose.dispose();
    _audio.dispose();
    super.dispose();
  }

  bool _hasInternet(AppState s) => s.isCloudOnline;

  Future<void> _followInvite(AppState s, {String? prefill}) async {
    final l10n = context.l10n;
    final ctrl = TextEditingController(text: prefill ?? '');
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.announceFollow),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: ctrl,
              maxLines: 6,
              decoration: InputDecoration(hintText: l10n.announceFollowHint),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () async {
                Navigator.pop(ctx, false);
                if (!mounted) return;
                await _scanInviteQr(s);
              },
              icon: const Icon(Icons.qr_code_scanner),
              label: Text(l10n.announceScanInviteQr),
            ),
          ],
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
    final board = await s.followBoardFromInviteAny(ctrl.text);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          board != null
              ? l10n.announceFollowOkNamed(board.title)
              : l10n.announceFollowFail,
        ),
      ),
    );
    if (board != null) {
      setState(() => _selectedBoardId = board.id);
    }
  }

  Future<void> _scanInviteQr(AppState s) async {
    final raw = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => QrCaptureScreen(title: context.l10n.announceScanInviteQr),
      ),
    );
    if (!mounted || raw == null || raw.isEmpty) return;
    final board = await s.followBoardFromInviteAny(raw);
    if (!mounted) return;
    final l10n = context.l10n;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          board != null
              ? l10n.announceFollowOkNamed(board.title)
              : l10n.announceFollowFail,
        ),
      ),
    );
    if (board != null) {
      setState(() => _selectedBoardId = board.id);
    }
  }

  Future<void> _showInviteQr(AnnouncementBoard board, AppState s) async {
    final l10n = context.l10n;
    final payload = s.boardInvitePayload(board);
    final shareText = s.boardInviteShareText(
      board,
      preamble: l10n.announceInviteSharePreamble,
    );
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.announceShowInviteQr,
                style: Theme.of(ctx).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                board.title,
                style: Theme.of(ctx).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onLongPress: () {
                  final short = payload;
                  final full = s.boardInviteDeepLink(board);
                  unawaited(
                    showInviteActionsSheet(
                      context: ctx,
                      title: board.title,
                      subtitle: l10n.inviteLongPressHint,
                      shortLink: short,
                      fullLink: full,
                      acceptLabel: l10n.inviteCopyShortLink,
                      onAccept: () async {
                        await Clipboard.setData(ClipboardData(text: short));
                        if (!mounted) return;
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          SnackBar(content: Text(l10n.inviteLinkCopied)),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(12),
                  child: QrImageView(
                    data: payload,
                    version: QrVersions.auto,
                    size: 220,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.announceInviteSharePreamble(board.title),
                style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(ctx, alpha: 0.72),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.inviteLongPressHint,
                style: Theme.of(ctx).textTheme.labelSmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(ctx, alpha: 0.55),
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => unawaited(_saveInviteQr(payload)),
                      icon: const Icon(Icons.download_outlined),
                      label: Text(l10n.announceInviteSaveQr),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: () => unawaited(_shareInvite(shareText)),
                      icon: const Icon(Icons.share_outlined),
                      label: Text(l10n.announceInviteShare),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _saveInviteQr(String qrData) async {
    final l10n = context.l10n;
    try {
      await ensurePhotosPermission();
      final hasAccess = await Gal.hasAccess(toAlbum: true);
      if (!hasAccess) {
        final granted = await Gal.requestAccess(toAlbum: true);
        if (!granted) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.identityGalleryDenied)),
          );
          return;
        }
      }
      final painter = QrPainter(
        data: qrData,
        version: QrVersions.auto,
        errorCorrectionLevel: QrErrorCorrectLevel.M,
        gapless: true,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xFF000000),
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.square,
          color: Color(0xFF000000),
        ),
      );
      final byteData = await painter.toImageData(
        1024,
        format: ui.ImageByteFormat.png,
      );
      if (byteData == null) throw StateError('QR encode failed');
      await Gal.putImageBytes(
        Uint8List.fromList(byteData.buffer.asUint8List()),
        name: 'resilnet_board_invite_${DateTime.now().millisecondsSinceEpoch}',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.identityQrSaved)),
      );
    } catch (e) {
      debugPrint('[Announce] save invite QR failed: $e');
      if (!mounted) return;
      if (e is StateError &&
          (e.message == photosPermanentlyDeniedCode ||
              e.message == 'PHOTOS_DENIED')) {
        showPhotosPermissionError(
          context,
          error: e,
          deniedMessage: l10n.permissionPhotosDenied,
          failedMessage: l10n.permissionPhotosFailed,
          openSettingsLabel: l10n.permissionPhotosOpenSettings,
        );
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.identityQrSaveFailed('$e'))),
      );
    }
  }

  Future<void> _shareInvite(String text) async {
    final box = context.findRenderObject() as RenderBox?;
    final origin = box == null
        ? const Rect.fromLTWH(0, 0, 100, 100)
        : box.localToGlobal(Offset.zero) & box.size;
    await SharePlus.instance.share(
      ShareParams(text: text, sharePositionOrigin: origin),
    );
  }

  Future<void> _copyInvite(AppState s, AnnouncementBoard board) async {
    final l10n = context.l10n;
    final text = s.boardInviteShareText(
      board,
      preamble: l10n.announceInviteSharePreamble,
    );
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.announceInviteCopied)),
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

  Future<void> _postBody(
    AppState s,
    AnnouncementBoard board,
    String body,
  ) async {
    if (_posting) return;
    final text = body.trim();
    if (text.isEmpty) return;
    final l10n = context.l10n;
    final isMedia = AnnouncementMedia.isMedia(text);

    if (isMedia && !_hasInternet(s)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.announceNeedInternet)),
      );
      return;
    }

    var mode = _mode;
    if (mode == AnnouncementPostMode.open && !board.allowOpen) {
      mode = AnnouncementPostMode.locked;
    }
    if (mode == AnnouncementPostMode.locked && !board.allowLocked) {
      if (!board.allowOpen) return;
      mode = AnnouncementPostMode.open;
    }

    if (mode == AnnouncementPostMode.open && !isMedia) {
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
              style: FilledButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
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
      if (post != null) {
        _compose.clear();
      } else if (isMedia && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.announceNeedInternet)),
        );
      }
    } finally {
      if (mounted) setState(() => _posting = false);
    }
  }

  Future<void> _post(AppState s, AnnouncementBoard board) =>
      _postBody(s, board, _compose.text);

  Future<void> _attachImage(AppState s, AnnouncementBoard board) async {
    if (_posting) return;
    if (!_hasInternet(s)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.announceNeedInternet)),
      );
      return;
    }
    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 85,
    );
    if (file == null) return;
    final raw = await File(file.path).readAsBytes();
    final budget = ChatImageCodec.budgetForConnectivity(online: true);
    final bytes = await Future(
      () => ChatImageCodec.compressToBudget(
        Uint8List.fromList(raw),
        maxBytes: budget,
      ),
    );
    if (bytes == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.announceImageTooLarge)),
      );
      return;
    }
    final payload = AnnouncementMedia.encodeImage(base64Encode(bytes));
    await _postBody(s, board, payload);
  }

  Future<void> _openVoice(AppState s, AnnouncementBoard board) async {
    if (_posting) return;
    if (!_hasInternet(s)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.announceNeedInternet)),
      );
      return;
    }
    HapticFeedback.lightImpact();
    try {
      final result = await showVoiceRecordSheet(context);
      if (!mounted || result == null) return;
      if (result.bytes.length > AudioRecorderService.maxBytes) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceTooLarge)),
        );
        return;
      }
      final wire = VoicePayload.encodeWire(
        bytes: result.bytes,
        ext: result.ext,
      );
      final payload = AnnouncementMedia.encodeAudio(wire);
      await _postBody(s, board, payload);
    } catch (e) {
      if (!mounted) return;
      showMicPermissionError(
        context,
        error: e,
        deniedMessage: context.l10n.permissionMicDenied,
        failedMessage: context.l10n.announceVoiceFailed('$e'),
        openSettingsLabel: context.l10n.permissionMicOpenSettings,
      );
    }
  }

  Future<void> _requestAccess(AppState s, String boardId) async {
    final l10n = context.l10n;
    final ok = await s.requestBoardAccess(boardId);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ok ? l10n.announceRequestSent : l10n.announceRequestFailed,
        ),
      ),
    );
  }

  Widget _buildPostBody(AppState s, AnnouncementPost p, String? plain) {
    final l10n = context.l10n;
    if (plain == null) {
      return Text(
        l10n.announceLockedPlaceholder,
        style: TextStyle(
          color: ResilNetTheme.mutedOnSurface(context),
          fontStyle: FontStyle.italic,
        ),
      );
    }
    final media = AnnouncementMedia.parse(plain);
    if (media == null) {
      return Text(
        plain,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      );
    }
    if (media.kind == 'image') {
      try {
        final bytes = base64Decode(media.data);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.announceImageLabel, style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                Uint8List.fromList(bytes),
                fit: BoxFit.cover,
                // Board list rebuilds on every AppState tick; hold the last
                // decoded frame so the image doesn't flash/"blink" each rebuild.
                gaplessPlayback: true,
                errorBuilder: (_, _, _) => Text(l10n.announceImageLabel),
              ),
            ),
          ],
        );
      } catch (_) {
        return Text(l10n.announceImageLabel);
      }
    }
    return FilledButton.tonalIcon(
      onPressed: () async {
        try {
          // Prefer VoicePayload JSON (same as 1:1); fall back to raw b64.
          final decoded = VoicePayload.decode(media.data);
          if (decoded != null) {
            await _audio.playBytes(decoded.bytes, ext: decoded.ext);
          } else {
            await _audio.playBytes(Uint8List.fromList(base64Decode(media.data)));
          }
        } catch (_) {}
      },
      icon: const Icon(Icons.play_arrow),
      label: Text(l10n.announcePlayVoice),
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
    final posts =
        boardId == null ? const <AnnouncementPost>[] : s.postsForBoard(boardId);
    final pending = s.pendingBoardKeyRequests;

    return Container(
      decoration: ResilNetTheme.pageDecoration(context),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(l10n.announceTitle),
        actions: [
          IconButton(
            tooltip: l10n.announceScanInviteQr,
            onPressed: () => _scanInviteQr(s),
            icon: const Icon(Icons.qr_code_scanner),
          ),
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
      body: boards.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.announceEmpty,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ResilNetTheme.mutedOnSurface(
                                context,
                                alpha: 0.72,
                              ),
                            ),
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
                            leading: const Icon(Icons.qr_code_2),
                            title: Text(l10n.announceShowInviteQr),
                            onTap: () => _showInviteQr(board, s),
                          ),
                          ListTile(
                            leading: const Icon(Icons.copy),
                            title: Text(l10n.announceCopyInvite),
                            onTap: () => _copyInvite(s, board),
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
                                  _buildPostBody(s, p, plain),
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                ChoiceChip(
                                  label: Text(l10n.announceModeLocked),
                                  selected:
                                      _mode == AnnouncementPostMode.locked,
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
                                            () => _mode =
                                                AnnouncementPostMode.open,
                                          )
                                      : null,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l10n.announceMediaInternetOnly,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: ResilNetTheme.mutedOnSurface(
                                      context,
                                      alpha: 0.45,
                                    ),
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                IconButton(
                                  tooltip: l10n.chatAttachImage,
                                  onPressed: _posting
                                      ? null
                                      : () => unawaited(_attachImage(s, board)),
                                  icon: const Icon(Icons.image_outlined),
                                ),
                                IconButton(
                                  tooltip: l10n.voicePttHold,
                                  onPressed: _posting
                                      ? null
                                      : () => unawaited(_openVoice(s, board)),
                                  icon: const Icon(Icons.mic_none_outlined),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _compose,
                                    enabled: !_posting,
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
                                      : () => unawaited(_post(s, board)),
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

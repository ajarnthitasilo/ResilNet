import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/chat_image_codec.dart';
import '../core/payload_kinds.dart';
import '../core/voice_payload.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/app_recovery.dart';
import '../models/feed_channel.dart';
import '../models/mesh_retention.dart';
import '../models/notice_expiry.dart';
import '../models/peer.dart';
import '../services/mic_permission.dart';
import '../services/audio_recorder_service.dart';
import '../state/app_state.dart';
import '../widgets/app_recovery_actions.dart';
import '../widgets/geo_discovery_empty.dart';
import '../widgets/identicon.dart';
import '../widgets/mesh_status_bar.dart';
import 'announcements_screen.dart';
import 'chat_screen.dart';
import 'feed_channel_sheet.dart';
import 'identity_screen.dart';
import 'info_sheet.dart';
import 'location_channel_sheet.dart';
import 'local_wifi_link_sheet.dart';
import 'notices_sheet.dart';
import 'online_people_sheet.dart';
import 'panic_wipe.dart';
import 'settings_screen.dart';
import 'voice_record_sheet.dart';

/// Home feed — clean bitchat-style chrome with sheets for mode pickers.
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _peerController = TextEditingController();
  final _compose = TextEditingController();
  final _composeFocus = FocusNode();
  NoticeExpiry _expiry = NoticeExpiry.sevenDays;
  bool _sending = false;
  int _titleTapCount = 0;
  DateTime? _titleTapAt;

  @override
  void dispose() {
    _peerController.dispose();
    _compose.dispose();
    _composeFocus.dispose();
    super.dispose();
  }

  void _onTitleTap() {
    final now = DateTime.now();
    final prev = _titleTapAt;
    if (prev == null || now.difference(prev) > const Duration(milliseconds: 900)) {
      _titleTapCount = 1;
    } else {
      _titleTapCount += 1;
    }
    _titleTapAt = now;
    // Double-tap: soft refresh. Triple-tap (same window): emergency wipe.
    if (_titleTapCount == 2) {
      unawaited(_softRefreshFromTitle());
    } else if (_titleTapCount >= 3) {
      _titleTapCount = 0;
      _titleTapAt = null;
      unawaited(confirmAndPanicWipe(context));
    }
  }

  void _onTitleLongPress() {
    _titleTapCount = 0;
    _titleTapAt = null;
    HapticFeedback.heavyImpact();
    unawaited(
      runAppRecoveryAction(
        context,
        busyLabel: context.l10n.appHardRecovering,
        action: (s) => s.hardRecoverApp(reason: 'title-long-press'),
      ),
    );
  }

  Future<void> _softRefreshFromTitle() async {
    if (!mounted) return;
    final s = context.read<AppState>();
    final l10n = context.l10n;
    if (s.recovering) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.appRecoveryBusy)),
      );
      return;
    }
    HapticFeedback.mediumImpact();
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(l10n.appRefreshing),
        duration: const Duration(seconds: 2),
      ),
    );
    try {
      final report = await s.softRefreshApp(reason: 'title-double-tap');
      if (!mounted) return;
      messenger.hideCurrentSnackBar();
      final msg = switch (report.outcome) {
        AppRecoveryOutcome.ok => l10n.appRefreshed,
        AppRecoveryOutcome.partial => l10n.appRecoveryPartial,
        AppRecoveryOutcome.failed => l10n.appRecoveryFailed,
      };
      messenger.showSnackBar(
        SnackBar(
          content: Text(msg),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.appRefreshFailed('$e'))),
      );
    }
  }

  Widget _softRefreshTipBanner(AppState s) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: ResilNetTheme.glassPanel(
        context: context,
        borderRadius: BorderRadius.circular(14),
        padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.touch_app_outlined,
              color: ResilNetTheme.emerald,
              size: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.softRefreshTipTitle,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.softRefreshTipBody,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          height: 1.35,
                          color: ResilNetTheme.mutedOnSurface(context, alpha: 0.75),
                        ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => unawaited(s.dismissSoftRefreshTip()),
                      child: Text(l10n.softRefreshTipGotIt),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: l10n.close,
              onPressed: () => unawaited(s.dismissSoftRefreshTip()),
              icon: const Icon(Icons.close, size: 18),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openPeer(BuildContext context, String peerId) async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => ChatScreen(peerId: peerId)),
    );
    if (mounted) setState(() {});
  }

  Future<void> _setAlias(BuildContext context, String peerId) async {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final existing = s.contactAlias(peerId) ?? '';
    final controller = TextEditingController(text: existing);
    if (!context.mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.aliasTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.aliasHintBody, style: Theme.of(ctx).textTheme.bodySmall),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: l10n.aliasLabel,
                hintText: l10n.aliasHint,
              ),
              autofocus: true,
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
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    if (ok != true) return;
    await s.setContactAlias(
      publicKeyHash: peerId,
      aliasName: controller.text,
    );
  }

  String _channelLabel(AppState s) {
    return switch (s.feedChannel) {
      FeedChannel.directs => context.l10n.feedDirects,
      FeedChannel.mesh => '#mesh',
      FeedChannel.geo => s.geoChannelLabel,
    };
  }

  Future<void> _sendPublic(AppState s) async {
    final text = _compose.text.trim();
    if (text.isEmpty || _sending) return;
    final l10n = context.l10n;

    final slash = await SlashCommands.tryHandle(
      raw: text,
      state: s,
      l10n: l10n,
      channel: s.feedChannel,
    );
    if (slash.handled) {
      _compose.clear();
      if (!mounted) return;
      SlashCommands.showFeedback(
        context,
        l10n: l10n,
        feedback: slash.feedback,
        offerDocsGuide: slash.offerDocsGuide,
      );
      return;
    }

    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
      );
      return;
    }
    setState(() => _sending = true);
    try {
      if (s.feedChannel == FeedChannel.mesh) {
        await s.setNostrExpiry(_expiry);
        await s.postNotice(
          scope: 'mesh',
          channelLabel: '#mesh',
          text: text,
          expiry: _expiry == NoticeExpiry.forever
              ? NoticeExpiry.sevenDays
              : _expiry,
        );
        if (!mounted) return;
        final warn = s.lastNoticePublishWarning;
        final sent = s.lastBulletinBleSent;
        if (sent > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.l10n.noticeMeshPublishSent(sent))),
          );
        } else if (warn != null) {
          final msg = switch (warn) {
            'ble_send_failed' => context.l10n.noticeMeshPublishBleFailed,
            'no_gatt' => context.l10n.noticeMeshPublishNoGatt,
            'no_mesh' => context.l10n.noticeMeshPublishNoLink,
            _ => context.l10n.noticePublishFailed,
          };
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(msg)),
          );
        }
      } else if (s.feedChannel == FeedChannel.geo) {
        await s.setNostrExpiry(_expiry);
        final n = await s.sendAreaPublicText(text);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.geoPublicSent(n))),
        );
      }
      _compose.clear();
      if (mounted) _composeFocus.requestFocus();
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _sendPublicImage(AppState s) async {
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
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
    final budget = ChatImageCodec.budgetForConnectivity(
      online: s.isNostrOnline || s.isCloudOnline,
    );
    final bytes = await Future(
      () => ChatImageCodec.compressToBudget(
        raw,
        maxBytes: budget,
      ),
    );
    if (bytes == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatImageTooLarge)),
      );
      return;
    }
    final b64 = base64Encode(bytes);
    setState(() => _sending = true);
    try {
      if (s.feedChannel == FeedChannel.geo) {
        final n = await s.sendAreaPublicText(
          b64,
          kind: PayloadKinds.image,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.geoPublicSent(n))),
        );
      } else if (s.feedChannel == FeedChannel.mesh) {
        final n = await s.sendMeshPublicText(
          b64,
          kind: PayloadKinds.image,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.geoPublicSent(n))),
        );
      }
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  Future<void> _openPublicVoice(AppState s) async {
    if (_sending) return;
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
      );
      return;
    }
    debugPrint('[PTT] mic-tap public channel=${s.feedChannel}');
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
      final wirePlain = VoicePayload.encodeWire(
        bytes: result.bytes,
        ext: result.ext,
      );
      setState(() => _sending = true);
      try {
        final n = s.feedChannel == FeedChannel.geo
            ? await s.sendAreaPublicText(wirePlain, kind: PayloadKinds.audio)
            : await s.sendMeshPublicText(wirePlain, kind: PayloadKinds.audio);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              n <= 0
                  ? context.l10n.geoPublicSentNone
                  : context.l10n.geoPublicSent(n),
            ),
          ),
        );
      } finally {
        if (mounted) setState(() => _sending = false);
      }
    } catch (e) {
      debugPrint('[PTT] public voice failed: $e');
      if (!mounted) return;
      showMicPermissionError(
        context,
        error: e,
        deniedMessage: context.l10n.permissionMicDenied,
        failedMessage: context.l10n.chatVoiceFailed('$e'),
        openSettingsLabel: context.l10n.permissionMicOpenSettings,
      );
    }
  }

  void _onPeoplePressed(AppState s) {
    // Always open online people sheet so badge and list stay consistent.
    // Full member directory remains available from PeerList / identity flows.
    showOnlinePeopleSheet(context);
  }

  Widget _compactIcon({
    required String tooltip,
    required VoidCallback onPressed,
    required Widget icon,
  }) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
      padding: const EdgeInsets.all(6),
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final onlineCount = s.isReady ? s.onlinePresenceCount : 0;
    final unreadCount = s.isReady ? s.unreadDirectCount : 0;

    return Container(
      decoration: ResilNetTheme.pageDecoration(context),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        titleSpacing: 8,
        title: Tooltip(
          message: l10n.appRefreshTitleHint,
          child: GestureDetector(
            onTap: _onTitleTap,
            onLongPress: _onTitleLongPress,
            behavior: HitTestBehavior.opaque,
            child: Semantics(
              button: true,
              label: '${l10n.communityTitle}. ${l10n.appRefreshTitleHint}',
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  l10n.communityTitle,
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.3,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        actionsIconTheme: const IconThemeData(size: 22),
        actions: [
          _compactIcon(
            tooltip: l10n.channelPickerTooltip,
            onPressed: () => showFeedChannelSheet(context),
            icon: Icon(switch (s.feedChannel) {
              FeedChannel.directs => Icons.lock_outline,
              FeedChannel.mesh => Icons.bluetooth,
              FeedChannel.geo => Icons.tag,
            }),
          ),
          _compactIcon(
            tooltip: l10n.locationPickerTooltip,
            onPressed: () => showLocationChannelSheet(context),
            icon: const Icon(Icons.place_outlined),
          ),
          if (s.feedChannel != FeedChannel.directs)
            _compactIcon(
              tooltip: l10n.transportPickerTooltip,
              onPressed: () => showTransportModeSheet(context),
              icon: Icon(switch (s.transportMode.name) {
                'mesh' => Icons.bluetooth_searching,
                'internet' => Icons.wifi,
                _ => Icons.sync_alt,
              }),
            ),
          if (s.feedChannel != FeedChannel.directs)
            _compactIcon(
              tooltip: l10n.noticesOpen,
              onPressed: () => showNoticesSheet(
                context,
                initialScope:
                    s.feedChannel == FeedChannel.mesh ? 'mesh' : 'geo',
              ),
              icon: const Icon(Icons.campaign_outlined),
            ),
          _compactIcon(
            tooltip: unreadCount > 0
                ? l10n.unreadDirectsTooltip(unreadCount)
                : l10n.unreadDirectsTooltipEmpty,
            onPressed: () {
              if (s.feedChannel != FeedChannel.directs) {
                unawaited(s.setFeedChannel(FeedChannel.directs));
              }
            },
            icon: Badge(
              isLabelVisible: unreadCount > 0,
              label: Text('$unreadCount'),
              child: Icon(
                unreadCount > 0
                    ? Icons.mark_email_unread_outlined
                    : Icons.mail_outline,
              ),
            ),
          ),
          _compactIcon(
            tooltip: '${l10n.onlinePeopleTooltip} ($onlineCount)',
            onPressed: () => _onPeoplePressed(s),
            icon: Badge(
              isLabelVisible: onlineCount > 0,
              label: Text('$onlineCount'),
              child: const Icon(Icons.groups_outlined),
            ),
          ),
          PopupMenuButton<String>(
            tooltip: l10n.settings,
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert, size: 22),
            onSelected: (v) {
              if (v == 'settings') {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              } else if (v == 'identity') {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const IdentityScreen()),
                );
              } else if (v == 'info') {
                showInfoSheet(context);
              } else if (v == 'announce') {
                openAnnouncementsScreen(context);
              } else if (v == 'hard_recover') {
                unawaited(
                  runAppRecoveryAction(
                    context,
                    busyLabel: l10n.appHardRecovering,
                    action: (s) => s.hardRecoverApp(reason: 'overflow-menu'),
                  ),
                );
              } else if (v == 'local_wifi') {
                unawaited(showLocalWifiLinkSheet(context));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'local_wifi',
                child: Text(l10n.localWifiTitle),
              ),
              PopupMenuItem(
                value: 'hard_recover',
                child: Text(l10n.appHardRecoverAction),
              ),
              PopupMenuItem(
                value: 'info',
                child: Text(l10n.infoOpen),
              ),
              PopupMenuItem(
                value: 'announce',
                child: Text(l10n.announceOpen),
              ),
              PopupMenuItem(
                value: 'settings',
                child: Text(l10n.settings),
              ),
              PopupMenuItem(
                value: 'identity',
                child: Text(l10n.identityQrTooltip),
              ),
            ],
          ),
        ],
      ),
      body: Column(
          children: [
            const MeshStatusBar(),
            if (s.isReady && !s.softRefreshTipSeen) _softRefreshTipBanner(s),
            if (s.systemLines.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: Text(
                  '${l10n.screenshotTaken} [${TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(s.systemLines.last.timestamp)).format(context)}]',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(context, alpha: 0.45),
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _channelLabel(s),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontFamily: s.feedChannel == FeedChannel.geo
                            ? 'monospace'
                            : null,
                        color: s.feedChannel == FeedChannel.geo
                            ? ResilNetTheme.channelGreen
                            : null,
                      ),
                ),
              ),
            ),
            Expanded(child: _bodyFor(s)),
            if (s.feedChannel != FeedChannel.directs) _bottomCompose(s),
          ],
        ),
      ),
    );
  }

  Widget _bodyFor(AppState s) {
    return switch (s.feedChannel) {
      FeedChannel.directs => _DirectsBody(
          peerController: _peerController,
          onOpen: _openPeer,
          onAlias: _setAlias,
        ),
      FeedChannel.mesh => _MeshListBody(onOpen: _openPeer),
      FeedChannel.geo => _GeoListBody(onOpen: _openPeer),
    };
  }

  Widget _bottomCompose(AppState s) {
    final l10n = context.l10n;
    final channel = _channelLabel(s);
    final messageable = s.feedChannel == FeedChannel.geo
        ? s.peersOnlineInSelectedArea().length
        : (s.isReady ? s.mesh.nearbyPeers.length : 0);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (messageable > 0)
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  l10n.geoPublicHelp(messageable),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(context, alpha: 0.45),
                      ),
                ),
              ),
            Row(
              children: [
                IconButton(
                  tooltip: l10n.chatAttachImage,
                  onPressed: _sending ? null : () => _sendPublicImage(s),
                  icon: const Icon(Icons.image_outlined),
                ),
                IconButton(
                  tooltip: l10n.voicePttHold,
                  onPressed:
                      _sending ? null : () => unawaited(_openPublicVoice(s)),
                  icon: const Icon(Icons.mic_none_outlined),
                ),
                Expanded(
                  child: Focus(
                    onKeyEvent: (node, event) {
                      if (event is! KeyDownEvent) {
                        return KeyEventResult.ignored;
                      }
                      if (event.logicalKey != LogicalKeyboardKey.enter &&
                          event.logicalKey !=
                              LogicalKeyboardKey.numpadEnter) {
                        return KeyEventResult.ignored;
                      }
                      if (HardwareKeyboard.instance.isShiftPressed) {
                        return KeyEventResult.ignored;
                      }
                      if (!_sending) {
                        unawaited(_sendPublic(s));
                      }
                      return KeyEventResult.handled;
                    },
                    child: TextField(
                      controller: _compose,
                      focusNode: _composeFocus,
                      enabled: !_sending,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) {
                        if (!_sending) unawaited(_sendPublic(s));
                      },
                      decoration: InputDecoration(
                        hintText: l10n.homeComposePublicHint(channel),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                IconButton.filled(
                  key: const ValueKey('public-send'),
                  onPressed:
                      _sending ? null : () => unawaited(_sendPublic(s)),
                  style: IconButton.styleFrom(
                    backgroundColor: ResilNetTheme.emerald,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        ResilNetTheme.emerald.withValues(alpha: 0.4),
                    disabledForegroundColor: Colors.white70,
                  ),
                  icon: _sending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.arrow_upward, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  l10n.messageExpiryTitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(context),
                      ),
                ),
                const SizedBox(width: 10),
                for (final e in NoticeExpiry.values)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      visualDensity: VisualDensity.compact,
                      label: Text(
                        e == NoticeExpiry.forever
                            ? '∞'
                            : e == NoticeExpiry.oneDay
                                ? '1d'
                                : e == NoticeExpiry.threeDays
                                    ? '3d'
                                    : '7d',
                      ),
                      selected: _expiry == e,
                      onSelected: (_) => setState(() => _expiry = e),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DirectsBody extends StatelessWidget {
  const _DirectsBody({
    required this.peerController,
    required this.onOpen,
    required this.onAlias,
  });

  final TextEditingController peerController;
  final Future<void> Function(BuildContext, String) onOpen;
  final Future<void> Function(BuildContext, String) onAlias;

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: peerController,
                  decoration: InputDecoration(hintText: l10n.peerIdHint),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () {
                  final id = peerController.text.trim();
                  if (id.isEmpty) return;
                  onOpen(context, id);
                },
                child: Text(l10n.start),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Peer>>(
            key: ValueKey('peers-${s.contactAliasEpoch}'),
            future: s.db.getAllPeers(),
            builder: (context, snap) {
              final peers = snap.data ?? const <Peer>[];
              if (peers.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      l10n.directsEmpty,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(
                              context,
                              alpha: 0.65,
                            ),
                          ),
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                itemCount: peers.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, i) {
                  final peer = peers[i];
                  return ListTile(
                    leading: Identicon(id: peer.id),
                    title: Text(
                      s.peerDisplayLabel(
                        peer.id,
                        fallbackNick: peer.displayName,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 18),
                      onPressed: () => onAlias(context, peer.id),
                    ),
                    onTap: () => onOpen(context, peer.id),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MeshListBody extends StatelessWidget {
  const _MeshListBody({required this.onOpen});

  final Future<void> Function(BuildContext, String) onOpen;

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final peers = s.isReady ? s.mesh.nearbyPeers : const <Peer>[];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
          child: Row(
            children: [
              Text(
                l10n.meshRetentionTitle,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: ResilNetTheme.mutedOnSurface(context),
                    ),
              ),
              const Spacer(),
              for (final r in MeshRetention.values)
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: ChoiceChip(
                    visualDensity: VisualDensity.compact,
                    label: Text(switch (r) {
                      MeshRetention.keep => l10n.meshRetentionKeep,
                      MeshRetention.oneDay => '1d',
                      MeshRetention.threeDays => '3d',
                      MeshRetention.sevenDays => '7d',
                    }),
                    selected: s.meshRetention == r,
                    onSelected: (_) => s.setMeshRetention(r),
                  ),
                ),
            ],
          ),
        ),
        Expanded(
          child: peers.isEmpty
              ? Center(
                  child: Text(
                    l10n.meshIntro,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ResilNetTheme.mutedOnSurface(context),
                        ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                  itemCount: peers.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final peer = peers[i];
                    return ListTile(
                      leading: Identicon(id: peer.id),
                      title: Text(
                        s.peerDisplayLabel(
                          peer.id,
                          fallbackNick: peer.displayName,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: const Icon(Icons.lock_outline, size: 18),
                      onTap: () => onOpen(context, peer.id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _GeoListBody extends StatelessWidget {
  const _GeoListBody({required this.onOpen});

  final Future<void> Function(BuildContext, String) onOpen;

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final presence = s.onlinePresenceForUi();

    return presence.isEmpty
        ? GeoDiscoveryEmptyPanel(channelLabel: s.geoChannelLabel)
        : ListView.separated(
            padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
            itemCount: presence.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, i) {
              final e = presence[i];
              return ListTile(
                leading: Identicon(id: e.id),
                title: Text(
                  e.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  e.id.startsWith('radio:')
                      ? l10n.bleRadioNearbySubtitle
                      : !e.canMessage
                      ? l10n.geoPeerNostrSubtitle(s.geoChannelLabel)
                      : e.source.isInternet && !e.source.isMesh
                          ? l10n.geoPeerInternetSubtitle(s.geoChannelLabel)
                          : l10n.geoPeerSubtitle(s.geoChannelLabel),
                ),
                trailing: Icon(
                  e.id.startsWith('radio:')
                      ? Icons.bluetooth_searching
                      : e.canMessage
                      ? Icons.lock_outline
                      : Icons.travel_explore_outlined,
                  size: 18,
                ),
                onTap: () {
                  if (e.id.startsWith('radio:') || !e.canMessage) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.id.startsWith('radio:')
                              ? l10n.bleRadioNearbySubtitle
                              : l10n.geoPeerDiscoverOnlySnack,
                        ),
                      ),
                    );
                    return;
                  }
                  onOpen(context, e.peer!.id);
                },
              );
            },
          );
  }
}

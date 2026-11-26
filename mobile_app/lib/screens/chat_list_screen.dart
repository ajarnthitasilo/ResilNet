import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../app/tokens.dart';
import '../core/chat_image_codec.dart';
import '../core/payload_kinds.dart';
import '../core/voice_payload.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/app_recovery.dart';
import '../models/feed_channel.dart';
import '../models/notice_expiry.dart';
import '../models/peer.dart';
import '../services/mic_permission.dart';
import '../services/audio_recorder_service.dart';
import '../services/database_service.dart';
import '../state/app_state.dart';
import '../widgets/app_recovery_actions.dart';
import '../widgets/cached_future_builder.dart';
import '../widgets/geo_discovery_empty.dart';
import '../widgets/identicon.dart';
import '../widgets/mesh_status_bar.dart';
import '../widgets/page_shell.dart';
import 'announcements_screen.dart';
import 'chat_screen.dart';
import 'identity_screen.dart';
import 'info_sheet.dart';
import 'location_channel_sheet.dart';
import 'network_panel_sheet.dart';
import 'local_wifi_link_sheet.dart';
import 'online_people_sheet.dart';
import 'settings_screen.dart';
import 'voice_record_sheet.dart';
import '../app/glass_overlays.dart';

/// The slice of [AppState] the home chrome actually renders.
///
/// A record, so `Selector` can compare it by value and skip rebuilds when an
/// unrelated part of the god-object notifier changes.
typedef _HomeChrome = ({
  FeedChannel channel,
  bool ready,
  int unread,
  int online,
  bool tipSeen,
  int lastSystemLineTs,
  String channelLabel,
  int messageable,
});

/// Home feed — three channel tabs, with sheets for the pickers.
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
    // Double-tap: soft refresh. The triple-tap emergency wipe that used to live
    // here is gone — an irreversible wipe behind three taps on the title was
    // far too easy to trigger by accident. It now lives in
    // Settings → danger zone, where it asks before erasing anything.
    if (_titleTapCount >= 2) {
      _titleTapCount = 0;
      _titleTapAt = null;
      unawaited(_softRefreshFromTitle());
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
        GlassSnackBar(content: Text(l10n.appRecoveryBusy)),
      );
      return;
    }
    HapticFeedback.mediumImpact();
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      GlassSnackBar(
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
        GlassSnackBar(
          content: Text(msg),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        GlassSnackBar(content: Text(l10n.appRefreshFailed('$e'))),
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
    if (!context.mounted) {
      controller.dispose();
      return;
    }
    try {
      final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => GlassAlertDialog(
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
    } finally {
      controller.dispose();
    }
  }

  /// Expiry options the current channel actually honours.
  ///
  /// Mesh bulletins carry a max 7-day TTL, so "∞" is not offered there — it
  /// used to stay selected while the post was silently stored for 7 days.
  List<NoticeExpiry> _expiryOptions(AppState s) {
    if (s.feedChannel == FeedChannel.mesh) {
      return NoticeExpiry.values
          .where((e) => e != NoticeExpiry.forever)
          .toList();
    }
    return NoticeExpiry.values;
  }

  NoticeExpiry _effectiveExpiry(AppState s) {
    final options = _expiryOptions(s);
    return options.contains(_expiry) ? _expiry : NoticeExpiry.sevenDays;
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

    if (!mounted) return;
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(l10n.chatE2eeOffBlocked)),
      );
      return;
    }
    final expiry = _effectiveExpiry(s);
    setState(() => _sending = true);
    try {
      if (s.feedChannel == FeedChannel.mesh) {
        await s.setNostrExpiry(expiry);
        await s.postNotice(
          scope: 'mesh',
          channelLabel: '#mesh',
          text: text,
          expiry: expiry,
        );
        if (!mounted) return;
        final warn = s.lastNoticePublishWarning;
        final sent = s.lastBulletinBleSent;
        if (sent > 0) {
          ScaffoldMessenger.of(context).showSnackBar(
            GlassSnackBar(content: Text(context.l10n.noticeMeshPublishSent(sent))),
          );
        } else if (warn != null) {
          final msg = switch (warn) {
            'ble_send_failed' => context.l10n.noticeMeshPublishBleFailed,
            'no_gatt' => context.l10n.noticeMeshPublishNoGatt,
            'no_mesh' => context.l10n.noticeMeshPublishNoLink,
            _ => context.l10n.noticePublishFailed,
          };
          ScaffoldMessenger.of(context).showSnackBar(
            GlassSnackBar(content: Text(msg)),
          );
        }
      } else if (s.feedChannel == FeedChannel.geo) {
        await s.setNostrExpiry(expiry);
        final n = await s.sendAreaPublicText(text);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          GlassSnackBar(content: Text(context.l10n.geoPublicSent(n))),
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
        GlassSnackBar(content: Text(context.l10n.chatE2eeOffBlocked)),
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
        GlassSnackBar(content: Text(context.l10n.chatImageTooLarge)),
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
          GlassSnackBar(content: Text(context.l10n.geoPublicSent(n))),
        );
      } else if (s.feedChannel == FeedChannel.mesh) {
        final n = await s.sendMeshPublicText(
          b64,
          kind: PayloadKinds.image,
        );
        if (!mounted) return;
        // #mesh has its own wording — it used to report the area-channel one.
        ScaffoldMessenger.of(context).showSnackBar(
          GlassSnackBar(
            content: Text(
              n <= 0
                  ? context.l10n.meshPublicSentNone
                  : context.l10n.meshPublicSent(n),
            ),
          ),
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
        GlassSnackBar(content: Text(context.l10n.chatE2eeOffBlocked)),
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
          GlassSnackBar(content: Text(context.l10n.chatVoiceTooLarge)),
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
          GlassSnackBar(
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
    // The chrome (app bar, tabs, channel line, composer) depends on a handful
    // of values, not on all of AppState. Watching the whole notifier rebuilt
    // this entire page on every BLE / Nostr / chunk tick; the record below has
    // value equality, so a tick that changes none of these rebuilds nothing.
    return Selector<AppState, _HomeChrome>(
      selector: (_, s) => (
        channel: s.feedChannel,
        ready: s.isReady,
        unread: s.isReady ? s.unreadDirectCount : 0,
        online: s.isReady ? s.onlinePresenceCount : 0,
        tipSeen: s.softRefreshTipSeen,
        lastSystemLineTs:
            s.systemLines.isEmpty ? 0 : s.systemLines.last.timestamp,
        channelLabel: _channelLabel(s),
        messageable: s.feedChannel == FeedChannel.directs
            ? 0
            : s.feedChannel == FeedChannel.geo
                ? s.peersOnlineInSelectedArea().length
                : (s.isReady ? s.mesh.nearbyPeers.length : 0),
      ),
      builder: (context, chrome, _) => _buildHome(context, chrome),
    );
  }

  Widget _buildHome(BuildContext context, _HomeChrome chrome) {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final onlineCount = chrome.online;
    final unreadCount = chrome.unread;

    return ResilNetPage(
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
              child: Text(
                l10n.communityTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
              ),
            ),
          ),
        ),
        actionsIconTheme: const IconThemeData(size: 22),
        // Four unlabelled pickers used to sit here. The channel switch is now
        // the bottom tab bar and the connection controls live in the network
        // panel behind the status bar — both labelled. Everything is still one
        // or two taps away, and the old sheets are unchanged.
        actions: [
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
              switch (v) {
                case 'settings':
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  );
                case 'identity':
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const IdentityScreen()),
                  );
                case 'info':
                  showInfoSheet(context);
                case 'announce':
                  openAnnouncementsScreen(context);
                case 'network':
                  unawaited(showNetworkPanelSheet(context));
                case 'hard_recover':
                  unawaited(
                    runAppRecoveryAction(
                      context,
                      busyLabel: l10n.appHardRecovering,
                      action: (s) => s.hardRecoverApp(reason: 'overflow-menu'),
                    ),
                  );
                case 'local_wifi':
                  unawaited(showLocalWifiLinkSheet(context));
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'network',
                child: Text(l10n.networkPanelTitle),
              ),
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
      bottomNavigationBar: _channelTabs(s, chrome.channel, unreadCount),
      body: Column(
          children: [
            const MeshStatusBar(),
            if (chrome.ready && !chrome.tipSeen) _softRefreshTipBanner(s),
            if (chrome.lastSystemLineTs > 0)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: Text(
                  '${l10n.screenshotTaken} [${TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(chrome.lastSystemLineTs)).format(context)}]',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ResilNetTheme.mutedOnSurface(context, alpha: 0.45),
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      chrome.channelLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontFamily: chrome.channel == FeedChannel.geo
                                ? 'monospace'
                                : null,
                            color: chrome.channel == FeedChannel.geo
                                ? context.tokens.channel
                                : null,
                          ),
                    ),
                  ),
                  if (chrome.channel == FeedChannel.geo)
                    TextButton.icon(
                      onPressed: () => showLocationChannelSheet(context),
                      icon: const Icon(Icons.place_outlined, size: 18),
                      label: Text(l10n.locationPickerTooltip),
                    ),
                ],
              ),
            ),
            Expanded(child: _bodyFor(chrome.channel)),
            if (chrome.channel != FeedChannel.directs)
              _bottomCompose(s, chrome),
          ],
        ),
    );
  }

  /// Channel switch as a bottom tab bar.
  ///
  /// Same three feeds, same [AppState.setFeedChannel] call the picker sheet
  /// makes — but visible and labelled instead of hidden behind an icon, with
  /// the unread badge on the tab it belongs to.
  Widget _channelTabs(AppState s, FeedChannel current, int unreadCount) {
    final l10n = context.l10n;
    final index = FeedChannel.values.indexOf(current);
    return NavigationBar(
      selectedIndex: index < 0 ? 0 : index,
      onDestinationSelected: (i) {
        final next = FeedChannel.values[i];
        if (next == current) return;
        HapticFeedback.selectionClick();
        unawaited(s.setFeedChannel(next));
      },
      destinations: [
        NavigationDestination(
          icon: Badge(
            isLabelVisible: unreadCount > 0,
            label: Text('$unreadCount'),
            child: const Icon(Icons.lock_outline),
          ),
          selectedIcon: Badge(
            isLabelVisible: unreadCount > 0,
            label: Text('$unreadCount'),
            child: const Icon(Icons.lock),
          ),
          label: l10n.feedDirects,
          tooltip: unreadCount > 0
              ? l10n.unreadDirectsTooltip(unreadCount)
              : l10n.unreadDirectsTooltipEmpty,
        ),
        NavigationDestination(
          icon: const Icon(Icons.bluetooth),
          selectedIcon: const Icon(Icons.bluetooth_connected),
          label: l10n.feedMesh,
          tooltip: l10n.feedMeshSubtitle,
        ),
        NavigationDestination(
          icon: const Icon(Icons.public_outlined),
          selectedIcon: const Icon(Icons.public),
          label: l10n.feedGeo,
          tooltip: l10n.feedGeoSubtitle,
        ),
      ],
    );
  }

  Widget _bodyFor(FeedChannel channel) {
    return switch (channel) {
      FeedChannel.directs => _DirectsBody(
          peerController: _peerController,
          onOpen: _openPeer,
          onAlias: _setAlias,
        ),
      FeedChannel.mesh => _MeshListBody(onOpen: _openPeer),
      FeedChannel.geo => _GeoListBody(onOpen: _openPeer),
    };
  }

  Widget _bottomCompose(AppState s, _HomeChrome chrome) {
    final l10n = context.l10n;
    final channel = chrome.channelLabel;
    final messageable = chrome.messageable;

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
                for (final e in _expiryOptions(s))
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: ChoiceChip(
                      visualDensity: VisualDensity.compact,
                      label: Text(switch (e) {
                        NoticeExpiry.forever => '∞',
                        NoticeExpiry.oneDay => '1d',
                        NoticeExpiry.threeDays => '3d',
                        NoticeExpiry.sevenDays => '7d',
                      }),
                      selected: _effectiveExpiry(s) == e,
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

/// What one load of the 1:1 list needs: the peer rows plus per-peer metadata.
class _DirectsSnapshot {
  const _DirectsSnapshot({required this.peers, required this.summaries});

  final List<Peer> peers;
  final Map<String, PeerChatSummary> summaries;
}

/// Clock time for today, numeric date before that — digits only, so it reads
/// the same in every locale the app ships.
String _formatLastActivity(int timestampMs) {
  if (timestampMs <= 0) return '';
  final dt = DateTime.fromMillisecondsSinceEpoch(timestampMs).toLocal();
  final now = DateTime.now();
  if (dt.year == now.year && dt.month == now.month && dt.day == now.day) {
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
  }
  if (dt.year == now.year) return '${dt.day}/${dt.month}';
  return '${dt.day}/${dt.month}/${dt.year}';
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
                  decoration: InputDecoration(
                    hintText: l10n.peerIdHint,
                    // Wrap rather than cut the sentence in half on a phone.
                    hintMaxLines: 2,
                  ),
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
          child: CachedFutureBuilder<_DirectsSnapshot>(
            epoch: (s.peerDirectoryEpoch, s.chatDataEpoch),
            load: () async {
              final peers = await s.db.getAllPeers();
              final summaries = s.myUserIdReady
                  ? await s.db.getDirectChatSummaries(s.myUserId)
                  : const <String, PeerChatSummary>{};
              return _DirectsSnapshot(peers: peers, summaries: summaries);
            },
            builder: (context, snap) {
              final peers = snap.data?.peers ?? const <Peer>[];
              final summaries =
                  snap.data?.summaries ?? const <String, PeerChatSummary>{};
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
                  final summary = summaries[peer.id];
                  final unread = summary?.unread ?? 0;
                  final stamp = _formatLastActivity(summary?.lastTs ?? 0);
                  return ListTile(
                    leading: Badge(
                      isLabelVisible: unread > 0,
                      label: Text('$unread'),
                      child: Identicon(id: peer.id),
                    ),
                    title: Text(
                      s.peerDisplayLabel(
                        peer.id,
                        fallbackNick: peer.displayName,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: stamp.isEmpty
                        ? null
                        : Text(
                            stamp,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: ResilNetTheme.mutedOnSurface(
                                    context,
                                    alpha: 0.6,
                                  ),
                                ),
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
    // The auto-delete window lives in Settings > Data, not here. On this screen
    // it sat a few rows above the composer's "expires in" chips with the same
    // styling and overlapping values, and the two mean opposite things: this one
    // is how long received history is kept locally, that one is the TTL of the
    // notice being sent.
    return Column(
      children: [
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
                      GlassSnackBar(
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

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/payload_kinds.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/feed_channel.dart';
import '../models/mesh_retention.dart';
import '../models/notice_expiry.dart';
import '../models/peer.dart';
import '../services/audio_recorder_service.dart';
import '../services/mic_permission.dart';
import '../state/app_state.dart';
import '../widgets/geo_discovery_empty.dart';
import '../widgets/identicon.dart';
import '../widgets/mesh_status_bar.dart';
import 'announcements_screen.dart';
import 'chat_screen.dart';
import 'feed_channel_sheet.dart';
import 'identity_screen.dart';
import 'info_sheet.dart';
import 'location_channel_sheet.dart';
import 'notices_sheet.dart';
import 'online_people_sheet.dart';
import 'panic_wipe.dart';
import 'peer_list_screen.dart';
import 'settings_screen.dart';

/// Home feed — clean bitchat-style chrome with sheets for mode pickers.
class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _peerController = TextEditingController();
  final _compose = TextEditingController();
  final _audio = AudioRecorderService();
  NoticeExpiry _expiry = NoticeExpiry.sevenDays;
  bool _sending = false;
  bool _recordingVoice = false;
  int _titleTapCount = 0;
  DateTime? _titleTapAt;

  @override
  void dispose() {
    _peerController.dispose();
    _compose.dispose();
    _audio.dispose();
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
    if (_titleTapCount >= 3) {
      _titleTapCount = 0;
      _titleTapAt = null;
      unawaited(confirmAndPanicWipe(context));
    }
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
    final existing = await s.db.getContactAlias(peerId) ?? '';
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
    await s.db.setContactAlias(
      publicKeyHash: peerId,
      aliasName: controller.text,
    );
    if (mounted) setState(() {});
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
      } else if (s.feedChannel == FeedChannel.geo) {
        await s.setNostrExpiry(_expiry);
        final n = await s.sendAreaPublicText(text);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.geoPublicSent(n))),
        );
      }
      _compose.clear();
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
      maxWidth: 1280,
      imageQuality: 75,
    );
    if (file == null) return;
    final bytes = await File(file.path).readAsBytes();
    if (bytes.length > 180000) {
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

  Future<void> _startPublicVoice(AppState s) async {
    if (_recordingVoice || _sending) return;
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
      );
      return;
    }
    try {
      await _audio.startRecording();
      if (mounted) setState(() => _recordingVoice = true);
    } catch (e) {
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

  Future<void> _stopAndSendPublicVoice(AppState s) async {
    if (!_recordingVoice) return;
    final opus = await _audio.stopRecording();
    if (mounted) setState(() => _recordingVoice = false);
    if (opus == null || opus.isEmpty) return;
    if (!s.e2eeEnabled) return;

    final b64 = base64Encode(opus);
    setState(() => _sending = true);
    try {
      final n = s.feedChannel == FeedChannel.geo
          ? await s.sendAreaPublicText(b64, kind: PayloadKinds.audio)
          : await s.sendMeshPublicText(b64, kind: PayloadKinds.audio);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.geoPublicSent(n))),
      );
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  void _onPeoplePressed(AppState s) {
    if (s.feedChannel == FeedChannel.directs) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PeerListScreen()),
      );
    } else {
      showOnlinePeopleSheet(context);
    }
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
    final onlineCount = s.feedChannel == FeedChannel.mesh
        ? (s.isReady ? s.mesh.nearbyPeers.length : 0)
        : s.areaPresenceOnline().length;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        titleSpacing: 8,
        title: GestureDetector(
          onTap: _onTitleTap,
          behavior: HitTestBehavior.opaque,
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
            tooltip: s.feedChannel == FeedChannel.directs
                ? l10n.networkMembersTooltip
                : '${l10n.onlinePeopleTooltip} ($onlineCount)',
            onPressed: () => _onPeoplePressed(s),
            icon: Badge(
              isLabelVisible: s.feedChannel != FeedChannel.directs &&
                  onlineCount > 0,
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
              }
            },
            itemBuilder: (context) => [
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
      body: Container(
        decoration:
            const BoxDecoration(gradient: ResilNetTheme.scaffoldGradient),
        child: Column(
          children: [
            const MeshStatusBar(),
            if (s.systemLines.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                child: Text(
                  '${l10n.screenshotTaken} [${TimeOfDay.fromDateTime(DateTime.fromMillisecondsSinceEpoch(s.systemLines.last.timestamp)).format(context)}]',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withValues(alpha: 0.4),
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
                        color: Colors.white38,
                      ),
                ),
              ),
            Row(
              children: [
                IconButton(
                  tooltip: l10n.chatAttachImage,
                  onPressed: _sending || _recordingVoice
                      ? null
                      : () => _sendPublicImage(s),
                  icon: const Icon(Icons.image_outlined),
                ),
                IconButton(
                  tooltip: _recordingVoice
                      ? l10n.voicePttRecording
                      : l10n.voicePttHold,
                  onPressed: _sending
                      ? null
                      : () {
                          if (_recordingVoice) {
                            unawaited(_stopAndSendPublicVoice(s));
                          } else {
                            unawaited(_startPublicVoice(s));
                          }
                        },
                  icon: Icon(
                    _recordingVoice ? Icons.mic : Icons.mic_none_outlined,
                    color: _recordingVoice ? Colors.redAccent : null,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _compose,
                    enabled: !_sending && !_recordingVoice,
                    minLines: 1,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: l10n.homeComposePublicHint(channel),
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => unawaited(_sendPublic(s)),
                  ),
                ),
                const SizedBox(width: 6),
                IconButton.filled(
                  onPressed: _sending || _recordingVoice
                      ? null
                      : () => unawaited(_sendPublic(s)),
                  icon: _sending
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.arrow_upward),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  l10n.messageExpiryTitle,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Colors.white54,
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
                            color: Colors.white60,
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
                    title: FutureBuilder<String>(
                      future: s.db.resolveDisplayName(peer.id),
                      builder: (context, nameSnap) => Text(
                        nameSnap.data ?? peer.displayName ?? peer.id,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    subtitle: Text(
                      peer.id,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: 'monospace'),
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
                      color: Colors.white54,
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
                          color: Colors.white54,
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
                      title: Text(peer.displayName ?? peer.id),
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
    final presence = s.areaPresenceOnline();

    if (s.geoNeedsPermission) {
      return GeoDiscoveryEmptyPanel(channelLabel: s.geoChannelLabel);
    }

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
                title: Text(e.label),
                subtitle: Text(
                  !e.canMessage
                      ? l10n.geoPeerNostrSubtitle(s.geoChannelLabel)
                      : e.source.isInternet && !e.source.isMesh
                          ? l10n.geoPeerInternetSubtitle(s.geoChannelLabel)
                          : l10n.geoPeerSubtitle(s.geoChannelLabel),
                ),
                trailing: Icon(
                  e.canMessage
                      ? Icons.lock_outline
                      : Icons.travel_explore_outlined,
                  size: 18,
                ),
                onTap: () {
                  if (!e.canMessage) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.geoPeerDiscoverOnlySnack)),
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/peer_id.dart';
import '../l10n/l10n_ext.dart';
import '../models/local_notice.dart';
import '../models/notice_expiry.dart';
import '../state/app_state.dart';
import 'chat_screen.dart';
import 'online_people_sheet.dart';

/// Bitchat-style public notices for #mesh or Area.
Future<void> showNoticesSheet(
  BuildContext context, {
  required String initialScope, // 'mesh' | 'geo'
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _NoticesSheet(initialScope: initialScope),
  );
}

class _NoticesSheet extends StatefulWidget {
  const _NoticesSheet({required this.initialScope});

  final String initialScope;

  @override
  State<_NoticesSheet> createState() => _NoticesSheetState();
}

class _NoticesSheetState extends State<_NoticesSheet> {
  late String _scope;
  final _text = TextEditingController();
  NoticeExpiry _expiry = NoticeExpiry.sevenDays;
  bool _urgent = false;
  bool _posting = false;

  @override
  void initState() {
    super.initState();
    _scope = widget.initialScope;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final s = context.read<AppState>();
      if (_scope == 'geo') {
        unawaited(s.backfillGeoNotices());
      }
    });
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  Future<void> _post(AppState s) async {
    if (_posting) return;
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
      );
      return;
    }
    setState(() => _posting = true);
    try {
      final channel = _scope == 'geo' ? s.geoChannelLabel : '#mesh';
      final notice = await s.postNotice(
        scope: _scope,
        channelLabel: channel,
        text: _text.text,
        expiry: _scope == 'geo' && _expiry == NoticeExpiry.forever
            ? NoticeExpiry.forever
            : (_scope == 'mesh' && _expiry == NoticeExpiry.forever
                ? NoticeExpiry.sevenDays
                : _expiry),
        urgent: _urgent && _scope == 'mesh',
      );
      if (!mounted) return;
      if (notice == null) return;
      _text.clear();
      final warn = s.lastNoticePublishWarning;
      if (warn != null && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.noticePublishFailed)),
        );
      }
      setState(() {});
    } finally {
      if (mounted) setState(() => _posting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final channel = _scope == 'geo' ? s.geoChannelLabel : '#mesh';
    final items = s.noticesForScope(_scope);
    final bottom = MediaQuery.viewInsetsOf(context).bottom;

    return Container(
      height: MediaQuery.sizeOf(context).height * 0.88,
      decoration: const BoxDecoration(
        gradient: ResilNetTheme.scaffoldGradient,
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      padding: EdgeInsets.fromLTRB(16, 14, 16, 12 + bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '${l10n.noticesTitle} @ $channel',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                l10n.onlinePeopleCount(
                  _scope == 'mesh'
                      ? (s.isReady ? s.mesh.nearbyPeers.length : 0)
                      : s.areaPresenceOnline().length,
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ResilNetTheme.channelGreen,
                    ),
              ),
              IconButton(
                tooltip: l10n.onlinePeopleTooltip,
                onPressed: () {
                  Navigator.pop(context);
                  showOnlinePeopleSheet(context);
                },
                icon: const Icon(Icons.groups_outlined),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: SegmentedButton<String>(
              segments: [
                ButtonSegment(value: 'geo', label: Text(l10n.feedGeo)),
                ButtonSegment(value: 'mesh', label: Text(l10n.feedMesh)),
              ],
              selected: {_scope},
              onSelectionChanged: (set) {
                setState(() {
                  _scope = set.first;
                  if (_scope == 'mesh' && _expiry == NoticeExpiry.forever) {
                    _expiry = NoticeExpiry.sevenDays;
                  }
                });
                if (_scope == 'geo') {
                  unawaited(context.read<AppState>().backfillGeoNotices());
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          if (_scope == 'geo') _buildGeoSyncStatus(context, s, l10n),
          if (_scope == 'geo') const SizedBox(height: 8),
          if (_scope == 'mesh') ...[
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.amber.withValues(alpha: 0.45),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.campaign_outlined,
                          size: 13, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        l10n.noticesMeshPublicBadge,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Colors.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
          Text(
            _scope == 'mesh' ? l10n.noticesMeshIntro : l10n.noticesGeoIntro,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                  height: 1.35,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _scope == 'geo'
                ? RefreshIndicator(
                    onRefresh: () => s.backfillGeoNotices(),
                    child: _buildNoticeList(context, s, l10n, items),
                  )
                : _buildNoticeList(context, s, l10n, items),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _text,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(hintText: l10n.noticesComposeHint),
                  enabled: !_posting,
                ),
              ),
              const SizedBox(width: 8),
              IconButton.filled(
                onPressed: _posting ? null : () => _post(s),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: 0.12),
                ),
                icon: _posting
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.arrow_upward, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              if (_scope == 'mesh') ...[
                Text(
                  l10n.noticesUrgent,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(width: 6),
                Switch(
                  value: _urgent,
                  onChanged: (v) => setState(() => _urgent = v),
                ),
                const Spacer(),
              ] else
                const Spacer(),
              Text(
                l10n.noticeExpiresIn,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white54,
                    ),
              ),
              const SizedBox(width: 8),
              Wrap(
                spacing: 6,
                children: [
                  if (_scope == 'geo')
                    _ExpiryChip(
                      label: '∞',
                      selected: _expiry == NoticeExpiry.forever,
                      onTap: () =>
                          setState(() => _expiry = NoticeExpiry.forever),
                    ),
                  _ExpiryChip(
                    label: '1d',
                    selected: _expiry == NoticeExpiry.oneDay,
                    onTap: () => setState(() => _expiry = NoticeExpiry.oneDay),
                  ),
                  _ExpiryChip(
                    label: '3d',
                    selected: _expiry == NoticeExpiry.threeDays,
                    onTap: () =>
                        setState(() => _expiry = NoticeExpiry.threeDays),
                  ),
                  _ExpiryChip(
                    label: '7d',
                    selected: _expiry == NoticeExpiry.sevenDays,
                    onTap: () =>
                        setState(() => _expiry = NoticeExpiry.sevenDays),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGeoSyncStatus(
    BuildContext context,
    AppState s,
    AppLocalizations l10n,
  ) {
    final online = s.isNostrOnline;
    final backfillAt = s.lastNoticeBackfillAt;
    final backfillCount = s.lastNoticeBackfillCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              online ? Icons.cloud_done_outlined : Icons.cloud_off_outlined,
              size: 16,
              color: online
                  ? ResilNetTheme.channelGreen
                  : Colors.orangeAccent.withValues(alpha: 0.85),
            ),
            const SizedBox(width: 6),
            Text(
              online ? l10n.noticesNostrOnline : l10n.noticesNostrOffline,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: online
                        ? ResilNetTheme.channelGreen
                        : Colors.orangeAccent.withValues(alpha: 0.85),
                  ),
            ),
            if (s.noticesBackfilling) ...[
              const SizedBox(width: 10),
              const SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              const SizedBox(width: 6),
              Text(
                l10n.noticesBackfilling,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
              ),
            ],
          ],
        ),
        if (backfillAt != null && !s.noticesBackfilling) ...[
          const SizedBox(height: 4),
          Text(
            l10n.noticesBackfillLoaded(backfillCount),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.45),
                ),
          ),
        ],
      ],
    );
  }

  Widget _buildNoticeList(
    BuildContext context,
    AppState s,
    AppLocalizations l10n,
    List<LocalNotice> items,
  ) {
    if (s.noticesBackfilling && items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(strokeWidth: 2),
                  const SizedBox(height: 12),
                  Text(
                    l10n.noticesBackfilling,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.55),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (items.isEmpty) {
      return ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.noticesEmpty,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    l10n.noticesEmptyHint,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.3),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, _) => Divider(
        color: Colors.white.withValues(alpha: 0.06),
      ),
      itemBuilder: (context, i) {
        final n = items[i];
        final created = DateTime.fromMillisecondsSinceEpoch(n.createdAt);
        final expires = n.expiresAt == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(n.expiresAt!);
        final anon = formatAnonSender(n.senderId);
        final meta = expires == null
            ? '${n.channelLabel} · ${_formatWhen(created)}'
            : '${n.channelLabel} · ${_formatWhen(created)} · ${l10n.noticeExpiresIn} ${_formatWhen(expires)}';
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            n.urgent ? '⚠ ${n.text}' : n.text,
            style: TextStyle(
              color: n.urgent
                  ? Colors.orangeAccent
                  : Colors.white.withValues(alpha: 0.9),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 2),
              GestureDetector(
                onTap: n.senderId == null || n.senderId!.isEmpty
                    ? null
                    : () => _showAnonActions(context, s, n),
                child: Text(
                  anon,
                  style: TextStyle(
                    color: ResilNetTheme.channelGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    decoration: n.senderId == null || n.senderId!.isEmpty
                        ? null
                        : TextDecoration.underline,
                    decorationColor: ResilNetTheme.channelGreen.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
              ),
              Text(
                meta,
                style: const TextStyle(
                  color: ResilNetTheme.channelGreen,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatWhen(DateTime dt) {
    final local = dt.toLocal();
    final h = local.hour.toString().padLeft(2, '0');
    final m = local.minute.toString().padLeft(2, '0');
    return '${local.month}/${local.day} $h:$m';
  }

  Future<void> _showAnonActions(
    BuildContext context,
    AppState s,
    LocalNotice n,
  ) async {
    final senderId = n.senderId?.trim() ?? '';
    if (senderId.isEmpty) return;
    final l10n = context.l10n;
    final anon = formatAnonSender(senderId);
    final isSelf = senderId == s.myUserId;

    final action = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: const Color(0xFF1C1C1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    anon,
                    style: const TextStyle(
                      color: ResilNetTheme.channelGreen,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(l10n.noticeAnonMention),
                onTap: () => Navigator.pop(ctx, 'mention'),
              ),
              if (!isSelf) ...[
                ListTile(
                  title: Text(l10n.noticeAnonDm),
                  onTap: () => Navigator.pop(ctx, 'dm'),
                ),
                ListTile(
                  title: Text(l10n.noticeAnonHug),
                  onTap: () => Navigator.pop(ctx, 'hug'),
                ),
                ListTile(
                  title: Text(l10n.noticeAnonSlap),
                  onTap: () => Navigator.pop(ctx, 'slap'),
                ),
                ListTile(
                  title: Text(
                    l10n.noticeAnonBlock,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                  onTap: () => Navigator.pop(ctx, 'block'),
                ),
              ],
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
    if (!mounted || action == null) return;

    switch (action) {
      case 'mention':
        final mention = '@$anon ';
        final cur = _text.text;
        _text.value = TextEditingValue(
          text: '$cur$mention',
          selection: TextSelection.collapsed(offset: (cur + mention).length),
        );
        setState(() {});
      case 'dm':
        Navigator.pop(context);
        if (!mounted) return;
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ChatScreen(peerId: senderId)),
        );
      case 'hug':
        final ok = await s.sendSealedTextToPeer(
          peerId: senderId,
          text: l10n.noticeAnonHugMessage(anon),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ok ? l10n.noticeAnonActionSent : l10n.noticeAnonNeedKey,
            ),
          ),
        );
      case 'slap':
        final ok = await s.sendSealedTextToPeer(
          peerId: senderId,
          text: l10n.noticeAnonSlapMessage(anon),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              ok ? l10n.noticeAnonActionSent : l10n.noticeAnonNeedKey,
            ),
          ),
        );
      case 'block':
        await s.setPeerBlocked(senderId, blocked: true);
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.noticeAnonBlocked(anon))),
        );
    }
  }
}

class _ExpiryChip extends StatelessWidget {
  const _ExpiryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected
              ? Colors.white.withValues(alpha: 0.16)
              : Colors.white.withValues(alpha: 0.04),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withValues(alpha: selected ? 0.95 : 0.55),
          ),
        ),
      ),
    );
  }
}

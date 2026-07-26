import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../models/notice_expiry.dart';
import '../state/app_state.dart';
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
              },
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _scope == 'mesh' ? l10n.noticesMeshIntro : l10n.noticesGeoIntro,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                  height: 1.35,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: items.isEmpty
                ? Center(
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
                  )
                : ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, _) => Divider(
                      color: Colors.white.withValues(alpha: 0.06),
                    ),
                    itemBuilder: (context, i) {
                      final n = items[i];
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
                        subtitle: Text(
                          n.channelLabel,
                          style: const TextStyle(
                            color: ResilNetTheme.channelGreen,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
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

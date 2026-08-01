import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../core/peer_id.dart';
import '../l10n/l10n_ext.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import 'chat_screen.dart';

/// Mesh topology as a ResilNet-styled graph (you + discovered neighbors).
/// Labels use short/anon names — never full public-key hashes.
class MeshTopologyScreen extends StatefulWidget {
  const MeshTopologyScreen({super.key});

  @override
  State<MeshTopologyScreen> createState() => _MeshTopologyScreenState();
}

class _MeshTopologyScreenState extends State<MeshTopologyScreen> {
  bool _refreshing = false;

  Future<void> _refresh() async {
    if (_refreshing) return;
    setState(() => _refreshing = true);
    try {
      final s = context.read<AppState>();
      if (s.isReady) {
        await s.mesh.refreshNearbyPeers();
      }
    } finally {
      if (mounted) setState(() => _refreshing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final s = context.watch<AppState>();
    final scheme = Theme.of(context).colorScheme;
    final dark = ResilNetTheme.isDark(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.topologyTitle.toLowerCase()),
        centerTitle: true,
        leading: IconButton(
          tooltip: l10n.retry,
          onPressed: _refreshing ? null : _refresh,
          icon: _refreshing
              ? SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: scheme.onSurface,
                  ),
                )
              : const Icon(Icons.refresh),
        ),
      ),
      body: Container(
        decoration: ResilNetTheme.pageDecoration(context),
        child: FutureBuilder<List<Peer>>(
          future: s.db.getAllPeers(),
          builder: (context, snap) {
            final known = snap.data ?? const <Peer>[];
            final nearby = s.isReady ? s.mesh.nearbyPeers : const <Peer>[];
            final connectedId = s.isReady ? s.mesh.connectedDeviceId : null;

            final byId = <String, Peer>{};
            for (final p in known) {
              if (p.id == s.myUserId) continue;
              byId[p.id] = p;
            }
            for (final p in nearby) {
              if (p.id == s.myUserId) continue;
              byId[p.id] = p;
            }

            Peer? linked;
            if (connectedId != null) {
              for (final p in byId.values) {
                if (p.deviceId == connectedId) {
                  linked = p;
                  break;
                }
              }
            }

            final nodes = byId.values.toList()
              ..sort((a, b) {
                final an = nearby.any((n) => n.id == a.id) ? 0 : 1;
                final bn = nearby.any((n) => n.id == b.id) ? 0 : 1;
                if (an != bn) return an.compareTo(bn);
                return a.id.compareTo(b.id);
              });

            if (nodes.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    l10n.topologyEmpty,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ResilNetTheme.mutedOnSurface(context, alpha: 0.7),
                        ),
                  ),
                ),
              );
            }

            final nearbyIds = nearby.map((p) => p.id).toSet();
            final linkCount = nearbyIds.isEmpty
                ? (linked != null ? 1 : 0)
                : nearbyIds.length;
            final graphNodes = <_TopoNode>[
              _TopoNode(
                id: s.myUserId,
                label: peerListLabel(
                  aliasOrNick: l10n.topologyYou,
                  id: s.myUserId,
                ),
                isSelf: true,
                linked: true,
                nearby: true,
              ),
              for (final p in nodes)
                _TopoNode(
                  id: p.id,
                  label: s.peerDisplayLabel(
                    p.id,
                    fallbackNick: p.displayName,
                  ),
                  isSelf: false,
                  linked: linked?.id == p.id || nearbyIds.contains(p.id),
                  nearby: nearbyIds.contains(p.id),
                ),
            ];

            return Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                        onTapUp: (details) {
                          final hit = _hitTest(
                            details.localPosition,
                            Size(constraints.maxWidth, constraints.maxHeight),
                            graphNodes,
                          );
                          if (hit == null || hit.isSelf) return;
                          final peer = byId[hit.id];
                          if (peer == null || peer.isBlocked) return;
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(peerId: peer.id),
                            ),
                          );
                        },
                        child: CustomPaint(
                          size: Size(
                            constraints.maxWidth,
                            constraints.maxHeight,
                          ),
                          painter: _MeshTopologyPainter(
                            nodes: graphNodes,
                            dark: dark,
                            accent: ResilNetTheme.emerald,
                            linkColor: dark
                                ? const Color(0xFF7DD3FC)
                                : const Color(0xFF0284C7),
                            selfFill: dark
                                ? const Color(0xFF38BDF8)
                                : const Color(0xFF0EA5E9),
                            peerFill: dark ? Colors.white : const Color(0xFF334155),
                            labelColor: scheme.onSurface,
                            mutedLabel: ResilNetTheme.mutedOnSurface(
                              context,
                              alpha: 0.45,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SafeArea(
                  top: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.topologyStats(
                            graphNodes.length,
                            linkCount,
                          ),
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          l10n.topologyGraphHint,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ResilNetTheme.mutedOnSurface(
                                      context,
                                      alpha: 0.5,
                                    ),
                                    height: 1.35,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _TopoNode? _hitTest(Offset local, Size size, List<_TopoNode> nodes) {
    final layout = _layoutNodes(size, nodes);
    for (final entry in layout.entries) {
      if ((entry.value - local).distance <= 28) {
        return nodes.firstWhere((n) => n.id == entry.key);
      }
    }
    return null;
  }
}

class _TopoNode {
  const _TopoNode({
    required this.id,
    required this.label,
    required this.isSelf,
    required this.linked,
    required this.nearby,
  });

  final String id;
  final String label;
  final bool isSelf;
  final bool linked;
  final bool nearby;
}

Map<String, Offset> _layoutNodes(Size size, List<_TopoNode> nodes) {
  final out = <String, Offset>{};
  final self = nodes.firstWhere((n) => n.isSelf);
  final others = nodes.where((n) => !n.isSelf).toList();
  final cx = size.width / 2;
  final selfY = size.height * 0.72;
  out[self.id] = Offset(cx, selfY);

  if (others.isEmpty) return out;

  final nearby = others.where((n) => n.nearby).toList();
  final far = others.where((n) => !n.nearby).toList();
  final ring = <_TopoNode>[...nearby, ...far];

  final count = ring.length;
  final radius = math.min(size.width, size.height) * 0.32;
  // Fan above self (Bitchat-like vertical when 1 peer).
  if (count == 1) {
    out[ring.first.id] = Offset(cx, size.height * 0.28);
    return out;
  }

  final start = -math.pi * 0.85;
  final sweep = math.pi * 0.95;
  for (var i = 0; i < count; i++) {
    final t = count == 1 ? 0.5 : i / (count - 1);
    final angle = start + sweep * t;
    out[ring[i].id] = Offset(
      cx + math.cos(angle) * radius,
      selfY + math.sin(angle) * radius - radius * 0.35,
    );
  }
  return out;
}

class _MeshTopologyPainter extends CustomPainter {
  _MeshTopologyPainter({
    required this.nodes,
    required this.dark,
    required this.accent,
    required this.linkColor,
    required this.selfFill,
    required this.peerFill,
    required this.labelColor,
    required this.mutedLabel,
  });

  final List<_TopoNode> nodes;
  final bool dark;
  final Color accent;
  final Color linkColor;
  final Color selfFill;
  final Color peerFill;
  final Color labelColor;
  final Color mutedLabel;

  @override
  void paint(Canvas canvas, Size size) {
    final positions = _layoutNodes(size, nodes);
    final self = nodes.firstWhere((n) => n.isSelf);
    final selfPos = positions[self.id]!;

    final linkPaint = Paint()
      ..color = linkColor.withValues(alpha: 0.55)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final faintLink = Paint()
      ..color = linkColor.withValues(alpha: 0.18)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (final n in nodes) {
      if (n.isSelf) continue;
      final p = positions[n.id];
      if (p == null) continue;
      canvas.drawLine(selfPos, p, n.linked ? linkPaint : faintLink);
    }

    for (final n in nodes) {
      final p = positions[n.id];
      if (p == null) continue;
      if (n.isSelf) {
        canvas.drawCircle(
          p,
          14,
          Paint()..color = selfFill.withValues(alpha: 0.25),
        );
        canvas.drawCircle(
          p,
          11,
          Paint()
            ..color = selfFill.withValues(alpha: 0.9)
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2,
        );
        canvas.drawCircle(p, 6.5, Paint()..color = selfFill);
      } else {
        final fill = n.nearby ? peerFill : peerFill.withValues(alpha: 0.45);
        canvas.drawCircle(p, n.linked ? 5.5 : 4.5, Paint()..color = fill);
        if (n.linked) {
          canvas.drawCircle(
            p,
            9,
            Paint()
              ..color = accent.withValues(alpha: 0.35)
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.2,
          );
        }
      }

      final tp = TextPainter(
        text: TextSpan(
          text: n.label,
          style: TextStyle(
            color: n.isSelf ? selfFill : (n.nearby ? labelColor : mutedLabel),
            fontSize: 12,
            fontWeight: n.isSelf ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
        ellipsis: '…',
      )..layout(maxWidth: 120);
      tp.paint(canvas, Offset(p.dx - tp.width / 2, p.dy + 14));
    }
  }

  @override
  bool shouldRepaint(covariant _MeshTopologyPainter oldDelegate) {
    return oldDelegate.nodes != nodes ||
        oldDelegate.dark != dark ||
        oldDelegate.linkColor != linkColor;
  }
}

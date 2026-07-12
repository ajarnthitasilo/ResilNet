import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../models/peer.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'chat_screen.dart';

/// รายการสมาชิกในเครือข่าย (จาก SQLite peers)
class PeerListScreen extends StatefulWidget {
  const PeerListScreen({super.key});

  @override
  State<PeerListScreen> createState() => _PeerListScreenState();
}

class _PeerListScreenState extends State<PeerListScreen> {
  static const _activeWindowMs = 15000;

  Future<void> _refresh() async {
    if (mounted) setState(() {});
  }

  String _connectionLabel(Peer peer, Set<String> nearbyIds) {
    if (peer.isBlocked) return 'บล็อกแล้ว';
    if (nearbyIds.contains(peer.id)) return 'ใกล้เคียง (BLE)';
    final age = DateTime.now().millisecondsSinceEpoch - peer.lastSeen;
    if (age <= _activeWindowMs) return 'ออนไลน์ล่าสุด';
    if (age < 5 * 60 * 1000)
      return 'เห็นเมื่อ ${(age / 60000).ceil()} นาทีที่แล้ว';
    return 'ออฟไลน์';
  }

  Color _connectionColor(String label) {
    if (label.contains('บล็อก')) return Colors.redAccent;
    if (label.contains('ใกล้เคียง') || label.contains('ออนไลน์'))
      return ResilNetTheme.emerald;
    return Colors.white54;
  }

  Future<void> _toggleBlock(AppState s, Peer peer) async {
    final next = !peer.isBlocked;
    await s.db.setPeerBlocked(peer.id, next);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(next ? 'บล็อก ${peer.id} แล้ว' : 'ปลดบล็อกแล้ว')),
    );
    await _refresh();
  }

  Future<void> _openChat(String peerId) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(peerId: peerId)));
    await _refresh();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('สมาชิกเครือข่าย'),
        actions: [
          IconButton(
            tooltip: 'รีเฟรช',
            onPressed: _refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Peer>>(
        future: s.db.getAllPeers(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final peers = snap.data ?? const <Peer>[];
          if (peers.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  'ยังไม่มีสมาชิกในฐานข้อมูล\nสแกน QR หรือรอค้นพบผ่าน BLE Mesh',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ),
            );
          }

          final nearbyIds = s.isReady
              ? s.mesh.nearbyPeers.map((p) => p.id).toSet()
              : <String>{};

          return ListView.separated(
            padding: const EdgeInsets.all(14),
            itemCount: peers.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final peer = peers[i];
              final conn = _connectionLabel(peer, nearbyIds);
              return Card(
                child: ListTile(
                  leading: Identicon(id: peer.id),
                  title: FutureBuilder<String>(
                    future: s.db.resolveDisplayName(peer.id),
                    builder: (context, nameSnap) {
                      final name = nameSnap.data ?? peer.id;
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (s.trustedKeys.isTrustedIssuer(peer.id))
                            const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(
                                Icons.verified,
                                color: Colors.greenAccent,
                                size: 18,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        conn,
                        style: TextStyle(
                          color: _connectionColor(conn),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        peer.id,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.white54,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (action) async {
                      switch (action) {
                        case 'chat':
                          await _openChat(peer.id);
                        case 'block':
                          await _toggleBlock(s, peer);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'chat',
                        child: Text('เปิดแชต'),
                      ),
                      PopupMenuItem(
                        value: 'block',
                        child: Text(peer.isBlocked ? 'ปลดบล็อก' : 'บล็อก'),
                      ),
                    ],
                  ),
                  onTap: () => _openChat(peer.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

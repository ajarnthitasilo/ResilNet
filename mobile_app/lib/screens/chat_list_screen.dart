import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chat_message.dart';
import '../state/app_state.dart';
import '../widgets/mesh_status_bar.dart';
import 'broadcast_screen.dart';
import 'chat_screen.dart';
import 'identity_screen.dart';
import 'peer_list_screen.dart';
import 'settings_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _peerController = TextEditingController();

  Future<void> _setAlias(BuildContext context, String peerId) async {
    final s = context.read<AppState>();
    final existing = await s.db.getContactAlias(peerId) ?? '';
    final controller = TextEditingController(text: existing);

    if (!context.mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('ตั้งชื่อเล่น (Contact Alias)'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Alias นี้เก็บในเครื่องเท่านั้น (Local-only)\nไม่ถูกส่งออกไปกับระบบ E2EE',
                style: Theme.of(ctx).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'ชื่อเล่น',
                  hintText: 'เช่น “ผู้ใหญ่บ้าน”, “พี่สมชาย”…',
                ),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: const Text('ยกเลิก'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('บันทึก'),
            ),
          ],
        );
      },
    );
    if (ok != true) return;
    await s.db.setContactAlias(
      publicKeyHash: peerId,
      aliasName: controller.text,
    );
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _peerController.dispose();
    super.dispose();
  }

  Future<void> _openPeer(BuildContext context, String peerId) async {
    if (!mounted) return;
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => ChatScreen(peerId: peerId)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('สื่อสารชุมชนบ้านปู่คำ'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'แชต'),
              Tab(text: 'ประกาศ'),
            ],
          ),
          actions: [
            PopupMenuButton<String>(
              tooltip: 'การตั้งค่าแจ้งเตือน',
              icon: Icon(
                s.notificationsEnabled
                    ? Icons.notifications_active_outlined
                    : Icons.notifications_off_outlined,
              ),
              itemBuilder: (context) => [
                CheckedPopupMenuItem(
                  value: 'enabled',
                  checked: s.notificationsEnabled,
                  child: const Text('เปิดแจ้งเตือนประกาศ'),
                ),
              ],
              onSelected: (v) {
                if (v == 'enabled') {
                  s.setNotificationsEnabled(!s.notificationsEnabled);
                }
              },
            ),
            IconButton(
              tooltip: 'สมาชิกเครือข่าย',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const PeerListScreen())),
              icon: const Icon(Icons.groups_outlined),
            ),
            IconButton(
              tooltip: 'การตั้งค่า',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const SettingsScreen())),
              icon: const Icon(Icons.settings_outlined),
            ),
            IconButton(
              tooltip: 'ตัวตน/QR',
              onPressed: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => const IdentityScreen())),
              icon: const Icon(Icons.badge_outlined),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                const MeshStatusBar(),
                _VillageAnnouncementsBanner(appState: s),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _peerController,
                          decoration: const InputDecoration(
                            hintText:
                                'วาง Receiver ID (Public Key Hash) เพื่อเริ่มแชต',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      FilledButton(
                        onPressed: () {
                          final peer = _peerController.text.trim();
                          if (peer.isEmpty) return;
                          _openPeer(context, peer);
                        },
                        child: const Text('เริ่ม'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<String>>(
                    future: s.db.getChatPeersFor(s.myUserId),
                    builder: (context, snap) {
                      final peers = snap.data ?? const [];
                      if (peers.isEmpty) {
                        return Center(
                          child: Text(
                            'ยังไม่มีบทสนทนา\nไปที่ “ตัวตน/QR” เพื่อแชร์/สแกน Public Key',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.7),
                                  height: 1.4,
                                ),
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
                        itemCount: peers.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (context, i) {
                          final peerId = peers[i];
                          return Card(
                            child: ListTile(
                              title: FutureBuilder<String>(
                                future: s.db.resolveDisplayName(peerId),
                                builder: (context, nameSnap) {
                                  final name = nameSnap.data ?? peerId;
                                  return Text(
                                    name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  );
                                },
                              ),
                              subtitle: const Text('แตะเพื่อเปิดแชต'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () => _openPeer(context, peerId),
                              onLongPress: () => _setAlias(context, peerId),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            const BroadcastScreen(),
          ],
        ),
      ),
    );
  }
}

/// ส่วนประกาศข่าวสารหมู่บ้าน — แสดงประกาศฉุกเฉินและ mesh notices ล่าสุด
class _VillageAnnouncementsBanner extends StatelessWidget {
  const _VillageAnnouncementsBanner({required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ChatMessage>>(
      future: appState.db.getBroadcastFeed(
        trustedSenderIds: appState.trustedKeys.trustedIds,
      ),
      builder: (context, snap) {
        final raw = snap.data ?? const <ChatMessage>[];
        return FutureBuilder<List<ChatMessage>>(
          future: appState.broadcastFilter.filterDisplayable(raw),
          builder: (context, filteredSnap) {
            final items = (filteredSnap.data ?? const <ChatMessage>[]).take(3).toList();
            return Card(
              margin: const EdgeInsets.fromLTRB(14, 10, 14, 0),
              color: const Color(0xFF1E3A2F),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.campaign_outlined, color: Color(0xFF10B981)),
                        const SizedBox(width: 8),
                        Text(
                          'ประกาศข่าวสารหมู่บ้าน',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: const Color(0xFF10B981),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (items.isEmpty)
                      Text(
                        'ยังไม่มีประกาศ — ดูแท็บ “ประกาศ” เพื่อส่งหรือรับข่าวชุมชน',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      )
                    else
                      ...items.map((m) {
                        final preview = m.content?.trim();
                        final text = preview != null && preview.isNotEmpty
                            ? preview
                            : (m.alertLat != null ? '⚠️ แจ้งเตือนฉุกเฉิน' : 'ประกาศหมู่บ้าน');
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            '• $text',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

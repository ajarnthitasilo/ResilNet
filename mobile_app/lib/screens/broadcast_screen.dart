import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/broadcast_alert.dart';
import '../models/chat_message.dart';
import '../models/peer.dart';
import 'broadcast_compose_sheet.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';

class BroadcastScreen extends StatefulWidget {
  const BroadcastScreen({super.key});

  @override
  State<BroadcastScreen> createState() => _BroadcastScreenState();
}

class _BroadcastScreenState extends State<BroadcastScreen> {
  final _uuid = const Uuid();

  Future<List<ChatMessage>> _loadFeed(AppState s) async {
    final raw = await s.db.getBroadcastFeed(
      trustedSenderIds: s.trustedKeys.trustedIds,
    );
    return s.broadcastFilter.filterDisplayable(raw);
  }

  Future<void> _setAliasFor(String publicKeyHash) async {
    final s = context.read<AppState>();
    final existing = await s.db.getContactAlias(publicKeyHash) ?? '';
    final controller = TextEditingController(text: existing);

    if (!mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('ตั้งชื่อเล่นผู้ส่ง'),
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
                decoration: const InputDecoration(labelText: 'ชื่อเล่น'),
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
      publicKeyHash: publicKeyHash,
      aliasName: controller.text,
    );
    if (mounted) setState(() {});
  }

  Future<void> _composeAndSend() async {
    final s = context.read<AppState>();
    if (!s.canSendBroadcast) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'เฉพาะคณะกรรมการหมู่บ้าน (Trusted Issuer) เท่านั้นที่ส่งประกาศได้',
          ),
        ),
      );
      return;
    }

    final result = await showModalBottomSheet<BroadcastComposeResult>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const BroadcastComposeSheet(),
    );
    if (result == null) return;

    final ts = DateTime.now().millisecondsSinceEpoch;
    if (await s.db.isBroadcastRateLimited(s.myUserId, ts)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ส่งประกาศถี่เกินไป: จำกัด 1 ข้อความต่อ 2 นาที'),
        ),
      );
      return;
    }

    final envelope = BroadcastAlertEnvelope(
      v: BroadcastAlertEnvelope.currentVersion,
      senderId: s.myUserId,
      senderName: s.displayName,
      payload: result.text,
      location: result.location,
      timestamp: ts,
    );
    final signed = s.crypto.signBroadcastAlert(envelope: envelope);

    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: s.myUserId,
      senderName: s.displayName,
      receiverId: ResilNetIds.broadcastReceiverId,
      content: result.text,
      encryptedPayload: signed.payload,
      encryptedKey: '',
      signature: signed.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.broadcast,
      alertLat: result.location.lat,
      alertLon: result.location.lon,
      alertRadiusM: result.location.radius,
    );

    await s.db.saveMessage(msg);
    // Broadcast also fans out via Nostr when internet is available (routeOutbound).
    if (!mounted) return;
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('ส่งเตือนภัยแล้ว (Internet + Mesh)')),
    );
  }

  Future<_BroadcastView> _decorate(AppState s, ChatMessage m) async {
    final peer = await s.db.getPeer(m.senderId);
    final issuer = s.trustedKeys.issuerFor(m.senderId);
    final verified = issuer != null;
    final name = issuer?.name ?? peer?.displayName;
    final publicPem = issuer?.publicKeyPem ?? peer?.publicKey;

    var text = '[อ่านไม่ได้]';
    AlertLocation? location;

    if (m.signature != null && publicPem != null && publicPem.isNotEmpty) {
      final envelope = s.crypto.verifyAndDecodeBroadcastAlert(
        senderPublicPem: publicPem,
        senderId: m.senderId,
        timestamp: m.timestamp,
        payload: m.encryptedPayload,
        signature: m.signature!,
      );
      if (envelope != null) {
        text = envelope.payload;
        location = envelope.location;
      } else {
        text = '[ลายเซ็นไม่ถูกต้อง]';
      }
    } else if (m.content != null && m.content!.isNotEmpty) {
      text = m.content!;
      if (m.alertLat != null && m.alertLon != null && m.alertRadiusM != null) {
        location = AlertLocation(
          lat: m.alertLat!,
          lon: m.alertLon!,
          radius: m.alertRadiusM!,
        );
      }
    }

    return _BroadcastView(
      text: text,
      senderName: name,
      verified: verified,
      peer: peer,
      location: location,
    );
  }

  String _locationLabel(AlertLocation loc) {
    if (loc.radius == double.infinity) return '';
    return 'พื้นที่ ${loc.radius.round()} m · ${loc.lat.toStringAsFixed(4)}, ${loc.lon.toStringAsFixed(4)}';
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('ประกาศหมู่บ้าน'),
        actions: [
          if (s.canSendBroadcast)
            IconButton(
              tooltip: 'ส่งเตือนภัยฉุกเฉิน',
              onPressed: _composeAndSend,
              icon: const Icon(Icons.campaign_outlined),
            ),
        ],
      ),
      body: FutureBuilder<List<ChatMessage>>(
        future: _loadFeed(s),
        builder: (context, snap) {
          var items = snap.data ?? const [];
          items = [...items]
            ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
          if (items.isEmpty) {
            return Center(
              child: Text(
                s.canSendBroadcast
                    ? 'ยังไม่มีประกาศในพื้นที่ของคุณ\nแตะไอคอนลำโพงเพื่อส่งเตือนภัย'
                    : 'ยังไม่มีประกาศในพื้นที่ของคุณ\nรอรับประกาศจากคณะกรรมการหมู่บ้าน',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(14),
            itemCount: items.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, i) {
              final m = items[i];
              return FutureBuilder<_BroadcastView>(
                future: _decorate(s, m),
                builder: (context, ds) {
                  final d = ds.data;
                  final senderLabelFuture = s.db.resolveDisplayName(m.senderId);
                  const tag = '[เตือนภัย ✓]';
                  const tagColor = Colors.greenAccent;
                  final locLabel = d?.location != null
                      ? _locationLabel(d!.location!)
                      : '';
                  return Card(
                    child: ListTile(
                      leading: Identicon(id: m.senderId),
                      title: FutureBuilder<String>(
                        future: senderLabelFuture,
                        builder: (context, nameSnap) {
                          final senderLabel = nameSnap.data ?? m.senderId;
                          return Text(
                            '$tag $senderLabel',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(color: tagColor),
                          );
                        },
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (locLabel.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                locLabel,
                                style: Theme.of(context).textTheme.labelSmall
                                    ?.copyWith(
                                      color: Colors.orangeAccent.withValues(
                                        alpha: 0.9,
                                      ),
                                    ),
                              ),
                            ),
                          Text(
                            d?.text ?? '…',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        tooltip: 'บล็อกผู้ส่งนี้',
                        onPressed: () async {
                          await s.db.setPeerBlocked(m.senderId, true);
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('บล็อกผู้ส่งแล้ว')),
                          );
                          setState(() {});
                        },
                        icon: const Icon(Icons.block),
                      ),
                      onLongPress: () => _setAliasFor(m.senderId),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _BroadcastView {
  _BroadcastView({
    required this.text,
    required this.senderName,
    required this.verified,
    required this.peer,
    this.location,
  });

  final String text;
  final String? senderName;
  final bool verified;
  final Peer? peer;
  final AlertLocation? location;
}

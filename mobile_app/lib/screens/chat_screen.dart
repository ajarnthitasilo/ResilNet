import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../app/theme.dart';
import '../core/payload_kinds.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../services/audio_recorder_service.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'qr_scanner_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.peerId});

  final String peerId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _text = TextEditingController();
  final _peerPublicPem = TextEditingController();
  final _focusNode = FocusNode();
  final _uuid = const Uuid();
  final _audio = AudioRecorderService();
  bool _showEmojiPicker = false;
  bool _recordingVoice = false;

  static const _pickerBg = Color(0xFF1A2332);
  static const _pickerAccent = Color(0xFF10B981);

  void _toggleEmojiPicker() {
    setState(() => _showEmojiPicker = !_showEmojiPicker);
    if (_showEmojiPicker) {
      _focusNode.unfocus();
    } else {
      _focusNode.requestFocus();
    }
  }

  Config get _emojiPickerConfig => Config(
    height: 256,
    checkPlatformCompatibility: true,
    emojiViewConfig: const EmojiViewConfig(
      backgroundColor: _pickerBg,
      emojiSizeMax: 28,
    ),
    categoryViewConfig: const CategoryViewConfig(
      backgroundColor: _pickerBg,
      indicatorColor: _pickerAccent,
      iconColor: Colors.white54,
      iconColorSelected: _pickerAccent,
      backspaceColor: _pickerAccent,
    ),
    bottomActionBarConfig: const BottomActionBarConfig(
      backgroundColor: _pickerBg,
      buttonColor: _pickerAccent,
      buttonIconColor: Colors.white,
    ),
    searchViewConfig: const SearchViewConfig(
      backgroundColor: _pickerBg,
      buttonIconColor: Colors.white54,
    ),
  );

  Future<void> _setAlias() async {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final existing = await s.db.getContactAlias(widget.peerId) ?? '';
    final controller = TextEditingController(text: existing);

    if (!mounted) return;
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(l10n.aliasTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.aliasHintBody,
                style: Theme.of(ctx).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: l10n.aliasLabel),
                autofocus: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.cancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: Text(l10n.save),
            ),
          ],
        );
      },
    );
    if (ok != true) return;
    await s.db.setContactAlias(
      publicKeyHash: widget.peerId,
      aliasName: controller.text,
    );
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      unawaited(context.read<AppState>().markConversationRead(widget.peerId));
    });
  }

  @override
  void dispose() {
    _text.dispose();
    _peerPublicPem.dispose();
    _focusNode.dispose();
    _audio.dispose();
    super.dispose();
  }

  Future<String?> _resolveReceiverPub(AppState s) async {
    var receiverPub = _peerPublicPem.text.trim();
    if (receiverPub.isEmpty) {
      final peer = await s.db.getPeer(widget.peerId);
      receiverPub = peer?.publicKey.trim() ?? '';
      if (receiverPub.isNotEmpty) _peerPublicPem.text = receiverPub;
    }
    if (receiverPub.isEmpty) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatNeedPeerKey)),
      );
      return null;
    }
    return receiverPub;
  }

  Future<void> _startVoiceNote() async {
    if (_recordingVoice) return;
    try {
      await _audio.startRecording();
      if (mounted) setState(() => _recordingVoice = true);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatVoiceFailed('$e'))),
      );
    }
  }

  Future<void> _stopAndSendVoiceNote() async {
    if (!_recordingVoice) return;
    final s = context.read<AppState>();
    if (!s.e2eeEnabled) {
      await _audio.stopRecording();
      if (mounted) setState(() => _recordingVoice = false);
      return;
    }
    final receiverPub = await _resolveReceiverPub(s);
    final opus = await _audio.stopRecording();
    if (mounted) setState(() => _recordingVoice = false);
    if (receiverPub == null || opus == null || opus.isEmpty) return;

    final ts = DateTime.now().millisecondsSinceEpoch;
    final audioB64 = base64Encode(opus);
    final pkg = s.crypto.encryptForRecipient(
      plaintext: audioB64,
      receiverPublicPem: receiverPub,
      senderId: s.myUserId,
      receiverId: widget.peerId,
      timestamp: ts,
    );

    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: s.myUserId,
      receiverId: widget.peerId,
      // Opaque label only — never store audio plaintext or decryptable body.
      content: null,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: 'audio',
    );

    await s.persistChatMessage(msg);
    await s.routeOutbound(msg);
    if (mounted) setState(() {});
  }

  Future<void> _send() async {
    final s = context.read<AppState>();
    final l10n = context.l10n;
    final msgText = _text.text.trim();
    if (msgText.isEmpty) return;

    final slash = await SlashCommands.tryHandle(
      raw: msgText,
      state: s,
      l10n: l10n,
      channel: FeedChannel.directs,
    );
    if (slash.handled) {
      _text.clear();
      if (_showEmojiPicker) setState(() => _showEmojiPicker = false);
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
        SnackBar(content: Text(context.l10n.settingsE2eeSubtitle)),
      );
      return;
    }

    final receiverId = widget.peerId;
    final receiverPub = await _resolveReceiverPub(s);
    if (receiverPub == null) return;

    final ts = DateTime.now().millisecondsSinceEpoch;
    final pkg = s.crypto.encryptForRecipient(
      plaintext: msgText,
      receiverPublicPem: receiverPub,
      senderId: s.myUserId,
      receiverId: receiverId,
      timestamp: ts,
    );

    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: s.myUserId,
      receiverId: receiverId,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
    );

    await s.persistChatMessage(msg);
    await s.routeOutbound(msg);
    _text.clear();
    if (_showEmojiPicker) setState(() => _showEmojiPicker = false);
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _sendImage() async {
    final s = context.read<AppState>();
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeSubtitle)),
      );
      return;
    }
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1280,
      imageQuality: 72,
    );
    if (file == null) return;
    final bytes = await file.readAsBytes();
    if (bytes.length > 180 * 1024) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image too large (max ~180KB)')),
      );
      return;
    }
    final receiverPub = await _resolveReceiverPub(s);
    if (receiverPub == null) return;
    final ts = DateTime.now().millisecondsSinceEpoch;
    final b64 = base64Encode(bytes);
    final pkg = s.crypto.encryptForRecipient(
      plaintext: b64,
      receiverPublicPem: receiverPub,
      senderId: s.myUserId,
      receiverId: widget.peerId,
      timestamp: ts,
    );
    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: s.myUserId,
      receiverId: widget.peerId,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.image,
    );
    await s.persistChatMessage(msg);
    await s.routeOutbound(msg);
    if (mounted) setState(() {});
  }

  String _statusLabel(AppLocalizations l10n, MessageStatus s) {
    return switch (s) {
      MessageStatus.pending => l10n.statusPending,
      MessageStatus.sent => l10n.statusSent,
      MessageStatus.relayed => l10n.statusRelayed,
      MessageStatus.delivered => l10n.statusDelivered,
      MessageStatus.read => l10n.statusRead,
    };
  }

  Widget _statusTicks(MessageStatus s) {
    final gray = Colors.white.withValues(alpha: 0.55);
    const blue = Color(0xFF53BDEB);

    Widget singleTick(Color color) =>
        Icon(Icons.done, size: 14, color: color);

    Widget doubleTick(Color color) => SizedBox(
          width: 22,
          height: 14,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(left: 0, child: singleTick(color)),
              Positioned(left: 8, child: singleTick(color)),
            ],
          ),
        );

    return switch (s) {
      MessageStatus.pending => Icon(Icons.schedule, size: 14, color: gray),
      MessageStatus.sent || MessageStatus.relayed => singleTick(gray),
      MessageStatus.delivered => doubleTick(gray),
      MessageStatus.read => doubleTick(blue),
    };
  }

  String _tryDecrypt(AppState s, AppLocalizations l10n, ChatMessage m) {
    // Zero-knowledge: only the intended recipient's private key can unwrap AES.
    if (m.receiverId != s.myUserId && m.senderId != s.myUserId) {
      return '…';
    }
    if (m.payloadKind == 'audio') {
      return m.senderId == s.myUserId
          ? l10n.chatVoiceLabelSent
          : l10n.chatVoiceLabel;
    }
    if (m.payloadKind == PayloadKinds.image) {
      return l10n.chatImageLabel;
    }
    if (PayloadKinds.isSystemLine(m.payloadKind)) {
      return l10n.screenshotTaken;
    }
    if (m.receiverId == s.myUserId) {
      try {
        return s.crypto.decryptFromSender(
          encryptedPayload: m.encryptedPayload,
          encryptedKey: m.encryptedKey,
        );
      } catch (_) {
        return l10n.chatDecryptFailed;
      }
    }
    try {
      final decoded = utf8.decode(base64Decode(m.encryptedPayload));
      final obj = jsonDecode(decoded) as Map<String, dynamic>;
      final ct = (obj['ct'] as String?) ?? '';
      final preview = ct.length > 16 ? '${ct.substring(0, 16)}…' : ct;
      return l10n.chatSentSealed(preview);
    } catch (_) {
      return l10n.chatSentSealedShort;
    }
  }

  Future<void> _playVoiceNote(AppState s, ChatMessage m) async {
    try {
      final audioB64 = s.crypto.decryptFromSender(
        encryptedPayload: m.encryptedPayload,
        encryptedKey: m.encryptedKey,
      );
      final bytes = base64Decode(audioB64);
      await _audio.playBytes(Uint8List.fromList(bytes));
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatPlayVoiceFailed('$e'))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = context.watch<AppState>();
    final l10n = context.l10n;
    final myId = s.myUserId;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(l10n.chatTitle),
        actions: [
          IconButton(
            tooltip: l10n.chatScanTooltip,
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const QrScannerScreen()),
              );
              if (!context.mounted) return;
              final peer = await context.read<AppState>().db.getPeer(
                widget.peerId,
              );
              if (!context.mounted) return;
              if (peer?.publicKey.isNotEmpty == true) {
                _peerPublicPem.text = peer!.publicKey;
                setState(() {});
              }
            },
            icon: const Icon(Icons.qr_code_scanner),
          ),
          IconButton(
            tooltip: l10n.chatBlockTooltip,
            onPressed: () async {
              await context.read<AppState>().db.setPeerBlocked(
                widget.peerId,
                true,
              );
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(context.l10n.chatBlockedSnack)),
              );
            },
            icon: const Icon(Icons.block),
          ),
          IconButton(
            tooltip: l10n.chatAliasTooltip,
            onPressed: _setAlias,
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(52),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
            child: Row(
              children: [
                Identicon(id: widget.peerId, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: FutureBuilder<String>(
                    future: s.db.resolveDisplayName(widget.peerId),
                    builder: (context, nameSnap) {
                      final name = nameSnap.data ?? widget.peerId;
                      return Text(
                        'Peer: $name',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Me: ${myId.substring(0, 10)}…',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: ResilNetTheme.scaffoldGradient),
        child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: TextField(
              controller: _peerPublicPem,
              minLines: 2,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: l10n.chatReceiverPemLabel,
                hintText: l10n.chatReceiverPemHint,
              ),
            ),
          ),
          Expanded(
            child: ListenableBuilder(
              listenable: s,
              builder: (context, _) {
                return FutureBuilder<List<ChatMessage>>(
                  future: s.messagesForConversation(myId, widget.peerId),
                  builder: (context, snap) {
                    final items = snap.data ?? const [];
                if (items.isEmpty) {
                  return Center(
                    child: Text(
                      l10n.chatEmptyThread,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                        height: 1.4,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
                  itemCount: items.length,
                  itemBuilder: (context, i) {
                    final m = items[i];
                    final isMe = m.senderId == myId;
                    final text = _tryDecrypt(s, l10n, m);
                    return Align(
                      alignment: isMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 340),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (m.payloadKind == PayloadKinds.areaPublic) ...[
                                  Text(
                                    l10n.areaPublicBadge,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: Colors.tealAccent
                                              .withValues(alpha: 0.9),
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                ],
                                Text(
                                  text,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                if (m.payloadKind == 'audio') ...[
                                  const SizedBox(height: 8),
                                  FilledButton.tonalIcon(
                                    onPressed: () => _playVoiceNote(s, m),
                                    icon: const Icon(Icons.play_arrow),
                                    label: Text(l10n.chatPlayVoice),
                                  ),
                                ],
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isMe) ...[
                                      _statusTicks(m.status),
                                      const SizedBox(width: 6),
                                    ],
                                    Text(
                                      _statusLabel(l10n, m.status),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: Colors.white.withValues(
                                              alpha: 0.65,
                                            ),
                                          ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'TTL ${m.ttl}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: Colors.white.withValues(
                                              alpha: 0.45,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
                  },
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                  child: Row(
                    children: [
                      Tooltip(
                        message: _recordingVoice
                            ? l10n.voicePttRelease
                            : l10n.voicePttHold,
                        child: GestureDetector(
                          onLongPressStart: (_) {
                            if (!_recordingVoice) unawaited(_startVoiceNote());
                          },
                          onLongPressEnd: (_) {
                            if (_recordingVoice) {
                              unawaited(_stopAndSendVoiceNote());
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              _recordingVoice ? Icons.mic : Icons.mic_none_outlined,
                              color: _recordingVoice ? Colors.redAccent : null,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.chatAttachImage,
                        onPressed: _sendImage,
                        icon: const Icon(Icons.image_outlined),
                      ),
                      IconButton(
                        tooltip: l10n.chatEmojiTooltip,
                        onPressed: _toggleEmojiPicker,
                        icon: Icon(
                          _showEmojiPicker
                              ? Icons.keyboard_outlined
                              : Icons.emoji_emotions_outlined,
                          color: _showEmojiPicker ? _pickerAccent : null,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _text,
                          focusNode: _focusNode,
                          minLines: 1,
                          maxLines: 4,
                          onTap: () {
                            if (_showEmojiPicker) {
                              setState(() => _showEmojiPicker = false);
                            }
                          },
                          decoration: InputDecoration(
                            hintText: l10n.chatComposeHint,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton.filled(
                        onPressed: _send,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withValues(alpha: 0.12),
                        ),
                        icon: const Icon(Icons.arrow_upward, size: 20),
                      ),
                    ],
                  ),
                ),
                if (_showEmojiPicker)
                  EmojiPicker(
                    textEditingController: _text,
                    config: _emojiPickerConfig,
                  ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}

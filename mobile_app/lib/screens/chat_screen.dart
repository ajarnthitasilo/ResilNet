import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../app/theme.dart';
import '../core/notice_wire.dart';
import '../core/payload_kinds.dart';
import '../core/voice_payload.dart';
import '../core/peer_id.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../services/audio_recorder_service.dart';
import '../services/crypto_service.dart';
import '../services/mic_permission.dart';
import '../services/resilnet_packet_codec.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'qr_scanner_screen.dart';
import 'voice_record_sheet.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.peerId});

  final String peerId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _text = TextEditingController();
  final _focusNode = FocusNode();
  final _uuid = const Uuid();
  final _audio = AudioRecorderService();
  bool _showEmojiPicker = false;
  bool _sendingOutbound = false;
  String? _lastSendFingerprint;
  int _lastSendAtMs = 0;

  List<ChatMessage> _messages = const [];
  final Map<String, String> _plainById = {};
  bool _loading = true;
  String? _loadError;
  int _boundEpoch = -1;
  bool _reloadQueued = false;
  AppState? _appState;

  static const _pickerBg = Color(0xFF1A2332);
  static const _pickerAccent = Color(0xFF10B981);
  static const _sendDupWindowMs = 2200;

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
      final s = context.read<AppState>();
      _appState = s;
      s.addListener(_onAppState);
      unawaited(s.markConversationRead(widget.peerId));
      unawaited(_reloadMessages(force: true));
    });
  }

  @override
  void dispose() {
    _appState?.removeListener(_onAppState);
    _text.dispose();
    _focusNode.dispose();
    _audio.dispose();
    super.dispose();
  }

  void _onAppState() {
    if (!mounted) return;
    final epoch = context.read<AppState>().chatDataEpoch;
    if (epoch == _boundEpoch) return;
    unawaited(_reloadMessages());
  }

  Future<void> _reloadMessages({bool force = false}) async {
    if (_reloadQueued && !force) return;
    _reloadQueued = true;
    try {
      final s = context.read<AppState>();
      final epoch = s.chatDataEpoch;
      if (!force && epoch == _boundEpoch) return;
      final l10n = context.l10n;
      final items = await s.messagesForConversation(s.myUserId, widget.peerId);
      if (!mounted) return;
      final plains = <String, String>{};
      for (final m in items) {
        plains[m.id] = _tryDecrypt(s, l10n, m);
      }
      setState(() {
        _messages = items;
        _plainById
          ..clear()
          ..addAll(plains);
        _boundEpoch = epoch;
        _loading = false;
        _loadError = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _loadError = '$e';
      });
    } finally {
      _reloadQueued = false;
    }
  }

  Future<String?> _resolveReceiverPub(AppState s) async {
    final peer = await s.resolveMessageablePeer(widget.peerId);
    final receiverPub = peer?.publicKey.trim() ?? '';
    if (receiverPub.isEmpty) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatNeedPeerKey)),
      );
      return null;
    }
    final bound = CryptoService.publicKeyHash(
      CryptoService.normalizePublicKey(receiverPub),
    );
    if (bound != widget.peerId) {
      if (!mounted) return null;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatPeerKeyMismatch)),
      );
      return null;
    }
    return CryptoService.normalizePublicKey(receiverPub);
  }

  Future<void> _openVoiceRecorder() async {
    if (_sendingOutbound) return;
    final s = context.read<AppState>();
    if (!s.e2eeEnabled) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.settingsE2eeTitle)),
      );
      return;
    }

    debugPrint('[PTT] mic-tap peer=${widget.peerId}');
    HapticFeedback.lightImpact();
    try {
      final result = await showVoiceRecordSheet(context);
      if (!mounted || result == null) return;
      await _sendVoiceBytes(result.bytes, ext: result.ext);
    } catch (e) {
      debugPrint('[PTT] voice session failed: $e');
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

  Future<void> _sendVoiceBytes(Uint8List bytes, {String ext = 'm4a'}) async {
    if (bytes.isEmpty || _sendingOutbound) return;
    final s = context.read<AppState>();
    if (!s.e2eeEnabled) return;

    setState(() => _sendingOutbound = true);
    final receiverPub = await _resolveReceiverPub(s);
    if (receiverPub == null) {
      if (mounted) setState(() => _sendingOutbound = false);
      return;
    }

    final resolvedExt = ext.trim().isEmpty ? 'm4a' : ext.trim().toLowerCase();
    debugPrint('[PTT] send voice bytes=${bytes.length} ext=$resolvedExt');

    // Soft cap before encryption (BLE ~51KB ciphertext after wire expansion).
    if (bytes.length > AudioRecorderService.maxBytes) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceTooLarge)),
        );
        setState(() => _sendingOutbound = false);
      }
      return;
    }

    final ts = DateTime.now().millisecondsSinceEpoch;
    final wirePlain = VoicePayload.encodeWire(bytes: bytes, ext: resolvedExt);
    final pkg = s.crypto.encryptForRecipient(
      plaintext: wirePlain,
      receiverPublicPem: receiverPub,
      senderId: s.myUserId,
      receiverId: widget.peerId,
      timestamp: ts,
    );

    final msg = ChatMessage(
      id: _uuid.v4(),
      senderId: s.myUserId,
      receiverId: widget.peerId,
      // Local-only playback cache (stripped on wire by ResilNetPacketCodec).
      content: wirePlain,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
      payloadKind: PayloadKinds.audio,
    );

    // Estimate sealed wire size; prefer Nostr when envelope is BLE-hostile.
    final dtoLen = ResilNetPacketCodec.toDto(msg).payload.length;
    const bleSafeCiphertext = 48000;
    final tooBigForBle = dtoLen > bleSafeCiphertext;
    final nostrUp = s.isNostrOnline || s.isCloudOnline;
    if (tooBigForBle && !nostrUp) {
      debugPrint('[PTT] voice too large for BLE dto=$dtoLen nostr=off');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceNeedInternet)),
        );
        setState(() => _sendingOutbound = false);
      }
      return;
    }

    try {
      await s.persistChatMessage(msg);
      // Small notes: mesh+Nostr. Oversized: Nostr-only (same as announcements media).
      await s.routeOutbound(msg, internetOnly: tooBigForBle);
      debugPrint(
        '[PTT] send voice routed bytes=${bytes.length} dto=$dtoLen '
        'internetOnly=$tooBigForBle',
      );
      if (mounted && tooBigForBle) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceSentInternet)),
        );
      }
    } catch (e) {
      debugPrint('[PTT] send voice failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceFailed('$e'))),
        );
      }
      rethrow;
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
    }
  }

  bool get _composeLocked => _sendingOutbound;

  Future<void> _send() async {
    if (_sendingOutbound) return;
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
    if (!mounted) return;

    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.settingsE2eeSubtitle)),
      );
      return;
    }

    final receiverId = widget.peerId;
    if (_shouldSuppressDuplicate(
      kind: 'text',
      body: msgText,
      receiverId: receiverId,
    )) {
      return;
    }
    setState(() => _sendingOutbound = true);
    final receiverPub = await _resolveReceiverPub(s);
    if (receiverPub == null) {
      if (mounted) setState(() => _sendingOutbound = false);
      return;
    }

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
      // Local-only plaintext preview (stripped before wire in ResilNetPacketCodec).
      content: msgText,
      encryptedPayload: pkg.encryptedPayload,
      encryptedKey: pkg.encryptedKey,
      signature: pkg.signature,
      ttl: 5,
      timestamp: ts,
      status: MessageStatus.pending,
      type: MessageType.direct,
    );

    // Optimistic local UX: lock compose immediately so accidental double-tap
    // won't duplicate while routeOutbound is still in-flight.
    _text.clear();
    if (_showEmojiPicker) {
      setState(() => _showEmojiPicker = false);
    }
    try {
      await s.persistChatMessage(msg);
      await s.routeOutbound(msg);
      if (!mounted) return;
      setState(() {});
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
    }
  }

  Future<void> _sendImage() async {
    if (_sendingOutbound) return;
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
    if (_shouldSuppressDuplicate(
      kind: 'image',
      body: base64Encode(bytes),
      receiverId: widget.peerId,
    )) {
      return;
    }
    setState(() => _sendingOutbound = true);
    if (bytes.length > 180 * 1024) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image too large (max ~180KB)')),
      );
      if (mounted) setState(() => _sendingOutbound = false);
      return;
    }
    final receiverPub = await _resolveReceiverPub(s);
    if (receiverPub == null) {
      if (mounted) setState(() => _sendingOutbound = false);
      return;
    }
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
    try {
      await s.persistChatMessage(msg);
      await s.routeOutbound(msg);
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
    }
  }

  bool _shouldSuppressDuplicate({
    required String kind,
    required String body,
    required String receiverId,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final digest = crypto.sha256.convert(utf8.encode('$kind|$receiverId|$body'));
    final fp = digest.toString();
    final recent = now - _lastSendAtMs <= _sendDupWindowMs;
    final same = _lastSendFingerprint == fp;
    if (same && recent) {
      debugPrint('[Chat] suppress duplicate send kind=$kind peer=$receiverId');
      return true;
    }
    _lastSendFingerprint = fp;
    _lastSendAtMs = now;
    return false;
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
    if (m.payloadKind == PayloadKinds.audio) {
      return m.senderId == s.myUserId
          ? l10n.chatVoiceLabelSent
          : l10n.chatVoiceLabel;
    }
    if (m.payloadKind == PayloadKinds.image) {
      return l10n.chatImageLabel;
    }
    if (m.payloadKind == PayloadKinds.notice) {
      return l10n.chatNoticeHidden;
    }
    if (PayloadKinds.isSystemLine(m.payloadKind)) {
      return l10n.screenshotTaken;
    }
    // Sender-local plaintext preview (never sent on the wire).
    final local = m.content?.trim();
    if (local != null &&
        local.isNotEmpty &&
        m.senderId == s.myUserId) {
      return local;
    }
    if (m.receiverId == s.myUserId) {
      try {
        final decrypted = s.crypto.decryptFromSender(
          encryptedPayload: m.encryptedPayload,
          encryptedKey: m.encryptedKey,
        );
        if (parseNoticeWire(decrypted) != null) {
          return l10n.chatNoticeHidden;
        }
        return decrypted;
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
      ({Uint8List bytes, String ext})? decoded;

      if (m.senderId == s.myUserId) {
        final local = m.content?.trim();
        if (local != null && local.isNotEmpty) {
          decoded = VoicePayload.decode(local);
          if (decoded != null) {
            debugPrint('[PTT] play local ext=${decoded.ext} bytes=${decoded.bytes.length}');
          }
        }
      }

      if (decoded == null) {
        final plain = s.crypto.decryptFromSender(
          encryptedPayload: m.encryptedPayload,
          encryptedKey: m.encryptedKey,
        );
        decoded = VoicePayload.decode(plain);
        if (decoded != null) {
          debugPrint('[PTT] play decrypt ext=${decoded.ext} bytes=${decoded.bytes.length}');
        }
      }

      if (decoded == null || decoded.bytes.isEmpty) {
        throw StateError('invalid voice payload');
      }

      await _audio.playBytes(decoded.bytes, ext: decoded.ext);
    } catch (e) {
      debugPrint('[PTT] play-fail: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatPlayVoiceFailed('$e'))),
      );
    }
  }

  Widget _buildThread(
    BuildContext context,
    AppState s,
    AppLocalizations l10n,
    String myId,
  ) {
    if (_loading && _messages.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (_loadError != null && _messages.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.chatLoadFailed(_loadError!),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () => unawaited(_reloadMessages(force: true)),
                child: Text(l10n.retry),
              ),
            ],
          ),
        ),
      );
    }
    if (_messages.isEmpty) {
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
      itemCount: _messages.length,
      itemBuilder: (context, i) {
        final m = _messages[i];
        final isMe = m.senderId == myId;
        final text = _plainById[m.id] ?? '…';
        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
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
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: Colors.tealAccent.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (m.payloadKind == PayloadKinds.audio) ...[
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
                          Text(
                            _statusLabel(l10n, m.status),
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.65),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                        Text(
                          'TTL ${m.ttl}',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white.withValues(alpha: 0.45),
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
              if (mounted) setState(() {});
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
                      final name =
                          nameSnap.data ?? formatShortPeerId(widget.peerId);
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
                  'Me: ${formatShortPeerId(myId)}',
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
          Expanded(child: _buildThread(context, s, l10n, myId)),
          SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: l10n.chatVoiceLabel,
                        onPressed: _composeLocked
                            ? null
                            : () => unawaited(_openVoiceRecorder()),
                        icon: const Icon(Icons.mic_none_outlined),
                        style: IconButton.styleFrom(
                          minimumSize: const Size(48, 48),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.chatAttachImage,
                        onPressed: _composeLocked ? null : _sendImage,
                        icon: const Icon(Icons.image_outlined),
                      ),
                      IconButton(
                        tooltip: l10n.chatEmojiTooltip,
                        onPressed: _composeLocked ? null : _toggleEmojiPicker,
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
                          enabled: !_composeLocked,
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
                        onPressed: _composeLocked ? null : _send,
                        style: IconButton.styleFrom(
                          backgroundColor: _sendingOutbound
                              ? Colors.white.withValues(alpha: 0.18)
                              : const Color(0xFF10B981),
                          foregroundColor: _sendingOutbound
                              ? Colors.white70
                              : Colors.white,
                        ),
                        icon: _sendingOutbound
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

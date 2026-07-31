import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

import '../app/theme.dart';
import '../core/board_invite_wire.dart';
import '../core/chat_image_codec.dart';
import '../core/identity_invite_wire.dart';
import '../core/notice_wire.dart';
import '../core/payload_kinds.dart';
import '../core/qr_image_decode.dart';
import '../core/voice_payload.dart';
import '../widgets/invite_actions_sheet.dart';
import '../core/peer_id.dart';
import '../core/slash_commands.dart';
import '../l10n/l10n_ext.dart';
import '../models/chat_message.dart';
import '../models/feed_channel.dart';
import '../services/audio_recorder_service.dart';
import '../services/crypto_service.dart';
import '../services/resilnet_packet_codec.dart';
import '../state/app_state.dart';
import '../widgets/identicon.dart';
import 'announcements_screen.dart';
import 'qr_scanner_screen.dart';
import 'voice_record_sheet.dart';

enum _ComposeInviteKind { none, board, identity, hash }

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
  StreamSubscription<void>? _playbackSub;
  String? _playingVoiceId;
  bool _showEmojiPicker = false;
  bool _sendingOutbound = false;
  String? _lastSendFingerprint;
  int _lastSendAtMs = 0;
  _ComposeInviteKind _composeInvite = _ComposeInviteKind.none;

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
    _text.addListener(_onComposeChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final s = context.read<AppState>();
      _appState = s;
      s.setActiveChatPeerId(widget.peerId);
      s.addListener(_onAppState);
      unawaited(s.markConversationRead(widget.peerId));
      unawaited(_reloadMessages(force: true));
    });
  }

  void _onComposeChanged() {
    final raw = _text.text;
    _ComposeInviteKind kind = _ComposeInviteKind.none;
    if (parseBoardInvite(raw) != null) {
      kind = _ComposeInviteKind.board;
    } else if (parseIdentityInvite(raw) != null) {
      kind = _ComposeInviteKind.identity;
    } else if (looksLikePublicKeyHash(raw.trim())) {
      kind = _ComposeInviteKind.hash;
    }
    if (kind != _composeInvite && mounted) {
      setState(() => _composeInvite = kind);
    }
  }

  @override
  void dispose() {
    final s = _appState;
    if (s != null && s.activeChatPeerId == widget.peerId) {
      s.setActiveChatPeerId(null);
    }
    _appState?.removeListener(_onAppState);
    _playbackSub?.cancel();
    _text.removeListener(_onComposeChanged);
    _text.dispose();
    _focusNode.dispose();
    _audio.dispose();
    super.dispose();
  }

  void _onAppState() {
    if (!mounted) return;
    final s = context.read<AppState>();
    final epoch = s.chatDataEpoch;
    if (epoch == _boundEpoch) return;
    // Chat is on-screen — mark newly arrived messages read so the sender
    // receives READ receipts while the conversation stays open.
    unawaited(s.markConversationRead(widget.peerId));
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

  Future<void> _openVoiceNote() async {
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
      debugPrint('[PTT] voice sheet failed: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.l10n.chatVoiceFailed('$e'))),
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

    // Only reject absurd raw sizes; iOS AAC overhead makes short clips look "big".
    if (bytes.length > AudioRecorderService.maxBytes) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${context.l10n.chatVoiceTooLarge} (${(bytes.length / 1024).toStringAsFixed(1)}KB)',
            ),
          ),
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

    // Voice always goes Nostr-only (auto-chunked when sealed envelope is large).
    final dtoLen = ResilNetPacketCodec.toDto(msg).payload.length;
    debugPrint('[PTT] sealed dto=$dtoLen (chunk if >${AudioRecorderService.maxSealedDtoBytes})');
    final nostrUp = s.isNostrOnline || s.isCloudOnline;
    if (!nostrUp) {
      debugPrint('[PTT] voice needs Nostr dto=$dtoLen nostr=off');
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
      final ok = await s.routeOutbound(msg, internetOnly: true);
      debugPrint(
        '[PTT] send voice routed ok=$ok bytes=${bytes.length} dto=$dtoLen '
        'internetOnly=true',
      );
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.l10n.chatVoiceNeedInternet)),
        );
      } else {
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
        offerDocsGuide: slash.offerDocsGuide,
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
      final ok = await s.routeOutbound(msg);
      if (!ok) {
        await s.markMessageFailed(msg.id);
      }
      if (!mounted) return;
      setState(() {});
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
    }
  }

  Future<void> _sendImage() async {
    if (_sendingOutbound) return;
    final s = context.read<AppState>();
    final l10n = context.l10n;
    if (!s.e2eeEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.settingsE2eeSubtitle)),
      );
      return;
    }
    // Images must publish via Nostr (multi-part). Do not fake success over BLE.
    final online = s.isNostrOnline || s.isCloudOnline;
    if (!online) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.chatImageNeedInternet)),
      );
      return;
    }
    final picker = ImagePicker();
    final file = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1600,
      imageQuality: 70,
    );
    if (file == null) return;
    setState(() => _sendingOutbound = true);
    try {
      final raw = await file.readAsBytes();
      final budget = ChatImageCodec.budgetForConnectivity(online: true);
      // Off the UI isolate timing: encode can take a beat on large photos.
      final bytes = await Future(
        () => ChatImageCodec.compressToBudget(raw, maxBytes: budget),
      );
      if (bytes == null || bytes.isEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.chatImageTooLargeOnline)),
        );
        return;
      }
      if (_shouldSuppressDuplicate(
        kind: 'image',
        body: base64Encode(bytes),
        receiverId: widget.peerId,
      )) {
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
        // Local-only preview cache (stripped on wire).
        content: b64,
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
      final ok = await s.routeOutbound(
        msg,
        internetOnly: true,
      );
      if (!ok) {
        await s.markMessageFailed(msg.id);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.chatSendFailed)),
          );
        }
      }
      if (mounted) setState(() {});
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
    }
  }

  void _submitCompose() {
    if (_composeLocked) return;
    unawaited(_send());
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
      MessageStatus.failed => l10n.statusFailed,
    };
  }

  Widget _statusTicks(MessageStatus s) {
    final gray = Colors.white.withValues(alpha: 0.55);
    const blue = Color(0xFF53BDEB);
    final red = Colors.redAccent.withValues(alpha: 0.9);

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
      MessageStatus.failed => Icon(Icons.error_outline, size: 14, color: red),
      MessageStatus.sent || MessageStatus.relayed => singleTick(gray),
      MessageStatus.delivered => doubleTick(gray),
      MessageStatus.read => doubleTick(blue),
    };
  }

  String _formatSendTime(int timestampMs) {
    if (timestampMs <= 0) return '';
    final dt = DateTime.fromMillisecondsSinceEpoch(timestampMs).toLocal();
    final hh = dt.hour.toString().padLeft(2, '0');
    final mm = dt.minute.toString().padLeft(2, '0');
    return '$hh:$mm';
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
      final local = m.content?.trim();
      if (local != null && local.isNotEmpty) {
        return local;
      }
      if (m.receiverId == s.myUserId) {
        try {
          return s.crypto.decryptFromSender(
            encryptedPayload: m.encryptedPayload,
            encryptedKey: m.encryptedKey,
          );
        } catch (_) {
          return '';
        }
      }
      return '';
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
      // Tap again while this note is active → pause/stop.
      // Do not require isPlaying: player state can lag and made the icon blink.
      if (_playingVoiceId == m.id) {
        await _audio.stopPlayback();
        _playbackSub?.cancel();
        if (mounted) setState(() => _playingVoiceId = null);
        return;
      }

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

      await _audio.stopPlayback();
      _playbackSub?.cancel();
      if (mounted) setState(() => _playingVoiceId = m.id);
      await _audio.playBytes(decoded.bytes, ext: decoded.ext);
      _playbackSub = _audio.onPlaybackComplete.listen((_) {
        if (!mounted) return;
        setState(() => _playingVoiceId = null);
      });
    } catch (e) {
      debugPrint('[PTT] play-fail: $e');
      _playbackSub?.cancel();
      if (!mounted) return;
      setState(() => _playingVoiceId = null);
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
              child: InkWell(
                onLongPress: () => unawaited(
                  _showMessageActions(s, l10n, m, text, isMe: isMe),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (m.payloadKind == PayloadKinds.areaPublic) ...[
                        Text(
                          l10n.areaPublicBadge,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: Colors.tealAccent
                                        .withValues(alpha: 0.9),
                                  ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      _buildMessageBody(s, l10n, m, text),
                      if (m.payloadKind == PayloadKinds.audio) ...[
                        const SizedBox(height: 8),
                        FilledButton.tonalIcon(
                          onPressed: () => unawaited(_playVoiceNote(s, m)),
                          icon: Icon(
                            _playingVoiceId == m.id
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          label: Text(
                            _playingVoiceId == m.id
                                ? l10n.chatPauseVoice
                                : l10n.chatPlayVoice,
                          ),
                        ),
                      ],
                      const SizedBox(height: 8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _formatSendTime(m.timestamp),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color:
                                      Colors.white.withValues(alpha: 0.45),
                                ),
                          ),
                          if (isMe) ...[
                            const SizedBox(width: 10),
                            _statusTicks(m.status),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                m.status == MessageStatus.failed
                                    ? l10n.chatSendFailed
                                    : _statusLabel(l10n, m.status),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      color: m.status == MessageStatus.failed
                                          ? Colors.redAccent
                                              .withValues(alpha: 0.9)
                                          : Colors.white
                                              .withValues(alpha: 0.65),
                                    ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      if (isMe && m.status == MessageStatus.failed) ...[
                        const SizedBox(height: 6),
                        TextButton(
                          onPressed: _composeLocked
                              ? null
                              : () => unawaited(_retryMessage(s, l10n, m)),
                          child: Text(l10n.chatRetry),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessageBody(
    AppState s,
    AppLocalizations l10n,
    ChatMessage m,
    String text,
  ) {
    if (m.payloadKind == PayloadKinds.image) {
      return _buildImageBody(l10n, text);
    }
    if (m.payloadKind == PayloadKinds.audio ||
        m.payloadKind == PayloadKinds.notice ||
        PayloadKinds.isSystemLine(m.payloadKind)) {
      return Text(text, style: Theme.of(context).textTheme.bodyMedium);
    }
    final board = parseBoardInvite(text);
    if (board != null) {
      final short = encodeBoardInviteHttpsLink(board.toBoard());
      final full = encodeBoardInviteDeepLink(board.toBoard());
      return _tappableInviteCard(
        icon: Icons.campaign_outlined,
        title: board.title,
        subtitle: l10n.announceConfirmFollowTitle,
        onTap: () => unawaited(
          _confirmFollowBoardInvite(text, board.title, l10n),
        ),
        onLongPress: () => unawaited(
          showInviteActionsSheet(
            context: context,
            title: board.title,
            subtitle: l10n.inviteLongPressHint,
            shortLink: short,
            fullLink: full,
            acceptLabel: l10n.announceConfirmFollow,
            onAccept: () => _confirmFollowBoardInvite(text, board.title, l10n),
          ),
        ),
      );
    }
    final identity = parseIdentityInvite(text);
    if (identity != null) {
      final label = (identity.name != null && identity.name!.isNotEmpty)
          ? identity.name!
          : formatShortPeerId(identity.id);
      final short = encodeIdentityInviteHttpsLink(
        id: identity.id,
        publicKeyPem: identity.publicKeyPem,
        name: identity.name,
      );
      final full = encodeIdentityInviteDeepLink(
        id: identity.id,
        publicKeyPem: identity.publicKeyPem,
        name: identity.name,
      );
      return _tappableInviteCard(
        icon: Icons.person_add_alt_1_outlined,
        title: label,
        subtitle: l10n.peerConfirmAddTitle,
        onTap: () => unawaited(_confirmAddPeerInvite(text, identity, l10n)),
        onLongPress: () => unawaited(
          showInviteActionsSheet(
            context: context,
            title: label,
            subtitle: l10n.inviteLongPressHint,
            shortLink: short,
            fullLink: full,
            acceptLabel: l10n.peerConfirmAdd,
            onAccept: () => _confirmAddPeerInvite(text, identity, l10n),
          ),
        ),
      );
    }
    return _linkifiedText(text, l10n);
  }

  Widget _tappableInviteCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    VoidCallback? onLongPress,
  }) {
    return Material(
      color: const Color(0xFF1A3A2A),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, color: const Color(0xFF5AC8FA)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.white54),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageBody(AppLocalizations l10n, String b64) {
    if (b64.isEmpty || b64 == '…') {
      return Text(l10n.chatImageLabel);
    }
    try {
      final bytes = Uint8List.fromList(base64Decode(b64));
      return GestureDetector(
        onTap: () => unawaited(_onChatImageTap(bytes, l10n)),
        onLongPress: () => unawaited(_onChatImageLongPress(bytes, l10n)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            bytes,
            fit: BoxFit.cover,
            height: 180,
            width: double.infinity,
            // Chat thread rebuilds on every AppState tick (BLE/Nostr
            // heartbeats). Without gapless playback Image.memory re-decodes and
            // flashes ("blinks") each rebuild — hold the last decoded frame.
            gaplessPlayback: true,
            errorBuilder: (_, error, stack) => Text(l10n.chatImageLabel),
          ),
        ),
      );
    } catch (_) {
      return Text(l10n.chatImageLabel);
    }
  }

  Future<void> _onChatImageTap(Uint8List bytes, AppLocalizations l10n) async {
    final qr = await decodeQrFromImageBytes(bytes);
    if (!mounted) return;
    if (qr != null && qr.isNotEmpty) {
      final board = parseBoardInvite(qr);
      if (board != null) {
        await _confirmFollowBoardInvite(qr, board.title, l10n);
        return;
      }
      final identity = parseIdentityInvite(qr);
      if (identity != null) {
        await _confirmAddPeerInvite(qr, identity, l10n);
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.peerQrNoCode)),
      );
      return;
    }
    if (!mounted) return;
    showDialog<void>(
      context: context,
      builder: (ctx) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: InteractiveViewer(
          child: Image.memory(
            bytes,
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }

  Future<void> _onChatImageLongPress(
    Uint8List bytes,
    AppLocalizations l10n,
  ) async {
    final qr = await decodeQrFromImageBytes(bytes);
    if (!mounted || qr == null || qr.isEmpty) return;
    final board = parseBoardInvite(qr);
    if (board != null) {
      final short = encodeBoardInviteHttpsLink(board.toBoard());
      final full = encodeBoardInviteDeepLink(board.toBoard());
      await showInviteActionsSheet(
        context: context,
        title: board.title,
        subtitle: l10n.inviteLongPressHint,
        shortLink: short,
        fullLink: full,
        acceptLabel: l10n.announceConfirmFollow,
        onAccept: () => _confirmFollowBoardInvite(qr, board.title, l10n),
      );
      return;
    }
    final identity = parseIdentityInvite(qr);
    if (identity == null) return;
    final label = (identity.name != null && identity.name!.isNotEmpty)
        ? identity.name!
        : formatShortPeerId(identity.id);
    await showInviteActionsSheet(
      context: context,
      title: label,
      subtitle: l10n.inviteLongPressHint,
      shortLink: encodeIdentityInviteHttpsLink(
        id: identity.id,
        publicKeyPem: identity.publicKeyPem,
        name: identity.name,
      ),
      fullLink: encodeIdentityInviteDeepLink(
        id: identity.id,
        publicKeyPem: identity.publicKeyPem,
        name: identity.name,
      ),
      acceptLabel: l10n.peerConfirmAdd,
      onAccept: () => _confirmAddPeerInvite(qr, identity, l10n),
    );
  }

  static final _urlRe = RegExp(
    r'(https?:\/\/ajarnthitasilo\.github\.io\/ResilNet\/go\/?\?[^\s<>]+)|'
    r'(resilnet:\/\/(?:board\/invite|peer\/invite|b|p)\?[^\s<>]+)|'
    r'(https?:\/\/[^\s<>]+)|'
    r'(www\.[^\s<>]+)|'
    r'(?<![A-Za-z0-9_+/-])[A-Za-z0-9_-]{43}(?![A-Za-z0-9_+/=-])',
    caseSensitive: false,
  );

  Widget _linkifiedText(String text, AppLocalizations l10n) {
    final style = Theme.of(context).textTheme.bodyMedium;
    final linkStyle = style?.copyWith(
      color: const Color(0xFF5AC8FA),
      decoration: TextDecoration.underline,
    );
    final matches = _urlRe.allMatches(text).toList();
    if (matches.isEmpty) {
      return SelectableText(text, style: style);
    }
    final spans = <InlineSpan>[];
    var cursor = 0;
    for (final m in matches) {
      if (m.start > cursor) {
        spans.add(TextSpan(text: text.substring(cursor, m.start), style: style));
      }
      final raw = m.group(0)!;
      spans.add(
        TextSpan(
          text: raw,
          style: linkStyle,
          recognizer: TapGestureRecognizer()
            ..onTap = () => unawaited(_openLink(raw, l10n)),
        ),
      );
      cursor = m.end;
    }
    if (cursor < text.length) {
      spans.add(TextSpan(text: text.substring(cursor), style: style));
    }
    return SelectableText.rich(TextSpan(children: spans));
  }

  Future<void> _openLink(String raw, AppLocalizations l10n) async {
    var href = raw.trim();
    if (href.startsWith('www.')) href = 'https://$href';

    final board = parseBoardInvite(href);
    if (board != null) {
      await _confirmFollowBoardInvite(href, board.title, l10n);
      return;
    }

    final identity = parseIdentityInvite(href);
    if (identity != null) {
      await _confirmAddPeerInvite(href, identity, l10n);
      return;
    }

    if (looksLikePublicKeyHash(href)) {
      await _onPublicKeyHashTap(href, l10n);
      return;
    }

    final uri = Uri.tryParse(href);
    if (uri == null) return;
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.chatOpenLinkFailed)),
      );
    }
  }

  Future<void> _confirmFollowBoardInvite(
    String raw,
    String title,
    AppLocalizations l10n,
  ) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.announceConfirmFollowTitle),
        content: Text(l10n.announceConfirmFollowBody(title)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.announceConfirmFollow),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final s = context.read<AppState>();
    final board = await s.followBoardFromInviteAny(raw);
    if (!mounted) return;
    if (board == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.announceFollowFail)),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.announceFollowOkNamed(board.title))),
    );
    await openAnnouncementsScreen(context);
  }

  Future<void> _confirmAddPeerInvite(
    String raw,
    IdentityInviteData identity,
    AppLocalizations l10n,
  ) async {
    final label = (identity.name != null && identity.name!.isNotEmpty)
        ? identity.name!
        : formatShortPeerId(identity.id);
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.peerConfirmAddTitle),
        content: Text(l10n.peerConfirmAddBody(label)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.peerConfirmAdd),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final s = context.read<AppState>();
    final peer = await s.importPeerFromIdentityAny(raw);
    if (!mounted) return;
    if (peer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.qrInvalid)),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.peerAddedOk(label))),
    );
    // If this chat was opened for this peer (hash-only), stay; else offer open.
    if (peer.id != widget.peerId) {
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ChatScreen(peerId: peer.id)),
      );
    } else {
      setState(() {});
    }
  }

  Future<void> _onPublicKeyHashTap(String hash, AppLocalizations l10n) async {
    await Clipboard.setData(ClipboardData(text: hash));
    if (!mounted) return;
    final s = context.read<AppState>();
    final peer = await s.db.getPeer(hash);
    final hasKey = peer != null && peer.publicKey.trim().isNotEmpty;
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.peerHashCopied),
        content: Text(
          hasKey ? l10n.peerConfirmAddBody(formatShortPeerId(hash)) : l10n.peerHashAddHint,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              if (hash == widget.peerId) return;
              unawaited(
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ChatScreen(peerId: hash)),
                ),
              );
            },
            child: Text(l10n.peerHashOpenChat),
          ),
        ],
      ),
    );
  }

  Future<void> _showMessageActions(
    AppState s,
    AppLocalizations l10n,
    ChatMessage m,
    String text, {
    required bool isMe,
  }) async {
    final canCopy = m.payloadKind != PayloadKinds.image &&
        m.payloadKind != PayloadKinds.audio &&
        text.isNotEmpty &&
        text != '…';
    await showModalBottomSheet<void>(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (canCopy)
                ListTile(
                  leading: const Icon(Icons.copy),
                  title: Text(l10n.chatCopy),
                  onTap: () async {
                    await Clipboard.setData(ClipboardData(text: text));
                    if (ctx.mounted) Navigator.pop(ctx);
                  },
                ),
              if (isMe &&
                  (m.status == MessageStatus.failed ||
                      m.status == MessageStatus.pending))
                ListTile(
                  leading: const Icon(Icons.refresh),
                  title: Text(l10n.chatRetry),
                  onTap: () {
                    Navigator.pop(ctx);
                    unawaited(_retryMessage(s, l10n, m));
                  },
                ),
              if (isMe)
                ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: Text(l10n.chatDeleteLocal),
                  onTap: () async {
                    Navigator.pop(ctx);
                    await s.deleteLocalMessage(m.id);
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.chatDeletedLocalSnack)),
                    );
                    await _reloadMessages(force: true);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _retryMessage(
    AppState s,
    AppLocalizations l10n,
    ChatMessage m,
  ) async {
    if (_sendingOutbound) return;
    setState(() => _sendingOutbound = true);
    try {
      final ok = await s.retryOutbound(m);
      if (!mounted) return;
      if (!ok) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.chatSendFailed)),
        );
      }
      await _reloadMessages(force: true);
    } finally {
      if (mounted) setState(() => _sendingOutbound = false);
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
        decoration: ResilNetTheme.pageDecoration(context),
        child: Column(
        children: [
          Expanded(child: _buildThread(context, s, l10n, myId)),
          SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_composeInvite != _ComposeInviteKind.none)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
                    child: Material(
                      color: const Color(0xFF1A3A2A),
                      borderRadius: BorderRadius.circular(12),
                      child: ListTile(
                        dense: true,
                        leading: Icon(
                          _composeInvite == _ComposeInviteKind.board
                              ? Icons.campaign_outlined
                              : Icons.person_add_alt_1_outlined,
                        ),
                        title: Text(
                          _composeInvite == _ComposeInviteKind.board
                              ? l10n.announceFollowFromCompose
                              : l10n.peerAddFromCompose,
                        ),
                        trailing: FilledButton(
                          onPressed: () async {
                            final raw = _text.text;
                            switch (_composeInvite) {
                              case _ComposeInviteKind.board:
                                final invite = parseBoardInvite(raw);
                                if (invite == null) return;
                                await _confirmFollowBoardInvite(
                                  raw,
                                  invite.title,
                                  l10n,
                                );
                              case _ComposeInviteKind.identity:
                                final identity = parseIdentityInvite(raw);
                                if (identity == null) return;
                                await _confirmAddPeerInvite(
                                  raw,
                                  identity,
                                  l10n,
                                );
                              case _ComposeInviteKind.hash:
                                await _onPublicKeyHashTap(raw.trim(), l10n);
                              case _ComposeInviteKind.none:
                                break;
                            }
                          },
                          child: Text(
                            _composeInvite == _ComposeInviteKind.board
                                ? l10n.announceConfirmFollow
                                : _composeInvite == _ComposeInviteKind.hash
                                    ? l10n.peerHashOpenChat
                                    : l10n.peerConfirmAdd,
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
                  child: Row(
                    children: [
                      IconButton(
                        tooltip: l10n.voicePttHold,
                        onPressed: _sendingOutbound
                            ? null
                            : () => unawaited(_openVoiceNote()),
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
                        child: Focus(
                          onKeyEvent: (node, event) {
                            if (event is! KeyDownEvent) {
                              return KeyEventResult.ignored;
                            }
                            if (event.logicalKey != LogicalKeyboardKey.enter &&
                                event.logicalKey != LogicalKeyboardKey.numpadEnter) {
                              return KeyEventResult.ignored;
                            }
                            if (HardwareKeyboard.instance.isShiftPressed) {
                              return KeyEventResult.ignored;
                            }
                            _submitCompose();
                            return KeyEventResult.handled;
                          },
                          child: TextField(
                            controller: _text,
                            focusNode: _focusNode,
                            enabled: !_composeLocked,
                            minLines: 1,
                            maxLines: 4,
                            textInputAction: TextInputAction.send,
                            onSubmitted: (_) => _submitCompose(),
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

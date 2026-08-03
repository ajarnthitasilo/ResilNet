import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../core/payload_kinds.dart';
import '../models/chat_message.dart';

/// HTTP client for the lab/desktop LXMF Mac/Pi bridge.
///
/// Sends **already sealed** [ChatMessage] envelopes as opaque `sealed_hex`.
/// Does not embed Reticulum — see `labs/reticulum_lxmf/docs/bridge_app_integration.md`.
class LxmfBridgeClient extends ChangeNotifier {
  LxmfBridgeClient({http.Client? httpClient})
      : _http = httpClient ?? http.Client();

  final http.Client _http;

  static const defaultBaseUrl = 'http://127.0.0.1:8766';
  static const _pollInterval = Duration(seconds: 3);
  static const _requestTimeout = Duration(seconds: 12);

  bool _enabled = false;
  String _baseUrl = defaultBaseUrl;
  Map<String, String> _identityMap = {};
  String? _fromPeerId;

  bool _online = false;
  String? _lxmfDestination;
  String? _bridgeName;
  String? _lastError;
  DateTime? _lastStatusAt;

  Timer? _pollTimer;
  Future<void> Function(ChatMessage msg)? _onInbound;
  final Set<String> _seenInboxKeys = {};

  bool get enabled => _enabled;
  String get baseUrl => _baseUrl;
  Map<String, String> get identityMap => Map.unmodifiable(_identityMap);
  bool get online => _online;
  String? get lxmfDestination => _lxmfDestination;
  String? get bridgeName => _bridgeName;
  String? get lastError => _lastError;
  DateTime? get lastStatusAt => _lastStatusAt;

  /// Ready to attempt send: enabled + last status ok (best-effort).
  bool get isActive => _enabled && _online;

  void setInboundHandler(Future<void> Function(ChatMessage msg)? handler) {
    _onInbound = handler;
  }

  void setFromPeerId(String? peerId) {
    _fromPeerId = peerId?.trim();
  }

  Future<void> configure({
    required bool enabled,
    required String baseUrl,
    required Map<String, String> identityMap,
  }) async {
    _baseUrl = _normalizeBaseUrl(baseUrl);
    _identityMap = {
      for (final e in identityMap.entries)
        if (e.key.trim().isNotEmpty && e.value.trim().isNotEmpty)
          e.key.trim(): e.value.trim().toLowerCase(),
    };
    final was = _enabled;
    _enabled = enabled;
    if (_enabled) {
      await refreshStatus();
      _ensurePolling();
    } else {
      _stopPolling();
      _online = false;
      _lastError = null;
    }
    if (was != _enabled || enabled) {
      notifyListeners();
    }
  }

  String lookupDest(String peerId) {
    final id = peerId.trim();
    return _identityMap[id] ?? '';
  }

  /// Strip separators; RNS truncated dest is 32 hex chars.
  static String? normalizeDest(String raw) {
    final cleaned =
        raw.trim().toLowerCase().replaceAll(RegExp(r'[^0-9a-f]'), '');
    if (cleaned.length != 32) return null;
    return cleaned;
  }

  static bool isValidDest(String raw) => normalizeDest(raw) != null;

  /// Human-friendly host entry → full base URL.
  static String normalizeBaseUrl(String raw) => _normalizeBaseUrl(raw);

  Future<bool> refreshStatus() async {
    if (!_enabled) {
      _online = false;
      notifyListeners();
      return false;
    }
    try {
      final uri = Uri.parse('$_baseUrl/status');
      final resp = await _http.get(uri).timeout(_requestTimeout);
      if (resp.statusCode != 200) {
        _online = false;
        _lastError = 'HTTP ${resp.statusCode}';
        notifyListeners();
        return false;
      }
      final data = jsonDecode(resp.body);
      if (data is! Map) {
        _online = false;
        _lastError = 'bad status JSON';
        notifyListeners();
        return false;
      }
      final ok = data['ok'] == true;
      _online = ok;
      _lxmfDestination = (data['lxmf_destination'] as String?)?.trim();
      _bridgeName = (data['name'] as String?)?.trim();
      _lastError = ok ? null : 'status not ok';
      _lastStatusAt = DateTime.now();
      notifyListeners();
      return ok;
    } catch (e) {
      _online = false;
      _lastError = e.toString();
      notifyListeners();
      debugPrint('[LxmfBridge] status failed: $e');
      return false;
    }
  }

  /// Send sealed DM to the peer's LXMF dest (from identity map).
  Future<bool> sendDirect(ChatMessage msg) async {
    if (!_enabled) return false;
    final dest = lookupDest(msg.receiverId);
    if (dest.isEmpty) {
      debugPrint(
        '[LxmfBridge] no lxmf dest for peer=${msg.receiverId}',
      );
      return false;
    }
    try {
      final sealedHex = encodeSealedHex(msg);
      final body = <String, dynamic>{
        'dest': dest,
        'to_peer_id': msg.receiverId,
        'from_peer_id': _fromPeerId ?? msg.senderId,
        'sealed_hex': sealedHex,
      };
      final uri = Uri.parse('$_baseUrl/send');
      final resp = await _http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 60));
      if (resp.statusCode != 200) {
        debugPrint('[LxmfBridge] send HTTP ${resp.statusCode}: ${resp.body}');
        return false;
      }
      final data = jsonDecode(resp.body);
      final ok = data is Map && data['ok'] == true;
      if (ok) {
        debugPrint(
          '[LxmfBridge] sent id=${msg.id} bytes=${data['bytes']}',
        );
      }
      return ok;
    } catch (e) {
      debugPrint('[LxmfBridge] send failed: $e');
      return false;
    }
  }

  Future<void> pollInboxOnce() async {
    if (!_enabled || _onInbound == null) return;
    try {
      final uri = Uri.parse('$_baseUrl/inbox');
      final resp = await _http.get(uri).timeout(_requestTimeout);
      if (resp.statusCode != 200) return;
      final data = jsonDecode(resp.body);
      if (data is! Map) return;
      final items = data['items'];
      if (items is! List) return;
      for (final raw in items) {
        if (raw is! Map) continue;
        final key = _inboxKey(raw);
        if (key == null || _seenInboxKeys.contains(key)) continue;
        final blob = raw['blob'];
        if (blob is! Map) continue;
        final sealedHex = (blob['sealed_hex'] as String?)?.trim() ?? '';
        if (sealedHex.isEmpty) continue;
        final msg = decodeSealedHex(sealedHex);
        if (msg == null) continue;
        _seenInboxKeys.add(key);
        if (_seenInboxKeys.length > 500) {
          _seenInboxKeys.remove(_seenInboxKeys.first);
        }
        try {
          await _onInbound!(msg);
        } catch (e) {
          debugPrint('[LxmfBridge] inbound handler failed: $e');
        }
      }
    } catch (e) {
      debugPrint('[LxmfBridge] inbox poll failed: $e');
    }
  }

  /// UTF-8 JSON of [ChatMessage.toMap] with plaintext content cleared → hex.
  static String encodeSealedHex(ChatMessage msg) {
    final map = Map<String, Object?>.from(msg.toMap());
    if (msg.payloadKind != PayloadKinds.presence &&
        msg.payloadKind != PayloadKinds.bulletin) {
      map['content'] = '';
    }
    if ((msg.senderPk == null || msg.senderPk!.trim().isEmpty)) {
      // leave as-is; AppState usually attaches senderPk on outbound
    }
    final bytes = utf8.encode(jsonEncode(map));
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  static ChatMessage? decodeSealedHex(String hex) {
    try {
      final cleaned = hex.trim();
      if (cleaned.isEmpty || cleaned.length.isOdd) return null;
      final bytes = <int>[];
      for (var i = 0; i < cleaned.length; i += 2) {
        bytes.add(int.parse(cleaned.substring(i, i + 2), radix: 16));
      }
      final map = jsonDecode(utf8.decode(bytes));
      if (map is! Map) return null;
      return ChatMessage.fromMap(Map<String, Object?>.from(map));
    } catch (e) {
      debugPrint('[LxmfBridge] decode sealed failed: $e');
      return null;
    }
  }

  static Map<String, String> parseIdentityMapJson(String raw) {
    final out = <String, String>{};
    final t = raw.trim();
    if (t.isEmpty) return out;
    try {
      final data = jsonDecode(t);
      if (data is Map) {
        for (final e in data.entries) {
          final k = e.key.toString().trim();
          final v = e.value.toString().trim();
          if (k.isNotEmpty && v.isNotEmpty) out[k] = v.toLowerCase();
        }
      }
    } catch (e) {
      debugPrint('[LxmfBridge] identity map parse failed: $e');
    }
    return out;
  }

  static String identityMapToJson(Map<String, String> map) {
    return const JsonEncoder.withIndent('  ').convert(map);
  }

  static String _normalizeBaseUrl(String raw) {
    var u = raw.trim();
    if (u.isEmpty) return defaultBaseUrl;
    if (!u.startsWith('http://') && !u.startsWith('https://')) {
      u = 'http://$u';
    }
    while (u.endsWith('/')) {
      u = u.substring(0, u.length - 1);
    }
    return u;
  }

  String? _inboxKey(Map raw) {
    final hex = (raw['hex'] as String?)?.trim();
    if (hex != null && hex.isNotEmpty) return hex;
    final blob = raw['blob'];
    if (blob is Map) {
      final s = (blob['sealed_hex'] as String?)?.trim();
      if (s != null && s.isNotEmpty) return s;
    }
    final ts = raw['ts'];
    if (ts != null) return 'ts:$ts';
    return null;
  }

  void _ensurePolling() {
    _pollTimer?.cancel();
    if (!_enabled) return;
    _pollTimer = Timer.periodic(_pollInterval, (_) {
      unawaited(pollInboxOnce());
      unawaited(refreshStatus());
    });
    unawaited(pollInboxOnce());
  }

  void _stopPolling() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  @override
  void dispose() {
    _stopPolling();
    _http.close();
    super.dispose();
  }
}

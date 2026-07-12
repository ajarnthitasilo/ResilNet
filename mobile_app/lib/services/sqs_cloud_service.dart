import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/chat_message.dart';
import 'database_service.dart';

/// Cloud Sync ผ่าน AWS SQS (Serverless)
///
/// เป้าหมายด้านความปลอดภัย:
/// - ข้อมูลที่ขึ้น SQS ต้องเป็น "Encrypted-only" (ไม่ส่ง plaintext)
/// - เมื่อ ReceiveMessage แล้วให้ DeleteMessage ทันที
///
/// หมายเหตุเรื่อง Auth:
/// - การเรียก SQS จากมือถือ "ห้ามฝัง AWS access key ถาวรในแอป"
/// - วิธีที่ถูกต้องคือใช้ Cognito Identity Pool หรือ API Gateway + Lambda เป็น proxy
/// - โค้ดนี้รองรับโหมด "proxy" ผ่าน HTTPS endpoint (แนะนำ) เพื่อหลีกเลี่ยงการทำ SigV4 ในแอป
class SqsCloudService extends ChangeNotifier {
  SqsCloudService({required DatabaseService database}) : _db = database;

  final DatabaseService _db;
  final _connectivity = Connectivity();

  bool _online = false;
  bool get isOnline => _online;

  StreamSubscription<List<ConnectivityResult>>? _connSub;
  Timer? _syncTimer;

  /// โหมด Proxy Endpoint (แนะนำ)
  ///
  /// สร้าง API Gateway/Lambda ให้ทำงานแทนมือถือ:
  /// - POST /sqs/send
  /// - POST /sqs/receive (คืน message + receiptHandle)
  /// - POST /sqs/delete
  static const proxyBaseUrl = String.fromEnvironment(
    'RESILNET_SQS_PROXY_URL',
    defaultValue: '',
  );

  /// ค่า Queue URL (ใช้ฝั่ง proxy เป็นหลัก)
  static const queueUrl = String.fromEnvironment(
    'RESILNET_SQS_QUEUE_URL',
    defaultValue: '',
  );

  /// เปิด/ปิด cloud sync
  static const enabled = bool.fromEnvironment(
    'RESILNET_SQS_ENABLED',
    defaultValue: false,
  );

  Future<void> start() async {
    final results = await _connectivity.checkConnectivity();
    _online = _hasInternet(results);
    notifyListeners();

    _connSub = _connectivity.onConnectivityChanged.listen((results) async {
      final wasOnline = _online;
      _online = _hasInternet(results);
      notifyListeners();
      if (!wasOnline && _online) unawaited(syncNow());
    });

    _syncTimer = Timer.periodic(const Duration(minutes: 2), (_) {
      if (_online) unawaited(syncNow());
    });

    if (_online) unawaited(syncNow());
  }

  Future<void> stop() async {
    await _connSub?.cancel();
    _syncTimer?.cancel();
    _connSub = null;
    _syncTimer = null;
  }

  bool _hasInternet(List<ConnectivityResult> results) {
    return results.any(
      (r) =>
          r == ConnectivityResult.wifi ||
          r == ConnectivityResult.mobile ||
          r == ConnectivityResult.ethernet,
    );
  }

  /// ซิงก์: ส่งข้อความใหม่ขึ้น SQS + ดึงข้อความใหม่จาก SQS
  Future<void> syncNow() async {
    if (!enabled || !_online) return;
    if (proxyBaseUrl.trim().isEmpty) {
      debugPrint('[SqsCloud] Missing RESILNET_SQS_PROXY_URL');
      return;
    }

    try {
      await _pushPendingEncryptedMessages();
      await _pullAndDelete();
    } catch (e) {
      debugPrint('[SqsCloud] Error: $e');
    }
  }

  /// ส่งขึ้น Cloud: เฉพาะ direct messages ที่มี encryptedPayload/encryptedKey
  Future<void> _pushPendingEncryptedMessages() async {
    final pending = await _db.getMessagesNotSyncedWithCloud();
    if (pending.isEmpty) return;

    for (final m in pending) {
      // บังคับ encrypted-only: ข้าม broadcast เพราะ payload เป็น plaintext(base64) แม้มี signature
      if (m.type == MessageType.broadcast) continue;
      if (m.encryptedPayload.isEmpty ||
          m.encryptedKey.isEmpty ||
          m.signature == null)
        continue;

      final body = _cloudEnvelopeFor(m);
      final resp = await http
          .post(
            Uri.parse('$proxyBaseUrl/sqs/send'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'queueUrl': queueUrl, 'messageBody': body}),
          )
          .timeout(const Duration(seconds: 12));

      if (resp.statusCode >= 200 && resp.statusCode < 300) {
        await _db.markCloudSynced(m.id);
        await _db.updateMessageStatus(
          m.id,
          MessageStatus.sent.name,
        ); // Transmitted
      }
    }
  }

  /// ดึงจาก Cloud: receive → save → delete ทันที
  Future<void> _pullAndDelete() async {
    // ดึงเป็นรอบเล็ก ๆ เพื่อกันค้าง
    for (var i = 0; i < 3; i++) {
      final resp = await http
          .post(
            Uri.parse('$proxyBaseUrl/sqs/receive'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'queueUrl': queueUrl,
              'maxMessages': 5,
              'waitSeconds': 2,
            }),
          )
          .timeout(const Duration(seconds: 15));

      if (resp.statusCode != 200) return;
      final obj = jsonDecode(resp.body) as Map<String, dynamic>;
      final messages = (obj['messages'] as List<dynamic>? ?? <dynamic>[]);
      if (messages.isEmpty) return;

      for (final raw in messages) {
        final mm = raw as Map<String, dynamic>;
        final receipt = mm['receiptHandle'] as String?;
        final body = mm['body'] as String? ?? '';
        if (receipt == null || body.isEmpty) continue;

        final parsed = _parseEnvelope(body);
        if (parsed != null) {
          if (parsed.type == MessageType.broadcast) continue;
          if (!await _db.isMessageDuplicate(parsed.id)) {
            await _db.saveMessage(
              parsed.copyWith(
                status: MessageStatus.delivered,
                isSyncedWithCloud: true,
              ),
            );
          }
        }

        // DeleteMessage ทันทีหลังได้รับ (เคลียร์คิว)
        await http
            .post(
              Uri.parse('$proxyBaseUrl/sqs/delete'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'queueUrl': queueUrl,
                'receiptHandle': receipt,
              }),
            )
            .timeout(const Duration(seconds: 12));
      }
    }
  }

  /// Envelope ที่ขึ้น SQS (Encrypted-only)
  String _cloudEnvelopeFor(ChatMessage m) {
    final envelope = <String, Object?>{
      'v': 1,
      'id': m.id,
      'type': m.type.name,
      'senderId': m.senderId,
      'receiverId': m.receiverId,
      'timestamp': m.timestamp,
      'ttl': m.ttl,
      'encryptedPayload': m.encryptedPayload,
      'encryptedKey': m.encryptedKey,
      'signature': m.signature,
    };
    final jsonStr = jsonEncode(envelope);
    // เพิ่ม checksum กันพังระหว่างทาง
    final sum = crypto.sha256.convert(utf8.encode(jsonStr)).toString();
    return jsonEncode({'sum': sum, 'data': envelope});
  }

  ChatMessage? _parseEnvelope(String body) {
    try {
      final wrap = jsonDecode(body) as Map<String, dynamic>;
      final data = wrap['data'] as Map<String, dynamic>;
      final jsonStr = jsonEncode(data);
      final sum = wrap['sum'] as String?;
      if (sum == null) return null;
      if (crypto.sha256.convert(utf8.encode(jsonStr)).toString() != sum)
        return null;

      return ChatMessage(
        id: data['id'] as String,
        senderId: data['senderId'] as String,
        receiverId: data['receiverId'] as String,
        encryptedPayload: data['encryptedPayload'] as String,
        encryptedKey: data['encryptedKey'] as String,
        signature: data['signature'] as String?,
        ttl: (data['ttl'] as num?)?.toInt() ?? 5,
        timestamp: (data['timestamp'] as num?)?.toInt() ?? 0,
        status: MessageStatus.delivered,
        type: MessageType.values.firstWhere(
          (e) => e.name == (data['type'] as String? ?? MessageType.direct.name),
          orElse: () => MessageType.direct,
        ),
        isSyncedWithCloud: true,
      );
    } catch (_) {
      return null;
    }
  }
}

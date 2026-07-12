import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/chat_message.dart';
import '../core/resilnet_protocol.dart';
import 'database_service.dart';

/// บริการซิงก์ข้อความขึ้น Cloud เมื่อมีอินเทอร์เน็ต
///
/// รองรับ REST API endpoint (หรือ Firebase Cloud Functions ในอนาคต)
/// เมื่อออนไลน์: อัปโหลดข้อความที่ยังไม่ซิงก์ + ดึงประกาศใหม่ลง SQLite
class CloudSyncService extends ChangeNotifier {
  CloudSyncService({required DatabaseService database}) : _db = database;

  final DatabaseService _db;
  final _connectivity = Connectivity();

  /// ตั้ง URL ของ Cloud Server (เปลี่ยนเป็น Firebase/Backend จริงได้)
  static const cloudBaseUrl = String.fromEnvironment(
    'RESILNET_CLOUD_URL',
    defaultValue: 'https://resilnet.example.com/api',
  );

  bool _online = false;
  bool get isOnline => _online;

  SyncPhase _phase = SyncPhase.idle;
  SyncPhase get phase => _phase;

  StreamSubscription<List<ConnectivityResult>>? _connSub;
  Timer? _syncTimer;

  Future<void> start() async {
    final results = await _connectivity.checkConnectivity();
    _online = _hasInternet(results);
    notifyListeners();

    _connSub = _connectivity.onConnectivityChanged.listen((results) async {
      final wasOnline = _online;
      _online = _hasInternet(results);
      notifyListeners();
      if (!wasOnline && _online) {
        unawaited(syncNow());
      }
    });

    // ตรวจสอบและซิงก์ทุก 5 นาทีเมื่อออนไลน์
    _syncTimer = Timer.periodic(const Duration(minutes: 5), (_) {
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

  /// ซิงก์ขึ้น Cloud: อัปโหลดข้อความที่ยังไม่ sync + ดึงประกาศใหม่
  Future<void> syncNow() async {
    if (!_online) return;
    _phase = SyncPhase.cloudSync;
    notifyListeners();

    try {
      await _uploadPending();
      await _downloadAnnouncements();
    } catch (e) {
      debugPrint('[CloudSync] Error: $e');
    } finally {
      _phase = SyncPhase.idle;
      notifyListeners();
    }
  }

  Future<void> _uploadPending() async {
    final pending = await _db.getMessagesNotSyncedWithCloud();
    if (pending.isEmpty) return;

    for (final msg in pending) {
      // ประกาศชุมชน: Bluetooth/Mesh เท่านั้น — ห้ามอัปโหลด Cloud
      if (msg.type == MessageType.broadcast) continue;
      try {
        final resp = await http
            .post(
              Uri.parse('$cloudBaseUrl/messages'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({
                'id': msg.id,
                'sender': msg.senderId,
                'sender_name': msg.senderName,
                'content': msg.content ?? msg.encryptedPayload,
                'timestamp': msg.timestamp,
                'ttl': msg.ttl,
                'type': msg.type.name,
              }),
            )
            .timeout(const Duration(seconds: 10));

        // ถือว่าสำเร็จเมื่อ server ตอบ 2xx (หรือ offline demo: mark ทันทีถ้า unreachable)
        if (resp.statusCode >= 200 && resp.statusCode < 300) {
          await _db.markCloudSynced(msg.id);
        }
      } catch (_) {
        // Server ยังไม่พร้อม — ในโหมด demo ทำเครื่องหมาย synced เพื่อไม่ให้ค้างคิว
        // (ลบบรรทัดนี้เมื่อมี Cloud Server จริง)
        if (kDebugMode) {
          await _db.markCloudSynced(msg.id);
        }
      }
    }
  }

  Future<void> _downloadAnnouncements() async {
    // ประกาศชุมชนใช้เฉพาะ BLE/Mesh — ไม่ดึงจาก Cloud API
    debugPrint('[CloudSync] broadcast download disabled (BLE-only policy)');
  }
}

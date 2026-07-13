import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/broadcast_alert.dart';
import '../models/chat_message.dart';
import 'broadcast_alert_codec.dart';
import 'broadcast_intake_service.dart';
import 'database_service.dart';
import 'fcm_token_service.dart';
import 'init_supabase.dart';
import 'supabase_config.dart';
import 'supabase_row_mapper.dart';

/// Sync กับ Supabase — แชต Direct (E2EE) + Broadcast เตือนภัย (dual-channel)
class SupabaseSyncService extends ChangeNotifier {
  SupabaseSyncService({
    required DatabaseService database,
    required this.supabase,
    required this.myUserId,
    this._broadcastIntake,
  }) : _db = database;

  final DatabaseService _db;
  final SupabaseClient supabase;
  final String myUserId;
  final BroadcastIntakeService? _broadcastIntake;

  /// Called after a direct message is ingested (Realtime / fetch).
  void Function(ChatMessage msg)? onDirectMessageIngested;

  late final PushTriggerService _pushTrigger = PushTriggerService(supabase: supabase);

  RealtimeChannel? _channel;
  bool _running = false;
  bool get running => _running;

  Timer? _pushTimer;

  Future<void> start() async {
    if (_running) return;
    _running = true;
    notifyListeners();

    await ensureSupabaseAuthSession();

    _channel = supabase
        .channel('resilnet-sync')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          callback: (payload) async {
            await _ingestSupabaseRecord(payload.newRecord);
          },
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: SupabaseConfig.emergencyBroadcastsTable,
          callback: (payload) async {
            await _ingestEmergencyBroadcastRecord(payload.newRecord);
          },
        )
        .subscribe();

    _pushTimer = Timer.periodic(const Duration(seconds: 45), (_) async {
      try {
        await pushPending(myUserId: myUserId);
        await pushPendingBroadcasts();
      } catch (_) {}
    });

    unawaited(pushPending(myUserId: myUserId));
    unawaited(pushPendingBroadcasts());
  }

  Future<void> stop() async {
    _running = false;
    _pushTimer?.cancel();
    _pushTimer = null;
    final c = _channel;
    _channel = null;
    if (c != null) {
      await supabase.removeChannel(c);
    }
    notifyListeners();
  }

  /// ตัดการเชื่อมต่อแล้วสมัคร Realtime ใหม่ (ใช้เมื่อแอปกลับจาก background)
  Future<void> reconnect() async {
    await stop();
    await start();
  }

  Future<void> syncNow() async {
    await pushPending(myUserId: myUserId);
    await pushPendingBroadcasts();
  }

  Future<void> pushPending({required String myUserId}) async {
    final pending = await _db.getPendingMessagesForSupabase();
    for (final m in pending) {
      if (m.type != MessageType.direct) continue;
      if (m.encryptedPayload.isEmpty ||
          m.encryptedKey.isEmpty ||
          m.signature == null)
        continue;

      final payload = jsonEncode({
        'v': 1,
        'local_id': m.id,
        'type': m.type.name,
        'sender_id': m.senderId,
        'receiver_id': m.receiverId,
        'timestamp': m.timestamp,
        'ttl': m.ttl,
        'encrypted_payload': m.encryptedPayload,
        'encrypted_key': m.encryptedKey,
        'signature': m.signature,
      });

      final inserted = await supabase
          .from('messages')
          .insert({'payload': payload, 'sender_id': myUserId})
          .select('id')
          .single();

      final cloudId = (inserted['id'] as num).toInt();
      await _db.setCloudIdForLocalMessage(localId: m.id, cloudId: cloudId);
      await _db.updateMessageStatus(m.id, MessageStatus.sent.name);

      if (m.receiverId.isNotEmpty && m.receiverId != ResilNetIds.broadcastReceiverId) {
        unawaited(
          _pushTrigger.sendMessageSignal(
            receiverId: m.receiverId,
            senderId: m.senderId,
            messageId: cloudId.toString(),
          ),
        );
      }
    }
  }

  /// Fetch encrypted row from Supabase by cloud id and ingest locally.
  Future<ChatMessage?> fetchAndIngestDirectMessage(int cloudId) async {
    try {
      final row = await supabase
          .from('messages')
          .select()
          .eq('id', cloudId)
          .maybeSingle();
      if (row == null) return null;
      await _ingestSupabaseRecord(Map<String, dynamic>.from(row));
      return _db.getMessageByCloudId(cloudId);
    } catch (e) {
      debugPrint('[SupabaseSync] fetch cloud message failed: $e');
      return null;
    }
  }

  /// อัปโหลด Broadcast เตือนภัย → ตาราง emergency_broadcasts
  Future<void> pushPendingBroadcasts() async {
    final items = await _db.getPendingBroadcastsForSupabase();
    for (final m in items) {
      try {
        final envelope = BroadcastAlertCodec.envelopeFromMessage(m);
        final loc = envelope.location;

        final inserted = await supabase
            .from(SupabaseConfig.emergencyBroadcastsTable)
            .insert({
              'local_id': m.id,
              'sender_id': m.senderId,
              'payload': envelope.payload,
              'lat': loc.lat,
              'lon': loc.lon,
              'radius_m': loc.radius,
              'broadcast_timestamp': m.timestamp,
              'signature': m.signature,
              'signed_payload': m.encryptedPayload,
              // ttl: ค่า mesh hop — ไม่ส่งเพื่อใช้ default 3600 วินาทีของตาราง
            })
            .select('id')
            .single();

        final cloudId = (inserted['id'] as num).toInt();
        await _db.setCloudIdForLocalMessage(localId: m.id, cloudId: cloudId);
        await _db.markCloudSynced(m.id);
        debugPrint('[SupabaseSync] emergency_broadcast uploaded id=${m.id}');
      } catch (e) {
        debugPrint('[SupabaseSync] emergency_broadcast upload failed: $e');
      }
    }
  }

  Future<void> clearCloudMessagesForUser() async {
    try {
      await supabase.from('messages').delete().eq('sender_id', myUserId);
      await supabase
          .from(SupabaseConfig.emergencyBroadcastsTable)
          .delete()
          .eq('sender_id', myUserId);
      debugPrint(
        '[SupabaseSync] cleared cloud messages + emergency_broadcasts for sender=$myUserId',
      );
    } catch (e) {
      debugPrint('[SupabaseSync] clear cloud messages failed: $e');
    }
  }

  Future<void> _ingestSupabaseRecord(Map<String, dynamic> record) async {
    try {
      final cloudId = (record['id'] as num?)?.toInt();
      final senderId = record['sender_id'] as String? ?? '';
      final payloadText = record['payload'] as String? ?? '';
      if (cloudId == null || payloadText.isEmpty) return;

      final payload = jsonDecode(payloadText) as Map<String, dynamic>;
      final typeName = payload['type'] as String? ?? MessageType.direct.name;
      final localId = (payload['local_id'] as String?)?.trim();

      if (typeName == MessageType.broadcast.name) {
        // legacy: broadcast ใน messages (ก่อนมีตาราง emergency_broadcasts)
        await _ingestBroadcastFromCloud(payload, senderId, cloudId, localId);
        return;
      }

      if (localId != null && localId.isNotEmpty) {
        if (await _db.isMessageDuplicate(localId)) {
          await _db.setCloudIdForLocalMessage(
            localId: localId,
            cloudId: cloudId,
          );
          await _db.updateMessageStatus(localId, MessageStatus.delivered.name);
          return;
        }
      }

      final id = (localId != null && localId.isNotEmpty)
          ? localId
          : 'cloud:$cloudId';
      if (await _db.isMessageDuplicate(id)) return;

      final msg = ChatMessage(
        id: id,
        senderId: payload['sender_id'] as String? ?? senderId,
        receiverId:
            payload['receiver_id'] as String? ??
            ResilNetIds.broadcastReceiverId,
        encryptedPayload: payload['encrypted_payload'] as String? ?? '',
        encryptedKey: payload['encrypted_key'] as String? ?? '',
        signature: payload['signature'] as String?,
        ttl: (payload['ttl'] as num?)?.toInt() ?? 5,
        timestamp:
            (payload['timestamp'] as num?)?.toInt() ??
            DateTime.now().millisecondsSinceEpoch,
        status: MessageStatus.delivered,
        type: MessageType.direct,
        isSyncedWithCloud: true,
      );

      await _db.saveMessage(msg);
      await _db.setCloudIdForLocalMessage(localId: id, cloudId: cloudId);
      onDirectMessageIngested?.call(msg);
    } catch (e) {
      debugPrint('[SupabaseSync] ingest error: $e');
    }
  }

  Future<void> _ingestBroadcastFromCloud(
    Map<String, dynamic> payload,
    String senderId,
    int cloudId,
    String? localId,
  ) async {
    final id = (localId != null && localId.isNotEmpty)
        ? localId
        : 'cloud:broadcast:$cloudId';
    if (await _db.isMessageDuplicate(id)) return;

    final loc = payload['location'];
    AlertLocation? location;
    if (loc is Map) {
      location = AlertLocation.fromJson(Map<String, dynamic>.from(loc));
    }

    final signedPayload = payload['signed_payload'] as String? ?? '';
    final msg = ChatMessage(
      id: id,
      senderId: payload['sender_id'] as String? ?? senderId,
      senderName: payload['sender_name'] as String?,
      receiverId: ResilNetIds.broadcastReceiverId,
      content: payload['payload'] as String?,
      encryptedPayload: signedPayload.isNotEmpty ? signedPayload : '',
      encryptedKey: '',
      signature: payload['signature'] as String?,
      ttl: (payload['ttl'] as num?)?.toInt() ?? 5,
      timestamp:
          (payload['timestamp'] as num?)?.toInt() ??
          DateTime.now().millisecondsSinceEpoch,
      status: MessageStatus.delivered,
      type: MessageType.broadcast,
      isSyncedWithCloud: true,
      alertLat: location?.lat,
      alertLon: location?.lon,
      alertRadiusM: location?.radius,
    );

    if (msg.encryptedPayload.isEmpty) return;

    await _db.saveMessage(msg);
    await _db.setCloudIdForLocalMessage(localId: id, cloudId: cloudId);
    await _broadcastIntake?.processSaved(msg);
    debugPrint('[SupabaseSync] broadcast ingested id=$id');
  }

  /// รับแถวใหม่จากตาราง emergency_broadcasts (Realtime)
  Future<void> _ingestEmergencyBroadcastRecord(
    Map<String, dynamic> record,
  ) async {
    try {
      final cloudId = (record['id'] as num?)?.toInt();
      if (cloudId == null) return;

      final localId = SupabaseRowMapper.pickString(record, ['local_id']);
      final id = localId.isNotEmpty ? localId : 'cloud:eb:$cloudId';
      if (await _db.isMessageDuplicate(id)) return;

      final lat = SupabaseRowMapper.pickDouble(record, [
        'lat',
        'latitude',
        'alert_lat',
      ]);
      final lon = SupabaseRowMapper.pickDouble(record, [
        'lon',
        'longitude',
        'alert_lon',
      ]);
      final radius = SupabaseRowMapper.pickDouble(record, [
        'radius_m',
        'radius',
        'alert_radius_m',
      ]);

      final locJson = record['location'];
      AlertLocation? location;
      if (lat != null && lon != null && radius != null) {
        location = AlertLocation(lat: lat, lon: lon, radius: radius);
      } else if (locJson is Map) {
        location = AlertLocation.fromJson(Map<String, dynamic>.from(locJson));
      }

      final signedPayload = SupabaseRowMapper.pickString(record, [
        'signed_payload',
        'encrypted_payload',
      ]);
      final payloadText = SupabaseRowMapper.pickString(record, [
        'payload',
        'message',
        'content',
      ]);
      final senderId = SupabaseRowMapper.pickString(record, ['sender_id']);
      if (senderId.isEmpty || signedPayload.isEmpty) return;

      final msg = ChatMessage(
        id: id,
        senderId: senderId,
        senderName: null,
        receiverId: ResilNetIds.broadcastReceiverId,
        content: payloadText.isEmpty ? null : payloadText,
        encryptedPayload: signedPayload,
        encryptedKey: '',
        signature: SupabaseRowMapper.pickString(record, ['signature']).isEmpty
            ? null
            : SupabaseRowMapper.pickString(record, ['signature']),
        ttl: SupabaseRowMapper.pickInt(record, ['ttl']) ?? 3600,
        timestamp:
            SupabaseRowMapper.pickInt(record, [
              'broadcast_timestamp',
              'timestamp',
            ]) ??
            DateTime.now().millisecondsSinceEpoch,
        status: MessageStatus.delivered,
        type: MessageType.broadcast,
        isSyncedWithCloud: true,
        alertLat: location?.lat,
        alertLon: location?.lon,
        alertRadiusM: location?.radius,
      );

      await _db.saveMessage(msg);
      await _db.setCloudIdForLocalMessage(localId: id, cloudId: cloudId);
      await _broadcastIntake?.processSaved(msg);
      debugPrint('[SupabaseSync] emergency_broadcast ingested id=$id');
    } catch (e) {
      debugPrint('[SupabaseSync] emergency_broadcast ingest error: $e');
    }
  }
}

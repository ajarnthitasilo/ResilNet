import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../models/chat_message.dart';
import 'broadcast_alert_codec.dart';
import 'geo_service.dart';
import 'trusted_keys_service.dart';

/// ผลการคัดกรองขาเข้า (Identity + Geofencing)
enum BroadcastDisplayDecision { display, relayOnly }

class BroadcastFilterService {
  BroadcastFilterService({required this._trustedKeys});

  final TrustedKeysService _trustedKeys;
  Position? _cachedPosition;
  DateTime? _positionCachedAt;

  Future<Position?> _devicePosition() async {
    final age = _positionCachedAt == null
        ? null
        : DateTime.now().difference(_positionCachedAt!);
    if (_cachedPosition != null &&
        age != null &&
        age < const Duration(seconds: 45)) {
      return _cachedPosition;
    }
    final pos = await GeoService.getCurrentPosition();
    _cachedPosition = pos;
    _positionCachedAt = DateTime.now();
    return pos;
  }

  /// ตรวจสอบว่าควรแสดง/แจ้งเตือนหรือ relay เท่านั้น
  Future<BroadcastDisplayDecision> evaluate(ChatMessage msg) async {
    if (!msg.isBroadcast) return BroadcastDisplayDecision.display;

    if (!_trustedKeys.isTrustedIssuer(msg.senderId)) {
      debugPrint(
        '[BroadcastFilter] relay-only: untrusted sender=${msg.senderId}',
      );
      return BroadcastDisplayDecision.relayOnly;
    }

    final envelope = BroadcastAlertCodec.envelopeFromMessage(msg);
    final loc = envelope.location;

    // legacy / ไม่มีพิกัด → แสดงถ้า trusted
    if (loc.lat == 0 && loc.lon == 0 && loc.radius == double.infinity) {
      return BroadcastDisplayDecision.display;
    }
    if (loc.radius <= 0) {
      debugPrint('[BroadcastFilter] relay-only: invalid radius');
      return BroadcastDisplayDecision.relayOnly;
    }

    final device = await _devicePosition();
    if (device == null) {
      debugPrint('[BroadcastFilter] relay-only: no device GPS for geofence');
      return BroadcastDisplayDecision.relayOnly;
    }

    final dist = GeoService.calculateDistanceMeters(
      lat1: device.latitude,
      lon1: device.longitude,
      lat2: loc.lat,
      lon2: loc.lon,
    );

    if (dist <= loc.radius) {
      debugPrint(
        '[BroadcastFilter] display: dist=${dist.toStringAsFixed(0)}m <= radius=${loc.radius}m',
      );
      return BroadcastDisplayDecision.display;
    }

    debugPrint(
      '[BroadcastFilter] relay-only: outside geofence dist=${dist.toStringAsFixed(0)}m > radius=${loc.radius}m',
    );
    return BroadcastDisplayDecision.relayOnly;
  }

  /// ใช้กรองรายการแสดงผลใน UI
  Future<List<ChatMessage>> filterDisplayable(List<ChatMessage> items) async {
    final out = <ChatMessage>[];
    for (final m in items) {
      if (await evaluate(m) == BroadcastDisplayDecision.display) {
        out.add(m);
      }
    }
    return out;
  }
}

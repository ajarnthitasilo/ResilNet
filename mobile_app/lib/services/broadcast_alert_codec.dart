import 'dart:convert';

import '../models/broadcast_alert.dart';
import '../models/chat_message.dart';

/// เข้ารหัส/ถอดรหัส Broadcast Alert envelope ↔ ChatMessage fields
class BroadcastAlertCodec {
  static String encodeEnvelopeJson(BroadcastAlertEnvelope envelope) {
    return jsonEncode(envelope.toJson());
  }

  static BroadcastAlertEnvelope? decodeEnvelopeFromPayload(
    String signedPayloadB64,
  ) {
    try {
      final raw = utf8.decode(base64Decode(signedPayloadB64));
      final obj = jsonDecode(raw);
      if (obj is Map<String, dynamic>) {
        if (obj.containsKey('location')) {
          return BroadcastAlertEnvelope.fromJson(obj);
        }
        // v1 legacy: plain text only
        return BroadcastAlertEnvelope(
          v: 1,
          senderId: '',
          payload: raw,
          location: const AlertLocation(
            lat: 0,
            lon: 0,
            radius: double.infinity,
          ),
          timestamp: 0,
        );
      }
      return BroadcastAlertEnvelope(
        v: 1,
        senderId: '',
        payload: raw,
        location: const AlertLocation(lat: 0, lon: 0, radius: double.infinity),
        timestamp: 0,
      );
    } catch (_) {
      return null;
    }
  }

  static BroadcastAlertEnvelope envelopeFromMessage(ChatMessage msg) {
    final decoded = decodeEnvelopeFromPayload(msg.encryptedPayload);
    if (decoded != null && decoded.v >= 2) return decoded;
    return BroadcastAlertEnvelope(
      v: 1,
      senderId: msg.senderId,
      senderName: msg.senderName,
      payload: msg.content ?? decoded?.payload ?? '',
      location: AlertLocation(
        lat: msg.alertLat ?? 0,
        lon: msg.alertLon ?? 0,
        radius: msg.alertRadiusM ?? double.infinity,
      ),
      timestamp: msg.timestamp,
    );
  }
}

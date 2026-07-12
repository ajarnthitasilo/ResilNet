import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

/// UUID และค่าคงที่ร่วมกับ ESP32 firmware (esp32_firmware/include/config.h)
class ResilNetProtocol {
  ResilNetProtocol._();

  static final nodeServiceUuid = Uuid.parse(
    'a1b2c3d4-e5f6-7890-abcd-ef1234567890',
  );
  static final nodeSyncCharUuid = Uuid.parse(
    'b2c3d4e5-f6a7-8901-bcde-f12345678901',
  );
  static final nodeInfoCharUuid = Uuid.parse(
    'c3d4e5f6-a7b8-9012-cdef-123456789012',
  );

  /// ชื่อโฆษณา ESP32 Node
  static const nodeAdvName = 'RN-MULE';

  /// โปรโตคอลซิงก์ Mule v2 (รองรับ emergency broadcast + geofence)
  static const muleProtocolVersion = 2;

  /// รัศมีซิงก์โดยประมาณ (เมตร) — ใช้เป็น heuristic ใน UI
  static const syncRangeMeters = 15;

  // ─── LoRa Gateway Wi-Fi UDP (สอดคล้อง esp32_firmware) ───────────────────
  static const gatewaySoftApPrefix = 'ResilNet-Node-';
  static const gatewayIp = '192.168.4.1';
  static const gatewayUdpPort = 4210;
  static const radioMagicHi = 0x52; // 'R'
  static const radioMagicLo = 0x4E; // 'N'
  static const radioMaxPayloadLen = 230;
}

/// สถานะการทำงานของระบบซิงก์
enum SyncPhase {
  idle, // สแตนด์บาย
  scanning, // กำลังค้นหา Node
  syncing, // กำลังซิงก์กับ ESP32
  cloudSync, // กำลังซิงก์ Cloud
}

/// ข้อความรูปแบบ Mule v2 สำหรับแลกเปลี่ยนกับ ESP32
class MuleMessage {
  MuleMessage({
    required this.id,
    required this.sender,
    required this.timestamp,
    required this.payload,
    required this.ttl,
    this.type = 'broadcast',
    this.signedPayload,
    this.signature,
    this.encryptedKey,
    this.lat,
    this.lon,
    this.radiusM,
    this.senderName,
    this.receiverId,
  });

  final String id;
  final String sender;
  final int timestamp;
  final String payload;
  final int ttl;
  final String type;
  final String? signedPayload;
  final String? signature;
  final String? encryptedKey;
  final double? lat;
  final double? lon;
  final double? radiusM;
  final String? senderName;
  final String? receiverId;

  bool get isBroadcast => type == 'broadcast';

  Map<String, Object?> toJson() => {
    'id': id,
    'sender': sender,
    'timestamp': timestamp,
    'payload': payload,
    'ttl': ttl,
    'type': type,
    if (signedPayload != null && signedPayload!.isNotEmpty)
      'signed_payload': signedPayload,
    if (signature != null && signature!.isNotEmpty) 'signature': signature,
    if (encryptedKey != null && encryptedKey!.isNotEmpty)
      'encrypted_key': encryptedKey,
    if (lat != null) 'lat': lat,
    if (lon != null) 'lon': lon,
    if (radiusM != null) 'radius_m': radiusM,
    if (senderName != null && senderName!.isNotEmpty) 'sender_name': senderName,
    if (receiverId != null && receiverId!.isNotEmpty) 'receiver_id': receiverId,
  };

  factory MuleMessage.fromJson(Map<String, dynamic> json) {
    final type = (json['type'] as String?) ?? 'broadcast';
    return MuleMessage(
      id: json['id'] as String,
      sender: json['sender'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      payload: (json['payload'] as String?) ?? '',
      ttl: (json['ttl'] as num?)?.toInt() ?? 5,
      type: type,
      signedPayload: json['signed_payload'] as String?,
      signature: json['signature'] as String?,
      encryptedKey: json['encrypted_key'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      radiusM: (json['radius_m'] as num?)?.toDouble(),
      senderName: json['sender_name'] as String?,
      receiverId: json['receiver_id'] as String?,
    );
  }
}

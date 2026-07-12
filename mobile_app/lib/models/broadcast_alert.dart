/// พิกัดและรัศมีพื้นที่เตือนภัย (เมตร)
class AlertLocation {
  const AlertLocation({
    required this.lat,
    required this.lon,
    required this.radius,
  });

  final double lat;
  final double lon;
  final double radius;

  Map<String, Object?> toJson() => {'lat': lat, 'lon': lon, 'radius': radius};

  factory AlertLocation.fromJson(Map<String, dynamic> json) {
    return AlertLocation(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      radius: (json['radius'] as num).toDouble(),
    );
  }
}

/// โครงสร้าง Payload มาตรฐานสำหรับเตือนภัยฉุกเฉิน (v2)
class BroadcastAlertEnvelope {
  const BroadcastAlertEnvelope({
    required this.v,
    required this.senderId,
    required this.payload,
    required this.location,
    required this.timestamp,
    this.senderName,
  });

  static const currentVersion = 2;

  final int v;
  final String senderId;
  final String payload;
  final AlertLocation location;
  final int timestamp;
  final String? senderName;

  Map<String, Object?> toJson() => {
    'v': v,
    'sender_id': senderId,
    if (senderName != null) 'sender_name': senderName,
    'payload': payload,
    'location': location.toJson(),
    'timestamp': timestamp,
  };

  factory BroadcastAlertEnvelope.fromJson(Map<String, dynamic> json) {
    final loc = json['location'];
    return BroadcastAlertEnvelope(
      v: (json['v'] as num?)?.toInt() ?? 1,
      senderId: (json['sender_id'] as String?) ?? '',
      senderName: json['sender_name'] as String?,
      payload: (json['payload'] as String?) ?? '',
      location: loc is Map
          ? AlertLocation.fromJson(Map<String, dynamic>.from(loc))
          : const AlertLocation(lat: 0, lon: 0, radius: 0),
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );
  }
}

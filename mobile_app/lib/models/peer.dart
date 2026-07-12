class Peer {
  Peer({
    required this.id,
    this.deviceId,
    required this.publicKey,
    this.displayName,
    required this.isVerifiedIssuer,
    required this.isBlocked,
    required this.lastSeen,
  });

  final String id;
  final String? deviceId;
  final String publicKey;
  final String? displayName;
  final bool isVerifiedIssuer;
  final bool isBlocked;
  final int lastSeen;

  Peer copyWith({
    String? id,
    String? deviceId,
    String? publicKey,
    String? displayName,
    bool? isVerifiedIssuer,
    bool? isBlocked,
    int? lastSeen,
  }) {
    return Peer(
      id: id ?? this.id,
      deviceId: deviceId ?? this.deviceId,
      publicKey: publicKey ?? this.publicKey,
      displayName: displayName ?? this.displayName,
      isVerifiedIssuer: isVerifiedIssuer ?? this.isVerifiedIssuer,
      isBlocked: isBlocked ?? this.isBlocked,
      lastSeen: lastSeen ?? this.lastSeen,
    );
  }

  Map<String, Object?> toMap() => {
    'id': id,
    'deviceId': deviceId,
    'publicKey': publicKey,
    'displayName': displayName,
    'isVerifiedIssuer': isVerifiedIssuer ? 1 : 0,
    'isBlocked': isBlocked ? 1 : 0,
    'lastSeen': lastSeen,
  };

  static Peer fromMap(Map<String, Object?> map) {
    return Peer(
      id: map['id'] as String,
      deviceId: map['deviceId'] as String?,
      publicKey: map['publicKey'] as String,
      displayName: map['displayName'] as String?,
      isVerifiedIssuer: (map['isVerifiedIssuer'] as int? ?? 0) == 1,
      isBlocked: (map['isBlocked'] as int? ?? 0) == 1,
      lastSeen: map['lastSeen'] as int? ?? 0,
    );
  }
}

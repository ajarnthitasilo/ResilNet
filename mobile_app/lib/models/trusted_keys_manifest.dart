/// รายการ Public Key Hash ของคณะกรรมการหมู่บ้าน (Verified Issuers)
class TrustedIssuer {
  const TrustedIssuer({required this.id, this.name, this.publicKeyPem});

  final String id;
  final String? name;
  final String? publicKeyPem;

  factory TrustedIssuer.fromJson(Map<String, dynamic> json) {
    return TrustedIssuer(
      id: (json['id'] as String?)?.trim() ?? '',
      name: (json['name'] as String?)?.trim(),
      publicKeyPem:
          (json['public_key_pem'] as String?)?.trim() ??
          (json['publicKeyPem'] as String?)?.trim() ??
          (json['pubKey'] as String?)?.trim(),
    );
  }

  Map<String, Object?> toJson() => {
    'id': id,
    if (name != null) 'name': name,
    if (publicKeyPem != null) 'public_key_pem': publicKeyPem,
  };
}

class TrustedKeysManifest {
  const TrustedKeysManifest({
    required this.version,
    required this.timestamp,
    required this.issuers,
  });

  final int version;
  final int timestamp;
  final List<TrustedIssuer> issuers;

  factory TrustedKeysManifest.fromJson(Map<String, dynamic> json) {
    final raw = json['issuers'] ?? json['trusted_hashes'];
    final issuers = <TrustedIssuer>[];
    if (raw is List) {
      for (final item in raw) {
        if (item is String) {
          final id = item.trim();
          if (id.isNotEmpty) issuers.add(TrustedIssuer(id: id));
        } else if (item is Map) {
          final issuer = TrustedIssuer.fromJson(
            Map<String, dynamic>.from(item),
          );
          if (issuer.id.isNotEmpty) issuers.add(issuer);
        }
      }
    }
    return TrustedKeysManifest(
      version: (json['version'] as num?)?.toInt() ?? 0,
      timestamp:
          (json['timestamp'] as num?)?.toInt() ??
          DateTime.tryParse(
            json['updated_at'] as String? ?? '',
          )?.millisecondsSinceEpoch ??
          0,
      issuers: issuers,
    );
  }

  Map<String, Object?> toJson() => {
    'version': version,
    'timestamp': timestamp,
    'issuers': issuers.map((e) => e.toJson()).toList(),
  };

  bool isNewerThan(TrustedKeysManifest other) {
    if (version > other.version) return true;
    if (version < other.version) return false;
    return timestamp > other.timestamp;
  }
}

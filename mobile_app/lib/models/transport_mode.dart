/// How Area presence / discovery prefers to travel.
enum TransportMode {
  /// BLE (+ LoRa/UDP) only — works offline.
  mesh,

  /// Nostr relays only for Area presence discovery.
  internet,

  /// Prefer mesh when peers nearby; also use Nostr when relays are up.
  auto;

  static TransportMode fromName(String? name) {
    return TransportMode.values.firstWhere(
      (e) => e.name == name,
      orElse: () => TransportMode.auto,
    );
  }

  bool get usesMesh => this == TransportMode.mesh || this == TransportMode.auto;

  bool get usesInternet =>
      this == TransportMode.internet || this == TransportMode.auto;
}

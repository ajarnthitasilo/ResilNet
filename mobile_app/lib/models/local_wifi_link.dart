/// Local Wi‑Fi link modes (no internet required).
enum LocalWifiMode {
  /// Phone hotspot / personal AP — Host or Join.
  hotspot,

  /// Shared router/AP LAN — all peers equal.
  router,
}

/// Fine-grained UI state for local Wi‑Fi linking.
enum LocalWifiPhase {
  idle,
  hostSetup,
  hostWaiting,
  joinSetup,
  joinConnectedLan,
  discovering,
  peersFound,
  routerReady,
  routerNoWifi,
  routerIsolatedHint,
  error,
  stopped,
}

/// A device sighted on the local LAN (stub or real discovery later).
class LocalWifiPeerSighting {
  const LocalWifiPeerSighting({
    required this.id,
    required this.label,
    required this.canMessage,
    this.hostHint,
    this.hostAddress,
    this.compactPk,
    this.isStub = false,
    this.lastSeenMs = 0,
  });

  /// ResilNet peer id (public key hash) when known; otherwise a LAN stub id.
  final String id;
  final String label;
  final bool canMessage;
  final String? hostHint;

  /// IPv4/IPv6 of the peer on the LAN (for unicast DM).
  final String? hostAddress;
  final String? compactPk;
  final bool isStub;
  final int lastSeenMs;

  LocalWifiPeerSighting copyWith({
    String? label,
    bool? canMessage,
    String? hostHint,
    String? hostAddress,
    String? compactPk,
    bool? isStub,
    int? lastSeenMs,
  }) =>
      LocalWifiPeerSighting(
        id: id,
        label: label ?? this.label,
        canMessage: canMessage ?? this.canMessage,
        hostHint: hostHint ?? this.hostHint,
        hostAddress: hostAddress ?? this.hostAddress,
        compactPk: compactPk ?? this.compactPk,
        isStub: isStub ?? this.isStub,
        lastSeenMs: lastSeenMs ?? this.lastSeenMs,
      );
}

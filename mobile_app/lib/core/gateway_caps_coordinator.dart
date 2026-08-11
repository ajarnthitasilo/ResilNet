import '../models/gateway_radio_mode.dart';

/// RN_CAPS handshake phase after SoftAP connects.
enum GatewayCapsPhase {
  disconnected,
  waitingCaps,
  fromCaps,
  loraFallback,
}

/// Coordinates RN_CAPS wait + LoRa-only fallback (default 4s).
class GatewayCapsCoordinator {
  GatewayCapsCoordinator({this.waitTimeout = defaultWaitTimeout});

  static const defaultWaitTimeout = Duration(seconds: 4);

  final Duration waitTimeout;

  GatewayCapsPhase phase = GatewayCapsPhase.disconnected;
  GatewayCaps? caps;
  DateTime? waitStartedAt;

  void onGatewayActive(bool active, DateTime now) {
    if (!active) {
      phase = GatewayCapsPhase.disconnected;
      caps = null;
      waitStartedAt = null;
      return;
    }
    if (phase == GatewayCapsPhase.disconnected) {
      phase = GatewayCapsPhase.waitingCaps;
      waitStartedAt = now;
      caps = null;
    }
  }

  void onCaps(GatewayCaps received) {
    caps = received;
    phase = GatewayCapsPhase.fromCaps;
    waitStartedAt = null;
  }

  /// Returns true when timeout fired and phase moved to [loraFallback].
  bool checkTimeout(DateTime now) {
    if (phase != GatewayCapsPhase.waitingCaps || waitStartedAt == null) {
      return false;
    }
    if (now.difference(waitStartedAt!) < waitTimeout) return false;
    phase = GatewayCapsPhase.loraFallback;
    caps = null;
    waitStartedAt = null;
    return true;
  }

  GatewayAvailability availability() {
    switch (phase) {
      case GatewayCapsPhase.disconnected:
        return const GatewayAvailability(
          loraAvailable: false,
          halowAvailable: false,
          halowLinkUp: false,
          halowStub: false,
          capsKnown: false,
        );
      case GatewayCapsPhase.waitingCaps:
        return const GatewayAvailability(
          loraAvailable: false,
          halowAvailable: false,
          halowLinkUp: false,
          halowStub: false,
          capsKnown: false,
        );
      case GatewayCapsPhase.loraFallback:
        return const GatewayAvailability(
          loraAvailable: true,
          halowAvailable: false,
          halowLinkUp: false,
          halowStub: false,
          capsKnown: true,
        );
      case GatewayCapsPhase.fromCaps:
        final c = caps!;
        return GatewayAvailability(
          loraAvailable: c.loraAvailable,
          halowAvailable: c.halowAvailable,
          halowLinkUp: c.halowLinkUp,
          halowStub: c.halowStub,
          capsKnown: true,
        );
    }
  }
}

class GatewayAvailability {
  const GatewayAvailability({
    required this.loraAvailable,
    required this.halowAvailable,
    required this.halowLinkUp,
    required this.halowStub,
    required this.capsKnown,
  });

  final bool loraAvailable;
  final bool halowAvailable;
  final bool halowLinkUp;
  final bool halowStub;
  final bool capsKnown;
}

import 'dart:async';

import '../core/meshtastic_bridge_core.dart';

/// Pluggable Meshtastic text transport (MQTT / serial / logging).
abstract class MeshtasticTransport {
  Stream<MeshtasticTextEvent> get inbound;
  Future<bool> publish(String text);
  Future<void> close();
}

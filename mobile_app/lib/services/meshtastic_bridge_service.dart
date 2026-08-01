import 'dart:async';

import 'package:flutter/foundation.dart';

import '../core/meshtastic_bridge_core.dart';
import 'meshtastic_transport.dart';
import 'mqtt_meshtastic_transport.dart';

export 'meshtastic_transport.dart';
export 'mqtt_meshtastic_transport.dart';

/// Default: no radio — demo ingest via [simulateInbound], egress to log + history.
class LoggingMeshtasticTransport implements MeshtasticTransport {
  final _controller = StreamController<MeshtasticTextEvent>.broadcast();
  final List<String> egressLog = [];

  @override
  Stream<MeshtasticTextEvent> get inbound => _controller.stream;

  void simulateInbound(String text, {String? fromId}) {
    _controller.add(
      MeshtasticTextEvent(
        text: text,
        fromId: fromId ?? 'demo',
        receivedAtMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<bool> publish(String text) async {
    egressLog.insert(0, text);
    if (egressLog.length > 40) {
      egressLog.removeRange(40, egressLog.length);
    }
    debugPrint('[MeshtasticBridge] egress(demo): $text');
    return true;
  }

  @override
  Future<void> close() async {
    await _controller.close();
  }
}

/// Mutex Mode A / B + loop guards. Wire [onIngest] to AppState.
class MeshtasticBridgeService extends ChangeNotifier {
  MeshtasticBridgeService({
    required Future<void> Function(MeshtasticTextEvent event) onIngest,
    LoggingMeshtasticTransport? logging,
    MqttMeshtasticTransport? mqtt,
  })  : _onIngest = onIngest,
        _logging = logging ?? LoggingMeshtasticTransport(),
        _mqtt = mqtt ?? MqttMeshtasticTransport() {
    _subLogging = _logging.inbound.listen(_handleLoggingInbound);
    _subMqtt = _mqtt.inbound.listen(_handleMqttInbound);
    _mqtt.addListener(_onMqttChanged);
  }

  final Future<void> Function(MeshtasticTextEvent event) _onIngest;
  final LoggingMeshtasticTransport _logging;
  final MqttMeshtasticTransport _mqtt;
  final BridgeDedupeCache _dedupeIn = BridgeDedupeCache();
  final BridgeDedupeCache _dedupeOut = BridgeDedupeCache();

  StreamSubscription<MeshtasticTextEvent>? _subLogging;
  StreamSubscription<MeshtasticTextEvent>? _subMqtt;

  MeshtasticBridgeMode _mode = MeshtasticBridgeMode.off;
  bool _useMqtt = false;
  int _lastInMs = 0;
  int _lastOutMs = 0;
  String? _lastError;
  String? _lastEgressPreview;

  /// Injectable clock for tests.
  int Function() nowMs = () => DateTime.now().millisecondsSinceEpoch;

  MeshtasticBridgeMode get mode => _mode;
  bool get useMqtt => _useMqtt;
  String? get lastError => _lastError;
  String? get lastEgressPreview => _lastEgressPreview;
  LoggingMeshtasticTransport get loggingTransport => _logging;
  MqttMeshtasticTransport get mqttTransport => _mqtt;
  List<String> get egressHistory => List.unmodifiable(_logging.egressLog);

  MqttBridgeConnectionState get mqttConnectionState => _mqtt.connectionState;
  bool get mqttConnected => _mqtt.isConnected;

  /// Mode B may send when using demo logging, or when MQTT is connected.
  bool get canEgress {
    if (!_mode.isEgress) return false;
    if (!_useMqtt) return true;
    return _mqtt.isConnected;
  }

  void _onMqttChanged() => notifyListeners();

  Future<void> setMode(MeshtasticBridgeMode next) async {
    if (_mode == next) return;
    _mode = next;
    _lastError = null;
    notifyListeners();
  }

  void setUseMqtt(bool value) {
    if (_useMqtt == value) return;
    _useMqtt = value;
    _lastError = null;
    notifyListeners();
  }

  Future<void> simulateMeshtasticMessage(String text, {String? fromId}) async {
    if (!_mode.isIngest) {
      _lastError = 'mode_not_ingest';
      notifyListeners();
      return;
    }
    _logging.simulateInbound(text, fromId: fromId);
  }

  Future<bool> connectMqtt() => _mqtt.connect();

  Future<void> disconnectMqtt() => _mqtt.disconnect();

  /// Mode B: publish toward Meshtastic (MQTT if enabled, else demo log).
  Future<bool> egressToMeshtastic(String raw) async {
    if (!_mode.isEgress) {
      _lastError = 'mode_not_egress';
      notifyListeners();
      return false;
    }
    if (_useMqtt && !_mqtt.isConnected) {
      _lastError = 'not_connected';
      notifyListeners();
      return false;
    }
    final now = nowMs();
    if (now - _lastOutMs < MeshtasticBridgeTags.minIntervalMs) {
      _lastError = 'rate_limited';
      notifyListeners();
      return false;
    }
    var text = normalizeBridgeText(raw);
    if (text.isEmpty) {
      _lastError = 'empty';
      notifyListeners();
      return false;
    }
    if (bridgeTextHasTag(text, MeshtasticBridgeTags.viaMeshtastic)) {
      _lastError = 'loop_via_mt';
      notifyListeners();
      return false;
    }
    text = ensureTag(text, MeshtasticBridgeTags.viaResilNet);
    final key = bridgeDedupeKey(text, fromId: 'rn-out', nowMs: now);
    if (!_dedupeOut.accept(key, nowMs: now)) {
      _lastError = 'dedupe';
      notifyListeners();
      return false;
    }

    final ok = _useMqtt
        ? await _mqtt.publish(text)
        : await _logging.publish(text);
    // Always keep a local demo history copy for the UI.
    if (ok && _useMqtt) {
      await _logging.publish(text);
    }
    if (ok) {
      _lastOutMs = now;
      _lastEgressPreview = text;
      _lastError = null;
    } else {
      _lastError = _useMqtt ? (_mqtt.lastError ?? 'publish_failed') : 'publish_failed';
    }
    notifyListeners();
    return ok;
  }

  Future<void> _handleLoggingInbound(MeshtasticTextEvent event) =>
      _handleInbound(event);

  /// MQTT inbound is ignored unless [useMqtt] is on (demo/logging-only mode).
  Future<void> _handleMqttInbound(MeshtasticTextEvent event) async {
    if (!_useMqtt) return;
    await _handleInbound(event);
  }

  Future<void> _handleInbound(MeshtasticTextEvent event) async {
    if (!_mode.isIngest) return;
    final now = nowMs();
    if (now - _lastInMs < MeshtasticBridgeTags.minIntervalMs) {
      _lastError = 'rate_limited';
      notifyListeners();
      return;
    }
    var text = normalizeBridgeText(event.text);
    if (text.isEmpty) return;
    if (bridgeTextHasTag(text, MeshtasticBridgeTags.viaResilNet)) {
      _lastError = 'loop_via_rn';
      notifyListeners();
      return;
    }
    text = ensureTag(text, MeshtasticBridgeTags.viaMeshtastic);
    final key = bridgeDedupeKey(text, fromId: event.fromId, nowMs: now);
    if (!_dedupeIn.accept(key, nowMs: now)) {
      _lastError = 'dedupe';
      notifyListeners();
      return;
    }
    _lastInMs = now;
    _lastError = null;
    await _onIngest(
      MeshtasticTextEvent(
        text: text,
        fromId: event.fromId,
        receivedAtMs: event.receivedAtMs ?? now,
      ),
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _mqtt.removeListener(_onMqttChanged);
    unawaited(_subLogging?.cancel());
    unawaited(_subMqtt?.cancel());
    unawaited(_logging.close());
    unawaited(_mqtt.close());
    _mqtt.dispose();
    super.dispose();
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:uuid/uuid.dart';

import '../core/meshtastic_bridge_core.dart';
import '../core/meshtastic_mqtt_json.dart';
import 'meshtastic_transport.dart';

/// Connection state for MQTT Meshtastic transport (never fake "connected").
enum MqttBridgeConnectionState {
  disconnected,
  connecting,
  connected,
  error,
}

/// MQTT text transport for Meshtastic JSON gateways.
///
/// Publishes `sendtext` JSON downlink; parses uplink text JSON. No protobuf.
class MqttMeshtasticTransport extends ChangeNotifier
    implements MeshtasticTransport {
  MqttMeshtasticTransport();

  final _inbound = StreamController<MeshtasticTextEvent>.broadcast();
  MqttServerClient? _client;
  StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>? _updatesSub;
  bool _userDisconnect = false;

  String host = '';
  int port = 1883;
  String topicIn = 'msh/2/json/#';
  String topicOut = 'msh/2/json/mqtt/';
  String username = '';
  String password = '';
  bool useTls = false;
  bool autoReconnect = false;

  /// Decimal Meshtastic node id of the gateway that will TX downlink (`from`).
  int gatewayFromNodeId = 0;

  /// Optional channel index 0–7 for `sendtext`.
  int? downlinkChannelIndex;

  MqttBridgeConnectionState _state = MqttBridgeConnectionState.disconnected;
  String? lastError;

  MqttBridgeConnectionState get connectionState => _state;
  bool get isConnected => _state == MqttBridgeConnectionState.connected;

  @override
  Stream<MeshtasticTextEvent> get inbound => _inbound.stream;

  void applyConfig({
    required String host,
    required int port,
    required String topicIn,
    required String topicOut,
    String username = '',
    String password = '',
    bool useTls = false,
    bool autoReconnect = false,
    int gatewayFromNodeId = 0,
    int? downlinkChannelIndex,
  }) {
    this.host = host.trim();
    this.port = port;
    this.topicIn = topicIn.trim();
    this.topicOut = topicOut.trim();
    this.username = username;
    this.password = password;
    this.useTls = useTls;
    this.autoReconnect = autoReconnect;
    this.gatewayFromNodeId = gatewayFromNodeId;
    this.downlinkChannelIndex = downlinkChannelIndex;
  }

  Future<bool> connect() async {
    if (host.isEmpty) {
      lastError = 'missing_host';
      _state = MqttBridgeConnectionState.error;
      notifyListeners();
      return false;
    }
    if (topicIn.isEmpty || topicOut.isEmpty) {
      lastError = 'missing_topic';
      _state = MqttBridgeConnectionState.error;
      notifyListeners();
      return false;
    }

    _userDisconnect = false;
    await disconnect(notify: false, userInitiated: false);
    _state = MqttBridgeConnectionState.connecting;
    lastError = null;
    notifyListeners();

    final clientId = 'resilnet-mt-${const Uuid().v4().substring(0, 8)}';
    final client = MqttServerClient.withPort(host, clientId, port);
    client.logging(on: false);
    client.keepAlivePeriod = 30;
    client.autoReconnect = autoReconnect;
    client.resubscribeOnAutoReconnect = true;
    client.connectTimeoutPeriod = 8000;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.onAutoReconnect = _onAutoReconnect;
    client.onAutoReconnected = _onAutoReconnected;

    if (useTls) {
      client.secure = true;
      client.securityContext = SecurityContext.defaultContext;
    }

    final connMess = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .startClean()
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;

    try {
      MqttClientConnectionStatus? status;
      if (username.isNotEmpty) {
        status = await client.connect(username, password);
      } else {
        status = await client.connect();
      }
      if (status?.state != MqttConnectionState.connected) {
        lastError = useTls ? 'connect_failed_tls' : 'connect_failed';
        _state = MqttBridgeConnectionState.error;
        try {
          client.disconnect();
        } catch (_) {}
        _client = null;
        notifyListeners();
        return false;
      }
      _client = client;
      _subscribe(client);
      _updatesSub = client.updates?.listen(_onMessages);
      _state = MqttBridgeConnectionState.connected;
      lastError = null;
      notifyListeners();
      return true;
    } catch (e, st) {
      debugPrint('[MeshtasticBridge] MQTT connect error: $e\n$st');
      lastError = useTls ? 'connect_failed_tls' : 'connect_failed';
      _state = MqttBridgeConnectionState.error;
      try {
        client.disconnect();
      } catch (_) {}
      _client = null;
      notifyListeners();
      return false;
    }
  }

  void _subscribe(MqttServerClient client) {
    try {
      client.subscribe(topicIn, MqttQos.atMostOnce);
    } catch (e, st) {
      debugPrint('[MeshtasticBridge] MQTT subscribe error: $e\n$st');
    }
  }

  Future<void> disconnect({
    bool notify = true,
    bool userInitiated = true,
  }) async {
    if (userInitiated) _userDisconnect = true;
    await _updatesSub?.cancel();
    _updatesSub = null;
    final c = _client;
    _client = null;
    if (c != null) {
      try {
        c.autoReconnect = false;
        c.disconnect();
      } catch (_) {}
    }
    if (_state != MqttBridgeConnectionState.disconnected) {
      _state = MqttBridgeConnectionState.disconnected;
      if (notify) notifyListeners();
    }
  }

  void _onConnected() {
    _state = MqttBridgeConnectionState.connected;
    lastError = null;
    notifyListeners();
  }

  void _onAutoReconnect() {
    _state = MqttBridgeConnectionState.connecting;
    notifyListeners();
  }

  void _onAutoReconnected() {
    final c = _client;
    if (c != null) _subscribe(c);
    _state = MqttBridgeConnectionState.connected;
    lastError = null;
    notifyListeners();
  }

  void _onDisconnected() {
    if (_userDisconnect || !autoReconnect) {
      _state = MqttBridgeConnectionState.disconnected;
    } else {
      // Library may auto-reconnect; show connecting until onAutoReconnected.
      _state = MqttBridgeConnectionState.connecting;
    }
    notifyListeners();
  }

  void _onMessages(List<MqttReceivedMessage<MqttMessage>> events) {
    for (final event in events) {
      final msg = event.payload;
      if (msg is! MqttPublishMessage) continue;
      final bytes = msg.payload.message;
      final raw = MqttPublishPayload.bytesToStringAsString(bytes);
      final parsed = parseMeshtasticMqttInbound(raw);
      if (parsed == null) continue;
      final fromId = parsed.fromId ?? event.topic;
      _inbound.add(
        MeshtasticTextEvent(
          text: parsed.text,
          fromId: fromId,
          receivedAtMs: DateTime.now().millisecondsSinceEpoch,
        ),
      );
    }
  }

  /// Test helper: inject an inbound MQTT text event without a live broker.
  @visibleForTesting
  void debugInjectInbound(String text, {String? fromId}) {
    if (_inbound.isClosed) return;
    _inbound.add(
      MeshtasticTextEvent(
        text: text,
        fromId: fromId ?? 'mqtt-test',
        receivedAtMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  @override
  Future<bool> publish(String text) async {
    final client = _client;
    if (client == null ||
        client.connectionStatus?.state != MqttConnectionState.connected) {
      lastError = 'not_connected';
      notifyListeners();
      return false;
    }
    if (gatewayFromNodeId == 0) {
      lastError = 'missing_from_node';
      notifyListeners();
      return false;
    }
    try {
      final envelope = encodeMeshtasticSendText(
        text: text,
        fromNodeId: gatewayFromNodeId,
        channel: downlinkChannelIndex,
      );
      final builder = MqttClientPayloadBuilder()..addString(envelope);
      client.publishMessage(topicOut, MqttQos.atMostOnce, builder.payload!);
      return true;
    } catch (e, st) {
      debugPrint('[MeshtasticBridge] MQTT publish error: $e\n$st');
      lastError = 'publish_failed';
      notifyListeners();
      return false;
    }
  }

  @override
  Future<void> close() async {
    await disconnect(notify: false, userInitiated: true);
    if (!_inbound.isClosed) {
      await _inbound.close();
    }
  }

  @override
  void dispose() {
    unawaited(close());
    super.dispose();
  }
}

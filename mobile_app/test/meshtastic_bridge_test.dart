import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/meshtastic_bridge_core.dart';
import 'package:resilnet/services/meshtastic_bridge_service.dart';
import 'package:resilnet/services/mqtt_meshtastic_transport.dart';

void main() {
  group('core helpers', () {
    test('normalizeBridgeText collapses whitespace and truncates', () {
      expect(normalizeBridgeText('  a   b  '), 'a b');
      final long = 'x' * 200;
      final out = normalizeBridgeText(long);
      expect(out.length, MeshtasticBridgeTags.maxTextChars);
      expect(out.endsWith('…'), isTrue);
    });

    test('ensureTag always fits max and keeps tag', () {
      final body = 'y' * 200;
      final tagged = ensureTag(body, MeshtasticBridgeTags.viaMeshtastic);
      expect(tagged.length, lessThanOrEqualTo(MeshtasticBridgeTags.maxTextChars));
      expect(
        bridgeTextHasTag(tagged, MeshtasticBridgeTags.viaMeshtastic),
        isTrue,
      );
      expect(tagged.startsWith(MeshtasticBridgeTags.viaMeshtastic), isTrue);
    });

    test('stripBridgeTags removes both tags', () {
      final raw =
          '${MeshtasticBridgeTags.viaMeshtastic} hello ${MeshtasticBridgeTags.viaResilNet}';
      expect(stripBridgeTags(raw), 'hello');
    });

    test('synthetic sender helpers', () {
      expect(meshtasticSyntheticSenderId('node1'), 'mt:node1');
      expect(isMeshtasticSyntheticSender('mt:node1'), isTrue);
      expect(isMeshtasticSyntheticSender('abcd1234'), isFalse);
      expect(
        meshtasticNoticeSenderLabel('mt:alpha'),
        'Meshtastic · alpha',
      );
    });

    test('shouldRelayMeshtasticToMesh defaults to off path', () {
      expect(
        shouldRelayMeshtasticToMesh(relayEnabled: false, e2eeEnabled: true),
        isFalse,
      );
      expect(
        shouldRelayMeshtasticToMesh(relayEnabled: true, e2eeEnabled: false),
        isFalse,
      );
      expect(
        shouldRelayMeshtasticToMesh(relayEnabled: true, e2eeEnabled: true),
        isTrue,
      );
    });
  });

  group('MeshtasticBridgeService', () {
    late List<MeshtasticTextEvent> ingested;
    late MeshtasticBridgeService service;
    late LoggingMeshtasticTransport logging;
    late MqttMeshtasticTransport mqtt;
    late Completer<void> ingestGate;
    late int clock;

    Future<void> waitIngest() async {
      await ingestGate.future.timeout(const Duration(seconds: 2));
      ingestGate = Completer<void>();
    }

    setUp(() {
      ingested = [];
      clock = 1_000_000;
      ingestGate = Completer<void>();
      logging = LoggingMeshtasticTransport();
      mqtt = MqttMeshtasticTransport();
      service = MeshtasticBridgeService(
        onIngest: (e) async {
          ingested.add(e);
          if (!ingestGate.isCompleted) ingestGate.complete();
        },
        logging: logging,
        mqtt: mqtt,
      );
      service.nowMs = () => clock;
      service.setUseMqtt(false);
    });

    tearDown(() {
      service.dispose();
    });

    test('mutex: A then B leaves only B', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      expect(service.mode.isIngest, isTrue);
      await service.setMode(MeshtasticBridgeMode.egressB);
      expect(service.mode.isEgress, isTrue);
      expect(service.mode.isIngest, isFalse);
    });

    test('mutex: B then A leaves only A', () async {
      await service.setMode(MeshtasticBridgeMode.egressB);
      await service.setMode(MeshtasticBridgeMode.ingestA);
      expect(service.mode.isIngest, isTrue);
      expect(service.mode.isEgress, isFalse);
    });

    test('inbound with [via:rn] is dropped', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      await service.simulateMeshtasticMessage(
        '${MeshtasticBridgeTags.viaResilNet} bounce',
      );
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(ingested, isEmpty);
      expect(service.lastError, 'loop_via_rn');
    });

    test('egress with [via:mt] is rejected', () async {
      await service.setMode(MeshtasticBridgeMode.egressB);
      final ok = await service.egressToMeshtastic(
        '${MeshtasticBridgeTags.viaMeshtastic} no',
      );
      expect(ok, isFalse);
      expect(service.lastError, 'loop_via_mt');
    });

    test('successful ingest tags [via:mt]', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      await service.simulateMeshtasticMessage('hello mesh');
      await waitIngest();
      expect(ingested, hasLength(1));
      expect(
        bridgeTextHasTag(ingested.first.text, MeshtasticBridgeTags.viaMeshtastic),
        isTrue,
      );
    });

    test('rate limit rejects rapid ingest', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      await service.simulateMeshtasticMessage('one');
      await waitIngest();
      await service.simulateMeshtasticMessage('two');
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(ingested, hasLength(1));
      expect(service.lastError, 'rate_limited');
    });

    test('dedupe rejects same text in window', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      await service.simulateMeshtasticMessage('same');
      await waitIngest();
      clock += MeshtasticBridgeTags.minIntervalMs + 1;
      await service.simulateMeshtasticMessage('same');
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(ingested, hasLength(1));
      expect(service.lastError, 'dedupe');
    });

    test('egress tags [via:rn] and publishes', () async {
      await service.setMode(MeshtasticBridgeMode.egressB);
      final ok = await service.egressToMeshtastic('outward');
      expect(ok, isTrue);
      expect(service.egressHistory, isNotEmpty);
      expect(
        bridgeTextHasTag(
          service.egressHistory.first,
          MeshtasticBridgeTags.viaResilNet,
        ),
        isTrue,
      );
    });

    test('MQTT mode blocks egress when disconnected', () async {
      service.setUseMqtt(true);
      await service.setMode(MeshtasticBridgeMode.egressB);
      final ok = await service.egressToMeshtastic('blocked');
      expect(ok, isFalse);
      expect(service.lastError, 'not_connected');
      expect(service.canEgress, isFalse);
    });

    test('MQTT inbound ignored when useMqtt is false', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      service.setUseMqtt(false);
      mqtt.debugInjectInbound('from-mqtt-should-drop');
      await Future<void>.delayed(const Duration(milliseconds: 40));
      expect(ingested, isEmpty);
    });

    test('MQTT inbound accepted when useMqtt is true', () async {
      await service.setMode(MeshtasticBridgeMode.ingestA);
      service.setUseMqtt(true);
      mqtt.debugInjectInbound('from-mqtt-ok');
      await waitIngest();
      expect(ingested, hasLength(1));
      expect(ingested.first.text, contains('from-mqtt-ok'));
    });
  });
}

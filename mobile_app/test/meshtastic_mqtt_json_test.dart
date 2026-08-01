import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/meshtastic_mqtt_json.dart';

void main() {
  group('topic helpers', () {
    test('buildMeshtasticJsonTopicRoot', () {
      expect(buildMeshtasticJsonTopicRoot(), 'msh/2/json');
      expect(buildMeshtasticJsonTopicRoot(region: 'US'), 'msh/US/2/json');
      expect(buildMeshtasticJsonTopicRoot(region: '  EU '), 'msh/EU/2/json');
    });

    test('resolveMeshtasticTopicRoot prefers region over existing root', () {
      expect(
        resolveMeshtasticTopicRoot(
          region: 'US',
          topicRoot: 'msh/2/json',
        ),
        'msh/US/2/json',
      );
      expect(
        resolveMeshtasticTopicRoot(
          region: '',
          topicRoot: 'msh/2/json/',
        ),
        'msh/2/json',
      );
      expect(
        resolveMeshtasticTopicRoot(region: null, topicRoot: null),
        'msh/2/json',
      );
    });

    test('build subscribe / publish topics', () {
      expect(buildMeshtasticTopicIn('msh/2/json'), 'msh/2/json/#');
      expect(buildMeshtasticTopicIn('msh/2/json/'), 'msh/2/json/#');
      expect(
        buildMeshtasticTopicOut('msh/US/2/json'),
        'msh/US/2/json/mqtt/',
      );
      expect(
        buildMeshtasticTopicOut('msh/2/json', downlinkChannel: 'LongFast'),
        'msh/2/json/LongFast/',
      );
    });
  });

  group('parseMeshtasticMqttInbound', () {
    test('plaintext passthrough', () {
      final p = parseMeshtasticMqttInbound('hello plain');
      expect(p?.text, 'hello plain');
    });

    test('Meshtastic uplink text with payload.text', () {
      final raw = jsonEncode({
        'channel': 0,
        'from': 2711401735,
        'id': 917327550,
        'payload': {'text': 'klk'},
        'sender': '!00000004',
        'timestamp': 0,
        'type': 'text',
        'to': 4294967295,
      });
      final p = parseMeshtasticMqttInbound(raw);
      expect(p, isNotNull);
      expect(p!.text, 'klk');
      expect(p.fromId, '!00000004');
      expect(p.type, 'text');
    });

    test('payload string text', () {
      final raw = jsonEncode({
        'type': 'text',
        'from': 42,
        'payload': 'hi there',
      });
      final p = parseMeshtasticMqttInbound(raw);
      expect(p?.text, 'hi there');
      expect(p?.fromId, '42');
    });

    test('ignores telemetry and sendtext downlink echoes', () {
      expect(
        parseMeshtasticMqttInbound(
          jsonEncode({
            'type': 'telemetry',
            'payload': {'battery': 1},
          }),
        ),
        isNull,
      );
      expect(
        parseMeshtasticMqttInbound(
          jsonEncode({
            'type': 'sendtext',
            'from': 1,
            'payload': 'should not ingest',
          }),
        ),
        isNull,
      );
    });
  });

  group('encodeMeshtasticSendText', () {
    test('minimal sendtext envelope', () {
      final raw = encodeMeshtasticSendText(
        text: 'hello',
        fromNodeId: 2130636288,
      );
      final map = jsonDecode(raw) as Map<String, dynamic>;
      expect(map['type'], 'sendtext');
      expect(map['from'], 2130636288);
      expect(map['payload'], 'hello');
      expect(map.containsKey('channel'), isFalse);
    });

    test('optional channel and to', () {
      final raw = encodeMeshtasticSendText(
        text: 'dm',
        fromNodeId: 10,
        channel: 1,
        toNodeId: 99,
      );
      final map = jsonDecode(raw) as Map<String, dynamic>;
      expect(map['channel'], 1);
      expect(map['to'], 99);
    });
  });

  group('meshtasticNodeIdToDecimal', () {
    test('parses !hex and decimal', () {
      expect(meshtasticNodeIdToDecimal('!7efeee00'), 2130636288);
      expect(meshtasticNodeIdToDecimal('2130636288'), 2130636288);
      expect(meshtasticNodeIdToDecimal(''), isNull);
    });
  });
}

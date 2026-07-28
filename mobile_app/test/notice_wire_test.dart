import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/notice_wire.dart';
import 'package:resilnet/models/local_notice.dart';

void main() {
  group('parseNoticeWire', () {
    test('parses geo notice JSON', () {
      final wire = parseNoticeWire(
        '{"v":1,"type":"notice","noticeId":"n1","scope":"geo",'
        '"channel":"#abc","text":"hello","urgent":false,'
        '"createdAt":1000,"expiresAt":2000,"senderId":"peer-a"}',
      );
      expect(wire, isNotNull);
      expect(wire!.noticeId, 'n1');
      expect(wire.scope, 'geo');
      expect(wire.text, 'hello');
      expect(wire.senderId, 'peer-a');
      final notice = wire.toLocalNotice();
      expect(notice.channelLabel, '#abc');
      expect(notice.isExpired, isTrue);
    });

    test('rejects invalid or empty payloads', () {
      expect(parseNoticeWire(''), isNull);
      expect(parseNoticeWire('{"type":"chat"}'), isNull);
      expect(parseNoticeWire('{"type":"notice","text":""}'), isNull);
    });
  });

  group('encodeNoticeWire', () {
    test('round-trips through parse', () {
      final notice = LocalNotice(
        id: 'id-1',
        scope: 'geo',
        channelLabel: '#area',
        text: 'meet here',
        createdAt: 1234,
        expiresAt: null,
        urgent: true,
      );
      final json = encodeNoticeWire(notice: notice, senderId: 'me');
      final wire = parseNoticeWire(json);
      expect(wire, isNotNull);
      expect(wire!.noticeId, 'id-1');
      expect(wire.urgent, isTrue);
      expect(wire.senderId, 'me');
    });
  });
}

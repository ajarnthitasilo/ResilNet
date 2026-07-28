import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/geohash.dart';
import 'package:resilnet/core/notice_wire.dart';
import 'package:resilnet/models/local_notice.dart';

void main() {
  group('geo notice bulletin ingest', () {
    test('parseNoticeWire produces geo notice for scope filter', () {
      final wire = parseNoticeWire(
        '{"v":1,"type":"notice","noticeId":"n-geo-1","scope":"geo",'
        '"channel":"#w7k3","text":"test bulletin","urgent":false,'
        '"createdAt":${DateTime.now().millisecondsSinceEpoch},'
        '"expiresAt":${DateTime.now().add(const Duration(days: 7)).millisecondsSinceEpoch},'
        '"senderId":"peer-b"}',
      );
      expect(wire, isNotNull);
      expect(wire!.scope, 'geo');

      final notice = wire.toLocalNotice();
      expect(notice.isExpired, isFalse);
      expect(notice.text, 'test bulletin');

      final geoNotices = [notice].where((n) => n.scope == 'geo').toList();
      expect(geoNotices, hasLength(1));
    });

    test('Geohash.matchesChannel accepts parent cell subscription', () {
      const full = 'w7k3x8y2z';
      const channel = 'w7k3';
      expect(Geohash.matchesChannel(full, channel), isTrue);
      expect(Geohash.matchesChannel('abcd', channel), isFalse);
    });
  });
}

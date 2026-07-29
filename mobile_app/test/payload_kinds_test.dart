import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/payload_kinds.dart';

void main() {
  test('notice is not chat visible', () {
    expect(PayloadKinds.isChatVisible(PayloadKinds.notice), isFalse);
    expect(PayloadKinds.isChatVisible(PayloadKinds.text), isTrue);
    expect(PayloadKinds.isChatVisible(PayloadKinds.presence), isFalse);
  });

  test('private DM excludes area fan-out and system', () {
    expect(PayloadKinds.isPrivateDm(PayloadKinds.text), isTrue);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.audio), isTrue);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.areaPublic), isFalse);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.system), isFalse);
    expect(PayloadKinds.isPrivateDm(PayloadKinds.notice), isFalse);
  });
}

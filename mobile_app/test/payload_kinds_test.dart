import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/payload_kinds.dart';

void main() {
  test('notice is not chat visible', () {
    expect(PayloadKinds.isChatVisible(PayloadKinds.notice), isFalse);
    expect(PayloadKinds.isChatVisible(PayloadKinds.text), isTrue);
    expect(PayloadKinds.isChatVisible(PayloadKinds.presence), isFalse);
  });
}

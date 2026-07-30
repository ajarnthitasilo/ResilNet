import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/core/resilnet_protocol.dart';

void main() {
  test('MuleMessage bulletin round-trips through ESP32 sync JSON', () {
    final mule = MuleMessage(
      id: 'b-001',
      sender: 'alice-id',
      timestamp: 1700000000000,
      payload: '{"type":"mesh_bulletin","bulletinId":"b-001"}',
      ttl: 5,
      type: 'bulletin',
    );
    final round = MuleMessage.fromJson(
      Map<String, dynamic>.from(mule.toJson()),
    );
    expect(round.type, 'bulletin');
    expect(round.isBroadcast, isFalse);
    expect(round.payload, mule.payload);
    expect(round.id, 'b-001');
  });

  test('legacy broadcast is still flagged as broadcast', () {
    final legacy = MuleMessage(
      id: 'x',
      sender: 's',
      timestamp: 0,
      payload: 'p',
      ttl: 3,
    );
    expect(legacy.isBroadcast, isTrue);
  });
}

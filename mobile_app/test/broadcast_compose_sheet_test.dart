import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/models/broadcast_alert.dart';
import 'package:resilnet/screens/broadcast_compose_sheet.dart';

void main() {
  testWidgets('submit returns text, default center, and updated radius', (
    tester,
  ) async {
    BroadcastComposeResult? result;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    result = await showModalBottomSheet<BroadcastComposeResult>(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => const BroadcastComposeSheet(),
                    );
                  },
                  child: const Text('เปิดฟอร์ม'),
                ),
              ),
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('เปิดฟอร์ม'));
    await tester.pump();
    // ไม่ใช้ pumpAndSettle — FlutterMap โหลด tile จากเน็ตทำให้ค้าง
    for (var i = 0; i < 30; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.textContaining('18.78830'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'ทดสอบเตือนภัย');
    await tester.drag(find.byType(Slider), const Offset(80, 0));
    await tester.pump();

    await tester.tap(find.text('ส่งเตือนภัย (Internet + Mesh)'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(result, isNotNull);
    expect(result!.text, 'ทดสอบเตือนภัย');
    expect(result!.location.lat, closeTo(18.7883, 0.0001));
    expect(result!.location.lon, closeTo(98.9853, 0.0001));
    // รัศมีเปลี่ยนจาก slider (ค่าเริ่ม 2000 m)
    expect(result!.location.radius, greaterThan(2000));
    expect(result!.location.radius, lessThanOrEqualTo(20_000));
  });

  test('AlertLocation in result is ready for Supabase envelope fields', () {
    const result = BroadcastComposeResult(
      text: 'ข้อความ',
      location: AlertLocation(lat: 18.79, lon: 98.99, radius: 1500),
    );

    expect(result.location.lat, 18.79);
    expect(result.location.lon, 98.99);
    expect(result.location.radius, 1500);
  });
}

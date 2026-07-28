import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/l10n/app_localizations.dart';
import 'package:resilnet/screens/voice_record_sheet.dart';

void main() {
  group('formatVoiceRecordTimerMs', () {
    test('formats centiseconds like Voice Memos', () {
      expect(formatVoiceRecordTimerMs(0), '00:00.00');
      expect(formatVoiceRecordTimerMs(4940), '00:04.94');
      expect(formatVoiceRecordTimerMs(65000), '01:05.00');
    });
  });

  group('showVoiceRecordSheet', () {
    testWidgets('compact panel shows tap-to-start', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Center(
                  child: FilledButton(
                    onPressed: () => showVoiceRecordSheet(context),
                    child: const Text('open'),
                  ),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      expect(find.text('Tap to record voice message'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    test('panel height is compact not full screen', () {
      expect(kVoiceRecordPanelHeight, lessThan(320));
      expect(kVoiceRecordPanelHeight, greaterThan(200));
    });
  });
}

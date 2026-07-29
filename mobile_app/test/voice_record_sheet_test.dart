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

    test('panel height fits preview action bar', () {
      expect(kVoiceRecordPanelHeight, greaterThanOrEqualTo(280));
      expect(kVoiceRecordPanelHeight, lessThan(360));
    });

    testWidgets('preview actions show discard, re-record, and send', (tester) async {
      var discarded = false;
      var reRecorded = false;
      var sent = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: VoicePreviewActions(
              discardLabel: 'Discard',
              reRecordLabel: 'Record again',
              sendLabel: 'Send voice note',
              onDiscard: () => discarded = true,
              onReRecord: () => reRecorded = true,
              onSend: () => sent = true,
            ),
          ),
        ),
      );

      expect(find.text('Discard'), findsOneWidget);
      expect(find.text('Record again'), findsOneWidget);
      expect(find.text('Send voice note'), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline_rounded), findsOneWidget);
      expect(find.byIcon(Icons.mic_none_rounded), findsOneWidget);
      expect(find.byIcon(Icons.send_rounded), findsOneWidget);

      await tester.tap(find.byIcon(Icons.send_rounded));
      expect(sent, isTrue);
      expect(discarded, isFalse);
      expect(reRecorded, isFalse);
    });
  });
}

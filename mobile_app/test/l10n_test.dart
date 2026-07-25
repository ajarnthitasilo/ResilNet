import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/l10n/app_localizations.dart';

void main() {
  testWidgets('AppLocalizations resolves Thai and English', (tester) async {
    late AppLocalizations th;
    late AppLocalizations en;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('th'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            th = AppLocalizations.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(th.settings, 'การตั้งค่า');
    expect(th.languageThai, 'ไทย');

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Builder(
          builder: (context) {
            en = AppLocalizations.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(en.settings, 'Settings');
    expect(en.feedMesh, '#mesh');
    expect(en.meshFooter(2, 'ready', 15), contains('2'));
  });
}

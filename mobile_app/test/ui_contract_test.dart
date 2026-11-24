import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resilnet/app/theme.dart';
import 'package:resilnet/app/tokens.dart';
import 'package:resilnet/widgets/cached_future_builder.dart';
import 'package:resilnet/widgets/page_shell.dart';

/// Phase 0 safety net for the redesign.
///
/// These pin the behaviour the redesign depends on — cached queries, semantic
/// colours in both themes, and the page background sitting behind the app bar —
/// so a later restyle that breaks them fails here instead of on a phone.
void main() {
  group('CachedFutureBuilder', () {
    testWidgets('loads once across rebuilds with the same epoch', (
      tester,
    ) async {
      var loads = 0;
      Widget build(int epoch) => MaterialApp(
        home: CachedFutureBuilder<int>(
          epoch: epoch,
          load: () async {
            loads++;
            return loads;
          },
          builder: (_, snap) => Text(
            'loads=$loads data=${snap.data ?? '-'}',
            textDirection: TextDirection.ltr,
          ),
        ),
      );

      await tester.pumpWidget(build(1));
      await tester.pumpAndSettle();
      expect(loads, 1);

      // Many rebuilds at the same epoch: this is the every-notification case
      // that used to re-query SQLite on each tick.
      for (var i = 0; i < 5; i++) {
        await tester.pumpWidget(build(1));
        await tester.pumpAndSettle();
      }
      expect(loads, 1);
    });

    testWidgets('reloads when the epoch changes', (tester) async {
      var loads = 0;
      Widget build(int epoch) => MaterialApp(
        home: CachedFutureBuilder<int>(
          epoch: epoch,
          load: () async {
            loads++;
            return loads;
          },
          builder: (_, _) => const SizedBox.shrink(),
        ),
      );

      await tester.pumpWidget(build(1));
      await tester.pumpAndSettle();
      await tester.pumpWidget(build(2));
      await tester.pumpAndSettle();
      await tester.pumpWidget(build(3));
      await tester.pumpAndSettle();
      expect(loads, 3);
    });

    testWidgets('keeps showing data while a rebuild happens', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CachedFutureBuilder<String>(
            epoch: 'same',
            load: () async => 'ready',
            builder: (_, snap) =>
                Text(snap.data ?? 'loading', textDirection: TextDirection.ltr),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('ready'), findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: CachedFutureBuilder<String>(
            epoch: 'same',
            load: () async => 'ready',
            builder: (_, snap) =>
                Text(snap.data ?? 'loading', textDirection: TextDirection.ltr),
          ),
        ),
      );
      await tester.pump();
      // No flicker back to the loading state — that regression was visible as
      // the peer list blanking on every mesh tick.
      expect(find.text('ready'), findsOneWidget);
      expect(find.text('loading'), findsNothing);
    });
  });

  group('ResilNetTokens', () {
    test('both themes register the extension', () {
      expect(ResilNetTheme.dark().extension<ResilNetTokens>(), isNotNull);
      expect(ResilNetTheme.light().extension<ResilNetTokens>(), isNotNull);
    });

    test('light and dark differ where readability depends on it', () {
      const d = ResilNetTokens.dark;
      const l = ResilNetTokens.light;
      expect(d.pickerSurface, isNot(l.pickerSurface));
      expect(d.inviteBanner, isNot(l.inviteBanner));
      expect(d.bubbleMine, isNot(l.bubbleMine));
      expect(d.danger, isNot(l.danger));
    });

    testWidgets('context.tokens falls back under a bare ThemeData', (
      tester,
    ) async {
      late ResilNetTokens darkTokens;
      late ResilNetTokens lightTokens;
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(brightness: Brightness.light),
          home: Builder(
            builder: (context) {
              lightTokens = context.tokens;
              return Theme(
                data: ThemeData(brightness: Brightness.dark),
                child: Builder(
                  builder: (innerContext) {
                    darkTokens = innerContext.tokens;
                    return const SizedBox.shrink();
                  },
                ),
              );
            },
          ),
        ),
      );
      expect(lightTokens.pickerSurface, ResilNetTokens.light.pickerSurface);
      expect(darkTokens.pickerSurface, ResilNetTokens.dark.pickerSurface);
    });

    testWidgets('tokens resolve from the real app themes', (tester) async {
      // MaterialApp animates its theme, so the extension reaching a widget is
      // a lerped copy — compare values, not identity.
      for (final entry in {
        ResilNetTheme.light(): ResilNetTokens.light,
        ResilNetTheme.dark(): ResilNetTokens.dark,
      }.entries) {
        late ResilNetTokens seen;
        await tester.pumpWidget(
          MaterialApp(
            theme: entry.key,
            home: Builder(
              builder: (context) {
                seen = context.tokens;
                return const SizedBox.shrink();
              },
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(seen.brand, entry.value.brand);
        expect(seen.pickerSurface, entry.value.pickerSurface);
        expect(seen.readReceipt, entry.value.readReceipt);
      }
    });
  });

  group('ResilNetPage', () {
    testWidgets('paints the gradient behind the scaffold, app bar included', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ResilNetTheme.dark(),
          home: ResilNetPage(
            appBar: AppBar(title: const Text('t')),
            body: const SizedBox.shrink(),
          ),
        ),
      );

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, Colors.transparent);

      // The gradient must be an ANCESTOR of the Scaffold; when it lived inside
      // `body` the app bar sat on a flat background instead.
      final decorated = find
          .ancestor(
            of: find.byType(Scaffold),
            matching: find.byType(DecoratedBox),
          )
          .evaluate()
          .map((e) => (e.widget as DecoratedBox).decoration)
          .whereType<BoxDecoration>()
          .where((d) => d.gradient != null)
          .toList();
      expect(decorated, isNotEmpty);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:resilnet/app/theme.dart';
import 'package:resilnet/l10n/l10n_ext.dart';
import 'package:resilnet/models/feed_channel.dart';
import 'package:resilnet/screens/chat_list_screen.dart';
import 'package:resilnet/state/app_state.dart';
import 'package:resilnet/widgets/mesh_status_bar.dart';

/// Home-screen chrome contract.
///
/// The redesign moved the channel switch into a bottom tab bar and the
/// connection pickers into the network panel. These tests pin what must stay
/// true: three labelled channel tabs, the status bar, and an overflow menu that
/// still reaches every destination the old app bar had — including the ones the
/// icons used to open.
///
/// Rendered with an uninitialised [AppState] (radios never start), which is
/// enough for the chrome.
void main() {
  Future<AppState> pumpHome(WidgetTester tester, {ThemeData? theme}) async {
    final state = AppState();
    addTearDown(state.dispose);
    await tester.pumpWidget(
      ChangeNotifierProvider<AppState>.value(
        value: state,
        child: MaterialApp(
          theme: theme ?? ResilNetTheme.light(),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en'),
          home: const ChatListScreen(),
        ),
      ),
    );
    await tester.pump();
    return state;
  }

  testWidgets('shows one tab per feed channel, labelled', (tester) async {
    final state = await pumpHome(tester);

    final bar = tester.widget<NavigationBar>(find.byType(NavigationBar));
    expect(bar.destinations.length, FeedChannel.values.length);
    expect(find.text('Chat'), findsWidgets);
    expect(find.text('#mesh'), findsWidgets);
    expect(find.text('Area'), findsWidgets);
    // Tabs follow the channel in state, so the selection cannot drift.
    expect(bar.selectedIndex, FeedChannel.values.indexOf(state.feedChannel));
  });

  testWidgets('keeps the mesh status bar on the home screen', (tester) async {
    await pumpHome(tester);
    expect(find.byType(MeshStatusBar), findsOneWidget);
  });

  testWidgets('app bar is down to the people badge and the overflow menu', (
    tester,
  ) async {
    await pumpHome(tester);

    final appBar = find.byType(AppBar);
    expect(appBar, findsOneWidget);
    // Four unlabelled pickers used to live here; anything beyond the people
    // button means an icon crept back into the app bar.
    final iconButtons = find
        .descendant(of: appBar, matching: find.byType(IconButton))
        .evaluate()
        .length;
    expect(iconButtons, lessThanOrEqualTo(2));
    expect(
      find.descendant(
        of: appBar,
        matching: find.byType(PopupMenuButton<String>),
      ),
      findsOneWidget,
    );
  });

  testWidgets('overflow menu still reaches every destination', (tester) async {
    await pumpHome(tester);

    await tester.tap(find.byType(PopupMenuButton<String>));
    await tester.pumpAndSettle();

    // The network panel replaces the transport/location/bulletin icons, and
    // nothing that was in the old menu was dropped. Labels come from l10n so
    // the test cannot drift from the shipped wording.
    final l10n = await AppLocalizations.delegate.load(const Locale('en'));
    for (final label in [
      l10n.networkPanelTitle,
      l10n.localWifiTitle,
      l10n.appHardRecoverAction,
      l10n.infoOpen,
      l10n.announceOpen,
      l10n.settings,
      l10n.identityQrTooltip,
    ]) {
      expect(find.text(label), findsWidgets, reason: 'missing "$label"');
    }
  });

  testWidgets('renders in both themes', (tester) async {
    await pumpHome(tester, theme: ResilNetTheme.dark());
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(tester.takeException(), isNull);

    await pumpHome(tester, theme: ResilNetTheme.light());
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fa.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_he.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_kn.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_ksw.dart';
import 'app_localizations_ml.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_ms.dart';
import 'app_localizations_my.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pa.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_ur.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fa'),
    Locale('fi'),
    Locale('fr'),
    Locale('gu'),
    Locale('he'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('kn'),
    Locale('ko'),
    Locale('ksw'),
    Locale('ml'),
    Locale('mr'),
    Locale('ms'),
    Locale('my'),
    Locale('nl'),
    Locale('pa'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sv'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('tr'),
    Locale('uk'),
    Locale('ur'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'TW'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ResilNet'**
  String get appTitle;

  /// No description provided for @communityTitle.
  ///
  /// In en, this message translates to:
  /// **'ResilNet'**
  String get communityTitle;

  /// No description provided for @appRefreshing.
  ///
  /// In en, this message translates to:
  /// **'Refreshing ResilNet…'**
  String get appRefreshing;

  /// No description provided for @appRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Refreshed — radios and discovery restarted'**
  String get appRefreshed;

  /// No description provided for @appRefreshFailed.
  ///
  /// In en, this message translates to:
  /// **'Refresh failed: {error}'**
  String appRefreshFailed(String error);

  /// No description provided for @appRefreshTitleHint.
  ///
  /// In en, this message translates to:
  /// **'Double-tap = soft refresh. Long-press = hard recover. Triple-tap = emergency wipe.'**
  String get appRefreshTitleHint;

  /// No description provided for @softRefreshTipTitle.
  ///
  /// In en, this message translates to:
  /// **'If ResilNet feels stuck'**
  String get softRefreshTipTitle;

  /// No description provided for @softRefreshTipBody.
  ///
  /// In en, this message translates to:
  /// **'Double-tap ResilNet (top-left) for a soft radio refresh. If still stuck: long-press the title, use ⋮ → Hard recover, or Settings. Triple-tap is emergency wipe only.'**
  String get softRefreshTipBody;

  /// No description provided for @softRefreshTipGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get softRefreshTipGotIt;

  /// No description provided for @infoSoftRefreshTitle.
  ///
  /// In en, this message translates to:
  /// **'If the app feels stuck'**
  String get infoSoftRefreshTitle;

  /// No description provided for @infoSoftRefreshStepRefresh.
  ///
  /// In en, this message translates to:
  /// **'Double-tap ResilNet (top-left) → soft refresh radios & nearby people'**
  String get infoSoftRefreshStepRefresh;

  /// No description provided for @infoSoftRefreshStepHard.
  ///
  /// In en, this message translates to:
  /// **'Still stuck? Long-press title, or ⋮ / Settings → Hard recover'**
  String get infoSoftRefreshStepHard;

  /// No description provided for @infoSoftRefreshStepWait.
  ///
  /// In en, this message translates to:
  /// **'Wait for the result snackbar, then try again. Session reset keeps your keys.'**
  String get infoSoftRefreshStepWait;

  /// No description provided for @infoSoftRefreshStepWipe.
  ///
  /// In en, this message translates to:
  /// **'Triple-tap = emergency wipe (deletes local data) — only if intentional'**
  String get infoSoftRefreshStepWipe;

  /// No description provided for @appRecoverySection.
  ///
  /// In en, this message translates to:
  /// **'App recovery'**
  String get appRecoverySection;

  /// No description provided for @appRecoverySectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use when the app feels frozen. Soft = title double-tap. Hard recover is stronger. Session reset restarts services without wiping keys.'**
  String get appRecoverySectionSubtitle;

  /// No description provided for @appHardRecoverAction.
  ///
  /// In en, this message translates to:
  /// **'Hard recover'**
  String get appHardRecoverAction;

  /// No description provided for @appHardRecovering.
  ///
  /// In en, this message translates to:
  /// **'Hard recovering…'**
  String get appHardRecovering;

  /// No description provided for @appSessionResetAction.
  ///
  /// In en, this message translates to:
  /// **'Reset session'**
  String get appSessionResetAction;

  /// No description provided for @appSessionResetRunning.
  ///
  /// In en, this message translates to:
  /// **'Resetting session…'**
  String get appSessionResetRunning;

  /// No description provided for @appSessionResetConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset session?'**
  String get appSessionResetConfirmTitle;

  /// No description provided for @appSessionResetConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Restarts ResilNet services on this device. Your identity keys are kept.'**
  String get appSessionResetConfirmBody;

  /// No description provided for @appRecoveryBusy.
  ///
  /// In en, this message translates to:
  /// **'Recovery already running…'**
  String get appRecoveryBusy;

  /// No description provided for @appRecoveryOk.
  ///
  /// In en, this message translates to:
  /// **'Recovery finished'**
  String get appRecoveryOk;

  /// No description provided for @appRecoveryPartial.
  ///
  /// In en, this message translates to:
  /// **'Recovery finished with some steps skipped — try again if still stuck'**
  String get appRecoveryPartial;

  /// No description provided for @appRecoveryFailed.
  ///
  /// In en, this message translates to:
  /// **'Recovery failed — try Session reset, or force-quit the app from the OS'**
  String get appRecoveryFailed;

  /// No description provided for @localWifiTitle.
  ///
  /// In en, this message translates to:
  /// **'Local Wi‑Fi'**
  String get localWifiTitle;

  /// No description provided for @localWifiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Link nearby devices without the internet — same as being on one LAN.'**
  String get localWifiSubtitle;

  /// No description provided for @localWifiNotGatewayHint.
  ///
  /// In en, this message translates to:
  /// **'Not the ESP32 LoRa gateway SoftAP. This is phone↔phone / LAN only.'**
  String get localWifiNotGatewayHint;

  /// No description provided for @localWifiUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Local Wi‑Fi is not ready yet — wait for app startup.'**
  String get localWifiUnavailable;

  /// No description provided for @lxmfBridgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Home node'**
  String get lxmfBridgeTitle;

  /// No description provided for @lxmfBridgeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Optional Mac or Pi on your Wi‑Fi that relays sealed chats. Off by default. Does not replace end-to-end encryption.'**
  String get lxmfBridgeSubtitle;

  /// No description provided for @lxmfBridgeEnable.
  ///
  /// In en, this message translates to:
  /// **'Use home node'**
  String get lxmfBridgeEnable;

  /// No description provided for @lxmfBridgeDisabledHint.
  ///
  /// In en, this message translates to:
  /// **'Turn on only when the bridge app is running on a Mac or Pi on this network.'**
  String get lxmfBridgeDisabledHint;

  /// No description provided for @lxmfBridgeOnline.
  ///
  /// In en, this message translates to:
  /// **'Online — {dest}'**
  String lxmfBridgeOnline(String dest);

  /// No description provided for @lxmfBridgeOffline.
  ///
  /// In en, this message translates to:
  /// **'Can’t reach home node — {error}'**
  String lxmfBridgeOffline(String error);

  /// No description provided for @lxmfBridgeBaseUrl.
  ///
  /// In en, this message translates to:
  /// **'Home node address'**
  String get lxmfBridgeBaseUrl;

  /// No description provided for @lxmfBridgeBaseUrlHelper.
  ///
  /// In en, this message translates to:
  /// **'IP or http://IP:port — example 192.168.1.10:8766'**
  String get lxmfBridgeBaseUrlHelper;

  /// No description provided for @lxmfBridgeIdentityMap.
  ///
  /// In en, this message translates to:
  /// **'Peer → LXMF dest (JSON)'**
  String get lxmfBridgeIdentityMap;

  /// No description provided for @lxmfBridgeRefresh.
  ///
  /// In en, this message translates to:
  /// **'Save & refresh status'**
  String get lxmfBridgeRefresh;

  /// No description provided for @lxmfBridgeLabHint.
  ///
  /// In en, this message translates to:
  /// **'Advanced: labs/reticulum_lxmf'**
  String get lxmfBridgeLabHint;

  /// No description provided for @lxmfBridgeOpen.
  ///
  /// In en, this message translates to:
  /// **'Home node settings'**
  String get lxmfBridgeOpen;

  /// No description provided for @lxmfBridgeCheckConnection.
  ///
  /// In en, this message translates to:
  /// **'Check connection'**
  String get lxmfBridgeCheckConnection;

  /// No description provided for @lxmfBridgeStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'Connected to home node'**
  String get lxmfBridgeStatusOnline;

  /// No description provided for @lxmfBridgeStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Home node not reachable'**
  String get lxmfBridgeStatusOffline;

  /// No description provided for @lxmfBridgeYourDest.
  ///
  /// In en, this message translates to:
  /// **'This node’s address (share with friends)'**
  String get lxmfBridgeYourDest;

  /// No description provided for @lxmfBridgeCopyDest.
  ///
  /// In en, this message translates to:
  /// **'Copy address'**
  String get lxmfBridgeCopyDest;

  /// No description provided for @lxmfBridgeDestCopied.
  ///
  /// In en, this message translates to:
  /// **'Address copied'**
  String get lxmfBridgeDestCopied;

  /// No description provided for @lxmfBridgeLinkedPeers.
  ///
  /// In en, this message translates to:
  /// **'Linked friends'**
  String get lxmfBridgeLinkedPeers;

  /// No description provided for @lxmfBridgeLinkedPeersHint.
  ///
  /// In en, this message translates to:
  /// **'Each friend needs their home-node address once. Then sealed chats can use this path.'**
  String get lxmfBridgeLinkedPeersHint;

  /// No description provided for @lxmfBridgeNoLinks.
  ///
  /// In en, this message translates to:
  /// **'No friends linked yet.'**
  String get lxmfBridgeNoLinks;

  /// No description provided for @lxmfBridgeAddLink.
  ///
  /// In en, this message translates to:
  /// **'Link a friend'**
  String get lxmfBridgeAddLink;

  /// No description provided for @lxmfBridgePickPeer.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get lxmfBridgePickPeer;

  /// No description provided for @lxmfBridgePeerDest.
  ///
  /// In en, this message translates to:
  /// **'Their home-node address'**
  String get lxmfBridgePeerDest;

  /// No description provided for @lxmfBridgePeerDestHint.
  ///
  /// In en, this message translates to:
  /// **'32-character code from their Home node screen'**
  String get lxmfBridgePeerDestHint;

  /// No description provided for @lxmfBridgeInvalidDest.
  ///
  /// In en, this message translates to:
  /// **'That address doesn’t look valid. Paste the full code from their home node.'**
  String get lxmfBridgeInvalidDest;

  /// No description provided for @lxmfBridgeRemoveLink.
  ///
  /// In en, this message translates to:
  /// **'Unlink'**
  String get lxmfBridgeRemoveLink;

  /// No description provided for @lxmfBridgeSaveLink.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get lxmfBridgeSaveLink;

  /// No description provided for @lxmfBridgeLinkSaved.
  ///
  /// In en, this message translates to:
  /// **'Friend linked'**
  String get lxmfBridgeLinkSaved;

  /// No description provided for @lxmfBridgeNoPeers.
  ///
  /// In en, this message translates to:
  /// **'No messageable contacts yet — add a friend first.'**
  String get lxmfBridgeNoPeers;

  /// No description provided for @lxmfBridgeHelp.
  ///
  /// In en, this message translates to:
  /// **'Keep the bridge running on the Mac/Pi. This path stays on your LAN — it is not LoRa and does not replace internet or Bluetooth mesh.'**
  String get lxmfBridgeHelp;

  /// No description provided for @localWifiModeHotspot.
  ///
  /// In en, this message translates to:
  /// **'Nearby'**
  String get localWifiModeHotspot;

  /// No description provided for @localWifiModeRouter.
  ///
  /// In en, this message translates to:
  /// **'Router'**
  String get localWifiModeRouter;

  /// No description provided for @localWifiHotspotIntro.
  ///
  /// In en, this message translates to:
  /// **'One device shares a Personal Hotspot. Others join that hotspot, then ResilNet finds them on the local network.'**
  String get localWifiHotspotIntro;

  /// No description provided for @localWifiHostAction.
  ///
  /// In en, this message translates to:
  /// **'Create network (Host)'**
  String get localWifiHostAction;

  /// No description provided for @localWifiJoinAction.
  ///
  /// In en, this message translates to:
  /// **'Join network'**
  String get localWifiJoinAction;

  /// No description provided for @localWifiHostSteps.
  ///
  /// In en, this message translates to:
  /// **'1. Open iOS/Android Settings and turn on Personal Hotspot (or Internet Sharing).\n2. Tell friends the hotspot name (and password).\n3. Come back here and tap “Hotspot is on — start waiting”.'**
  String get localWifiHostSteps;

  /// No description provided for @localWifiHostReady.
  ///
  /// In en, this message translates to:
  /// **'Hotspot is on — start waiting'**
  String get localWifiHostReady;

  /// No description provided for @localWifiHostWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for friends to join…'**
  String get localWifiHostWaiting;

  /// No description provided for @localWifiJoinSteps.
  ///
  /// In en, this message translates to:
  /// **'1. Open system Settings and join your friend’s Personal Hotspot.\n2. Return here and tap “I’m connected — search”.'**
  String get localWifiJoinSteps;

  /// No description provided for @localWifiJoinReady.
  ///
  /// In en, this message translates to:
  /// **'I’m connected — search'**
  String get localWifiJoinReady;

  /// No description provided for @localWifiRouterIntro.
  ///
  /// In en, this message translates to:
  /// **'Connect every device to the same Wi‑Fi router/AP. The router does not need internet — only a shared local network.'**
  String get localWifiRouterIntro;

  /// No description provided for @localWifiRouterSearch.
  ///
  /// In en, this message translates to:
  /// **'Search on this Wi‑Fi'**
  String get localWifiRouterSearch;

  /// No description provided for @localWifiRefreshNetwork.
  ///
  /// In en, this message translates to:
  /// **'Refresh Wi‑Fi info'**
  String get localWifiRefreshNetwork;

  /// No description provided for @localWifiRouterNoWifiTitle.
  ///
  /// In en, this message translates to:
  /// **'Not on Wi‑Fi'**
  String get localWifiRouterNoWifiTitle;

  /// No description provided for @localWifiRouterNoWifiBody.
  ///
  /// In en, this message translates to:
  /// **'Join the router’s Wi‑Fi in system Settings, then search again.'**
  String get localWifiRouterNoWifiBody;

  /// No description provided for @localWifiDiscovering.
  ///
  /// In en, this message translates to:
  /// **'Searching on local Wi‑Fi…'**
  String get localWifiDiscovering;

  /// No description provided for @localWifiPeersFound.
  ///
  /// In en, this message translates to:
  /// **'Devices on this network'**
  String get localWifiPeersFound;

  /// No description provided for @localWifiStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get localWifiStop;

  /// No description provided for @localWifiSsidUnknown.
  ///
  /// In en, this message translates to:
  /// **'Wi‑Fi name unavailable'**
  String get localWifiSsidUnknown;

  /// No description provided for @localWifiStubBanner.
  ///
  /// In en, this message translates to:
  /// **'Waiting for LAN socket…'**
  String get localWifiStubBanner;

  /// No description provided for @localWifiLiveBanner.
  ///
  /// In en, this message translates to:
  /// **'LAN discovery live (UDP) — announce + sealed chat on this Wi‑Fi'**
  String get localWifiLiveBanner;

  /// No description provided for @localWifiEmptyHotspot.
  ///
  /// In en, this message translates to:
  /// **'No devices yet.\nCheck that friends joined your hotspot and allowed Local Network access.'**
  String get localWifiEmptyHotspot;

  /// No description provided for @localWifiEmptyRouter.
  ///
  /// In en, this message translates to:
  /// **'No devices yet.\nSame SSID? Local Network allowed? Some routers block device-to-device traffic (AP isolation).'**
  String get localWifiEmptyRouter;

  /// No description provided for @localWifiIsolationHelp.
  ///
  /// In en, this message translates to:
  /// **'Why can’t we find each other?'**
  String get localWifiIsolationHelp;

  /// No description provided for @localWifiIsolationTitle.
  ///
  /// In en, this message translates to:
  /// **'Router may isolate clients'**
  String get localWifiIsolationTitle;

  /// No description provided for @localWifiIsolationBody.
  ///
  /// In en, this message translates to:
  /// **'If AP/Client isolation (or a guest network) is on, phones on the same Wi‑Fi cannot talk. Turn isolation off, use the main SSID, or switch to Nearby (Hotspot) mode.'**
  String get localWifiIsolationBody;

  /// No description provided for @localWifiPeerReady.
  ///
  /// In en, this message translates to:
  /// **'Ready to chat (has key)'**
  String get localWifiPeerReady;

  /// No description provided for @localWifiPeerNeedKey.
  ///
  /// In en, this message translates to:
  /// **'Found — scan QR to exchange keys'**
  String get localWifiPeerNeedKey;

  /// No description provided for @localWifiErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Local Wi‑Fi error'**
  String get localWifiErrorTitle;

  /// No description provided for @localWifiErrorBody.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Stop and try again.'**
  String get localWifiErrorBody;

  /// No description provided for @preparingSystem.
  ///
  /// In en, this message translates to:
  /// **'Preparing system…'**
  String get preparingSystem;

  /// No description provided for @bootFailedTitle.
  ///
  /// In en, this message translates to:
  /// **'Could not start'**
  String get bootFailedTitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @bootRecoveryAction.
  ///
  /// In en, this message translates to:
  /// **'Start new identity (erase local data)'**
  String get bootRecoveryAction;

  /// No description provided for @bootRecoveryConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Start new identity?'**
  String get bootRecoveryConfirmTitle;

  /// No description provided for @bootRecoveryConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This will permanently erase local chats, keys, and identity on this device.\nPeers must scan your QR again with your new identity.\nThis cannot be undone.'**
  String get bootRecoveryConfirmBody;

  /// No description provided for @bootRecoveryRunning.
  ///
  /// In en, this message translates to:
  /// **'Resetting local identity…'**
  String get bootRecoveryRunning;

  /// No description provided for @bootRecoverySuccess.
  ///
  /// In en, this message translates to:
  /// **'Local identity reset complete'**
  String get bootRecoverySuccess;

  /// No description provided for @bootRecoveryFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not reset identity: {error}'**
  String bootRecoveryFailed(String error);

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'By default the app follows your phone language (when supported). Other languages fall back to English. You can also lock a language here.'**
  String get languageSubtitle;

  /// No description provided for @languageSystem.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get languageSystem;

  /// No description provided for @languageThai.
  ///
  /// In en, this message translates to:
  /// **'Thai'**
  String get languageThai;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @notificationsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get notificationsTooltip;

  /// No description provided for @enableMessageNotifications.
  ///
  /// In en, this message translates to:
  /// **'Enable message notifications'**
  String get enableMessageNotifications;

  /// No description provided for @settingsNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'1:1 messages and people online (local alerts)'**
  String get settingsNotificationsSubtitle;

  /// No description provided for @networkMembersTooltip.
  ///
  /// In en, this message translates to:
  /// **'Network members'**
  String get networkMembersTooltip;

  /// No description provided for @identityQrTooltip.
  ///
  /// In en, this message translates to:
  /// **'Identity / QR'**
  String get identityQrTooltip;

  /// No description provided for @feedDirects.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get feedDirects;

  /// No description provided for @feedMesh.
  ///
  /// In en, this message translates to:
  /// **'#mesh'**
  String get feedMesh;

  /// No description provided for @feedGeo.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get feedGeo;

  /// No description provided for @feedDirectsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Private E2EE messages'**
  String get feedDirectsSubtitle;

  /// No description provided for @feedMeshSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby peers (BLE)'**
  String get feedMeshSubtitle;

  /// No description provided for @feedGeoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Geohash discovery channel'**
  String get feedGeoSubtitle;

  /// No description provided for @peerIdHint.
  ///
  /// In en, this message translates to:
  /// **'Paste Receiver ID (Public Key Hash) to start a chat'**
  String get peerIdHint;

  /// No description provided for @directsEmpty.
  ///
  /// In en, this message translates to:
  /// **'No chats yet — scan a QR or paste a Receiver ID to start\nMessages are sealed with E2EE before send (BLE / LoRa / Nostr)'**
  String get directsEmpty;

  /// No description provided for @directsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'E2EE • tap to open chat'**
  String get directsSubtitle;

  /// No description provided for @meshIntro.
  ///
  /// In en, this message translates to:
  /// **'Peers in BLE range — tap for a private E2EE chat (no public compose on #mesh)\nSends via hybrid router (BLE + LoRa + Nostr when online)'**
  String get meshIntro;

  /// No description provided for @meshEmptyRunning.
  ///
  /// In en, this message translates to:
  /// **'No nearby peers yet — open the app on another device within BLE range'**
  String get meshEmptyRunning;

  /// No description provided for @meshEmptyStopped.
  ///
  /// In en, this message translates to:
  /// **'BLE is not running — grant Bluetooth / Location permission'**
  String get meshEmptyStopped;

  /// No description provided for @meshNearbyPrefix.
  ///
  /// In en, this message translates to:
  /// **'Nearby'**
  String get meshNearbyPrefix;

  /// No description provided for @meshRetentionTitle.
  ///
  /// In en, this message translates to:
  /// **'Auto-delete messages'**
  String get meshRetentionTitle;

  /// No description provided for @meshRetentionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Older local chat history is removed automatically'**
  String get meshRetentionSubtitle;

  /// No description provided for @meshRetentionKeep.
  ///
  /// In en, this message translates to:
  /// **'Keep'**
  String get meshRetentionKeep;

  /// No description provided for @meshRetention1Day.
  ///
  /// In en, this message translates to:
  /// **'1 day'**
  String get meshRetention1Day;

  /// No description provided for @meshRetention3Days.
  ///
  /// In en, this message translates to:
  /// **'3 days'**
  String get meshRetention3Days;

  /// No description provided for @meshRetention7Days.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get meshRetention7Days;

  /// No description provided for @refreshLocationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh location'**
  String get refreshLocationTooltip;

  /// No description provided for @geoIntro.
  ///
  /// In en, this message translates to:
  /// **'People online in this geohash can be messaged 1:1 or with an area public fan-out (still sealed E2EE per peer — not plaintext)'**
  String get geoIntro;

  /// No description provided for @geoEmpty.
  ///
  /// In en, this message translates to:
  /// **'No one online in {channel} yet\nUse Transport → Internet/Auto, wait for Nostr, refresh location'**
  String geoEmpty(String channel);

  /// No description provided for @geoPeerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Online in {channel} • tap for 1:1 E2EE'**
  String geoPeerSubtitle(String channel);

  /// No description provided for @geoPeerNearbySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Nearby (awaiting area presence) • tap for 1:1 E2EE'**
  String get geoPeerNearbySubtitle;

  /// No description provided for @geoPeerNostrSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Seen on Nostr in {channel} • discovery only (legacy)'**
  String geoPeerNostrSubtitle(String channel);

  /// No description provided for @geoPeerDiscoverOnlySnack.
  ///
  /// In en, this message translates to:
  /// **'Legacy anonymous presence — wait for a bound peer or exchange QR'**
  String get geoPeerDiscoverOnlySnack;

  /// No description provided for @bleRadioNearbySubtitle.
  ///
  /// In en, this message translates to:
  /// **'BLE nearby — scan QR to start 1:1 E2EE'**
  String get bleRadioNearbySubtitle;

  /// No description provided for @geoInternetDiscoverHint.
  ///
  /// In en, this message translates to:
  /// **'Area Internet discovery needs Nostr connected (Settings → Transport → Internet/Auto)'**
  String get geoInternetDiscoverHint;

  /// No description provided for @geoEmptyNoLocation.
  ///
  /// In en, this message translates to:
  /// **'Location not resolved yet — allow GPS and refresh to publish your geohash on Nostr'**
  String get geoEmptyNoLocation;

  /// No description provided for @geoEmptyNeedsPermission.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied — allow ResilNet in Settings → Privacy → Location'**
  String get geoEmptyNeedsPermission;

  /// No description provided for @geoEmptyServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location Services are off — turn them on in Settings'**
  String get geoEmptyServicesDisabled;

  /// No description provided for @geoEmptyNoGpsFix.
  ///
  /// In en, this message translates to:
  /// **'Could not get a GPS fix (common on Wi‑Fi iPads) — set geohash manually below'**
  String get geoEmptyNoGpsFix;

  /// No description provided for @geoEmptyTeleportHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the place icon → enter a geohash (e.g. w5) → Teleport'**
  String get geoEmptyTeleportHint;

  /// No description provided for @geoSetGeohashManually.
  ///
  /// In en, this message translates to:
  /// **'Set geohash'**
  String get geoSetGeohashManually;

  /// No description provided for @geoTeleportHint.
  ///
  /// In en, this message translates to:
  /// **'No GPS? Enter geohash prefix (2–7 chars, e.g. w5) and tap Teleport'**
  String get geoTeleportHint;

  /// No description provided for @geoTeleportInvalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid geohash — use base32 letters/numbers only (e.g. w5 or w5jt8)'**
  String get geoTeleportInvalid;

  /// No description provided for @geoTeleportOk.
  ///
  /// In en, this message translates to:
  /// **'Area set to {channel}'**
  String geoTeleportOk(String channel);

  /// No description provided for @geoManualActive.
  ///
  /// In en, this message translates to:
  /// **'Manual area: {channel} (GPS refresh will override)'**
  String geoManualActive(String channel);

  /// No description provided for @geoEmptyNoNostr.
  ///
  /// In en, this message translates to:
  /// **'Nostr not ready — tap Reconnect (0/0 until init succeeds)'**
  String get geoEmptyNoNostr;

  /// No description provided for @geoEmptyMeshOnly.
  ///
  /// In en, this message translates to:
  /// **'Transport is Mesh-only — switch to Internet or Auto to discover peers over Nostr'**
  String get geoEmptyMeshOnly;

  /// No description provided for @geoEmptyWaiting.
  ///
  /// In en, this message translates to:
  /// **'No one in {channel} yet — keep Area + Internet open on both devices and wait ~60s'**
  String geoEmptyWaiting(String channel);

  /// No description provided for @geoChannelFallback.
  ///
  /// In en, this message translates to:
  /// **'#area'**
  String get geoChannelFallback;

  /// No description provided for @geoRefreshLocation.
  ///
  /// In en, this message translates to:
  /// **'Refresh location'**
  String get geoRefreshLocation;

  /// No description provided for @settingsClearLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear location'**
  String get settingsClearLocationTitle;

  /// No description provided for @settingsClearLocationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Remove GPS / teleport geohash (Area becomes #—)'**
  String get settingsClearLocationSubtitle;

  /// No description provided for @settingsClearLocationConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear location?'**
  String get settingsClearLocationConfirmTitle;

  /// No description provided for @settingsClearLocationConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Deletes the stored geohash on this device. You can refresh GPS or teleport again afterward.'**
  String get settingsClearLocationConfirmBody;

  /// No description provided for @settingsClearLocationAction.
  ///
  /// In en, this message translates to:
  /// **'Clear location'**
  String get settingsClearLocationAction;

  /// No description provided for @settingsClearLocationSnack.
  ///
  /// In en, this message translates to:
  /// **'Location cleared'**
  String get settingsClearLocationSnack;

  /// No description provided for @chatVoiceTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Voice note too large — max ~30 seconds'**
  String get chatVoiceTooLarge;

  /// No description provided for @chatVoiceNeedInternet.
  ///
  /// In en, this message translates to:
  /// **'Voice note needs Internet (Nostr) — too large for BLE alone'**
  String get chatVoiceNeedInternet;

  /// No description provided for @chatVoiceSentInternet.
  ///
  /// In en, this message translates to:
  /// **'Voice note sent via Internet'**
  String get chatVoiceSentInternet;

  /// No description provided for @noticeAnonMention.
  ///
  /// In en, this message translates to:
  /// **'mention'**
  String get noticeAnonMention;

  /// No description provided for @noticeAnonDm.
  ///
  /// In en, this message translates to:
  /// **'direct message'**
  String get noticeAnonDm;

  /// No description provided for @noticeAnonHug.
  ///
  /// In en, this message translates to:
  /// **'hug'**
  String get noticeAnonHug;

  /// No description provided for @noticeAnonSlap.
  ///
  /// In en, this message translates to:
  /// **'slap'**
  String get noticeAnonSlap;

  /// No description provided for @noticeAnonBlock.
  ///
  /// In en, this message translates to:
  /// **'block'**
  String get noticeAnonBlock;

  /// No description provided for @noticeAnonNeedKey.
  ///
  /// In en, this message translates to:
  /// **'No public key yet — exchange QR first for 1:1'**
  String get noticeAnonNeedKey;

  /// No description provided for @noticeAnonActionSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get noticeAnonActionSent;

  /// No description provided for @noticeAnonBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked {anon}'**
  String noticeAnonBlocked(String anon);

  /// No description provided for @noticeAnonHugMessage.
  ///
  /// In en, this message translates to:
  /// **'* hugs {anon} *'**
  String noticeAnonHugMessage(String anon);

  /// No description provided for @noticeAnonSlapMessage.
  ///
  /// In en, this message translates to:
  /// **'* slaps {anon} *'**
  String noticeAnonSlapMessage(String anon);

  /// No description provided for @geoReconnectNostr.
  ///
  /// In en, this message translates to:
  /// **'Reconnect Nostr'**
  String get geoReconnectNostr;

  /// No description provided for @nostrSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Nostr relays'**
  String get nostrSectionTitle;

  /// No description provided for @nostrSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Internet messaging and Area discovery use these relays. Tap reconnect if status stays offline.'**
  String get nostrSectionSubtitle;

  /// No description provided for @nostrStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'Connected {connected}/{total}'**
  String nostrStatusOnline(int connected, int total);

  /// No description provided for @nostrStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline — relays listed but none connected'**
  String get nostrStatusOffline;

  /// No description provided for @nostrStatusNotInit.
  ///
  /// In en, this message translates to:
  /// **'Not started (0/0) — tap Reconnect to initialize'**
  String get nostrStatusNotInit;

  /// No description provided for @nostrReconnectAction.
  ///
  /// In en, this message translates to:
  /// **'Reconnect Nostr'**
  String get nostrReconnectAction;

  /// No description provided for @nostrReconnectOk.
  ///
  /// In en, this message translates to:
  /// **'Nostr connected ({connected}/{total})'**
  String nostrReconnectOk(int connected, int total);

  /// No description provided for @nostrReconnectFailed.
  ///
  /// In en, this message translates to:
  /// **'Still offline — check Wi‑Fi/cellular or try again'**
  String get nostrReconnectFailed;

  /// No description provided for @nostrReconnectFailedDetail.
  ///
  /// In en, this message translates to:
  /// **'Failed: {error}'**
  String nostrReconnectFailedDetail(String error);

  /// No description provided for @nostrReconnecting.
  ///
  /// In en, this message translates to:
  /// **'Connecting to relays…'**
  String get nostrReconnecting;

  /// No description provided for @geoDiscoveryStatus.
  ///
  /// In en, this message translates to:
  /// **'{channel} · Nostr {relays}'**
  String geoDiscoveryStatus(String channel, String relays);

  /// No description provided for @geoPeerInternetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Internet (Nostr) in {channel} • sealed chat ready'**
  String geoPeerInternetSubtitle(String channel);

  /// No description provided for @transportModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Area transport'**
  String get transportModeTitle;

  /// No description provided for @transportModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Mesh = BLE nearby (radio) when no Nostr · Internet & Auto = Nostr people list'**
  String get transportModeSubtitle;

  /// No description provided for @transportModeMesh.
  ///
  /// In en, this message translates to:
  /// **'Mesh'**
  String get transportModeMesh;

  /// No description provided for @transportModeInternet.
  ///
  /// In en, this message translates to:
  /// **'Internet'**
  String get transportModeInternet;

  /// No description provided for @transportModeAuto.
  ///
  /// In en, this message translates to:
  /// **'Auto'**
  String get transportModeAuto;

  /// No description provided for @geoPublicHint.
  ///
  /// In en, this message translates to:
  /// **'Public message to everyone online in this area'**
  String get geoPublicHint;

  /// No description provided for @geoPublicSend.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get geoPublicSend;

  /// No description provided for @geoPublicHelp.
  ///
  /// In en, this message translates to:
  /// **'Sealed fan-out to {count} online peer(s) — each receives a private envelope'**
  String geoPublicHelp(int count);

  /// No description provided for @geoPublicSent.
  ///
  /// In en, this message translates to:
  /// **'Sent to {count} peer(s) in this area'**
  String geoPublicSent(int count);

  /// No description provided for @geoPublicSentNone.
  ///
  /// In en, this message translates to:
  /// **'No messageable peers online — open Area/Mesh with peers that have keys, or wait for BLE/Nostr'**
  String get geoPublicSentNone;

  /// No description provided for @areaPublicBadge.
  ///
  /// In en, this message translates to:
  /// **'Area public'**
  String get areaPublicBadge;

  /// No description provided for @geoErrorPermission.
  ///
  /// In en, this message translates to:
  /// **'Could not read location — check location permission'**
  String get geoErrorPermission;

  /// No description provided for @geoPrecisionRegion.
  ///
  /// In en, this message translates to:
  /// **'Region'**
  String get geoPrecisionRegion;

  /// No description provided for @geoPrecisionProvince.
  ///
  /// In en, this message translates to:
  /// **'Province'**
  String get geoPrecisionProvince;

  /// No description provided for @geoPrecisionCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get geoPrecisionCity;

  /// No description provided for @geoPrecisionNeighborhood.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood'**
  String get geoPrecisionNeighborhood;

  /// No description provided for @geoPrecisionBlock.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get geoPrecisionBlock;

  /// No description provided for @aliasTitle.
  ///
  /// In en, this message translates to:
  /// **'Set nickname (Contact Alias)'**
  String get aliasTitle;

  /// No description provided for @aliasHintBody.
  ///
  /// In en, this message translates to:
  /// **'This alias is stored on this device only (local-only)\nIt is never sent with E2EE traffic'**
  String get aliasHintBody;

  /// No description provided for @aliasLabel.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get aliasLabel;

  /// No description provided for @aliasHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. “village head”, “P’Somchai”…'**
  String get aliasHint;

  /// No description provided for @settingsDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get settingsDevices;

  /// No description provided for @settingsFirmwareTitle.
  ///
  /// In en, this message translates to:
  /// **'Download / update ESP32 firmware'**
  String get settingsFirmwareTitle;

  /// No description provided for @settingsFirmwareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Download .bin files and update the ESP32 board via OTA'**
  String get settingsFirmwareSubtitle;

  /// No description provided for @mtBridgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Meshtastic bridge'**
  String get mtBridgeTitle;

  /// No description provided for @mtBridgeSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Text-only A/B bridge — not ResilNet E2EE'**
  String get mtBridgeSettingsSubtitle;

  /// No description provided for @mtBridgeIntro.
  ///
  /// In en, this message translates to:
  /// **'Move short plaintext between Meshtastic and ResilNet. Modes A and B cannot run at the same time. This is not end-to-end encryption.'**
  String get mtBridgeIntro;

  /// No description provided for @mtBridgeModeLabel.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mtBridgeModeLabel;

  /// No description provided for @mtBridgeModeOff.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get mtBridgeModeOff;

  /// No description provided for @mtBridgeModeA.
  ///
  /// In en, this message translates to:
  /// **'Ingest A'**
  String get mtBridgeModeA;

  /// No description provided for @mtBridgeModeB.
  ///
  /// In en, this message translates to:
  /// **'Egress B'**
  String get mtBridgeModeB;

  /// No description provided for @mtBridgeModeOffShort.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get mtBridgeModeOffShort;

  /// No description provided for @mtBridgeModeAShort.
  ///
  /// In en, this message translates to:
  /// **'In A'**
  String get mtBridgeModeAShort;

  /// No description provided for @mtBridgeModeBShort.
  ///
  /// In en, this message translates to:
  /// **'Out B'**
  String get mtBridgeModeBShort;

  /// No description provided for @mtBridgeMutexHint.
  ///
  /// In en, this message translates to:
  /// **'Selecting a mode turns the other off automatically. Simultaneous A+B is not supported.'**
  String get mtBridgeMutexHint;

  /// No description provided for @mtBridgeStatusLine.
  ///
  /// In en, this message translates to:
  /// **'{mode} · {transport}'**
  String mtBridgeStatusLine(String mode, String transport);

  /// No description provided for @mtBridgeTransportDemo.
  ///
  /// In en, this message translates to:
  /// **'Demo (logging)'**
  String get mtBridgeTransportDemo;

  /// No description provided for @mtBridgeIngestSection.
  ///
  /// In en, this message translates to:
  /// **'Meshtastic → ResilNet'**
  String get mtBridgeIngestSection;

  /// No description provided for @mtBridgeIngestHint.
  ///
  /// In en, this message translates to:
  /// **'Inbound text appears under Notices as #meshtastic. Mesh relay is optional (off by default).'**
  String get mtBridgeIngestHint;

  /// No description provided for @mtBridgeRelayTitle.
  ///
  /// In en, this message translates to:
  /// **'Also relay on ResilNet mesh'**
  String get mtBridgeRelayTitle;

  /// No description provided for @mtBridgeRelayHint.
  ///
  /// In en, this message translates to:
  /// **'When on, signed public bulletins are broadcast. Off = this phone’s Notices only.'**
  String get mtBridgeRelayHint;

  /// No description provided for @mtBridgeSimulateHint.
  ///
  /// In en, this message translates to:
  /// **'Demo message'**
  String get mtBridgeSimulateHint;

  /// No description provided for @mtBridgeSimulate.
  ///
  /// In en, this message translates to:
  /// **'Simulate Meshtastic message'**
  String get mtBridgeSimulate;

  /// No description provided for @mtBridgeIngestOk.
  ///
  /// In en, this message translates to:
  /// **'Ingested into Notices (#meshtastic)'**
  String get mtBridgeIngestOk;

  /// No description provided for @mtBridgeEgressWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning: messages sent here are NOT ResilNet E2EE. Anyone on the Meshtastic path can read them.'**
  String get mtBridgeEgressWarning;

  /// No description provided for @mtBridgeEgressSection.
  ///
  /// In en, this message translates to:
  /// **'ResilNet → Meshtastic'**
  String get mtBridgeEgressSection;

  /// No description provided for @mtBridgeComposeHint.
  ///
  /// In en, this message translates to:
  /// **'Text to publish'**
  String get mtBridgeComposeHint;

  /// No description provided for @mtBridgeSend.
  ///
  /// In en, this message translates to:
  /// **'Send to Meshtastic'**
  String get mtBridgeSend;

  /// No description provided for @mtBridgeEgressOk.
  ///
  /// In en, this message translates to:
  /// **'Queued for Meshtastic (see log / history)'**
  String get mtBridgeEgressOk;

  /// No description provided for @mtBridgeLastEgress.
  ///
  /// In en, this message translates to:
  /// **'Last egress'**
  String get mtBridgeLastEgress;

  /// No description provided for @mtBridgeEgressHistory.
  ///
  /// In en, this message translates to:
  /// **'Recent egress'**
  String get mtBridgeEgressHistory;

  /// No description provided for @mtBridgeOffHint.
  ///
  /// In en, this message translates to:
  /// **'Turn on Ingest (A) or Egress (B) to use the bridge.'**
  String get mtBridgeOffHint;

  /// No description provided for @mtBridgeNoticeBadge.
  ///
  /// In en, this message translates to:
  /// **'MESHTASTIC · not E2EE'**
  String get mtBridgeNoticeBadge;

  /// No description provided for @mtBridgeSenderFallback.
  ///
  /// In en, this message translates to:
  /// **'Meshtastic'**
  String get mtBridgeSenderFallback;

  /// No description provided for @mtBridgeUseMqtt.
  ///
  /// In en, this message translates to:
  /// **'Use MQTT transport'**
  String get mtBridgeUseMqtt;

  /// No description provided for @mtBridgeUseMqttHint.
  ///
  /// In en, this message translates to:
  /// **'Off = demo logging only (MQTT inbound ignored). On = MQTT for ingest/egress when connected.'**
  String get mtBridgeUseMqttHint;

  /// No description provided for @mtBridgeMqttHost.
  ///
  /// In en, this message translates to:
  /// **'Broker host'**
  String get mtBridgeMqttHost;

  /// No description provided for @mtBridgeMqttPort.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get mtBridgeMqttPort;

  /// No description provided for @mtBridgeMqttTls.
  ///
  /// In en, this message translates to:
  /// **'Use TLS (mqtts)'**
  String get mtBridgeMqttTls;

  /// No description provided for @mtBridgeMqttTlsHint.
  ///
  /// In en, this message translates to:
  /// **'Typical port 8883. Uses system certificates; fails soft on handshake errors.'**
  String get mtBridgeMqttTlsHint;

  /// No description provided for @mtBridgeMqttAutoReconnect.
  ///
  /// In en, this message translates to:
  /// **'Auto-reconnect'**
  String get mtBridgeMqttAutoReconnect;

  /// No description provided for @mtBridgeMqttAutoReconnectHint.
  ///
  /// In en, this message translates to:
  /// **'When on, the client tries to reconnect after drops. Status shows Connecting until restored.'**
  String get mtBridgeMqttAutoReconnectHint;

  /// No description provided for @mtBridgeMqttTopicHelpers.
  ///
  /// In en, this message translates to:
  /// **'Topic helpers'**
  String get mtBridgeMqttTopicHelpers;

  /// No description provided for @mtBridgeMqttRegion.
  ///
  /// In en, this message translates to:
  /// **'Region prefix (optional)'**
  String get mtBridgeMqttRegion;

  /// No description provided for @mtBridgeMqttRegionHint.
  ///
  /// In en, this message translates to:
  /// **'When set, Apply rebuilds root as msh/<region>/2/json (overrides topic root).'**
  String get mtBridgeMqttRegionHint;

  /// No description provided for @mtBridgeMqttTopicRoot.
  ///
  /// In en, this message translates to:
  /// **'JSON topic root'**
  String get mtBridgeMqttTopicRoot;

  /// No description provided for @mtBridgeMqttDownlinkChannel.
  ///
  /// In en, this message translates to:
  /// **'Downlink channel name'**
  String get mtBridgeMqttDownlinkChannel;

  /// No description provided for @mtBridgeMqttApplyTopics.
  ///
  /// In en, this message translates to:
  /// **'Apply root → subscribe / publish topics'**
  String get mtBridgeMqttApplyTopics;

  /// No description provided for @mtBridgeMqttAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced MQTT'**
  String get mtBridgeMqttAdvanced;

  /// No description provided for @mtBridgeMqttAdvancedHint.
  ///
  /// In en, this message translates to:
  /// **'TLS, reconnect, topics, credentials'**
  String get mtBridgeMqttAdvancedHint;

  /// No description provided for @mtBridgeMqttTopicIn.
  ///
  /// In en, this message translates to:
  /// **'Subscribe topic'**
  String get mtBridgeMqttTopicIn;

  /// No description provided for @mtBridgeMqttTopicOut.
  ///
  /// In en, this message translates to:
  /// **'Publish topic'**
  String get mtBridgeMqttTopicOut;

  /// No description provided for @mtBridgeMqttGatewayFrom.
  ///
  /// In en, this message translates to:
  /// **'Gateway node id (from)'**
  String get mtBridgeMqttGatewayFrom;

  /// No description provided for @mtBridgeMqttGatewayFromHint.
  ///
  /// In en, this message translates to:
  /// **'Decimal id or !hex — required for sendtext downlink'**
  String get mtBridgeMqttGatewayFromHint;

  /// No description provided for @mtBridgeMqttChannelIndex.
  ///
  /// In en, this message translates to:
  /// **'Mesh channel index (optional 0–7)'**
  String get mtBridgeMqttChannelIndex;

  /// No description provided for @mtBridgeMqttUser.
  ///
  /// In en, this message translates to:
  /// **'Username (optional)'**
  String get mtBridgeMqttUser;

  /// No description provided for @mtBridgeMqttPass.
  ///
  /// In en, this message translates to:
  /// **'Password (optional)'**
  String get mtBridgeMqttPass;

  /// No description provided for @mtBridgeMqttPassStored.
  ///
  /// In en, this message translates to:
  /// **'A password is stored on this device (not shown).'**
  String get mtBridgeMqttPassStored;

  /// No description provided for @mtBridgeMqttPassReplace.
  ///
  /// In en, this message translates to:
  /// **'New password (leave blank to keep)'**
  String get mtBridgeMqttPassReplace;

  /// No description provided for @mtBridgeMqttPassReplaceHint.
  ///
  /// In en, this message translates to:
  /// **'Leave empty to keep the stored password.'**
  String get mtBridgeMqttPassReplaceHint;

  /// No description provided for @mtBridgeMqttPassClear.
  ///
  /// In en, this message translates to:
  /// **'Clear password'**
  String get mtBridgeMqttPassClear;

  /// No description provided for @mtBridgeMqttSave.
  ///
  /// In en, this message translates to:
  /// **'Save MQTT settings'**
  String get mtBridgeMqttSave;

  /// No description provided for @mtBridgeMqttSaved.
  ///
  /// In en, this message translates to:
  /// **'MQTT settings saved'**
  String get mtBridgeMqttSaved;

  /// No description provided for @mtBridgeMqttConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get mtBridgeMqttConnect;

  /// No description provided for @mtBridgeMqttDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get mtBridgeMqttDisconnect;

  /// No description provided for @mtBridgeMqttConnected.
  ///
  /// In en, this message translates to:
  /// **'MQTT connected'**
  String get mtBridgeMqttConnected;

  /// No description provided for @mtBridgeMqttConnecting.
  ///
  /// In en, this message translates to:
  /// **'MQTT connecting…'**
  String get mtBridgeMqttConnecting;

  /// No description provided for @mtBridgeMqttDisconnected.
  ///
  /// In en, this message translates to:
  /// **'MQTT disconnected'**
  String get mtBridgeMqttDisconnected;

  /// No description provided for @mtBridgeMqttError.
  ///
  /// In en, this message translates to:
  /// **'MQTT error'**
  String get mtBridgeMqttError;

  /// No description provided for @mtBridgeErrModeIngest.
  ///
  /// In en, this message translates to:
  /// **'Switch to Ingest (A) first'**
  String get mtBridgeErrModeIngest;

  /// No description provided for @mtBridgeErrModeEgress.
  ///
  /// In en, this message translates to:
  /// **'Switch to Egress (B) first'**
  String get mtBridgeErrModeEgress;

  /// No description provided for @mtBridgeErrRate.
  ///
  /// In en, this message translates to:
  /// **'Slow down — rate limited'**
  String get mtBridgeErrRate;

  /// No description provided for @mtBridgeErrDedupe.
  ///
  /// In en, this message translates to:
  /// **'Duplicate message ignored'**
  String get mtBridgeErrDedupe;

  /// No description provided for @mtBridgeErrLoop.
  ///
  /// In en, this message translates to:
  /// **'Dropped to prevent a bridge loop'**
  String get mtBridgeErrLoop;

  /// No description provided for @mtBridgeErrEmpty.
  ///
  /// In en, this message translates to:
  /// **'Message is empty'**
  String get mtBridgeErrEmpty;

  /// No description provided for @mtBridgeErrPublish.
  ///
  /// In en, this message translates to:
  /// **'Publish failed'**
  String get mtBridgeErrPublish;

  /// No description provided for @mtBridgeErrNotConnected.
  ///
  /// In en, this message translates to:
  /// **'MQTT not connected'**
  String get mtBridgeErrNotConnected;

  /// No description provided for @mtBridgeErrMissingHost.
  ///
  /// In en, this message translates to:
  /// **'Enter MQTT broker host'**
  String get mtBridgeErrMissingHost;

  /// No description provided for @mtBridgeErrMissingTopic.
  ///
  /// In en, this message translates to:
  /// **'Enter subscribe and publish topics'**
  String get mtBridgeErrMissingTopic;

  /// No description provided for @mtBridgeErrMissingFromNode.
  ///
  /// In en, this message translates to:
  /// **'Enter gateway node id (from) for sendtext'**
  String get mtBridgeErrMissingFromNode;

  /// No description provided for @mtBridgeErrConnect.
  ///
  /// In en, this message translates to:
  /// **'MQTT connect failed'**
  String get mtBridgeErrConnect;

  /// No description provided for @mtBridgeErrConnectTls.
  ///
  /// In en, this message translates to:
  /// **'MQTT TLS connect failed'**
  String get mtBridgeErrConnectTls;

  /// No description provided for @settingsData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get settingsData;

  /// No description provided for @settingsDataHint.
  ///
  /// In en, this message translates to:
  /// **'Delete local messages to shrink the database — identity, keys, and peers are kept'**
  String get settingsDataHint;

  /// No description provided for @settingsSaveHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Save message history'**
  String get settingsSaveHistoryTitle;

  /// No description provided for @settingsSaveHistorySubtitle.
  ///
  /// In en, this message translates to:
  /// **'When off, messages stay E2EE on the wire and are kept only for this session (not in local chat history). Your own text still shows as plaintext on this device.'**
  String get settingsSaveHistorySubtitle;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get settingsPrivacy;

  /// No description provided for @settingsE2eeTitle.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption'**
  String get settingsE2eeTitle;

  /// No description provided for @settingsE2eeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Always on — messages are sealed with RSA-OAEP + AES-GCM before send. Relays and nearby hops cannot read contents.'**
  String get settingsE2eeSubtitle;

  /// No description provided for @settingsScreenshotTitle.
  ///
  /// In en, this message translates to:
  /// **'Screenshot alerts'**
  String get settingsScreenshotTitle;

  /// No description provided for @settingsScreenshotSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show a system line in chat when this device captures the screen'**
  String get settingsScreenshotSubtitle;

  /// No description provided for @settingsNostrExpiryTitle.
  ///
  /// In en, this message translates to:
  /// **'Nostr message keep time'**
  String get settingsNostrExpiryTitle;

  /// No description provided for @settingsNostrExpirySubtitle.
  ///
  /// In en, this message translates to:
  /// **'How long sealed envelopes should remain locally when online via Nostr'**
  String get settingsNostrExpirySubtitle;

  /// No description provided for @noticeExpiresIn.
  ///
  /// In en, this message translates to:
  /// **'expires in'**
  String get noticeExpiresIn;

  /// No description provided for @noticesTitle.
  ///
  /// In en, this message translates to:
  /// **'Notices'**
  String get noticesTitle;

  /// No description provided for @noticesMeshIntro.
  ///
  /// In en, this message translates to:
  /// **'Public bulletin — visible to everyone in radio range, not encrypted. It hops phone-to-phone offline, and nearby ResilNet relay boxes keep a copy so people who arrive later still see it.'**
  String get noticesMeshIntro;

  /// No description provided for @noticesMeshPublicBadge.
  ///
  /// In en, this message translates to:
  /// **'PUBLIC · not encrypted'**
  String get noticesMeshPublicBadge;

  /// No description provided for @noticesGeoIntro.
  ///
  /// In en, this message translates to:
  /// **'Add short notes for this place so other visitors can find them.'**
  String get noticesGeoIntro;

  /// No description provided for @noticesEmpty.
  ///
  /// In en, this message translates to:
  /// **'no notices yet'**
  String get noticesEmpty;

  /// No description provided for @noticesEmptyHint.
  ///
  /// In en, this message translates to:
  /// **'pin the first notice for people around here.'**
  String get noticesEmptyHint;

  /// No description provided for @noticesComposeHint.
  ///
  /// In en, this message translates to:
  /// **'post a notice...'**
  String get noticesComposeHint;

  /// No description provided for @noticesUrgent.
  ///
  /// In en, this message translates to:
  /// **'urgent'**
  String get noticesUrgent;

  /// No description provided for @noticesOpen.
  ///
  /// In en, this message translates to:
  /// **'Notices'**
  String get noticesOpen;

  /// No description provided for @screenshotTaken.
  ///
  /// In en, this message translates to:
  /// **'* you took a screenshot *'**
  String get screenshotTaken;

  /// No description provided for @chatAttachImage.
  ///
  /// In en, this message translates to:
  /// **'Attach image'**
  String get chatAttachImage;

  /// No description provided for @chatImageLabel.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get chatImageLabel;

  /// No description provided for @chatImageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Image too large — try another photo'**
  String get chatImageTooLarge;

  /// No description provided for @chatNostrExpiry.
  ///
  /// In en, this message translates to:
  /// **'Nostr keep'**
  String get chatNostrExpiry;

  /// No description provided for @geoPublicComposeHint.
  ///
  /// In en, this message translates to:
  /// **'Send to {channel} — public'**
  String geoPublicComposeHint(String channel);

  /// No description provided for @settingsClearTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all messages'**
  String get settingsClearTitle;

  /// No description provided for @settingsClearSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all chats on this device'**
  String get settingsClearSubtitle;

  /// No description provided for @settingsClearConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear all messages?'**
  String get settingsClearConfirmTitle;

  /// No description provided for @settingsClearConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This deletes all chat messages on this device.\nPeers and nicknames are not removed.'**
  String get settingsClearConfirmBody;

  /// No description provided for @settingsClearAction.
  ///
  /// In en, this message translates to:
  /// **'Clear data'**
  String get settingsClearAction;

  /// No description provided for @settingsClearedSnack.
  ///
  /// In en, this message translates to:
  /// **'Data cleared'**
  String get settingsClearedSnack;

  /// No description provided for @settingsVersion.
  ///
  /// In en, this message translates to:
  /// **'version {version}'**
  String settingsVersion(String version);

  /// No description provided for @meshBleScanning.
  ///
  /// In en, this message translates to:
  /// **'BLE: scanning for nodes'**
  String get meshBleScanning;

  /// No description provided for @meshBleEsp32Scanning.
  ///
  /// In en, this message translates to:
  /// **'ESP32: looking for a nearby node'**
  String get meshBleEsp32Scanning;

  /// No description provided for @meshBleSyncing.
  ///
  /// In en, this message translates to:
  /// **'BLE: syncing with ESP32'**
  String get meshBleSyncing;

  /// No description provided for @meshNostrPublishing.
  ///
  /// In en, this message translates to:
  /// **'Nostr: publishing'**
  String get meshNostrPublishing;

  /// No description provided for @meshBleIdle.
  ///
  /// In en, this message translates to:
  /// **'BLE mesh on — no nearby phones yet'**
  String get meshBleIdle;

  /// No description provided for @meshBlePeersNearby.
  ///
  /// In en, this message translates to:
  /// **'BLE mesh — {count} phone(s) nearby'**
  String meshBlePeersNearby(int count);

  /// No description provided for @meshBleNeedsPermission.
  ///
  /// In en, this message translates to:
  /// **'BLE: permission required'**
  String get meshBleNeedsPermission;

  /// No description provided for @meshBlePausedCamera.
  ///
  /// In en, this message translates to:
  /// **'BLE paused for camera — tap Start BLE'**
  String get meshBlePausedCamera;

  /// No description provided for @meshBleStopped.
  ///
  /// In en, this message translates to:
  /// **'BLE is off — check Bluetooth is on, then tap Start BLE'**
  String get meshBleStopped;

  /// No description provided for @meshBleRestart.
  ///
  /// In en, this message translates to:
  /// **'Start BLE'**
  String get meshBleRestart;

  /// No description provided for @meshBleStatusDetail.
  ///
  /// In en, this message translates to:
  /// **'BT {bt} · Loc {loc} · BLE {ble}'**
  String meshBleStatusDetail(String bt, String loc, String ble);

  /// No description provided for @meshBleEnsureAction.
  ///
  /// In en, this message translates to:
  /// **'Check permissions & start BLE'**
  String get meshBleEnsureAction;

  /// No description provided for @meshNostrOffline.
  ///
  /// In en, this message translates to:
  /// **'Nostr offline'**
  String get meshNostrOffline;

  /// No description provided for @meshNostrOnline.
  ///
  /// In en, this message translates to:
  /// **'Nostr {relays}'**
  String meshNostrOnline(String relays);

  /// No description provided for @meshFooter.
  ///
  /// In en, this message translates to:
  /// **'{count} nearby peers • LoRa {lora} • sync ~{meters}m'**
  String meshFooter(int count, String lora, int meters);

  /// No description provided for @meshLoraReady.
  ///
  /// In en, this message translates to:
  /// **'ready'**
  String get meshLoraReady;

  /// No description provided for @meshLoraNotReady.
  ///
  /// In en, this message translates to:
  /// **'not ready'**
  String get meshLoraNotReady;

  /// No description provided for @meshGatewayProgress.
  ///
  /// In en, this message translates to:
  /// **'Gateway UDP: {label}'**
  String meshGatewayProgress(String label);

  /// No description provided for @meshGatewayReady.
  ///
  /// In en, this message translates to:
  /// **'Gateway UDP: ready'**
  String get meshGatewayReady;

  /// No description provided for @permissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow access to start the BLE mesh network'**
  String get permissionTitle;

  /// No description provided for @permissionBody.
  ///
  /// In en, this message translates to:
  /// **'The app needs Bluetooth (scan / connect / advertise), Location (for older Android devices), and Microphone (for voice notes in chat and announcements) for community messaging.'**
  String get permissionBody;

  /// No description provided for @permissionE2ee.
  ///
  /// In en, this message translates to:
  /// **'End-to-End Encryption (E2EE)\nRelay nodes cannot read message contents'**
  String get permissionE2ee;

  /// No description provided for @permissionReady.
  ///
  /// In en, this message translates to:
  /// **'Permissions ready'**
  String get permissionReady;

  /// No description provided for @permissionRequest.
  ///
  /// In en, this message translates to:
  /// **'Allow and continue'**
  String get permissionRequest;

  /// No description provided for @permissionNotReadySnack.
  ///
  /// In en, this message translates to:
  /// **'System not ready yet — wait a moment and try again'**
  String get permissionNotReadySnack;

  /// No description provided for @permissionDeniedSnack.
  ///
  /// In en, this message translates to:
  /// **'Permissions incomplete — open Settings > ResilNet and allow Bluetooth / Location / Microphone'**
  String get permissionDeniedSnack;

  /// No description provided for @permissionMicDenied.
  ///
  /// In en, this message translates to:
  /// **'Microphone access denied — allow it in Settings to record voice notes'**
  String get permissionMicDenied;

  /// No description provided for @permissionMicOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get permissionMicOpenSettings;

  /// No description provided for @permissionCameraDenied.
  ///
  /// In en, this message translates to:
  /// **'Camera access denied — allow it in Settings to scan QR codes'**
  String get permissionCameraDenied;

  /// No description provided for @permissionCameraFailed.
  ///
  /// In en, this message translates to:
  /// **'Camera permission is required to scan QR codes'**
  String get permissionCameraFailed;

  /// No description provided for @permissionCameraOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get permissionCameraOpenSettings;

  /// No description provided for @permissionPhotosDenied.
  ///
  /// In en, this message translates to:
  /// **'Photo library access denied — allow it in Settings to save your QR code'**
  String get permissionPhotosDenied;

  /// No description provided for @permissionPhotosFailed.
  ///
  /// In en, this message translates to:
  /// **'Photo library permission is required to save your QR code'**
  String get permissionPhotosFailed;

  /// No description provided for @permissionPhotosOpenSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get permissionPhotosOpenSettings;

  /// No description provided for @permissionFailedSnack.
  ///
  /// In en, this message translates to:
  /// **'Permission request failed: {error}'**
  String permissionFailedSnack(String error);

  /// No description provided for @permissionFooter.
  ///
  /// In en, this message translates to:
  /// **'ResilNet Architecture • Store-and-Forward Multi-hop'**
  String get permissionFooter;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingStart.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onboardingStart;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ResilNet'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Chat on ResilNet over a mesh network — even without the internet'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingFriendsTitle.
  ///
  /// In en, this message translates to:
  /// **'Add friends easily'**
  String get onboardingFriendsTitle;

  /// No description provided for @onboardingFriendsBody.
  ///
  /// In en, this message translates to:
  /// **'Share a QR from Identity, or scan a friend’s QR to exchange public keys'**
  String get onboardingFriendsBody;

  /// No description provided for @onboardingChannelsTitle.
  ///
  /// In en, this message translates to:
  /// **'Encrypted chat + nearby channels'**
  String get onboardingChannelsTitle;

  /// No description provided for @onboardingChannelsBody.
  ///
  /// In en, this message translates to:
  /// **'Switch #mesh / Area (geohash) to find nearby peers — messages stay E2EE over BLE mesh and Nostr'**
  String get onboardingChannelsBody;

  /// No description provided for @chatTitle.
  ///
  /// In en, this message translates to:
  /// **'Chat (E2EE)'**
  String get chatTitle;

  /// No description provided for @chatScanTooltip.
  ///
  /// In en, this message translates to:
  /// **'Scan QR to add a peer'**
  String get chatScanTooltip;

  /// No description provided for @chatBlockTooltip.
  ///
  /// In en, this message translates to:
  /// **'Block this sender'**
  String get chatBlockTooltip;

  /// No description provided for @chatBlockedSnack.
  ///
  /// In en, this message translates to:
  /// **'Blocked: no notifications / no relay'**
  String get chatBlockedSnack;

  /// No description provided for @chatAliasTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set nickname'**
  String get chatAliasTooltip;

  /// No description provided for @chatReceiverPemLabel.
  ///
  /// In en, this message translates to:
  /// **'Recipient public key (PEM)'**
  String get chatReceiverPemLabel;

  /// No description provided for @chatReceiverPemHint.
  ///
  /// In en, this message translates to:
  /// **'Paste your friend’s public key (from QR / shared file)'**
  String get chatReceiverPemHint;

  /// No description provided for @chatNeedPeerKey.
  ///
  /// In en, this message translates to:
  /// **'Scan this peer\'s QR first (verified public key required)'**
  String get chatNeedPeerKey;

  /// No description provided for @chatPeerKeyMismatch.
  ///
  /// In en, this message translates to:
  /// **'Stored public key does not match this peer id'**
  String get chatPeerKeyMismatch;

  /// No description provided for @chatVoiceFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not record audio: {error}'**
  String chatVoiceFailed(String error);

  /// No description provided for @chatPlayVoiceFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not play voice note: {error}'**
  String chatPlayVoiceFailed(String error);

  /// No description provided for @chatPlayVoice.
  ///
  /// In en, this message translates to:
  /// **'Play voice note'**
  String get chatPlayVoice;

  /// No description provided for @chatPauseVoice.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get chatPauseVoice;

  /// No description provided for @chatVoiceLabelSent.
  ///
  /// In en, this message translates to:
  /// **'🎤 Voice note (sealed)'**
  String get chatVoiceLabelSent;

  /// No description provided for @chatVoiceLabel.
  ///
  /// In en, this message translates to:
  /// **'🎤 Voice note'**
  String get chatVoiceLabel;

  /// No description provided for @chatDecryptFailed.
  ///
  /// In en, this message translates to:
  /// **'[decryption failed]'**
  String get chatDecryptFailed;

  /// No description provided for @chatSentSealed.
  ///
  /// In en, this message translates to:
  /// **'[sealed • ct={preview}]'**
  String chatSentSealed(String preview);

  /// No description provided for @chatSentSealedShort.
  ///
  /// In en, this message translates to:
  /// **'[sealed]'**
  String get chatSentSealedShort;

  /// No description provided for @chatComposeHint.
  ///
  /// In en, this message translates to:
  /// **'Type a message… (sealed on send)'**
  String get chatComposeHint;

  /// No description provided for @chatEmptyThread.
  ///
  /// In en, this message translates to:
  /// **'No messages yet\nType below to send over the mesh'**
  String get chatEmptyThread;

  /// No description provided for @chatLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load conversation: {error}'**
  String chatLoadFailed(String error);

  /// No description provided for @chatEmojiTooltip.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get chatEmojiTooltip;

  /// No description provided for @statusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get statusPending;

  /// No description provided for @statusSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get statusSent;

  /// No description provided for @statusRelayed.
  ///
  /// In en, this message translates to:
  /// **'Relayed'**
  String get statusRelayed;

  /// No description provided for @statusDelivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get statusDelivered;

  /// No description provided for @statusRead.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get statusRead;

  /// No description provided for @statusFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get statusFailed;

  /// No description provided for @chatCopy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get chatCopy;

  /// No description provided for @chatDeleteLocal.
  ///
  /// In en, this message translates to:
  /// **'Delete on this device'**
  String get chatDeleteLocal;

  /// No description provided for @chatDeletedLocalSnack.
  ///
  /// In en, this message translates to:
  /// **'Deleted on this device'**
  String get chatDeletedLocalSnack;

  /// No description provided for @chatRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get chatRetry;

  /// No description provided for @chatSendFailed.
  ///
  /// In en, this message translates to:
  /// **'Not delivered — tap Retry'**
  String get chatSendFailed;

  /// No description provided for @chatImageNeedInternet.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to send images'**
  String get chatImageNeedInternet;

  /// No description provided for @chatImageTooLargeOnline.
  ///
  /// In en, this message translates to:
  /// **'Could not compress image enough to send'**
  String get chatImageTooLargeOnline;

  /// No description provided for @chatOpenLinkFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open link'**
  String get chatOpenLinkFailed;

  /// No description provided for @identityTitle.
  ///
  /// In en, this message translates to:
  /// **'Identity'**
  String get identityTitle;

  /// No description provided for @identityScanTooltip.
  ///
  /// In en, this message translates to:
  /// **'Scan QR with camera'**
  String get identityScanTooltip;

  /// No description provided for @identityCopiedHash.
  ///
  /// In en, this message translates to:
  /// **'Public key hash copied'**
  String get identityCopiedHash;

  /// No description provided for @identityPeerSaved.
  ///
  /// In en, this message translates to:
  /// **'Peer saved from QR'**
  String get identityPeerSaved;

  /// No description provided for @identityGalleryDenied.
  ///
  /// In en, this message translates to:
  /// **'Photo library permission denied'**
  String get identityGalleryDenied;

  /// No description provided for @identityQrSaved.
  ///
  /// In en, this message translates to:
  /// **'QR saved to photo library'**
  String get identityQrSaved;

  /// No description provided for @identityQrSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save QR: {error}'**
  String identityQrSaveFailed(String error);

  /// No description provided for @peersTitle.
  ///
  /// In en, this message translates to:
  /// **'Network members'**
  String get peersTitle;

  /// No description provided for @qrScanTitle.
  ///
  /// In en, this message translates to:
  /// **'Scan QR to add a friend'**
  String get qrScanTitle;

  /// No description provided for @qrInvalid.
  ///
  /// In en, this message translates to:
  /// **'Scan failed: invalid QR'**
  String get qrInvalid;

  /// No description provided for @qrIdKeyMismatch.
  ///
  /// In en, this message translates to:
  /// **'QR rejected: id does not match public key'**
  String get qrIdKeyMismatch;

  /// No description provided for @qrCameraNotReady.
  ///
  /// In en, this message translates to:
  /// **'Camera not ready'**
  String get qrCameraNotReady;

  /// No description provided for @qrRetrySettings.
  ///
  /// In en, this message translates to:
  /// **'Try again / open Settings'**
  String get qrRetrySettings;

  /// No description provided for @qrCameraOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open camera: {error}'**
  String qrCameraOpenFailed(String error);

  /// No description provided for @qrScanAlignHint.
  ///
  /// In en, this message translates to:
  /// **'Align the QR code inside the frame'**
  String get qrScanAlignHint;

  /// No description provided for @firmwareDownloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Download ESP32 firmware'**
  String get firmwareDownloadTitle;

  /// No description provided for @firmwareSourceOnline.
  ///
  /// In en, this message translates to:
  /// **'Latest (online)'**
  String get firmwareSourceOnline;

  /// No description provided for @firmwareSourceCached.
  ///
  /// In en, this message translates to:
  /// **'Saved copy (offline)'**
  String get firmwareSourceCached;

  /// No description provided for @firmwareSourceBaseline.
  ///
  /// In en, this message translates to:
  /// **'Bundled baseline (offline)'**
  String get firmwareSourceBaseline;

  /// No description provided for @firmwareSourceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'No firmware available'**
  String get firmwareSourceUnavailable;

  /// No description provided for @firmwareBaselineIncompatible.
  ///
  /// In en, this message translates to:
  /// **'Bundled firmware is too old — connect to the internet to download a newer version'**
  String get firmwareBaselineIncompatible;

  /// No description provided for @firmwareChecksumFailed.
  ///
  /// In en, this message translates to:
  /// **'Firmware failed integrity check — flashing blocked'**
  String get firmwareChecksumFailed;

  /// No description provided for @firmwareReadyFromSource.
  ///
  /// In en, this message translates to:
  /// **'Firmware ready: {source}'**
  String firmwareReadyFromSource(String source);

  /// No description provided for @peersRefreshTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get peersRefreshTooltip;

  /// No description provided for @peersBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get peersBlocked;

  /// No description provided for @peersNearbyBle.
  ///
  /// In en, this message translates to:
  /// **'Nearby (BLE)'**
  String get peersNearbyBle;

  /// No description provided for @peersRecentlyOnline.
  ///
  /// In en, this message translates to:
  /// **'Recently online'**
  String get peersRecentlyOnline;

  /// No description provided for @peersOnlineInArea.
  ///
  /// In en, this message translates to:
  /// **'Online in area'**
  String get peersOnlineInArea;

  /// No description provided for @peersSeenMinutesAgo.
  ///
  /// In en, this message translates to:
  /// **'Seen {minutes} min ago'**
  String peersSeenMinutesAgo(int minutes);

  /// No description provided for @peersOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get peersOffline;

  /// No description provided for @peersBlockedSnack.
  ///
  /// In en, this message translates to:
  /// **'Blocked {id}'**
  String peersBlockedSnack(String id);

  /// No description provided for @peersUnblockedSnack.
  ///
  /// In en, this message translates to:
  /// **'Unblocked'**
  String get peersUnblockedSnack;

  /// No description provided for @peersEmpty.
  ///
  /// In en, this message translates to:
  /// **'No members in the database yet\nScan a QR or wait for BLE mesh discovery'**
  String get peersEmpty;

  /// No description provided for @peersOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get peersOpenChat;

  /// No description provided for @peersBlockAction.
  ///
  /// In en, this message translates to:
  /// **'Block'**
  String get peersBlockAction;

  /// No description provided for @peersUnblockAction.
  ///
  /// In en, this message translates to:
  /// **'Unblock'**
  String get peersUnblockAction;

  /// No description provided for @channelPickerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Chat / #mesh / Area'**
  String get channelPickerTooltip;

  /// No description provided for @locationPickerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Location channel'**
  String get locationPickerTooltip;

  /// No description provided for @transportPickerTooltip.
  ///
  /// In en, this message translates to:
  /// **'Mesh / Internet / Auto'**
  String get transportPickerTooltip;

  /// No description provided for @onlinePeopleTooltip.
  ///
  /// In en, this message translates to:
  /// **'People online'**
  String get onlinePeopleTooltip;

  /// No description provided for @unreadDirectsTooltipEmpty.
  ///
  /// In en, this message translates to:
  /// **'Private messages'**
  String get unreadDirectsTooltipEmpty;

  /// No description provided for @unreadDirectsTooltip.
  ///
  /// In en, this message translates to:
  /// **'{count} unread private messages'**
  String unreadDirectsTooltip(int count);

  /// No description provided for @onlinePeopleTitle.
  ///
  /// In en, this message translates to:
  /// **'people'**
  String get onlinePeopleTitle;

  /// No description provided for @onlinePeopleEmpty.
  ///
  /// In en, this message translates to:
  /// **'No one online here yet'**
  String get onlinePeopleEmpty;

  /// No description provided for @onlinePeopleCount.
  ///
  /// In en, this message translates to:
  /// **'{count} online'**
  String onlinePeopleCount(int count);

  /// No description provided for @onlinePeopleDirectsChannel.
  ///
  /// In en, this message translates to:
  /// **'1:1 · nearby + area'**
  String get onlinePeopleDirectsChannel;

  /// No description provided for @peerOnlineMeshTitle.
  ///
  /// In en, this message translates to:
  /// **'Someone nearby on mesh'**
  String get peerOnlineMeshTitle;

  /// No description provided for @peerOnlineMeshBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is nearby on mesh'**
  String peerOnlineMeshBody(String name);

  /// No description provided for @peerOnlineAreaTitle.
  ///
  /// In en, this message translates to:
  /// **'Someone online in area'**
  String get peerOnlineAreaTitle;

  /// No description provided for @peerOnlineAreaBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is online via Nostr'**
  String peerOnlineAreaBody(String name);

  /// No description provided for @locationSheetTitle.
  ///
  /// In en, this message translates to:
  /// **'#location channels'**
  String get locationSheetTitle;

  /// No description provided for @channelPinsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pinned'**
  String get channelPinsTitle;

  /// No description provided for @channelPinsHint.
  ///
  /// In en, this message translates to:
  /// **'Pin channels you use often — they stay at the top'**
  String get channelPinsHint;

  /// No description provided for @channelPinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Pin this channel'**
  String get channelPinTooltip;

  /// No description provided for @channelUnpinTooltip.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get channelUnpinTooltip;

  /// No description provided for @locationSheetIntro.
  ///
  /// In en, this message translates to:
  /// **'Chat with people nearby using coarse geohash — not precise GPS. Presence on Internet uses anonymous Nostr keys.'**
  String get locationSheetIntro;

  /// No description provided for @locationMeshSubtitle.
  ///
  /// In en, this message translates to:
  /// **'#bluetooth • ~10–50 m'**
  String get locationMeshSubtitle;

  /// No description provided for @locationTeleportHint.
  ///
  /// In en, this message translates to:
  /// **'#geohash'**
  String get locationTeleportHint;

  /// No description provided for @locationTeleport.
  ///
  /// In en, this message translates to:
  /// **'Teleport'**
  String get locationTeleport;

  /// No description provided for @homeComposeHint.
  ///
  /// In en, this message translates to:
  /// **'Message {channel}'**
  String homeComposeHint(String channel);

  /// No description provided for @homeComposePublicHint.
  ///
  /// In en, this message translates to:
  /// **'Send to {channel} — public'**
  String homeComposePublicHint(String channel);

  /// No description provided for @messageExpiryTitle.
  ///
  /// In en, this message translates to:
  /// **'expires in'**
  String get messageExpiryTitle;

  /// No description provided for @voiceRecordTapToStart.
  ///
  /// In en, this message translates to:
  /// **'Tap to record voice message'**
  String get voiceRecordTapToStart;

  /// No description provided for @voiceRecordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Recording too short — try again'**
  String get voiceRecordTooShort;

  /// No description provided for @voiceRecordFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not save recording — try again'**
  String get voiceRecordFailed;

  /// No description provided for @voicePttHold.
  ///
  /// In en, this message translates to:
  /// **'Hold to record'**
  String get voicePttHold;

  /// No description provided for @voicePttRelease.
  ///
  /// In en, this message translates to:
  /// **'Release to preview'**
  String get voicePttRelease;

  /// No description provided for @voicePttRecording.
  ///
  /// In en, this message translates to:
  /// **'Recording…'**
  String get voicePttRecording;

  /// No description provided for @voicePttDraftReady.
  ///
  /// In en, this message translates to:
  /// **'Voice note ready'**
  String get voicePttDraftReady;

  /// No description provided for @voicePttDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get voicePttDiscard;

  /// No description provided for @voicePttReRecord.
  ///
  /// In en, this message translates to:
  /// **'Record again'**
  String get voicePttReRecord;

  /// No description provided for @voicePttSend.
  ///
  /// In en, this message translates to:
  /// **'Send voice note'**
  String get voicePttSend;

  /// No description provided for @voicePttPlayPreview.
  ///
  /// In en, this message translates to:
  /// **'Play preview'**
  String get voicePttPlayPreview;

  /// No description provided for @voicePttStopPreview.
  ///
  /// In en, this message translates to:
  /// **'Stop preview'**
  String get voicePttStopPreview;

  /// No description provided for @noticesBackfilling.
  ///
  /// In en, this message translates to:
  /// **'Loading notices…'**
  String get noticesBackfilling;

  /// No description provided for @noticesNostrOnline.
  ///
  /// In en, this message translates to:
  /// **'Nostr online'**
  String get noticesNostrOnline;

  /// No description provided for @noticesNostrOffline.
  ///
  /// In en, this message translates to:
  /// **'Nostr offline — bulletin needs Internet'**
  String get noticesNostrOffline;

  /// No description provided for @noticesBackfillLoaded.
  ///
  /// In en, this message translates to:
  /// **'Loaded {count} notices'**
  String noticesBackfillLoaded(int count);

  /// No description provided for @noticePublishFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not publish notice to the area board. Check Nostr connection.'**
  String get noticePublishFailed;

  /// No description provided for @noticeMeshPublishNoLink.
  ///
  /// In en, this message translates to:
  /// **'Saved locally. Connect to a nearby mesh radio (or Wi‑Fi gateway) so others can receive it.'**
  String get noticeMeshPublishNoLink;

  /// No description provided for @noticeMeshPublishSent.
  ///
  /// In en, this message translates to:
  /// **'Bulletin sent to {count} nearby device(s) over BLE.'**
  String noticeMeshPublishSent(int count);

  /// No description provided for @noticeMeshPublishBleFailed.
  ///
  /// In en, this message translates to:
  /// **'Nearby radios seen, but BLE write failed. Keep both apps open on the Notices screen and try again (or use an ESP32 relay).'**
  String get noticeMeshPublishBleFailed;

  /// No description provided for @noticeMeshPublishNoGatt.
  ///
  /// In en, this message translates to:
  /// **'This device’s BLE receiver is not ready. Toggle Bluetooth and reopen Notices.'**
  String get noticeMeshPublishNoGatt;

  /// No description provided for @noticeDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete notice'**
  String get noticeDelete;

  /// No description provided for @noticeDeleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete this notice?'**
  String get noticeDeleteConfirmTitle;

  /// No description provided for @noticeDeleteLocalOnlyBody.
  ///
  /// In en, this message translates to:
  /// **'This removes it only on this device. Others who already received it will still see it.'**
  String get noticeDeleteLocalOnlyBody;

  /// No description provided for @noticeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Notice deleted'**
  String get noticeDeleted;

  /// No description provided for @chatNoticeHidden.
  ///
  /// In en, this message translates to:
  /// **'Area notice — open Notices'**
  String get chatNoticeHidden;

  /// No description provided for @identityDisplayNameTitle.
  ///
  /// In en, this message translates to:
  /// **'Display name'**
  String get identityDisplayNameTitle;

  /// No description provided for @identitySaveName.
  ///
  /// In en, this message translates to:
  /// **'Save name'**
  String get identitySaveName;

  /// No description provided for @identityUserIdLabel.
  ///
  /// In en, this message translates to:
  /// **'User ID (Public Key Hash)'**
  String get identityUserIdLabel;

  /// No description provided for @identityCopyHashTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy public key hash'**
  String get identityCopyHashTooltip;

  /// No description provided for @identityMyQrTitle.
  ///
  /// In en, this message translates to:
  /// **'My QR (id + pubKey + name)'**
  String get identityMyQrTitle;

  /// No description provided for @identityQrFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create QR\n{error}'**
  String identityQrFailed(String error);

  /// No description provided for @identitySaving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get identitySaving;

  /// No description provided for @identitySaveQr.
  ///
  /// In en, this message translates to:
  /// **'Save QR to photo library'**
  String get identitySaveQr;

  /// No description provided for @identityOpenScanner.
  ///
  /// In en, this message translates to:
  /// **'Open camera to scan QR'**
  String get identityOpenScanner;

  /// No description provided for @identityQrHelp.
  ///
  /// In en, this message translates to:
  /// **'Have a friend scan this to save your public key and (if needed) set you as a Verified Issuer'**
  String get identityQrHelp;

  /// No description provided for @identityChatTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: you can also scan a QR in chat to add a public key for E2EE'**
  String get identityChatTip;

  /// No description provided for @infoOpen.
  ///
  /// In en, this message translates to:
  /// **'About / Info'**
  String get infoOpen;

  /// No description provided for @docsGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'User guide'**
  String get docsGuideTitle;

  /// No description provided for @docsGuideSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Opens in browser'**
  String get docsGuideSubtitle;

  /// No description provided for @docsOpenAction.
  ///
  /// In en, this message translates to:
  /// **'Open guide'**
  String get docsOpenAction;

  /// No description provided for @docsOpenFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not open the user guide'**
  String get docsOpenFailed;

  /// No description provided for @firmwareOtaGuideTitle.
  ///
  /// In en, this message translates to:
  /// **'Flash guide & OTA protocol'**
  String get firmwareOtaGuideTitle;

  /// No description provided for @firmwareOtaGuideSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Opens the web guide — .bin downloads and full steps'**
  String get firmwareOtaGuideSubtitle;

  /// No description provided for @firmwareWebDownloadsTitle.
  ///
  /// In en, this message translates to:
  /// **'Firmware downloads on the web'**
  String get firmwareWebDownloadsTitle;

  /// No description provided for @firmwareWebDownloadsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Per-version links and checksums on the docs site'**
  String get firmwareWebDownloadsSubtitle;

  /// No description provided for @inviteCopyShortLink.
  ///
  /// In en, this message translates to:
  /// **'Copy short link'**
  String get inviteCopyShortLink;

  /// No description provided for @inviteShareLink.
  ///
  /// In en, this message translates to:
  /// **'Share link'**
  String get inviteShareLink;

  /// No description provided for @inviteShowFullLink.
  ///
  /// In en, this message translates to:
  /// **'Full link'**
  String get inviteShowFullLink;

  /// No description provided for @inviteCopyFullLink.
  ///
  /// In en, this message translates to:
  /// **'Copy full link'**
  String get inviteCopyFullLink;

  /// No description provided for @inviteLinkCopied.
  ///
  /// In en, this message translates to:
  /// **'Link copied'**
  String get inviteLinkCopied;

  /// No description provided for @inviteLongPressHint.
  ///
  /// In en, this message translates to:
  /// **'Long-press for link actions'**
  String get inviteLongPressHint;

  /// No description provided for @inviteSendInChat.
  ///
  /// In en, this message translates to:
  /// **'Send in ResilNet chat…'**
  String get inviteSendInChat;

  /// No description provided for @inviteSendInChatHint.
  ///
  /// In en, this message translates to:
  /// **'Only people you already have a public key for'**
  String get inviteSendInChatHint;

  /// No description provided for @inviteSendInChatEmpty.
  ///
  /// In en, this message translates to:
  /// **'No messageable chats yet.\nScan a QR, open Area/Mesh, or share the link outside the app first.'**
  String get inviteSendInChatEmpty;

  /// No description provided for @inviteSentToChat.
  ///
  /// In en, this message translates to:
  /// **'Invite sent in chat'**
  String get inviteSentToChat;

  /// No description provided for @infoTabInfo.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get infoTabInfo;

  /// No description provided for @infoTabSettingsHint.
  ///
  /// In en, this message translates to:
  /// **'Open Settings from the menu for language, E2EE, and data tools'**
  String get infoTabSettingsHint;

  /// No description provided for @infoHowToTitle.
  ///
  /// In en, this message translates to:
  /// **'How to use'**
  String get infoHowToTitle;

  /// No description provided for @infoHowToBody.
  ///
  /// In en, this message translates to:
  /// **'• Tap the channel icon to switch Chat / #mesh / Area\n• Tap place to pick geohash size\n• Tap people for members or who’s online\n• Open Identity/QR from ⋮ to exchange keys in person\n• Area “public” sends sealed E2EE to each online peer — not a plaintext room'**
  String get infoHowToBody;

  /// No description provided for @infoFeaturesTitle.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get infoFeaturesTitle;

  /// No description provided for @infoFeatureOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline messaging via Bluetooth Low Energy'**
  String get infoFeatureOffline;

  /// No description provided for @infoFeatureE2ee.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encryption with RSA-OAEP + AES-GCM (not Noise)'**
  String get infoFeatureE2ee;

  /// No description provided for @infoFeatureMultihop.
  ///
  /// In en, this message translates to:
  /// **'Messages can hop through nearby peers to go farther'**
  String get infoFeatureMultihop;

  /// No description provided for @infoFeatureBridge.
  ///
  /// In en, this message translates to:
  /// **'Hybrid mesh ↔ internet (Nostr) for sealed envelopes'**
  String get infoFeatureBridge;

  /// No description provided for @infoFeatureGeo.
  ///
  /// In en, this message translates to:
  /// **'Local geohash channels for people nearby (discovery UX)'**
  String get infoFeatureGeo;

  /// No description provided for @infoFeatureNotices.
  ///
  /// In en, this message translates to:
  /// **'Notices with expiry for #mesh and Area'**
  String get infoFeatureNotices;

  /// No description provided for @infoPrivacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get infoPrivacyTitle;

  /// No description provided for @infoPrivacyNoRoom.
  ///
  /// In en, this message translates to:
  /// **'No plaintext village / public chat room on the wire'**
  String get infoPrivacyNoRoom;

  /// No description provided for @infoPrivacyFanout.
  ///
  /// In en, this message translates to:
  /// **'Area send = sealed 1:1 fan-out to peers with known public keys'**
  String get infoPrivacyFanout;

  /// No description provided for @infoPrivacyPresence.
  ///
  /// In en, this message translates to:
  /// **'Internet area presence uses ephemeral Nostr keys'**
  String get infoPrivacyPresence;

  /// No description provided for @infoSymbolsTitle.
  ///
  /// In en, this message translates to:
  /// **'Symbols'**
  String get infoSymbolsTitle;

  /// No description provided for @infoSymBle.
  ///
  /// In en, this message translates to:
  /// **'Direct Bluetooth link'**
  String get infoSymBle;

  /// No description provided for @infoSymMesh.
  ///
  /// In en, this message translates to:
  /// **'Reachable via mesh (others forward)'**
  String get infoSymMesh;

  /// No description provided for @infoSymInternet.
  ///
  /// In en, this message translates to:
  /// **'Via internet (Nostr) — sealed envelopes'**
  String get infoSymInternet;

  /// No description provided for @infoSymBridge.
  ///
  /// In en, this message translates to:
  /// **'Arrived via mesh↔internet bridge path'**
  String get infoSymBridge;

  /// No description provided for @infoSymOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline — not reachable right now'**
  String get infoSymOffline;

  /// No description provided for @infoSymInArea.
  ///
  /// In en, this message translates to:
  /// **'In this location channel’s area'**
  String get infoSymInArea;

  /// No description provided for @infoSymE2eeOk.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encrypted session'**
  String get infoSymE2eeOk;

  /// No description provided for @infoSymE2eeFail.
  ///
  /// In en, this message translates to:
  /// **'Encryption unavailable — do not send sensitive text'**
  String get infoSymE2eeFail;

  /// No description provided for @infoSymVerified.
  ///
  /// In en, this message translates to:
  /// **'Identity verified / known key'**
  String get infoSymVerified;

  /// No description provided for @infoSymBlocked.
  ///
  /// In en, this message translates to:
  /// **'Blocked'**
  String get infoSymBlocked;

  /// No description provided for @infoSymUnread.
  ///
  /// In en, this message translates to:
  /// **'Unread private message'**
  String get infoSymUnread;

  /// No description provided for @infoEmergencyTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency mode'**
  String get infoEmergencyTitle;

  /// No description provided for @infoEmergencyBody.
  ///
  /// In en, this message translates to:
  /// **'Triple-tap the ResilNet title on the home screen to wipe messages, keys, and identity on this device.'**
  String get infoEmergencyBody;

  /// No description provided for @infoLegendNote.
  ///
  /// In en, this message translates to:
  /// **'Some path icons are documented here for clarity; delivery ticks in chat remain the primary send status.'**
  String get infoLegendNote;

  /// No description provided for @dangerZoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Danger zone'**
  String get dangerZoneTitle;

  /// No description provided for @dangerZoneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Deletes messages, encryption keys, Nostr identity, peers, and nicknames on this device. You will set up again.'**
  String get dangerZoneSubtitle;

  /// No description provided for @panicWipeTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency wipe'**
  String get panicWipeTitle;

  /// No description provided for @panicWipeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Erase everything local — same as triple-tapping the home title (double-tap refreshes radios)'**
  String get panicWipeSubtitle;

  /// No description provided for @panicWipeConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Wipe all local data?'**
  String get panicWipeConfirmTitle;

  /// No description provided for @panicWipeConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes chats, keys, and identity on this phone.\nPeers must re-exchange QR keys with your new identity.\nThis cannot be undone.'**
  String get panicWipeConfirmBody;

  /// No description provided for @panicWipeAction.
  ///
  /// In en, this message translates to:
  /// **'Wipe everything'**
  String get panicWipeAction;

  /// No description provided for @panicWipeSnack.
  ///
  /// In en, this message translates to:
  /// **'Local identity wiped — set up again'**
  String get panicWipeSnack;

  /// No description provided for @panicWipeFailed.
  ///
  /// In en, this message translates to:
  /// **'Wipe failed: {error}'**
  String panicWipeFailed(String error);

  /// No description provided for @meshBridgeTitle.
  ///
  /// In en, this message translates to:
  /// **'Mesh bridge'**
  String get meshBridgeTitle;

  /// No description provided for @meshBridgeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'When on (default), sealed envelopes may use both BLE mesh and internet (Nostr) together so nearby mesh islands can connect. When off, sends use one path only — never puts plaintext on the wire.'**
  String get meshBridgeSubtitle;

  /// No description provided for @favoritesTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoritesTitle;

  /// No description provided for @favoritesAdd.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get favoritesAdd;

  /// No description provided for @favoritesRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get favoritesRemove;

  /// No description provided for @favoritesEmpty.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet — star a peer from the member list'**
  String get favoritesEmpty;

  /// No description provided for @favoritesNearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorite nearby'**
  String get favoritesNearbyTitle;

  /// No description provided for @favoritesNearbyBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is nearby on mesh'**
  String favoritesNearbyBody(String name);

  /// No description provided for @favoritesInAreaTitle.
  ///
  /// In en, this message translates to:
  /// **'Favorite in area'**
  String get favoritesInAreaTitle;

  /// No description provided for @favoritesInAreaBody.
  ///
  /// In en, this message translates to:
  /// **'{name} is online in this area'**
  String favoritesInAreaBody(String name);

  /// No description provided for @topologyTitle.
  ///
  /// In en, this message translates to:
  /// **'Mesh topology'**
  String get topologyTitle;

  /// No description provided for @topologySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Peers and connection hints from mesh announce (read-only)'**
  String get topologySubtitle;

  /// No description provided for @topologyConnectedNow.
  ///
  /// In en, this message translates to:
  /// **'Connected now (BLE)'**
  String get topologyConnectedNow;

  /// No description provided for @topologyNearby.
  ///
  /// In en, this message translates to:
  /// **'Nearby (BLE)'**
  String get topologyNearby;

  /// No description provided for @topologyKnown.
  ///
  /// In en, this message translates to:
  /// **'Known peers'**
  String get topologyKnown;

  /// No description provided for @topologyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No peers learned yet — stay nearby with BLE on'**
  String get topologyEmpty;

  /// No description provided for @topologyYou.
  ///
  /// In en, this message translates to:
  /// **'you'**
  String get topologyYou;

  /// No description provided for @topologyStats.
  ///
  /// In en, this message translates to:
  /// **'{peers} peers · {links} links'**
  String topologyStats(int peers, int links);

  /// No description provided for @topologyGraphHint.
  ///
  /// In en, this message translates to:
  /// **'Estimated from nearby mesh discovery — your device is highlighted. Tap a peer to open chat.'**
  String get topologyGraphHint;

  /// No description provided for @topologyOpen.
  ///
  /// In en, this message translates to:
  /// **'Mesh topology'**
  String get topologyOpen;

  /// No description provided for @slashHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Commands'**
  String get slashHelpTitle;

  /// No description provided for @slashHelpBody.
  ///
  /// In en, this message translates to:
  /// **'/help — this list\n/who — people online in current channel\n/drop <text> — pin a sealed notice here (E2EE fan-out)\n\nFull guide: use Open guide below, or Settings → User guide.'**
  String get slashHelpBody;

  /// No description provided for @slashWhoEmpty.
  ///
  /// In en, this message translates to:
  /// **'No one online in this channel right now'**
  String get slashWhoEmpty;

  /// No description provided for @slashWhoTitle.
  ///
  /// In en, this message translates to:
  /// **'Online ({count})'**
  String slashWhoTitle(int count);

  /// No description provided for @slashDropNeedText.
  ///
  /// In en, this message translates to:
  /// **'Usage: /drop your note text'**
  String get slashDropNeedText;

  /// No description provided for @slashDropDone.
  ///
  /// In en, this message translates to:
  /// **'Dropped notice on {channel}'**
  String slashDropDone(String channel);

  /// No description provided for @slashUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown command — try /help'**
  String get slashUnknown;

  /// No description provided for @announceOpen.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announceOpen;

  /// No description provided for @announceTitle.
  ///
  /// In en, this message translates to:
  /// **'Announcements'**
  String get announceTitle;

  /// No description provided for @announceEmpty.
  ///
  /// In en, this message translates to:
  /// **'No boards yet — create one to post locked or open notices'**
  String get announceEmpty;

  /// No description provided for @announceCreate.
  ///
  /// In en, this message translates to:
  /// **'Create board'**
  String get announceCreate;

  /// No description provided for @announceCreateHint.
  ///
  /// In en, this message translates to:
  /// **'Board name'**
  String get announceCreateHint;

  /// No description provided for @announceDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Community board'**
  String get announceDefaultTitle;

  /// No description provided for @announceSettings.
  ///
  /// In en, this message translates to:
  /// **'Board settings'**
  String get announceSettings;

  /// No description provided for @announceAllowLocked.
  ///
  /// In en, this message translates to:
  /// **'Allow locked (encrypted) posts'**
  String get announceAllowLocked;

  /// No description provided for @announceAllowLockedSub.
  ///
  /// In en, this message translates to:
  /// **'Encrypted to the board key — readers need access'**
  String get announceAllowLockedSub;

  /// No description provided for @announceAllowOpen.
  ///
  /// In en, this message translates to:
  /// **'Allow open (plaintext) posts'**
  String get announceAllowOpen;

  /// No description provided for @announceAllowOpenSub.
  ///
  /// In en, this message translates to:
  /// **'Not E2EE — readable on mesh/relays. Off by default.'**
  String get announceAllowOpenSub;

  /// No description provided for @announceComposeHint.
  ///
  /// In en, this message translates to:
  /// **'Write an announcement…'**
  String get announceComposeHint;

  /// No description provided for @announceMediaInternetOnly.
  ///
  /// In en, this message translates to:
  /// **'Photo/voice announcements send over the internet (not BLE)'**
  String get announceMediaInternetOnly;

  /// No description provided for @announceNeedInternet.
  ///
  /// In en, this message translates to:
  /// **'Connect to the internet to send photo or voice announcements'**
  String get announceNeedInternet;

  /// No description provided for @announceVoiceFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not record voice: {error}'**
  String announceVoiceFailed(String error);

  /// No description provided for @announceImageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'Image is too large (max ~180 KB)'**
  String get announceImageTooLarge;

  /// No description provided for @announcePlayVoice.
  ///
  /// In en, this message translates to:
  /// **'Play voice note'**
  String get announcePlayVoice;

  /// No description provided for @announceImageLabel.
  ///
  /// In en, this message translates to:
  /// **'📷 Image'**
  String get announceImageLabel;

  /// No description provided for @announceAudioLabel.
  ///
  /// In en, this message translates to:
  /// **'🎤 Voice note'**
  String get announceAudioLabel;

  /// No description provided for @announceModeLocked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get announceModeLocked;

  /// No description provided for @announceModeOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get announceModeOpen;

  /// No description provided for @announceOpenBadge.
  ///
  /// In en, this message translates to:
  /// **'OPEN · not encrypted'**
  String get announceOpenBadge;

  /// No description provided for @announceLockedBadge.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get announceLockedBadge;

  /// No description provided for @announceLockedPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'Encrypted — request access to read'**
  String get announceLockedPlaceholder;

  /// No description provided for @announceRequestAccess.
  ///
  /// In en, this message translates to:
  /// **'Request access'**
  String get announceRequestAccess;

  /// No description provided for @announceRequestSent.
  ///
  /// In en, this message translates to:
  /// **'Access request sent to the board owner'**
  String get announceRequestSent;

  /// No description provided for @announceRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not request access (need owner’s public key)'**
  String get announceRequestFailed;

  /// No description provided for @announceOpenConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Post without encryption?'**
  String get announceOpenConfirmTitle;

  /// No description provided for @announceOpenConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'Open posts are not E2EE. Anyone on the path (mesh / relays) may read them. Continue?'**
  String get announceOpenConfirmBody;

  /// No description provided for @announcePostAction.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get announcePostAction;

  /// No description provided for @announcePendingRequests.
  ///
  /// In en, this message translates to:
  /// **'Access requests'**
  String get announcePendingRequests;

  /// No description provided for @announceApprove.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get announceApprove;

  /// No description provided for @announceDeny.
  ///
  /// In en, this message translates to:
  /// **'Deny'**
  String get announceDeny;

  /// No description provided for @announceGranted.
  ///
  /// In en, this message translates to:
  /// **'You can read locked posts on this board'**
  String get announceGranted;

  /// No description provided for @announceOwner.
  ///
  /// In en, this message translates to:
  /// **'You own this board'**
  String get announceOwner;

  /// No description provided for @announceCopyInvite.
  ///
  /// In en, this message translates to:
  /// **'Copy invite text'**
  String get announceCopyInvite;

  /// No description provided for @announceShowInviteQr.
  ///
  /// In en, this message translates to:
  /// **'Show invite QR'**
  String get announceShowInviteQr;

  /// No description provided for @announceScanInviteQr.
  ///
  /// In en, this message translates to:
  /// **'Scan board invite QR'**
  String get announceScanInviteQr;

  /// No description provided for @announceFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow board from invite'**
  String get announceFollow;

  /// No description provided for @announceFollowHint.
  ///
  /// In en, this message translates to:
  /// **'Paste the invite text or ResilNet link from the owner'**
  String get announceFollowHint;

  /// No description provided for @announceFollowOk.
  ///
  /// In en, this message translates to:
  /// **'Following board'**
  String get announceFollowOk;

  /// No description provided for @announceFollowOkNamed.
  ///
  /// In en, this message translates to:
  /// **'Now following “{title}”'**
  String announceFollowOkNamed(String title);

  /// No description provided for @announceFollowFail.
  ///
  /// In en, this message translates to:
  /// **'Invite is invalid or damaged'**
  String get announceFollowFail;

  /// No description provided for @announceInviteCopied.
  ///
  /// In en, this message translates to:
  /// **'Invite text copied'**
  String get announceInviteCopied;

  /// No description provided for @announceInviteSaveQr.
  ///
  /// In en, this message translates to:
  /// **'Save QR'**
  String get announceInviteSaveQr;

  /// No description provided for @announceInviteShare.
  ///
  /// In en, this message translates to:
  /// **'Share invite'**
  String get announceInviteShare;

  /// No description provided for @announceFollowFromCompose.
  ///
  /// In en, this message translates to:
  /// **'Board invite detected in the message box'**
  String get announceFollowFromCompose;

  /// No description provided for @peerConfirmAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add network member?'**
  String get peerConfirmAddTitle;

  /// No description provided for @peerConfirmAddBody.
  ///
  /// In en, this message translates to:
  /// **'Add “{name}” with their public key so you can message them privately?'**
  String peerConfirmAddBody(String name);

  /// No description provided for @peerConfirmAdd.
  ///
  /// In en, this message translates to:
  /// **'Add member'**
  String get peerConfirmAdd;

  /// No description provided for @peerAddedOk.
  ///
  /// In en, this message translates to:
  /// **'Added {name} to network members'**
  String peerAddedOk(String name);

  /// No description provided for @peerAddFromCompose.
  ///
  /// In en, this message translates to:
  /// **'Identity / public key detected in the message box'**
  String get peerAddFromCompose;

  /// No description provided for @peerHashCopied.
  ///
  /// In en, this message translates to:
  /// **'Public key hash copied'**
  String get peerHashCopied;

  /// No description provided for @peerHashOpenChat.
  ///
  /// In en, this message translates to:
  /// **'Open chat'**
  String get peerHashOpenChat;

  /// No description provided for @peerHashAddHint.
  ///
  /// In en, this message translates to:
  /// **'Hash copied. Ask them to share their identity link or QR so you can add the full public key for E2EE.'**
  String get peerHashAddHint;

  /// No description provided for @peerQrNoCode.
  ///
  /// In en, this message translates to:
  /// **'No ResilNet QR found in this image'**
  String get peerQrNoCode;

  /// No description provided for @identityInviteSharePreamble.
  ///
  /// In en, this message translates to:
  /// **'ResilNet identity: “{name}”\nOpen the link or paste it in chat → Add member\nOr scan the identity QR.'**
  String identityInviteSharePreamble(String name);

  /// No description provided for @identityShareInvite.
  ///
  /// In en, this message translates to:
  /// **'Share identity link'**
  String get identityShareInvite;

  /// No description provided for @identityInviteCopied.
  ///
  /// In en, this message translates to:
  /// **'Identity link copied'**
  String get identityInviteCopied;

  /// No description provided for @announceInviteSharePreamble.
  ///
  /// In en, this message translates to:
  /// **'Board invite: “{title}”\nOpen ResilNet → Community boards → Follow from invite\nOr scan the QR / tap the link below.'**
  String announceInviteSharePreamble(String title);

  /// No description provided for @announceConfirmFollowTitle.
  ///
  /// In en, this message translates to:
  /// **'Follow this board?'**
  String get announceConfirmFollowTitle;

  /// No description provided for @announceConfirmFollowBody.
  ///
  /// In en, this message translates to:
  /// **'Follow “{title}” from this invite?'**
  String announceConfirmFollowBody(String title);

  /// No description provided for @announceConfirmFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow'**
  String get announceConfirmFollow;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'bn',
    'cs',
    'de',
    'en',
    'es',
    'fa',
    'fi',
    'fr',
    'gu',
    'he',
    'hi',
    'id',
    'it',
    'ja',
    'kn',
    'ko',
    'ksw',
    'ml',
    'mr',
    'ms',
    'my',
    'nl',
    'pa',
    'pl',
    'pt',
    'ru',
    'sv',
    'ta',
    'te',
    'th',
    'tr',
    'uk',
    'ur',
    'vi',
    'zh',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'gu':
      return AppLocalizationsGu();
    case 'he':
      return AppLocalizationsHe();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'kn':
      return AppLocalizationsKn();
    case 'ko':
      return AppLocalizationsKo();
    case 'ksw':
      return AppLocalizationsKsw();
    case 'ml':
      return AppLocalizationsMl();
    case 'mr':
      return AppLocalizationsMr();
    case 'ms':
      return AppLocalizationsMs();
    case 'my':
      return AppLocalizationsMy();
    case 'nl':
      return AppLocalizationsNl();
    case 'pa':
      return AppLocalizationsPa();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sv':
      return AppLocalizationsSv();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'ur':
      return AppLocalizationsUr();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

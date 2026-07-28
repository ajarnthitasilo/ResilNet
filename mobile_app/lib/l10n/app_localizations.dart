import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_th.dart';

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
    Locale('en'),
    Locale('th'),
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
  /// **'Follow system language, or choose Thai / English'**
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
  /// **'Voice note too large — keep under ~8 seconds'**
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
  /// **'Mesh = BLE nearby · Internet = anonymous Nostr presence · Auto = both'**
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
  /// **'Pin short announcements for people around you. They hop phone-to-phone offline and fade after a few days.'**
  String get noticesMeshIntro;

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
  /// **'Image too large (max ~180KB)'**
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
  /// **'Transmitted'**
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
  /// **'Erase everything local — same as triple-tapping the home title'**
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
  /// **'/help — this list\n/who — people online in current channel\n/drop <text> — pin a sealed notice here (E2EE fan-out)'**
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
  /// **'Copy board invite'**
  String get announceCopyInvite;

  /// No description provided for @announceFollow.
  ///
  /// In en, this message translates to:
  /// **'Follow board from invite'**
  String get announceFollow;

  /// No description provided for @announceFollowHint.
  ///
  /// In en, this message translates to:
  /// **'Paste board invite JSON from the owner'**
  String get announceFollowHint;

  /// No description provided for @announceFollowOk.
  ///
  /// In en, this message translates to:
  /// **'Following board'**
  String get announceFollowOk;

  /// No description provided for @announceFollowFail.
  ///
  /// In en, this message translates to:
  /// **'Invalid invite'**
  String get announceFollowFail;

  /// No description provided for @announceInviteCopied.
  ///
  /// In en, this message translates to:
  /// **'Invite copied'**
  String get announceInviteCopied;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'th'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'th':
      return AppLocalizationsTh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

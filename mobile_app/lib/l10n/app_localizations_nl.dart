// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Vernieuwen ResilNet…';

  @override
  String get appRefreshed =>
      'Vernieuwd: radio\'s en ontdekking zijn opnieuw gestart';

  @override
  String appRefreshFailed(String error) {
    return 'Vernieuwen mislukt: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Dubbeltikken = zacht vernieuwen. Lang indrukken = moeilijk herstellen. Driemaal tikken = noodvegen.';

  @override
  String get softRefreshTipTitle => 'Als ResilNet vastzit';

  @override
  String get softRefreshTipBody =>
      'Dubbeltik op ResilNet (linksboven) voor een zachte radiovernieuwing. Als het nog steeds vastzit: druk lang op de titel, gebruik ⋮ → Hard herstellen of Instellingen. Drie keer tikken is alleen voor noodgevallen.';

  @override
  String get softRefreshTipGotIt => 'Ik heb het';

  @override
  String get infoSoftRefreshTitle => 'Als de app vastloopt';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Dubbeltik op ResilNet (linksboven) → radio\'s en mensen in de buurt zacht vernieuwen';

  @override
  String get infoSoftRefreshStepHard =>
      'Zit je nog steeds vast? Druk lang op de titel, of ⋮ / Instellingen → Hard herstellen';

  @override
  String get infoSoftRefreshStepWait =>
      'Wacht op het resultaat van de snackbar en probeer het opnieuw. Sessiereset behoudt uw sleutels.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Driemaal tikken = wissen in noodgevallen (verwijdert lokale gegevens) – alleen als dit opzettelijk is gedaan';

  @override
  String get appRecoverySection => 'App-herstel';

  @override
  String get appRecoverySectionSubtitle =>
      'Gebruik wanneer de app bevroren aanvoelt. Zacht = titel dubbeltikken. Hard herstel is sterker. Sessiereset start de services opnieuw zonder sleutels te wissen.';

  @override
  String get appHardRecoverAction => 'Moeilijk herstellen';

  @override
  String get appHardRecovering => 'Moeilijk herstellen…';

  @override
  String get appSessionResetAction => 'Sessie opnieuw instellen';

  @override
  String get appSessionResetRunning => 'Sessie resetten…';

  @override
  String get appSessionResetConfirmTitle => 'Sessie resetten?';

  @override
  String get appSessionResetConfirmBody =>
      'Start ResilNet services opnieuw op dit apparaat. Uw identiteitssleutels worden bewaard.';

  @override
  String get appRecoveryBusy => 'Herstel is al actief...';

  @override
  String get appRecoveryOk => 'Herstel voltooid';

  @override
  String get appRecoveryPartial =>
      'Herstel voltooid, waarbij enkele stappen zijn overgeslagen. Probeer het opnieuw als het nog steeds vastzit';

  @override
  String get appRecoveryFailed =>
      'Herstel mislukt. Probeer Sessie opnieuw in te stellen of sluit de app geforceerd af vanuit het besturingssysteem';

  @override
  String get localWifiTitle => 'Lokaal Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Koppel apparaten in de buurt zonder internet, net alsof u zich op één LAN bevindt.';

  @override
  String get localWifiNotGatewayHint =>
      'Niet de ESP32 LoRa-gateway SoftAP. Dit is alleen telefoon↔telefoon/LAN.';

  @override
  String get localWifiUnavailable =>
      'Lokaal Wi‑Fi is nog niet gereed. Wacht tot de app is opgestart.';

  @override
  String get lxmfBridgeTitle => 'Thuisknooppunt';

  @override
  String get lxmfBridgeSubtitle =>
      'Optionele Mac of Pi op je Wi‑Fi die verzegelde chats doorstuurt. Standaard uitgeschakeld. Vervangt geen end-to-end-encryptie.';

  @override
  String get lxmfBridgeEnable => 'Gebruik het thuisknooppunt';

  @override
  String get lxmfBridgeDisabledHint =>
      'Schakel deze alleen in als de bridge-app op een Mac of Pi in dit netwerk draait.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Kan thuisknooppunt niet bereiken: $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Thuisknooppuntadres';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP of http://IP:port — bijvoorbeeld 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF bestemming (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Status opslaan en vernieuwen';

  @override
  String get lxmfBridgeLabHint => 'Geavanceerd: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Instellingen voor het thuisknooppunt';

  @override
  String get lxmfBridgeCheckConnection => 'Controleer de verbinding';

  @override
  String get lxmfBridgeStatusOnline => 'Verbonden met het thuisknooppunt';

  @override
  String get lxmfBridgeStatusOffline => 'Thuisknooppunt niet bereikbaar';

  @override
  String get lxmfBridgeYourDest =>
      'Het adres van dit knooppunt (deel met vrienden)';

  @override
  String get lxmfBridgeCopyDest => 'Kopieer adres';

  @override
  String get lxmfBridgeDestCopied => 'Adres gekopieerd';

  @override
  String get lxmfBridgeLinkedPeers => 'Gekoppelde vrienden';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Elke vriend heeft één keer zijn thuisknooppuntadres nodig. Dan kunnen verzegelde chats dit pad gebruiken.';

  @override
  String get lxmfBridgeNoLinks => 'Er zijn nog geen vrienden gekoppeld.';

  @override
  String get lxmfBridgeAddLink => 'Koppel een vriend';

  @override
  String get lxmfBridgePickPeer => 'Vriend';

  @override
  String get lxmfBridgePeerDest => 'Hun thuisknooppuntadres';

  @override
  String get lxmfBridgePeerDestHint =>
      'Code van 32 tekens uit hun thuisknooppuntscherm';

  @override
  String get lxmfBridgeInvalidDest =>
      'Dat adres lijkt niet geldig. Plak de volledige code van hun thuisknooppunt.';

  @override
  String get lxmfBridgeRemoveLink => 'Ontkoppelen';

  @override
  String get lxmfBridgeSaveLink => 'Redden';

  @override
  String get lxmfBridgeLinkSaved => 'Vriend gekoppeld';

  @override
  String get lxmfBridgeNoPeers =>
      'Nog geen contactpersonen die een bericht kunnen sturen. Voeg eerst een vriend toe.';

  @override
  String get lxmfBridgeHelp =>
      'Houd de bridge actief op de Mac/Pi. Dit pad blijft op uw LAN; het is niet LoRa en vervangt internet of Bluetooth-mesh niet.';

  @override
  String get localWifiModeHotspot => 'In de buurt';

  @override
  String get localWifiModeRouter => 'Router';

  @override
  String get localWifiHotspotIntro =>
      'Eén apparaat deelt een persoonlijke hotspot. Anderen sluiten zich aan bij die hotspot en ResilNet vindt ze vervolgens op het lokale netwerk.';

  @override
  String get localWifiHostAction => 'Netwerk maken (host)';

  @override
  String get localWifiJoinAction => 'Sluit je aan bij netwerk';

  @override
  String get localWifiHostSteps =>
      '1. Open iOS/Android-instellingen en schakel Persoonlijke hotspot (of internet delen) in.\n2. Vertel vrienden de hotspotnaam (en wachtwoord).\n3. Kom hier terug en tik op \'Hotspot is aan - begin met wachten\'.';

  @override
  String get localWifiHostReady => 'Hotspot is ingeschakeld, wacht maar';

  @override
  String get localWifiHostWaiting => 'Wachten tot vrienden lid worden...';

  @override
  String get localWifiJoinSteps =>
      '1. Open systeeminstellingen en word lid van de persoonlijke hotspot van uw vriend.\n2. Keer hier terug en tik op “Ik ben verbonden – zoeken”.';

  @override
  String get localWifiJoinReady => 'Ik ben verbonden - zoek';

  @override
  String get localWifiRouterIntro =>
      'Verbind elk apparaat met dezelfde Wi‑Fi router/AP. De router heeft geen internet nodig, alleen een gedeeld lokaal netwerk.';

  @override
  String get localWifiRouterSearch => 'Zoek op deze Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Ververs Wi‑Fi informatie';

  @override
  String get localWifiRouterNoWifiTitle => 'Niet op Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Voeg de Wi‑Fi van de router toe in de systeeminstellingen en zoek vervolgens opnieuw.';

  @override
  String get localWifiDiscovering => 'Zoeken op lokaal Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Apparaten op dit netwerk';

  @override
  String get localWifiStop => 'Stop';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi naam niet beschikbaar';

  @override
  String get localWifiStubBanner => 'Wachten op LAN-aansluiting…';

  @override
  String get localWifiLiveBanner =>
      'LAN-detectie live (UDP) — kondig + verzegelde chat aan op deze Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Nog geen apparaten.\nControleer of vrienden zich bij uw hotspot hebben aangesloten en toegang tot het lokale netwerk hebben toegestaan.';

  @override
  String get localWifiEmptyRouter =>
      'Nog geen apparaten.\nZelfde SSID? Lokaal netwerk toegestaan? Sommige routers blokkeren apparaat-naar-apparaat-verkeer (AP-isolatie).';

  @override
  String get localWifiIsolationHelp => 'Waarom kunnen we elkaar niet vinden?';

  @override
  String get localWifiIsolationTitle => 'Router kan clients isoleren';

  @override
  String get localWifiIsolationBody =>
      'Als AP/Client-isolatie (of een gastnetwerk) is ingeschakeld, kunnen telefoons op dezelfde Wi‑Fi niet praten. Schakel de isolatie uit, gebruik de hoofd-SSID of schakel over naar de modus Dichtbij (Hotspot).';

  @override
  String get localWifiPeerReady => 'Klaar om te chatten (heeft sleutel)';

  @override
  String get localWifiPeerNeedKey =>
      'Gevonden: scan QR om sleutels uit te wisselen';

  @override
  String get localWifiErrorTitle => 'Lokale Wi‑Fi-fout';

  @override
  String get localWifiErrorBody =>
      'Er is iets misgegaan. Stop en probeer het opnieuw.';

  @override
  String get preparingSystem => 'Systeem voorbereiden…';

  @override
  String get bootFailedTitle => 'Kon niet starten';

  @override
  String get retry => 'Probeer het opnieuw';

  @override
  String get bootRecoveryAction =>
      'Nieuwe identiteit starten (lokale gegevens wissen)';

  @override
  String get bootRecoveryConfirmTitle => 'Nieuwe identiteit starten?';

  @override
  String get bootRecoveryConfirmBody =>
      'Hierdoor worden lokale chats, sleutels en identiteit op dit apparaat permanent gewist.\nPeers moeten uw QR opnieuw scannen met uw nieuwe identiteit.\nDit kan niet ongedaan worden gemaakt.';

  @override
  String get bootRecoveryRunning => 'Lokale identiteit opnieuw instellen…';

  @override
  String get bootRecoverySuccess => 'Reset van lokale identiteit voltooid';

  @override
  String bootRecoveryFailed(String error) {
    return 'Kan identiteit niet resetten: $error';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Redden';

  @override
  String get close => 'Dichtbij';

  @override
  String get start => 'Start';

  @override
  String get send => 'Versturen';

  @override
  String get settings => 'Instellingen';

  @override
  String get language => 'Taal';

  @override
  String get languageSubtitle =>
      'Standaard volgt de app de taal van uw telefoon (indien ondersteund). Andere talen vallen terug op het Engels. U kunt hier ook een taal vergrendelen.';

  @override
  String get languageSystem => 'Systeemstandaard';

  @override
  String get languageThai => 'Thais';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get notificationsTooltip => 'Meldingsinstellingen';

  @override
  String get enableMessageNotifications => 'Schakel berichtmeldingen in';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 berichten en mensen online (lokale waarschuwingen)';

  @override
  String get networkMembersTooltip => 'Netwerk leden';

  @override
  String get identityQrTooltip => 'Identiteit / QR';

  @override
  String get feedDirects => 'Chat';

  @override
  String get feedMesh => '#gaas';

  @override
  String get feedGeo => 'Gebied';

  @override
  String get feedDirectsSubtitle => 'Privé E2EE-berichten';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'Collega\'s in de buurt (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash-ontdekkingskanaal';

  @override
  String get peerIdHint =>
      'Plak de ontvanger-ID (Public Key Hash) om een ​​chat te starten';

  @override
  String get directsEmpty =>
      'Nog geen chats: scan een QR of plak een ontvanger-ID om te beginnen\nBerichten worden vóór verzending verzegeld met E2EE (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • tik om de chat te openen';

  @override
  String get meshIntro =>
      'Peers in BLE bereik: tik voor een privé E2EE-chat (geen openbare compositie op #mesh)\nVerzendt via hybride router (BLE + LoRa + Nostr wanneer online)';

  @override
  String get meshEmptyRunning =>
      'Nog geen peers in de buurt: open de app op een ander apparaat binnen BLE bereik';

  @override
  String get meshEmptyStopped =>
      'BLE is niet actief: verleen toestemming voor Bluetooth/Locatie';

  @override
  String get meshNearbyPrefix => 'In de buurt';

  @override
  String get meshRetentionTitle => 'Berichten automatisch verwijderen';

  @override
  String get meshRetentionSubtitle =>
      'Oudere lokale chatgeschiedenis wordt automatisch verwijderd';

  @override
  String get meshRetentionKeep => 'Houden';

  @override
  String get meshRetention1Day => '1 dag';

  @override
  String get meshRetention3Days => '3 dagen';

  @override
  String get meshRetention7Days => '7 dagen';

  @override
  String get refreshLocationTooltip => 'Locatie vernieuwen';

  @override
  String get geoIntro =>
      'Mensen online in deze geohash kunnen 1:1 worden bericht of met een openbare fan-out (nog steeds verzegelde E2EE per peer - geen platte tekst)';

  @override
  String geoEmpty(String channel) {
    return 'Nog niemand online in $channel\nGebruik Transport → Internet/Auto, wacht op Nostr, vernieuw locatie';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online in $channel • tik voor 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'In de buurt (in afwachting van aanwezigheid in het gebied) • tik voor 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Gezien op Nostr in $channel • alleen ontdekking (verouderd)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Legacy anonieme aanwezigheid - wacht op een gebonden peer of wissel QR uit';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE in de buurt: scan QR om 1:1 E2EE te starten';

  @override
  String get geoInternetDiscoverHint =>
      'Gebied Internetdetectie vereist Nostr verbonden (Instellingen → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Locatie nog niet opgelost: sta GPS toe en vernieuw om je geohash op Nostr te publiceren';

  @override
  String get geoEmptyNeedsPermission =>
      'Locatietoestemming geweigerd: sta ResilNet toe in Instellingen → Privacy → Locatie';

  @override
  String get geoEmptyServicesDisabled =>
      'Locatieservices zijn uitgeschakeld. Schakel ze in via Instellingen';

  @override
  String get geoEmptyNoGpsFix =>
      'Kan geen GPS-fix krijgen (gebruikelijk op Wi‑Fi iPads) — stel geohash hieronder handmatig in';

  @override
  String get geoEmptyTeleportHint =>
      'Tik op het plaatspictogram → voer een geohash in (bijvoorbeeld w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Geohash instellen';

  @override
  String get geoTeleportHint =>
      'Geen GPS? Voer het geohash-voorvoegsel in (2-7 tekens, bijvoorbeeld w5) en tik op Teleport';

  @override
  String get geoTeleportInvalid =>
      'Ongeldige geohash — gebruik alleen base32-letters/cijfers (bijvoorbeeld w5 of w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Gebied ingesteld op $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Handmatig gebied: $channel (GPS-vernieuwing heeft voorrang)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr niet klaar: tik op Opnieuw verbinden (0/0 totdat de init slaagt)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport is alleen Mesh: schakel over naar Internet of Auto om peers via Nostr te ontdekken';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Nog niemand in $channel: houd Area + Internet open op beide apparaten en wacht ~60s';
  }

  @override
  String get geoChannelFallback => '#gebied';

  @override
  String get geoRefreshLocation => 'Locatie vernieuwen';

  @override
  String get settingsClearLocationTitle => 'Duidelijke locatie';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS verwijderen / geohash teleporteren (gebied wordt #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Locatie wissen?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Verwijdert de opgeslagen geohash op dit apparaat. U kunt daarna de GPS vernieuwen of opnieuw teleporteren.';

  @override
  String get settingsClearLocationAction => 'Duidelijke locatie';

  @override
  String get settingsClearLocationSnack => 'Locatie gewist';

  @override
  String get chatVoiceTooLarge => 'Spraaknoot te groot: maximaal ~30 seconden';

  @override
  String get chatVoiceNeedInternet =>
      'Spraaknotitie heeft internet nodig (Nostr). Te groot voor BLE alleen';

  @override
  String get chatVoiceSentInternet => 'Spraaknotitie verzonden via internet';

  @override
  String get noticeAnonMention => 'noemen';

  @override
  String get noticeAnonDm => 'directe boodschap';

  @override
  String get noticeAnonHug => 'knuffel';

  @override
  String get noticeAnonSlap => 'klap';

  @override
  String get noticeAnonBlock => 'blok';

  @override
  String get noticeAnonNeedKey =>
      'Nog geen publieke sleutel – wissel eerst QR in voor 1:1';

  @override
  String get noticeAnonActionSent => 'Verstuurd';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Geblokkeerd $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* knuffels $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* slaat $anon *';
  }

  @override
  String get geoReconnectNostr => 'Maak opnieuw verbinding Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relais';

  @override
  String get nostrSectionSubtitle =>
      'Internetberichten en gebiedsdetectie maken gebruik van deze relais. Tik op Opnieuw verbinden als de status offline blijft.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Verbonden $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline: relais vermeld, maar geen aangesloten';

  @override
  String get nostrStatusNotInit =>
      'Niet gestart (0/0) — tik op Opnieuw verbinden om te initialiseren';

  @override
  String get nostrReconnectAction => 'Maak opnieuw verbinding Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr verbonden ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Nog steeds offline: controleer Wi‑Fi/cellulair of probeer het opnieuw';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Mislukt: $error';
  }

  @override
  String get nostrReconnecting => 'Verbinding maken met relais…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) in $channel • verzegelde chat gereed';
  }

  @override
  String get transportModeTitle => 'Vervoer in de omgeving';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE dichtbij (radio) wanneer geen Nostr · Internet & Auto = Nostr mensenlijst';

  @override
  String get transportModeMesh => 'Gaas';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint =>
      'Openbaar bericht aan iedereen online op dit gebied';

  @override
  String get geoPublicSend => 'Openbaar';

  @override
  String geoPublicHelp(int count) {
    return 'Verzegelde fan-out naar $count online peer(s) — elk ontvangt een privé-envelop';
  }

  @override
  String geoPublicSent(int count) {
    return 'Verzonden naar $count peer(s) in dit gebied';
  }

  @override
  String get geoPublicSentNone =>
      'Geen online peers die berichten kunnen sturen: open Area/Mesh met peers die sleutels hebben, of wacht op BLE/Nostr';

  @override
  String get areaPublicBadge => 'Gebied openbaar';

  @override
  String get geoErrorPermission =>
      'Kon de locatie niet lezen. Controleer de locatietoestemming';

  @override
  String get geoPrecisionRegion => 'Regio';

  @override
  String get geoPrecisionProvince => 'Provincie';

  @override
  String get geoPrecisionCity => 'Stad';

  @override
  String get geoPrecisionNeighborhood => 'Buurt';

  @override
  String get geoPrecisionBlock => 'Blok';

  @override
  String get aliasTitle => 'Bijnaam instellen (contactalias)';

  @override
  String get aliasHintBody =>
      'Deze alias wordt alleen op dit apparaat opgeslagen (alleen lokaal)\nHet wordt nooit verzonden met E2EE-verkeer';

  @override
  String get aliasLabel => 'Bijnaam';

  @override
  String get aliasHint => 'bijv. “dorpshoofd”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Apparaten';

  @override
  String get settingsFirmwareTitle => 'Download/update ESP32-firmware';

  @override
  String get settingsFirmwareSubtitle =>
      'Download .bin-bestanden en update het ESP32-bord via OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic brug';

  @override
  String get mtBridgeSettingsSubtitle =>
      'A/B-bridge met alleen tekst — niet ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Verplaats korte platte tekst tussen Meshtastic en ResilNet. Modus A en B kunnen niet tegelijkertijd werken. Dit is geen end-to-end-encryptie.';

  @override
  String get mtBridgeModeLabel => 'Modus';

  @override
  String get mtBridgeModeOff => 'Uit';

  @override
  String get mtBridgeModeA => 'Neem A in';

  @override
  String get mtBridgeModeB => 'Uitgang B';

  @override
  String get mtBridgeModeOffShort => 'Uit';

  @override
  String get mtBridgeModeAShort => 'In A';

  @override
  String get mtBridgeModeBShort => 'Uit B';

  @override
  String get mtBridgeMutexHint =>
      'Als u een modus selecteert, wordt de andere automatisch uitgeschakeld. Gelijktijdig A+B wordt niet ondersteund.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (loggen)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Inkomende tekst wordt onder Mededelingen weergegeven als #meshtastic. Mesh-relais is optioneel (standaard uitgeschakeld).';

  @override
  String get mtBridgeRelayTitle => 'Ook doorgeven op ResilNet mesh';

  @override
  String get mtBridgeRelayHint =>
      'Wanneer deze optie is ingeschakeld, worden ondertekende openbare bulletins uitgezonden. Uit = alleen de mededelingen van deze telefoon.';

  @override
  String get mtBridgeSimulateHint => 'Demobericht';

  @override
  String get mtBridgeSimulate => 'Simuleer het Meshtastic bericht';

  @override
  String get mtBridgeIngestOk => 'Opgenomen in mededelingen (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Waarschuwing: berichten die hier worden verzonden, zijn NIET ResilNet E2EE. Iedereen op het pad Meshtastic kan ze lezen.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Tekst om te publiceren';

  @override
  String get mtBridgeSend => 'Verzenden naar Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'In wachtrij voor Meshtastic (zie log / geschiedenis)';

  @override
  String get mtBridgeLastEgress => 'Laatste uitgang';

  @override
  String get mtBridgeEgressHistory => 'Recente uitgang';

  @override
  String get mtBridgeOffHint =>
      'Schakel Ingest (A) of Egress (B) in om de brug te gebruiken.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASISCH · niet E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Gebruik MQTT transport';

  @override
  String get mtBridgeUseMqttHint =>
      'Uit = alleen demoregistratie (MQTT inkomend genegeerd). Aan = MQTT voor in-/uitgaan bij verbinding.';

  @override
  String get mtBridgeMqttHost => 'Makelaar gastheer';

  @override
  String get mtBridgeMqttPort => 'Haven';

  @override
  String get mtBridgeMqttTls => 'Gebruik TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typische poort 8883. Gebruikt systeemcertificaten; faalt zacht bij handdrukfouten.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Automatisch opnieuw verbinden';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Indien ingeschakeld, probeert de client opnieuw verbinding te maken na een onderbreking. Status toont Verbinden totdat hersteld.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Onderwerp helpers';

  @override
  String get mtBridgeMqttRegion => 'Regiovoorvoegsel (optioneel)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Indien ingesteld, wordt met Apply de root opnieuw opgebouwd als msh/<region>/2/json (overschrijft de hoofdmap van het onderwerp).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON-onderwerphoofdmap';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Downlink-kanaalnaam';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Pas root toe → abonneer / publiceer onderwerpen';

  @override
  String get mtBridgeMqttAdvanced => 'Geavanceerd MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, opnieuw verbinding maken, onderwerpen, inloggegevens';

  @override
  String get mtBridgeMqttTopicIn => 'Onderwerp abonneren';

  @override
  String get mtBridgeMqttTopicOut => 'Onderwerp publiceren';

  @override
  String get mtBridgeMqttGatewayFrom => 'Gateway-knooppunt-ID (van)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Decimale id of !hex — vereist voor sendtext-downlink';

  @override
  String get mtBridgeMqttChannelIndex => 'Mesh-kanaalindex (optioneel 0–7)';

  @override
  String get mtBridgeMqttUser => 'Gebruikersnaam (optioneel)';

  @override
  String get mtBridgeMqttPass => 'Wachtwoord (optioneel)';

  @override
  String get mtBridgeMqttPassStored =>
      'Op dit apparaat is een wachtwoord opgeslagen (niet weergegeven).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nieuw wachtwoord (leeg laten om te bewaren)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Laat dit leeg om het opgeslagen wachtwoord te behouden.';

  @override
  String get mtBridgeMqttPassClear => 'Wachtwoord wissen';

  @override
  String get mtBridgeMqttSave => 'Sla MQTT instellingen op';

  @override
  String get mtBridgeMqttSaved => 'MQTT instellingen opgeslagen';

  @override
  String get mtBridgeMqttConnect => 'Verbinden';

  @override
  String get mtBridgeMqttDisconnect => 'Verbreek de verbinding';

  @override
  String get mtBridgeMqttConnected => 'MQTT verbonden';

  @override
  String get mtBridgeMqttConnecting => 'MQTT verbinden…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT verbinding verbroken';

  @override
  String get mtBridgeMqttError => 'MQTT fout';

  @override
  String get mtBridgeErrModeIngest => 'Schakel eerst over naar Inslikken (A).';

  @override
  String get mtBridgeErrModeEgress => 'Schakel eerst over naar Egress (B).';

  @override
  String get mtBridgeErrRate => 'Vertragen – snelheid beperkt';

  @override
  String get mtBridgeErrDedupe => 'Dubbel bericht genegeerd';

  @override
  String get mtBridgeErrLoop => 'Gelaten om een ​​bruglus te voorkomen';

  @override
  String get mtBridgeErrEmpty => 'Bericht is leeg';

  @override
  String get mtBridgeErrPublish => 'Publiceren is mislukt';

  @override
  String get mtBridgeErrNotConnected => 'MQTT niet verbonden';

  @override
  String get mtBridgeErrMissingHost => 'Voer MQTT brokerhost in';

  @override
  String get mtBridgeErrMissingTopic =>
      'Voer abonnementen in en publiceer onderwerpen';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Voer de gateway-knooppunt-ID (van) in voor sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT verbinden mislukt';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS-verbinding mislukt';

  @override
  String get settingsData => 'Gegevens';

  @override
  String get settingsDataHint =>
      'Verwijder lokale berichten om de database te verkleinen: identiteit, sleutels en peers blijven behouden';

  @override
  String get settingsSaveHistoryTitle => 'Berichtgeschiedenis opslaan';

  @override
  String get settingsSaveHistorySubtitle =>
      'Als deze optie is uitgeschakeld, blijven berichten E2EE op de draad en worden ze alleen voor deze sessie bewaard (niet in de lokale chatgeschiedenis). Uw eigen tekst wordt nog steeds als leesbare tekst weergegeven op dit apparaat.';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsE2eeTitle => 'End-to-end-codering';

  @override
  String get settingsE2eeSubtitle =>
      'Altijd aan: berichten worden vóór verzending verzegeld met RSA-OAEP + AES-GCM. Relays en nabijgelegen hops kunnen de inhoud niet lezen.';

  @override
  String get settingsScreenshotTitle => 'Schermafbeeldingwaarschuwingen';

  @override
  String get settingsScreenshotSubtitle =>
      'Toon een systeemregel in de chat wanneer dit apparaat het scherm vastlegt';

  @override
  String get settingsNostrExpiryTitle => 'Nostr bericht houdt de tijd bij';

  @override
  String get settingsNostrExpirySubtitle =>
      'Hoe lang verzegelde enveloppen lokaal moeten blijven als ze online zijn via Nostr';

  @override
  String get noticeExpiresIn => 'verloopt over';

  @override
  String get noticesTitle => 'Mededelingen';

  @override
  String get noticesMeshIntro =>
      'Openbaar bulletin — zichtbaar voor iedereen binnen het radiobereik, niet gecodeerd. Het schakelt offline van telefoon naar telefoon en in de nabijgelegen ResilNet-relaisboxen wordt een kopie bewaard, zodat mensen die later arriveren deze nog steeds kunnen zien.';

  @override
  String get noticesMeshPublicBadge => 'OPENBAAR · niet gecodeerd';

  @override
  String get noticesGeoIntro =>
      'Voeg korte notities toe voor deze plaats, zodat andere bezoekers deze kunnen vinden.';

  @override
  String get noticesEmpty => 'nog geen mededelingen';

  @override
  String get noticesEmptyHint =>
      'pin het eerste bericht voor mensen hier in de buurt.';

  @override
  String get noticesComposeHint => 'plaats een bericht...';

  @override
  String get noticesUrgent => 'dringend';

  @override
  String get noticesOpen => 'Mededelingen';

  @override
  String get screenshotTaken => '*je hebt een screenshot gemaakt*';

  @override
  String get chatAttachImage => 'Afbeelding bijvoegen';

  @override
  String get chatImageLabel => 'Afbeelding';

  @override
  String get chatImageTooLarge =>
      'Afbeelding te groot. Probeer een andere foto';

  @override
  String get chatNostrExpiry => 'Nostr behouden';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Verzenden naar $channel — openbaar';
  }

  @override
  String get settingsClearTitle => 'Wis alle berichten';

  @override
  String get settingsClearSubtitle => 'Verwijder alle chats op dit apparaat';

  @override
  String get settingsClearConfirmTitle => 'Alle berichten wissen?';

  @override
  String get settingsClearConfirmBody =>
      'Hiermee worden alle chatberichten op dit apparaat verwijderd.\nPeers en bijnamen worden niet verwijderd.';

  @override
  String get settingsClearAction => 'Gegevens wissen';

  @override
  String get settingsClearedSnack => 'Gegevens gewist';

  @override
  String settingsVersion(String version) {
    return 'versie $version';
  }

  @override
  String get meshBleScanning => 'BLE: scannen naar knooppunten';

  @override
  String get meshBleEsp32Scanning =>
      'ESP32: zoekt naar een knooppunt in de buurt';

  @override
  String get meshBleSyncing => 'BLE: synchroniseren met ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publiceren';

  @override
  String get meshBleIdle => 'BLE mesh aan: nog geen telefoons in de buurt';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count telefoon(s) in de buurt';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: toestemming vereist';

  @override
  String get meshBlePausedCamera =>
      'BLE gepauzeerd voor camera: tik op Start BLE';

  @override
  String get meshBleStopped =>
      'BLE is uitgeschakeld: controleer of Bluetooth is ingeschakeld en tik vervolgens op Start BLE';

  @override
  String get meshBleRestart => 'Begin BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Lokalisatie $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Controleer de rechten en start BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count collega\'s in de buurt • LoRa $lora • synchroniseren ~${meters}m';
  }

  @override
  String get meshLoraReady => 'klaar';

  @override
  String get meshLoraNotReady => 'niet klaar';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway-UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway-UDP: gereed';

  @override
  String get permissionTitle =>
      'Geef toegang om het BLE mesh-netwerk te starten';

  @override
  String get permissionBody =>
      'De app heeft Bluetooth (scannen / verbinden / adverteren), Locatie (voor oudere Android-apparaten) en Microfoon (voor spraaknotities in chat en aankondigingen) nodig voor community-berichten.';

  @override
  String get permissionE2ee =>
      'End-to-End-codering (E2EE)\nRelay-knooppunten kunnen de inhoud van berichten niet lezen';

  @override
  String get permissionReady => 'Machtigingen gereed';

  @override
  String get permissionRequest => 'Toestaan ​​en doorgaan';

  @override
  String get permissionNotReadySnack =>
      'Systeem is nog niet gereed. Wacht even en probeer het opnieuw';

  @override
  String get permissionDeniedSnack =>
      'Machtigingen onvolledig: open Instellingen > ResilNet en sta Bluetooth / Locatie / Microfoon toe';

  @override
  String get permissionMicDenied =>
      'Microfoontoegang geweigerd: geef toestemming via Instellingen om spraaknotities op te nemen';

  @override
  String get permissionMicOpenSettings => 'Instellingen';

  @override
  String get permissionCameraDenied =>
      'Cameratoegang geweigerd: geef toestemming via Instellingen om QR-codes te scannen';

  @override
  String get permissionCameraFailed =>
      'Voor het scannen van QR-codes is cameratoestemming vereist';

  @override
  String get permissionCameraOpenSettings => 'Instellingen';

  @override
  String get permissionPhotosDenied =>
      'Toegang tot de fotobibliotheek geweigerd: sta dit toe in Instellingen om uw QR-code op te slaan';

  @override
  String get permissionPhotosFailed =>
      'Er is toestemming voor de fotobibliotheek vereist om uw QR-code op te slaan';

  @override
  String get permissionPhotosOpenSettings => 'Instellingen';

  @override
  String permissionFailedSnack(String error) {
    return 'Toestemmingsverzoek mislukt: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architectuur • Multi-hop opslaan en doorsturen';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingNext => 'Volgende';

  @override
  String get onboardingStart => 'Ga aan de slag';

  @override
  String get onboardingWelcomeTitle => 'Welkom bij ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chat op ResilNet via een mesh-netwerk, zelfs zonder internet';

  @override
  String get onboardingFriendsTitle => 'Voeg eenvoudig vrienden toe';

  @override
  String get onboardingFriendsBody =>
      'Deel een QR vanuit Identity of scan de QR van een vriend om openbare sleutels uit te wisselen';

  @override
  String get onboardingChannelsTitle =>
      'Versleutelde chat + kanalen in de buurt';

  @override
  String get onboardingChannelsBody =>
      'Schakel #mesh / Area (geohash) om collega\'s in de buurt te vinden - berichten blijven E2EE over BLE mesh en Nostr';

  @override
  String get chatTitle => 'Chatten (E2EE)';

  @override
  String get chatScanTooltip => 'Scan de QR om een ​​peer toe te voegen';

  @override
  String get chatBlockTooltip => 'Blokkeer deze afzender';

  @override
  String get chatBlockedSnack => 'Geblokkeerd: geen meldingen / geen relais';

  @override
  String get chatAliasTooltip => 'Bijnaam instellen';

  @override
  String get chatReceiverPemLabel => 'Openbare sleutel van ontvanger (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Plak de openbare sleutel van je vriend (uit QR/gedeeld bestand)';

  @override
  String get chatNeedPeerKey =>
      'Scan eerst de QR van deze peer (geverifieerde openbare sleutel vereist)';

  @override
  String get chatPeerKeyMismatch =>
      'De opgeslagen openbare sleutel komt niet overeen met deze peer-ID';

  @override
  String chatVoiceFailed(String error) {
    return 'Kan geen audio opnemen: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Kan spraaknotitie niet afspelen: $error';
  }

  @override
  String get chatPlayVoice => 'Spraaknotitie afspelen';

  @override
  String get chatPauseVoice => 'Pauze';

  @override
  String get chatVoiceLabelSent => '🎤 Spraaknotitie (verzegeld)';

  @override
  String get chatVoiceLabel => '🎤 Spraaknotitie';

  @override
  String get chatDecryptFailed => '[decodering mislukt]';

  @override
  String chatSentSealed(String preview) {
    return '[verzegeld • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[verzegeld]';

  @override
  String get chatComposeHint => 'Typ een bericht... (verzegeld bij verzending)';

  @override
  String get chatEmptyThread =>
      'Nog geen berichten\nTyp hieronder om de mesh te verzenden';

  @override
  String chatLoadFailed(String error) {
    return 'Kan gesprek niet laden: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'In behandeling';

  @override
  String get statusSent => 'Verstuurd';

  @override
  String get statusRelayed => 'doorgegeven';

  @override
  String get statusDelivered => 'Afgeleverd';

  @override
  String get statusRead => 'Lezen';

  @override
  String get statusFailed => 'Mislukt';

  @override
  String get chatCopy => 'Kopiëren';

  @override
  String get chatDeleteLocal => 'Verwijder op dit apparaat';

  @override
  String get chatDeletedLocalSnack => 'Verwijderd op dit apparaat';

  @override
  String get chatRetry => 'Opnieuw proberen';

  @override
  String get chatSendFailed => 'Niet afgeleverd: tik op Opnieuw';

  @override
  String get chatImageNeedInternet =>
      'Maak verbinding met internet om afbeeldingen te verzenden';

  @override
  String get chatImageTooLargeOnline =>
      'Kan de afbeelding niet voldoende comprimeren om te verzenden';

  @override
  String get chatOpenLinkFailed => 'Kan link niet openen';

  @override
  String get identityTitle => 'Identiteit';

  @override
  String get identityScanTooltip => 'QR scannen met camera';

  @override
  String get identityCopiedHash => 'Hash van openbare sleutel gekopieerd';

  @override
  String get identityPeerSaved => 'Peer opgeslagen van QR';

  @override
  String get identityGalleryDenied =>
      'Toestemming voor fotobibliotheek geweigerd';

  @override
  String get identityQrSaved => 'QR opgeslagen in fotobibliotheek';

  @override
  String identityQrSaveFailed(String error) {
    return 'Kan QR: $error niet opslaan';
  }

  @override
  String get peersTitle => 'Netwerk leden';

  @override
  String get qrScanTitle => 'Scan QR om een ​​vriend toe te voegen';

  @override
  String get qrInvalid => 'Scan mislukt: ongeldige QR';

  @override
  String get qrIdKeyMismatch =>
      'QR afgewezen: ID komt niet overeen met de openbare sleutel';

  @override
  String get qrCameraNotReady => 'Camera niet gereed';

  @override
  String get qrRetrySettings => 'Probeer het opnieuw/open Instellingen';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Kan camera niet openen: $error';
  }

  @override
  String get qrScanAlignHint => 'Lijn de QR-code uit binnen het frame';

  @override
  String get firmwareDownloadTitle => 'Download ESP32-firmware';

  @override
  String get firmwareSourceOnline => 'Nieuwste (online)';

  @override
  String get firmwareSourceCached => 'Opgeslagen kopie (offline)';

  @override
  String get firmwareSourceBaseline => 'Gebundelde basislijn (offline)';

  @override
  String get firmwareSourceUnavailable => 'Geen firmware beschikbaar';

  @override
  String get firmwareBaselineIncompatible =>
      'De meegeleverde firmware is te oud. Maak verbinding met internet om een ​​nieuwere versie te downloaden';

  @override
  String get firmwareChecksumFailed =>
      'Firmware mislukte integriteitscontrole - knipperen geblokkeerd';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware gereed: $source';
  }

  @override
  String get peersRefreshTooltip => 'Vernieuwen';

  @override
  String get peersBlocked => 'Geblokkeerd';

  @override
  String peersNearbyBle(Object ble) {
    return 'Dichtbij (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'Sinds kort online';

  @override
  String get peersOnlineInArea => 'Online in de regio';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes min geleden gezien';
  }

  @override
  String get peersOffline => 'Offline';

  @override
  String peersBlockedSnack(String id) {
    return 'Geblokkeerd $id';
  }

  @override
  String get peersUnblockedSnack => 'Gedeblokkeerd';

  @override
  String get peersEmpty =>
      'Nog geen leden in de database\nScan een QR of wacht tot BLE mesh-detectie';

  @override
  String get peersOpenChat => 'Chat openen';

  @override
  String get peersBlockAction => 'Blok';

  @override
  String get peersUnblockAction => 'Deblokkeren';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Gebied';

  @override
  String get locationPickerTooltip => 'Locatie kanaal';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Automatisch';

  @override
  String get onlinePeopleTooltip => 'Mensen online';

  @override
  String get unreadDirectsTooltipEmpty => 'Privéberichten';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count ongelezen privéberichten';
  }

  @override
  String get onlinePeopleTitle => 'mensen';

  @override
  String get onlinePeopleEmpty => 'Hier is nog niemand online';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · dichtbij + gebied';

  @override
  String get peerOnlineMeshTitle => 'Iemand in de buurt op mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name is dichtbij op mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Iemand online in de regio';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name is online via Nostr';
  }

  @override
  String get locationSheetTitle => '#locatiekanalen';

  @override
  String get channelPinsTitle => 'Vastgezet';

  @override
  String get channelPinsHint =>
      'Zet kanalen vast die je vaak gebruikt: ze blijven bovenaan staan';

  @override
  String get channelPinTooltip => 'Zet dit kanaal vast';

  @override
  String get channelUnpinTooltip => 'Losmaken';

  @override
  String get locationSheetIntro =>
      'Chat met mensen in de buurt met behulp van grove geohash - geen nauwkeurige GPS. Aanwezigheid op internet maakt gebruik van anonieme Nostr-sleutels.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleporteren';

  @override
  String homeComposeHint(String channel) {
    return 'Bericht $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Verzenden naar $channel — openbaar';
  }

  @override
  String get messageExpiryTitle => 'verloopt over';

  @override
  String get voiceRecordTapToStart => 'Tik om een ​​spraakbericht op te nemen';

  @override
  String get voiceRecordTooShort => 'Opname te kort. Probeer het opnieuw';

  @override
  String get voiceRecordFailed =>
      'Kan opname niet opslaan. Probeer het opnieuw';

  @override
  String get voicePttHold => 'Houd ingedrukt om op te nemen';

  @override
  String get voicePttRelease => 'Laat los om een ​​voorbeeld te bekijken';

  @override
  String get voicePttRecording => 'Opnemen…';

  @override
  String get voicePttDraftReady => 'Spraaknotitie gereed';

  @override
  String get voicePttDiscard => 'Weggooien';

  @override
  String get voicePttReRecord => 'Neem opnieuw op';

  @override
  String get voicePttSend => 'Spraaknotitie verzenden';

  @override
  String get voicePttPlayPreview => 'Speel voorbeeld af';

  @override
  String get voicePttStopPreview => 'Voorbeeld stoppen';

  @override
  String get noticesBackfilling => 'Mededelingen laden…';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline =>
      'Nostr offline: het bulletin heeft internet nodig';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count mededelingen geladen';
  }

  @override
  String get noticePublishFailed =>
      'Kan bericht niet publiceren op het gebiedsbestuur. Controleer de Nostr-verbinding.';

  @override
  String get noticeMeshPublishNoLink =>
      'Lokaal opgeslagen. Maak verbinding met een nabijgelegen mesh-radio (of Wi‑Fi gateway) zodat anderen deze kunnen ontvangen.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletin verzonden naar $count apparaten in de buurt via BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Radio\'s in de buurt gezien, maar schrijven BLE mislukt. Houd beide apps open op het scherm Meldingen en probeer het opnieuw (of gebruik een ESP32 relay).';

  @override
  String get noticeMeshPublishNoGatt =>
      'De BLE-ontvanger van dit apparaat is niet gereed. Schakel Bluetooth in en open Kennisgevingen opnieuw.';

  @override
  String get noticeDelete => 'Bericht verwijderen';

  @override
  String get noticeDeleteConfirmTitle => 'Deze melding verwijderen?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Hierdoor wordt het alleen op dit apparaat verwijderd. Anderen die het al hebben ontvangen, zullen het nog steeds zien.';

  @override
  String get noticeDeleted => 'Kennisgeving verwijderd';

  @override
  String get chatNoticeHidden => 'Gebiedsmededeling - open mededelingen';

  @override
  String get identityDisplayNameTitle => 'Weergavenaam';

  @override
  String get identitySaveName => 'Naam opslaan';

  @override
  String get identityUserIdLabel => 'Gebruikers-ID (hash van openbare sleutel)';

  @override
  String get identityCopyHashTooltip =>
      'Kopieer de hash van de openbare sleutel';

  @override
  String get identityMyQrTitle => 'Mijn QR (id + pubKey + naam)';

  @override
  String identityQrFailed(String error) {
    return 'Kan geen QR maken\n$error';
  }

  @override
  String get identitySaving => 'Besparing…';

  @override
  String get identitySaveQr => 'Sla QR op in de fotobibliotheek';

  @override
  String get identityOpenScanner => 'Open de camera om QR te scannen';

  @override
  String get identityQrHelp =>
      'Laat een vriend dit scannen om uw openbare sleutel op te slaan en (indien nodig) u in te stellen als een geverifieerde uitgever';

  @override
  String get identityChatTip =>
      'Tip: je kunt ook een QR scannen in de chat om een ​​publieke sleutel voor E2EE toe te voegen';

  @override
  String get infoOpen => 'Over / Info';

  @override
  String get docsGuideTitle => 'Gebruikershandleiding';

  @override
  String get docsGuideSubtitle => 'Opent in browser';

  @override
  String get docsOpenAction => 'Gids openen';

  @override
  String get docsOpenFailed => 'Kan de gebruikershandleiding niet openen';

  @override
  String get firmwareOtaGuideTitle => 'Flitsgids en OTA-protocol';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Opent de webgids — .bin-downloads en volledige stappen';

  @override
  String get firmwareWebDownloadsTitle => 'Firmwaredownloads op internet';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Links en controlesommen per versie op de documentatiesite';

  @override
  String get inviteCopyShortLink => 'Kopieer korte link';

  @override
  String get inviteShareLink => 'Deel link';

  @override
  String get inviteShowFullLink => 'Volledige link';

  @override
  String get inviteCopyFullLink => 'Kopieer volledige link';

  @override
  String get inviteLinkCopied => 'Link gekopieerd';

  @override
  String get inviteLongPressHint => 'Houd ingedrukt voor koppelingsacties';

  @override
  String get inviteSendInChat => 'Stuur een ResilNet chat in…';

  @override
  String get inviteSendInChatHint =>
      'Alleen mensen voor wie je al een publieke sleutel hebt';

  @override
  String get inviteSendInChatEmpty =>
      'Nog geen berichtbare chats.\nScan een QR, open Area/Mesh of deel de link eerst buiten de app.';

  @override
  String get inviteSentToChat => 'Uitnodiging verzonden in chat';

  @override
  String get infoTabInfo => 'Info';

  @override
  String get infoTabSettingsHint =>
      'Open Instellingen in het menu voor taal, E2EE en datatools';

  @override
  String get infoHowToTitle => 'Hoe te gebruiken';

  @override
  String get infoHowToBody =>
      '• Tik op het kanaalpictogram om te wisselen tussen Chat / #mesh / Area\n• Tik op de plaats om de geohash-grootte te kiezen\n• Tik op mensen voor leden of wie online is\n• Open Identity/QR vanaf ⋮ om persoonlijk sleutels uit te wisselen\n• Gebied \'openbaar\' verzendt verzegelde E2EE naar elke online peer - niet naar een ruimte in platte tekst';

  @override
  String get infoFeaturesTitle => 'Functies';

  @override
  String get infoFeatureOffline =>
      'Offline berichten versturen via Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'End-to-end-codering met RSA-OAEP + AES-GCM (geen ruis)';

  @override
  String get infoFeatureMultihop =>
      'Berichten kunnen door peers in de buurt springen om verder te gaan';

  @override
  String get infoFeatureBridge =>
      'Hybride mesh ↔ internet (Nostr) voor verzegelde enveloppen';

  @override
  String get infoFeatureGeo =>
      'Lokale geohash-kanalen voor mensen in de buurt (discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Kennisgevingen met vervaldatum voor #mesh en Area';

  @override
  String get infoPrivacyTitle => 'Privacy';

  @override
  String get infoPrivacyNoRoom =>
      'Geen dorp/openbare chatroom in platte tekst op de draad';

  @override
  String get infoPrivacyFanout =>
      'Gebiedsverzending = verzegelde 1:1 fan-out naar peers met bekende openbare sleutels';

  @override
  String get infoPrivacyPresence =>
      'Voor de aanwezigheid op het internet worden kortstondige Nostr-sleutels gebruikt';

  @override
  String get infoSymbolsTitle => 'Symbolen';

  @override
  String get infoSymBle => 'Directe Bluetooth-verbinding';

  @override
  String get infoSymMesh => 'Bereikbaar via mesh (anderen naar voren)';

  @override
  String get infoSymInternet => 'Via internet (Nostr) — verzegelde enveloppen';

  @override
  String get infoSymBridge => 'Aangekomen via mesh↔internetbrugpad';

  @override
  String get infoSymOffline => 'Offline — momenteel niet bereikbaar';

  @override
  String get infoSymInArea => 'In het gebied van dit locatiekanaal';

  @override
  String get infoSymE2eeOk => 'End-to-end gecodeerde sessie';

  @override
  String get infoSymE2eeFail =>
      'Versleuteling niet beschikbaar: stuur geen gevoelige tekst';

  @override
  String get infoSymVerified => 'Identiteit geverifieerd / bekende sleutel';

  @override
  String get infoSymBlocked => 'Geblokkeerd';

  @override
  String get infoSymUnread => 'Ongelezen privébericht';

  @override
  String get infoEmergencyTitle => 'Noodmodus';

  @override
  String get infoEmergencyBody =>
      'Tik driemaal op de titel ResilNet op het startscherm om berichten, sleutels en identiteit op dit apparaat te wissen.';

  @override
  String get infoLegendNote =>
      'Voor de duidelijkheid zijn hier enkele padpictogrammen gedocumenteerd; bezorgingstekens in de chat blijven de primaire verzendstatus.';

  @override
  String get dangerZoneTitle => 'Gevarenzone';

  @override
  String get dangerZoneSubtitle =>
      'Verwijdert berichten, coderingssleutels, Nostr-identiteit, peers en bijnamen op dit apparaat. Je gaat opnieuw instellen.';

  @override
  String get panicWipeTitle => 'Noodveeg';

  @override
  String get panicWipeSubtitle =>
      'Wis alles lokaal - hetzelfde als driemaal tikken op de thuistitel (dubbeltikken vernieuwt radio\'s)';

  @override
  String get panicWipeConfirmTitle => 'Alle lokale gegevens wissen?';

  @override
  String get panicWipeConfirmBody =>
      'Hierdoor worden chats, sleutels en identiteit op deze telefoon permanent verwijderd.\nPeers moeten QR-sleutels opnieuw uitwisselen met uw nieuwe identiteit.\nDit kan niet ongedaan worden gemaakt.';

  @override
  String get panicWipeAction => 'Veeg alles af';

  @override
  String get panicWipeSnack => 'Lokale identiteit gewist en opnieuw ingesteld';

  @override
  String panicWipeFailed(String error) {
    return 'Wissen mislukt: $error';
  }

  @override
  String get meshBridgeTitle => 'Mesh-brug';

  @override
  String get meshBridgeSubtitle =>
      'Indien ingeschakeld (standaard), kunnen verzegelde enveloppen zowel BLE mesh als internet (Nostr) samen gebruiken, zodat nabijgelegen mesh-eilanden verbinding kunnen maken. Als deze optie is uitgeschakeld, gebruiken verzendingen slechts één pad; er wordt nooit platte tekst op de draad geplaatst.';

  @override
  String get favoritesTitle => 'Favorieten';

  @override
  String get favoritesAdd => 'Toevoegen aan favorieten';

  @override
  String get favoritesRemove => 'Verwijderen uit favorieten';

  @override
  String get favoritesEmpty =>
      'Nog geen favorieten: geef een ster uit de ledenlijst een ster';

  @override
  String get favoritesNearbyTitle => 'Favoriet in de buurt';

  @override
  String favoritesNearbyBody(String name) {
    return '$name is dichtbij op mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Favoriet in de omgeving';

  @override
  String favoritesInAreaBody(String name) {
    return '$name is online in dit gebied';
  }

  @override
  String get topologyTitle => 'Mesh-topologie';

  @override
  String get topologySubtitle =>
      'Peers en verbindingstips van mesh-aankondiging (alleen-lezen)';

  @override
  String get topologyConnectedNow => 'Nu verbonden (BLE)';

  @override
  String get topologyNearby => 'Dichtbij (BLE)';

  @override
  String get topologyKnown => 'Bekende leeftijdsgenoten';

  @override
  String get topologyEmpty =>
      'Nog geen peers geleerd: blijf in de buurt met BLE ingeschakeld';

  @override
  String get topologyYou => 'Jij';

  @override
  String topologyStats(int peers, int links) {
    return '$peers peers · $links links';
  }

  @override
  String get topologyGraphHint =>
      'Geschat op basis van mesh-detectie in de buurt: uw apparaat is gemarkeerd. Tik op een peer om de chat te openen.';

  @override
  String get topologyOpen => 'Mesh-topologie';

  @override
  String get slashHelpTitle => 'Commando\'s';

  @override
  String get slashHelpBody =>
      '/help — deze lijst\n/who — mensen online in het huidige kanaal\n/drop <text> — plaats hier een verzegelde mededeling (E2EE fan-out)\n\nVolledige gids: gebruik Gids openen hieronder, of Instellingen → Gebruikershandleiding.';

  @override
  String get slashWhoEmpty => 'Er is momenteel niemand online op dit kanaal';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Gebruik: /plaats uw notitietekst';

  @override
  String slashDropDone(String channel) {
    return 'Bericht verwijderd op $channel';
  }

  @override
  String get slashUnknown => 'Onbekend commando - probeer /help';

  @override
  String get announceOpen => 'Aankondigingen';

  @override
  String get announceTitle => 'Aankondigingen';

  @override
  String get announceEmpty =>
      'Nog geen borden: maak er een om vergrendelde of open mededelingen te plaatsen';

  @override
  String get announceCreate => 'Bord maken';

  @override
  String get announceCreateHint => 'Naam van het bord';

  @override
  String get announceDefaultTitle => 'Gemeenschapsbord';

  @override
  String get announceSettings => 'Bordinstellingen';

  @override
  String get announceAllowLocked =>
      'Sta vergrendelde (gecodeerde) berichten toe';

  @override
  String get announceAllowLockedSub =>
      'Gecodeerd met de bordsleutel: lezers hebben toegang nodig';

  @override
  String get announceAllowOpen => 'Sta open (platte tekst) berichten toe';

  @override
  String get announceAllowOpenSub =>
      'Niet E2EE — leesbaar op mesh/relais. Standaard uitgeschakeld.';

  @override
  String get announceComposeHint => 'Schrijf een aankondiging...';

  @override
  String get announceMediaInternetOnly =>
      'Foto-/stemaankondigingen verzonden via internet (niet BLE)';

  @override
  String get announceNeedInternet =>
      'Maak verbinding met internet om foto- of spraakaankondigingen te verzenden';

  @override
  String announceVoiceFailed(String error) {
    return 'Kan stem niet opnemen: $error';
  }

  @override
  String get announceImageTooLarge => 'Afbeelding is te groot (max. ~180 KB)';

  @override
  String get announcePlayVoice => 'Spraaknotitie afspelen';

  @override
  String get announceImageLabel => '📷 Afbeelding';

  @override
  String get announceAudioLabel => '🎤 Spraaknotitie';

  @override
  String get announceModeLocked => 'Vergrendeld';

  @override
  String get announceModeOpen => 'Open';

  @override
  String get announceOpenBadge => 'OPEN · niet gecodeerd';

  @override
  String get announceLockedBadge => 'Vergrendeld';

  @override
  String get announceLockedPlaceholder =>
      'Gecodeerd: vraag toegang om te lezen';

  @override
  String get announceRequestAccess => 'Toegang aanvragen';

  @override
  String get announceRequestSent =>
      'Toegangsverzoek verzonden naar de eigenaar van het bord';

  @override
  String get announceRequestFailed =>
      'Kan geen toegang aanvragen (openbare sleutel van de eigenaar nodig)';

  @override
  String get announceOpenConfirmTitle => 'Posten zonder encryptie?';

  @override
  String get announceOpenConfirmBody =>
      'Open berichten zijn geen E2EE. Iedereen op het pad (mesh/relais) mag ze lezen. Doorgaan?';

  @override
  String get announcePostAction => 'Na';

  @override
  String get announcePendingRequests => 'Toegangsverzoeken';

  @override
  String get announceApprove => 'Goedkeuren';

  @override
  String get announceDeny => 'Ontkennen';

  @override
  String get announceGranted =>
      'Je kunt vergrendelde berichten op dit bord lezen';

  @override
  String get announceOwner => 'Jij bent eigenaar van dit bord';

  @override
  String get announceCopyInvite => 'Kopieer de uitnodigingstekst';

  @override
  String get announceShowInviteQr => 'QR-uitnodiging tonen';

  @override
  String get announceScanInviteQr => 'Scan borduitnodiging QR';

  @override
  String get announceFollow => 'Volg het bord vanaf de uitnodiging';

  @override
  String get announceFollowHint =>
      'Plak de uitnodigingstekst of de ResilNet-link van de eigenaar';

  @override
  String get announceFollowOk => 'Volgend bord';

  @override
  String announceFollowOkNamed(String title) {
    return 'Volg nu “$title”';
  }

  @override
  String get announceFollowFail => 'De uitnodiging is ongeldig of beschadigd';

  @override
  String get announceInviteCopied => 'Uitnodigingstekst gekopieerd';

  @override
  String get announceInviteSaveQr => 'QR opslaan';

  @override
  String get announceInviteShare => 'Deel uitnodiging';

  @override
  String get announceFollowFromCompose =>
      'Board-uitnodiging gedetecteerd in het berichtenvenster';

  @override
  String get peerConfirmAddTitle => 'Netwerklid toevoegen?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Voeg “$name” toe met hun publieke sleutel, zodat je ze privé een bericht kunt sturen?';
  }

  @override
  String get peerConfirmAdd => 'Lid toevoegen';

  @override
  String peerAddedOk(String name) {
    return '$name toegevoegd aan netwerkleden';
  }

  @override
  String get peerAddFromCompose =>
      'Identiteit/openbare sleutel gedetecteerd in het berichtenvenster';

  @override
  String get peerHashCopied => 'Hash van openbare sleutel gekopieerd';

  @override
  String get peerHashOpenChat => 'Chat openen';

  @override
  String get peerHashAddHint =>
      'Hash gekopieerd. Vraag hen om hun identiteitslink of QR te delen, zodat u de volledige openbare sleutel voor E2EE kunt toevoegen.';

  @override
  String get peerQrNoCode => 'Geen ResilNet QR gevonden in deze afbeelding';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identiteit: “$name”\nOpen de link of plak deze in de chat → Lid toevoegen\nOf scan de identiteits-QR.';
  }

  @override
  String get identityShareInvite => 'Deel identiteitslink';

  @override
  String get identityInviteCopied => 'Identiteitslink gekopieerd';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Bestuursuitnodiging: “$title”\nOpen ResilNet → Communityborden → Volg vanaf uitnodiging\nOf scan de QR / tik op de onderstaande link.';
  }

  @override
  String get announceConfirmFollowTitle => 'Dit bord volgen?';

  @override
  String announceConfirmFollowBody(String title) {
    return '“$title” van deze uitnodiging volgen?';
  }

  @override
  String get announceConfirmFollow => 'Volgen';
}

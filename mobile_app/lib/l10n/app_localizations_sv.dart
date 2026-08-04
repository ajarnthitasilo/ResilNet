// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Uppdaterar ResilNet...';

  @override
  String get appRefreshed =>
      'Uppdaterad — radioapparater och upptäckt startade om';

  @override
  String appRefreshFailed(String error) {
    return 'Uppdatering misslyckades: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Dubbeltryck = mjuk uppdatering. Långt tryck = hård återhämtning. Trippeltryck = nödtorkning.';

  @override
  String get softRefreshTipTitle => 'Om ResilNet känner sig fast';

  @override
  String get softRefreshTipBody =>
      'Dubbeltryck på ResilNet (överst till vänster) för en mjuk radiouppdatering. Om du fortfarande fastnar: tryck länge på titeln, använd ⋮ → Hård återställning eller Inställningar. Trippeltryck är endast nödtorkning.';

  @override
  String get softRefreshTipGotIt => 'Jag förstår';

  @override
  String get infoSoftRefreshTitle => 'Om appen känns fast';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Dubbeltryck på ResilNet (överst till vänster) → soft refresh-radioapparater och personer i närheten';

  @override
  String get infoSoftRefreshStepHard =>
      'Fortfarande fast? Tryck länge på titeln, eller ⋮ / Inställningar → Hård återställning';

  @override
  String get infoSoftRefreshStepWait =>
      'Vänta på resultatet snackbar och försök sedan igen. Sessionsåterställning behåller dina nycklar.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Trippeltryck = nödtorkning (tar bort lokal data) — endast om det är avsiktligt';

  @override
  String get appRecoverySection => 'App återställning';

  @override
  String get appRecoverySectionSubtitle =>
      'Använd när appen känns frusen. Mjuk = titel dubbeltryck. Hård återhämtning är starkare. Sessionsåterställning startar om tjänster utan att torka nycklar.';

  @override
  String get appHardRecoverAction => 'Hård återhämtning';

  @override
  String get appHardRecovering => 'Svårt att återhämta sig...';

  @override
  String get appSessionResetAction => 'Återställ session';

  @override
  String get appSessionResetRunning => 'Återställer session...';

  @override
  String get appSessionResetConfirmTitle => 'Återställa sessionen?';

  @override
  String get appSessionResetConfirmBody =>
      'Startar om ResilNet-tjänster på den här enheten. Dina identitetsnycklar bevaras.';

  @override
  String get appRecoveryBusy => 'Återställningen pågår redan...';

  @override
  String get appRecoveryOk => 'Återhämtningen avslutad';

  @override
  String get appRecoveryPartial =>
      'Återställningen avslutad med några steg som hoppades över – försök igen om du fortfarande fastnar';

  @override
  String get appRecoveryFailed =>
      'Återställningen misslyckades – försök att återställa sessionen eller tvångsavsluta appen från operativsystemet';

  @override
  String get localWifiTitle => 'Lokal Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Länka enheter i närheten utan internet – samma som att vara på ett LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Inte ESP32 LoRa-gatewayen SoftAP. Detta är endast telefon↔telefon/LAN.';

  @override
  String get localWifiUnavailable =>
      'Lokal Wi‑Fi är inte klar än – vänta på att appen startar.';

  @override
  String get lxmfBridgeTitle => 'Hemnod';

  @override
  String get lxmfBridgeSubtitle =>
      'Valfri Mac eller Pi på din Wi‑Fi som vidarebefordrar slutna chattar. Av som standard. Ersätter inte end-to-end-kryptering.';

  @override
  String get lxmfBridgeEnable => 'Använd hemnod';

  @override
  String get lxmfBridgeDisabledHint =>
      'Slå på endast när bryggappen körs på en Mac eller Pi på det här nätverket.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Kan inte nå hemnoden – $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Hemnodsadress';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP eller http://IP:port — exempel 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Spara och uppdatera status';

  @override
  String get lxmfBridgeLabHint => 'Avancerat: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Inställningar för hemnod';

  @override
  String get lxmfBridgeCheckConnection => 'Kontrollera anslutningen';

  @override
  String get lxmfBridgeStatusOnline => 'Ansluten till hemnoden';

  @override
  String get lxmfBridgeStatusOffline => 'Hemnoden kan inte nås';

  @override
  String get lxmfBridgeYourDest => 'Den här nodens adress (dela med vänner)';

  @override
  String get lxmfBridgeCopyDest => 'Kopiera adress';

  @override
  String get lxmfBridgeDestCopied => 'Adress kopierad';

  @override
  String get lxmfBridgeLinkedPeers => 'Länkade vänner';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Varje vän behöver sin hemnodadress en gång. Då kan förseglade chattar använda denna väg.';

  @override
  String get lxmfBridgeNoLinks => 'Inga vänner länkade än.';

  @override
  String get lxmfBridgeAddLink => 'Länka en vän';

  @override
  String get lxmfBridgePickPeer => 'Vän';

  @override
  String get lxmfBridgePeerDest => 'Deras hemnodadress';

  @override
  String get lxmfBridgePeerDestHint =>
      '32-teckens kod från deras startnodskärm';

  @override
  String get lxmfBridgeInvalidDest =>
      'Den adressen verkar inte giltig. Klistra in hela koden från deras hemnod.';

  @override
  String get lxmfBridgeRemoveLink => 'Ta bort länken';

  @override
  String get lxmfBridgeSaveLink => 'Spara';

  @override
  String get lxmfBridgeLinkSaved => 'Vän länkad';

  @override
  String get lxmfBridgeNoPeers =>
      'Inga kontakter som du kan skicka meddelanden ännu – lägg till en vän först.';

  @override
  String get lxmfBridgeHelp =>
      'Håll bryggan igång på Mac/Pi. Den här sökvägen stannar på ditt LAN — den är inte LoRa och ersätter inte internet eller Bluetooth-mesh.';

  @override
  String get localWifiModeHotspot => 'Närliggande';

  @override
  String get localWifiModeRouter => 'Router';

  @override
  String get localWifiHotspotIntro =>
      'En enhet delar en personlig hotspot. Andra ansluter sig till den hotspot och sedan hittar ResilNet dem på det lokala nätverket.';

  @override
  String get localWifiHostAction => 'Skapa nätverk (värd)';

  @override
  String get localWifiJoinAction => 'Gå med i nätverket';

  @override
  String get localWifiHostSteps =>
      '1. Öppna iOS/Android-inställningar och aktivera Personal Hotspot (eller Internetdelning).\n2. Berätta för dina vänner namnet (och lösenordet).\n3. Kom tillbaka hit och tryck på \"Hotspot är på — börja vänta\".';

  @override
  String get localWifiHostReady => 'Hotspot är på — börja vänta';

  @override
  String get localWifiHostWaiting => 'Väntar på att vänner ska gå med...';

  @override
  String get localWifiJoinSteps =>
      '1. Öppna systeminställningar och gå med i din väns personliga hotspot.\n2. Gå tillbaka hit och tryck på \"Jag är ansluten - sök\".';

  @override
  String get localWifiJoinReady => 'Jag är ansluten - sök';

  @override
  String get localWifiRouterIntro =>
      'Anslut alla enheter till samma Wi‑Fi-router/AP. Routern behöver inte internet - bara ett delat lokalt nätverk.';

  @override
  String get localWifiRouterSearch => 'Sök på denna Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Uppdatera Wi‑Fi information';

  @override
  String get localWifiRouterNoWifiTitle => 'Inte på Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Gå med i routerns Wi‑Fi i systeminställningarna och sök sedan igen.';

  @override
  String get localWifiDiscovering => 'Söker på lokal Wi‑Fi...';

  @override
  String get localWifiPeersFound => 'Enheter på detta nätverk';

  @override
  String get localWifiStop => 'Stopp';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi namn är inte tillgängligt';

  @override
  String get localWifiStubBanner => 'Väntar på LAN-uttag...';

  @override
  String get localWifiLiveBanner =>
      'LAN Discovery live (UDP) — tillkännage + förseglad chatt på denna Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Inga enheter ännu.\nKontrollera att vänner gick med i din hotspot och tillät åtkomst till lokalt nätverk.';

  @override
  String get localWifiEmptyRouter =>
      'Inga enheter ännu.\nSamma SSID? Lokalt nätverk tillåtet? Vissa routrar blockerar enhet-till-enhet-trafik (AP-isolering).';

  @override
  String get localWifiIsolationHelp => 'Varför kan vi inte hitta varandra?';

  @override
  String get localWifiIsolationTitle => 'Routern kan isolera klienter';

  @override
  String get localWifiIsolationBody =>
      'Om AP/klientisolering (eller ett gästnätverk) är på kan telefoner på samma Wi‑Fi inte prata. Stäng av isoleringen, använd huvud-SSID eller växla till läget Nära (hotspot).';

  @override
  String get localWifiPeerReady => 'Redo att chatta (har nyckel)';

  @override
  String get localWifiPeerNeedKey => 'Hittade — skanna QR för att byta nycklar';

  @override
  String get localWifiErrorTitle => 'Lokalt Wi‑Fi-fel';

  @override
  String get localWifiErrorBody => 'Något gick fel. Stanna och försök igen.';

  @override
  String get preparingSystem => 'Förbereder systemet...';

  @override
  String get bootFailedTitle => 'Kunde inte starta';

  @override
  String get retry => 'Försök igen';

  @override
  String get bootRecoveryAction => 'Starta ny identitet (radera lokal data)';

  @override
  String get bootRecoveryConfirmTitle => 'Börja med en ny identitet?';

  @override
  String get bootRecoveryConfirmBody =>
      'Detta kommer permanent att radera lokala chattar, nycklar och identitet på den här enheten.\nPeers måste skanna din QR igen med din nya identitet.\nDetta kan inte ångras.';

  @override
  String get bootRecoveryRunning => 'Återställer lokal identitet...';

  @override
  String get bootRecoverySuccess => 'Lokal identitet har återställts';

  @override
  String bootRecoveryFailed(String error) {
    return 'Kunde inte återställa identitet: $error';
  }

  @override
  String get cancel => 'Avboka';

  @override
  String get save => 'Spara';

  @override
  String get close => 'Nära';

  @override
  String get start => 'Start';

  @override
  String get send => 'Skicka';

  @override
  String get settings => 'Inställningar';

  @override
  String get language => 'Språk';

  @override
  String get languageSubtitle =>
      'Som standard följer appen ditt telefonspråk (när det stöds). Andra språk faller tillbaka till engelska. Du kan även låsa ett språk här.';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageThai => 'Thai';

  @override
  String get languageEnglish => 'engelska';

  @override
  String get notificationsTooltip => 'Aviseringsinställningar';

  @override
  String get enableMessageNotifications => 'Aktivera meddelandeaviseringar';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 meddelanden och personer online (lokala varningar)';

  @override
  String get networkMembersTooltip => 'Nätverksmedlemmar';

  @override
  String get identityQrTooltip => 'Identitet / QR';

  @override
  String get feedDirects => 'Chatta';

  @override
  String get feedMesh => '#maska';

  @override
  String get feedGeo => 'Område';

  @override
  String get feedDirectsSubtitle => 'Privata E2EE-meddelanden';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'Närliggande kollegor (BLE )';
  }

  @override
  String get feedGeoSubtitle => 'Geohash discovery channel';

  @override
  String get peerIdHint =>
      'Klistra in mottagar-ID (Public Key Hash) för att starta en chatt';

  @override
  String get directsEmpty =>
      'Inga chattar än – skanna en QR eller klistra in ett mottagar-ID för att starta\nMeddelanden förseglas med E2EE innan de skickas (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • tryck för att öppna chatten';

  @override
  String get meshIntro =>
      'Peers inom BLE-intervallet – tryck för en privat E2EE-chatt (ingen offentlig skrivning på #mesh)\nSkickar via hybridrouter (BLE + LoRa + Nostr när online)';

  @override
  String get meshEmptyRunning =>
      'Inga andra i närheten ännu – öppna appen på en annan enhet inom BLE räckvidd';

  @override
  String get meshEmptyStopped =>
      'BLE körs inte – ge Bluetooth-/platsbehörighet';

  @override
  String get meshNearbyPrefix => 'I närheten';

  @override
  String get meshRetentionTitle => 'Radera meddelanden automatiskt';

  @override
  String get meshRetentionSubtitle =>
      'Äldre lokal chatthistorik tas bort automatiskt';

  @override
  String get meshRetentionKeep => 'Hålla';

  @override
  String get meshRetention1Day => '1 dag';

  @override
  String get meshRetention3Days => '3 dagar';

  @override
  String get meshRetention7Days => '7 dagar';

  @override
  String get refreshLocationTooltip => 'Uppdatera plats';

  @override
  String get geoIntro =>
      'Människor online i denna geohash kan skickas meddelanden 1:1 eller med en offentlig fan-out (fortfarande förseglad E2EE per peer – inte klartext)';

  @override
  String geoEmpty(String channel) {
    return 'Ingen online i $channel än\nAnvänd Transport → Internet/Auto, vänta på Nostr, uppdatera plats';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online i $channel • tryck för 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'I närheten (väntar på närvaro på området) • tryck för 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Ses på Nostr i $channel • Endast upptäckt (legacy)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Äldre anonym närvaro — vänta på en bunden peer eller byt ut QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE i närheten – skanna QR för att starta 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Area Internet Discovery behöver Nostr ansluten (Inställningar → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Platsen är inte löst ännu — tillåt GPS och uppdatering för att publicera din geohash på Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Platsbehörighet nekad – tillåt ResilNet i Inställningar → Sekretess → Plats';

  @override
  String get geoEmptyServicesDisabled =>
      'Platstjänster är avstängda – aktivera dem i Inställningar';

  @override
  String get geoEmptyNoGpsFix =>
      'Det gick inte att få en GPS-fix (vanligt på Wi‑Fi iPads) – ställ in geohash manuellt nedan';

  @override
  String get geoEmptyTeleportHint =>
      'Tryck på platsikonen → ange en geohash (t.ex. w5) → Teleportera';

  @override
  String get geoSetGeohashManually => 'Ställ geohash';

  @override
  String get geoTeleportHint =>
      'Ingen GPS? Ange geohash-prefix (2–7 tecken, t.ex. w5) och tryck på Teleportera';

  @override
  String get geoTeleportInvalid =>
      'Ogiltig geohash – använd endast base32 bokstäver/siffror (t.ex. w5 eller w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Område inställt på $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Manuellt område: $channel (GPS-uppdatering åsidosätter)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr inte redo – tryck på Återanslut (0/0 tills initieringen lyckas)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport är enbart mesh – byt till Internet eller Auto för att upptäcka peers över Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Ingen i $channel än – håll Area + Internet öppet på båda enheterna och vänta i ~60s';
  }

  @override
  String get geoChannelFallback => '#område';

  @override
  String get geoRefreshLocation => 'Uppdatera plats';

  @override
  String get settingsClearLocationTitle => 'Tydlig plats';

  @override
  String get settingsClearLocationSubtitle =>
      'Ta bort GPS / teleportera geohash (området blir #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Rensa plats?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Tar bort den lagrade geohashen på den här enheten. Du kan uppdatera GPS eller teleportera igen efteråt.';

  @override
  String get settingsClearLocationAction => 'Tydlig plats';

  @override
  String get settingsClearLocationSnack => 'Platsen har rensats';

  @override
  String get chatVoiceTooLarge =>
      'Röstanteckningen är för stor — max ~30 sekunder';

  @override
  String get chatVoiceNeedInternet =>
      'Röstanteckning behöver internet (Nostr) – för stor för enbart BLE';

  @override
  String get chatVoiceSentInternet => 'Röstanteckning skickad via Internet';

  @override
  String get noticeAnonMention => 'nämna';

  @override
  String get noticeAnonDm => 'direkt meddelande';

  @override
  String get noticeAnonHug => 'kram';

  @override
  String get noticeAnonSlap => 'slag';

  @override
  String get noticeAnonBlock => 'blockera';

  @override
  String get noticeAnonNeedKey =>
      'Ingen offentlig nyckel ännu – byt QR först mot 1:1';

  @override
  String get noticeAnonActionSent => 'Skickat';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Blockerade $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*kramar $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* smällar $anon *';
  }

  @override
  String get geoReconnectNostr => 'Återanslut Nostr';

  @override
  String get nostrSectionTitle => 'Nostr reläer';

  @override
  String get nostrSectionSubtitle =>
      'Internetmeddelanden och Area Discovery använder dessa reläer. Tryck på återanslut om status förblir offline.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Ansluten $connected/$total';
  }

  @override
  String get nostrStatusOffline => 'Offline — reläer listade men inga anslutna';

  @override
  String get nostrStatusNotInit =>
      'Inte startat (0/0) — tryck på Återanslut för att initiera';

  @override
  String get nostrReconnectAction => 'Återanslut Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr ansluten ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Fortfarande offline – kontrollera Wi‑Fi/cellular eller försök igen';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Misslyckades: $error';
  }

  @override
  String get nostrReconnecting => 'Ansluter till reläer...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) i $channel • förseglad chatt redo';
  }

  @override
  String get transportModeTitle => 'Områdestransport';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE i närheten (radio) när ingen Nostr · Internet & Auto = Nostr personlista';

  @override
  String get transportModeMesh => 'Maska';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Bil';

  @override
  String get geoPublicHint =>
      'Offentligt meddelande till alla online i detta område';

  @override
  String get geoPublicSend => 'Offentlig';

  @override
  String geoPublicHelp(int count) {
    return 'Förseglad fan-out till $count onlinekamrat(er) – var och en får ett privat kuvert';
  }

  @override
  String geoPublicSent(int count) {
    return 'Skickat till $count kamrat(er) i detta område';
  }

  @override
  String get geoPublicSentNone =>
      'Inga meddelanden kan skickas till kamrater online – öppna Area/Mesh med kamrater som har nycklar, eller vänta på BLE/Nostr';

  @override
  String get areaPublicBadge => 'Offentligt område';

  @override
  String get geoErrorPermission =>
      'Kunde inte läsa plats – kontrollera platsbehörighet';

  @override
  String get geoPrecisionRegion => 'Område';

  @override
  String get geoPrecisionProvince => 'Provins';

  @override
  String get geoPrecisionCity => 'Stad';

  @override
  String get geoPrecisionNeighborhood => 'Grannskap';

  @override
  String get geoPrecisionBlock => 'Blockera';

  @override
  String get aliasTitle => 'Ange smeknamn (Kontaktalias)';

  @override
  String get aliasHintBody =>
      'Detta alias lagras endast på den här enheten (endast lokalt)\nDen skickas aldrig med E2EE-trafik';

  @override
  String get aliasLabel => 'Smeknamn';

  @override
  String get aliasHint => 'till exempel \"byhuvud\", \"P\'Somchai\"...';

  @override
  String get settingsDevices => 'Enheter';

  @override
  String get settingsFirmwareTitle => 'Ladda ner / uppdatera ESP32 firmware';

  @override
  String get settingsFirmwareSubtitle =>
      'Ladda ner .bin-filer och uppdatera ESP32 tavlan via OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic bro';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Enbart text A/B-brygga — inte ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Flytta kort klartext mellan Meshtastic och ResilNet. Lägen A och B kan inte köras samtidigt. Detta är inte end-to-end-kryptering.';

  @override
  String get mtBridgeModeLabel => 'Läge';

  @override
  String get mtBridgeModeOff => 'Av';

  @override
  String get mtBridgeModeA => 'Intag A';

  @override
  String get mtBridgeModeB => 'Utgång B';

  @override
  String get mtBridgeModeOffShort => 'Av';

  @override
  String get mtBridgeModeAShort => 'I A';

  @override
  String get mtBridgeModeBShort => 'Ut B';

  @override
  String get mtBridgeMutexHint =>
      'Om du väljer ett läge stängs det andra av automatiskt. Samtidig A+B stöds inte.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (loggning)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Inkommande text visas under Meddelanden som #meshtastic. Mesh-relä är valfritt (av som standard).';

  @override
  String get mtBridgeRelayTitle => 'Relä även på ResilNet mesh';

  @override
  String get mtBridgeRelayHint =>
      'När den är på sänds undertecknade offentliga bulletiner. Av = endast den här telefonens meddelanden.';

  @override
  String get mtBridgeSimulateHint => 'Demomeddelande';

  @override
  String get mtBridgeSimulate => 'Simulera Meshtastic meddelande';

  @override
  String get mtBridgeIngestOk => 'Inmatad i meddelanden (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Varning: meddelanden som skickas här är INTE ResilNet E2EE. Alla på sökvägen Meshtastic kan läsa dem.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Text att publicera';

  @override
  String get mtBridgeSend => 'Skicka till Meshtastic';

  @override
  String get mtBridgeEgressOk => 'I kö för Meshtastic (se logg/historik)';

  @override
  String get mtBridgeLastEgress => 'Sista utgången';

  @override
  String get mtBridgeEgressHistory => 'Nyligen utträde';

  @override
  String get mtBridgeOffHint =>
      'Aktivera intag (A) eller utgående (B) för att använda bryggan.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · inte E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Använd MQTT transport';

  @override
  String get mtBridgeUseMqttHint =>
      'Av = endast demologgning (MQTT inkommande ignoreras). På = MQTT för inmatning/utgång när den är ansluten.';

  @override
  String get mtBridgeMqttHost => 'Mäklarvärd';

  @override
  String get mtBridgeMqttPort => 'Hamn';

  @override
  String get mtBridgeMqttTls => 'Använd TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typisk port 8883. Använder systemcertifikat; misslyckas mjukt vid handskakningsfel.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Återanslut automatiskt';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'När den är på försöker klienten återansluta efter avbrott. Status visar Ansluter tills den återställs.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Ämneshjälpare';

  @override
  String get mtBridgeMqttRegion => 'Regionprefix (valfritt)';

  @override
  String get mtBridgeMqttRegionHint =>
      'När den är inställd bygger Apply om root som msh/<region>/2/json (återsätter ämnesroten).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON ämnesrot';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nedlänkskanalnamn';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Använd root → prenumerera / publicera ämnen';

  @override
  String get mtBridgeMqttAdvanced => 'Avancerat MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, återanslut, ämnen, referenser';

  @override
  String get mtBridgeMqttTopicIn => 'Prenumerera ämne';

  @override
  String get mtBridgeMqttTopicOut => 'Publicera ämne';

  @override
  String get mtBridgeMqttGatewayFrom => 'Gateway nod-id (från)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Decimal-id eller !hex — krävs för nedlänk för sendtext';

  @override
  String get mtBridgeMqttChannelIndex => 'Meshkanalindex (valfritt 0–7)';

  @override
  String get mtBridgeMqttUser => 'Användarnamn (valfritt)';

  @override
  String get mtBridgeMqttPass => 'Lösenord (valfritt)';

  @override
  String get mtBridgeMqttPassStored =>
      'Ett lösenord lagras på den här enheten (visas inte).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nytt lösenord (lämna tomt för att behålla)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Lämna tomt för att behålla det lagrade lösenordet.';

  @override
  String get mtBridgeMqttPassClear => 'Rensa lösenord';

  @override
  String get mtBridgeMqttSave => 'Spara MQTT-inställningar';

  @override
  String get mtBridgeMqttSaved => 'MQTT-inställningarna har sparats';

  @override
  String get mtBridgeMqttConnect => 'Ansluta';

  @override
  String get mtBridgeMqttDisconnect => 'Koppla från';

  @override
  String get mtBridgeMqttConnected => 'MQTT ansluten';

  @override
  String get mtBridgeMqttConnecting => 'MQTT ansluter...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT frånkopplad';

  @override
  String get mtBridgeMqttError => 'MQTT fel';

  @override
  String get mtBridgeErrModeIngest => 'Växla till Intag (A) först';

  @override
  String get mtBridgeErrModeEgress => 'Växla till utgående (B) först';

  @override
  String get mtBridgeErrRate => 'Sakta ner — hastigheten begränsad';

  @override
  String get mtBridgeErrDedupe => 'Dubblett meddelande ignoreras';

  @override
  String get mtBridgeErrLoop => 'Tappad för att förhindra en broslinga';

  @override
  String get mtBridgeErrEmpty => 'Meddelandet är tomt';

  @override
  String get mtBridgeErrPublish => 'Publiceringen misslyckades';

  @override
  String get mtBridgeErrNotConnected => 'MQTT inte ansluten';

  @override
  String get mtBridgeErrMissingHost => 'Ange MQTT mäklarvärd';

  @override
  String get mtBridgeErrMissingTopic => 'Ange prenumerera och publicera ämnen';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Ange gatewaynod-id (från) för sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT-anslutningen misslyckades';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS-anslutningen misslyckades';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Ta bort lokala meddelanden för att krympa databasen – identitet, nycklar och kamrater bevaras';

  @override
  String get settingsSaveHistoryTitle => 'Spara meddelandehistorik';

  @override
  String get settingsSaveHistorySubtitle =>
      'När avstängd förblir meddelanden E2EE på tråden och sparas endast för denna session (inte i den lokala chatthistoriken). Din egen text visas fortfarande som klartext på den här enheten.';

  @override
  String get settingsPrivacy => 'Privatliv';

  @override
  String get settingsE2eeTitle => 'End-to-end-kryptering';

  @override
  String get settingsE2eeSubtitle =>
      'Alltid på — meddelanden förseglas med RSA-OAEP + AES-GCM innan de skickas. Reläer och närliggande hopp kan inte läsa innehållet.';

  @override
  String get settingsScreenshotTitle => 'Skärmdumpsvarningar';

  @override
  String get settingsScreenshotSubtitle =>
      'Visa en systemlinje i chatten när den här enheten fångar skärmen';

  @override
  String get settingsNostrExpiryTitle => 'Nostr meddelande håll tid';

  @override
  String get settingsNostrExpirySubtitle =>
      'Hur länge förseglade kuvert ska finnas kvar lokalt när de är online via Nostr';

  @override
  String get noticeExpiresIn => 'går ut om';

  @override
  String get noticesTitle => 'Notiser';

  @override
  String get noticesMeshIntro =>
      'Offentlig bulletin — synlig för alla inom radioräckvidd, inte krypterad. Den hoppar telefon-till-telefon offline, och ResilNet-reläboxar i närheten behåller en kopia så att folk som kommer senare fortfarande ser den.';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · inte krypterad';

  @override
  String get noticesGeoIntro =>
      'Lägg till korta anteckningar för den här platsen så att andra besökare kan hitta dem.';

  @override
  String get noticesEmpty => 'inga notiser ännu';

  @override
  String get noticesEmptyHint => 'fäst det första meddelandet för folk här.';

  @override
  String get noticesComposeHint => 'posta ett meddelande...';

  @override
  String get noticesUrgent => 'brådskande';

  @override
  String get noticesOpen => 'Notiser';

  @override
  String get screenshotTaken => '*du tog en skärmdump*';

  @override
  String get chatAttachImage => 'Bifoga bild';

  @override
  String get chatImageLabel => 'Bild';

  @override
  String get chatImageTooLarge =>
      'Bilden är för stor — försök med ett annat foto';

  @override
  String get chatNostrExpiry => 'Nostr behåll';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Skicka till $channel — offentligt';
  }

  @override
  String get settingsClearTitle => 'Rensa alla meddelanden';

  @override
  String get settingsClearSubtitle => 'Ta bort alla chattar på den här enheten';

  @override
  String get settingsClearConfirmTitle => 'Rensa alla meddelanden?';

  @override
  String get settingsClearConfirmBody =>
      'Detta tar bort alla chattmeddelanden på den här enheten.\nKamrater och smeknamn tas inte bort.';

  @override
  String get settingsClearAction => 'Rensa data';

  @override
  String get settingsClearedSnack => 'Data raderade';

  @override
  String settingsVersion(String version) {
    return 'version $version';
  }

  @override
  String get meshBleScanning => 'BLE: skannar efter noder';

  @override
  String get meshBleEsp32Scanning => 'ESP32: letar efter en närliggande nod';

  @override
  String get meshBleSyncing => 'BLE: synkroniserar med ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publicering';

  @override
  String get meshBleIdle => 'BLE mesh on – inga närliggande telefoner än';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count telefon(er) i närheten';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: behörighet krävs';

  @override
  String get meshBlePausedCamera =>
      'BLE pausad för kameran — tryck på Starta BLE';

  @override
  String get meshBleStopped =>
      'BLE är av – kontrollera att Bluetooth är på och tryck sedan på Starta BLE';

  @override
  String get meshBleRestart => 'Starta BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Kontrollera behörigheter och starta BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count jämnåriga i närheten • LoRa $lora • synkronisera ~${meters}m';
  }

  @override
  String get meshLoraReady => 'redo';

  @override
  String get meshLoraNotReady => 'inte redo';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: klar';

  @override
  String get permissionTitle =>
      'Tillåt åtkomst för att starta BLE mesh-nätverket';

  @override
  String get permissionBody =>
      'Appen behöver Bluetooth (skanna / anslut / annonsera), Plats (för äldre Android-enheter) och Mikrofon (för röstanteckningar i chatt och meddelanden) för meddelanden från gemenskapen.';

  @override
  String get permissionE2ee =>
      'End-to-end-kryptering (E2EE)\nRelänoder kan inte läsa meddelandeinnehåll';

  @override
  String get permissionReady => 'Behörigheter är klara';

  @override
  String get permissionRequest => 'Tillåt och fortsätt';

  @override
  String get permissionNotReadySnack =>
      'Systemet är inte klart ännu – vänta ett ögonblick och försök igen';

  @override
  String get permissionDeniedSnack =>
      'Behörigheterna är ofullständiga — öppna Inställningar > ResilNet och tillåt Bluetooth / Plats / Mikrofon';

  @override
  String get permissionMicDenied =>
      'Mikrofonåtkomst nekad – tillåt den i Inställningar för att spela in röstanteckningar';

  @override
  String get permissionMicOpenSettings => 'Inställningar';

  @override
  String get permissionCameraDenied =>
      'Kameraåtkomst nekad – tillåt den i Inställningar för att skanna QR-koder';

  @override
  String get permissionCameraFailed =>
      'Kameratillstånd krävs för att skanna QR-koder';

  @override
  String get permissionCameraOpenSettings => 'Inställningar';

  @override
  String get permissionPhotosDenied =>
      'Tillgång till fotobibliotek nekad — tillåt det i Inställningar för att spara din QR-kod';

  @override
  String get permissionPhotosFailed =>
      'Fotobibliotekets tillstånd krävs för att spara din QR-kod';

  @override
  String get permissionPhotosOpenSettings => 'Inställningar';

  @override
  String permissionFailedSnack(String error) {
    return 'Begäran om behörighet misslyckades: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Arkitektur • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'Hoppa';

  @override
  String get onboardingNext => 'Nästa';

  @override
  String get onboardingStart => 'Kom igång';

  @override
  String get onboardingWelcomeTitle => 'Välkommen till ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chatta på ResilNet över ett mesh-nätverk – även utan internet';

  @override
  String get onboardingFriendsTitle => 'Lägg till vänner enkelt';

  @override
  String get onboardingFriendsBody =>
      'Dela en QR från Identity eller skanna en väns QR för att byta ut offentliga nycklar';

  @override
  String get onboardingChannelsTitle => 'Krypterad chatt + kanaler i närheten';

  @override
  String get onboardingChannelsBody =>
      'Byt #mesh / Area (geohash) för att hitta närliggande peers — meddelanden förblir E2EE över BLE mesh och Nostr';

  @override
  String get chatTitle => 'Chatt (E2EE)';

  @override
  String get chatScanTooltip => 'Skanna QR för att lägga till en peer';

  @override
  String get chatBlockTooltip => 'Blockera den här avsändaren';

  @override
  String get chatBlockedSnack => 'Blockerad: inga aviseringar / inget relä';

  @override
  String get chatAliasTooltip => 'Ange smeknamn';

  @override
  String get chatReceiverPemLabel => 'Mottagarens offentliga nyckel (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Klistra in din väns offentliga nyckel (från QR / delad fil)';

  @override
  String get chatNeedPeerKey =>
      'Skanna denna kamrats QR först (verifierad offentlig nyckel krävs)';

  @override
  String get chatPeerKeyMismatch =>
      'Den lagrade offentliga nyckeln matchar inte detta peer-id';

  @override
  String chatVoiceFailed(String error) {
    return 'Kunde inte spela in ljud: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Det gick inte att spela röstanteckning: $error';
  }

  @override
  String get chatPlayVoice => 'Spela röstanteckning';

  @override
  String get chatPauseVoice => 'Paus';

  @override
  String get chatVoiceLabelSent => '🎤 Röstanteckning (förseglad)';

  @override
  String get chatVoiceLabel => '🎤 Röstanteckning';

  @override
  String get chatDecryptFailed => '[dekryptering misslyckades]';

  @override
  String chatSentSealed(String preview) {
    return '[förseglad • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[sluten]';

  @override
  String get chatComposeHint =>
      'Skriv ett meddelande... (förseglad vid sändning)';

  @override
  String get chatEmptyThread =>
      'Inga meddelanden än\nSkriv nedan för att skicka över nätet';

  @override
  String chatLoadFailed(String error) {
    return 'Det gick inte att läsa in konversationen: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'I avvaktan på';

  @override
  String get statusSent => 'Skickat';

  @override
  String get statusRelayed => 'Relä';

  @override
  String get statusDelivered => 'Levereras';

  @override
  String get statusRead => 'Läsa';

  @override
  String get statusFailed => 'Misslyckades';

  @override
  String get chatCopy => 'Kopiera';

  @override
  String get chatDeleteLocal => 'Ta bort på den här enheten';

  @override
  String get chatDeletedLocalSnack => 'Raderad på den här enheten';

  @override
  String get chatRetry => 'Försöka igen';

  @override
  String get chatSendFailed => 'Ej levererat — tryck på Försök igen';

  @override
  String get chatImageNeedInternet =>
      'Anslut till internet för att skicka bilder';

  @override
  String get chatImageTooLargeOnline =>
      'Kunde inte komprimera bilden tillräckligt för att skicka';

  @override
  String get chatOpenLinkFailed => 'Det gick inte att öppna länken';

  @override
  String get identityTitle => 'Identitet';

  @override
  String get identityScanTooltip => 'Skanna QR med kamera';

  @override
  String get identityCopiedHash => 'Publik nyckelhash kopierad';

  @override
  String get identityPeerSaved => 'Peer sparad från QR';

  @override
  String get identityGalleryDenied => 'Fotobibliotekets tillstånd nekades';

  @override
  String get identityQrSaved => 'QR har sparats i fotobiblioteket';

  @override
  String identityQrSaveFailed(String error) {
    return 'Kunde inte spara QR: $error';
  }

  @override
  String get peersTitle => 'Nätverksmedlemmar';

  @override
  String get qrScanTitle => 'Skanna QR för att lägga till en vän';

  @override
  String get qrInvalid => 'Skanningen misslyckades: ogiltig QR';

  @override
  String get qrIdKeyMismatch =>
      'QR avvisades: ID matchar inte offentlig nyckel';

  @override
  String get qrCameraNotReady => 'Kameran är inte klar';

  @override
  String get qrRetrySettings => 'Försök igen / öppna Inställningar';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Kunde inte öppna kameran: $error';
  }

  @override
  String get qrScanAlignHint => 'Rikta in QR-koden inuti ramen';

  @override
  String get firmwareDownloadTitle => 'Ladda ner ESP32 firmware';

  @override
  String get firmwareSourceOnline => 'Senaste (online)';

  @override
  String get firmwareSourceCached => 'Sparad kopia (offline)';

  @override
  String get firmwareSourceBaseline => 'Bundet baslinje (offline)';

  @override
  String get firmwareSourceUnavailable => 'Ingen firmware tillgänglig';

  @override
  String get firmwareBaselineIncompatible =>
      'Den medföljande fasta programvaran är för gammal – anslut till internet för att ladda ner en nyare version';

  @override
  String get firmwareChecksumFailed =>
      'Firmware misslyckades integritetskontroll — blinkande blockerad';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware redo: $source';
  }

  @override
  String get peersRefreshTooltip => 'Uppdatera';

  @override
  String get peersBlocked => 'Blockerad';

  @override
  String peersNearbyBle(Object ble) {
    return 'I närheten (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'Nyligen online';

  @override
  String get peersOnlineInArea => 'Online i området';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Sågs för $minutes minuter sedan';
  }

  @override
  String get peersOffline => 'Off-line';

  @override
  String peersBlockedSnack(String id) {
    return 'Blockerade $id';
  }

  @override
  String get peersUnblockedSnack => 'Avblockerad';

  @override
  String get peersEmpty =>
      'Inga medlemmar i databasen ännu\nSkanna en QR eller vänta på att BLE mesh upptäckt';

  @override
  String get peersOpenChat => 'Öppna chatt';

  @override
  String get peersBlockAction => 'Blockera';

  @override
  String get peersUnblockAction => 'Avblockera';

  @override
  String get channelPickerTooltip => 'Chatt / #mesh / Område';

  @override
  String get locationPickerTooltip => 'Platskanal';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Människor online';

  @override
  String get unreadDirectsTooltipEmpty => 'Privata meddelanden';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count olästa privata meddelanden';
  }

  @override
  String get onlinePeopleTitle => 'personer';

  @override
  String get onlinePeopleEmpty => 'Ingen online här än';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · i närheten + område';

  @override
  String get peerOnlineMeshTitle => 'Någon i närheten på mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name är i närheten på mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Någon online i området';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name är online via Nostr';
  }

  @override
  String get locationSheetTitle => '#platskanaler';

  @override
  String get channelPinsTitle => 'Fäst';

  @override
  String get channelPinsHint =>
      'Fäst kanaler du använder ofta – de stannar överst';

  @override
  String get channelPinTooltip => 'Fäst den här kanalen';

  @override
  String get channelUnpinTooltip => 'Lossa';

  @override
  String get locationSheetIntro =>
      'Chatta med människor i närheten med hjälp av grov geohash – inte exakt GPS. Närvaro på Internet använder anonyma Nostr-nycklar.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportera';

  @override
  String homeComposeHint(String channel) {
    return 'Meddelande $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Skicka till $channel — offentligt';
  }

  @override
  String get messageExpiryTitle => 'går ut om';

  @override
  String get voiceRecordTapToStart => 'Tryck för att spela in röstmeddelande';

  @override
  String get voiceRecordTooShort => 'Inspelningen är för kort — försök igen';

  @override
  String get voiceRecordFailed =>
      'Det gick inte att spara inspelningen — försök igen';

  @override
  String get voicePttHold => 'Håll ned för att spela in';

  @override
  String get voicePttRelease => 'Släpp för att förhandsgranska';

  @override
  String get voicePttRecording => 'Inspelning…';

  @override
  String get voicePttDraftReady => 'Röstanteckning redo';

  @override
  String get voicePttDiscard => 'Kassera';

  @override
  String get voicePttReRecord => 'Spela in igen';

  @override
  String get voicePttSend => 'Skicka röstanteckning';

  @override
  String get voicePttPlayPreview => 'Spela förhandsvisning';

  @override
  String get voicePttStopPreview => 'Stoppa förhandsgranskningen';

  @override
  String get noticesBackfilling => 'Läser in meddelanden...';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline =>
      'Nostr offline – bulletinen behöver internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Laddade $count meddelanden';
  }

  @override
  String get noticePublishFailed =>
      'Kunde inte publicera meddelande till områdesstyrelsen. Kontrollera anslutningen Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Sparad lokalt. Anslut till en närliggande mesh-radio (eller Wi‑Fi-gateway) så att andra kan ta emot den.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletinen har skickats till $count enheter i närheten över BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Radioapparater i närheten sågs, men BLE skriv misslyckades. Håll båda apparna öppna på meddelandeskärmen och försök igen (eller använd ett ESP32-relä).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Den här enhetens BLE-mottagare är inte klar. Växla Bluetooth och öppna meddelanden igen.';

  @override
  String get noticeDelete => 'Ta bort meddelande';

  @override
  String get noticeDeleteConfirmTitle => 'Vill du ta bort det här meddelandet?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Detta tar bara bort det på den här enheten. Andra som redan fått det kommer fortfarande att se det.';

  @override
  String get noticeDeleted => 'Notisen raderad';

  @override
  String get chatNoticeHidden => 'Områdesmeddelande — öppna Meddelanden';

  @override
  String get identityDisplayNameTitle => 'Visningsnamn';

  @override
  String get identitySaveName => 'Spara namn';

  @override
  String get identityUserIdLabel => 'Användar-ID (Public Key Hash)';

  @override
  String get identityCopyHashTooltip => 'Kopiera hash för offentlig nyckel';

  @override
  String get identityMyQrTitle => 'Min QR (id + pubKey + namn)';

  @override
  String identityQrFailed(String error) {
    return 'Kunde inte skapa QR\n$error';
  }

  @override
  String get identitySaving => 'Sparande…';

  @override
  String get identitySaveQr => 'Spara QR i fotobiblioteket';

  @override
  String get identityOpenScanner => 'Öppna kameran för att skanna QR';

  @override
  String get identityQrHelp =>
      'Låt en vän skanna detta för att spara din offentliga nyckel och (om det behövs) ställa in dig som en verifierad utfärdare';

  @override
  String get identityChatTip =>
      'Tips: du kan också skanna en QR i chatten för att lägga till en offentlig nyckel för E2EE';

  @override
  String get infoOpen => 'Om / Info';

  @override
  String get docsGuideTitle => 'Användarhandbok';

  @override
  String get docsGuideSubtitle => 'Öppnas i webbläsaren';

  @override
  String get docsOpenAction => 'Öppna guiden';

  @override
  String get docsOpenFailed => 'Kunde inte öppna användarhandboken';

  @override
  String get firmwareOtaGuideTitle => 'Flashguide & OTA-protokoll';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Öppnar webbguiden — .bin-nedladdningar och fullständiga steg';

  @override
  String get firmwareWebDownloadsTitle => 'Firmware nedladdningar på webben';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Länkar och kontrollsummor per version på dokumentwebbplatsen';

  @override
  String get inviteCopyShortLink => 'Kopiera kort länk';

  @override
  String get inviteShareLink => 'Dela länk';

  @override
  String get inviteShowFullLink => 'Hela länken';

  @override
  String get inviteCopyFullLink => 'Kopiera hela länken';

  @override
  String get inviteLinkCopied => 'Länken kopierad';

  @override
  String get inviteLongPressHint => 'Tryck länge för länkåtgärder';

  @override
  String get inviteSendInChat => 'Skicka i ResilNet-chatten...';

  @override
  String get inviteSendInChatHint =>
      'Endast personer som du redan har en offentlig nyckel för';

  @override
  String get inviteSendInChatEmpty =>
      'Inga meddelandebara chattar än.\nSkanna en QR, öppna Area/Mesh eller dela länken utanför appen först.';

  @override
  String get inviteSentToChat => 'Inbjudan skickas i chatten';

  @override
  String get infoTabInfo => 'Info';

  @override
  String get infoTabSettingsHint =>
      'Öppna Inställningar från menyn för språk, E2EE och dataverktyg';

  @override
  String get infoHowToTitle => 'Hur man använder';

  @override
  String get infoHowToBody =>
      '• Tryck på kanalikonen för att byta Chatt / #mesh / Area\n• Tryck på plats för att välja geohashstorlek\n• Tryck på personer för medlemmar eller som är online\n• Öppna Identity/QR från ⋮ för att byta nycklar personligen\n• Området \"offentligt\" skickar förseglad E2EE till varje online-peer - inte ett vanlig textrum';

  @override
  String get infoFeaturesTitle => 'Drag';

  @override
  String get infoFeatureOffline =>
      'Offlinemeddelanden via Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'End-to-end-kryptering med RSA-OAEP + AES-GCM (inte brus)';

  @override
  String get infoFeatureMultihop =>
      'Meddelanden kan hoppa genom närliggande kamrater för att komma längre';

  @override
  String get infoFeatureBridge =>
      'Hybridnät ↔ internet (Nostr) för förseglade kuvert';

  @override
  String get infoFeatureGeo =>
      'Lokala geohashkanaler för människor i närheten (upptäckt UX)';

  @override
  String get infoFeatureNotices =>
      'Meddelanden med utgångsdatum för #mesh och Area';

  @override
  String get infoPrivacyTitle => 'Privatliv';

  @override
  String get infoPrivacyNoRoom =>
      'Ingen by i klartext/offentligt chattrum på tråden';

  @override
  String get infoPrivacyFanout =>
      'Områdessändning = förseglad 1:1 fan-out till kamrater med kända publika nycklar';

  @override
  String get infoPrivacyPresence =>
      'Närvaro på internetområde använder tillfälliga Nostr-nycklar';

  @override
  String get infoSymbolsTitle => 'Symboler';

  @override
  String get infoSymBle => 'Direkt Bluetooth-länk';

  @override
  String get infoSymMesh => 'Kan nås via mesh (andra framåt)';

  @override
  String get infoSymInternet => 'Via internet (Nostr) — förseglade kuvert';

  @override
  String get infoSymBridge => 'Anlände via mesh↔internetbroväg';

  @override
  String get infoSymOffline => 'Offline – inte tillgänglig just nu';

  @override
  String get infoSymInArea => 'I den här kanalens område';

  @override
  String get infoSymE2eeOk => 'End-to-end krypterad session';

  @override
  String get infoSymE2eeFail =>
      'Kryptering inte tillgänglig – skicka inte känslig text';

  @override
  String get infoSymVerified => 'Identitet verifierad / känd nyckel';

  @override
  String get infoSymBlocked => 'Blockerad';

  @override
  String get infoSymUnread => 'Oläst privat meddelande';

  @override
  String get infoEmergencyTitle => 'Nödläge';

  @override
  String get infoEmergencyBody =>
      'Tryck tre gånger på titeln ResilNet på startskärmen för att rensa meddelanden, nycklar och identitet på den här enheten.';

  @override
  String get infoLegendNote =>
      'Vissa sökvägsikoner är dokumenterade här för tydlighetens skull; leveranstickar i chatten förblir den primära sändningsstatusen.';

  @override
  String get dangerZoneTitle => 'Riskzon';

  @override
  String get dangerZoneSubtitle =>
      'Tar bort meddelanden, krypteringsnycklar, Nostr-identitet, kamrater och smeknamn på den här enheten. Du kommer att ställa in igen.';

  @override
  String get panicWipeTitle => 'Nödtork';

  @override
  String get panicWipeSubtitle =>
      'Radera allt lokalt - samma som att tre gånger trycka på hemtiteln (dubbeltryck uppdaterar radioapparater)';

  @override
  String get panicWipeConfirmTitle => 'Rensa all lokal data?';

  @override
  String get panicWipeConfirmBody =>
      'Detta tar permanent bort chattar, nycklar och identitet på den här telefonen.\nKamrater måste byta ut QR-nycklar med din nya identitet.\nDetta kan inte ångras.';

  @override
  String get panicWipeAction => 'Torka av allt';

  @override
  String get panicWipeSnack => 'Lokal identitet raderad — konfigurera igen';

  @override
  String panicWipeFailed(String error) {
    return 'Rensa misslyckades: $error';
  }

  @override
  String get meshBridgeTitle => 'Mesh bro';

  @override
  String get meshBridgeSubtitle =>
      'När på (standard) kan förseglade kuvert använda både BLE mesh och internet (Nostr) tillsammans så att närliggande mesh-öar kan ansluta. När den är avstängd använder du bara en sökväg för sändningar - lägger aldrig klartext på tråden.';

  @override
  String get favoritesTitle => 'Favoriter';

  @override
  String get favoritesAdd => 'Lägg till i favoriter';

  @override
  String get favoritesRemove => 'Ta bort från favoriter';

  @override
  String get favoritesEmpty =>
      'Inga favoriter än - stjärna en kamrat från medlemslistan';

  @override
  String get favoritesNearbyTitle => 'Favorit i närheten';

  @override
  String favoritesNearbyBody(String name) {
    return '$name är i närheten på mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Favorit i området';

  @override
  String favoritesInAreaBody(String name) {
    return '$name är online i det här området';
  }

  @override
  String get topologyTitle => 'Mesh topologi';

  @override
  String get topologySubtitle =>
      'Peers och anslutningstips från mesh-meddelande (skrivskyddat)';

  @override
  String get topologyConnectedNow => 'Ansluten nu (BLE)';

  @override
  String get topologyNearby => 'I närheten (BLE)';

  @override
  String get topologyKnown => 'Kända kamrater';

  @override
  String get topologyEmpty =>
      'Inga kamrater har lärt sig ännu – stanna i närheten med BLE på';

  @override
  String get topologyYou => 'du';

  @override
  String topologyStats(int peers, int links) {
    return '$peers peers · $links länkar';
  }

  @override
  String get topologyGraphHint =>
      'Uppskattad från närliggande mesh-upptäckt – din enhet är markerad. Tryck på en kamrat för att öppna chatten.';

  @override
  String get topologyOpen => 'Mesh topologi';

  @override
  String get slashHelpTitle => 'Kommandon';

  @override
  String get slashHelpBody =>
      '/help — denna lista\n/vem — personer online i aktuell kanal\n/drop <text> — fäst en förseglad notis här (E2EE fan-out)\n\nFullständig guide: använd Öppna guide nedan eller Inställningar → Användarhandbok.';

  @override
  String get slashWhoEmpty => 'Ingen online i den här kanalen just nu';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Användning: /släpp din anteckningstext';

  @override
  String slashDropDone(String channel) {
    return 'Avbröt meddelande på $channel';
  }

  @override
  String get slashUnknown => 'Okänt kommando — försök /help';

  @override
  String get announceOpen => 'Meddelanden';

  @override
  String get announceTitle => 'Meddelanden';

  @override
  String get announceEmpty =>
      'Inga anslagstavlor ännu - skapa en för att posta låsta eller öppna meddelanden';

  @override
  String get announceCreate => 'Skapa tavla';

  @override
  String get announceCreateHint => 'Styrelsens namn';

  @override
  String get announceDefaultTitle => 'Samhällsstyrelsen';

  @override
  String get announceSettings => 'Styrelseinställningar';

  @override
  String get announceAllowLocked => 'Tillåt låsta (krypterade) inlägg';

  @override
  String get announceAllowLockedSub =>
      'Krypterad till kortnyckeln – läsare behöver åtkomst';

  @override
  String get announceAllowOpen => 'Tillåt öppna (klartext) inlägg';

  @override
  String get announceAllowOpenSub =>
      'Ej E2EE — läsbar på mesh/reläer. Av som standard.';

  @override
  String get announceComposeHint => 'Skriv ett meddelande...';

  @override
  String get announceMediaInternetOnly =>
      'Foto-/röstmeddelanden skickas över internet (inte BLE)';

  @override
  String get announceNeedInternet =>
      'Anslut till internet för att skicka foto- eller röstmeddelanden';

  @override
  String announceVoiceFailed(String error) {
    return 'Kunde inte spela in röst: $error';
  }

  @override
  String get announceImageTooLarge => 'Bilden är för stor (max ~180 KB)';

  @override
  String get announcePlayVoice => 'Spela röstanteckning';

  @override
  String get announceImageLabel => '📷 Bild';

  @override
  String get announceAudioLabel => '🎤 Röstanteckning';

  @override
  String get announceModeLocked => 'Låst';

  @override
  String get announceModeOpen => 'Öppna';

  @override
  String get announceOpenBadge => 'ÖPPEN · inte krypterad';

  @override
  String get announceLockedBadge => 'Låst';

  @override
  String get announceLockedPlaceholder => 'Krypterad — begär åtkomst att läsa';

  @override
  String get announceRequestAccess => 'Begär åtkomst';

  @override
  String get announceRequestSent =>
      'Tillträdesförfrågan skickas till styrelsens ägare';

  @override
  String get announceRequestFailed =>
      'Kunde inte begära åtkomst (behöver ägarens publika nyckel)';

  @override
  String get announceOpenConfirmTitle => 'Posta utan kryptering?';

  @override
  String get announceOpenConfirmBody =>
      'Öppna inlägg är inte E2EE. Vem som helst på vägen (nät/reläer) får läsa dem. Fortsätta?';

  @override
  String get announcePostAction => 'Posta';

  @override
  String get announcePendingRequests => 'Åtkomstförfrågningar';

  @override
  String get announceApprove => 'Godkänna';

  @override
  String get announceDeny => 'Förneka';

  @override
  String get announceGranted => 'Du kan läsa låsta inlägg på denna tavla';

  @override
  String get announceOwner => 'Du äger den här brädan';

  @override
  String get announceCopyInvite => 'Kopiera inbjudningstext';

  @override
  String get announceShowInviteQr => 'Visa inbjudnings-QR';

  @override
  String get announceScanInviteQr => 'Scan board inviter QR';

  @override
  String get announceFollow => 'Följ tavlan från inbjudan';

  @override
  String get announceFollowHint =>
      'Klistra in inbjudningstexten eller ResilNet-länken från ägaren';

  @override
  String get announceFollowOk => 'Följande styrelse';

  @override
  String announceFollowOkNamed(String title) {
    return 'Följer nu \"$title\"';
  }

  @override
  String get announceFollowFail => 'Inbjudan är ogiltig eller skadad';

  @override
  String get announceInviteCopied => 'Inbjudningstexten har kopierats';

  @override
  String get announceInviteSaveQr => 'Spara QR';

  @override
  String get announceInviteShare => 'Dela inbjudan';

  @override
  String get announceFollowFromCompose =>
      'Styrelseinbjudan upptäcktes i meddelanderutan';

  @override
  String get peerConfirmAddTitle => 'Vill du lägga till nätverksmedlem?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Lägg till \"$name\" med deras offentliga nyckel så att du kan skicka ett privat meddelande till dem?';
  }

  @override
  String get peerConfirmAdd => 'Lägg till medlem';

  @override
  String peerAddedOk(String name) {
    return 'Lade till $name för nätverksmedlemmar';
  }

  @override
  String get peerAddFromCompose =>
      'Identitet/offentlig nyckel upptäckts i meddelanderutan';

  @override
  String get peerHashCopied => 'Publik nyckelhash kopierad';

  @override
  String get peerHashOpenChat => 'Öppna chatt';

  @override
  String get peerHashAddHint =>
      'Hash kopierad. Be dem att dela sin identitetslänk eller QR så att du kan lägga till den fullständiga publika nyckeln för E2EE.';

  @override
  String get peerQrNoCode => 'Ingen ResilNet QR hittades i den här bilden';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identitet: \"$name\"\nÖppna länken eller klistra in den i chatten → Lägg till medlem\nEller skanna identitets-QR.';
  }

  @override
  String get identityShareInvite => 'Dela identitetslänk';

  @override
  String get identityInviteCopied => 'Identitetslänk kopierad';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Styrelseinbjudan: \"$title\"\nÖppna ResilNet → Community boards → Följ från inbjudan\nEller skanna QR:en / tryck på länken nedan.';
  }

  @override
  String get announceConfirmFollowTitle => 'Följ denna tavla?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Vill du följa $title från den här inbjudan?';
  }

  @override
  String get announceConfirmFollow => 'Följa';
}

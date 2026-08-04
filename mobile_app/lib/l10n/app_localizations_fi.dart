// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Päivitetään ResilNet…';

  @override
  String get appRefreshed =>
      'Päivitetty – radiot ja etsintä käynnistetty uudelleen';

  @override
  String appRefreshFailed(String error) {
    return 'Päivitys epäonnistui: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Kaksoisnapautus = pehmeä virkistys. Pitkä painallus = kova palautus. Kolmoisnapautus = hätäpyyhintä.';

  @override
  String get softRefreshTipTitle => 'Jos ResilNet tuntuu jumissa';

  @override
  String get softRefreshTipBody =>
      'Kaksoisnapauta ResilNet (ylävasen) saadaksesi pehmeän radion päivityksen. Jos edelleen jumissa: paina otsikkoa pitkään, käytä ⋮ → Hard Recovery tai Asetukset. Kolmoisnapautus on vain hätäpyyhintä.';

  @override
  String get softRefreshTipGotIt => 'Selvä';

  @override
  String get infoSoftRefreshTitle => 'Jos sovellus tuntuu jumissa';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Kaksoisnapauta ResilNet (ylävasen) → pehmeä virkistysradiot ja lähellä olevat ihmiset';

  @override
  String get infoSoftRefreshStepHard =>
      'Vieläkö jumissa? Paina otsikkoa pitkään tai ⋮ / Asetukset → Kova palautus';

  @override
  String get infoSoftRefreshStepWait =>
      'Odota välipalapalkin tulosta ja yritä sitten uudelleen. Istunnon nollaus säilyttää avaimesi.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Kolmoisnapautus = hätäpyyhintä (poistaa paikalliset tiedot) – vain jos se on tarkoituksellista';

  @override
  String get appRecoverySection => 'Sovelluksen palautus';

  @override
  String get appRecoverySectionSubtitle =>
      'Käytä, kun sovellus tuntuu jäätyneeltä. Pehmeä = otsikon kaksoisnapautus. Kova palautuminen on vahvempaa. Istunnon nollaus käynnistää palvelut uudelleen pyyhkimättä avaimia.';

  @override
  String get appHardRecoverAction => 'Kova toipuminen';

  @override
  String get appHardRecovering => 'Vaikea toipuminen…';

  @override
  String get appSessionResetAction => 'Nollaa istunto';

  @override
  String get appSessionResetRunning => 'Nollataan istuntoa…';

  @override
  String get appSessionResetConfirmTitle => 'Nollataanko istunto?';

  @override
  String get appSessionResetConfirmBody =>
      'Käynnistää ResilNet palvelut uudelleen tällä laitteella. Identiteettiavaimesi säilytetään.';

  @override
  String get appRecoveryBusy => 'Palautus on jo käynnissä…';

  @override
  String get appRecoveryOk => 'Toipuminen päättynyt';

  @override
  String get appRecoveryPartial =>
      'Palautus päättyi, ja jotkut vaiheet ohitettiin – yritä uudelleen, jos se on edelleen jumissa';

  @override
  String get appRecoveryFailed =>
      'Palautus epäonnistui – kokeile istunnon nollausta tai pakota sovellus poistumaan käyttöjärjestelmästä';

  @override
  String get localWifiTitle => 'Paikallinen Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Yhdistä lähellä olevat laitteet ilman Internetiä – sama kuin olisit yhdessä lähiverkossa.';

  @override
  String get localWifiNotGatewayHint =>
      'Ei ESP32 LoRa -yhdyskäytävä SoftAP. Tämä on vain puhelin↔puhelin / LAN.';

  @override
  String get localWifiUnavailable =>
      'Paikallinen Wi‑Fi ei ole vielä valmis – odota sovelluksen käynnistymistä.';

  @override
  String get lxmfBridgeTitle => 'Kotisolmu';

  @override
  String get lxmfBridgeSubtitle =>
      'Valinnainen Mac tai Pi Wi‑Fi-laitteellasi, joka välittää sinetöityjä keskusteluja. Oletuksena pois päältä. Ei korvaa päästä päähän -salausta.';

  @override
  String get lxmfBridgeEnable => 'Käytä kotisolmua';

  @override
  String get lxmfBridgeDisabledHint =>
      'Ota käyttöön vain, kun siltasovellus on käynnissä Mac- tai Pi-tietokoneessa tässä verkossa.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online - $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Kotisolmuun ei saada yhteyttä — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Kotisolmun osoite';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP tai http://IP:portti – esimerkki 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Vertaistuki → LXMF kohde (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Tallenna ja päivitä tila';

  @override
  String get lxmfBridgeLabHint => 'Lisäasetukset: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Kotisolmun asetukset';

  @override
  String get lxmfBridgeCheckConnection => 'Tarkista yhteys';

  @override
  String get lxmfBridgeStatusOnline => 'Yhdistetty kotisolmuun';

  @override
  String get lxmfBridgeStatusOffline => 'Kotisolmu ei tavoitettavissa';

  @override
  String get lxmfBridgeYourDest => 'Tämän solmun osoite (jaa ystävien kanssa)';

  @override
  String get lxmfBridgeCopyDest => 'Kopioi osoite';

  @override
  String get lxmfBridgeDestCopied => 'Osoite kopioitu';

  @override
  String get lxmfBridgeLinkedPeers => 'Yhdistetyt ystävät';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Jokainen ystävä tarvitsee kotisolmuosoitteensa kerran. Sitten suljetut keskustelut voivat käyttää tätä polkua.';

  @override
  String get lxmfBridgeNoLinks => 'Ystäviä ei ole vielä linkitetty.';

  @override
  String get lxmfBridgeAddLink => 'Linkitä ystäväsi';

  @override
  String get lxmfBridgePickPeer => 'ystävä';

  @override
  String get lxmfBridgePeerDest => 'Heidän kotisolmuosoitteensa';

  @override
  String get lxmfBridgePeerDestHint =>
      '32-merkkinen koodi heidän aloitussolmunäytöstään';

  @override
  String get lxmfBridgeInvalidDest =>
      'Osoite ei näytä kelvolliselta. Liitä koko koodi heidän kotisolmuksestaan.';

  @override
  String get lxmfBridgeRemoveLink => 'Poista linkitys';

  @override
  String get lxmfBridgeSaveLink => 'Tallentaa';

  @override
  String get lxmfBridgeLinkSaved => 'Ystävä linkitetty';

  @override
  String get lxmfBridgeNoPeers =>
      'Ei vielä lähetettäviä yhteystietoja – lisää ensin ystävä.';

  @override
  String get lxmfBridgeHelp =>
      'Pidä silta käynnissä Mac/Pi:ssä. Tämä polku pysyy lähiverkossasi – se ei ole LoRa eikä korvaa Internetiä tai Bluetooth-verkkoa.';

  @override
  String get localWifiModeHotspot => 'Lähistöllä';

  @override
  String get localWifiModeRouter => 'Reititin';

  @override
  String get localWifiHotspotIntro =>
      'Yksi laite jakaa henkilökohtaisen yhteyspisteen. Muut liittyvät tähän hotspotiin ja sitten ResilNet löytää heidät paikallisesta verkosta.';

  @override
  String get localWifiHostAction => 'Luo verkko (isäntä)';

  @override
  String get localWifiJoinAction => 'Liity verkkoon';

  @override
  String get localWifiHostSteps =>
      '1. Avaa iOS/Android-asetukset ja ota käyttöön Personal Hotspot (tai Internet Sharing).\n2. Kerro ystäville hotspotin nimi (ja salasana).\n3. Palaa tänne ja napauta \"Hotspot on päällä - aloita odottaminen\".';

  @override
  String get localWifiHostReady => 'Hotspot on päällä – ala odottaa';

  @override
  String get localWifiHostWaiting => 'Odotetaan ystävien liittymistä…';

  @override
  String get localWifiJoinSteps =>
      '1. Avaa järjestelmän asetukset ja liity ystäväsi henkilökohtaiseen yhteyspisteeseen.\n2. Palaa tähän ja napauta \"Olen yhteydessä - etsi\".';

  @override
  String get localWifiJoinReady => 'Olen yhteydessä – hae';

  @override
  String get localWifiRouterIntro =>
      'Yhdistä kaikki laitteet samaan Wi‑Fi-reitittimeen/tukiasemaan. Reititin ei tarvitse Internetiä - vain jaettua paikallisverkkoa.';

  @override
  String get localWifiRouterSearch => 'Hae tästä Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Päivitä Wi‑Fi tiedot';

  @override
  String get localWifiRouterNoWifiTitle => 'Ei käytössä Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Liity reitittimen Wi‑Fi-kohtaan järjestelmäasetuksissa ja etsi sitten uudelleen.';

  @override
  String get localWifiDiscovering => 'Haetaan paikallisesta Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Tämän verkon laitteet';

  @override
  String get localWifiStop => 'Stop';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nimi ei ole käytettävissä';

  @override
  String get localWifiStubBanner => 'Odotetaan LAN-liitäntää…';

  @override
  String get localWifiLiveBanner =>
      'LAN-etsintä livenä (UDP) — ilmoita + suljettu chat tällä Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Ei vielä laitteita.\nTarkista, että ystävät liittyivät hotspot-pisteeseesi ja sallivat pääsyn paikallisverkkoon.';

  @override
  String get localWifiEmptyRouter =>
      'Ei vielä laitteita.\nSama SSID? Paikallinen verkko sallittu? Jotkut reitittimet estävät laitteiden välisen liikenteen (AP-eristys).';

  @override
  String get localWifiIsolationHelp => 'Miksi emme löydä toisiamme?';

  @override
  String get localWifiIsolationTitle => 'Reititin voi eristää asiakkaat';

  @override
  String get localWifiIsolationBody =>
      'Jos tukiaseman/asiakkaan eristys (tai vierasverkko) on käytössä, samassa Wi‑Fi-puhelimet eivät voi puhua. Poista eristys käytöstä, käytä pää-SSID:tä tai vaihda Nearby (Hotspot) -tilaan.';

  @override
  String get localWifiPeerReady => 'Valmiina chattiin (on avain)';

  @override
  String get localWifiPeerNeedKey => 'Löytyi – skannaa QR vaihtaaksesi avaimia';

  @override
  String get localWifiErrorTitle => 'Paikallinen Wi‑Fi-virhe';

  @override
  String get localWifiErrorBody =>
      'Jotain meni pieleen. Pysäytä ja yritä uudelleen.';

  @override
  String get preparingSystem => 'Valmistellaan järjestelmää…';

  @override
  String get bootFailedTitle => 'Ei voitu käynnistää';

  @override
  String get retry => 'Yritä uudelleen';

  @override
  String get bootRecoveryAction =>
      'Aloita uusi identiteetti (poista paikalliset tiedot)';

  @override
  String get bootRecoveryConfirmTitle => 'Aloita uusi identiteetti?';

  @override
  String get bootRecoveryConfirmBody =>
      'Tämä poistaa pysyvästi paikalliset keskustelut, avaimet ja identiteetin tältä laitteelta.\nKavereiden on skannattava QR-koodisi uudelleen uudella henkilöllisyytesi kanssa.\nTätä ei voi kumota.';

  @override
  String get bootRecoveryRunning => 'Nollataan paikallista identiteettiä…';

  @override
  String get bootRecoverySuccess => 'Paikallisen identiteetin palautus valmis';

  @override
  String bootRecoveryFailed(String error) {
    return 'Identiteettiä ei voitu nollata: $error';
  }

  @override
  String get cancel => 'Peruuttaa';

  @override
  String get save => 'Tallentaa';

  @override
  String get close => 'Lähellä';

  @override
  String get start => 'Aloita';

  @override
  String get send => 'Lähetä';

  @override
  String get settings => 'Asetukset';

  @override
  String get language => 'Kieli';

  @override
  String get languageSubtitle =>
      'Oletuksena sovellus noudattaa puhelimen kieltä (jos tuettu). Muut kielet palaavat englanniksi. Voit myös lukita kielen tähän.';

  @override
  String get languageSystem => 'Järjestelmän oletus';

  @override
  String get languageThai => 'thaimaalainen';

  @override
  String get languageEnglish => 'englanti';

  @override
  String get notificationsTooltip => 'Ilmoitusasetukset';

  @override
  String get enableMessageNotifications => 'Ota viesti-ilmoitukset käyttöön';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 viestit ja ihmiset verkossa (paikalliset hälytykset)';

  @override
  String get networkMembersTooltip => 'Verkoston jäseniä';

  @override
  String get identityQrTooltip => 'Identiteetti / QR';

  @override
  String get feedDirects => 'Chat';

  @override
  String get feedMesh => '#verkko';

  @override
  String get feedGeo => 'Alue';

  @override
  String get feedDirectsSubtitle => 'Yksityiset E2EE viestit';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'Läheiset kumppanit (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash-löytökanava';

  @override
  String get peerIdHint =>
      'Liitä vastaanottajan tunnus (Public Key Hash) aloittaaksesi keskustelun';

  @override
  String get directsEmpty =>
      'Ei vielä keskusteluja – skannaa QR-koodi tai liitä vastaanottajan tunnus aloittaaksesi\nViestit sinetöidään E2EE:llä ennen lähettämistä (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • napauta avataksesi chatin';

  @override
  String get meshIntro =>
      'Vertaisalueet BLE – napauta yksityiseen E2EE-chattiin (ei julkista kirjoitusta #meshissä)\nLähettää hybridireitittimen kautta (BLE + LoRa + Nostr online-tilassa)';

  @override
  String get meshEmptyRunning =>
      'Ei vielä lähistöllä olevia vastaavia – avaa sovellus toisella laitteella BLE kantaman sisällä';

  @override
  String get meshEmptyStopped =>
      'BLE ei ole käynnissä – anna Bluetooth-/sijaintilupa';

  @override
  String get meshNearbyPrefix => 'Lähistöllä';

  @override
  String get meshRetentionTitle => 'Poista viestit automaattisesti';

  @override
  String get meshRetentionSubtitle =>
      'Vanhempi paikallinen chat-historia poistetaan automaattisesti';

  @override
  String get meshRetentionKeep => 'Pitää';

  @override
  String get meshRetention1Day => '1 päivä';

  @override
  String get meshRetention3Days => '3 päivää';

  @override
  String get meshRetention7Days => '7 päivää';

  @override
  String get refreshLocationTooltip => 'Päivitä sijainti';

  @override
  String get geoIntro =>
      'Tässä geohashissa verkossa oleville ihmisille voidaan lähettää viestejä 1:1 tai alueen julkisella tuulettimella (sinetöity E2EE vertaiskohtaisesti – ei pelkkä teksti)';

  @override
  String geoEmpty(String channel) {
    return 'Kukaan ei ole vielä online-tilassa kohteessa $channel\nValitse Liikenne → Internet/Auto, odota Nostr, päivitä sijainti';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online-tilassa $channel • napauta saadaksesi 1:1 E2EE:n';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Lähistöllä (odottaa läsnäoloa alueella) • napauta saadaksesi 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nähty Nostr vuonna $channel • vain löytö (vanha)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Vanha anonyymi läsnäolo – odota sidottua vertaista tai vaihda QR-koodi';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE lähellä – skannaa QR aloittaaksesi 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Alueen Internet-etsintä vaatii Nostr yhteyden (Asetukset → Liikenne → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Sijaintia ei ole vielä ratkaistu – anna GPS:n ja päivitysohjelman julkaista geohash osoitteessa Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Sijaintilupa estetty — salli ResilNet kohdassa Asetukset → Tietosuoja → Sijainti';

  @override
  String get geoEmptyServicesDisabled =>
      'Sijaintipalvelut ovat pois päältä – ota ne käyttöön asetuksista';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS-korjausta ei saatu (yleistä Wi‑Fi iPadeissa) – aseta geohash manuaalisesti alla';

  @override
  String get geoEmptyTeleportHint =>
      'Napauta paikkakuvaketta → anna geohash (esim. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Aseta geohash';

  @override
  String get geoTeleportHint =>
      'Ei GPS:ää? Kirjoita geohash-etuliite (2–7 merkkiä, esim. w5) ja napauta Teleport';

  @override
  String get geoTeleportInvalid =>
      'Virheellinen geohash – käytä vain base32-kirjaimia/numeroita (esim. w5 tai w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Alueeksi asetettu $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Manuaalinen alue: $channel (GPS-päivitys ohittaa)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr ei ole valmis – napauta Yhdistä uudelleen (0/0, kunnes aloitus onnistuu)';

  @override
  String get geoEmptyMeshOnly =>
      'Kuljetus on vain mesh-verkkoa – vaihda Internetiin tai Automaattiseen löytääksesi vertaisia ​​yli Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Ei vielä ketään alueella $channel – pidä alue + Internet auki molemmilla laitteilla ja odota noin 60 sekuntia';
  }

  @override
  String get geoChannelFallback => '#alue';

  @override
  String get geoRefreshLocation => 'Päivitä sijainti';

  @override
  String get settingsClearLocationTitle => 'Selkeä sijainti';

  @override
  String get settingsClearLocationSubtitle =>
      'Poista GPS / teleportoi geohash (alueesta tulee #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Tyhjennä sijainti?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Poistaa tallennetun geohashin tälle laitteelle. Voit päivittää GPS:n tai teleportoida uudelleen myöhemmin.';

  @override
  String get settingsClearLocationAction => 'Selkeä sijainti';

  @override
  String get settingsClearLocationSnack => 'Sijainti tyhjennetty';

  @override
  String get chatVoiceTooLarge =>
      'Äänimuistiinpano liian suuri – enintään ~30 sekuntia';

  @override
  String get chatVoiceNeedInternet =>
      'Äänimuistiinpano tarvitsee Internetin (Nostr) – liian suuri yksinään BLE:lle';

  @override
  String get chatVoiceSentInternet =>
      'Internetin kautta lähetetty äänimuistiinpano';

  @override
  String get noticeAnonMention => 'mainita';

  @override
  String get noticeAnonDm => 'suora viesti';

  @override
  String get noticeAnonHug => 'halata';

  @override
  String get noticeAnonSlap => 'isku';

  @override
  String get noticeAnonBlock => 'lohko';

  @override
  String get noticeAnonNeedKey =>
      'Ei vielä julkista avainta – vaihda QR ensin 1:1:een';

  @override
  String get noticeAnonActionSent => 'Lähetetty';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Estetty $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* halaukset $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* iskuja $anon *';
  }

  @override
  String get geoReconnectNostr => 'Yhdistä uudelleen Nostr';

  @override
  String get nostrSectionTitle => 'Nostr releet';

  @override
  String get nostrSectionSubtitle =>
      'Internet-viestit ja alueetsintä käyttävät näitä välityksiä. Napauta yhdistä uudelleen, jos tila pysyy offline-tilassa.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Yhdistetty $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline – releet luetellaan, mutta niitä ei ole kytketty';

  @override
  String get nostrStatusNotInit =>
      'Ei aloitettu (0/0) — napauta Yhdistä uudelleen alustaaksesi';

  @override
  String get nostrReconnectAction => 'Yhdistä uudelleen Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr yhdistetty ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Edelleen offline-tilassa – tarkista Wi‑Fi/cellular tai yritä uudelleen';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Epäonnistui: $error';
  }

  @override
  String get nostrReconnecting => 'Yhdistetään releisiin…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) kohteessa $channel • suljettu chat valmis';
  }

  @override
  String get transportModeTitle => 'Alueellinen kuljetus';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE lähellä (radio), kun ei Nostr · Internet & Auto = Nostr henkilöluettelo';

  @override
  String get transportModeMesh => 'Mesh';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint =>
      'Julkinen viesti kaikille verkossa tällä alueella';

  @override
  String get geoPublicSend => 'Julkinen';

  @override
  String geoPublicHelp(int count) {
    return 'Suljettu tuuletus $count verkkokumppanille – jokainen saa yksityisen kirjekuoren';
  }

  @override
  String geoPublicSent(int count) {
    return 'Lähetetty $count kumppanille tällä alueella';
  }

  @override
  String get geoPublicSentNone =>
      'Ei viestittäviä vertaisia ​​verkossa – avaa Area/Mesh ystäville, joilla on avaimet, tai odota BLE/Nostr';

  @override
  String get areaPublicBadge => 'Alue julkinen';

  @override
  String get geoErrorPermission =>
      'Sijaintia ei voitu lukea – tarkista sijainnin käyttöoikeus';

  @override
  String get geoPrecisionRegion => 'Alue';

  @override
  String get geoPrecisionProvince => 'maakunta';

  @override
  String get geoPrecisionCity => 'Kaupunki';

  @override
  String get geoPrecisionNeighborhood => 'Naapurustossa';

  @override
  String get geoPrecisionBlock => 'Lohko';

  @override
  String get aliasTitle => 'Aseta lempinimi (yhteyshenkilön alias)';

  @override
  String get aliasHintBody =>
      'Tämä alias on tallennettu vain tälle laitteelle (vain paikallinen)\nSitä ei koskaan lähetetä E2EE-liikenteen mukana';

  @override
  String get aliasLabel => 'Lempinimi';

  @override
  String get aliasHint => 'esim. \"kylän pää\", \"P\'Somchai\"…';

  @override
  String get settingsDevices => 'Laitteet';

  @override
  String get settingsFirmwareTitle => 'Lataa / päivitä ESP32 laiteohjelmisto';

  @override
  String get settingsFirmwareSubtitle =>
      'Lataa .bin-tiedostoja ja päivitä ESP32-kortti OTA:n kautta';

  @override
  String get mtBridgeTitle => 'Meshtastic silta';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Vain teksti A/B-silta – ei ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Siirrä lyhyt selkeä teksti välillä Meshtastic ja ResilNet. Tilat A ja B eivät voi toimia samanaikaisesti. Tämä ei ole päästä päähän -salausta.';

  @override
  String get mtBridgeModeLabel => 'tila';

  @override
  String get mtBridgeModeOff => 'Pois';

  @override
  String get mtBridgeModeA => 'Ota A';

  @override
  String get mtBridgeModeB => 'Lähtö B';

  @override
  String get mtBridgeModeOffShort => 'Pois';

  @override
  String get mtBridgeModeAShort => 'Kirjassa A';

  @override
  String get mtBridgeModeBShort => 'Ulos B';

  @override
  String get mtBridgeMutexHint =>
      'Tilan valitseminen sammuttaa toisen automaattisesti. Samanaikaista A+B:tä ei tueta.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (lokikirjaus)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Saapuva teksti näkyy Ilmoitukset-kohdassa muodossa #meshtastic. Verkkorele on valinnainen (oletusarvoisesti pois päältä).';

  @override
  String get mtBridgeRelayTitle => 'Myös rele verkkoon ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Kun käytössä, allekirjoitetut julkiset tiedotteet lähetetään. Pois päältä = vain tämän puhelimen ilmoitukset.';

  @override
  String get mtBridgeSimulateHint => 'Demo viesti';

  @override
  String get mtBridgeSimulate => 'Simuloi Meshtastic viesti';

  @override
  String get mtBridgeIngestOk => 'Sisältyy ilmoituksiin (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Varoitus: tänne lähetetyt viestit EIVÄT ole ResilNet E2EE. Kuka tahansa polulla Meshtastic voi lukea ne.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Teksti julkaistavaksi';

  @override
  String get mtBridgeSend => 'Lähetä osoitteeseen Meshtastic';

  @override
  String get mtBridgeEgressOk => 'Jonossa Meshtastic (katso loki / historia)';

  @override
  String get mtBridgeLastEgress => 'Viimeinen ulostulo';

  @override
  String get mtBridgeEgressHistory => 'Viimeaikainen ulospääsy';

  @override
  String get mtBridgeOffHint =>
      'Ota sisäänotto (A) tai poisto (B) käyttöön käyttääksesi siltaa.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · ei E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Käytä MQTT-kuljetusta';

  @override
  String get mtBridgeUseMqttHint =>
      'Pois = vain esittelyloki (MQTT saapuvaa ei huomioida). Päällä = MQTT sisään-/ulostulolle, kun yhteys on muodostettu.';

  @override
  String get mtBridgeMqttHost => 'Välittäjäisäntä';

  @override
  String get mtBridgeMqttPort => 'Portti';

  @override
  String get mtBridgeMqttTls => 'Käytä TLS:ää (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Tyypillinen portti 8883. Käyttää järjestelmävarmenteita; epäonnistuu pehmeästi kättelyvirheissä.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Yhdistä automaattisesti';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Kun se on päällä, asiakas yrittää muodostaa yhteyden uudelleen katkeamisen jälkeen. Tila näyttää Yhdistetään, kunnes palautetaan.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Aiheen auttajia';

  @override
  String get mtBridgeMqttRegion => 'Alueen etuliite (valinnainen)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Kun asetus on asetettu, Apply rakentaa uudelleen juuren muodossa msh/<region>/2/json (ohittaa aiheen juuren).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON-aiheen juuri';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Downlink-kanavan nimi';

  @override
  String get mtBridgeMqttApplyTopics => 'Käytä root → tilaa / julkaise aiheita';

  @override
  String get mtBridgeMqttAdvanced => 'Lisäasetukset MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, yhdistä uudelleen, aiheet, tunnistetiedot';

  @override
  String get mtBridgeMqttTopicIn => 'Tilaa aihe';

  @override
  String get mtBridgeMqttTopicOut => 'Julkaise aihe';

  @override
  String get mtBridgeMqttGatewayFrom => 'Yhdyskäytäväsolmun tunnus (alkaen)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Desimaalitunnus tai !hex — vaaditaan sendtextin alaslinkille';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Verkkokanavaindeksi (valinnainen 0–7)';

  @override
  String get mtBridgeMqttUser => 'Käyttäjätunnus (valinnainen)';

  @override
  String get mtBridgeMqttPass => 'Salasana (valinnainen)';

  @override
  String get mtBridgeMqttPassStored =>
      'Salasana on tallennettu tähän laitteeseen (ei näy).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Uusi salasana (jätä tyhjäksi säilyttääksesi)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Jätä tyhjäksi säilyttääksesi tallennettu salasana.';

  @override
  String get mtBridgeMqttPassClear => 'Tyhjennä salasana';

  @override
  String get mtBridgeMqttSave => 'Tallenna MQTT-asetukset';

  @override
  String get mtBridgeMqttSaved => 'MQTT asetukset tallennettu';

  @override
  String get mtBridgeMqttConnect => 'Yhdistä';

  @override
  String get mtBridgeMqttDisconnect => 'Katkaise yhteys';

  @override
  String get mtBridgeMqttConnected => 'MQTT yhdistetty';

  @override
  String get mtBridgeMqttConnecting => 'MQTT yhdistetään…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT yhteys katkennut';

  @override
  String get mtBridgeMqttError => 'MQTT virhe';

  @override
  String get mtBridgeErrModeIngest => 'Vaihda ensin sisäänotto-tilaan (A).';

  @override
  String get mtBridgeErrModeEgress => 'Vaihda ensin ulostuloon (B).';

  @override
  String get mtBridgeErrRate => 'Hidasta - nopeus rajoitettu';

  @override
  String get mtBridgeErrDedupe => 'Päällekkäinen viesti ohitettu';

  @override
  String get mtBridgeErrLoop => 'Pudotettu silmukan estämiseksi';

  @override
  String get mtBridgeErrEmpty => 'Viesti on tyhjä';

  @override
  String get mtBridgeErrPublish => 'Julkaiseminen epäonnistui';

  @override
  String get mtBridgeErrNotConnected => 'MQTT ei yhdistetty';

  @override
  String get mtBridgeErrMissingHost => 'Anna MQTT välittäjäisäntä';

  @override
  String get mtBridgeErrMissingTopic => 'Kirjoita tilaa ja julkaise aiheita';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Syötä yhdyskäytävän solmun tunnus (from) lähetettäväksi tekstiksi';

  @override
  String get mtBridgeErrConnect => 'MQTT yhdistäminen epäonnistui';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS-yhteys epäonnistui';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Poista paikalliset viestit pienentääksesi tietokantaa – identiteetti, avaimet ja vertaiset säilytetään';

  @override
  String get settingsSaveHistoryTitle => 'Tallenna viestihistoria';

  @override
  String get settingsSaveHistorySubtitle =>
      'Kun se ei ole käytössä, viestit pysyvät E2EE-yhteydessä ja säilytetään vain tämän istunnon ajan (ei paikallisessa chat-historiassa). Oma tekstisi näkyy edelleen pelkkänä tekstinä tällä laitteella.';

  @override
  String get settingsPrivacy => 'Yksityisyys';

  @override
  String get settingsE2eeTitle => 'Päästä päähän -salaus';

  @override
  String get settingsE2eeSubtitle =>
      'Aina päällä — viestit sinetöidään RSA-OAEP + AES-GCM:llä ennen lähettämistä. Releet ja lähellä olevat humalat eivät voi lukea sisältöä.';

  @override
  String get settingsScreenshotTitle => 'Screenshot-hälytykset';

  @override
  String get settingsScreenshotSubtitle =>
      'Näytä järjestelmälinja chatissa, kun tämä laite kaappaa näytön';

  @override
  String get settingsNostrExpiryTitle => 'Nostr viestin säilytysaika';

  @override
  String get settingsNostrExpirySubtitle =>
      'Kuinka kauan sinetöityjen kirjekuorten tulee pysyä paikallisesti verkossa osoitteessa Nostr';

  @override
  String get noticeExpiresIn => 'päättyy vuonna';

  @override
  String get noticesTitle => 'Ilmoitukset';

  @override
  String get noticesMeshIntro =>
      'Julkinen tiedote – näkyy kaikille radioalueella, ei salattu. Se siirtyy puhelimesta puhelimeen offline-tilassa, ja lähellä olevat ResilNet välityslaatikot säilyttävät kopion, jotta myöhemmin saapuvat ihmiset näkevät sen silti.';

  @override
  String get noticesMeshPublicBadge => 'JULKINEN · ei salattu';

  @override
  String get noticesGeoIntro =>
      'Lisää tästä paikasta lyhyitä muistiinpanoja, jotta muut vierailijat voivat löytää ne.';

  @override
  String get noticesEmpty => 'ei vielä ilmoituksia';

  @override
  String get noticesEmptyHint =>
      'kiinnitä ensimmäinen ilmoitus ihmisille täällä.';

  @override
  String get noticesComposeHint => 'laita ilmoitus...';

  @override
  String get noticesUrgent => 'kiireellinen';

  @override
  String get noticesOpen => 'Ilmoitukset';

  @override
  String get screenshotTaken => '*otit kuvakaappauksen*';

  @override
  String get chatAttachImage => 'Liitä kuva';

  @override
  String get chatImageLabel => 'Kuva';

  @override
  String get chatImageTooLarge => 'Kuva liian suuri – kokeile toista valokuvaa';

  @override
  String get chatNostrExpiry => 'Nostr säilytä';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Lähetä osoitteeseen $channel – julkinen';
  }

  @override
  String get settingsClearTitle => 'Tyhjennä kaikki viestit';

  @override
  String get settingsClearSubtitle =>
      'Poista kaikki keskustelut tällä laitteella';

  @override
  String get settingsClearConfirmTitle => 'Tyhjennä kaikki viestit?';

  @override
  String get settingsClearConfirmBody =>
      'Tämä poistaa kaikki chat-viestit tältä laitteelta.\nPeers ja lempinimiä ei poisteta.';

  @override
  String get settingsClearAction => 'Tyhjennä tiedot';

  @override
  String get settingsClearedSnack => 'Tiedot tyhjennetty';

  @override
  String settingsVersion(String version) {
    return 'versio $version';
  }

  @override
  String get meshBleScanning => 'BLE: etsitään solmuja';

  @override
  String get meshBleEsp32Scanning => 'ESP32: etsitään lähellä olevaa solmua';

  @override
  String get meshBleSyncing => 'BLE: synkronoidaan kanssa ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: julkaiseminen';

  @override
  String get meshBleIdle =>
      'BLE mesh päällä – ei vielä lähellä olevia puhelimia';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh – $count puhelinta lähellä';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: vaaditaan lupa';

  @override
  String get meshBlePausedCamera =>
      'BLE keskeytetty kameralle — napauta Käynnistä BLE';

  @override
  String get meshBleStopped =>
      'BLE on pois päältä – tarkista, että Bluetooth on päällä, ja napauta sitten Käynnistä BLE';

  @override
  String get meshBleRestart => 'Aloita BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Tarkista käyttöoikeudet ja aloita BLE';

  @override
  String get meshNostrOffline => 'Nostr offline-tilassa';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count lähellä olevat vertaiset • LoRa $lora • synkronointi ~${meters}m';
  }

  @override
  String get meshLoraReady => 'valmis';

  @override
  String get meshLoraNotReady => 'ei ole valmis';

  @override
  String meshGatewayProgress(String label) {
    return 'Yhdyskäytävän UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Yhdyskäytävä UDP: valmis';

  @override
  String get permissionTitle => 'Salli pääsy käynnistääksesi BLE mesh-verkon';

  @override
  String get permissionBody =>
      'Sovellus tarvitsee Bluetoothin (skannaa / yhdistä / mainosta), sijainnin (vanhemmille Android-laitteille) ja mikrofonin (äänimuistiinpanoja varten chatissa ja ilmoituksissa) yhteisön viestejä varten.';

  @override
  String get permissionE2ee =>
      'Päästä päähän -salaus (E2EE)\nVälityssolmut eivät voi lukea viestien sisältöä';

  @override
  String get permissionReady => 'Käyttöoikeudet valmiina';

  @override
  String get permissionRequest => 'Salli ja jatka';

  @override
  String get permissionNotReadySnack =>
      'Järjestelmä ei ole vielä valmis – odota hetki ja yritä uudelleen';

  @override
  String get permissionDeniedSnack =>
      'Käyttöoikeudet keskeneräiset — avaa Asetukset > ResilNet ja salli Bluetooth / Sijainti / mikrofoni';

  @override
  String get permissionMicDenied =>
      'Mikrofonin käyttö estetty – salli sen äänittää äänimuistiinpanoja asetuksissa';

  @override
  String get permissionMicOpenSettings => 'Asetukset';

  @override
  String get permissionCameraDenied =>
      'Kameran käyttö estetty – salli sen skannata QR-koodeja asetuksissa';

  @override
  String get permissionCameraFailed =>
      'QR-koodien skannaamiseen tarvitaan kameran lupa';

  @override
  String get permissionCameraOpenSettings => 'Asetukset';

  @override
  String get permissionPhotosDenied =>
      'Valokuvakirjaston käyttö estetty – salli sen tallentaa QR-koodisi asetuksissa';

  @override
  String get permissionPhotosFailed =>
      'QR-koodin tallentamiseen tarvitaan valokuvakirjaston lupa';

  @override
  String get permissionPhotosOpenSettings => 'Asetukset';

  @override
  String permissionFailedSnack(String error) {
    return 'Lupapyyntö epäonnistui: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Arkkitehtuuri • Tallenna ja välitä Multi-hop';

  @override
  String get onboardingSkip => 'Ohita';

  @override
  String get onboardingNext => 'Seuraavaksi';

  @override
  String get onboardingStart => 'Aloita';

  @override
  String get onboardingWelcomeTitle => 'Tervetuloa ResilNet-palveluun';

  @override
  String get onboardingWelcomeBody =>
      'Keskustele verkossa ResilNet mesh-verkon kautta – jopa ilman Internetiä';

  @override
  String get onboardingFriendsTitle => 'Lisää ystäviä helposti';

  @override
  String get onboardingFriendsBody =>
      'Jaa QR-koodi Identitystä tai skannaa ystäväsi QR vaihtaaksesi julkisia avaimia';

  @override
  String get onboardingChannelsTitle => 'Salattu chat + lähellä olevat kanavat';

  @override
  String get onboardingChannelsBody =>
      'Vaihda #mesh / Area (geohash) löytääksesi lähellä olevat vertaiset – viestit pysyvät E2EE yli BLE mesh ja Nostr';

  @override
  String get chatTitle => 'Chat (E2EE)';

  @override
  String get chatScanTooltip => 'Skannaa QR lisätäksesi vertaisen';

  @override
  String get chatBlockTooltip => 'Estä tämä lähettäjä';

  @override
  String get chatBlockedSnack => 'Estetty: ei ilmoituksia / ei välitystä';

  @override
  String get chatAliasTooltip => 'Aseta lempinimi';

  @override
  String get chatReceiverPemLabel => 'Vastaanottajan julkinen avain (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Liitä ystäväsi julkinen avain (QR:sta / jaetusta tiedostosta)';

  @override
  String get chatNeedPeerKey =>
      'Skannaa ensin tämän vertaiskumppanin QR (vahvistettu julkinen avain vaaditaan)';

  @override
  String get chatPeerKeyMismatch =>
      'Tallennettu julkinen avain ei vastaa tätä vertaistunnusta';

  @override
  String chatVoiceFailed(String error) {
    return 'Ääntä ei voitu tallentaa: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Äänimuistiinpanoa ei voitu toistaa: $error';
  }

  @override
  String get chatPlayVoice => 'Toista äänimuistiinpano';

  @override
  String get chatPauseVoice => 'Tauko';

  @override
  String get chatVoiceLabelSent => '🎤 Ääniviesti (sinetöity)';

  @override
  String get chatVoiceLabel => '🎤 Äänimuistiinpano';

  @override
  String get chatDecryptFailed => '[salauksen purku epäonnistui]';

  @override
  String chatSentSealed(String preview) {
    return '[sinetöity • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[sinetöity]';

  @override
  String get chatComposeHint =>
      'Kirjoita viesti… (suljettu lähetyksen yhteydessä)';

  @override
  String get chatEmptyThread =>
      'Ei viestejä vielä\nKirjoita alle lähettääksesi meshin kautta';

  @override
  String chatLoadFailed(String error) {
    return 'Keskustelua ei voitu ladata: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Odottaa';

  @override
  String get statusSent => 'Lähetetty';

  @override
  String get statusRelayed => 'Välitetty';

  @override
  String get statusDelivered => 'Toimitettu';

  @override
  String get statusRead => 'Lukea';

  @override
  String get statusFailed => 'Epäonnistui';

  @override
  String get chatCopy => 'Kopioida';

  @override
  String get chatDeleteLocal => 'Poista tältä laitteelta';

  @override
  String get chatDeletedLocalSnack => 'Poistettu tältä laitteelta';

  @override
  String get chatRetry => 'Yritä uudelleen';

  @override
  String get chatSendFailed => 'Ei toimitettu — napauta Yritä uudelleen';

  @override
  String get chatImageNeedInternet =>
      'Muodosta yhteys Internetiin lähettääksesi kuvia';

  @override
  String get chatImageTooLargeOnline =>
      'Kuvaa ei voitu pakata tarpeeksi lähetettäväksi';

  @override
  String get chatOpenLinkFailed => 'Linkkiä ei voitu avata';

  @override
  String get identityTitle => 'Identiteetti';

  @override
  String get identityScanTooltip => 'Skannaa QR kameralla';

  @override
  String get identityCopiedHash => 'Julkisen avaimen hash kopioitu';

  @override
  String get identityPeerSaved => 'Vertaistuki tallennettu QR:sta';

  @override
  String get identityGalleryDenied => 'Kuvakirjaston lupa evätty';

  @override
  String get identityQrSaved => 'QR tallennettu valokuvakirjastoon';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR-koodia ei voitu tallentaa: $error';
  }

  @override
  String get peersTitle => 'Verkoston jäseniä';

  @override
  String get qrScanTitle => 'Skannaa QR lisätäksesi kaverin';

  @override
  String get qrInvalid => 'Skannaus epäonnistui: virheellinen QR';

  @override
  String get qrIdKeyMismatch => 'QR hylätty: tunnus ei vastaa julkista avainta';

  @override
  String get qrCameraNotReady => 'Kamera ei ole valmis';

  @override
  String get qrRetrySettings => 'Yritä uudelleen / avaa Asetukset';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Kameraa ei voitu avata: $error';
  }

  @override
  String get qrScanAlignHint => 'Kohdista QR-koodi kehyksen sisään';

  @override
  String get firmwareDownloadTitle => 'Lataa ESP32 laiteohjelmisto';

  @override
  String get firmwareSourceOnline => 'Uusin (verkossa)';

  @override
  String get firmwareSourceCached => 'Tallennettu kopio (offline)';

  @override
  String get firmwareSourceBaseline => 'Niputettu lähtötaso (offline)';

  @override
  String get firmwareSourceUnavailable => 'Laiteohjelmistoa ei ole saatavilla';

  @override
  String get firmwareBaselineIncompatible =>
      'Mukana oleva laiteohjelmisto on liian vanha – muodosta yhteys Internetiin ladataksesi uudemman version';

  @override
  String get firmwareChecksumFailed =>
      'Laiteohjelmiston eheyden tarkistus epäonnistui – vilkkuminen estetty';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Laiteohjelmisto valmis: $source';
  }

  @override
  String get peersRefreshTooltip => 'Päivitä';

  @override
  String get peersBlocked => 'Estetty';

  @override
  String peersNearbyBle(Object ble) {
    return 'Lähistöllä (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'Äskettäin verkossa';

  @override
  String get peersOnlineInArea => 'Netissä alueella';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Nähty $minutes min sitten';
  }

  @override
  String get peersOffline => 'Offline-tilassa';

  @override
  String peersBlockedSnack(String id) {
    return 'Estetty $id';
  }

  @override
  String get peersUnblockedSnack => 'Esto kumottu';

  @override
  String get peersEmpty =>
      'Tietokannassa ei ole vielä jäseniä\nSkannaa QR tai odota BLE mesh-löydystä';

  @override
  String get peersOpenChat => 'Avaa chat';

  @override
  String get peersBlockAction => 'Lohko';

  @override
  String get peersUnblockAction => 'Kumoa esto';

  @override
  String get channelPickerTooltip => 'Chat / #verkko / Alue';

  @override
  String get locationPickerTooltip => 'Sijaintikanava';

  @override
  String get transportPickerTooltip => 'Verkko / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Ihmiset verkossa';

  @override
  String get unreadDirectsTooltipEmpty => 'Yksityisviestit';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count lukematonta yksityisviestiä';
  }

  @override
  String get onlinePeopleTitle => 'ihmiset';

  @override
  String get onlinePeopleEmpty => 'Täällä ei ole vielä ketään verkossa';

  @override
  String onlinePeopleCount(int count) {
    return '$count verkossa';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · lähialue + alue';

  @override
  String get peerOnlineMeshTitle => 'Joku lähistöllä meshissä';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name on lähellä meshissä';
  }

  @override
  String get peerOnlineAreaTitle => 'Joku verkossa alueella';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name on online-tilassa Nostr:n kautta';
  }

  @override
  String get locationSheetTitle => '#sijaintikanavat';

  @override
  String get channelPinsTitle => 'Kiinnitetty';

  @override
  String get channelPinsHint =>
      'Kiinnitä usein käyttämäsi kanavat – ne pysyvät yläreunassa';

  @override
  String get channelPinTooltip => 'Kiinnitä tämä kanava';

  @override
  String get channelUnpinTooltip => 'Irrota kiinnitys';

  @override
  String get locationSheetIntro =>
      'Keskustele lähellä olevien ihmisten kanssa käyttämällä karkeaa geohashia – ei tarkkaa GPS:ää. Internet-läsnäolo käyttää anonyymejä Nostr-näppäimiä.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportoi';

  @override
  String homeComposeHint(String channel) {
    return 'Viesti $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Lähetä osoitteeseen $channel – julkinen';
  }

  @override
  String get messageExpiryTitle => 'päättyy vuonna';

  @override
  String get voiceRecordTapToStart => 'Napauta äänittääksesi ääniviestin';

  @override
  String get voiceRecordTooShort => 'Tallennus liian lyhyt – yritä uudelleen';

  @override
  String get voiceRecordFailed =>
      'Tallennusta ei voitu tallentaa – yritä uudelleen';

  @override
  String get voicePttHold => 'Pidä painettuna tallentaaksesi';

  @override
  String get voicePttRelease => 'Vapauta esikatseluun';

  @override
  String get voicePttRecording => 'Tallennetaan…';

  @override
  String get voicePttDraftReady => 'Äänimuistiinpano valmis';

  @override
  String get voicePttDiscard => 'Hävitä';

  @override
  String get voicePttReRecord => 'Äänitä uudelleen';

  @override
  String get voicePttSend => 'Lähetä äänimuistiinpano';

  @override
  String get voicePttPlayPreview => 'Toista esikatselu';

  @override
  String get voicePttStopPreview => 'Lopeta esikatselu';

  @override
  String get noticesBackfilling => 'Ladataan ilmoituksia…';

  @override
  String get noticesNostrOnline => 'Nostr verkossa';

  @override
  String get noticesNostrOffline =>
      'Nostr offline-tilassa – tiedote tarvitsee Internetin';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Ladattu $count ilmoituksia';
  }

  @override
  String get noticePublishFailed =>
      'Ilmoitusta aluehallitukselle ei voitu julkaista. Tarkista Nostr-yhteys.';

  @override
  String get noticeMeshPublishNoLink =>
      'Tallennettu paikallisesti. Yhdistä läheiseen mesh-radioon (tai Wi‑Fi-yhdyskäytävään), jotta muut voivat vastaanottaa sen.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Tiedote lähetetty $count lähellä olevalle laitteelle yli BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Läheiset radiot nähty, mutta BLE kirjoitus epäonnistui. Pidä molemmat sovellukset auki Ilmoitukset-näytössä ja yritä uudelleen (tai käytä ESP32-relettä).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Tämän laitteen BLE-vastaanotin ei ole valmis. Kytke Bluetooth päälle ja avaa Ilmoitukset uudelleen.';

  @override
  String get noticeDelete => 'Poista ilmoitus';

  @override
  String get noticeDeleteConfirmTitle => 'Poistetaanko tämä ilmoitus?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Tämä poistaa sen vain tältä laitteelta. Muut, jotka ovat jo saaneet sen, näkevät sen edelleen.';

  @override
  String get noticeDeleted => 'Ilmoitus poistettu';

  @override
  String get chatNoticeHidden => 'Alueilmoitus — avaa Ilmoitukset';

  @override
  String get identityDisplayNameTitle => 'Näyttönimi';

  @override
  String get identitySaveName => 'Tallenna nimi';

  @override
  String get identityUserIdLabel =>
      'Käyttäjätunnus (julkisen avaimen hajautus)';

  @override
  String get identityCopyHashTooltip => 'Kopioi julkisen avaimen hash';

  @override
  String get identityMyQrTitle => 'Oma QR (tunnus + pubKey + nimi)';

  @override
  String identityQrFailed(String error) {
    return 'QR-koodia ei voitu luoda\n$error';
  }

  @override
  String get identitySaving => 'Tallennetaan…';

  @override
  String get identitySaveQr => 'Tallenna QR valokuvakirjastoon';

  @override
  String get identityOpenScanner => 'Avaa kamera QR-koodin skannaamiseksi';

  @override
  String get identityQrHelp =>
      'Pyydä ystävääsi skannaamaan tämä tallentaaksesi julkisen avaimesi ja (tarvittaessa) asettaaksesi sinut vahvistetuksi myöntäjäksi';

  @override
  String get identityChatTip =>
      'Vinkki: voit myös skannata QR-koodin chatissa lisätäksesi julkisen avaimen E2EE:lle';

  @override
  String get infoOpen => 'Tietoja / Tietoja';

  @override
  String get docsGuideTitle => 'Käyttöopas';

  @override
  String get docsGuideSubtitle => 'Avautuu selaimessa';

  @override
  String get docsOpenAction => 'Avaa opas';

  @override
  String get docsOpenFailed => 'Käyttöopasta ei voitu avata';

  @override
  String get firmwareOtaGuideTitle => 'Flash-opas ja OTA-protokolla';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Avaa verkkooppaan – .bin-lataukset ja täydelliset vaiheet';

  @override
  String get firmwareWebDownloadsTitle => 'Laiteohjelmiston lataukset verkosta';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Versiokohtaiset linkit ja tarkistussummat asiakirjasivustolla';

  @override
  String get inviteCopyShortLink => 'Kopioi lyhyt linkki';

  @override
  String get inviteShareLink => 'Jaa linkki';

  @override
  String get inviteShowFullLink => 'Täysi linkki';

  @override
  String get inviteCopyFullLink => 'Kopioi koko linkki';

  @override
  String get inviteLinkCopied => 'Linkki kopioitu';

  @override
  String get inviteLongPressHint => 'Paina pitkään linkin toimintoja varten';

  @override
  String get inviteSendInChat => 'Lähetä ResilNet chatissa…';

  @override
  String get inviteSendInChatHint =>
      'Vain henkilöt, joille sinulla on jo julkinen avain';

  @override
  String get inviteSendInChatEmpty =>
      'Ei vielä viestittäviä keskusteluja.\nSkannaa QR, avaa Area/Mesh tai jaa linkki ensin sovelluksen ulkopuolelle.';

  @override
  String get inviteSentToChat => 'Kutsu lähetetty chatissa';

  @override
  String get infoTabInfo => 'Tiedot';

  @override
  String get infoTabSettingsHint =>
      'Avaa Asetukset valikosta kieli-, E2EE- ja datatyökaluja varten';

  @override
  String get infoHowToTitle => 'Kuinka käyttää';

  @override
  String get infoHowToBody =>
      '• Napauta kanavakuvaketta vaihtaaksesi Chat / #mesh / Area\n• Napauta paikkaa valitaksesi geohash-koon\n• Napauta ihmisiä jäsenille tai online-tilassa oleville\n• Avaa Identity/QR kohdasta ⋮ vaihtaaksesi avaimia henkilökohtaisesti\n• Alue \"julkinen\" lähettää suljetun E2EE:n jokaiselle online-vertaiselle – ei tavalliselle tekstihuoneelle';

  @override
  String get infoFeaturesTitle => 'Ominaisuudet';

  @override
  String get infoFeatureOffline =>
      'Offline-viestintä Bluetooth Low Energyn kautta';

  @override
  String get infoFeatureE2ee =>
      'Päästä päähän -salaus RSA-OAEP:llä + AES-GCM:llä (ei kohinaa)';

  @override
  String get infoFeatureMultihop =>
      'Viestit voivat hypätä läheisten vertaisten kautta päästäkseen pidemmälle';

  @override
  String get infoFeatureBridge =>
      'Hybridiverkko ↔ internet (Nostr) suljetuille kirjekuorille';

  @override
  String get infoFeatureGeo =>
      'Paikalliset geohash-kanavat lähellä oleville ihmisille (discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Ilmoitukset voimassaoloajan päättymisestä koskien #mesh ja Area';

  @override
  String get infoPrivacyTitle => 'Yksityisyys';

  @override
  String get infoPrivacyNoRoom =>
      'Ei selväkielistä kylää/julkista chat-huonetta';

  @override
  String get infoPrivacyFanout =>
      'Aluelähetys = sinetöity 1:1 fan-out ystäville tunnetuilla julkisilla avaimilla';

  @override
  String get infoPrivacyPresence =>
      'Internet-alueen läsnäolo käyttää lyhytaikaisia ​​Nostr-näppäimiä';

  @override
  String get infoSymbolsTitle => 'Symbolit';

  @override
  String get infoSymBle => 'Suora Bluetooth-yhteys';

  @override
  String get infoSymMesh => 'Tavoitettavissa verkon kautta (muut eteenpäin)';

  @override
  String get infoSymInternet =>
      'Internetin kautta (Nostr) – suljetut kirjekuoret';

  @override
  String get infoSymBridge => 'Saapui mesh↔internet-siltapolun kautta';

  @override
  String get infoSymOffline => 'Offline – ei tavoitettavissa juuri nyt';

  @override
  String get infoSymInArea => 'Tämän sijaintikanavan alueella';

  @override
  String get infoSymE2eeOk => 'Päästä päähän salattu istunto';

  @override
  String get infoSymE2eeFail =>
      'Salaus ei ole käytettävissä — älä lähetä arkaluonteista tekstiä';

  @override
  String get infoSymVerified => 'Identiteetti vahvistettu / tunnettu avain';

  @override
  String get infoSymBlocked => 'Estetty';

  @override
  String get infoSymUnread => 'Lukematon yksityisviesti';

  @override
  String get infoEmergencyTitle => 'Hätätila';

  @override
  String get infoEmergencyBody =>
      'Pyyhi viestit, avaimet ja henkilöllisyys tällä laitteella kolmesti napauttamalla aloitusnäytön ResilNet otsikkoa.';

  @override
  String get infoLegendNote =>
      'Jotkut polkukuvakkeet on dokumentoitu tähän selvyyden vuoksi; chatissa olevat toimitusmerkit pysyvät ensisijaisena lähetystilana.';

  @override
  String get dangerZoneTitle => 'Vaaravyöhyke';

  @override
  String get dangerZoneSubtitle =>
      'Poistaa tämän laitteen viestit, salausavaimet, Nostr-identiteetin, kumppanit ja lempinimet. Määrität uudelleen.';

  @override
  String get panicWipeTitle => 'Hätäpyyhe';

  @override
  String get panicWipeSubtitle =>
      'Tyhjennä kaikki paikallinen – sama kuin kolminkertainen kotiotsikon napauttaminen (kaksoisnapautus päivittää radiot)';

  @override
  String get panicWipeConfirmTitle => 'Pyyhikö kaikki paikalliset tiedot?';

  @override
  String get panicWipeConfirmBody =>
      'Tämä poistaa pysyvästi keskustelut, avaimet ja henkilöllisyyden tästä puhelimesta.\nVertaisten on vaihdettava QR-avaimet uudelleen uudella henkilöllisyytesi kanssa.\nTätä ei voi kumota.';

  @override
  String get panicWipeAction => 'Pyyhi kaikki';

  @override
  String get panicWipeSnack =>
      'Paikallinen identiteetti tyhjennetty – määritä uudelleen';

  @override
  String panicWipeFailed(String error) {
    return 'Pyyhintä epäonnistui: $error';
  }

  @override
  String get meshBridgeTitle => 'Verkkosilta';

  @override
  String get meshBridgeSubtitle =>
      'Kun käytössä (oletus), suljetut kirjekuoret voivat käyttää sekä BLE meshiä että Internetiä (Nostr), jotta läheiset verkkosaarekkeet voivat muodostaa yhteyden. Kun se on pois päältä, lähetykset käyttävät vain yhtä polkua – ei koskaan laita johtoon pelkkää tekstiä.';

  @override
  String get favoritesTitle => 'Suosikit';

  @override
  String get favoritesAdd => 'Lisää suosikkeihin';

  @override
  String get favoritesRemove => 'Poista suosikeista';

  @override
  String get favoritesEmpty =>
      'Ei vielä suosikkeja – merkitse jäsenluettelosta vertaiskuva';

  @override
  String get favoritesNearbyTitle => 'Suosikki lähellä';

  @override
  String favoritesNearbyBody(String name) {
    return '$name on lähellä meshissä';
  }

  @override
  String get favoritesInAreaTitle => 'Suosikki alueella';

  @override
  String favoritesInAreaBody(String name) {
    return '$name on online-tilassa tällä alueella';
  }

  @override
  String get topologyTitle => 'Verkkotopologia';

  @override
  String get topologySubtitle =>
      'Mesh-ilmoituksen vertaiset ja yhteysvinkit (vain luku)';

  @override
  String get topologyConnectedNow => 'Yhdistetty nyt (BLE)';

  @override
  String get topologyNearby => 'Lähistöllä (BLE)';

  @override
  String get topologyKnown => 'Tunnetut vertaiset';

  @override
  String get topologyEmpty =>
      'Ei vielä oppineita vertaisia ​​– pysy lähellä BLE päällä';

  @override
  String get topologyYou => 'sinä';

  @override
  String topologyStats(int peers, int links) {
    return '$peers vertaista · $links linkkiä';
  }

  @override
  String get topologyGraphHint =>
      'Arvioitu lähistöllä olevan mesh-löydön perusteella – laitteesi on korostettuna. Avaa chat napauttamalla vertaista.';

  @override
  String get topologyOpen => 'Verkkotopologia';

  @override
  String get slashHelpTitle => 'komennot';

  @override
  String get slashHelpBody =>
      '/help - tämä luettelo\n/who — ihmiset online-tilassa nykyisellä kanavalla\n/drop <teksti> — kiinnitä sinetöity ilmoitus tähän (E2EE fan-out)\n\nTäydellinen opas: käytä Avaa opas alla tai Asetukset → Käyttöopas.';

  @override
  String get slashWhoEmpty =>
      'Tällä kanavalla ei ole tällä hetkellä ketään verkossa';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Käyttö: /pudota muistiinpanosi teksti';

  @override
  String slashDropDone(String channel) {
    return 'Ilmoitus poistettiin $channel';
  }

  @override
  String get slashUnknown => 'Tuntematon komento - kokeile /help';

  @override
  String get announceOpen => 'Ilmoitukset';

  @override
  String get announceTitle => 'Ilmoitukset';

  @override
  String get announceEmpty =>
      'Ei vielä tauluja – luo sellainen lähettääksesi lukittuja tai avoimia ilmoituksia';

  @override
  String get announceCreate => 'Luo taulu';

  @override
  String get announceCreateHint => 'Hallituksen nimi';

  @override
  String get announceDefaultTitle => 'yhteisön hallitus';

  @override
  String get announceSettings => 'Taulukon asetukset';

  @override
  String get announceAllowLocked => 'Salli lukitut (salatut) viestit';

  @override
  String get announceAllowLockedSub =>
      'Salattu kortin avaimeen – lukijat tarvitsevat pääsyn';

  @override
  String get announceAllowOpen => 'Salli avoimet (selkoteksti) viestit';

  @override
  String get announceAllowOpenSub =>
      'Ei E2EE — luettavissa meshissä/releissä. Oletuksena pois päältä.';

  @override
  String get announceComposeHint => 'Kirjoita ilmoitus…';

  @override
  String get announceMediaInternetOnly =>
      'Internetin kautta lähetettävät valokuva-/ääni-ilmoitukset (ei BLE)';

  @override
  String get announceNeedInternet =>
      'Yhdistä Internetiin lähettääksesi kuva- tai ääniilmoituksia';

  @override
  String announceVoiceFailed(String error) {
    return 'Ääntä ei voitu tallentaa: $error';
  }

  @override
  String get announceImageTooLarge => 'Kuva on liian suuri (enintään ~180 kt)';

  @override
  String get announcePlayVoice => 'Toista äänimuistiinpano';

  @override
  String get announceImageLabel => '📷 Kuva';

  @override
  String get announceAudioLabel => '🎤 Äänimuistiinpano';

  @override
  String get announceModeLocked => 'Lukittu';

  @override
  String get announceModeOpen => 'Avata';

  @override
  String get announceOpenBadge => 'OPEN · ei salattu';

  @override
  String get announceLockedBadge => 'Lukittu';

  @override
  String get announceLockedPlaceholder => 'Salattu — pyydä lukemista';

  @override
  String get announceRequestAccess => 'Pyydä käyttöoikeutta';

  @override
  String get announceRequestSent =>
      'Pääsypyyntö lähetetty hallituksen omistajalle';

  @override
  String get announceRequestFailed =>
      'Käyttöoikeutta ei voitu pyytää (tarvitaan omistajan julkinen avain)';

  @override
  String get announceOpenConfirmTitle => 'Postataanko ilman salausta?';

  @override
  String get announceOpenConfirmBody =>
      'Avoimet viestit eivät ole E2EE. Kuka tahansa polulla oleva (verkko / releet) voi lukea ne. Jatkaa?';

  @override
  String get announcePostAction => 'Lähettää';

  @override
  String get announcePendingRequests => 'Pääsypyynnöt';

  @override
  String get announceApprove => 'Hyväksyä';

  @override
  String get announceDeny => 'Kiellä';

  @override
  String get announceGranted => 'Voit lukea lukittuja viestejä tällä palstalla';

  @override
  String get announceOwner => 'Omistat tämän taulun';

  @override
  String get announceCopyInvite => 'Kopioi kutsuteksti';

  @override
  String get announceShowInviteQr => 'Näytä kutsun QR';

  @override
  String get announceScanInviteQr => 'Scan board kutsu QR';

  @override
  String get announceFollow => 'Seuraa taulua kutsusta';

  @override
  String get announceFollowHint =>
      'Liitä kutsuteksti tai ResilNet-linkki omistajalta';

  @override
  String get announceFollowOk => 'Lautan perässä';

  @override
  String announceFollowOkNamed(String title) {
    return 'Seurataan nyt “$title”';
  }

  @override
  String get announceFollowFail => 'Kutsu on virheellinen tai vahingoittunut';

  @override
  String get announceInviteCopied => 'Kutsuteksti kopioitu';

  @override
  String get announceInviteSaveQr => 'Tallenna QR';

  @override
  String get announceInviteShare => 'Jaa kutsu';

  @override
  String get announceFollowFromCompose =>
      'Hallituskutsu havaittiin viestilaatikossa';

  @override
  String get peerConfirmAddTitle => 'Lisätäänkö verkoston jäsen?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Lisätäänkö \"$name\" heidän julkiseen avaimensa, jotta voit lähettää heille yksityisviestin?';
  }

  @override
  String get peerConfirmAdd => 'Lisää jäsen';

  @override
  String peerAddedOk(String name) {
    return '$name lisätty verkoston jäseniin';
  }

  @override
  String get peerAddFromCompose =>
      'Identiteetti / julkinen avain havaittu viestilaatikossa';

  @override
  String get peerHashCopied => 'Julkisen avaimen hash kopioitu';

  @override
  String get peerHashOpenChat => 'Avaa chat';

  @override
  String get peerHashAddHint =>
      'Hash kopioitu. Pyydä heitä jakamaan identiteettilinkkinsä tai QR-koodinsa, jotta voit lisätä E2EE:n täyden julkisen avaimen.';

  @override
  String get peerQrNoCode => 'Tästä kuvasta ei löydy ResilNet QR-koodia';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identiteetti: \"$name\"\nAvaa linkki tai liitä se chatiin → Lisää jäsen\nTai skannaa henkilöllisyyden QR-koodi.';
  }

  @override
  String get identityShareInvite => 'Jaa identiteettilinkki';

  @override
  String get identityInviteCopied => 'Identiteettilinkki kopioitu';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Hallituksen kutsu: \"$title\"\nAvaa ResilNet → Yhteisökeskustelut → Seuraa kutsusta\nTai skannaa QR / napauta alla olevaa linkkiä.';
  }

  @override
  String get announceConfirmFollowTitle => 'Seuraatko tätä taulua?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Seuraatko tämän kutsun \"$title\"?';
  }

  @override
  String get announceConfirmFollow => 'Seuraa';
}

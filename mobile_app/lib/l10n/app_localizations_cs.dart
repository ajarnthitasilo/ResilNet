// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Obnovování ResilNet…';

  @override
  String get appRefreshed => 'Obnoveno — rádia a vyhledávání restartováno';

  @override
  String appRefreshFailed(String error) {
    return 'Obnovení se nezdařilo: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Dvojité klepnutí = jemné osvěžení. Dlouhé stisknutí = těžké zotavení. Trojité klepnutí = nouzové setření.';

  @override
  String get softRefreshTipTitle => 'Pokud se ResilNet cítí zaseknutý';

  @override
  String get softRefreshTipBody =>
      'Dvakrát klepněte na ResilNet (vlevo nahoře) pro jemné obnovení rádia. Pokud stále uvízne: dlouze stiskněte název, použijte ⋮ → Tvrdé obnovení nebo Nastavení. Trojité klepnutí je pouze nouzové vymazání.';

  @override
  String get softRefreshTipGotIt => 'Rozumím';

  @override
  String get infoSoftRefreshTitle => 'Pokud se aplikace zasekne';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Dvakrát klepněte na ResilNet (vlevo nahoře) → rádia pro jemné obnovení a lidé v okolí';

  @override
  String get infoSoftRefreshStepHard =>
      'Stále zaseknutý? Dlouze stiskněte název nebo ⋮ / Nastavení → Tvrdé obnovení';

  @override
  String get infoSoftRefreshStepWait =>
      'Počkejte na výsledek občerstvení a zkuste to znovu. Resetování relace uchová vaše klíče.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Trojité klepnutí = nouzové vymazání (smaže místní data) – pouze pokud je úmyslné';

  @override
  String get appRecoverySection => 'Obnova aplikace';

  @override
  String get appRecoverySectionSubtitle =>
      'Použijte, když je aplikace zamrzlá. Jemné = dvojité klepnutí na titulek. Tvrdé zotavení je silnější. Resetování relace restartuje služby bez vymazání klíčů.';

  @override
  String get appHardRecoverAction => 'Těžké zotavení';

  @override
  String get appHardRecovering => 'Těžké zotavení…';

  @override
  String get appSessionResetAction => 'Resetovat relaci';

  @override
  String get appSessionResetRunning => 'Resetování relace…';

  @override
  String get appSessionResetConfirmTitle => 'Resetovat relaci?';

  @override
  String get appSessionResetConfirmBody =>
      'Restartuje služby ResilNet na tomto zařízení. Vaše identifikační klíče jsou uloženy.';

  @override
  String get appRecoveryBusy => 'Obnova již běží…';

  @override
  String get appRecoveryOk => 'Obnova dokončena';

  @override
  String get appRecoveryPartial =>
      'Obnovení bylo dokončeno s přeskočením některých kroků – zkuste to znovu, pokud se stále zasekává';

  @override
  String get appRecoveryFailed =>
      'Obnovení se nezdařilo – zkuste reset relace nebo vynuceně ukončete aplikaci z operačního systému';

  @override
  String get localWifiTitle => 'Místní Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Propojte okolní zařízení bez internetu – stejně jako v jedné LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Ne ESP32 LoRa brána SoftAP. Toto je pouze telefon↔telefon / LAN.';

  @override
  String get localWifiUnavailable =>
      'Místní Wi‑Fi ještě není připraveno – počkejte na spuštění aplikace.';

  @override
  String get lxmfBridgeTitle => 'Domovský uzel';

  @override
  String get lxmfBridgeSubtitle =>
      'Volitelný Mac nebo Pi na vašem Wi‑Fi, který přenáší uzavřené chaty. Ve výchozím nastavení vypnuto. Nenahrazuje end-to-end šifrování.';

  @override
  String get lxmfBridgeEnable => 'Použijte domovský uzel';

  @override
  String get lxmfBridgeDisabledHint =>
      'Zapněte pouze tehdy, když aplikace bridge běží na Macu nebo Pi v této síti.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online – $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Nelze dosáhnout domovského uzlu – $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Adresa domovského uzlu';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP nebo http://IP:port — příklad 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF cíl (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Stav uložit a obnovit';

  @override
  String get lxmfBridgeLabHint => 'Pokročilé: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Nastavení domovského uzlu';

  @override
  String get lxmfBridgeCheckConnection => 'Zkontrolujte připojení';

  @override
  String get lxmfBridgeStatusOnline => 'Připojeno k domovskému uzlu';

  @override
  String get lxmfBridgeStatusOffline => 'Domovský uzel není dosažitelný';

  @override
  String get lxmfBridgeYourDest => 'Adresa tohoto uzlu (sdílet s přáteli)';

  @override
  String get lxmfBridgeCopyDest => 'Zkopírujte adresu';

  @override
  String get lxmfBridgeDestCopied => 'Adresa zkopírována';

  @override
  String get lxmfBridgeLinkedPeers => 'Propojení přátelé';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Každý přítel potřebuje adresu svého domovského uzlu jednou. Tuto cestu pak mohou používat uzavřené chaty.';

  @override
  String get lxmfBridgeNoLinks => 'Zatím nejsou připojeni žádní přátelé.';

  @override
  String get lxmfBridgeAddLink => 'Propojit přítele';

  @override
  String get lxmfBridgePickPeer => 'příteli';

  @override
  String get lxmfBridgePeerDest => 'Adresa jejich domovského uzlu';

  @override
  String get lxmfBridgePeerDestHint =>
      '32místný kód z obrazovky jejich domovského uzlu';

  @override
  String get lxmfBridgeInvalidDest =>
      'Tato adresa se nezdá platná. Vložte celý kód z jejich domovského uzlu.';

  @override
  String get lxmfBridgeRemoveLink => 'Odpojit';

  @override
  String get lxmfBridgeSaveLink => 'Uložit';

  @override
  String get lxmfBridgeLinkSaved => 'Přítel propojen';

  @override
  String get lxmfBridgeNoPeers =>
      'Zatím žádné kontakty pro zasílání zpráv – nejprve přidejte přítele.';

  @override
  String get lxmfBridgeHelp =>
      'Udržujte most spuštěný na Mac/Pi. Tato cesta zůstává ve vaší LAN – není to LoRa a nenahrazuje internet nebo Bluetooth mesh.';

  @override
  String get localWifiModeHotspot => 'Nedaleko';

  @override
  String get localWifiModeRouter => 'Směrovač';

  @override
  String get localWifiHotspotIntro =>
      'Jedno zařízení sdílí osobní hotspot. Ostatní se k tomuto hotspotu připojí a ResilNet je najde v místní síti.';

  @override
  String get localWifiHostAction => 'Vytvořit síť (hostitel)';

  @override
  String get localWifiJoinAction => 'Připojte se k síti';

  @override
  String get localWifiHostSteps =>
      '1. Otevřete Nastavení iOS/Android a zapněte Osobní hotspot (nebo Sdílení internetu).\n2. Řekněte přátelům název hotspotu (a heslo).\n3. Vraťte se sem a klepněte na „Hotspot je zapnutý – začněte čekat“.';

  @override
  String get localWifiHostReady => 'Hotspot je zapnutý – začněte čekat';

  @override
  String get localWifiHostWaiting => 'Čekání na připojení přátel…';

  @override
  String get localWifiJoinSteps =>
      '1. Otevřete Nastavení systému a připojte se k osobnímu hotspotu svého přítele.\n2. Vraťte se sem a klepněte na „Jsem připojen – hledat“.';

  @override
  String get localWifiJoinReady => 'Jsem připojen – hledejte';

  @override
  String get localWifiRouterIntro =>
      'Připojte všechna zařízení ke stejnému routeru/AP Wi‑Fi. Router nepotřebuje internet – pouze sdílenou lokální síť.';

  @override
  String get localWifiRouterSearch => 'Hledat na tomto Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Obnovit informace Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Ne na Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Připojte se k Wi‑Fi routeru v nastavení systému a poté znovu vyhledejte.';

  @override
  String get localWifiDiscovering => 'Vyhledávání na místní Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Zařízení v této síti';

  @override
  String get localWifiStop => 'Zastávka';

  @override
  String get localWifiSsidUnknown => 'Název Wi‑Fi není k dispozici';

  @override
  String get localWifiStubBanner => 'Čekání na zásuvku LAN…';

  @override
  String get localWifiLiveBanner =>
      'LAN discovery live (UDP) – oznámení + uzavřený chat na tomto Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Zatím žádná zařízení.\nZkontrolujte, zda se přátelé připojili k vašemu hotspotu a povolili přístup k místní síti.';

  @override
  String get localWifiEmptyRouter =>
      'Zatím žádná zařízení.\nStejné SSID? Povolena místní síť? Některé směrovače blokují provoz mezi zařízeními (izolace AP).';

  @override
  String get localWifiIsolationHelp => 'Proč se nemůžeme najít?';

  @override
  String get localWifiIsolationTitle => 'Router může izolovat klienty';

  @override
  String get localWifiIsolationBody =>
      'Pokud je zapnutá izolace přístupového bodu/klienta (nebo síť pro hosty), telefony na stejném Wi‑Fi nemohou mluvit. Vypněte izolaci, použijte hlavní SSID nebo přepněte do režimu Blízko (Hotspot).';

  @override
  String get localWifiPeerReady => 'Připraveno k chatování (má klíč)';

  @override
  String get localWifiPeerNeedKey => 'Nalezeno – naskenujte QR a vyměňte klíče';

  @override
  String get localWifiErrorTitle => 'Místní chyba Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Něco se pokazilo. Zastavte se a zkuste to znovu.';

  @override
  String get preparingSystem => 'Příprava systému…';

  @override
  String get bootFailedTitle => 'Nelze spustit';

  @override
  String get retry => 'Zkuste to znovu';

  @override
  String get bootRecoveryAction => 'Začít novou identitu (vymazat místní data)';

  @override
  String get bootRecoveryConfirmTitle => 'Začít novou identitu?';

  @override
  String get bootRecoveryConfirmBody =>
      'Tím trvale vymažete místní chaty, klíče a identitu na tomto zařízení.\nKolegové musí znovu naskenovat váš QR kód s vaší novou identitou.\nToto nelze vrátit zpět.';

  @override
  String get bootRecoveryRunning => 'Resetování místní identity…';

  @override
  String get bootRecoverySuccess => 'Obnovení místní identity bylo dokončeno';

  @override
  String bootRecoveryFailed(String error) {
    return 'Nelze resetovat identitu: $error';
  }

  @override
  String get cancel => 'Zrušit';

  @override
  String get save => 'Uložit';

  @override
  String get close => 'Blízko';

  @override
  String get start => 'Start';

  @override
  String get send => 'Poslat';

  @override
  String get settings => 'Nastavení';

  @override
  String get language => 'Jazyk';

  @override
  String get languageSubtitle =>
      'Ve výchozím nastavení se aplikace řídí jazykem vašeho telefonu (pokud je podporován). Ostatní jazyky se vrátí k angličtině. Zde můžete také uzamknout jazyk.';

  @override
  String get languageSystem => 'Výchozí nastavení systému';

  @override
  String get languageThai => 'thajština';

  @override
  String get languageEnglish => 'angličtina';

  @override
  String get notificationsTooltip => 'Nastavení oznámení';

  @override
  String get enableMessageNotifications => 'Povolit upozornění na zprávy';

  @override
  String get settingsNotificationsSubtitle =>
      'Zprávy 1:1 a lidé online (místní upozornění)';

  @override
  String get networkMembersTooltip => 'Členové sítě';

  @override
  String get identityQrTooltip => 'Identita / QR';

  @override
  String get feedDirects => 'Povídání';

  @override
  String get feedMesh => '#pletivo';

  @override
  String get feedGeo => 'Plocha';

  @override
  String get feedDirectsSubtitle => 'Soukromé zprávy E2EE';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'Podobní uživatelé v okolí (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Kanál pro objevování geohash';

  @override
  String get peerIdHint =>
      'Chcete-li zahájit chat, vložte ID příjemce (Public Key Hash).';

  @override
  String get directsEmpty =>
      'Zatím žádné chaty – pro začátek naskenujte QR kód nebo vložte ID příjemce\nZprávy jsou před odesláním zapečetěny pomocí E2EE (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • klepnutím otevřete chat';

  @override
  String get meshIntro =>
      'Protějšky v rozsahu BLE – klepnutím spustíte soukromý chat E2EE (žádné veřejné psaní na #mesh)\nOdesílá přes hybridní router (BLE + LoRa + Nostr, když je online)';

  @override
  String get meshEmptyRunning =>
      'Zatím žádní kolegové v okolí – otevřete aplikaci na jiném zařízení v dosahu BLE';

  @override
  String get meshEmptyStopped =>
      'BLE neběží – udělte oprávnění Bluetooth / umístění';

  @override
  String get meshNearbyPrefix => 'Nedaleko';

  @override
  String get meshRetentionTitle => 'Automatické mazání zpráv';

  @override
  String get meshRetentionSubtitle =>
      'Starší historie místního chatu se automaticky odstraní';

  @override
  String get meshRetentionKeep => 'Nechat';

  @override
  String get meshRetention1Day => '1 den';

  @override
  String get meshRetention3Days => '3 dny';

  @override
  String get meshRetention7Days => '7 dní';

  @override
  String get refreshLocationTooltip => 'Obnovit polohu';

  @override
  String get geoIntro =>
      'Lidem online v tomto geohash lze zasílat zprávy 1:1 nebo pomocí plošného veřejného fan-outu (stále zapečetěné E2EE na peer – nikoli prostý text)';

  @override
  String geoEmpty(String channel) {
    return 'V $channel zatím není nikdo online\nPoužijte Transport → Internet/Auto, počkejte na Nostr, obnovte umístění';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online v $channel • klepnutím pro 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'V blízkosti (čeká na přítomnost oblasti) • klepněte pro 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Zobrazeno na Nostr v $channel • pouze zjišťování (starší)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Starší anonymní přítomnost — počkejte na vázaného peer nebo si vyměňte QR kód';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE v okolí – naskenujte QR a začněte 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Oblast zjišťování internetu vyžaduje připojení Nostr (Nastavení → Přenos → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Poloha zatím není vyřešena – povolte GPS a aktualizujte svůj geohash na Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Oprávnění k poloze odepřeno – povolte ResilNet v Nastavení → Soukromí → Poloha';

  @override
  String get geoEmptyServicesDisabled =>
      'Polohové služby jsou vypnuté – zapněte je v Nastavení';

  @override
  String get geoEmptyNoGpsFix =>
      'Nepodařilo se získat opravu GPS (běžné na iPadech Wi‑Fi) – níže nastavte geohash ručně';

  @override
  String get geoEmptyTeleportHint =>
      'Klepněte na ikonu místa → zadejte geohash (např. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Nastavte geohash';

  @override
  String get geoTeleportHint =>
      'Bez GPS? Zadejte předponu geohash (2–7 znaků, např. w5) a klepněte na Teleport';

  @override
  String get geoTeleportInvalid =>
      'Neplatný geohash – použijte pouze písmena/čísla base32 (např. w5 nebo w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Oblast nastavena na $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Ruční oblast: $channel (obnovení GPS přepíše)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr není připraveno – klepněte na Znovu připojit (0/0, dokud nebude inicializace úspěšná)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport je pouze Mesh – přepněte na Internet nebo Auto a objevte partnery přes Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'V $channel zatím nikdo – ponechte oblast + internet otevřené na obou zařízeních a počkejte ~60s';
  }

  @override
  String get geoChannelFallback => '#plocha';

  @override
  String get geoRefreshLocation => 'Obnovit polohu';

  @override
  String get settingsClearLocationTitle => 'Jasná poloha';

  @override
  String get settingsClearLocationSubtitle =>
      'Odebrat GPS / teleport geohash (oblast se změní na #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Vymazat polohu?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Smaže uložený geohash na tomto zařízení. Poté můžete obnovit GPS nebo teleportovat.';

  @override
  String get settingsClearLocationAction => 'Jasná poloha';

  @override
  String get settingsClearLocationSnack => 'Místo vymazáno';

  @override
  String get chatVoiceTooLarge =>
      'Hlasová poznámka je příliš velká – max ~30 sekund';

  @override
  String get chatVoiceNeedInternet =>
      'Hlasová poznámka potřebuje internet (Nostr) – příliš velká pro samotnou BLE';

  @override
  String get chatVoiceSentInternet => 'Hlasová poznámka odeslaná přes internet';

  @override
  String get noticeAnonMention => 'zmínka';

  @override
  String get noticeAnonDm => 'přímou zprávu';

  @override
  String get noticeAnonHug => 'obejmout';

  @override
  String get noticeAnonSlap => 'políček';

  @override
  String get noticeAnonBlock => 'blok';

  @override
  String get noticeAnonNeedKey =>
      'Zatím žádný veřejný klíč – nejprve vyměňte QR za 1:1';

  @override
  String get noticeAnonActionSent => 'Odesláno';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Zablokováno $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*objetí $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* facky $anon *';
  }

  @override
  String get geoReconnectNostr => 'Znovu připojte Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relé';

  @override
  String get nostrSectionSubtitle =>
      'Internetové zprávy a zjišťování oblasti používají tato relé. Pokud stav zůstane offline, klepněte na znovu připojit.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Připojeno $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline — relé jsou uvedena, ale nejsou připojena';

  @override
  String get nostrStatusNotInit =>
      'Nespuštěno (0/0) – inicializaci provedete klepnutím na Znovu připojit';

  @override
  String get nostrReconnectAction => 'Znovu připojte Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr připojeno ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Stále offline – zkontrolujte Wi‑Fi/cellular nebo to zkuste znovu';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Selhalo: $error';
  }

  @override
  String get nostrReconnecting => 'Připojování k relé…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) v $channel • připravený uzavřený chat';
  }

  @override
  String get transportModeTitle => 'Oblastní doprava';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE v blízkosti (rádio), když není Nostr · Internet a Auto = Nostr seznam lidí';

  @override
  String get transportModeMesh => 'Pletivo';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint =>
      'Veřejná zpráva pro všechny online v této oblasti';

  @override
  String get geoPublicSend => 'Veřejnost';

  @override
  String geoPublicHelp(int count) {
    return 'Zapečetěný fan-out pro $count online peer(y) – každý obdrží soukromou obálku';
  }

  @override
  String geoPublicSent(int count) {
    return 'Odesláno $count kolegům v této oblasti';
  }

  @override
  String get geoPublicSentNone =>
      'Nejsou online žádní kolegové s možností zasílání zpráv – otevřete Area/Mesh s partnery, kteří mají klíče, nebo počkejte na BLE/Nostr';

  @override
  String get areaPublicBadge => 'Oblast veřejná';

  @override
  String get geoErrorPermission =>
      'Polohu nelze přečíst – zkontrolujte oprávnění k poloze';

  @override
  String get geoPrecisionRegion => 'Kraj';

  @override
  String get geoPrecisionProvince => 'Provincie';

  @override
  String get geoPrecisionCity => 'Město';

  @override
  String get geoPrecisionNeighborhood => 'Okolí';

  @override
  String get geoPrecisionBlock => 'Blok';

  @override
  String get aliasTitle => 'Nastavit přezdívku (alias kontaktu)';

  @override
  String get aliasHintBody =>
      'Tento alias je uložen pouze v tomto zařízení (pouze místní)\nNikdy se neodesílá s provozem E2EE';

  @override
  String get aliasLabel => 'Přezdívka';

  @override
  String get aliasHint => 'např. \"hlava vesnice\", \"P\'Somchai\"…';

  @override
  String get settingsDevices => 'Zařízení';

  @override
  String get settingsFirmwareTitle => 'Stáhněte / aktualizujte firmware ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Stáhněte si soubory .bin a aktualizujte desku ESP32 prostřednictvím OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic most';

  @override
  String get mtBridgeSettingsSubtitle =>
      'A/B most pouze pro text – nikoli ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Přesunout krátký prostý text mezi Meshtastic a ResilNet. Režimy A a B nemohou běžet současně. Nejedná se o end-to-end šifrování.';

  @override
  String get mtBridgeModeLabel => 'Režim';

  @override
  String get mtBridgeModeOff => 'Vypnuto';

  @override
  String get mtBridgeModeA => 'Požít A';

  @override
  String get mtBridgeModeB => 'Výjezd B';

  @override
  String get mtBridgeModeOffShort => 'Vypnuto';

  @override
  String get mtBridgeModeAShort => 'V A';

  @override
  String get mtBridgeModeBShort => 'Ven B';

  @override
  String get mtBridgeMutexHint =>
      'Výběrem režimu se druhý automaticky vypne. Simultánní A+B není podporováno.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (protokolování)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Příchozí text se zobrazí v části Oznámení jako #meshtastic. Relé síťoviny je volitelné (ve výchozím nastavení vypnuto).';

  @override
  String get mtBridgeRelayTitle => 'Také relé na ResilNet síti';

  @override
  String get mtBridgeRelayHint =>
      'Je-li zapnuto, jsou vysílány podepsané veřejné bulletiny. Vypnuto = pouze upozornění tohoto telefonu.';

  @override
  String get mtBridgeSimulateHint => 'Demo zpráva';

  @override
  String get mtBridgeSimulate => 'Simulovat zprávu Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Zpracováno do oznámení (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Upozornění: zprávy odeslané zde NEJSOU ResilNet E2EE. Kdokoli na cestě Meshtastic je může číst.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Text ke zveřejnění';

  @override
  String get mtBridgeSend => 'Poslat komu';

  @override
  String get mtBridgeEgressOk =>
      'Ve frontě pro Meshtastic (viz protokol / historii)';

  @override
  String get mtBridgeLastEgress => 'Poslední výstup';

  @override
  String get mtBridgeEgressHistory => 'Nedávný výstup';

  @override
  String get mtBridgeOffHint =>
      'Chcete-li použít most, zapněte možnost Ingest (A) nebo Egress (B).';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · ne E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Použijte transport MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Vypnuto = pouze demo protokolování (MQTT příchozí ignorováno). Zapnuto = MQTT pro příjem/výstup při připojení.';

  @override
  String get mtBridgeMqttHost => 'Hostitel makléře';

  @override
  String get mtBridgeMqttPort => 'Přístav';

  @override
  String get mtBridgeMqttTls => 'Použít TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typický port 8883. Používá systémové certifikáty; selhává při chybách handshake.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Automatické opětovné připojení';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Když je zapnuto, klient se pokusí znovu připojit po poklesu. Stav zobrazuje Připojování až do obnovení.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Pomocníci k tématu';

  @override
  String get mtBridgeMqttRegion => 'Předpona regionu (volitelné)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Když je nastaveno, Apply znovu sestaví kořen jako msh/<region>/2/json (přepíše kořen tématu).';

  @override
  String get mtBridgeMqttTopicRoot => 'Kořen tématu JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Název kanálu pro stahování';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Použít root → přihlásit / publikovat témata';

  @override
  String get mtBridgeMqttAdvanced => 'Pokročilé MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, opětovné připojení, témata, přihlašovací údaje';

  @override
  String get mtBridgeMqttTopicIn => 'Odebírat téma';

  @override
  String get mtBridgeMqttTopicOut => 'Zveřejnit téma';

  @override
  String get mtBridgeMqttGatewayFrom => 'ID uzlu brány (od)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Desetinné id nebo !hex – vyžadováno pro sestupný odkaz pro odesílání textu';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Index síťového kanálu (volitelně 0–7)';

  @override
  String get mtBridgeMqttUser => 'uživatelské jméno (volitelné)';

  @override
  String get mtBridgeMqttPass => 'Heslo (volitelné)';

  @override
  String get mtBridgeMqttPassStored =>
      'V tomto zařízení je uloženo heslo (nezobrazeno).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nové heslo (pro zachování ponechte prázdné)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Nechte prázdné, chcete-li zachovat uložené heslo.';

  @override
  String get mtBridgeMqttPassClear => 'Vymazat heslo';

  @override
  String get mtBridgeMqttSave => 'Uložte nastavení MQTT';

  @override
  String get mtBridgeMqttSaved => 'Nastavení MQTT uloženo';

  @override
  String get mtBridgeMqttConnect => 'Připojit';

  @override
  String get mtBridgeMqttDisconnect => 'Odpojit';

  @override
  String get mtBridgeMqttConnected => 'MQTT připojeno';

  @override
  String get mtBridgeMqttConnecting => 'MQTT připojování…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT odpojeno';

  @override
  String get mtBridgeMqttError => 'MQTT chyba';

  @override
  String get mtBridgeErrModeIngest => 'Nejprve přepněte na Ingest (A).';

  @override
  String get mtBridgeErrModeEgress => 'Nejprve přepněte na Egress (B).';

  @override
  String get mtBridgeErrRate => 'Zpomalte – rychlost omezena';

  @override
  String get mtBridgeErrDedupe => 'Duplicitní zpráva byla ignorována';

  @override
  String get mtBridgeErrLoop => 'Spadl, aby se zabránilo smyčce mostu';

  @override
  String get mtBridgeErrEmpty => 'Zpráva je prázdná';

  @override
  String get mtBridgeErrPublish => 'Publikování se nezdařilo';

  @override
  String get mtBridgeErrNotConnected => 'MQTT není připojeno';

  @override
  String get mtBridgeErrMissingHost =>
      'Zadejte hostitele zprostředkovatele MQTT';

  @override
  String get mtBridgeErrMissingTopic => 'Zadejte odběr a publikujte témata';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Zadejte ID uzlu brány (od) pro sendtext';

  @override
  String get mtBridgeErrConnect => 'Připojení MQTT se nezdařilo';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Připojení TLS se nezdařilo';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Odstraňte místní zprávy, aby se databáze zmenšila – identita, klíče a partnery zůstanou zachovány';

  @override
  String get settingsSaveHistoryTitle => 'Uložit historii zpráv';

  @override
  String get settingsSaveHistorySubtitle =>
      'Když je vypnuto, zprávy zůstávají E2EE na drátě a jsou uchovávány pouze pro tuto relaci (nikoli v historii místního chatu). Váš vlastní text se na tomto zařízení stále zobrazuje jako prostý text.';

  @override
  String get settingsPrivacy => 'Soukromí';

  @override
  String get settingsE2eeTitle => 'End-to-end šifrování';

  @override
  String get settingsE2eeSubtitle =>
      'Vždy zapnuto — zprávy jsou před odesláním zapečetěny pomocí RSA-OAEP + AES-GCM. Relé a blízké skoky nemohou číst obsah.';

  @override
  String get settingsScreenshotTitle => 'Upozornění na snímky obrazovky';

  @override
  String get settingsScreenshotSubtitle =>
      'Když toto zařízení zachytí obrazovku, zobrazit v chatu systémový řádek';

  @override
  String get settingsNostrExpiryTitle => 'Nostr doba uchování zprávy';

  @override
  String get settingsNostrExpirySubtitle =>
      'Jak dlouho by měly zalepené obálky zůstat lokálně, když jsou online přes Nostr';

  @override
  String get noticeExpiresIn => 'vyprší v';

  @override
  String get noticesTitle => 'Oznámení';

  @override
  String get noticesMeshIntro =>
      'Veřejný bulletin — viditelný pro všechny v dosahu rádia, nešifrovaný. Přeskakuje mezi telefony offline a blízké přenosové boxy ResilNet uchovávají kopii, takže lidé, kteří dorazí později, ji stále vidí.';

  @override
  String get noticesMeshPublicBadge => 'VEŘEJNÉ · nešifrováno';

  @override
  String get noticesGeoIntro =>
      'Přidejte krátké poznámky k tomuto místu, aby je mohli najít ostatní návštěvníci.';

  @override
  String get noticesEmpty => 'zatím žádná upozornění';

  @override
  String get noticesEmptyHint => 'připnout první upozornění pro lidi tady.';

  @override
  String get noticesComposeHint => 'zveřejnit oznámení...';

  @override
  String get noticesUrgent => 'naléhavé';

  @override
  String get noticesOpen => 'Oznámení';

  @override
  String get screenshotTaken => '*udělal jsi snímek obrazovky*';

  @override
  String get chatAttachImage => 'Připojit obrázek';

  @override
  String get chatImageLabel => 'Obraz';

  @override
  String get chatImageTooLarge =>
      'Obrázek je příliš velký – zkuste jinou fotografii';

  @override
  String get chatNostrExpiry => 'Nostr zachovat';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Odeslat na $channel – veřejné';
  }

  @override
  String get settingsClearTitle => 'Vymazat všechny zprávy';

  @override
  String get settingsClearSubtitle => 'Smazat všechny chaty na tomto zařízení';

  @override
  String get settingsClearConfirmTitle => 'Vymazat všechny zprávy?';

  @override
  String get settingsClearConfirmBody =>
      'Tím se smažou všechny chatové zprávy na tomto zařízení.\nPeers a přezdívky nejsou odstraněny.';

  @override
  String get settingsClearAction => 'Vymazat data';

  @override
  String get settingsClearedSnack => 'Data vymazána';

  @override
  String settingsVersion(String version) {
    return 'verze $version';
  }

  @override
  String get meshBleScanning => 'BLE: vyhledávání uzlů';

  @override
  String get meshBleEsp32Scanning => 'ESP32: hledá blízký uzel';

  @override
  String get meshBleSyncing => 'BLE: synchronizace s ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publikování';

  @override
  String get meshBleIdle => 'BLE mesh zapnuto – zatím žádné telefony v okolí';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count telefonů v okolí';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: vyžadováno oprávnění';

  @override
  String get meshBlePausedCamera =>
      'BLE pozastaveno pro kameru – klepněte na Start BLE';

  @override
  String get meshBleStopped =>
      'BLE je vypnuto – zkontrolujte, zda je Bluetooth zapnuto, a potom klepněte na Start BLE';

  @override
  String get meshBleRestart => 'Start BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Zkontrolujte oprávnění a spusťte BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count vrstevníci v okolí • LoRa $lora • synchronizace ~${meters}m';
  }

  @override
  String get meshLoraReady => 'připraven';

  @override
  String get meshLoraNotReady => 'není připraven';

  @override
  String meshGatewayProgress(String label) {
    return 'UDP brány: $label';
  }

  @override
  String get meshGatewayReady => 'Brána UDP: připravena';

  @override
  String get permissionTitle => 'Povolte přístup ke spuštění sítě BLE mesh';

  @override
  String get permissionBody =>
      'Aplikace potřebuje Bluetooth (skenovat / připojit / inzerovat), polohu (pro starší zařízení Android) a mikrofon (pro hlasové poznámky v chatu a oznámení) pro komunitní zprávy.';

  @override
  String get permissionE2ee =>
      'End-to-End šifrování (E2EE)\nReléové uzly nemohou číst obsah zprávy';

  @override
  String get permissionReady => 'Oprávnění připravena';

  @override
  String get permissionRequest => 'Povolit a pokračovat';

  @override
  String get permissionNotReadySnack =>
      'Systém ještě není připraven – chvíli počkejte a zkuste to znovu';

  @override
  String get permissionDeniedSnack =>
      'Oprávnění nejsou úplná – otevřete Nastavení > ResilNet a povolte Bluetooth / Umístění / Mikrofon';

  @override
  String get permissionMicDenied =>
      'Přístup k mikrofonu odepřen – povolte mu v Nastavení nahrávat hlasové poznámky';

  @override
  String get permissionMicOpenSettings => 'Nastavení';

  @override
  String get permissionCameraDenied =>
      'Přístup k fotoaparátu odepřen – v Nastavení povolte skenování QR kódů';

  @override
  String get permissionCameraFailed =>
      'Ke skenování QR kódů je potřeba povolení fotoaparátu';

  @override
  String get permissionCameraOpenSettings => 'Nastavení';

  @override
  String get permissionPhotosDenied =>
      'Přístup do knihovny fotografií odepřen – povolte v Nastavení uložit váš QR kód';

  @override
  String get permissionPhotosFailed =>
      'K uložení vašeho QR kódu je vyžadováno povolení knihovny fotografií';

  @override
  String get permissionPhotosOpenSettings => 'Nastavení';

  @override
  String permissionFailedSnack(String error) {
    return 'Žádost o oprávnění se nezdařila: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architektura • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'Přeskočit';

  @override
  String get onboardingNext => 'Další';

  @override
  String get onboardingStart => 'Začněte';

  @override
  String get onboardingWelcomeTitle => 'Vítejte v ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chatujte na ResilNet přes síť typu mesh – i bez internetu';

  @override
  String get onboardingFriendsTitle => 'Přidat přátele snadno';

  @override
  String get onboardingFriendsBody =>
      'Sdílejte QR z Identity nebo naskenujte QR přítele a vyměňte si veřejné klíče';

  @override
  String get onboardingChannelsTitle => 'Šifrovaný chat + blízké kanály';

  @override
  String get onboardingChannelsBody =>
      'Přepnutím #mesh / Area (geohash) najdete blízké partnery – zprávy zůstávají E2EE přes BLE mesh a Nostr';

  @override
  String get chatTitle => 'Chat (E2EE)';

  @override
  String get chatScanTooltip => 'Naskenujte QR a přidejte partnera';

  @override
  String get chatBlockTooltip => 'Blokovat tohoto odesílatele';

  @override
  String get chatBlockedSnack => 'Blokováno: žádná upozornění / žádné relé';

  @override
  String get chatAliasTooltip => 'Nastavit přezdívku';

  @override
  String get chatReceiverPemLabel => 'Veřejný klíč příjemce (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Vložte veřejný klíč svého přítele (z QR / sdíleného souboru)';

  @override
  String get chatNeedPeerKey =>
      'Nejprve naskenujte QR tohoto partnera (vyžaduje se ověřený veřejný klíč)';

  @override
  String get chatPeerKeyMismatch =>
      'Uložený veřejný klíč neodpovídá tomuto peer id';

  @override
  String chatVoiceFailed(String error) {
    return 'Nelze nahrávat zvuk: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Nelze přehrát hlasovou poznámku: $error';
  }

  @override
  String get chatPlayVoice => 'Přehrát hlasovou poznámku';

  @override
  String get chatPauseVoice => 'Pauza';

  @override
  String get chatVoiceLabelSent => '🎤 Hlasová poznámka (zapečetěná)';

  @override
  String get chatVoiceLabel => '🎤 Hlasová poznámka';

  @override
  String get chatDecryptFailed => '[dešifrování se nezdařilo]';

  @override
  String chatSentSealed(String preview) {
    return '[zapečetěno • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[zapečetěno]';

  @override
  String get chatComposeHint => 'Napište zprávu… (zapečetěno při odeslání)';

  @override
  String get chatEmptyThread =>
      'Zatím žádné zprávy\nChcete-li odeslat přes síť, zadejte níže';

  @override
  String chatLoadFailed(String error) {
    return 'Nelze načíst konverzaci: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Čeká na vyřízení';

  @override
  String get statusSent => 'Odesláno';

  @override
  String get statusRelayed => 'Relé';

  @override
  String get statusDelivered => 'Doručeno';

  @override
  String get statusRead => 'Číst';

  @override
  String get statusFailed => 'Nepodařilo se';

  @override
  String get chatCopy => 'Kopie';

  @override
  String get chatDeleteLocal => 'Smazat zařízení?';

  @override
  String get chatDeletedLocalSnack => 'Smazáno na tomto zařízení';

  @override
  String get chatRetry => 'Zkuste to znovu';

  @override
  String get chatSendFailed => 'Nedoručeno – klepněte na Opakovat';

  @override
  String get chatImageNeedInternet =>
      'Chcete-li odeslat obrázky, připojte se k internetu';

  @override
  String get chatImageTooLargeOnline =>
      'Obrázek se nepodařilo dostatečně zkomprimovat k odeslání';

  @override
  String get chatOpenLinkFailed => 'Odkaz nelze otevřít';

  @override
  String get identityTitle => 'Identita';

  @override
  String get identityScanTooltip => 'Naskenujte QR kód pomocí fotoaparátu';

  @override
  String get identityCopiedHash => 'Hash veřejného klíče zkopírován';

  @override
  String get identityPeerSaved => 'Partner byl uložen z QR kódu';

  @override
  String get identityGalleryDenied => 'Povolení knihovny fotografií odepřeno';

  @override
  String get identityQrSaved => 'QR kód uložen do knihovny fotografií';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR se nepodařilo uložit: $error';
  }

  @override
  String get peersTitle => 'Členové sítě';

  @override
  String get qrScanTitle => 'Naskenujte QR a přidejte přítele';

  @override
  String get qrInvalid => 'Skenování se nezdařilo: neplatný QR kód';

  @override
  String get qrIdKeyMismatch => 'QR zamítnuto: id neodpovídá veřejnému klíči';

  @override
  String get qrCameraNotReady => 'Kamera není připravena';

  @override
  String get qrRetrySettings => 'Zkuste to znovu / otevřete Nastavení';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Fotoaparát nelze otevřít: $error';
  }

  @override
  String get qrScanAlignHint => 'Zarovnejte QR kód uvnitř rámečku';

  @override
  String get firmwareDownloadTitle => 'Stáhněte si firmware ESP32';

  @override
  String get firmwareSourceOnline => 'Nejnovější (online)';

  @override
  String get firmwareSourceCached => 'Uložená kopie (offline)';

  @override
  String get firmwareSourceBaseline => 'Seskupený základ (offline)';

  @override
  String get firmwareSourceUnavailable => 'Není k dispozici žádný firmware';

  @override
  String get firmwareBaselineIncompatible =>
      'Přiložený firmware je příliš starý – připojte se k internetu a stáhněte si novější verzi';

  @override
  String get firmwareChecksumFailed =>
      'Selhala kontrola integrity firmwaru – blikání je zablokováno';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware připraven: $source';
  }

  @override
  String get peersRefreshTooltip => 'Obnovit';

  @override
  String get peersBlocked => 'Blokováno';

  @override
  String peersNearbyBle(Object ble) {
    return 'V blízkosti (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'Nedávno online';

  @override
  String get peersOnlineInArea => 'Online v oblasti';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Viděno před $minutes min';
  }

  @override
  String get peersOffline => 'Offline';

  @override
  String peersBlockedSnack(String id) {
    return 'Zablokováno $id';
  }

  @override
  String get peersUnblockedSnack => 'Odblokováno';

  @override
  String get peersEmpty =>
      'V databázi zatím nejsou žádní členové\nNaskenujte QR kód nebo počkejte na nalezení BLE mesh';

  @override
  String get peersOpenChat => 'Otevřít chat';

  @override
  String get peersBlockAction => 'Blok';

  @override
  String get peersUnblockAction => 'Odblokovat';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Oblast';

  @override
  String get locationPickerTooltip => 'Kanál umístění';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Lidé online';

  @override
  String get unreadDirectsTooltipEmpty => 'Soukromé zprávy';

  @override
  String unreadDirectsTooltip(int count) {
    return 'Nepřečtené soukromé zprávy: $count';
  }

  @override
  String get onlinePeopleTitle => 'lidé';

  @override
  String get onlinePeopleEmpty => 'Zatím tu není nikdo online';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · okolí + oblast';

  @override
  String get peerOnlineMeshTitle => 'Někdo poblíž na pletivu';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name je poblíž v síti';
  }

  @override
  String get peerOnlineAreaTitle => 'Někdo online v oblasti';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name je online prostřednictvím Nostr';
  }

  @override
  String get locationSheetTitle => '#location kanály';

  @override
  String get channelPinsTitle => 'Připnuto';

  @override
  String get channelPinsHint =>
      'Připněte kanály, které často používáte – zůstávají nahoře';

  @override
  String get channelPinTooltip => 'Připnout tento kanál';

  @override
  String get channelUnpinTooltip => 'Odepnout';

  @override
  String get locationSheetIntro =>
      'Chatujte s lidmi v okolí pomocí hrubého geohash – ne přesné GPS. Presence on Internet používá anonymní klíče Nostr.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportovat se';

  @override
  String homeComposeHint(String channel) {
    return 'Zpráva $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Odeslat $channel — veřejné';
  }

  @override
  String get messageExpiryTitle => 'vyprší v';

  @override
  String get voiceRecordTapToStart => 'Klepnutím nahrajete hlasovou zprávu';

  @override
  String get voiceRecordTooShort =>
      'Nahrávání je příliš krátké – zkuste to znovu';

  @override
  String get voiceRecordFailed =>
      'Záznam se nepodařilo uložit – zkuste to znovu';

  @override
  String get voicePttHold => 'Podržením zaznamenáte';

  @override
  String get voicePttRelease => 'Uvolněním zobrazíte náhled';

  @override
  String get voicePttRecording => 'Záznam…';

  @override
  String get voicePttDraftReady => 'Hlasová poznámka připravena';

  @override
  String get voicePttDiscard => 'Vyřadit';

  @override
  String get voicePttReRecord => 'Nahrajte znovu';

  @override
  String get voicePttSend => 'Odeslat hlasovou poznámku';

  @override
  String get voicePttPlayPreview => 'Přehrát náhled';

  @override
  String get voicePttStopPreview => 'Zastavit náhled';

  @override
  String get noticesBackfilling => 'Načítání oznámení…';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline =>
      'Nostr offline – bulletin potřebuje internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Načteno $count oznámení';
  }

  @override
  String get noticePublishFailed =>
      'Nelze zveřejnit oznámení na nástěnce oblasti. Zkontrolujte připojení Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Uloženo lokálně. Připojte se k blízkému mesh rádiu (nebo bráně Wi‑Fi), aby je ostatní mohli přijímat.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletin byl odeslán do $count zařízení v okolí přes BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Byly nalezeny blízké rádia, ale zápis BLE selhal. Ponechte obě aplikace otevřené na obrazovce Oznámení a zkuste to znovu (nebo použijte relé ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Přijímač BLE tohoto zařízení není připraven. Přepněte Bluetooth a znovu otevřete Oznámení.';

  @override
  String get noticeDelete => 'Smazat upozornění';

  @override
  String get noticeDeleteConfirmTitle => 'Smazat toto oznámení?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Tím se odstraní pouze na tomto zařízení. Ostatní, kteří ji již obdrželi, ji stále uvidí.';

  @override
  String get noticeDeleted => 'Oznámení smazáno';

  @override
  String get chatNoticeHidden => 'Oznámení oblasti — otevřete Oznámení';

  @override
  String get identityDisplayNameTitle => 'Zobrazovaný název';

  @override
  String get identitySaveName => 'Uložit jméno';

  @override
  String get identityUserIdLabel => 'ID uživatele (Public Key Hash)';

  @override
  String get identityCopyHashTooltip => 'Zkopírujte hash veřejného klíče';

  @override
  String get identityMyQrTitle => 'Můj QR kód (id + pubKey + jméno)';

  @override
  String identityQrFailed(String error) {
    return 'QR se nepodařilo vytvořit\n$error';
  }

  @override
  String get identitySaving => 'Ukládání…';

  @override
  String get identitySaveQr => 'Uložit QR kód do knihovny fotografií';

  @override
  String get identityOpenScanner => 'Otevřete fotoaparát a naskenujte QR kód';

  @override
  String get identityQrHelp =>
      'Požádejte přítele, aby toto naskenoval, aby si uložil váš veřejný klíč a (v případě potřeby) vás nastavil jako ověřeného vydavatele';

  @override
  String get identityChatTip =>
      'Tip: Můžete také naskenovat QR v chatu a přidat veřejný klíč pro E2EE';

  @override
  String get infoOpen => 'O / Informace';

  @override
  String get docsGuideTitle => 'Uživatelská příručka';

  @override
  String get docsGuideSubtitle => 'Otevře se v prohlížeči';

  @override
  String get docsOpenAction => 'Otevřete průvodce';

  @override
  String get docsOpenFailed => 'Uživatelskou příručku nelze otevřít';

  @override
  String get firmwareOtaGuideTitle => 'Flash průvodce a OTA protokol';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Otevře webovou příručku – stahování .bin a úplné kroky';

  @override
  String get firmwareWebDownloadsTitle => 'Firmware ke stažení na webu';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Odkazy na verzi a kontrolní součty na webu dokumentů';

  @override
  String get inviteCopyShortLink => 'Zkopírujte krátký odkaz';

  @override
  String get inviteShareLink => 'Sdílejte odkaz';

  @override
  String get inviteShowFullLink => 'Celý odkaz';

  @override
  String get inviteCopyFullLink => 'Zkopírujte celý odkaz';

  @override
  String get inviteLinkCopied => 'Odkaz zkopírován';

  @override
  String get inviteLongPressHint => 'Dlouhým stisknutím spustíte akce odkazu';

  @override
  String get inviteSendInChat => 'Odeslat v ResilNet chatu…';

  @override
  String get inviteSendInChatHint =>
      'Pouze lidé, pro které již máte veřejný klíč';

  @override
  String get inviteSendInChatEmpty =>
      'Zatím žádné chaty s možností zasílání zpráv.\nNejprve naskenujte QR, otevřete Area/Mesh nebo sdílejte odkaz mimo aplikaci.';

  @override
  String get inviteSentToChat => 'Pozvánka odeslána v chatu';

  @override
  String get infoTabInfo => 'Info';

  @override
  String get infoTabSettingsHint =>
      'Otevřete Nastavení z nabídky pro jazyk, E2EE a datové nástroje';

  @override
  String get infoHowToTitle => 'Jak používat';

  @override
  String get infoHowToBody =>
      '• Klepnutím na ikonu kanálu přepnete Chat / #mesh / Oblast\n• Klepnutím na místo vyberte velikost geohash\n• Klepněte na lidi pro členy nebo lidi, kteří jsou online\n• Otevřete Identitu/QR od ⋮ a vyměňte si klíče osobně\n• Oblast „veřejnost“ odešle zapečetěné E2EE každému online partnerovi – ne místnost s prostým textem';

  @override
  String get infoFeaturesTitle => 'Vlastnosti';

  @override
  String get infoFeatureOffline =>
      'Offline zasílání zpráv přes Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'End-to-end šifrování s RSA-OAEP + AES-GCM (nikoli Noise)';

  @override
  String get infoFeatureMultihop =>
      'Zprávy mohou přeskakovat přes blízké kolegy a jít dále';

  @override
  String get infoFeatureBridge =>
      'Hybridní síť ↔ internet (Nostr) pro zatavené obálky';

  @override
  String get infoFeatureGeo =>
      'Místní geohash kanály pro lidi v okolí (objevování UX)';

  @override
  String get infoFeatureNotices =>
      'Oznámení s vypršením platnosti pro #mesh a oblast';

  @override
  String get infoPrivacyTitle => 'Soukromí';

  @override
  String get infoPrivacyNoRoom =>
      'Žádná vesnice v otevřeném textu / veřejná chatovací místnost na drátě';

  @override
  String get infoPrivacyFanout =>
      'Oblast odesílání = zapečetěná 1:1 fan-out pro partnery se známými veřejnými klíči';

  @override
  String get infoPrivacyPresence =>
      'Přítomnost v internetové oblasti používá dočasné klíče Nostr';

  @override
  String get infoSymbolsTitle => 'Symboly';

  @override
  String get infoSymBle => 'Přímé spojení Bluetooth';

  @override
  String get infoSymMesh => 'Dosažitelné přes síť (ostatní vpřed)';

  @override
  String get infoSymInternet => 'Přes internet (Nostr) — zalepené obálky';

  @override
  String get infoSymBridge => 'Dorazil přes síť↔internetový most';

  @override
  String get infoSymOffline => 'Offline – momentálně nedostupný';

  @override
  String get infoSymInArea => 'V oblasti tohoto kanálu umístění';

  @override
  String get infoSymE2eeOk => 'End-to-end šifrovaná relace';

  @override
  String get infoSymE2eeFail =>
      'Šifrování není k dispozici – neposílejte citlivý text';

  @override
  String get infoSymVerified => 'Identita ověřena / známý klíč';

  @override
  String get infoSymBlocked => 'Blokováno';

  @override
  String get infoSymUnread => 'Nepřečtená soukromá zpráva';

  @override
  String get infoEmergencyTitle => 'Nouzový režim';

  @override
  String get infoEmergencyBody =>
      'Trojitým klepnutím na název ResilNet na domovské obrazovce vymažete zprávy, klíče a identitu na tomto zařízení.';

  @override
  String get infoLegendNote =>
      'Některé ikony cesty jsou zde pro přehlednost zdokumentovány; zaškrtnutí doručení v chatu zůstává primárním stavem odeslání.';

  @override
  String get dangerZoneTitle => 'Nebezpečná zóna';

  @override
  String get dangerZoneSubtitle =>
      'Smaže zprávy, šifrovací klíče, identitu Nostr, partnery a přezdívky na tomto zařízení. Budete znovu nastavovat.';

  @override
  String get panicWipeTitle => 'Nouzové utírání';

  @override
  String get panicWipeSubtitle =>
      'Vymazat vše místní – stejně jako trojité klepnutí na domovský titul (dvojité klepnutí obnoví rádia)';

  @override
  String get panicWipeConfirmTitle => 'Vymazat všechna místní data?';

  @override
  String get panicWipeConfirmBody =>
      'Tím trvale smažete chaty, klíče a identitu v tomto telefonu.\nPartneři si musí znovu vyměnit QR klíče s vaší novou identitou.\nToto nelze vrátit zpět.';

  @override
  String get panicWipeAction => 'Všechno setřete';

  @override
  String get panicWipeSnack => 'Místní identita byla vymazána – znovu nastavte';

  @override
  String panicWipeFailed(String error) {
    return 'Vymazání se nezdařilo: $error';
  }

  @override
  String get meshBridgeTitle => 'Síťovaný most';

  @override
  String get meshBridgeSubtitle =>
      'Když je zapnuto (výchozí), zapečetěné obálky mohou používat jak síť BLE, tak internet (Nostr), aby se mohly propojit blízké ostrůvky sítě. Když je vypnuto, odesílání používá pouze jednu cestu – nikdy nevkládá prostý text na drát.';

  @override
  String get favoritesTitle => 'Oblíbené';

  @override
  String get favoritesAdd => 'Přidat k oblíbeným';

  @override
  String get favoritesRemove => 'Odebrat z oblíbených';

  @override
  String get favoritesEmpty =>
      'Zatím žádné oblíbené — hvězdičkou označte kolegu ze seznamu členů';

  @override
  String get favoritesNearbyTitle => 'Oblíbené v okolí';

  @override
  String favoritesNearbyBody(String name) {
    return '$name je poblíž v síti';
  }

  @override
  String get favoritesInAreaTitle => 'Oblíbené v oblasti';

  @override
  String favoritesInAreaBody(String name) {
    return '$name je v této oblasti online';
  }

  @override
  String get topologyTitle => 'Topologie sítě';

  @override
  String get topologySubtitle =>
      'Oznámení vrstevníků a tipů na připojení ze sítě (pouze pro čtení)';

  @override
  String get topologyConnectedNow => 'Nyní připojeno (BLE)';

  @override
  String get topologyNearby => 'V blízkosti (BLE)';

  @override
  String get topologyKnown => 'Známí vrstevníci';

  @override
  String get topologyEmpty =>
      'Zatím se nenaučili žádní kolegové – zůstaňte poblíž se zapnutým BLE';

  @override
  String get topologyYou => 'Vy';

  @override
  String topologyStats(int peers, int links) {
    return '$peers peers · $links odkazy';
  }

  @override
  String get topologyGraphHint =>
      'Odhadováno z blízkého zjišťování sítě – vaše zařízení je zvýrazněno. Klepnutím na partnera otevřete chat.';

  @override
  String get topologyOpen => 'Topologie sítě';

  @override
  String get slashHelpTitle => 'Příkazy';

  @override
  String get slashHelpBody =>
      '/help — tento seznam\n/who — lidé online v aktuálním kanálu\n/drop <text> — sem připněte zapečetěné upozornění (rozvětvení E2EE)\n\nKompletní průvodce: použijte Otevřít průvodce níže nebo Nastavení → Uživatelská příručka.';

  @override
  String get slashWhoEmpty => 'Na tomto kanálu momentálně není nikdo online';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Použití: /drop text poznámky';

  @override
  String slashDropDone(String channel) {
    return 'Vypuštěno upozornění na $channel';
  }

  @override
  String get slashUnknown => 'Neznámý příkaz — zkuste /help';

  @override
  String get announceOpen => 'Oznámení';

  @override
  String get announceTitle => 'Oznámení';

  @override
  String get announceEmpty =>
      'Zatím žádné nástěnky – vytvořte si jednu, abyste mohli zveřejňovat zamčená nebo otevřená oznámení';

  @override
  String get announceCreate => 'Vytvořte desku';

  @override
  String get announceCreateHint => 'Název desky';

  @override
  String get announceDefaultTitle => 'Obecní rada';

  @override
  String get announceSettings => 'Nastavení desky';

  @override
  String get announceAllowLocked => 'Povolit uzamčené (šifrované) příspěvky';

  @override
  String get announceAllowLockedSub =>
      'Zašifrováno na klíč desky – čtenáři potřebují přístup';

  @override
  String get announceAllowOpen => 'Povolit otevřené (prostý text) příspěvky';

  @override
  String get announceAllowOpenSub =>
      'Není E2EE – čitelné na mesh/relé. Ve výchozím nastavení vypnuto.';

  @override
  String get announceComposeHint => 'Napište oznámení…';

  @override
  String get announceMediaInternetOnly =>
      'Foto/hlasová oznámení zasílaná přes internet (ne BLE)';

  @override
  String get announceNeedInternet =>
      'Připojte se k internetu a posílejte fotografie nebo hlasová oznámení';

  @override
  String announceVoiceFailed(String error) {
    return 'Hlas nelze nahrát: $error';
  }

  @override
  String get announceImageTooLarge => 'Obrázek je příliš velký (max ~180 kB)';

  @override
  String get announcePlayVoice => 'Přehrát hlasovou poznámku';

  @override
  String get announceImageLabel => '📷 Obrázek';

  @override
  String get announceAudioLabel => '🎤 Hlasová poznámka';

  @override
  String get announceModeLocked => 'Zamčeno';

  @override
  String get announceModeOpen => 'OTEVŘENO';

  @override
  String get announceOpenBadge => 'OPEN · nešifrováno';

  @override
  String get announceLockedBadge => 'Zamčeno';

  @override
  String get announceLockedPlaceholder =>
      'Šifrováno — vyžaduje přístup ke čtení';

  @override
  String get announceRequestAccess => 'Požádejte o přístup';

  @override
  String get announceRequestSent =>
      'Žádost o přístup byla odeslána vlastníkovi desky';

  @override
  String get announceRequestFailed =>
      'Nelze požádat o přístup (potřebuje veřejný klíč vlastníka)';

  @override
  String get announceOpenConfirmTitle => 'Odeslat bez šifrování?';

  @override
  String get announceOpenConfirmBody =>
      'Otevřené příspěvky nejsou E2EE. Kdokoli na cestě (síť / relé) je může číst. Pokračovat?';

  @override
  String get announcePostAction => 'Zveřejnit';

  @override
  String get announcePendingRequests => 'Žádosti o přístup';

  @override
  String get announceApprove => 'Schvalovat';

  @override
  String get announceDeny => 'Odmítnout';

  @override
  String get announceGranted =>
      'Na této nástěnce můžete číst zamčené příspěvky';

  @override
  String get announceOwner => 'Vlastníte tuto desku';

  @override
  String get announceCopyInvite => 'Zkopírujte text pozvánky';

  @override
  String get announceShowInviteQr => 'Zobrazit QR pozvánku';

  @override
  String get announceScanInviteQr => 'Naskenujte QR pozvánku na panel';

  @override
  String get announceFollow => 'Sledujte nástěnku z pozvánky';

  @override
  String get announceFollowHint =>
      'Vložte text pozvánky nebo odkaz ResilNet od vlastníka';

  @override
  String get announceFollowOk => 'Následující deska';

  @override
  String announceFollowOkNamed(String title) {
    return 'Nyní sledujete „$title“';
  }

  @override
  String get announceFollowFail => 'Pozvánka je neplatná nebo poškozená';

  @override
  String get announceInviteCopied => 'Text pozvánky byl zkopírován';

  @override
  String get announceInviteSaveQr => 'Uložit QR';

  @override
  String get announceInviteShare => 'Sdílejte pozvánku';

  @override
  String get announceFollowFromCompose =>
      'Ve schránce se zprávou bylo zjištěno pozvání do fóra';

  @override
  String get peerConfirmAddTitle => 'Přidat člena sítě?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Přidat „$name“ s jejich veřejným klíčem, abyste jim mohli poslat soukromou zprávu?';
  }

  @override
  String get peerConfirmAdd => 'Přidat člena';

  @override
  String peerAddedOk(String name) {
    return 'Přidáno $name ke členům sítě';
  }

  @override
  String get peerAddFromCompose =>
      'Ve schránce se zprávou byla zjištěna identita / veřejný klíč';

  @override
  String get peerHashCopied => 'Hash veřejného klíče zkopírován';

  @override
  String get peerHashOpenChat => 'Otevřít chat';

  @override
  String get peerHashAddHint =>
      'Hash zkopírován. Požádejte je, aby sdíleli svůj identifikační odkaz nebo QR, abyste mohli přidat úplný veřejný klíč pro E2EE.';

  @override
  String get peerQrNoCode =>
      'Na tomto obrázku nebyl nalezen žádný QR kód ResilNet';

  @override
  String identityInviteSharePreamble(String name) {
    return 'Identita ResilNet: „$name“\nOtevřete odkaz nebo jej vložte do chatu → Přidat člena\nNebo naskenujte QR identitu.';
  }

  @override
  String get identityShareInvite => 'Sdílet odkaz na identitu';

  @override
  String get identityInviteCopied => 'Odkaz na identitu zkopírován';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Pozvánka do představenstva: „$title“\nOtevřete ResilNet → Nástěnky komunity → Postupujte podle pozvánky\nNebo naskenujte QR / klepněte na odkaz níže.';
  }

  @override
  String get announceConfirmFollowTitle => 'Sledovat tuto nástěnku?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Sledovat „$title“ z této pozvánky?';
  }

  @override
  String get announceConfirmFollow => 'Následovat';
}

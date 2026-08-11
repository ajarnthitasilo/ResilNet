// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Odświeżanie ResilNet…';

  @override
  String get appRefreshed =>
      'Odświeżono — ponownie uruchomiono radia i wykrywanie';

  @override
  String appRefreshFailed(String error) {
    return 'Odświeżanie nie powiodło się: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Dwukrotne dotknięcie = miękkie odświeżenie. Długie naciśnięcie = trudne odzyskanie. Trzykrotne dotknięcie = wyczyszczenie awaryjne.';

  @override
  String get softRefreshTipTitle => 'Jeśli ResilNet czuje, że utknął';

  @override
  String get softRefreshTipBody =>
      'Kliknij dwukrotnie ResilNet (w lewym górnym rogu), aby delikatnie odświeżyć radio. Jeśli nadal się zacina: naciśnij i przytrzymaj tytuł, użyj ⋮ → Twarde odzyskiwanie lub Ustawienia. Potrójne dotknięcie służy tylko do awaryjnego wyczyszczenia.';

  @override
  String get softRefreshTipGotIt => 'Rozumiem';

  @override
  String get infoSoftRefreshTitle => 'Jeśli aplikacja utknęła';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Kliknij dwukrotnie ResilNet (w lewym górnym rogu) → miękkie odświeżanie radia i osób w pobliżu';

  @override
  String get infoSoftRefreshStepHard =>
      'Nadal utknąłeś? Naciśnij długo tytuł lub ⋮ / Ustawienia → Twarde odzyskiwanie';

  @override
  String get infoSoftRefreshStepWait =>
      'Poczekaj na wynik paska przekąsek i spróbuj ponownie. Reset sesji zachowuje Twoje klucze.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Trzykrotne dotknięcie = awaryjne czyszczenie (usuwa dane lokalne) — tylko jeśli jest to zamierzone';

  @override
  String get appRecoverySection => 'Odzyskiwanie aplikacji';

  @override
  String get appRecoverySectionSubtitle =>
      'Użyj, gdy aplikacja wydaje się zawieszona. Miękkie = dwukrotne dotknięcie tytułu. Twarde odzyskiwanie jest silniejsze. Reset sesji powoduje ponowne uruchomienie usług bez czyszczenia kluczy.';

  @override
  String get appHardRecoverAction => 'Ciężko odzyskać';

  @override
  String get appHardRecovering => 'Ciężka rekonwalescencja…';

  @override
  String get appSessionResetAction => 'Zresetuj sesję';

  @override
  String get appSessionResetRunning => 'Resetuję sesję…';

  @override
  String get appSessionResetConfirmTitle => 'Zresetować sesję?';

  @override
  String get appSessionResetConfirmBody =>
      'Uruchamia ponownie usługi ResilNet na tym urządzeniu. Twoje klucze tożsamości są przechowywane.';

  @override
  String get appRecoveryBusy => 'Odzyskiwanie już działa…';

  @override
  String get appRecoveryOk => 'Odzyskiwanie zakończone';

  @override
  String get appRecoveryPartial =>
      'Odzyskiwanie zakończyło się z pominięciem niektórych kroków — spróbuj ponownie, jeśli problem nadal występuje';

  @override
  String get appRecoveryFailed =>
      'Odzyskiwanie nie powiodło się — spróbuj zresetować sesję lub wymuś zamknięcie aplikacji z poziomu systemu operacyjnego';

  @override
  String get localWifiTitle => 'Lokalne';

  @override
  String get localWifiSubtitle =>
      'Połącz pobliskie urządzenia bez Internetu — tak samo, jak w jednej sieci LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Nie ESP32 LoRa bramaSoftAP. To tylko↔ telefon / sieć LAN.';

  @override
  String get localWifiUnavailable =>
      'Lokalny nie Wi‑Fi jest jeszcze gotowy — poczekaj na uruchomienie aplikacji.';

  @override
  String get lxmfBridgeTitle => 'Węzeł domowy';

  @override
  String get lxmfBridgeSubtitle =>
      'Opcjonalny komputer Mac lub Pi na Twoim Wi‑Fi, który przekazuje zapieczętowane czaty. Domyślnie wyłączone. Nie zastępuje szyfrowania typu end-to-end.';

  @override
  String get lxmfBridgeEnable => 'Użyj węzła domowego';

  @override
  String get lxmfBridgeDisabledHint =>
      'Włącz tylko wtedy, gdy aplikacja Bridge działa na komputerze Mac lub Pi w tej sieci.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Nie można połączyć się z węzłem głównym — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Adres węzła domowego';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP lub http://IP:port — przykład 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Równorzędny → LXMF docelowy (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Zapisz i odśwież stan';

  @override
  String get lxmfBridgeLabHint => 'Zaawansowane: laboratoria/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Ustawienia węzła domowego';

  @override
  String get lxmfBridgeCheckConnection => 'Sprawdź połączenie';

  @override
  String get lxmfBridgeStatusOnline => 'Połączono z węzłem domowym';

  @override
  String get lxmfBridgeStatusOffline => 'Węzeł macierzysty nieosiągalny';

  @override
  String get lxmfBridgeYourDest => 'Adres tego węzła (udostępnij znajomym)';

  @override
  String get lxmfBridgeCopyDest => 'Skopiuj adres';

  @override
  String get lxmfBridgeDestCopied => 'Adres skopiowany';

  @override
  String get lxmfBridgeLinkedPeers => 'Połączeni przyjaciele';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Każdy znajomy potrzebuje raz adresu węzła domowego. Następnie zapieczętowane czaty mogą korzystać z tej ścieżki.';

  @override
  String get lxmfBridgeNoLinks => 'Nie ma jeszcze powiązanych znajomych.';

  @override
  String get lxmfBridgeAddLink => 'Połącz znajomego';

  @override
  String get lxmfBridgePickPeer => 'Przyjaciel';

  @override
  String get lxmfBridgePeerDest => 'Adres ich węzła domowego';

  @override
  String get lxmfBridgePeerDestHint => '32-znakowy kod z ekranu węzła głównego';

  @override
  String get lxmfBridgeInvalidDest =>
      'Ten adres nie wygląda na prawidłowy. Wklej pełny kod z węzła macierzystego.';

  @override
  String get lxmfBridgeRemoveLink => 'Odczepić';

  @override
  String get lxmfBridgeSaveLink => 'Ratować';

  @override
  String get lxmfBridgeLinkSaved => 'Przyjaciel powiązany';

  @override
  String get lxmfBridgeNoPeers =>
      'Nie ma jeszcze kontaktów, do których można wysłać wiadomość — najpierw dodaj znajomego.';

  @override
  String get lxmfBridgeHelp =>
      'Utrzymuj most uruchomiony na komputerze Mac/Pi. Ta ścieżka pozostaje w Twojej sieci LAN — nie jest to LoRa i nie zastępuje Internetu ani siatki Bluetooth.';

  @override
  String get localWifiModeHotspot => 'W pobliżu';

  @override
  String get localWifiModeRouter => 'Routera';

  @override
  String get localWifiHotspotIntro =>
      'Jedno urządzenie udostępnia hotspot osobisty. Inne przyłączają się do tego hotspotu, a następnie ResilNet znajduje je w sieci lokalnej.';

  @override
  String get localWifiHostAction => 'Utwórz sieć (Host)';

  @override
  String get localWifiJoinAction => 'Dołącz do sieci';

  @override
  String get localWifiHostSteps =>
      '1. Otwórz Ustawienia iOS/Android i włącz Hotspot osobisty (lub Udostępnianie Internetu).\n2. Podaj znajomym nazwę hotspotu (i hasło).\n3. Wróć tutaj i dotknij „Hotspot jest włączony — zacznij czekać”.';

  @override
  String get localWifiHostReady => 'Hotspot jest włączony — zacznij czekać';

  @override
  String get localWifiHostWaiting => 'Oczekiwanie, aż znajomi dołączą…';

  @override
  String get localWifiJoinSteps =>
      '1. Otwórz Ustawienia systemowe i dołącz do Hotspotu osobistego znajomego.\n2. Wróć tutaj i dotknij „Mam połączenie — szukaj”.';

  @override
  String get localWifiJoinReady => 'Mam połączenie — szukaj';

  @override
  String get localWifiRouterIntro =>
      'Podłącz każde urządzenie do tego samego routera/punktu dostępowego Wi‑Fi. Router nie potrzebuje Internetu — wystarczy udostępniona sieć lokalna.';

  @override
  String get localWifiRouterSearch => 'Szukaj w tym Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Odśwież Wi‑Fi informacje';

  @override
  String get localWifiRouterNoWifiTitle => 'Nie na Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Dołącz do Wi‑Fi routera w Ustawieniach systemowych, a następnie wyszukaj ponownie.';

  @override
  String get localWifiDiscovering => 'Wyszukiwanie w lokalnych Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Urządzenia w tej sieci';

  @override
  String get localWifiStop => 'Zatrzymywać się';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nazwa niedostępna';

  @override
  String get localWifiStubBanner => 'Oczekiwanie na gniazdo LAN…';

  @override
  String get localWifiLiveBanner =>
      'Wykrywanie sieci LAN na żywo (UDP) — ogłoś + zapieczętowany czat na tym Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Nie ma jeszcze żadnych urządzeń.\nSprawdź, czy znajomi dołączyli do Twojego hotspotu i zezwolili na dostęp do sieci lokalnej.';

  @override
  String get localWifiEmptyRouter =>
      'Nie ma jeszcze żadnych urządzeń.\nTen sam identyfikator SSID? Sieć lokalna dozwolona? Niektóre routery blokują ruch między urządzeniami (izolacja punktów dostępowych).';

  @override
  String get localWifiIsolationHelp => 'Dlaczego nie możemy się odnaleźć?';

  @override
  String get localWifiIsolationTitle => 'Router może izolować klientów';

  @override
  String get localWifiIsolationBody =>
      'Jeśli włączona jest izolacja punktu dostępowego/klienta (lub sieć dla gości), telefony w tym samym Wi‑Fi nie mogą rozmawiać. Wyłącz izolację, użyj głównego identyfikatora SSID lub przełącz na tryb W pobliżu (Hotspot).';

  @override
  String get localWifiPeerReady => 'Gotowy do rozmowy (ma klucz)';

  @override
  String get localWifiPeerNeedKey =>
      'Znaleziono — zeskanuj kod QR, aby wymienić klucze';

  @override
  String get localWifiErrorTitle => 'Lokalny błąd Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Coś poszło nie tak. Zatrzymaj się i spróbuj ponownie.';

  @override
  String get preparingSystem => 'Przygotowuję system…';

  @override
  String get bootFailedTitle => 'Nie można rozpocząć';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String get bootRecoveryAction =>
      'Rozpocznij nową tożsamość (usuń dane lokalne)';

  @override
  String get bootRecoveryConfirmTitle => 'Rozpocząć nową tożsamość?';

  @override
  String get bootRecoveryConfirmBody =>
      'Spowoduje to trwałe usunięcie lokalnych czatów, kluczy i tożsamości z tego urządzenia.\nWspółpracownicy muszą ponownie zeskanować Twój kod QR, podając nową tożsamość.\nTego nie można cofnąć.';

  @override
  String get bootRecoveryRunning => 'Resetuję tożsamość lokalną…';

  @override
  String get bootRecoverySuccess =>
      'Resetowanie tożsamości lokalnej zakończone';

  @override
  String bootRecoveryFailed(String error) {
    return 'Nie można zresetować tożsamości: $error';
  }

  @override
  String get cancel => 'Anulować';

  @override
  String get save => 'Ratować';

  @override
  String get close => 'Zamknąć';

  @override
  String get start => 'Start';

  @override
  String get send => 'Wysłać';

  @override
  String get settings => 'Ustawienia';

  @override
  String get language => 'Język';

  @override
  String get languageSubtitle =>
      'Domyślnie aplikacja obsługuje język Twojego telefonu (jeśli jest obsługiwany). Inne języki wracają do angielskiego. Tutaj możesz także zablokować język.';

  @override
  String get languageSystem => 'Domyślne systemowe';

  @override
  String get languageThai => 'tajski';

  @override
  String get languageEnglish => 'angielski';

  @override
  String get notificationsTooltip => 'Ustawienia powiadomień';

  @override
  String get enableMessageNotifications =>
      'Włącz powiadomienia o wiadomościach';

  @override
  String get settingsNotificationsSubtitle =>
      'Wiadomości 1:1 i osoby online (alerty lokalne)';

  @override
  String get networkMembersTooltip => 'Członkowie sieci';

  @override
  String get identityQrTooltip => 'Tożsamość / QR';

  @override
  String get feedDirects => 'Pogawędzić';

  @override
  String get feedMesh => '#oczko';

  @override
  String get feedGeo => 'Obszar';

  @override
  String get feedDirectsSubtitle => 'Prywatne wiadomości E2EE';

  @override
  String get feedMeshSubtitle => 'Pobliscy równorzędni (BLE)';

  @override
  String get feedGeoSubtitle => 'Kanał odkrywania Geohash';

  @override
  String get peerIdHint =>
      'Wklej identyfikator odbiorcy (skrót klucza publicznego), aby rozpocząć czat';

  @override
  String get directsEmpty =>
      'Nie ma jeszcze czatów — zeskanuj kod QR lub wklej identyfikator odbiorcy, aby rozpocząć\nWiadomości są zabezpieczane za pomocą E2EE przed wysłaniem (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • dotknij, aby otworzyć czat';

  @override
  String get meshIntro =>
      'Uczestnicy w zasięgu BLE — dotknij, aby rozpocząć prywatny czat E2EE (bez publicznego tworzenia wiadomości na #mesh)\nWysyła przez router hybrydowy (BLE + LoRa + Nostr w trybie online)';

  @override
  String get meshEmptyRunning =>
      'Brak jeszcze urządzeń równorzędnych w pobliżu — otwórz aplikację na innym urządzeniu w zasięgu BLE';

  @override
  String get meshEmptyStopped =>
      'BLE nie jest uruchomiony — przyznaj uprawnienia Bluetooth/lokalizacji';

  @override
  String get meshNearbyPrefix => 'W pobliżu';

  @override
  String get meshRetentionTitle => 'Automatyczne usuwanie wiadomości';

  @override
  String get meshRetentionSubtitle =>
      'Starsza historia czatów lokalnych jest automatycznie usuwana';

  @override
  String get meshRetentionKeep => 'Trzymać';

  @override
  String get meshRetention1Day => '1 dzień';

  @override
  String get meshRetention3Days => '3 dni';

  @override
  String get meshRetention7Days => '7 dni';

  @override
  String get refreshLocationTooltip => 'Odśwież lokalizację';

  @override
  String get geoIntro =>
      'Z osobami online w tym geohaszu można wysyłać wiadomości 1:1 lub za pomocą publicznego rozgłosu obszarowego (nadal zapieczętowany E2EE na peera — a nie zwykły tekst)';

  @override
  String geoEmpty(String channel) {
    return 'Nikt jeszcze nie jest online w $channel\nUżyj Transport → Internet/Auto, poczekaj na Nostr, odśwież lokalizację';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online w $channel • dotknij, aby uzyskać 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'W pobliżu (oczekiwanie na obecność obszaru) • dotknij, aby wyświetlić 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Widziano Nostr w $channel • tylko odkrycie (starsza wersja)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Starsza anonimowa obecność — poczekaj na powiązanego partnera lub wymień kod QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE w pobliżu — zeskanuj kod QR, aby rozpocząć 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Obszar Potrzeby wykrywania Internetu Nostr podłączony (Ustawienia → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Lokalizacja nie została jeszcze ustalona — zezwól na GPS i odśwież, aby opublikować swój geohash na Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Odmowa dostępu do lokalizacji — zezwól ResilNet w Ustawieniach → Prywatność → Lokalizacja';

  @override
  String get geoEmptyServicesDisabled =>
      'Usługi lokalizacyjne są wyłączone — włącz je w Ustawieniach';

  @override
  String get geoEmptyNoGpsFix =>
      'Nie można uzyskać pozycji GPS (często spotykane na iPadach Wi‑Fi) — ustaw geohash ręcznie poniżej';

  @override
  String get geoEmptyTeleportHint =>
      'Kliknij ikonę miejsca → wprowadź geohash (np. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Ustaw geohasha';

  @override
  String get geoTeleportHint =>
      'Nie masz GPS\'a? Wprowadź prefiks geohash (2–7 znaków, np. w5) i dotknij Teleport';

  @override
  String get geoTeleportInvalid =>
      'Nieprawidłowy geohash — używaj tylko liter/cyfr base32 (np. w5 lub w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Obszar ustawiony na $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Obszar ręczny: $channel (odświeżanie GPS zostanie zastąpione)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr nie jest gotowy — kliknij Połącz ponownie (0/0, aż inicjacja się powiedzie)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport odbywa się wyłącznie w trybie Mesh — przełącz się na Internet lub Auto, aby znaleźć równorzędnych użytkowników w sieci Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Nie ma jeszcze nikogo w $channel — pozostaw obszar + Internet otwarty na obu urządzeniach i poczekaj ~60 s';
  }

  @override
  String get geoChannelFallback => '#obszar';

  @override
  String get geoRefreshLocation => 'Odśwież lokalizację';

  @override
  String get settingsClearLocationTitle => 'Wyczyść lokalizację';

  @override
  String get settingsClearLocationSubtitle =>
      'Usuń geohash GPS/teleport (obszar staje się #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Wyczyść lokalizację?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Usuwa zapisany geohash na tym urządzeniu. Później możesz odświeżyć GPS lub teleportować się ponownie.';

  @override
  String get settingsClearLocationAction => 'Wyczyść lokalizację';

  @override
  String get settingsClearLocationSnack => 'Lokalizacja została wyczyszczona';

  @override
  String get chatVoiceTooLarge =>
      'Notatka głosowa jest za duża — maks. ~30 sekund';

  @override
  String get chatVoiceNeedInternet =>
      'Notatka głosowa wymaga Internetu (Nostr) — jest za duża dla samego BLE';

  @override
  String get chatVoiceSentInternet => 'Notatka głosowa wysłana przez Internet';

  @override
  String get noticeAnonMention => 'wzmianka';

  @override
  String get noticeAnonDm => 'bezpośrednia wiadomość';

  @override
  String get noticeAnonHug => 'uścisk';

  @override
  String get noticeAnonSlap => 'policzkować';

  @override
  String get noticeAnonBlock => 'blok';

  @override
  String get noticeAnonNeedKey =>
      'Nie ma jeszcze klucza publicznego — wymień najpierw QR na 1:1';

  @override
  String get noticeAnonActionSent => 'Wysłano';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Zablokowano $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*uściski $anon*';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* klepie $anon *';
  }

  @override
  String get geoReconnectNostr => 'Połącz ponownie Nostr';

  @override
  String get nostrSectionTitle => 'Nostr przekaźniki';

  @override
  String get nostrSectionSubtitle =>
      'Wiadomości internetowe i wykrywanie obszarów korzystają z tych przekaźników. Stuknij opcję Połącz ponownie, jeśli status pozostaje offline.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Połączono $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline — przekaźniki wymienione, ale żaden nie jest podłączony';

  @override
  String get nostrStatusNotInit =>
      'Nie uruchomiono (0/0) — dotknij Połącz ponownie, aby zainicjować';

  @override
  String get nostrReconnectAction => 'Połącz ponownie Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr podłączony ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Nadal offline — sprawdź Wi‑Fi/cell lub spróbuj ponownie';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Niepowodzenie: $error';
  }

  @override
  String get nostrReconnecting => 'Łączenie z przekaźnikami…';

  @override
  String get nostrTorTitle => 'Route Nostr via Tor';

  @override
  String get nostrTorSubtitle =>
      'When on, relays connect through local Tor SOCKS (127.0.0.1:9050 — Orbot or system Tor). Slower, but hides your IP from relays. Requires Tor to be running; will not fall back to clearnet.';

  @override
  String get nostrTorFailed =>
      'Tor SOCKS unavailable — open Orbot/Tor, then try again';

  @override
  String nostrTorFailedDetail(String error) {
    return 'Tor failed: $error';
  }

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) w $channel • Zapieczętowany czat gotowy';
  }

  @override
  String get transportModeTitle => 'Transport terenowy';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE w pobliżu (radio), gdy nie Nostr · Internet i Auto = Nostr lista osób';

  @override
  String get transportModeMesh => 'Oczko';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Automatyczny';

  @override
  String get gatewayRadioTitle => 'Gateway radio';

  @override
  String get gatewayRadioSubtitle =>
      'Switch ESP32 gateway RF path — phone still uses BLE / SoftAP UDP';

  @override
  String get gatewayRadioLora => 'LoRa';

  @override
  String get gatewayRadioHalow => 'HaLow';

  @override
  String get gatewayRadioAuto => 'Auto';

  @override
  String get gatewayRadioHalowUnavailable =>
      'HaLow not reported by this gateway (LoRa-only firmware)';

  @override
  String get gatewayRadioSharedWarning =>
      'Changing gateway radio affects every phone connected to this gateway.';

  @override
  String get gatewayCapsWaiting => 'gateway: waiting for caps…';

  @override
  String get geoPublicHint =>
      'Wiadomość publiczna do wszystkich osób online w tym obszarze';

  @override
  String get geoPublicSend => 'Publiczny';

  @override
  String geoPublicHelp(int count) {
    return 'Zapieczętowane rozesłanie do $count partnerów online — każdy otrzymuje prywatną kopertę';
  }

  @override
  String geoPublicSent(int count) {
    return 'Wysłano do $count równorzędnych użytkowników w tym obszarze';
  }

  @override
  String get geoPublicSentNone =>
      'Brak równorzędnych partnerów online — otwórz obszar/siatkę z uczestnikami posiadającymi klucze lub poczekaj na BLE/Nostr';

  @override
  String get areaPublicBadge => 'Obszar publiczny';

  @override
  String get geoErrorPermission =>
      'Nie można odczytać lokalizacji — sprawdź uprawnienia lokalizacji';

  @override
  String get geoPrecisionRegion => 'Region';

  @override
  String get geoPrecisionProvince => 'Województwo';

  @override
  String get geoPrecisionCity => 'Miasto';

  @override
  String get geoPrecisionNeighborhood => 'Sąsiedztwo';

  @override
  String get geoPrecisionBlock => 'Blok';

  @override
  String get aliasTitle => 'Ustaw pseudonim (alias kontaktu)';

  @override
  String get aliasHintBody =>
      'Ten alias jest przechowywany tylko na tym urządzeniu (tylko lokalnie)\nNigdy nie jest wysyłany w ruchu E2EE';

  @override
  String get aliasLabel => 'Przydomek';

  @override
  String get aliasHint => 'np. „wójt wioski”, „P’Somchai”…';

  @override
  String get settingsDevices => 'Urządzenia';

  @override
  String get settingsFirmwareTitle =>
      'Pobierz/zaktualizuj ESP32 oprogramowanie sprzętowe';

  @override
  String get settingsFirmwareSubtitle =>
      'Pobierz pliki .bin i zaktualizuj płytkę ESP32 przez OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic most';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Mostek A/B zawierający wyłącznie tekst — nie ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Przenieś krótki tekst jawny pomiędzy Meshtastic i ResilNet. Tryby A i B nie mogą działać jednocześnie. Nie jest to szyfrowanie typu end-to-end.';

  @override
  String get mtBridgeModeLabel => 'Tryb';

  @override
  String get mtBridgeModeOff => 'Wyłączony';

  @override
  String get mtBridgeModeA => 'Połknij A';

  @override
  String get mtBridgeModeB => 'Wyjście B';

  @override
  String get mtBridgeModeOffShort => 'Wyłączony';

  @override
  String get mtBridgeModeAShort => 'w A';

  @override
  String get mtBridgeModeBShort => 'Wyjście B';

  @override
  String get mtBridgeMutexHint =>
      'Wybranie jednego trybu powoduje automatyczne wyłączenie drugiego. Jednoczesne A+B nie jest obsługiwane.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (logowanie)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Tekst przychodzący pojawia się w obszarze Powiadomienia jako #meshtastic. Przekaźnik siatkowy jest opcjonalny (domyślnie wyłączony).';

  @override
  String get mtBridgeRelayTitle => 'Przekaż także na siatce ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Gdy funkcja ta jest włączona, nadawane są podpisane biuletyny publiczne. Wyłączone = tylko powiadomienia tego telefonu.';

  @override
  String get mtBridgeSimulateHint => 'Wiadomość demonstracyjna';

  @override
  String get mtBridgeSimulate => 'Symuluj wiadomość Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Uwzględnione w powiadomieniach (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Ostrzeżenie: wysyłane tutaj wiadomości NIE są ResilNet E2EE. Może je przeczytać każdy, kto znajduje się na ścieżce Meshtastic.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Tekst do publikacji';

  @override
  String get mtBridgeSend => 'Wyślij do Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'W kolejce na Meshtastic (zobacz dziennik/historię)';

  @override
  String get mtBridgeLastEgress => 'Ostatnie wyjście';

  @override
  String get mtBridgeEgressHistory => 'Niedawny wyjazd';

  @override
  String get mtBridgeOffHint =>
      'Aby skorzystać z mostu, włącz opcję Przyjmowanie (A) lub Wyjście (B).';

  @override
  String get mtBridgeNoticeBadge => 'SIATKA · nie E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Użyj transportu MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Wyłączone = tylko rejestrowanie wersji demonstracyjnych (MQTT ignorowane przychodzące). On = MQTT dla przyjmowania/wychodzenia po podłączeniu.';

  @override
  String get mtBridgeMqttHost => 'Host brokera';

  @override
  String get mtBridgeMqttPort => 'Port';

  @override
  String get mtBridgeMqttTls => 'Użyj protokołu TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typowy port 8883. Używa certyfikatów systemowych; kończy się miękkim błędem w przypadku błędów uzgadniania.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Automatyczne ponowne połączenie';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Gdy opcja ta jest włączona, klient próbuje ponownie połączyć się po przerwach. Status pokazuje Łączenie do czasu przywrócenia.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Pomocnicy tematu';

  @override
  String get mtBridgeMqttRegion => 'Prefiks regionu (opcjonalnie)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Po ustawieniu Apply odbudowuje katalog główny jako msh/<region>/2/json (zastępuje katalog główny tematu).';

  @override
  String get mtBridgeMqttTopicRoot => 'Główny temat JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nazwa kanału łącza w dół';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Zastosuj root → subskrybuj / publikuj tematy';

  @override
  String get mtBridgeMqttAdvanced => 'Zaawansowane MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, ponowne połączenie, tematy, dane uwierzytelniające';

  @override
  String get mtBridgeMqttTopicIn => 'Subskrybuj temat';

  @override
  String get mtBridgeMqttTopicOut => 'Opublikuj temat';

  @override
  String get mtBridgeMqttGatewayFrom => 'Identyfikator węzła bramy (od)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Identyfikator dziesiętny lub !hex — wymagany dla łącza wysyłającego tekst';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Indeks kanału siatki (opcjonalnie 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nazwa użytkownika (opcjonalnie)';

  @override
  String get mtBridgeMqttPass => 'Hasło (opcjonalnie)';

  @override
  String get mtBridgeMqttPassStored =>
      'Hasło jest przechowywane na tym urządzeniu (nie pokazano).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nowe hasło (pozostaw puste, aby zachować)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Pozostaw puste, aby zachować zapisane hasło.';

  @override
  String get mtBridgeMqttPassClear => 'Wyczyść hasło';

  @override
  String get mtBridgeMqttSave => 'Zapisz ustawienia MQTT';

  @override
  String get mtBridgeMqttSaved => 'Ustawienia MQTT zostały zapisane';

  @override
  String get mtBridgeMqttConnect => 'Łączyć';

  @override
  String get mtBridgeMqttDisconnect => 'Odłączyć';

  @override
  String get mtBridgeMqttConnected => 'MQTT połączony';

  @override
  String get mtBridgeMqttConnecting => 'MQTT łączenie…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT rozłączony';

  @override
  String get mtBridgeMqttError => 'Błąd MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Najpierw przełącz się na spożycie (A).';

  @override
  String get mtBridgeErrModeEgress => 'Najpierw przejdź do wyjścia (B).';

  @override
  String get mtBridgeErrRate => 'Zwolnij – prędkość ograniczona';

  @override
  String get mtBridgeErrDedupe => 'Zduplikowana wiadomość została zignorowana';

  @override
  String get mtBridgeErrLoop => 'Opuszczony, aby zapobiec zapętleniu mostu';

  @override
  String get mtBridgeErrEmpty => 'Wiadomość jest pusta';

  @override
  String get mtBridgeErrPublish => 'Publikowanie nie powiodło się';

  @override
  String get mtBridgeErrNotConnected => 'MQTT nie jest podłączony';

  @override
  String get mtBridgeErrMissingHost => 'Wprowadź MQTT hosta brokera';

  @override
  String get mtBridgeErrMissingTopic => 'Wprowadź subskrybuj i publikuj tematy';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Wprowadź identyfikator węzła bramy (z) dla wysłanego tekstu';

  @override
  String get mtBridgeErrConnect => 'MQTT połączenie nie powiodło się';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Połączenie TLS nie powiodło się';

  @override
  String get settingsData => 'Dane';

  @override
  String get settingsDataHint =>
      'Usuń wiadomości lokalne, aby zmniejszyć bazę danych — tożsamość, klucze i elementy równorzędne zostaną zachowane';

  @override
  String get settingsSaveHistoryTitle => 'Zapisz historię wiadomości';

  @override
  String get settingsSaveHistorySubtitle =>
      'Gdy opcja jest wyłączona, wiadomości pozostają w sieci E2EE i są przechowywane tylko podczas tej sesji (nie w historii czatów lokalnych). Twój własny tekst nadal wyświetla się na tym urządzeniu jako zwykły tekst.';

  @override
  String get settingsPrivacy => 'Prywatność';

  @override
  String get settingsE2eeTitle => 'Szyfrowanie typu end-to-end';

  @override
  String get settingsE2eeSubtitle =>
      'Zawsze włączone — wiadomości są zabezpieczane za pomocą RSA-OAEP + AES-GCM przed wysłaniem. Przekaźniki i pobliskie przeskoki nie mogą odczytać zawartości.';

  @override
  String get settingsScreenshotTitle => 'Alerty dotyczące zrzutów ekranu';

  @override
  String get settingsScreenshotSubtitle =>
      'Pokaż linię systemową na czacie, gdy to urządzenie przechwyci ekran';

  @override
  String get settingsNostrExpiryTitle => 'zachowaj czas na Nostr wiadomość';

  @override
  String get settingsNostrExpirySubtitle =>
      'Jak długo zapieczętowane koperty powinny pozostać lokalnie w trybie online za pośrednictwem Nostr';

  @override
  String get noticeExpiresIn => 'wygasa w';

  @override
  String get noticesTitle => 'Uwagi';

  @override
  String get noticesMeshIntro =>
      'Biuletyn publiczny — widoczny dla wszystkich w zasięgu radia, nieszyfrowany. Przeskakuje między telefonami w trybie offline, a pobliskie skrzynki przekaźnikowe ResilNet zachowują kopię, aby osoby, które przyjdą później, nadal ją widziały.';

  @override
  String get noticesMeshPublicBadge => 'PUBLICZNE · nieszyfrowane';

  @override
  String get noticesGeoIntro =>
      'Dodaj krótkie notatki dotyczące tego miejsca, aby inni odwiedzający mogli je znaleźć.';

  @override
  String get noticesEmpty => 'nie ma jeszcze żadnych powiadomień';

  @override
  String get noticesEmptyHint =>
      'przypnij pierwsze powiadomienie dla ludzi w okolicy.';

  @override
  String get noticesComposeHint => 'opublikuj ogłoszenie...';

  @override
  String get noticesUrgent => 'pilny';

  @override
  String get noticesOpen => 'Uwagi';

  @override
  String get screenshotTaken => '*zrobiłeś zrzut ekranu*';

  @override
  String get chatAttachImage => 'Dołącz obraz';

  @override
  String get chatImageLabel => 'Obraz';

  @override
  String get chatImageTooLarge => 'Obraz jest za duży — spróbuj innego zdjęcia';

  @override
  String get chatNostrExpiry => 'Nostr zachowaj';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Wyślij do $channel — publicznie';
  }

  @override
  String get settingsClearTitle => 'Usuń wszystkie wiadomości';

  @override
  String get settingsClearSubtitle => 'Usuń wszystkie czaty na tym urządzeniu';

  @override
  String get settingsClearConfirmTitle => 'Wyczyścić wszystkie wiadomości?';

  @override
  String get settingsClearConfirmBody =>
      'Spowoduje to usunięcie wszystkich wiadomości czatu na tym urządzeniu.\nKoledzy i pseudonimy nie są usuwane.';

  @override
  String get settingsClearAction => 'Wyczyść dane';

  @override
  String get settingsClearedSnack => 'Dane wyczyszczone';

  @override
  String settingsVersion(String version) {
    return 'wersja $version';
  }

  @override
  String get meshBleScanning => 'BLE: skanowanie w poszukiwaniu węzłów';

  @override
  String get meshBleEsp32Scanning => 'ESP32: szukanie pobliskiego węzła';

  @override
  String get meshBleSyncing => 'BLE: synchronizacja z ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publikowanie';

  @override
  String get meshBleIdle =>
      'Sieć BLE włączona — jeszcze nie ma telefonów w pobliżu';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count telefon(y) w pobliżu';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: wymagane pozwolenie';

  @override
  String get meshBlePausedCamera =>
      'BLE wstrzymane dla kamery — kliknij Start BLE';

  @override
  String get meshBleStopped =>
      'BLE jest wyłączone — sprawdź, czy Bluetooth jest włączony, a następnie kliknij Start BLE';

  @override
  String get meshBleRestart => 'Rozpocznij BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Sprawdź uprawnienia i rozpocznij BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count pobliskie urządzenia równorzędne • LoRa $lora • synchronizacja ~${meters}m';
  }

  @override
  String get meshLoraReady => 'gotowy';

  @override
  String get meshLoraNotReady => 'nie gotowy';

  @override
  String get meshHalowReady => 'HaLow ready';

  @override
  String get meshHalowStubReady => 'HaLow ready (stub)';

  @override
  String get meshHalowRealReady => 'HaLow ready (link up)';

  @override
  String get meshHalowNotReady => 'HaLow not ready';

  @override
  String get meshGatewayHalowReady => 'Gateway HaLow: ready';

  @override
  String get meshGatewayHalowStubReady => 'Gateway HaLow: stub/loopback';

  @override
  String get meshGatewayHalowRealReady => 'Gateway HaLow: real link';

  @override
  String meshGatewayProgress(String label) {
    return 'UDP bramy: $label';
  }

  @override
  String get meshGatewayReady => 'Brama UDP: gotowa';

  @override
  String get permissionTitle =>
      'Zezwól na dostęp, aby uruchomić sieć kratową BLE';

  @override
  String get permissionBody =>
      'Aplikacja wymaga Bluetooth (skanowanie / łączenie / reklamowanie), lokalizacji (w przypadku starszych urządzeń z Androidem) i mikrofonu (do notatek głosowych na czacie i ogłoszeniach) do przesyłania wiadomości społecznościowych.';

  @override
  String get permissionE2ee =>
      'Szyfrowanie typu end-to-end (E2EE)\nWęzły przekaźnikowe nie mogą odczytać treści wiadomości';

  @override
  String get permissionReady => 'Uprawnienia gotowe';

  @override
  String get permissionRequest => 'Zezwól i kontynuuj';

  @override
  String get permissionNotReadySnack =>
      'System nie jest jeszcze gotowy — poczekaj chwilę i spróbuj ponownie';

  @override
  String get permissionDeniedSnack =>
      'Uprawnienia niekompletne — otwórz Ustawienia > ResilNet i zezwól na Bluetooth / Lokalizacja / Mikrofon';

  @override
  String get permissionMicDenied =>
      'Odmowa dostępu do mikrofonu — zezwól na nagrywanie notatek głosowych w Ustawieniach';

  @override
  String get permissionMicOpenSettings => 'Ustawienia';

  @override
  String get permissionCameraDenied =>
      'Odmowa dostępu do aparatu — zezwól mu w Ustawieniach na skanowanie kodów QR';

  @override
  String get permissionCameraFailed =>
      'Do skanowania kodów QR wymagana jest zgoda na aparat';

  @override
  String get permissionCameraOpenSettings => 'Ustawienia';

  @override
  String get permissionPhotosDenied =>
      'Odmowa dostępu do biblioteki zdjęć — zezwól na to w Ustawieniach, aby zapisać kod QR';

  @override
  String get permissionPhotosFailed =>
      'Aby zapisać kod QR, wymagane jest pozwolenie na bibliotekę zdjęć';

  @override
  String get permissionPhotosOpenSettings => 'Ustawienia';

  @override
  String permissionFailedSnack(String error) {
    return 'Żądanie pozwolenia nie powiodło się: $error';
  }

  @override
  String get permissionFooter =>
      'Architektura ResilNet • Multi-hop typu Store-and-Forward';

  @override
  String get onboardingSkip => 'Pominąć';

  @override
  String get onboardingNext => 'Następny';

  @override
  String get onboardingStart => 'Zacznij';

  @override
  String get onboardingWelcomeTitle => 'Witamy w ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Czatuj na ResilNet przez sieć mesh — nawet bez Internetu';

  @override
  String get onboardingWelcomeFeatMeshLabel => 'Mesh';

  @override
  String get onboardingWelcomeFeatMeshHint =>
      'Nearby phones relay sealed packets hop-by-hop over Bluetooth LE.';

  @override
  String get onboardingWelcomeFeatE2eeLabel => 'E2EE';

  @override
  String get onboardingWelcomeFeatE2eeHint =>
      'Direct chats encrypt on your device; only the peer’s key can open them.';

  @override
  String get onboardingWelcomeFeatOfflineLabel => 'Offline';

  @override
  String get onboardingWelcomeFeatOfflineHint =>
      'You can keep chatting without cellular or Wi‑Fi internet access.';

  @override
  String get onboardingIdentityTitle => 'Your identity';

  @override
  String get onboardingIdentityBody =>
      'Open Identity from the ⋮ menu. Your QR carries your public key so friends can verify you before private chat.';

  @override
  String get onboardingIdentityFeatQrLabel => 'QR';

  @override
  String get onboardingIdentityFeatQrHint =>
      'Show or save your identity QR so others can add you safely.';

  @override
  String get onboardingIdentityFeatShareLabel => 'Share';

  @override
  String get onboardingIdentityFeatShareHint =>
      'Share an invite link or QR payload from Identity.';

  @override
  String get onboardingIdentityFeatScanLabel => 'Scan';

  @override
  String get onboardingIdentityFeatScanHint =>
      'Scan a friend’s QR to exchange public keys and unlock Direct chat.';

  @override
  String get onboardingIdentityFeatNameLabel => 'Name';

  @override
  String get onboardingIdentityFeatNameHint =>
      'Save a display name that peers see when you announce yourself.';

  @override
  String get onboardingChannelsTitle => 'Szyfrowany czat + pobliskie kanały';

  @override
  String get onboardingChannelsBody =>
      'Przełącz #mesh / Area (geohash), aby znaleźć pobliskie urządzenia równorzędne — wiadomości pozostają E2EE przez BLE mesh i Nostr';

  @override
  String get onboardingChannelsFeatDirectsLabel => 'Directs';

  @override
  String get onboardingChannelsFeatDirectsHint =>
      'Private E2EE conversations with verified peers.';

  @override
  String get onboardingChannelsFeatMeshLabel => '#mesh';

  @override
  String get onboardingChannelsFeatMeshHint =>
      'Public sealed posts to nearby mesh peers.';

  @override
  String get onboardingChannelsFeatGeoLabel => 'Area';

  @override
  String get onboardingChannelsFeatGeoHint =>
      'Public posts scoped to your selected geohash cell.';

  @override
  String get onboardingChannelsFeatPinLabel => 'Pin';

  @override
  String get onboardingChannelsFeatPinHint =>
      'Pin a channel so Community opens on that feed next time.';

  @override
  String get onboardingToolbarTitle => 'Community toolbar';

  @override
  String get onboardingToolbarBody =>
      'App bar icons control location, transport, notices, unread Directs, online people, and the overflow menu (Wi‑Fi, recover, info, announcements, settings, identity).';

  @override
  String get onboardingToolbarFeatLocationLabel => 'Location';

  @override
  String get onboardingToolbarFeatLocationHint =>
      'Open the Area sheet: precision, pin cells, teleport geohash, refresh GPS.';

  @override
  String get onboardingToolbarFeatTransportLabel => 'Transport';

  @override
  String get onboardingToolbarFeatTransportHint =>
      'Choose Mesh, Internet, or Auto for how public traffic is carried.';

  @override
  String get onboardingToolbarFeatNoticesLabel => 'Notices';

  @override
  String get onboardingToolbarFeatNoticesHint =>
      'Post and browse geo/mesh notices; open chat or block from an item.';

  @override
  String get onboardingToolbarFeatUnreadLabel => 'Unread';

  @override
  String get onboardingToolbarFeatUnreadHint =>
      'Jump back to Directs when private messages are waiting.';

  @override
  String get onboardingToolbarFeatPeopleLabel => 'People';

  @override
  String get onboardingToolbarFeatPeopleHint =>
      'See who is online nearby and open a Direct chat.';

  @override
  String get onboardingToolbarFeatMenuLabel => 'Menu';

  @override
  String get onboardingToolbarFeatMenuHint =>
      '⋮ opens Local Wi‑Fi, Hard recover, Info, Announcements, Settings, Identity.';

  @override
  String get onboardingComposeTitle => 'Public compose';

  @override
  String get onboardingComposeBody =>
      'On #mesh or Area, the bottom bar attaches an image, records voice, sends text, and sets message expiry (1d / 3d / 7d / ∞).';

  @override
  String get onboardingComposeFeatImageLabel => 'Image';

  @override
  String get onboardingComposeFeatImageHint =>
      'Attach a photo to a sealed public post.';

  @override
  String get onboardingComposeFeatVoiceLabel => 'Voice';

  @override
  String get onboardingComposeFeatVoiceHint =>
      'Record and send a short voice clip on the public feed.';

  @override
  String get onboardingComposeFeatSendLabel => 'Send';

  @override
  String get onboardingComposeFeatSendHint =>
      'Publish your text to the selected public channel.';

  @override
  String get onboardingComposeFeatExpiryLabel => 'Expiry';

  @override
  String get onboardingComposeFeatExpiryHint =>
      'Pick how long the post should remain before local expiry.';

  @override
  String get onboardingChatTitle => 'Direct chat controls';

  @override
  String get onboardingChatBody =>
      'In a Direct chat you can scan to verify, block, set an alias, accept a pending peer key, then send mic / image / emoji / text. Long-press a message to copy, retry, or delete locally.';

  @override
  String get onboardingChatFeatScanLabel => 'Scan';

  @override
  String get onboardingChatFeatScanHint =>
      'Scan this peer’s QR if their verified key is still missing.';

  @override
  String get onboardingChatFeatBlockLabel => 'Block';

  @override
  String get onboardingChatFeatBlockHint =>
      'Stop notifications and relay for this sender.';

  @override
  String get onboardingChatFeatAliasLabel => 'Alias';

  @override
  String get onboardingChatFeatAliasHint =>
      'Give the peer a nickname only you see.';

  @override
  String get onboardingChatFeatAcceptKeyLabel => 'Accept';

  @override
  String get onboardingChatFeatAcceptKeyHint =>
      'Confirm a pending public key before messaging.';

  @override
  String get onboardingChatFeatMicLabel => 'Mic';

  @override
  String get onboardingChatFeatMicHint =>
      'Push-to-talk voice note, sealed for this peer.';

  @override
  String get onboardingChatFeatImageLabel => 'Image';

  @override
  String get onboardingChatFeatImageHint =>
      'Send an encrypted photo in the Direct thread.';

  @override
  String get onboardingChatFeatEmojiLabel => 'Emoji';

  @override
  String get onboardingChatFeatEmojiHint =>
      'Open the emoji picker for the compose field.';

  @override
  String get onboardingChatFeatSendLabel => 'Send';

  @override
  String get onboardingChatFeatSendHint =>
      'Encrypt and route the text message to this peer.';

  @override
  String get onboardingAnnounceTitle => 'Announcement boards';

  @override
  String get onboardingAnnounceBody =>
      'Create or follow boards, scan invite QR, approve key requests, toggle locked/open posting, then post image/emoji/text and share invites.';

  @override
  String get onboardingAnnounceFeatCreateLabel => 'Create';

  @override
  String get onboardingAnnounceFeatCreateHint =>
      'Start a new announcement board you control.';

  @override
  String get onboardingAnnounceFeatScanLabel => 'Scan';

  @override
  String get onboardingAnnounceFeatScanHint =>
      'Scan a board invite QR or follow a deep link.';

  @override
  String get onboardingAnnounceFeatAccessLabel => 'Access';

  @override
  String get onboardingAnnounceFeatAccessHint =>
      'Request access, approve/deny key requests, lock or open posting.';

  @override
  String get onboardingAnnounceFeatPostLabel => 'Post';

  @override
  String get onboardingAnnounceFeatPostHint =>
      'Publish to the board with image, emoji, or text.';

  @override
  String get onboardingWifiTitle => 'Local Wi‑Fi link';

  @override
  String get onboardingWifiBody =>
      'From Settings or the ⋮ menu, host or join a LAN ResilNet link to chat with peers on the same Wi‑Fi without the internet.';

  @override
  String get onboardingWifiFeatHostLabel => 'Host';

  @override
  String get onboardingWifiFeatHostHint =>
      'Start a Local Wi‑Fi session others on the LAN can discover.';

  @override
  String get onboardingWifiFeatJoinLabel => 'Join';

  @override
  String get onboardingWifiFeatJoinHint =>
      'Discover and join a host on your local network.';

  @override
  String get onboardingWifiFeatChatLabel => 'Chat';

  @override
  String get onboardingWifiFeatChatHint =>
      'Open Direct chat with a peer sighted on the LAN.';

  @override
  String get onboardingTransportTitle => 'Transport & sync';

  @override
  String get onboardingTransportBody =>
      'Settings and the transport picker choose Mesh / Internet / Auto, ensure BLE advertising, and reconnect Nostr with message expiry options.';

  @override
  String get onboardingTransportFeatMeshLabel => 'Mesh';

  @override
  String get onboardingTransportFeatMeshHint =>
      'Prefer BLE mesh for nearby delivery.';

  @override
  String get onboardingTransportFeatInternetLabel => 'Internet';

  @override
  String get onboardingTransportFeatInternetHint =>
      'Prefer Nostr / internet paths when available.';

  @override
  String get onboardingTransportFeatAutoLabel => 'Auto';

  @override
  String get onboardingTransportFeatAutoHint =>
      'Let ResilNet pick mesh or internet based on conditions.';

  @override
  String get onboardingTransportFeatBleLabel => 'BLE';

  @override
  String get onboardingTransportFeatBleHint =>
      'Ensure BLE mesh advertising/scanning is active.';

  @override
  String get onboardingTransportFeatNostrLabel => 'Nostr';

  @override
  String get onboardingTransportFeatNostrHint =>
      'Reconnect relays and set how long synced posts live.';

  @override
  String get onboardingGeoTitle => 'Area & geohash';

  @override
  String get onboardingGeoBody =>
      'The location sheet sets GPS cell precision, pins areas you care about, teleports to a geohash, and refreshes your current cell for Area chat.';

  @override
  String get onboardingGeoFeatGpsLabel => 'GPS';

  @override
  String get onboardingGeoFeatGpsHint =>
      'Refresh your current geohash from GPS.';

  @override
  String get onboardingGeoFeatPrecisionLabel => 'Precision';

  @override
  String get onboardingGeoFeatPrecisionHint =>
      'Widen or tighten the Area cell size.';

  @override
  String get onboardingGeoFeatTeleportLabel => 'Teleport';

  @override
  String get onboardingGeoFeatTeleportHint =>
      'Jump to a geohash string without moving physically.';

  @override
  String get onboardingGeoFeatPinLabel => 'Pin';

  @override
  String get onboardingGeoFeatPinHint =>
      'Pin favorite Area cells for quick return.';

  @override
  String get onboardingAdvancedTitle => 'Bridges & hardware';

  @override
  String get onboardingAdvancedBody =>
      'Settings opens Mesh topology, Meshtastic MQTT bridge, ESP32 firmware download + BLE OTA, and LXMF home-node bridge for radio/mule links.';

  @override
  String get onboardingAdvancedFeatTopoLabel => 'Topology';

  @override
  String get onboardingAdvancedFeatTopoHint =>
      'Visualize mesh nodes and tap a node to open chat.';

  @override
  String get onboardingAdvancedFeatMtLabel => 'Meshtastic';

  @override
  String get onboardingAdvancedFeatMtHint =>
      'Bridge via MQTT topics, relay, and simulate ingest/egress.';

  @override
  String get onboardingAdvancedFeatEspLabel => 'ESP32';

  @override
  String get onboardingAdvancedFeatEspHint =>
      'Download firmware bins and flash over BLE OTA.';

  @override
  String get onboardingAdvancedFeatLxmfLabel => 'LXMF';

  @override
  String get onboardingAdvancedFeatLxmfHint =>
      'Enable a home-node bridge and manage destination links.';

  @override
  String get onboardingSecurityTitle => 'Safety & recovery';

  @override
  String get onboardingSecurityBody =>
      'Settings covers notifications, screenshot alerts, save history, clear messages, panic wipe, hard recover, session reset, language, and docs.';

  @override
  String get onboardingSecurityFeatNotifLabel => 'Alerts';

  @override
  String get onboardingSecurityFeatNotifHint => 'Toggle message notifications.';

  @override
  String get onboardingSecurityFeatShotLabel => 'Screenshot';

  @override
  String get onboardingSecurityFeatShotHint =>
      'Warn when a screenshot is taken while chatting.';

  @override
  String get onboardingSecurityFeatHistoryLabel => 'History';

  @override
  String get onboardingSecurityFeatHistoryHint =>
      'Choose whether chats are kept on disk.';

  @override
  String get onboardingSecurityFeatPanicLabel => 'Panic';

  @override
  String get onboardingSecurityFeatPanicHint =>
      'Wipe local secrets and messages in an emergency.';

  @override
  String get onboardingSecurityFeatRecoverLabel => 'Recover';

  @override
  String get onboardingSecurityFeatRecoverHint =>
      'Hard recover or session reset if the app is stuck.';

  @override
  String get onboardingSecurityFeatDocsLabel => 'Docs';

  @override
  String get onboardingSecurityFeatDocsHint =>
      'Open the in-app guide and info sheets.';

  @override
  String get onboardingWatchTitle => 'Apple Watch';

  @override
  String get onboardingWatchBody =>
      'Pair an Apple Watch to see mesh status, recent Directs, and send short encrypted texts. The Watch uses your iPhone for crypto and mesh routing.';

  @override
  String get onboardingWatchFeatStatusLabel => 'Status';

  @override
  String get onboardingWatchFeatStatusHint =>
      'Glance transport mode, online peers, and your short id.';

  @override
  String get onboardingWatchFeatChatsLabel => 'Chats';

  @override
  String get onboardingWatchFeatChatsHint =>
      'Browse recent Direct threads and unread counts.';

  @override
  String get onboardingWatchFeatSendLabel => 'Send';

  @override
  String get onboardingWatchFeatSendHint =>
      'Type a short message (≈160 chars); iPhone seals and routes it.';

  @override
  String get onboardingReadyTitle => 'You’re ready';

  @override
  String get onboardingReadyBody =>
      'Tap Get started to enter Community, or Skip anytime from the top. You can revisit Settings → Docs if you need a refresher.';

  @override
  String get onboardingReadyFeatStartLabel => 'Start';

  @override
  String get onboardingReadyFeatStartHint =>
      'Finish onboarding and open the Community home.';

  @override
  String get onboardingReadyFeatSkipLabel => 'Skip';

  @override
  String get onboardingReadyFeatSkipHint =>
      'Skip is always available on every page to enter immediately.';

  @override
  String get chatTitle => 'Czat (E2EE)';

  @override
  String get chatScanTooltip => 'Zeskanuj kod QR, aby dodać partnera';

  @override
  String get chatBlockTooltip => 'Zablokuj tego nadawcę';

  @override
  String get chatBlockedSnack =>
      'Zablokowano: brak powiadomień / brak przekaźnika';

  @override
  String get chatAliasTooltip => 'Ustaw pseudonim';

  @override
  String get chatReceiverPemLabel => 'Klucz publiczny odbiorcy (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Wklej klucz publiczny znajomego (z pliku QR/współdzielonego)';

  @override
  String get chatNeedPeerKey =>
      'Najpierw zeskanuj kod QR tego partnera (wymagany zweryfikowany klucz publiczny)';

  @override
  String get chatPeerKeyMismatch =>
      'Przechowywany klucz publiczny nie pasuje do tego identyfikatora równorzędnego';

  @override
  String chatVoiceFailed(String error) {
    return 'Nie można nagrać dźwięku: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Nie można odtworzyć notatki głosowej: $error';
  }

  @override
  String get chatPlayVoice => 'Odtwórz notatkę głosową';

  @override
  String get chatPauseVoice => 'Pauza';

  @override
  String get chatVoiceLabelSent => '🎤 Notatka głosowa (zapieczętowana)';

  @override
  String get chatVoiceLabel => '🎤 Notatka głosowa';

  @override
  String get chatDecryptFailed => '[odszyfrowanie nie powiodło się]';

  @override
  String chatSentSealed(String preview) {
    return '[zapieczętowane • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[zapieczętowany]';

  @override
  String get chatComposeHint => 'Wpisz wiadomość… (zapieczętowana po wysłaniu)';

  @override
  String get chatEmptyThread =>
      'Nie ma jeszcze żadnych wiadomości\nWpisz poniżej, aby wysłać przez siatkę';

  @override
  String chatLoadFailed(String error) {
    return 'Nie można załadować rozmowy: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Aż do';

  @override
  String get statusSent => 'Wysłano';

  @override
  String get statusRelayed => 'Przekazany';

  @override
  String get statusDelivered => 'Dostarczony';

  @override
  String get statusRead => 'Czytać';

  @override
  String get statusFailed => 'Przegrany';

  @override
  String get chatCopy => 'Kopia';

  @override
  String get chatDeleteLocal => 'Usuń na tym urządzeniu';

  @override
  String get chatDeletedLocalSnack => 'Usunięto na tym urządzeniu';

  @override
  String get chatRetry => 'Spróbować ponownie';

  @override
  String get chatSendFailed =>
      'Nie dostarczono — dotknij opcji Spróbuj ponownie';

  @override
  String get chatImageNeedInternet =>
      'Połącz się z Internetem, aby wysłać obrazy';

  @override
  String get chatImageTooLargeOnline =>
      'Nie można skompresować obrazu na tyle, aby można go było wysłać';

  @override
  String get chatOpenLinkFailed => 'Nie można otworzyć linku';

  @override
  String get identityTitle => 'Tożsamość';

  @override
  String get identityScanTooltip => 'Zeskanuj QR aparatem';

  @override
  String get identityCopiedHash => 'Skopiowano skrót klucza publicznego';

  @override
  String get identityPeerSaved => 'Partner zapisany z QR';

  @override
  String get identityGalleryDenied => 'Odmowa pozwolenia na bibliotekę zdjęć';

  @override
  String get identityQrSaved => 'Kod QR zapisany w bibliotece zdjęć';

  @override
  String identityQrSaveFailed(String error) {
    return 'Nie można zapisać kodu QR: $error';
  }

  @override
  String get peersTitle => 'Członkowie sieci';

  @override
  String get qrScanTitle => 'Zeskanuj kod QR, aby dodać znajomego';

  @override
  String get qrInvalid => 'Skanowanie nie powiodło się: nieprawidłowy kod QR';

  @override
  String get qrIdKeyMismatch =>
      'QR odrzucony: identyfikator nie pasuje do klucza publicznego';

  @override
  String get qrCameraNotReady => 'Aparat nie jest gotowy';

  @override
  String get qrRetrySettings => 'Spróbuj ponownie/otwórz Ustawienia';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Nie można otworzyć kamery: $error';
  }

  @override
  String get qrScanAlignHint => 'Dopasuj kod QR do ramki';

  @override
  String get firmwareDownloadTitle => 'Pobierz oprogramowanie sprzętowe ESP32';

  @override
  String get firmwareSourceOnline => 'Najnowsze (online)';

  @override
  String get firmwareSourceCached => 'Zapisana kopia (offline)';

  @override
  String get firmwareSourceBaseline => 'Pakiet bazowy (offline)';

  @override
  String get firmwareSourceUnavailable =>
      'Brak dostępnego oprogramowania sprzętowego';

  @override
  String get firmwareBaselineIncompatible =>
      'Dołączone oprogramowanie sprzętowe jest zbyt stare — połącz się z Internetem, aby pobrać nowszą wersję';

  @override
  String get firmwareChecksumFailed =>
      'Niepowodzenie sprawdzania integralności oprogramowania sprzętowego — flashowanie zablokowane';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Oprogramowanie gotowe: $source';
  }

  @override
  String get peersRefreshTooltip => 'Odświeżać';

  @override
  String get peersBlocked => 'Zablokowany';

  @override
  String get peersNearbyBle => 'W pobliżu (BLE)';

  @override
  String get peersRecentlyOnline => 'Ostatnio w Internecie';

  @override
  String get peersOnlineInArea => 'W okolicy online';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Widziano $minutes min temu';
  }

  @override
  String get peersOffline => 'Nieaktywny';

  @override
  String peersBlockedSnack(String id) {
    return 'Zablokowano $id';
  }

  @override
  String get peersUnblockedSnack => 'Odblokowany';

  @override
  String get peersEmpty =>
      'Brak członków w bazie danych\nZeskanuj kod QR lub poczekaj na wykrycie siatki BLE';

  @override
  String get peersOpenChat => 'Otwórz czat';

  @override
  String get peersBlockAction => 'Blok';

  @override
  String get peersUnblockAction => 'Odblokować';

  @override
  String get channelPickerTooltip => 'Czat / #mesh / Obszar';

  @override
  String get locationPickerTooltip => 'Kanał lokalizacyjny';

  @override
  String get transportPickerTooltip => 'Siatka / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Ludzie w Internecie';

  @override
  String get unreadDirectsTooltipEmpty => 'Prywatne wiadomości';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count nieprzeczytane wiadomości prywatne';
  }

  @override
  String get onlinePeopleTitle => 'ludzie';

  @override
  String get onlinePeopleEmpty => 'Nie ma tu jeszcze nikogo online';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · w pobliżu + okolica';

  @override
  String get peerOnlineMeshTitle => 'Ktoś w pobliżu na siatce';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name znajduje się w pobliżu siatki';
  }

  @override
  String get peerOnlineAreaTitle => 'Ktoś online w okolicy';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name jest online przez Nostr';
  }

  @override
  String get locationSheetTitle => '#kanały lokalizacyjne';

  @override
  String get channelPinsTitle => 'Przypięty';

  @override
  String get channelPinsHint =>
      'Przypinaj kanały, z których często korzystasz — pozostają na górze';

  @override
  String get channelPinTooltip => 'Przypnij ten kanał';

  @override
  String get channelUnpinTooltip => 'Odpiąć';

  @override
  String get locationSheetIntro =>
      'Rozmawiaj z osobami w pobliżu, korzystając z grubego geohasha, a nie precyzyjnego GPS. Obecność w Internecie wykorzystuje anonimowe klucze Nostr.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportować';

  @override
  String homeComposeHint(String channel) {
    return 'Wiadomość $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Wyślij do $channel — publicznie';
  }

  @override
  String get messageExpiryTitle => 'wygasa w';

  @override
  String get voiceRecordTapToStart => 'Kliknij, aby nagrać wiadomość głosową';

  @override
  String get voiceRecordTooShort =>
      'Nagrywanie jest za krótkie — spróbuj ponownie';

  @override
  String get voiceRecordFailed =>
      'Nie udało się zapisać nagrania — spróbuj ponownie';

  @override
  String get voicePttHold => 'Przytrzymaj, aby nagrać';

  @override
  String get voicePttRelease => 'Zwolnij, aby wyświetlić podgląd';

  @override
  String get voicePttRecording => 'Nagranie…';

  @override
  String get voicePttDraftReady => 'Notatka głosowa gotowa';

  @override
  String get voicePttDiscard => 'Wyrzucać';

  @override
  String get voicePttReRecord => 'Nagraj ponownie';

  @override
  String get voicePttSend => 'Wyślij notatkę głosową';

  @override
  String get voicePttPlayPreview => 'Odtwórz podgląd';

  @override
  String get voicePttStopPreview => 'Zatrzymaj podgląd';

  @override
  String get noticesBackfilling => 'Ładowanie powiadomień…';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline =>
      'Nostr offline — biuletyn potrzebuje Internetu';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Załadowano powiadomienia $count';
  }

  @override
  String get noticePublishFailed =>
      'Nie można opublikować zawiadomienia do zarządu obszaru. Sprawdź połączenie Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Zapisano lokalnie. Połącz się z pobliskim radiem mesh (lub bramą Wi‑Fi), aby inni mogli go odbierać.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Biuletyn wysłany do $count pobliskich urządzeń przez BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Widziano pobliskie radia, ale zapis BLE nie powiódł się. Pozostaw obie aplikacje otwarte na ekranie Powiadomienia i spróbuj ponownie (lub użyj przekaźnika ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Odbiornik BLE tego urządzenia nie jest gotowy. Przełącz Bluetooth i ponownie otwórz Powiadomienia.';

  @override
  String get noticeDelete => 'Usuń powiadomienie';

  @override
  String get noticeDeleteConfirmTitle => 'Usunąć to powiadomienie?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Spowoduje to usunięcie go tylko na tym urządzeniu. Inni, którzy już go otrzymali, nadal będą go widzieć.';

  @override
  String get noticeDeleted => 'Uwaga usunięta';

  @override
  String get chatNoticeHidden => 'Ogłoszenie obszarowe — otwórz Powiadomienia';

  @override
  String get identityDisplayNameTitle => 'Nazwa wyświetlana';

  @override
  String get identitySaveName => 'Zapisz nazwę';

  @override
  String get identityUserIdLabel =>
      'Identyfikator użytkownika (hasz klucza publicznego)';

  @override
  String get identityCopyHashTooltip => 'Skopiuj skrót klucza publicznego';

  @override
  String get identityMyQrTitle =>
      'Mój kod QR (identyfikator + klucz pubKey + nazwa)';

  @override
  String identityQrFailed(String error) {
    return 'Nie można utworzyć kodu QR\n$error';
  }

  @override
  String get identitySaving => 'Oszczędność…';

  @override
  String get identitySaveQr => 'Zapisz kod QR w bibliotece zdjęć';

  @override
  String get identityOpenScanner => 'Otwórz aparat, aby zeskanować kod QR';

  @override
  String get identityQrHelp =>
      'Poproś znajomego, aby zeskanował to, aby zapisać Twój klucz publiczny i (w razie potrzeby) ustawić Cię jako zweryfikowanego wystawcę';

  @override
  String get identityChatTip =>
      'Wskazówka: możesz także zeskanować kod QR na czacie, aby dodać klucz publiczny dla E2EE';

  @override
  String get infoOpen => 'O / Informacje';

  @override
  String get docsGuideTitle => 'Podręcznik użytkownika';

  @override
  String get docsGuideSubtitle => 'Otwiera się w przeglądarce';

  @override
  String get docsOpenAction => 'Otwórz przewodnik';

  @override
  String get docsOpenFailed => 'Nie można otworzyć podręcznika użytkownika';

  @override
  String get firmwareOtaGuideTitle => 'Przewodnik Flash i protokół OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Otwiera przewodnik internetowy — pliki do pobrania w formacie .bin i pełne instrukcje';

  @override
  String get firmwareWebDownloadsTitle =>
      'Pobieranie oprogramowania sprzętowego w Internecie';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Linki do poszczególnych wersji i sumy kontrolne w witrynie dokumentów';

  @override
  String get inviteCopyShortLink => 'Skopiuj krótki link';

  @override
  String get inviteShareLink => 'Udostępnij link';

  @override
  String get inviteShowFullLink => 'Pełny link';

  @override
  String get inviteCopyFullLink => 'Skopiuj pełny link';

  @override
  String get inviteLinkCopied => 'Link skopiowany';

  @override
  String get inviteLongPressHint =>
      'Naciśnij długo, aby wykonać czynności związane z łączem';

  @override
  String get inviteSendInChat => 'Wyślij ResilNet czat…';

  @override
  String get inviteSendInChatHint =>
      'Tylko osoby, dla których masz już klucz publiczny';

  @override
  String get inviteSendInChatEmpty =>
      'Nie ma jeszcze żadnych czatów z możliwością wysyłania wiadomości.\nZeskanuj kod QR, otwórz obszar/siatkę lub najpierw udostępnij link poza aplikacją.';

  @override
  String get inviteSentToChat => 'Zaproszenie wysłane na czacie';

  @override
  String get infoTabInfo => 'Informacje';

  @override
  String get infoTabSettingsHint =>
      'Otwórz Ustawienia z menu języka, E2EE i narzędzi danych';

  @override
  String get infoHowToTitle => 'Jak używać';

  @override
  String get infoHowToBody =>
      '• Stuknij ikonę kanału, aby przełączyć Czat / #mesh / Obszar\n• Wybierz miejsce, aby wybrać rozmiar geohasha\n• Wybierz osoby dla członków lub kto jest online\n• Otwórz Identity/QR od ⋮, aby osobiście wymienić klucze\n• Obszar „publiczny” wysyła zapieczętowany E2EE do każdego partnera online — a nie do pokoju z tekstem jawnym';

  @override
  String get infoFeaturesTitle => 'Cechy';

  @override
  String get infoFeatureOffline =>
      'Wiadomości offline za pośrednictwem Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Kompleksowe szyfrowanie za pomocą RSA-OAEP + AES-GCM (bez szumu)';

  @override
  String get infoFeatureMultihop =>
      'Wiadomości mogą przeskakiwać przez pobliskie urządzenia równorzędne, aby dotrzeć dalej';

  @override
  String get infoFeatureBridge =>
      'Siatka hybrydowa ↔ internet (Nostr) dla zaklejonych kopert';

  @override
  String get infoFeatureGeo =>
      'Lokalne kanały geohash dla osób w pobliżu (discovery UX)';

  @override
  String get infoFeatureNotices => 'Powiadomienia z wygaśnięciem #mesh i Area';

  @override
  String get infoPrivacyTitle => 'Prywatność';

  @override
  String get infoPrivacyNoRoom =>
      'Brak wioski/publicznego pokoju rozmów w trybie zwykłego tekstu na kablu';

  @override
  String get infoPrivacyFanout =>
      'Wysyłanie obszaru = zapieczętowane rozsyłanie w trybie fan-out 1:1 do urządzeń równorzędnych ze znanymi kluczami publicznymi';

  @override
  String get infoPrivacyPresence =>
      'Obecność obszaru internetowego wykorzystuje efemeryczne klucze Nostr';

  @override
  String get infoSymbolsTitle => 'Symbolika';

  @override
  String get infoSymBle => 'Bezpośrednie łącze Bluetooth';

  @override
  String get infoSymMesh => 'Osiągalny przez siatkę (inne do przodu)';

  @override
  String get infoSymInternet =>
      'Przez Internet (Nostr) — w zapieczętowanych kopertach';

  @override
  String get infoSymBridge => 'Dotarliśmy przez most sieciowy mesh↔internet';

  @override
  String get infoSymOffline => 'Offline — w tej chwili nieosiągalny';

  @override
  String get infoSymInArea => 'W obszarze tego kanału lokalizacji';

  @override
  String get infoSymE2eeOk => 'Sesja szyfrowana od końca do końca';

  @override
  String get infoSymE2eeFail =>
      'Szyfrowanie niedostępne — nie wysyłaj poufnego tekstu';

  @override
  String get infoSymVerified => 'Tożsamość zweryfikowana/znany klucz';

  @override
  String get infoSymBlocked => 'Zablokowany';

  @override
  String get infoSymUnread => 'Nieprzeczytana wiadomość prywatna';

  @override
  String get infoEmergencyTitle => 'Tryb awaryjny';

  @override
  String get infoEmergencyBody =>
      'Kliknij trzykrotnie tytuł ResilNet na ekranie głównym, aby wyczyścić wiadomości, klucze i tożsamość na tym urządzeniu.';

  @override
  String get infoLegendNote =>
      'Niektóre ikony ścieżek są tutaj udokumentowane dla przejrzystości; znaczniki dostawy na czacie pozostają głównym statusem wysyłania.';

  @override
  String get dangerZoneTitle => 'Strefa niebezpieczeństwa';

  @override
  String get dangerZoneSubtitle =>
      'Usuwa wiadomości, klucze szyfrowania, Nostr tożsamość, elementy równorzędne i pseudonimy z tego urządzenia. Skonfigurujesz ponownie.';

  @override
  String get panicWipeTitle => 'Wycieranie awaryjne';

  @override
  String get panicWipeSubtitle =>
      'Usuń wszystko lokalne — tak samo, jak trzykrotne dotknięcie tytułu głównego (podwójne dotknięcie odświeża radio)';

  @override
  String get panicWipeConfirmTitle => 'Wyczyścić wszystkie dane lokalne?';

  @override
  String get panicWipeConfirmBody =>
      'Spowoduje to trwałe usunięcie czatów, kluczy i tożsamości z tego telefonu.\nWspółpracownicy muszą ponownie wymienić klucze QR na Twoją nową tożsamość.\nTego nie można cofnąć.';

  @override
  String get panicWipeAction => 'Wytrzyj wszystko';

  @override
  String get panicWipeSnack =>
      'Tożsamość lokalna została wyczyszczona — skonfiguruj ponownie';

  @override
  String panicWipeFailed(String error) {
    return 'Czyszczenie nie powiodło się: $error';
  }

  @override
  String get meshBridgeTitle => 'Most siatkowy';

  @override
  String get meshBridgeSubtitle =>
      'Gdy ta opcja jest włączona (domyślnie), zapieczętowane koperty mogą używać jednocześnie siatki BLE i Internetu (Nostr), dzięki czemu pobliskie wyspy siatkowe mogą się łączyć. Gdy opcja ta jest wyłączona, wysyłki korzystają tylko z jednej ścieżki — nigdy nie przesyłają zwykłego tekstu do sieci.';

  @override
  String get favoritesTitle => 'Ulubione';

  @override
  String get favoritesAdd => 'Dodaj do ulubionych';

  @override
  String get favoritesRemove => 'Usuń z ulubionych';

  @override
  String get favoritesEmpty =>
      'Nie ma jeszcze ulubionych — oznacz znajomego na liście członków';

  @override
  String get favoritesNearbyTitle => 'Ulubiony w pobliżu';

  @override
  String favoritesNearbyBody(String name) {
    return '$name znajduje się w pobliżu siatki';
  }

  @override
  String get favoritesInAreaTitle => 'Ulubiony w okolicy';

  @override
  String favoritesInAreaBody(String name) {
    return '$name jest online w tym obszarze';
  }

  @override
  String get topologyTitle => 'Topologia siatki';

  @override
  String get topologySubtitle =>
      'Ogłaszanie połączeń równorzędnych i wskazówek dotyczących połączeń z siatki (tylko do odczytu)';

  @override
  String get topologyConnectedNow => 'Połączono teraz (BLE)';

  @override
  String get topologyNearby => 'W pobliżu (BLE)';

  @override
  String get topologyKnown => 'Znani rówieśnicy';

  @override
  String get topologyEmpty =>
      'Żaden inny użytkownik nie nauczył się jeszcze — pozostań w pobliżu z włączonym BLE';

  @override
  String get topologyYou => 'Ty';

  @override
  String topologyStats(int peers, int links) {
    return '$peers równorzędni · $links linki';
  }

  @override
  String get topologyGraphHint =>
      'Szacowane na podstawie odkrycia siatki w pobliżu — Twoje urządzenie jest podświetlone. Stuknij partnera, aby otworzyć czat.';

  @override
  String get topologyOpen => 'Topologia siatki';

  @override
  String get slashHelpTitle => 'Polecenia';

  @override
  String get slashHelpBody =>
      '/help — ta lista\n/who — osoby online na bieżącym kanale\n/drop <tekst> — przypnij tutaj zapieczętowane powiadomienie (rozszerzenie E2EE)\n\nPełny przewodnik: skorzystaj z Otwórz przewodnik poniżej lub Ustawienia → Podręcznik użytkownika.';

  @override
  String get slashWhoEmpty => 'W tej chwili nikt nie jest online na tym kanale';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Sposób użycia: /upuść tekst notatki';

  @override
  String slashDropDone(String channel) {
    return 'Powiadomienie o wycofaniu w dniu $channel';
  }

  @override
  String get slashUnknown => 'Nieznane polecenie — spróbuj /help';

  @override
  String get announceOpen => 'Ogłoszenia';

  @override
  String get announceTitle => 'Ogłoszenia';

  @override
  String get announceEmpty =>
      'Nie ma jeszcze tablic — utwórz ją, aby zamieszczać powiadomienia o zablokowaniu lub otwarciu';

  @override
  String get announceCreate => 'Utwórz tablicę';

  @override
  String get announceCreateHint => 'Nazwa tablicy';

  @override
  String get announceDefaultTitle => 'Zarząd wspólnoty';

  @override
  String get announceSettings => 'Ustawienia tablicy';

  @override
  String get announceAllowLocked =>
      'Zezwalaj na zablokowane (szyfrowane) posty';

  @override
  String get announceAllowLockedSub =>
      'Zaszyfrowane kluczem tablicy — czytniki potrzebują dostępu';

  @override
  String get announceAllowOpen => 'Zezwalaj na posty otwarte (zwykły tekst).';

  @override
  String get announceAllowOpenSub =>
      'Nie E2EE — czytelny na siatce/przekaźnikach. Domyślnie wyłączone.';

  @override
  String get announceComposeHint => 'Napisz ogłoszenie…';

  @override
  String get announceMediaInternetOnly =>
      'Powiadomienia fotograficzne/głosowe wysyłane przez Internet (nie BLE)';

  @override
  String get announceNeedInternet =>
      'Połącz się z Internetem, aby wysyłać powiadomienia fotograficzne lub głosowe';

  @override
  String announceVoiceFailed(String error) {
    return 'Nie można nagrać głosu: $error';
  }

  @override
  String get announceImageTooLarge => 'Obraz jest za duży (maks. ~180 KB)';

  @override
  String get announcePlayVoice => 'Odtwórz notatkę głosową';

  @override
  String get announceImageLabel => '📷 Obraz';

  @override
  String get announceAudioLabel => '🎤 Notatka głosowa';

  @override
  String get announceModeLocked => 'Zamknięty';

  @override
  String get announceModeOpen => 'Otwarte';

  @override
  String get announceOpenBadge => 'OTWARTE · nieszyfrowane';

  @override
  String get announceLockedBadge => 'Zamknięty';

  @override
  String get announceLockedPlaceholder =>
      'Zaszyfrowane — poproś o dostęp do odczytu';

  @override
  String get announceRequestAccess => 'Poproś o dostęp';

  @override
  String get announceRequestSent =>
      'Prośba o dostęp wysłana do właściciela tablicy';

  @override
  String get announceRequestFailed =>
      'Nie można poprosić o dostęp (potrzebny jest klucz publiczny właściciela)';

  @override
  String get announceOpenConfirmTitle => 'Opublikować bez szyfrowania?';

  @override
  String get announceOpenConfirmBody =>
      'Otwarte posty nie są E2EE. Każdy na ścieżce (siatka/przekaźniki) może je odczytać. Kontynuować?';

  @override
  String get announcePostAction => 'Post';

  @override
  String get announcePendingRequests => 'Żądania dostępu';

  @override
  String get announceApprove => 'Zatwierdzić';

  @override
  String get announceDeny => 'Zaprzeczyć';

  @override
  String get announceGranted =>
      'Możesz przeczytać zablokowane posty na tym forum';

  @override
  String get announceOwner => 'Jesteś właścicielem tej tablicy';

  @override
  String get announceCopyInvite => 'Skopiuj tekst zaproszenia';

  @override
  String get announceShowInviteQr => 'Pokaż kod QR zaproszenia';

  @override
  String get announceScanInviteQr => 'Zeskanuj zaproszenie na tablicę QR';

  @override
  String get announceFollow => 'Obserwuj tablicę z zaproszenia';

  @override
  String get announceFollowHint =>
      'Wklej tekst zaproszenia lub link ResilNet od właściciela';

  @override
  String get announceFollowOk => 'Następna tablica';

  @override
  String announceFollowOkNamed(String title) {
    return 'Teraz obserwuję „$title”';
  }

  @override
  String get announceFollowFail =>
      'Zaproszenie jest nieprawidłowe lub uszkodzone';

  @override
  String get announceInviteCopied => 'Tekst zaproszenia został skopiowany';

  @override
  String get announceInviteSaveQr => 'Zapisz kod QR';

  @override
  String get announceInviteShare => 'Udostępnij kod zaproszenia';

  @override
  String get announceFollowFromCompose =>
      'W skrzynce wiadomości wykryto zaproszenie na tablicę';

  @override
  String get peerConfirmAddTitle => 'Dodać członka sieci?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Dodać „$name” do ich klucza publicznego, aby móc wysyłać do nich prywatne wiadomości?';
  }

  @override
  String get peerConfirmAdd => 'Dodaj członka';

  @override
  String peerAddedOk(String name) {
    return 'Dodano $name do członków sieci';
  }

  @override
  String get peerAddFromCompose =>
      'W oknie komunikatu wykryto tożsamość/klucz publiczny';

  @override
  String get peerHashCopied => 'Skopiowano skrót klucza publicznego';

  @override
  String get peerHashOpenChat => 'Otwórz czat';

  @override
  String get peerHashAddHint =>
      'Hash skopiowany. Poproś ich o udostępnienie linku identyfikacyjnego lub kodu QR, aby móc dodać pełny klucz publiczny dla E2EE.';

  @override
  String get peerQrNoCode => 'Na tym obrazie nie znaleziono ResilNet QR';

  @override
  String identityInviteSharePreamble(String name) {
    return 'Tożsamość ResilNet: „$name”\nOtwórz link lub wklej go na czacie → Dodaj członka\nLub zeskanuj kod QR tożsamości.';
  }

  @override
  String get identityShareInvite => 'Udostępnij link tożsamości';

  @override
  String get identityInviteCopied => 'Link tożsamości skopiowany';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Zaproszenie na tablicę: „$title”\nOtwórz ResilNet → Tablice społeczności → Obserwuj z zaproszenia\nLub zeskanuj kod QR / kliknij poniższy link.';
  }

  @override
  String get announceConfirmFollowTitle => 'Obserwujesz tę tablicę?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Obserwujesz „$title” z tego zaproszenia?';
  }

  @override
  String get announceConfirmFollow => 'Podążać';
}

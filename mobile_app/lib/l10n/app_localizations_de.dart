// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Erfrischend ResilNet…';

  @override
  String get appRefreshed =>
      'Aktualisiert – Funkgeräte und Erkennung neu gestartet';

  @override
  String appRefreshFailed(String error) {
    return 'Aktualisierung fehlgeschlagen: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Doppeltippen = sanfte Aktualisierung. Langes Drücken = harte Wiederherstellung. Dreifaches Tippen = Notfalllöschung.';

  @override
  String get softRefreshTipTitle => 'Wenn sich ResilNet feststeckt';

  @override
  String get softRefreshTipBody =>
      'Tippen Sie zweimal auf ResilNet (oben links), um eine Softradio-Aktualisierung durchzuführen. Wenn es immer noch nicht funktioniert: Drücken Sie lange auf den Titel, verwenden Sie ⋮ → Hard Recovery oder Einstellungen. Dreifaches Tippen dient nur zum Löschen im Notfall.';

  @override
  String get softRefreshTipGotIt => 'Habe es';

  @override
  String get infoSoftRefreshTitle => 'Wenn die App feststeckt';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Tippen Sie zweimal auf ResilNet (oben links) → Radios und Personen in der Nähe sanft aktualisieren';

  @override
  String get infoSoftRefreshStepHard =>
      'Stecken Sie immer noch fest? Drücken Sie lange auf den Titel oder ⋮ / Einstellungen → Hard Recovery';

  @override
  String get infoSoftRefreshStepWait =>
      'Warten Sie auf das Ergebnis der Snackbar und versuchen Sie es dann erneut. Beim Zurücksetzen der Sitzung bleiben Ihre Schlüssel erhalten.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Dreifaches Tippen = Notfalllöschung (lokale Daten löschen) – nur wenn beabsichtigt';

  @override
  String get appRecoverySection => 'App-Wiederherstellung';

  @override
  String get appRecoverySectionSubtitle =>
      'Verwenden Sie diese Option, wenn sich die App eingefroren anfühlt. Sanft = Titel zweimal antippen. Eine harte Erholung ist stärker. Durch das Zurücksetzen der Sitzung werden Dienste neu gestartet, ohne dass die Schlüssel gelöscht werden.';

  @override
  String get appHardRecoverAction => 'Schwer erholen';

  @override
  String get appHardRecovering => 'Es fällt mir schwer, mich zu erholen …';

  @override
  String get appSessionResetAction => 'Sitzung zurücksetzen';

  @override
  String get appSessionResetRunning => 'Sitzung wird zurückgesetzt…';

  @override
  String get appSessionResetConfirmTitle => 'Sitzung zurücksetzen?';

  @override
  String get appSessionResetConfirmBody =>
      'Startet ResilNet-Dienste auf diesem Gerät neu. Ihre Identitätsschlüssel bleiben erhalten.';

  @override
  String get appRecoveryBusy => 'Wiederherstellung läuft bereits…';

  @override
  String get appRecoveryOk => 'Wiederherstellung abgeschlossen';

  @override
  String get appRecoveryPartial =>
      'Die Wiederherstellung wurde abgeschlossen und einige Schritte wurden übersprungen. Versuchen Sie es erneut, wenn die Wiederherstellung immer noch nicht funktioniert';

  @override
  String get appRecoveryFailed =>
      'Wiederherstellung fehlgeschlagen – versuchen Sie es mit einem Sitzungs-Reset oder erzwingen Sie das Beenden der App vom Betriebssystem';

  @override
  String get localWifiTitle => 'Lokal Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Verknüpfen Sie Geräte in der Nähe ohne Internet – genau wie in einem LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Nicht das ESP32 LoRa Gateway SoftAP. Dies ist nur Telefon↔Telefon/LAN.';

  @override
  String get localWifiUnavailable =>
      'Local Wi‑Fi ist noch nicht bereit – warten Sie auf den App-Start.';

  @override
  String get lxmfBridgeTitle => 'Heimatknoten';

  @override
  String get lxmfBridgeSubtitle =>
      'Optionaler Mac oder Pi auf Ihrem Wi‑Fi, der versiegelte Chats weiterleitet. Standardmäßig deaktiviert. Ersetzt nicht die Ende-zu-Ende-Verschlüsselung.';

  @override
  String get lxmfBridgeEnable => 'Verwenden Sie den Home-Knoten';

  @override
  String get lxmfBridgeDisabledHint =>
      'Nur aktivieren, wenn die Bridge-App auf einem Mac oder Pi in diesem Netzwerk ausgeführt wird.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online – $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Der Heimatknoten kann nicht erreicht werden – $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Adresse des Heimatknotens';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP oder http://IP:Port — Beispiel 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF Ziel (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Status speichern und aktualisieren';

  @override
  String get lxmfBridgeLabHint => 'Fortgeschritten: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Einstellungen für den Heimatknoten';

  @override
  String get lxmfBridgeCheckConnection => 'Verbindung prüfen';

  @override
  String get lxmfBridgeStatusOnline => 'Verbunden mit dem Heimatknoten';

  @override
  String get lxmfBridgeStatusOffline => 'Home-Knoten nicht erreichbar';

  @override
  String get lxmfBridgeYourDest =>
      'Die Adresse dieses Knotens (mit Freunden teilen)';

  @override
  String get lxmfBridgeCopyDest => 'Adresse kopieren';

  @override
  String get lxmfBridgeDestCopied => 'Adresse kopiert';

  @override
  String get lxmfBridgeLinkedPeers => 'Verlinkte Freunde';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Jeder Freund benötigt einmal seine Heimatknotenadresse. Dann können versiegelte Chats diesen Weg nutzen.';

  @override
  String get lxmfBridgeNoLinks => 'Noch keine Freunde verlinkt.';

  @override
  String get lxmfBridgeAddLink => 'Verlinke einen Freund';

  @override
  String get lxmfBridgePickPeer => 'Freund';

  @override
  String get lxmfBridgePeerDest => 'Ihre Heimatknotenadresse';

  @override
  String get lxmfBridgePeerDestHint =>
      '32-stelliger Code von ihrem Home-Knotenbildschirm';

  @override
  String get lxmfBridgeInvalidDest =>
      'Diese Adresse scheint ungültig zu sein. Fügen Sie den vollständigen Code von ihrem Heimatknoten ein.';

  @override
  String get lxmfBridgeRemoveLink => 'Verknüpfung aufheben';

  @override
  String get lxmfBridgeSaveLink => 'Speichern';

  @override
  String get lxmfBridgeLinkSaved => 'Freund verlinkt';

  @override
  String get lxmfBridgeNoPeers =>
      'Noch keine nachrichtenfähigen Kontakte – fügen Sie zuerst einen Freund hinzu.';

  @override
  String get lxmfBridgeHelp =>
      'Lassen Sie die Bridge auf dem Mac/Pi laufen. Dieser Pfad bleibt in Ihrem LAN – er ist nicht LoRa und ersetzt weder Internet noch Bluetooth Mesh.';

  @override
  String get localWifiModeHotspot => 'Nahe';

  @override
  String get localWifiModeRouter => 'Router';

  @override
  String get localWifiHotspotIntro =>
      'Ein Gerät teilt sich einen persönlichen Hotspot. Andere treten diesem Hotspot bei und ResilNet findet sie dann im lokalen Netzwerk.';

  @override
  String get localWifiHostAction => 'Netzwerk erstellen (Host)';

  @override
  String get localWifiJoinAction => 'Treten Sie dem Netzwerk bei';

  @override
  String get localWifiHostSteps =>
      '1. Öffnen Sie die iOS-/Android-Einstellungen und aktivieren Sie den persönlichen Hotspot (oder die Internetfreigabe).\n2. Teilen Sie Ihren Freunden den Hotspot-Namen (und das Passwort) mit.\n3. Kehren Sie hierher zurück und tippen Sie auf „Hotspot ist eingeschaltet – warten Sie“.';

  @override
  String get localWifiHostReady =>
      'Hotspot ist eingeschaltet – fangen Sie an zu warten';

  @override
  String get localWifiHostWaiting =>
      'Ich warte darauf, dass Freunde beitreten …';

  @override
  String get localWifiJoinSteps =>
      '1. Öffnen Sie die Systemeinstellungen und treten Sie dem persönlichen Hotspot Ihres Freundes bei.\n2. Kehren Sie hierher zurück und tippen Sie auf „Ich bin verbunden – Suchen“.';

  @override
  String get localWifiJoinReady => 'Ich bin verbunden – suchen';

  @override
  String get localWifiRouterIntro =>
      'Verbinden Sie jedes Gerät mit demselben Wi‑Fi-Router/AP. Der Router benötigt kein Internet – nur ein gemeinsam genutztes lokales Netzwerk.';

  @override
  String get localWifiRouterSearch => 'Suchen Sie nach diesem Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi-Informationen aktualisieren';

  @override
  String get localWifiRouterNoWifiTitle => 'Nicht auf Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Fügen Sie Wi‑Fi des Routers in den Systemeinstellungen hinzu und suchen Sie dann erneut.';

  @override
  String get localWifiDiscovering => 'Suche auf lokalem Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Geräte in diesem Netzwerk';

  @override
  String get localWifiStop => 'Stoppen';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi-Name nicht verfügbar';

  @override
  String get localWifiStubBanner => 'Warten auf LAN-Buchse…';

  @override
  String get localWifiLiveBanner =>
      'LAN-Erkennung live (UDP) – Ankündigung + versiegelter Chat zu diesem Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Noch keine Geräte.\nÜberprüfen Sie, ob Freunde Ihrem Hotspot beigetreten sind und den Zugriff auf das lokale Netzwerk zugelassen haben.';

  @override
  String get localWifiEmptyRouter =>
      'Noch keine Geräte.\nGleiche SSID? Lokales Netzwerk erlaubt? Einige Router blockieren den Datenverkehr von Gerät zu Gerät (AP-Isolierung).';

  @override
  String get localWifiIsolationHelp => 'Warum können wir uns nicht finden?';

  @override
  String get localWifiIsolationTitle => 'Der Router kann Clients isolieren';

  @override
  String get localWifiIsolationBody =>
      'Wenn die AP-/Client-Isolation (oder ein Gastnetzwerk) aktiviert ist, können Telefone auf demselben Wi‑Fi nicht kommunizieren. Schalten Sie die Isolation aus, verwenden Sie die Haupt-SSID oder wechseln Sie in den Nearby-Modus (Hotspot).';

  @override
  String get localWifiPeerReady => 'Bereit zum Chatten (hat Schlüssel)';

  @override
  String get localWifiPeerNeedKey =>
      'Gefunden – QR scannen, um Schlüssel auszutauschen';

  @override
  String get localWifiErrorTitle => 'Lokaler Wi‑Fi-Fehler';

  @override
  String get localWifiErrorBody =>
      'Etwas ist schief gelaufen. Stoppen Sie und versuchen Sie es erneut.';

  @override
  String get preparingSystem => 'System wird vorbereitet…';

  @override
  String get bootFailedTitle => 'Konnte nicht gestartet werden';

  @override
  String get retry => 'Versuchen Sie es erneut';

  @override
  String get bootRecoveryAction =>
      'Neue Identität starten (lokale Daten löschen)';

  @override
  String get bootRecoveryConfirmTitle => 'Neue Identität beginnen?';

  @override
  String get bootRecoveryConfirmBody =>
      'Dadurch werden lokale Chats, Schlüssel und Identität auf diesem Gerät dauerhaft gelöscht.\nGleichaltrige müssen Ihren QR erneut mit Ihrer neuen Identität scannen.\nDies kann nicht rückgängig gemacht werden.';

  @override
  String get bootRecoveryRunning => 'Lokale Identität zurücksetzen…';

  @override
  String get bootRecoverySuccess =>
      'Das Zurücksetzen der lokalen Identität ist abgeschlossen';

  @override
  String bootRecoveryFailed(String error) {
    return 'Identität konnte nicht zurückgesetzt werden: $error';
  }

  @override
  String get cancel => 'Stornieren';

  @override
  String get save => 'Speichern';

  @override
  String get close => 'Schließen';

  @override
  String get start => 'Start';

  @override
  String get send => 'Schicken';

  @override
  String get settings => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get languageSubtitle =>
      'Standardmäßig folgt die App Ihrer Telefonsprache (sofern unterstützt). Andere Sprachen greifen auf Englisch zurück. Sie können hier auch eine Sprache sperren.';

  @override
  String get languageSystem => 'Systemstandard';

  @override
  String get languageThai => 'Thailändisch';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get notificationsTooltip => 'Benachrichtigungseinstellungen';

  @override
  String get enableMessageNotifications =>
      'Aktivieren Sie Nachrichtenbenachrichtigungen';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1-Nachrichten und Personen online (lokale Benachrichtigungen)';

  @override
  String get networkMembersTooltip => 'Netzwerkmitglieder';

  @override
  String get identityQrTooltip => 'Identität / QR';

  @override
  String get feedDirects => 'Chatten';

  @override
  String get feedMesh => '#mesh';

  @override
  String get feedGeo => 'Bereich';

  @override
  String get feedDirectsSubtitle => 'Private E2EE-Nachrichten';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'Kollegen in der Nähe (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'Geohash-Entdeckungskanal';

  @override
  String get peerIdHint =>
      'Fügen Sie die Empfänger-ID (Public Key Hash) ein, um einen Chat zu starten';

  @override
  String get directsEmpty =>
      'Noch keine Chats – scannen Sie einen QR oder fügen Sie eine Empfänger-ID ein, um zu beginnen\nNachrichten werden vor dem Versand mit E2EE versiegelt (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • Tippen Sie, um den Chat zu öffnen';

  @override
  String get meshIntro =>
      'Kollegen im Bereich BLE – tippen Sie für einen privaten E2EE-Chat (kein öffentliches Verfassen auf #mesh)\nSendet über Hybrid-Router (BLE + LoRa + Nostr wenn online)';

  @override
  String get meshEmptyRunning =>
      'Noch keine Peers in der Nähe – öffnen Sie die App auf einem anderen Gerät innerhalb der Reichweite von BLE';

  @override
  String get meshEmptyStopped =>
      'BLE wird nicht ausgeführt – erteilen Sie die Bluetooth-/Standortberechtigung';

  @override
  String get meshNearbyPrefix => 'Nahe';

  @override
  String get meshRetentionTitle => 'Nachrichten automatisch löschen';

  @override
  String get meshRetentionSubtitle =>
      'Der ältere lokale Chatverlauf wird automatisch entfernt';

  @override
  String get meshRetentionKeep => 'Halten';

  @override
  String get meshRetention1Day => '1 Tag';

  @override
  String get meshRetention3Days => '3 Tage';

  @override
  String get meshRetention7Days => '7 Tage';

  @override
  String get refreshLocationTooltip => 'Standort aktualisieren';

  @override
  String get geoIntro =>
      'Personen, die in diesem Geohash online sind, können 1:1 oder mit einem öffentlichen Fan-Out des Bereichs benachrichtigt werden (immer noch versiegeltes E2EE pro Peer – kein Klartext).';

  @override
  String geoEmpty(String channel) {
    return 'Noch niemand online in $channel\nVerwenden Sie Transport → Internet/Auto, warten Sie auf Nostr, aktualisieren Sie den Standort';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online in $channel • Tippen Sie für 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'In der Nähe (Wartebereichspräsenz) • Tippen Sie für 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Gesehen auf Nostr in $channel • Nur Discovery (Legacy)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Anonyme Legacy-Präsenz – Warten Sie auf einen gebundenen Peer oder tauschen Sie QR aus';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE in der Nähe – QR scannen, um 1:1 E2EE zu starten';

  @override
  String get geoInternetDiscoverHint =>
      'Bereich Interneterkennung muss mit Nostr verbunden sein (Einstellungen → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Standort noch nicht geklärt – GPS zulassen und aktualisieren, um Ihren Geohash auf Nostr zu veröffentlichen';

  @override
  String get geoEmptyNeedsPermission =>
      'Standortberechtigung verweigert – erlauben Sie ResilNet in Einstellungen → Datenschutz → Standort';

  @override
  String get geoEmptyServicesDisabled =>
      'Ortungsdienste sind deaktiviert – aktivieren Sie sie in den Einstellungen';

  @override
  String get geoEmptyNoGpsFix =>
      'Es konnte kein GPS-Fix ermittelt werden (üblich bei Wi‑Fi iPads) – stellen Sie den Geohash unten manuell ein';

  @override
  String get geoEmptyTeleportHint =>
      'Tippen Sie auf das Ortssymbol → geben Sie einen Geohash ein (z. B. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Geohash festlegen';

  @override
  String get geoTeleportHint =>
      'Kein GPS? Geben Sie das Geohash-Präfix ein (2–7 Zeichen, z. B. w5) und tippen Sie auf Teleport';

  @override
  String get geoTeleportInvalid =>
      'Ungültiger Geohash – nur Base32-Buchstaben/Zahlen verwenden (z. B. w5 oder w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Bereich auf $channel gesetzt';
  }

  @override
  String geoManualActive(String channel) {
    return 'Manueller Bereich: $channel (GPS-Aktualisierung wird überschrieben)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr nicht bereit – tippen Sie auf „Erneut verbinden“ (0/0, bis die Initialisierung erfolgreich ist).';

  @override
  String get geoEmptyMeshOnly =>
      'Der Transport erfolgt nur über Mesh – wechseln Sie zu Internet oder Auto, um Peers über Nostr zu erkennen';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Noch niemand in $channel – lassen Sie Area + Internet auf beiden Geräten geöffnet und warten Sie ca. 60 Sekunden';
  }

  @override
  String get geoChannelFallback => '#Bereich';

  @override
  String get geoRefreshLocation => 'Standort aktualisieren';

  @override
  String get settingsClearLocationTitle => 'Klarer Standort';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS/Teleport-Geohash entfernen (Bereich wird zu #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Standort löschen?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Löscht den auf diesem Gerät gespeicherten Geohash. Anschließend können Sie GPS aktualisieren oder erneut teleportieren.';

  @override
  String get settingsClearLocationAction => 'Klarer Standort';

  @override
  String get settingsClearLocationSnack => 'Standort gelöscht';

  @override
  String get chatVoiceTooLarge => 'Sprachnotiz zu groß – maximal ~30 Sekunden';

  @override
  String get chatVoiceNeedInternet =>
      'Sprachnotiz benötigt Internet (Nostr) – zu groß für BLE allein';

  @override
  String get chatVoiceSentInternet => 'Über das Internet gesendete Sprachnotiz';

  @override
  String get noticeAnonMention => 'erwähnen';

  @override
  String get noticeAnonDm => 'Direktnachricht';

  @override
  String get noticeAnonHug => 'Umarmung';

  @override
  String get noticeAnonSlap => 'schlagen';

  @override
  String get noticeAnonBlock => 'Block';

  @override
  String get noticeAnonNeedKey =>
      'Noch kein öffentlicher Schlüssel – tauschen Sie zuerst QR gegen 1:1 aus';

  @override
  String get noticeAnonActionSent => 'Gesendet';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Blockiert $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*Umarmungen $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* Ohrfeigen $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr erneut verbinden';

  @override
  String get nostrSectionTitle => 'Nostr Relais';

  @override
  String get nostrSectionSubtitle =>
      'Internet-Messaging und Bereichserkennung nutzen diese Relays. Tippen Sie auf „Erneut verbinden“, wenn der Status offline bleibt.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Verbunden $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline – Relais aufgelistet, aber keines verbunden';

  @override
  String get nostrStatusNotInit =>
      'Nicht gestartet (0/0) – tippen Sie zum Initialisieren auf „Erneut verbinden“.';

  @override
  String get nostrReconnectAction => 'Nostr erneut verbinden';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr verbunden ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Immer noch offline – überprüfen Sie Wi‑Fi/zellulär oder versuchen Sie es erneut';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Fehlgeschlagen: $error';
  }

  @override
  String get nostrReconnecting => 'Anschließen an Relais…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) in $channel • Versiegelter Chat bereit';
  }

  @override
  String get transportModeTitle => 'Flächentransport';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE in der Nähe (Radio), wenn keine Nostr · Internet & Auto = Nostr Personenliste';

  @override
  String get transportModeMesh => 'Netz';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint =>
      'Öffentliche Nachricht an alle Online-Nutzer in diesem Bereich';

  @override
  String get geoPublicSend => 'Öffentlich';

  @override
  String geoPublicHelp(int count) {
    return 'Versiegelter Fanout an $count Online-Peer(s) – jeder erhält einen privaten Umschlag';
  }

  @override
  String geoPublicSent(int count) {
    return 'Wird an $count Peer(s) in diesem Bereich gesendet';
  }

  @override
  String get geoPublicSentNone =>
      'Keine nachrichtenfähigen Peers online – öffnen Sie Area/Mesh mit Peers, die über Schlüssel verfügen, oder warten Sie auf BLE/Nostr';

  @override
  String get areaPublicBadge => 'Bereich öffentlich';

  @override
  String get geoErrorPermission =>
      'Standort konnte nicht gelesen werden – überprüfen Sie die Standortberechtigung';

  @override
  String get geoPrecisionRegion => 'Region';

  @override
  String get geoPrecisionProvince => 'Provinz';

  @override
  String get geoPrecisionCity => 'Stadt';

  @override
  String get geoPrecisionNeighborhood => 'Nachbarschaft';

  @override
  String get geoPrecisionBlock => 'Block';

  @override
  String get aliasTitle => 'Spitznamen festlegen (Kontaktalias)';

  @override
  String get aliasHintBody =>
      'Dieser Alias wird nur auf diesem Gerät gespeichert (nur lokal).\nEs wird niemals mit E2EE-Verkehr gesendet';

  @override
  String get aliasLabel => 'Spitzname';

  @override
  String get aliasHint => 'z.B. „Dorfvorsteher“, „P’Somchai“…';

  @override
  String get settingsDevices => 'Geräte';

  @override
  String get settingsFirmwareTitle =>
      'ESP32-Firmware herunterladen/aktualisieren';

  @override
  String get settingsFirmwareSubtitle =>
      'Laden Sie .bin-Dateien herunter und aktualisieren Sie das ESP32-Board über OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic-Brücke';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Nur-Text-A/B-Brücke – nicht ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Verschieben Sie kurzen Klartext zwischen Meshtastic und ResilNet. Die Modi A und B können nicht gleichzeitig ausgeführt werden. Dabei handelt es sich nicht um eine Ende-zu-Ende-Verschlüsselung.';

  @override
  String get mtBridgeModeLabel => 'Modus';

  @override
  String get mtBridgeModeOff => 'Aus';

  @override
  String get mtBridgeModeA => 'Nehmen Sie A ein';

  @override
  String get mtBridgeModeB => 'Ausgang B';

  @override
  String get mtBridgeModeOffShort => 'Aus';

  @override
  String get mtBridgeModeAShort => 'In A';

  @override
  String get mtBridgeModeBShort => 'Aus B';

  @override
  String get mtBridgeMutexHint =>
      'Wenn Sie einen Modus auswählen, wird der andere Modus automatisch ausgeschaltet. Gleichzeitiges A+B wird nicht unterstützt.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (Protokollierung)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Eingehender Text wird unter „Benachrichtigungen“ als #meshtastic angezeigt. Mesh Relay ist optional (standardmäßig deaktiviert).';

  @override
  String get mtBridgeRelayTitle => 'Weiterleitung auch auf ResilNet Mesh';

  @override
  String get mtBridgeRelayHint =>
      'Wenn diese Option aktiviert ist, werden signierte öffentliche Bulletins gesendet. Aus = nur Benachrichtigungen dieses Telefons.';

  @override
  String get mtBridgeSimulateHint => 'Demo-Nachricht';

  @override
  String get mtBridgeSimulate => 'Meshtastic-Nachricht simulieren';

  @override
  String get mtBridgeIngestOk =>
      'In Benachrichtigungen aufgenommen (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Warnung: Hier gesendete Nachrichten sind NICHT ResilNet E2EE. Jeder im Pfad Meshtastic kann sie lesen.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Text zur Veröffentlichung';

  @override
  String get mtBridgeSend => 'Senden an Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'In der Warteschlange für Meshtastic (siehe Protokoll/Verlauf)';

  @override
  String get mtBridgeLastEgress => 'Letzter Ausstieg';

  @override
  String get mtBridgeEgressHistory => 'Kürzlicher Ausstieg';

  @override
  String get mtBridgeOffHint =>
      'Aktivieren Sie „Ingest“ (A) oder „Egress“ (B), um die Bridge zu verwenden.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · nicht E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Verwenden Sie den MQTT-Transport';

  @override
  String get mtBridgeUseMqttHint =>
      'Aus = nur Demo-Protokollierung (MQTT eingehend ignoriert). Ein = MQTT für Aufnahme/Ausgang, wenn verbunden.';

  @override
  String get mtBridgeMqttHost => 'Broker-Host';

  @override
  String get mtBridgeMqttPort => 'Hafen';

  @override
  String get mtBridgeMqttTls => 'Verwenden Sie TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typischer Port 8883. Verwendet Systemzertifikate; schlägt bei Handshake-Fehlern fehl.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Automatische Wiederverbindung';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Wenn diese Option aktiviert ist, versucht der Client, die Verbindung nach Verbindungsabbrüchen wiederherzustellen. Der Status zeigt Verbindung bis zur Wiederherstellung an.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Themenhelfer';

  @override
  String get mtBridgeMqttRegion => 'Regionspräfix (optional)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Wenn diese Option festgelegt ist, erstellt „Anwenden“ das Stammverzeichnis als „msh/<region>/2/json“ neu (überschreibt das Themenstammverzeichnis).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON-Themenstamm';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Name des Downlink-Kanals';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Root anwenden → Themen abonnieren/veröffentlichen';

  @override
  String get mtBridgeMqttAdvanced => 'Erweitert MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, erneute Verbindung, Themen, Anmeldeinformationen';

  @override
  String get mtBridgeMqttTopicIn => 'Thema abonnieren';

  @override
  String get mtBridgeMqttTopicOut => 'Thema veröffentlichen';

  @override
  String get mtBridgeMqttGatewayFrom => 'Gateway-Knoten-ID (von)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Dezimale ID oder !hex – erforderlich für Sendtext-Downlink';

  @override
  String get mtBridgeMqttChannelIndex => 'Mesh-Kanalindex (optional 0–7)';

  @override
  String get mtBridgeMqttUser => 'Benutzername (optional)';

  @override
  String get mtBridgeMqttPass => 'Passwort (optional)';

  @override
  String get mtBridgeMqttPassStored =>
      'Auf diesem Gerät ist ein Passwort gespeichert (nicht dargestellt).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Neues Passwort (zum Behalten leer lassen)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Lassen Sie das Feld leer, um das gespeicherte Passwort zu behalten.';

  @override
  String get mtBridgeMqttPassClear => 'Passwort löschen';

  @override
  String get mtBridgeMqttSave => 'MQTT-Einstellungen speichern';

  @override
  String get mtBridgeMqttSaved => 'MQTT-Einstellungen gespeichert';

  @override
  String get mtBridgeMqttConnect => 'Verbinden';

  @override
  String get mtBridgeMqttDisconnect => 'Trennen';

  @override
  String get mtBridgeMqttConnected => 'MQTT verbunden';

  @override
  String get mtBridgeMqttConnecting => 'MQTT Verbindung herstellen…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT getrennt';

  @override
  String get mtBridgeMqttError => 'MQTT Fehler';

  @override
  String get mtBridgeErrModeIngest => 'Wechseln Sie zuerst zu Ingest (A).';

  @override
  String get mtBridgeErrModeEgress => 'Wechseln Sie zunächst zum Ausgang (B).';

  @override
  String get mtBridgeErrRate => 'Langsamer fahren – Rate begrenzt';

  @override
  String get mtBridgeErrDedupe => 'Doppelte Nachricht ignoriert';

  @override
  String get mtBridgeErrLoop =>
      'Weggelassen, um eine Brückenschleife zu verhindern';

  @override
  String get mtBridgeErrEmpty => 'Die Nachricht ist leer';

  @override
  String get mtBridgeErrPublish => 'Die Veröffentlichung ist fehlgeschlagen';

  @override
  String get mtBridgeErrNotConnected => 'MQTT nicht verbunden';

  @override
  String get mtBridgeErrMissingHost => 'Geben Sie MQTT Broker-Host ein';

  @override
  String get mtBridgeErrMissingTopic =>
      'Geben Sie Abonnement- und Veröffentlichungsthemen ein';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Geben Sie die Gateway-Knoten-ID (von) für sendtext ein';

  @override
  String get mtBridgeErrConnect => 'MQTT-Verbindung fehlgeschlagen';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS-Verbindung fehlgeschlagen';

  @override
  String get settingsData => 'Daten';

  @override
  String get settingsDataHint =>
      'Löschen Sie lokale Nachrichten, um die Datenbank zu verkleinern – Identität, Schlüssel und Peers bleiben erhalten';

  @override
  String get settingsSaveHistoryTitle => 'Nachrichtenverlauf speichern';

  @override
  String get settingsSaveHistorySubtitle =>
      'Wenn diese Option deaktiviert ist, bleiben Nachrichten per E2EE auf dem Kabel und werden nur für diese Sitzung aufbewahrt (nicht im lokalen Chat-Verlauf). Ihr eigener Text wird auf diesem Gerät weiterhin als Klartext angezeigt.';

  @override
  String get settingsPrivacy => 'Privatsphäre';

  @override
  String get settingsE2eeTitle => 'Ende-zu-Ende-Verschlüsselung';

  @override
  String get settingsE2eeSubtitle =>
      'Immer aktiviert – Nachrichten werden vor dem Senden mit RSA-OAEP + AES-GCM versiegelt. Relays und Hops in der Nähe können Inhalte nicht lesen.';

  @override
  String get settingsScreenshotTitle => 'Screenshot-Benachrichtigungen';

  @override
  String get settingsScreenshotSubtitle =>
      'Zeigt eine Systemzeile im Chat an, wenn dieses Gerät den Bildschirm erfasst';

  @override
  String get settingsNostrExpiryTitle => 'Nostr Nachrichtenhaltezeit';

  @override
  String get settingsNostrExpirySubtitle =>
      'Wie lange versiegelte Umschläge lokal bleiben sollen, wenn online über Nostr';

  @override
  String get noticeExpiresIn => 'läuft ab in';

  @override
  String get noticesTitle => 'Hinweise';

  @override
  String get noticesMeshIntro =>
      'Öffentliche Bekanntmachung – für jeden in Funkreichweite sichtbar, nicht verschlüsselt. Es springt von Telefon zu Telefon offline, und in der Nähe befindlichen ResilNet-Relaisboxen wird eine Kopie aufbewahrt, sodass Personen, die später eintreffen, sie immer noch sehen können.';

  @override
  String get noticesMeshPublicBadge => 'ÖFFENTLICH · nicht verschlüsselt';

  @override
  String get noticesGeoIntro =>
      'Fügen Sie kurze Notizen zu diesem Ort hinzu, damit andere Besucher sie finden können.';

  @override
  String get noticesEmpty => 'noch keine Benachrichtigungen';

  @override
  String get noticesEmptyHint => 'Pinne den ersten Hinweis für die Leute hier.';

  @override
  String get noticesComposeHint => 'einen Hinweis posten...';

  @override
  String get noticesUrgent => 'dringend';

  @override
  String get noticesOpen => 'Hinweise';

  @override
  String get screenshotTaken => '*du hast einen Screenshot gemacht*';

  @override
  String get chatAttachImage => 'Bild anhängen';

  @override
  String get chatImageLabel => 'Bild';

  @override
  String get chatImageTooLarge =>
      'Bild zu groß – versuchen Sie es mit einem anderen Foto';

  @override
  String get chatNostrExpiry => 'Nostr behalten';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Senden an $channel – öffentlich';
  }

  @override
  String get settingsClearTitle => 'Alle Nachrichten löschen';

  @override
  String get settingsClearSubtitle => 'Alle Chats auf diesem Gerät löschen';

  @override
  String get settingsClearConfirmTitle => 'Alle Nachrichten löschen?';

  @override
  String get settingsClearConfirmBody =>
      'Dadurch werden alle Chatnachrichten auf diesem Gerät gelöscht.\nPeers und Spitznamen werden nicht entfernt.';

  @override
  String get settingsClearAction => 'Daten löschen';

  @override
  String get settingsClearedSnack => 'Daten gelöscht';

  @override
  String settingsVersion(String version) {
    return 'Version $version';
  }

  @override
  String get meshBleScanning => 'BLE: Suche nach Knoten';

  @override
  String get meshBleEsp32Scanning =>
      'ESP32: Suche nach einem Knoten in der Nähe';

  @override
  String get meshBleSyncing => 'BLE: Synchronisierung mit ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: Veröffentlichung';

  @override
  String get meshBleIdle =>
      'BLE Mesh aktiviert – noch keine Telefone in der Nähe';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE Mesh – $count Telefon(e) in der Nähe';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: Berechtigung erforderlich';

  @override
  String get meshBlePausedCamera =>
      'BLE für die Kamera angehalten – tippen Sie auf „Starten“ BLE';

  @override
  String get meshBleStopped =>
      'BLE ist ausgeschaltet – überprüfen Sie, ob Bluetooth aktiviert ist, und tippen Sie dann auf Start BLE';

  @override
  String get meshBleRestart => 'Starten Sie BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction =>
      'Überprüfen Sie die Berechtigungen und starten Sie BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count Peers in der Nähe • LoRa $lora • ~${meters}m synchronisieren';
  }

  @override
  String get meshLoraReady => 'bereit';

  @override
  String get meshLoraNotReady => 'nicht bereit';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway-UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: bereit';

  @override
  String get permissionTitle =>
      'Erlauben Sie den Zugriff, um das Mesh-Netzwerk BLE zu starten';

  @override
  String get permissionBody =>
      'Die App benötigt Bluetooth (Scannen/Verbinden/Ankündigen), Standort (für ältere Android-Geräte) und Mikrofon (für Sprachnotizen im Chat und Ankündigungen) für Community-Nachrichten.';

  @override
  String get permissionE2ee =>
      'Ende-zu-Ende-Verschlüsselung (E2EE)\nRelay-Knoten können den Nachrichteninhalt nicht lesen';

  @override
  String get permissionReady => 'Berechtigungen bereit';

  @override
  String get permissionRequest => 'Zulassen und fortfahren';

  @override
  String get permissionNotReadySnack =>
      'Das System ist noch nicht bereit – warten Sie einen Moment und versuchen Sie es erneut';

  @override
  String get permissionDeniedSnack =>
      'Berechtigungen unvollständig – öffnen Sie Einstellungen > ResilNet und erlauben Sie Bluetooth/Standort/Mikrofon';

  @override
  String get permissionMicDenied =>
      'Mikrofonzugriff verweigert – erlauben Sie es in den Einstellungen, Sprachnotizen aufzuzeichnen';

  @override
  String get permissionMicOpenSettings => 'Einstellungen';

  @override
  String get permissionCameraDenied =>
      'Kamerazugriff verweigert – erlauben Sie es in den Einstellungen, QR-Codes zu scannen';

  @override
  String get permissionCameraFailed =>
      'Zum Scannen von QR-Codes ist eine Kameraerlaubnis erforderlich';

  @override
  String get permissionCameraOpenSettings => 'Einstellungen';

  @override
  String get permissionPhotosDenied =>
      'Zugriff auf die Fotobibliothek verweigert – erlauben Sie dies in den Einstellungen, um Ihren QR-Code zu speichern';

  @override
  String get permissionPhotosFailed =>
      'Zum Speichern Ihres QR-Codes ist eine Genehmigung der Fotobibliothek erforderlich';

  @override
  String get permissionPhotosOpenSettings => 'Einstellungen';

  @override
  String permissionFailedSnack(String error) {
    return 'Berechtigungsanforderung fehlgeschlagen: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architektur • Store-and-Forward-Multi-Hop';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingNext => 'Nächste';

  @override
  String get onboardingStart => 'Fangen Sie an';

  @override
  String get onboardingWelcomeTitle => 'Willkommen bei ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chatten Sie auf ResilNet über ein Mesh-Netzwerk – auch ohne Internet';

  @override
  String get onboardingFriendsTitle => 'Fügen Sie ganz einfach Freunde hinzu';

  @override
  String get onboardingFriendsBody =>
      'Teilen Sie einen QR von Identity oder scannen Sie den QR eines Freundes, um öffentliche Schlüssel auszutauschen';

  @override
  String get onboardingChannelsTitle =>
      'Verschlüsselter Chat + Kanäle in der Nähe';

  @override
  String get onboardingChannelsBody =>
      'Wechseln Sie #mesh / Area (geohash), um Peers in der Nähe zu finden – Nachrichten bleiben E2EE über BLE Mesh und Nostr';

  @override
  String get chatTitle => 'Chat (E2EE)';

  @override
  String get chatScanTooltip => 'QR scannen, um einen Peer hinzuzufügen';

  @override
  String get chatBlockTooltip => 'Blockieren Sie diesen Absender';

  @override
  String get chatBlockedSnack =>
      'Blockiert: keine Benachrichtigungen / keine Weiterleitung';

  @override
  String get chatAliasTooltip => 'Spitznamen festlegen';

  @override
  String get chatReceiverPemLabel => 'Öffentlicher Empfängerschlüssel (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Fügen Sie den öffentlichen Schlüssel Ihres Freundes ein (aus QR / freigegebener Datei)';

  @override
  String get chatNeedPeerKey =>
      'Scannen Sie zuerst den QR dieses Peers (verifizierter öffentlicher Schlüssel erforderlich)';

  @override
  String get chatPeerKeyMismatch =>
      'Der gespeicherte öffentliche Schlüssel stimmt nicht mit dieser Peer-ID überein';

  @override
  String chatVoiceFailed(String error) {
    return 'Audio konnte nicht aufgenommen werden: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Sprachnotiz konnte nicht abgespielt werden: $error';
  }

  @override
  String get chatPlayVoice => 'Sprachnotiz abspielen';

  @override
  String get chatPauseVoice => 'Pause';

  @override
  String get chatVoiceLabelSent => '🎤 Sprachnotiz (versiegelt)';

  @override
  String get chatVoiceLabel => '🎤 Sprachnotiz';

  @override
  String get chatDecryptFailed => '[Entschlüsselung fehlgeschlagen]';

  @override
  String chatSentSealed(String preview) {
    return '[versiegelt • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[versiegelt]';

  @override
  String get chatComposeHint =>
      'Geben Sie eine Nachricht ein ... (beim Senden versiegelt)';

  @override
  String get chatEmptyThread =>
      'Noch keine Nachrichten\nGeben Sie unten ein, um es über das Netz zu senden';

  @override
  String chatLoadFailed(String error) {
    return 'Konversation konnte nicht geladen werden: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Ausstehend';

  @override
  String get statusSent => 'Gesendet';

  @override
  String get statusRelayed => 'Weitergegeben';

  @override
  String get statusDelivered => 'Geliefert';

  @override
  String get statusRead => 'Lesen';

  @override
  String get statusFailed => 'Fehlgeschlagen';

  @override
  String get chatCopy => 'Kopie';

  @override
  String get chatDeleteLocal => 'Auf diesem Gerät löschen';

  @override
  String get chatDeletedLocalSnack => 'Auf diesem Gerät gelöscht';

  @override
  String get chatRetry => 'Wiederholen';

  @override
  String get chatSendFailed =>
      'Nicht zugestellt – tippen Sie auf „Wiederholen“.';

  @override
  String get chatImageNeedInternet =>
      'Stellen Sie eine Verbindung zum Internet her, um Bilder zu senden';

  @override
  String get chatImageTooLargeOnline =>
      'Das Bild konnte zum Senden nicht ausreichend komprimiert werden';

  @override
  String get chatOpenLinkFailed => 'Link konnte nicht geöffnet werden';

  @override
  String get identityTitle => 'Identität';

  @override
  String get identityScanTooltip => 'Scannen Sie QR mit der Kamera';

  @override
  String get identityCopiedHash => 'Hash des öffentlichen Schlüssels kopiert';

  @override
  String get identityPeerSaved => 'Peer aus QR gespeichert';

  @override
  String get identityGalleryDenied =>
      'Die Erlaubnis zur Fotobibliothek wurde verweigert';

  @override
  String get identityQrSaved => 'QR in der Fotobibliothek gespeichert';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR konnte nicht gespeichert werden: $error';
  }

  @override
  String get peersTitle => 'Netzwerkmitglieder';

  @override
  String get qrScanTitle => 'QR scannen, um einen Freund hinzuzufügen';

  @override
  String get qrInvalid => 'Scan fehlgeschlagen: ungültiger QR';

  @override
  String get qrIdKeyMismatch =>
      'QR abgelehnt: ID stimmt nicht mit öffentlichem Schlüssel überein';

  @override
  String get qrCameraNotReady => 'Kamera nicht bereit';

  @override
  String get qrRetrySettings =>
      'Versuchen Sie es erneut / öffnen Sie die Einstellungen';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Kamera konnte nicht geöffnet werden: $error';
  }

  @override
  String get qrScanAlignHint =>
      'Richten Sie den QR-Code innerhalb des Rahmens aus';

  @override
  String get firmwareDownloadTitle => 'Laden Sie die ESP32-Firmware herunter';

  @override
  String get firmwareSourceOnline => 'Neueste (online)';

  @override
  String get firmwareSourceCached => 'Gespeicherte Kopie (offline)';

  @override
  String get firmwareSourceBaseline => 'Gebündelte Basislinie (offline)';

  @override
  String get firmwareSourceUnavailable => 'Keine Firmware verfügbar';

  @override
  String get firmwareBaselineIncompatible =>
      'Die mitgelieferte Firmware ist zu alt. Stellen Sie eine Verbindung zum Internet her, um eine neuere Version herunterzuladen';

  @override
  String get firmwareChecksumFailed =>
      'Firmware-Integritätsprüfung fehlgeschlagen – Flashen blockiert';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware bereit: $source';
  }

  @override
  String get peersRefreshTooltip => 'Aktualisieren';

  @override
  String get peersBlocked => 'Blockiert';

  @override
  String peersNearbyBle(Object ble) {
    return 'In der Nähe (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'Kürzlich online';

  @override
  String get peersOnlineInArea => 'Online in der Region';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Vor $minutes Min. gesehen';
  }

  @override
  String get peersOffline => 'Offline';

  @override
  String peersBlockedSnack(String id) {
    return 'Blockiert $id';
  }

  @override
  String get peersUnblockedSnack => 'Entsperrt';

  @override
  String get peersEmpty =>
      'Noch keine Mitglieder in der Datenbank\nScannen Sie einen QR oder warten Sie auf die Netzerkennung BLE';

  @override
  String get peersOpenChat => 'Chat öffnen';

  @override
  String get peersBlockAction => 'Block';

  @override
  String get peersUnblockAction => 'Entsperren';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Bereich';

  @override
  String get locationPickerTooltip => 'Standortkanal';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Menschen online';

  @override
  String get unreadDirectsTooltipEmpty => 'Private Nachrichten';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count ungelesene private Nachrichten';
  }

  @override
  String get onlinePeopleTitle => 'Menschen';

  @override
  String get onlinePeopleEmpty => 'Hier ist noch niemand online';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · Nähe + Bereich';

  @override
  String get peerOnlineMeshTitle => 'Jemand in der Nähe auf Mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name befindet sich in der Nähe im Netz';
  }

  @override
  String get peerOnlineAreaTitle => 'Jemand ist online in der Gegend';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name ist online über Nostr';
  }

  @override
  String get locationSheetTitle => '#Standortkanäle';

  @override
  String get channelPinsTitle => 'Angepinnt';

  @override
  String get channelPinsHint =>
      'Pinnen Sie Kanäle, die Sie häufig verwenden – sie bleiben oben';

  @override
  String get channelPinTooltip => 'Pinne diesen Kanal';

  @override
  String get channelUnpinTooltip => 'Lösen';

  @override
  String get locationSheetIntro =>
      'Chatten Sie mit Personen in der Nähe über grobes Geohash – nicht über präzises GPS. Die Präsenz im Internet verwendet anonyme Nostr-Schlüssel.';

  @override
  String get locationMeshSubtitle => '#Bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportieren';

  @override
  String homeComposeHint(String channel) {
    return 'Nachricht $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Senden an $channel – öffentlich';
  }

  @override
  String get messageExpiryTitle => 'läuft ab in';

  @override
  String get voiceRecordTapToStart =>
      'Tippen Sie hier, um eine Sprachnachricht aufzuzeichnen';

  @override
  String get voiceRecordTooShort =>
      'Aufnahme zu kurz – versuchen Sie es erneut';

  @override
  String get voiceRecordFailed =>
      'Die Aufnahme konnte nicht gespeichert werden. Versuchen Sie es erneut';

  @override
  String get voicePttHold => 'Zum Aufnehmen gedrückt halten';

  @override
  String get voicePttRelease => 'Zur Vorschau freigeben';

  @override
  String get voicePttRecording => 'Aufnahme…';

  @override
  String get voicePttDraftReady => 'Sprachnotiz bereit';

  @override
  String get voicePttDiscard => 'Verwerfen';

  @override
  String get voicePttReRecord => 'Nochmals aufnehmen';

  @override
  String get voicePttSend => 'Sprachnotiz senden';

  @override
  String get voicePttPlayPreview => 'Vorschau abspielen';

  @override
  String get voicePttStopPreview => 'Vorschau stoppen';

  @override
  String get noticesBackfilling => 'Benachrichtigungen werden geladen…';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline =>
      'Nostr offline – Bulletin benötigt Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count-Benachrichtigungen geladen';
  }

  @override
  String get noticePublishFailed =>
      'Die Mitteilung an den Bereichsvorstand konnte nicht veröffentlicht werden. Überprüfen Sie die Nostr-Verbindung.';

  @override
  String get noticeMeshPublishNoLink =>
      'Lokal gespeichert. Stellen Sie eine Verbindung zu einem nahegelegenen Mesh-Radio (oder einem Wi‑Fi-Gateway) her, damit andere es empfangen können.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletin wurde über BLE an $count Geräte in der Nähe gesendet.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Funkgeräte in der Nähe gesehen, aber das Schreiben von BLE ist fehlgeschlagen. Lassen Sie beide Apps auf dem Benachrichtigungsbildschirm geöffnet und versuchen Sie es erneut (oder verwenden Sie ein ESP32-Relay).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Der BLE-Empfänger dieses Geräts ist nicht bereit. Schalten Sie Bluetooth um und öffnen Sie „Benachrichtigungen“ erneut.';

  @override
  String get noticeDelete => 'Hinweis löschen';

  @override
  String get noticeDeleteConfirmTitle => 'Diesen Hinweis löschen?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Dadurch wird es nur auf diesem Gerät entfernt. Andere, die es bereits erhalten haben, werden es weiterhin sehen.';

  @override
  String get noticeDeleted => 'Hinweis gelöscht';

  @override
  String get chatNoticeHidden => 'Gebietshinweis – offene Hinweise';

  @override
  String get identityDisplayNameTitle => 'Anzeigename';

  @override
  String get identitySaveName => 'Namen speichern';

  @override
  String get identityUserIdLabel =>
      'Benutzer-ID (Hash des öffentlichen Schlüssels)';

  @override
  String get identityCopyHashTooltip =>
      'Kopieren Sie den Hash des öffentlichen Schlüssels';

  @override
  String get identityMyQrTitle => 'Mein QR (ID + PubKey + Name)';

  @override
  String identityQrFailed(String error) {
    return 'QR konnte nicht erstellt werden\n$error';
  }

  @override
  String get identitySaving => 'Sparen…';

  @override
  String get identitySaveQr => 'Speichern Sie QR in der Fotobibliothek';

  @override
  String get identityOpenScanner => 'Öffnen Sie die Kamera, um QR zu scannen';

  @override
  String get identityQrHelp =>
      'Lassen Sie dies von einem Freund scannen, um Ihren öffentlichen Schlüssel zu speichern und Sie (falls erforderlich) als verifizierten Aussteller festzulegen';

  @override
  String get identityChatTip =>
      'Tipp: Sie können im Chat auch einen QR scannen, um einen öffentlichen Schlüssel für E2EE hinzuzufügen';

  @override
  String get infoOpen => 'Über / Info';

  @override
  String get docsGuideTitle => 'Benutzerhandbuch';

  @override
  String get docsGuideSubtitle => 'Wird im Browser geöffnet';

  @override
  String get docsOpenAction => 'Anleitung öffnen';

  @override
  String get docsOpenFailed =>
      'Das Benutzerhandbuch konnte nicht geöffnet werden';

  @override
  String get firmwareOtaGuideTitle => 'Flash-Anleitung und OTA-Protokoll';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Öffnet den Web-Guide – .bin-Downloads und vollständige Schritte';

  @override
  String get firmwareWebDownloadsTitle => 'Firmware-Downloads im Internet';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Links und Prüfsummen pro Version auf der Dokumentationsseite';

  @override
  String get inviteCopyShortLink => 'Kurzlink kopieren';

  @override
  String get inviteShareLink => 'Link teilen';

  @override
  String get inviteShowFullLink => 'Vollständiger Link';

  @override
  String get inviteCopyFullLink => 'Vollständigen Link kopieren';

  @override
  String get inviteLinkCopied => 'Link kopiert';

  @override
  String get inviteLongPressHint => 'Für Linkaktionen lange drücken';

  @override
  String get inviteSendInChat => 'Senden Sie einen ResilNet-Chat…';

  @override
  String get inviteSendInChatHint =>
      'Nur Personen, für die Sie bereits einen öffentlichen Schlüssel haben';

  @override
  String get inviteSendInChatEmpty =>
      'Noch keine nachrichtenfähigen Chats.\nScannen Sie einen QR, öffnen Sie Area/Mesh oder teilen Sie den Link zunächst außerhalb der App.';

  @override
  String get inviteSentToChat => 'Einladung im Chat gesendet';

  @override
  String get infoTabInfo => 'Info';

  @override
  String get infoTabSettingsHint =>
      'Öffnen Sie im Menü Einstellungen für Sprache, E2EE und Datentools';

  @override
  String get infoHowToTitle => 'Wie zu verwenden';

  @override
  String get infoHowToBody =>
      '• Tippen Sie auf das Kanalsymbol, um zwischen Chat, #mesh und Bereich zu wechseln\n• Tippen Sie auf Ort, um die Geohash-Größe auszuwählen\n• Tippen Sie auf Personen, um zu erfahren, wer Mitglied ist oder wer online ist\n• Öffnen Sie Identity/QR von ⋮, um Schlüssel persönlich auszutauschen\n• Der „öffentliche“ Bereich sendet versiegeltes E2EE an jeden Online-Peer – kein Klartextraum';

  @override
  String get infoFeaturesTitle => 'Merkmale';

  @override
  String get infoFeatureOffline =>
      'Offline-Messaging über Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Ende-zu-Ende-Verschlüsselung mit RSA-OAEP + AES-GCM (nicht Noise)';

  @override
  String get infoFeatureMultihop =>
      'Nachrichten können über nahegelegene Peers weitergeleitet werden, um weiter zu gelangen';

  @override
  String get infoFeatureBridge =>
      'Hybrid Mesh ↔ Internet (Nostr) für versiegelte Umschläge';

  @override
  String get infoFeatureGeo =>
      'Lokale Geohash-Kanäle für Personen in der Nähe (Discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Hinweise mit Ablaufdatum für #mesh und Area';

  @override
  String get infoPrivacyTitle => 'Privatsphäre';

  @override
  String get infoPrivacyNoRoom =>
      'Kein Klartext-Dorf/öffentlicher Chatroom auf dem Kabel';

  @override
  String get infoPrivacyFanout =>
      'Area Send = versiegelter 1:1-Fanout an Peers mit bekannten öffentlichen Schlüsseln';

  @override
  String get infoPrivacyPresence =>
      'Für die Präsenz im Internetbereich werden kurzlebige Nostr-Schlüssel verwendet';

  @override
  String get infoSymbolsTitle => 'Symbole';

  @override
  String get infoSymBle => 'Direkte Bluetooth-Verbindung';

  @override
  String get infoSymMesh => 'Erreichbar über Mesh (andere weiterleiten)';

  @override
  String get infoSymInternet =>
      'Über das Internet (Nostr) – versiegelte Umschläge';

  @override
  String get infoSymBridge => 'Angekommen über den Mesh↔Internet-Brückenpfad';

  @override
  String get infoSymOffline => 'Offline – im Moment nicht erreichbar';

  @override
  String get infoSymInArea => 'Im Bereich dieses Standortkanals';

  @override
  String get infoSymE2eeOk => 'Ende-zu-Ende-verschlüsselte Sitzung';

  @override
  String get infoSymE2eeFail =>
      'Verschlüsselung nicht verfügbar – senden Sie keine vertraulichen Texte';

  @override
  String get infoSymVerified => 'Identität überprüft / bekannter Schlüssel';

  @override
  String get infoSymBlocked => 'Blockiert';

  @override
  String get infoSymUnread => 'Ungelesene private Nachricht';

  @override
  String get infoEmergencyTitle => 'Notfallmodus';

  @override
  String get infoEmergencyBody =>
      'Tippen Sie dreimal auf den Titel ResilNet auf dem Startbildschirm, um Nachrichten, Schlüssel und Identität auf diesem Gerät zu löschen.';

  @override
  String get infoLegendNote =>
      'Der Übersichtlichkeit halber sind hier einige Pfadsymbole dokumentiert. Zustellhäkchen im Chat bleiben der primäre Sendestatus.';

  @override
  String get dangerZoneTitle => 'Gefahrenzone';

  @override
  String get dangerZoneSubtitle =>
      'Löscht Nachrichten, Verschlüsselungsschlüssel, Nostr-Identität, Peers und Spitznamen auf diesem Gerät. Sie werden es erneut einrichten.';

  @override
  String get panicWipeTitle => 'Notfalllöschung';

  @override
  String get panicWipeSubtitle =>
      'Löschen Sie alles Lokale – genau wie dreimaliges Tippen auf den Heimattitel (zweimaliges Tippen aktualisiert die Radios)';

  @override
  String get panicWipeConfirmTitle => 'Alle lokalen Daten löschen?';

  @override
  String get panicWipeConfirmBody =>
      'Dadurch werden Chats, Schlüssel und Identität auf diesem Telefon dauerhaft gelöscht.\nPeers müssen QR-Schlüssel mit Ihrer neuen Identität erneut austauschen.\nDies kann nicht rückgängig gemacht werden.';

  @override
  String get panicWipeAction => 'Wischen Sie alles ab';

  @override
  String get panicWipeSnack => 'Lokale Identität gelöscht – neu eingerichtet';

  @override
  String panicWipeFailed(String error) {
    return 'Löschvorgang fehlgeschlagen: $error';
  }

  @override
  String get meshBridgeTitle => 'Mesh-Brücke';

  @override
  String get meshBridgeSubtitle =>
      'Wenn diese Option aktiviert ist (Standardeinstellung), können versiegelte Umschläge sowohl BLE-Mesh als auch Internet (Nostr) zusammen nutzen, sodass benachbarte Mesh-Inseln eine Verbindung herstellen können. Wenn diese Option deaktiviert ist, verwenden Sendungen nur einen Pfad – es wird niemals Klartext auf die Leitung übertragen.';

  @override
  String get favoritesTitle => 'Favoriten';

  @override
  String get favoritesAdd => 'Zu Favoriten hinzufügen';

  @override
  String get favoritesRemove => 'Aus Favoriten entfernen';

  @override
  String get favoritesEmpty =>
      'Noch keine Favoriten – markieren Sie einen Kollegen aus der Mitgliederliste';

  @override
  String get favoritesNearbyTitle => 'Favorit in der Nähe';

  @override
  String favoritesNearbyBody(String name) {
    return '$name befindet sich in der Nähe im Netz';
  }

  @override
  String get favoritesInAreaTitle => 'Favorit in der Gegend';

  @override
  String favoritesInAreaBody(String name) {
    return '$name ist in diesem Bereich online';
  }

  @override
  String get topologyTitle => 'Mesh-Topologie';

  @override
  String get topologySubtitle =>
      'Peers und Verbindungshinweise von Mesh Announce (schreibgeschützt)';

  @override
  String get topologyConnectedNow => 'Jetzt verbunden (BLE)';

  @override
  String get topologyNearby => 'In der Nähe (BLE)';

  @override
  String get topologyKnown => 'Bekannte Kollegen';

  @override
  String get topologyEmpty =>
      'Noch keine Kollegen kennengelernt – bleiben Sie mit aktiviertem BLE in der Nähe';

  @override
  String get topologyYou => 'Du';

  @override
  String topologyStats(int peers, int links) {
    return '$peers Peers · $links Links';
  }

  @override
  String get topologyGraphHint =>
      'Geschätzt anhand der Mesh-Erkennung in der Nähe – Ihr Gerät ist hervorgehoben. Tippen Sie auf einen Kollegen, um den Chat zu öffnen.';

  @override
  String get topologyOpen => 'Mesh-Topologie';

  @override
  String get slashHelpTitle => 'Befehle';

  @override
  String get slashHelpBody =>
      '/help — diese Liste\n/wer — Personen online im aktuellen Kanal\n/Drop <text> — hier einen versiegelten Hinweis anheften (E2EE Fan-Out)\n\nVollständige Anleitung: Verwenden Sie die Anleitung Öffnen unten oder Einstellungen → Benutzerhandbuch.';

  @override
  String get slashWhoEmpty => 'Auf diesem Kanal ist derzeit niemand online';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Verwendung: /drop Ihren Notiztext';

  @override
  String slashDropDone(String channel) {
    return 'Hinweis am $channel gelöscht';
  }

  @override
  String get slashUnknown =>
      'Unbekannter Befehl – ​​versuchen Sie es mit /help';

  @override
  String get announceOpen => 'Ankündigungen';

  @override
  String get announceTitle => 'Ankündigungen';

  @override
  String get announceEmpty =>
      'Noch keine Foren – erstellen Sie eine, um gesperrte oder offene Mitteilungen zu veröffentlichen';

  @override
  String get announceCreate => 'Board erstellen';

  @override
  String get announceCreateHint => 'Name des Boards';

  @override
  String get announceDefaultTitle => 'Gemeindevorstand';

  @override
  String get announceSettings => 'Board-Einstellungen';

  @override
  String get announceAllowLocked =>
      'Gesperrte (verschlüsselte) Beiträge zulassen';

  @override
  String get announceAllowLockedSub =>
      'Mit dem Board-Schlüssel verschlüsselt – Leser benötigen Zugriff';

  @override
  String get announceAllowOpen => 'Offene (Klartext-)Beiträge zulassen';

  @override
  String get announceAllowOpenSub =>
      'Nicht E2EE – lesbar auf Mesh/Relays. Standardmäßig deaktiviert.';

  @override
  String get announceComposeHint => 'Schreiben Sie eine Ankündigung…';

  @override
  String get announceMediaInternetOnly =>
      'Über das Internet gesendete Foto-/Sprachansagen (nicht BLE)';

  @override
  String get announceNeedInternet =>
      'Stellen Sie eine Verbindung zum Internet her, um Foto- oder Sprachansagen zu senden';

  @override
  String announceVoiceFailed(String error) {
    return 'Die Stimme konnte nicht aufgenommen werden: $error';
  }

  @override
  String get announceImageTooLarge => 'Bild ist zu groß (maximal ~180 KB)';

  @override
  String get announcePlayVoice => 'Sprachnotiz abspielen';

  @override
  String get announceImageLabel => '📷 Bild';

  @override
  String get announceAudioLabel => '🎤 Sprachnotiz';

  @override
  String get announceModeLocked => 'Gesperrt';

  @override
  String get announceModeOpen => 'Offen';

  @override
  String get announceOpenBadge => 'OFFEN · nicht verschlüsselt';

  @override
  String get announceLockedBadge => 'Gesperrt';

  @override
  String get announceLockedPlaceholder =>
      'Verschlüsselt – Fordern Sie Zugriff zum Lesen an';

  @override
  String get announceRequestAccess => 'Zugriff anfordern';

  @override
  String get announceRequestSent =>
      'Zugriffsanfrage an den Board-Inhaber gesendet';

  @override
  String get announceRequestFailed =>
      'Der Zugriff konnte nicht angefordert werden (öffentlicher Schlüssel des Besitzers erforderlich)';

  @override
  String get announceOpenConfirmTitle => 'Ohne Verschlüsselung posten?';

  @override
  String get announceOpenConfirmBody =>
      'Offene Beiträge sind kein E2EE. Jeder auf dem Weg (Mesh / Relays) darf sie lesen. Weitermachen?';

  @override
  String get announcePostAction => 'Post';

  @override
  String get announcePendingRequests => 'Zugriffsanfragen';

  @override
  String get announceApprove => 'Genehmigen';

  @override
  String get announceDeny => 'Leugnen';

  @override
  String get announceGranted =>
      'Sie können gesperrte Beiträge in diesem Forum lesen';

  @override
  String get announceOwner => 'Dir gehört dieses Board';

  @override
  String get announceCopyInvite => 'Einladungstext kopieren';

  @override
  String get announceShowInviteQr => 'Einladungs-QR anzeigen';

  @override
  String get announceScanInviteQr => 'Scannen Sie den Board-Einladungs-QR';

  @override
  String get announceFollow => 'Folgen Sie dem Board von der Einladung';

  @override
  String get announceFollowHint =>
      'Fügen Sie den Einladungstext oder den ResilNet-Link des Eigentümers ein';

  @override
  String get announceFollowOk => 'Folgende Tafel';

  @override
  String announceFollowOkNamed(String title) {
    return 'Jetzt folgt „$title“';
  }

  @override
  String get announceFollowFail => 'Die Einladung ist ungültig oder beschädigt';

  @override
  String get announceInviteCopied => 'Einladungstext kopiert';

  @override
  String get announceInviteSaveQr => 'QR speichern';

  @override
  String get announceInviteShare => 'Einladung teilen';

  @override
  String get announceFollowFromCompose =>
      'Im Meldungsfeld wurde eine Board-Einladung erkannt';

  @override
  String get peerConfirmAddTitle => 'Netzwerkmitglied hinzufügen?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Fügen Sie „$name“ mit ihrem öffentlichen Schlüssel hinzu, damit Sie ihnen private Nachrichten senden können?';
  }

  @override
  String get peerConfirmAdd => 'Mitglied hinzufügen';

  @override
  String peerAddedOk(String name) {
    return '$name zu Netzwerkmitgliedern hinzugefügt';
  }

  @override
  String get peerAddFromCompose =>
      'Identität/öffentlicher Schlüssel im Meldungsfeld erkannt';

  @override
  String get peerHashCopied => 'Hash des öffentlichen Schlüssels kopiert';

  @override
  String get peerHashOpenChat => 'Chat öffnen';

  @override
  String get peerHashAddHint =>
      'Hash kopiert. Bitten Sie sie, ihren Identitätslink oder QR mitzuteilen, damit Sie den vollständigen öffentlichen Schlüssel für E2EE hinzufügen können.';

  @override
  String get peerQrNoCode => 'In diesem Bild wurde kein ResilNet QR gefunden';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet Identität: „$name“\nÖffnen Sie den Link oder fügen Sie ihn in den Chat ein → Mitglied hinzufügen\nOder scannen Sie den Identitäts-QR.';
  }

  @override
  String get identityShareInvite => 'Identitätslink teilen';

  @override
  String get identityInviteCopied => 'Identitätslink kopiert';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Board-Einladung: „$title“\nÖffnen Sie ResilNet → Community-Boards → Folgen Sie der Einladung\nOder scannen Sie den QR / tippen Sie auf den Link unten.';
  }

  @override
  String get announceConfirmFollowTitle => 'Diesem Forum folgen?';

  @override
  String announceConfirmFollowBody(String title) {
    return '„$title“ aus dieser Einladung folgen?';
  }

  @override
  String get announceConfirmFollow => 'Folgen';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Aggiornamento ResilNet…';

  @override
  String get appRefreshed =>
      'Aggiornato: le radio e la scoperta sono riavviate';

  @override
  String appRefreshFailed(String error) {
    return 'Aggiornamento non riuscito: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Doppio tocco = aggiornamento graduale. Pressione prolungata = recupero difficile. Tocco triplo = cancellazione di emergenza.';

  @override
  String get softRefreshTipTitle => 'Se ResilNet si sente bloccato';

  @override
  String get softRefreshTipBody =>
      'Tocca due volte ResilNet (in alto a sinistra) per un aggiornamento graduale della radio. Se il problema persiste: premi a lungo sul titolo, utilizza ⋮ → Ripristino hardware o Impostazioni. Il triplo tocco consente solo la cancellazione di emergenza.';

  @override
  String get softRefreshTipGotIt => 'Fatto';

  @override
  String get infoSoftRefreshTitle => 'Se l\'app sembra bloccata';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Tocca due volte ResilNet (in alto a sinistra) → aggiornamento graduale delle radio e delle persone vicine';

  @override
  String get infoSoftRefreshStepHard =>
      'Ancora bloccato? Premi a lungo il titolo o ⋮ / Impostazioni → Ripristino hardware';

  @override
  String get infoSoftRefreshStepWait =>
      'Attendi il risultato snackbar, quindi riprova. Il ripristino della sessione mantiene le tue chiavi.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Tocco triplo = cancellazione di emergenza (elimina i dati locali) - solo se intenzionale';

  @override
  String get appRecoverySection => 'Ripristino dell\'app';

  @override
  String get appRecoverySectionSubtitle =>
      'Da utilizzare quando l\'app sembra bloccata. Soft = doppio tocco del titolo. Il recupero difficile è più forte. Il ripristino della sessione riavvia i servizi senza cancellare le chiavi.';

  @override
  String get appHardRecoverAction => 'Difficile recupero';

  @override
  String get appHardRecovering => 'Difficile recupero…';

  @override
  String get appSessionResetAction => 'Reimposta sessione';

  @override
  String get appSessionResetRunning => 'Reimpostazione della sessione…';

  @override
  String get appSessionResetConfirmTitle => 'Reimpostare la sessione?';

  @override
  String get appSessionResetConfirmBody =>
      'Riavvia i servizi ResilNet su questo dispositivo. Le tue chiavi di identità vengono conservate.';

  @override
  String get appRecoveryBusy => 'Ripristino già in esecuzione...';

  @override
  String get appRecoveryOk => 'Terminato il recupero';

  @override
  String get appRecoveryPartial =>
      'Il ripristino è terminato con alcuni passaggi saltati: riprova se il problema persiste';

  @override
  String get appRecoveryFailed =>
      'Ripristino non riuscito: prova a ripristinare la sessione o a chiudere forzatamente l\'app dal sistema operativo';

  @override
  String get localWifiTitle => 'Locale Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Collega i dispositivi vicini senza Internet, come se fossi su una LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Non il gateway ESP32 LoRa SoftAP. Questo è solo telefono↔telefono/LAN.';

  @override
  String get localWifiUnavailable =>
      'Il locale non Wi‑Fi è ancora pronto: attendi l\'avvio dell\'app.';

  @override
  String get lxmfBridgeTitle => 'Nodo domestico';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac o Pi opzionale sul tuo Wi‑Fi che inoltra chat sigillate. Disattivato per impostazione predefinita. Non sostituisce la crittografia end-to-end.';

  @override
  String get lxmfBridgeEnable => 'Usa il nodo home';

  @override
  String get lxmfBridgeDisabledHint =>
      'Attiva solo quando l\'app bridge è in esecuzione su un Mac o Pi su questa rete.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'In linea — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Impossibile raggiungere il nodo home: $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Indirizzo del nodo domestico';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP o http://IP:porta — esempio 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF destinazione (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Salva e aggiorna lo stato';

  @override
  String get lxmfBridgeLabHint => 'Avanzato: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Impostazioni del nodo Home';

  @override
  String get lxmfBridgeCheckConnection => 'Controllare la connessione';

  @override
  String get lxmfBridgeStatusOnline => 'Connesso al nodo home';

  @override
  String get lxmfBridgeStatusOffline => 'Nodo home non raggiungibile';

  @override
  String get lxmfBridgeYourDest =>
      'L\'indirizzo di questo nodo (condividi con gli amici)';

  @override
  String get lxmfBridgeCopyDest => 'Copia indirizzo';

  @override
  String get lxmfBridgeDestCopied => 'Indirizzo copiato';

  @override
  String get lxmfBridgeLinkedPeers => 'Amici collegati';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Ogni amico ha bisogno del proprio indirizzo del nodo di casa una volta. Quindi le chat sigillate possono utilizzare questo percorso.';

  @override
  String get lxmfBridgeNoLinks => 'Nessun amico collegato ancora.';

  @override
  String get lxmfBridgeAddLink => 'Collega un amico';

  @override
  String get lxmfBridgePickPeer => 'Amico';

  @override
  String get lxmfBridgePeerDest => 'Il loro indirizzo del nodo home';

  @override
  String get lxmfBridgePeerDestHint =>
      'Codice di 32 caratteri dalla schermata del nodo Home';

  @override
  String get lxmfBridgeInvalidDest =>
      'Quell\'indirizzo non sembra valido. Incolla il codice completo dal loro nodo home.';

  @override
  String get lxmfBridgeRemoveLink => 'Scollega';

  @override
  String get lxmfBridgeSaveLink => 'Salva';

  @override
  String get lxmfBridgeLinkSaved => 'Amico collegato';

  @override
  String get lxmfBridgeNoPeers =>
      'Nessun contatto ancora inviabile ai messaggi: aggiungi prima un amico.';

  @override
  String get lxmfBridgeHelp =>
      'Mantieni il bridge in esecuzione sul Mac/Pi. Questo percorso rimane sulla tua LAN: non è LoRa e non sostituisce Internet o Bluetooth Mesh.';

  @override
  String get localWifiModeHotspot => 'Nelle vicinanze';

  @override
  String get localWifiModeRouter => 'Router';

  @override
  String get localWifiHotspotIntro =>
      'Un dispositivo condivide un hotspot personale. Altri si uniscono a quell\'hotspot, quindi ResilNet li trova sulla rete locale.';

  @override
  String get localWifiHostAction => 'Crea rete (host)';

  @override
  String get localWifiJoinAction => 'Unisciti alla rete';

  @override
  String get localWifiHostSteps =>
      '1. Apri Impostazioni iOS/Android e attiva Hotspot personale (o Condivisione Internet).\n2. Comunica agli amici il nome dell\'hotspot (e la password).\n3. Torna qui e tocca \"L\'hotspot è attivo: inizia ad aspettare\".';

  @override
  String get localWifiHostReady => 'L\'hotspot è attivo: inizia ad aspettare';

  @override
  String get localWifiHostWaiting => 'In attesa che gli amici si uniscano...';

  @override
  String get localWifiJoinSteps =>
      '1. Apri le Impostazioni di sistema e accedi all\'hotspot personale del tuo amico.\n2. Torna qui e tocca \"Sono connesso - cerca\".';

  @override
  String get localWifiJoinReady => 'Sono connesso: cerca';

  @override
  String get localWifiRouterIntro =>
      'Connetti tutti i dispositivi allo stesso router/AP Wi‑Fi. Il router non ha bisogno di Internet, ma solo di una rete locale condivisa.';

  @override
  String get localWifiRouterSearch => 'Cerca su questo Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Aggiorna Wi‑Fi informazioni';

  @override
  String get localWifiRouterNoWifiTitle => 'Non su Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Unisciti a Wi‑Fi del router nelle Impostazioni di sistema, quindi cerca di nuovo.';

  @override
  String get localWifiDiscovering => 'Ricerca su Wi‑Fi locale…';

  @override
  String get localWifiPeersFound => 'Dispositivi su questa rete';

  @override
  String get localWifiStop => 'Fermare';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nome non disponibile';

  @override
  String get localWifiStubBanner => 'In attesa della presa LAN…';

  @override
  String get localWifiLiveBanner =>
      'LAN discovery live (UDP): annuncio + chat sigillata su questo Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Nessun dispositivo ancora.\nVerifica che gli amici si siano uniti al tuo hotspot e abbiano consentito l\'accesso alla rete locale.';

  @override
  String get localWifiEmptyRouter =>
      'Nessun dispositivo ancora.\nStesso SSID? Rete locale consentita? Alcuni router bloccano il traffico da dispositivo a dispositivo (isolamento AP).';

  @override
  String get localWifiIsolationHelp => 'Perché non possiamo trovarci?';

  @override
  String get localWifiIsolationTitle => 'Il router potrebbe isolare i client';

  @override
  String get localWifiIsolationBody =>
      'Se l\'isolamento AP/client (o una rete ospite) è attivo, i telefoni sullo stesso Wi‑Fi non possono parlare. Disattiva l\'isolamento, utilizza l\'SSID principale o passa alla modalità Nelle vicinanze (Hotspot).';

  @override
  String get localWifiPeerReady => 'Pronto per chattare (ha la chiave)';

  @override
  String get localWifiPeerNeedKey =>
      'Trovato: scansiona il QR per scambiare le chiavi';

  @override
  String get localWifiErrorTitle => 'Errore Wi‑Fi locale';

  @override
  String get localWifiErrorBody =>
      'Qualcosa è andato storto. Fermati e riprova.';

  @override
  String get preparingSystem => 'Preparazione del sistema...';

  @override
  String get bootFailedTitle => 'Impossibile avviare';

  @override
  String get retry => 'Riprova';

  @override
  String get bootRecoveryAction =>
      'Avvia una nuova identità (cancella i dati locali)';

  @override
  String get bootRecoveryConfirmTitle => 'Iniziare una nuova identità?';

  @override
  String get bootRecoveryConfirmBody =>
      'Ciò cancellerà permanentemente le chat locali, le chiavi e l\'identità su questo dispositivo.\nI peer devono scansionare nuovamente il tuo QR con la tua nuova identità.\nQuesta operazione non può essere annullata.';

  @override
  String get bootRecoveryRunning => 'Reimpostazione dell\'identità locale…';

  @override
  String get bootRecoverySuccess =>
      'Reimpostazione dell\'identità locale completata';

  @override
  String bootRecoveryFailed(String error) {
    return 'Impossibile reimpostare l\'identità: $error';
  }

  @override
  String get cancel => 'Cancellare';

  @override
  String get save => 'Salva';

  @override
  String get close => 'Chiudi';

  @override
  String get start => 'Inizio';

  @override
  String get send => 'Inviare';

  @override
  String get settings => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get languageSubtitle =>
      'Per impostazione predefinita, l\'app segue la lingua del tuo telefono (se supportata). Altre lingue ricadono nell\'inglese. Puoi anche bloccare una lingua qui.';

  @override
  String get languageSystem => 'Predefinito del sistema';

  @override
  String get languageThai => 'tailandese';

  @override
  String get languageEnglish => 'Inglese';

  @override
  String get notificationsTooltip => 'Impostazioni di notifica';

  @override
  String get enableMessageNotifications => 'Abilita le notifiche dei messaggi';

  @override
  String get settingsNotificationsSubtitle =>
      'Messaggi 1:1 e persone online (avvisi locali)';

  @override
  String get networkMembersTooltip => 'Membri della rete';

  @override
  String get identityQrTooltip => 'Identità / QR';

  @override
  String get feedDirects => 'Chiacchierata';

  @override
  String get feedMesh => '#maglia';

  @override
  String get feedGeo => 'Zona';

  @override
  String get feedDirectsSubtitle => 'Messaggi E2EE privati';

  @override
  String get feedMeshSubtitle => 'peer vicini (BLE)';

  @override
  String get feedGeoSubtitle => 'Canale di scoperta di Geohash';

  @override
  String get peerIdHint =>
      'Incolla l\'ID del destinatario (hash della chiave pubblica) per avviare una chat';

  @override
  String get directsEmpty =>
      'Ancora nessuna chat: scansiona un QR o incolla un ID destinatario per iniziare\nI messaggi vengono sigillati con E2EE prima dell\'invio (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • toccare per aprire la chat';

  @override
  String get meshIntro =>
      'Peer nell\'intervallo BLE: tocca per una chat E2EE privata (nessuna composizione pubblica su #mesh)\nInvia tramite router ibrido (BLE + LoRa + Nostr quando online)';

  @override
  String get meshEmptyRunning =>
      'Ancora nessun peer nelle vicinanze: apri l\'app su un altro dispositivo nel raggio di BLE';

  @override
  String get meshEmptyStopped =>
      'BLE non è in esecuzione: concedi l\'autorizzazione Bluetooth/Posizione';

  @override
  String get meshNearbyPrefix => 'Nelle vicinanze';

  @override
  String get meshRetentionTitle => 'Elimina automaticamente i messaggi';

  @override
  String get meshRetentionSubtitle =>
      'La cronologia chat locale precedente viene rimossa automaticamente';

  @override
  String get meshRetentionKeep => 'Mantenere';

  @override
  String get meshRetention1Day => '1 giorno';

  @override
  String get meshRetention3Days => '3 giorni';

  @override
  String get meshRetention7Days => '7 giorni';

  @override
  String get refreshLocationTooltip => 'Aggiorna posizione';

  @override
  String get geoIntro =>
      'Le persone online in questo geohash possono ricevere messaggi 1:1 o con un fan-out pubblico dell\'area (ancora E2EE sigillato per peer, non testo in chiaro)';

  @override
  String geoEmpty(String channel) {
    return 'Ancora nessuno online in $channel\nUsa Trasporti → Internet/Auto, attendi Nostr, aggiorna la posizione';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online in $channel • tocca per 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Nelle vicinanze (in attesa di presenza area) • toccare per 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Visto su Nostr in $channel • solo scoperta (legacy)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Presenza anonima legacy: attendi un peer associato o scambia QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE nelle vicinanze: scansiona il QR per avviare 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Per scoprire Internet è necessario che Nostr sia connesso (Impostazioni → Trasporto → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Posizione non ancora risolta: consenti il ​​GPS e aggiorna per pubblicare il tuo geohash su Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Autorizzazione alla posizione negata: consenti ResilNet in Impostazioni → Privacy → Posizione';

  @override
  String get geoEmptyServicesDisabled =>
      'I servizi di localizzazione sono disattivati: attivali nelle Impostazioni';

  @override
  String get geoEmptyNoGpsFix =>
      'Impossibile ottenere una correzione GPS (comune sugli iPad Wi‑Fi): imposta manualmente il geohash di seguito';

  @override
  String get geoEmptyTeleportHint =>
      'Tocca l\'icona del luogo → inserisci un geohash (ad esempio w5) → Teletrasporto';

  @override
  String get geoSetGeohashManually => 'Imposta geohash';

  @override
  String get geoTeleportHint =>
      'Niente GPS? Inserisci il prefisso geohash (2–7 caratteri, ad esempio w5) e tocca Teletrasporto';

  @override
  String get geoTeleportInvalid =>
      'Geohash non valido: utilizza solo lettere/numeri Base32 (ad esempio w5 o w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Area impostata su $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Area manuale: $channel (l\'aggiornamento GPS avrà la priorità)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr non pronto: tocca Riconnetti (0/0 finché l\'inizializzazione non riesce)';

  @override
  String get geoEmptyMeshOnly =>
      'Il trasporto è solo Mesh: passa a Internet o Auto per scoprire peer su Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Ancora nessuno in $channel: mantieni Area + Internet aperta su entrambi i dispositivi e attendi circa 60 secondi';
  }

  @override
  String get geoChannelFallback => '#zona';

  @override
  String get geoRefreshLocation => 'Aggiorna posizione';

  @override
  String get settingsClearLocationTitle => 'Posizione chiara';

  @override
  String get settingsClearLocationSubtitle =>
      'Rimuovi geohash GPS/teletrasporto (l\'area diventa #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Posizione chiara?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Elimina il geohash memorizzato su questo dispositivo. Puoi aggiornare il GPS o teletrasportarti nuovamente in seguito.';

  @override
  String get settingsClearLocationAction => 'Posizione chiara';

  @override
  String get settingsClearLocationSnack => 'Posizione cancellata';

  @override
  String get chatVoiceTooLarge =>
      'Nota vocale troppo grande: massimo circa 30 secondi';

  @override
  String get chatVoiceNeedInternet =>
      'La nota vocale necessita di Internet (Nostr): troppo grande solo per BLE';

  @override
  String get chatVoiceSentInternet => 'Nota vocale inviata via Internet';

  @override
  String get noticeAnonMention => 'menzione';

  @override
  String get noticeAnonDm => 'messaggio diretto';

  @override
  String get noticeAnonHug => 'abbraccio';

  @override
  String get noticeAnonSlap => 'schiaffo';

  @override
  String get noticeAnonBlock => 'bloccare';

  @override
  String get noticeAnonNeedKey =>
      'Nessuna chiave pubblica ancora: scambia prima QR per 1:1';

  @override
  String get noticeAnonActionSent => 'Inviato';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Bloccato $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*un abbraccio $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* schiaffeggia $anon *';
  }

  @override
  String get geoReconnectNostr => 'Riconnetti Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relè';

  @override
  String get nostrSectionSubtitle =>
      'La messaggistica Internet e l\'individuazione dell\'area utilizzano questi relè. Tocca Riconnettiti se lo stato rimane offline.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Connesso $connected/$total';
  }

  @override
  String get nostrStatusOffline => 'Offline: relè elencati ma nessuno connesso';

  @override
  String get nostrStatusNotInit =>
      'Non avviato (0/0): toccare Riconnetti per inizializzare';

  @override
  String get nostrReconnectAction => 'Riconnetti Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr connesso ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Ancora offline: controlla Wi‑Fi/cellular o riprova';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Non riuscito: $error';
  }

  @override
  String get nostrReconnecting => 'Connessione ai relè...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) in $channel • chat sigillata pronta';
  }

  @override
  String get transportModeTitle => 'Trasporti di zona';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE nelle vicinanze (radio) quando non Nostr · Internet e Auto = Nostr elenco persone';

  @override
  String get transportModeMesh => 'Maglia';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint =>
      'Messaggio pubblico a tutti coloro che sono online in quest\'area';

  @override
  String get geoPublicSend => 'Pubblico';

  @override
  String geoPublicHelp(int count) {
    return 'Distribuzione sigillata a $count peer online: ciascuno riceve una busta privata';
  }

  @override
  String geoPublicSent(int count) {
    return 'Inviato a $count peer in quest\'area';
  }

  @override
  String get geoPublicSentNone =>
      'Nessun peer inviabile tramite messaggi online: apri Area/Mesh con peer che dispongono di chiavi o attendi BLE/Nostr';

  @override
  String get areaPublicBadge => 'Zona pubblica';

  @override
  String get geoErrorPermission =>
      'Impossibile leggere la posizione: controlla l\'autorizzazione alla posizione';

  @override
  String get geoPrecisionRegion => 'Regione';

  @override
  String get geoPrecisionProvince => 'Provincia';

  @override
  String get geoPrecisionCity => 'Città';

  @override
  String get geoPrecisionNeighborhood => 'Quartiere';

  @override
  String get geoPrecisionBlock => 'Bloccare';

  @override
  String get aliasTitle => 'Imposta nickname (alias contatto)';

  @override
  String get aliasHintBody =>
      'Questo alias è archiviato solo su questo dispositivo (solo locale)\nNon viene mai inviato con traffico E2EE';

  @override
  String get aliasLabel => 'Soprannome';

  @override
  String get aliasHint => 'per esempio. “capo villaggio”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Dispositivi';

  @override
  String get settingsFirmwareTitle => 'Scarica/aggiorna il firmware ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Scarica i file .bin e aggiorna la scheda ESP32 tramite OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic ponte';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Bridge A/B di solo testo, non ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Sposta il breve testo in chiaro tra Meshtastic e ResilNet. Le modalità A e B non possono essere eseguite contemporaneamente. Questa non è una crittografia end-to-end.';

  @override
  String get mtBridgeModeLabel => 'Modalità';

  @override
  String get mtBridgeModeOff => 'Spento';

  @override
  String get mtBridgeModeA => 'Ingerire A';

  @override
  String get mtBridgeModeB => 'Uscita B';

  @override
  String get mtBridgeModeOffShort => 'Spento';

  @override
  String get mtBridgeModeAShort => 'Nell\'A';

  @override
  String get mtBridgeModeBShort => 'Fuori B';

  @override
  String get mtBridgeMutexHint =>
      'La selezione di una modalità disattiva automaticamente l\'altra. La simultanea A+B non è supportata.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (registrazione)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Il testo in entrata viene visualizzato sotto Avvisi come #meshtastic. Il relè mesh è opzionale (disattivato per impostazione predefinita).';

  @override
  String get mtBridgeRelayTitle => 'Inoltra anche su mesh ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Quando è attivo vengono trasmessi i bollettini pubblici firmati. Spento = solo Avvisi di questo telefono.';

  @override
  String get mtBridgeSimulateHint => 'Messaggio dimostrativo';

  @override
  String get mtBridgeSimulate => 'Simula il messaggio Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Inserito negli avvisi (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Attenzione: i messaggi inviati qui NON sono ResilNet E2EE. Chiunque si trovi nel percorso Meshtastic può leggerli.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Testo da pubblicare';

  @override
  String get mtBridgeSend => 'Invia a Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'In coda per Meshtastic (vedi registro/cronologia)';

  @override
  String get mtBridgeLastEgress => 'Ultima uscita';

  @override
  String get mtBridgeEgressHistory => 'Uscita recente';

  @override
  String get mtBridgeOffHint =>
      'Attiva Ingest (A) o Egress (B) per utilizzare il bridge.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTICO · non E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Utilizza il trasporto MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Disattivato = solo registrazione demo (MQTT in ingresso ignorato). On = MQTT per l\'inserimento/l\'uscita quando connesso.';

  @override
  String get mtBridgeMqttHost => 'Ospite dell\'intermediario';

  @override
  String get mtBridgeMqttPort => 'Porta';

  @override
  String get mtBridgeMqttTls => 'Utilizza TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Porta tipica 8883. Utilizza certificati di sistema; fallisce in modo debole in caso di errori di handshake.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Riconnessione automatica';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Quando è attivo, il client tenta di riconnettersi dopo le interruzioni. Lo stato mostra Connessione in corso fino al ripristino.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Aiutanti per argomenti';

  @override
  String get mtBridgeMqttRegion => 'Prefisso regionale (facoltativo)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Se impostato, Apply ricostruisce la root come msh/<region>/2/json (sostituisce la root dell\'argomento).';

  @override
  String get mtBridgeMqttTopicRoot => 'Radice dell\'argomento JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nome del canale di downlink';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Applica root → iscriviti/pubblica argomenti';

  @override
  String get mtBridgeMqttAdvanced => 'MQTT avanzato';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, riconnessione, argomenti, credenziali';

  @override
  String get mtBridgeMqttTopicIn => 'Sottoscrivi argomento';

  @override
  String get mtBridgeMqttTopicOut => 'Pubblica argomento';

  @override
  String get mtBridgeMqttGatewayFrom => 'ID nodo gateway (da)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ID decimale o !hex: richiesto per il downlink sendtext';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Indice del canale mesh (opzionale 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nome utente (facoltativo)';

  @override
  String get mtBridgeMqttPass => 'Password (facoltativa)';

  @override
  String get mtBridgeMqttPassStored =>
      'Su questo dispositivo è memorizzata una password (non mostrata).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nuova password (lascia vuoto per mantenerla)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Lasciare vuoto per mantenere la password memorizzata.';

  @override
  String get mtBridgeMqttPassClear => 'Cancella password';

  @override
  String get mtBridgeMqttSave => 'Salva MQTT impostazioni';

  @override
  String get mtBridgeMqttSaved => 'MQTT impostazioni salvate';

  @override
  String get mtBridgeMqttConnect => 'Collegare';

  @override
  String get mtBridgeMqttDisconnect => 'Disconnetti';

  @override
  String get mtBridgeMqttConnected => 'MQTT connesso';

  @override
  String get mtBridgeMqttConnecting => 'MQTT connessione in corso...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT disconnesso';

  @override
  String get mtBridgeMqttError => 'Errore MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Passa prima a Ingest (A).';

  @override
  String get mtBridgeErrModeEgress => 'Passa prima all\'uscita (B).';

  @override
  String get mtBridgeErrRate => 'Rallenta: velocità limitata';

  @override
  String get mtBridgeErrDedupe => 'Messaggio duplicato ignorato';

  @override
  String get mtBridgeErrLoop => 'Droppato per evitare un loop del ponte';

  @override
  String get mtBridgeErrEmpty => 'Il messaggio è vuoto';

  @override
  String get mtBridgeErrPublish => 'Pubblicazione non riuscita';

  @override
  String get mtBridgeErrNotConnected => 'MQTT non connesso';

  @override
  String get mtBridgeErrMissingHost => 'Inserisci MQTT host broker';

  @override
  String get mtBridgeErrMissingTopic =>
      'Inserisci iscriviti e pubblica argomenti';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Inserisci l\'ID del nodo gateway (da) per sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT connessione non riuscita';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Connessione TLS non riuscita';

  @override
  String get settingsData => 'Dati';

  @override
  String get settingsDataHint =>
      'Elimina i messaggi locali per ridurre le dimensioni del database: identità, chiavi e peer vengono mantenuti';

  @override
  String get settingsSaveHistoryTitle => 'Salva la cronologia dei messaggi';

  @override
  String get settingsSaveHistorySubtitle =>
      'Quando sono disattivati, i messaggi rimangono E2EE in rete e vengono conservati solo per questa sessione (non nella cronologia della chat locale). Il tuo testo viene ancora visualizzato come testo normale su questo dispositivo.';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsE2eeTitle => 'Crittografia end-to-end';

  @override
  String get settingsE2eeSubtitle =>
      'Sempre attivo: i messaggi vengono sigillati con RSA-OAEP + AES-GCM prima dell\'invio. I relè e gli hop vicini non possono leggere i contenuti.';

  @override
  String get settingsScreenshotTitle => 'Avvisi di screenshot';

  @override
  String get settingsScreenshotSubtitle =>
      'Mostra una riga di sistema nella chat quando questo dispositivo acquisisce lo schermo';

  @override
  String get settingsNostrExpiryTitle => 'Nostr messaggio conserva l\'ora';

  @override
  String get settingsNostrExpirySubtitle =>
      'Per quanto tempo le buste sigillate devono rimanere localmente quando sono online tramite Nostr';

  @override
  String get noticeExpiresIn => 'scade tra';

  @override
  String get noticesTitle => 'Avvisi';

  @override
  String get noticesMeshIntro =>
      'Bollettino pubblico — visibile a tutti nel raggio radio, non crittografato. Salta da telefono a telefono offline e le caselle di ResilNet ritrasmissione nelle vicinanze ne conservano una copia in modo che le persone che arrivano più tardi la vedano ancora.';

  @override
  String get noticesMeshPublicBadge => 'PUBBLICO · non crittografato';

  @override
  String get noticesGeoIntro =>
      'Aggiungi brevi note per questo luogo in modo che altri visitatori possano trovarle.';

  @override
  String get noticesEmpty => 'nessun avviso ancora';

  @override
  String get noticesEmptyHint =>
      'appunta il primo avviso per le persone da queste parti.';

  @override
  String get noticesComposeHint => 'pubblica un avviso...';

  @override
  String get noticesUrgent => 'urgente';

  @override
  String get noticesOpen => 'Avvisi';

  @override
  String get screenshotTaken => '*hai fatto uno screenshot*';

  @override
  String get chatAttachImage => 'Allega immagine';

  @override
  String get chatImageLabel => 'Immagine';

  @override
  String get chatImageTooLarge =>
      'Immagine troppo grande: prova con un\'altra foto';

  @override
  String get chatNostrExpiry => 'Nostr mantieni';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Invia a $channel: pubblico';
  }

  @override
  String get settingsClearTitle => 'Cancella tutti i messaggi';

  @override
  String get settingsClearSubtitle =>
      'Elimina tutte le chat su questo dispositivo';

  @override
  String get settingsClearConfirmTitle => 'Cancellare tutti i messaggi?';

  @override
  String get settingsClearConfirmBody =>
      'Verranno eliminati tutti i messaggi di chat su questo dispositivo.\nCoetanei e soprannomi non vengono rimossi.';

  @override
  String get settingsClearAction => 'Cancella dati';

  @override
  String get settingsClearedSnack => 'Dati cancellati';

  @override
  String settingsVersion(String version) {
    return 'versione $version';
  }

  @override
  String get meshBleScanning => 'BLE: scansione dei nodi';

  @override
  String get meshBleEsp32Scanning => 'ESP32: ricerca di un nodo vicino';

  @override
  String get meshBleSyncing => 'BLE: sincronizzazione con ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: pubblicazione';

  @override
  String get meshBleIdle =>
      'BLE mesh attivo: ancora nessun telefono nelle vicinanze';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh: $count telefono/i nelle vicinanze';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: autorizzazione richiesta';

  @override
  String get meshBlePausedCamera =>
      'BLE in pausa per la fotocamera: tocca Avvia BLE';

  @override
  String get meshBleStopped =>
      'BLE è disattivato: verifica che il Bluetooth sia attivo, quindi tocca Avvia BLE';

  @override
  String get meshBleRestart => 'Inizia BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Controlla le autorizzazioni e avvia BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count peer vicini • LoRa $lora • sincronizza ~${meters}m';
  }

  @override
  String get meshLoraReady => 'pronto';

  @override
  String get meshLoraNotReady => 'non pronto';

  @override
  String meshGatewayProgress(String label) {
    return 'UDP del gateway: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: pronto';

  @override
  String get permissionTitle =>
      'Consenti l\'accesso per avviare la rete mesh BLE';

  @override
  String get permissionBody =>
      'L\'app richiede Bluetooth (scansione/connessione/pubblicità), posizione (per dispositivi Android meno recenti) e microfono (per note vocali nella chat e annunci) per la messaggistica della community.';

  @override
  String get permissionE2ee =>
      'Crittografia end-to-end (E2EE)\nI nodi di inoltro non possono leggere il contenuto del messaggio';

  @override
  String get permissionReady => 'Autorizzazioni pronte';

  @override
  String get permissionRequest => 'Consenti e continua';

  @override
  String get permissionNotReadySnack =>
      'Sistema non ancora pronto: attendi un attimo e riprova';

  @override
  String get permissionDeniedSnack =>
      'Autorizzazioni incomplete: apri Impostazioni > ResilNet e consenti Bluetooth/Posizione/Microfono';

  @override
  String get permissionMicDenied =>
      'Accesso al microfono negato: consentilo in Impostazioni per registrare note vocali';

  @override
  String get permissionMicOpenSettings => 'Impostazioni';

  @override
  String get permissionCameraDenied =>
      'Accesso alla fotocamera negato: consentilo nelle Impostazioni per scansionare i codici QR';

  @override
  String get permissionCameraFailed =>
      'Per scansionare i codici QR è necessaria l\'autorizzazione della fotocamera';

  @override
  String get permissionCameraOpenSettings => 'Impostazioni';

  @override
  String get permissionPhotosDenied =>
      'Accesso alla libreria foto negato: consentilo in Impostazioni per salvare il tuo codice QR';

  @override
  String get permissionPhotosFailed =>
      'Per salvare il codice QR è necessaria l\'autorizzazione della libreria foto';

  @override
  String get permissionPhotosOpenSettings => 'Impostazioni';

  @override
  String permissionFailedSnack(String error) {
    return 'Richiesta di autorizzazione non riuscita: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architettura • Multi-hop Store-and-Forward';

  @override
  String get onboardingSkip => 'Saltare';

  @override
  String get onboardingNext => 'Prossimo';

  @override
  String get onboardingStart => 'Inizia';

  @override
  String get onboardingWelcomeTitle => 'Benvenuto a ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chatta su ResilNet su una rete mesh, anche senza Internet';

  @override
  String get onboardingFriendsTitle => 'Aggiungi facilmente gli amici';

  @override
  String get onboardingFriendsBody =>
      'Condividi un QR da Identity o scansiona il QR di un amico per scambiare chiavi pubbliche';

  @override
  String get onboardingChannelsTitle => 'Chat crittografata + canali vicini';

  @override
  String get onboardingChannelsBody =>
      'Cambia #mesh / Area (geohash) per trovare peer vicini: i messaggi rimangono E2EE su BLE mesh e Nostr';

  @override
  String get chatTitle => 'Chatta (E2EE)';

  @override
  String get chatScanTooltip => 'Scansiona il QR per aggiungere un peer';

  @override
  String get chatBlockTooltip => 'Blocca questo mittente';

  @override
  String get chatBlockedSnack => 'Bloccato: nessuna notifica/nessun relè';

  @override
  String get chatAliasTooltip => 'Imposta soprannome';

  @override
  String get chatReceiverPemLabel => 'Chiave pubblica del destinatario (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Incolla la chiave pubblica del tuo amico (da QR/file condiviso)';

  @override
  String get chatNeedPeerKey =>
      'Scansiona prima il QR di questo peer (è richiesta la chiave pubblica verificata)';

  @override
  String get chatPeerKeyMismatch =>
      'La chiave pubblica archiviata non corrisponde a questo ID peer';

  @override
  String chatVoiceFailed(String error) {
    return 'Impossibile registrare l\'audio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Impossibile riprodurre la nota vocale: $error';
  }

  @override
  String get chatPlayVoice => 'Riproduci la nota vocale';

  @override
  String get chatPauseVoice => 'Pausa';

  @override
  String get chatVoiceLabelSent => '🎤 Nota vocale (sigillata)';

  @override
  String get chatVoiceLabel => '🎤 Nota vocale';

  @override
  String get chatDecryptFailed => '[decifratura fallita]';

  @override
  String chatSentSealed(String preview) {
    return '[sigillato • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[sigillato]';

  @override
  String get chatComposeHint => 'Digita un messaggio... (sigillato all\'invio)';

  @override
  String get chatEmptyThread =>
      'Nessun messaggio ancora\nDigita di seguito per inviare tramite mesh';

  @override
  String chatLoadFailed(String error) {
    return 'Impossibile caricare la conversazione: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'In attesa di';

  @override
  String get statusSent => 'Inviato';

  @override
  String get statusRelayed => 'Trasmesso';

  @override
  String get statusDelivered => 'Consegnato';

  @override
  String get statusRead => 'Leggere';

  @override
  String get statusFailed => 'Fallito';

  @override
  String get chatCopy => 'Copia';

  @override
  String get chatDeleteLocal => 'Elimina su questo dispositivo';

  @override
  String get chatDeletedLocalSnack => 'Eliminato su questo dispositivo';

  @override
  String get chatRetry => 'Riprova';

  @override
  String get chatSendFailed => 'Non consegnato: tocca Riprova';

  @override
  String get chatImageNeedInternet =>
      'Connettersi a Internet per inviare immagini';

  @override
  String get chatImageTooLargeOnline =>
      'Impossibile comprimere abbastanza l\'immagine da inviare';

  @override
  String get chatOpenLinkFailed => 'Impossibile aprire il collegamento';

  @override
  String get identityTitle => 'Identità';

  @override
  String get identityScanTooltip => 'Scansiona il codice QR con la fotocamera';

  @override
  String get identityCopiedHash => 'Hash della chiave pubblica copiato';

  @override
  String get identityPeerSaved => 'Peer salvato da QR';

  @override
  String get identityGalleryDenied =>
      'Autorizzazione della raccolta foto negata';

  @override
  String get identityQrSaved => 'QR salvato nella libreria di foto';

  @override
  String identityQrSaveFailed(String error) {
    return 'Impossibile salvare il QR: $error';
  }

  @override
  String get peersTitle => 'Membri della rete';

  @override
  String get qrScanTitle => 'Scansiona il QR per aggiungere un amico';

  @override
  String get qrInvalid => 'Scansione non riuscita: QR non valido';

  @override
  String get qrIdKeyMismatch =>
      'QR rifiutato: l\'ID non corrisponde alla chiave pubblica';

  @override
  String get qrCameraNotReady => 'Fotocamera non pronta';

  @override
  String get qrRetrySettings => 'Riprova / apri le impostazioni';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Impossibile aprire la fotocamera: $error';
  }

  @override
  String get qrScanAlignHint =>
      'Allinea il codice QR all\'interno della cornice';

  @override
  String get firmwareDownloadTitle => 'Scarica il firmware ESP32';

  @override
  String get firmwareSourceOnline => 'Ultime (online)';

  @override
  String get firmwareSourceCached => 'Copia salvata (offline)';

  @override
  String get firmwareSourceBaseline => 'Riferimento in bundle (offline)';

  @override
  String get firmwareSourceUnavailable => 'Nessun firmware disponibile';

  @override
  String get firmwareBaselineIncompatible =>
      'Il firmware in bundle è troppo vecchio: connettiti a Internet per scaricare una versione più recente';

  @override
  String get firmwareChecksumFailed =>
      'Controllo dell\'integrità del firmware non riuscito: lampeggiamento bloccato';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware pronto: $source';
  }

  @override
  String get peersRefreshTooltip => 'Aggiorna';

  @override
  String get peersBlocked => 'Bloccato';

  @override
  String get peersNearbyBle => 'Nelle vicinanze (BLE)';

  @override
  String get peersRecentlyOnline => 'Recentemente online';

  @override
  String get peersOnlineInArea => 'In linea in zona';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Visto $minutes minuto fa';
  }

  @override
  String get peersOffline => 'Non in linea';

  @override
  String peersBlockedSnack(String id) {
    return 'Bloccato $id';
  }

  @override
  String get peersUnblockedSnack => 'Sbloccato';

  @override
  String get peersEmpty =>
      'Nessun membro ancora nel database\nScansiona un QR o attendi il rilevamento della mesh BLE';

  @override
  String get peersOpenChat => 'Apri la chat';

  @override
  String get peersBlockAction => 'Bloccare';

  @override
  String get peersUnblockAction => 'Sbloccare';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Area';

  @override
  String get locationPickerTooltip => 'Canale di localizzazione';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Persone in linea';

  @override
  String get unreadDirectsTooltipEmpty => 'Messaggi privati';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count messaggi privati ​​non letti';
  }

  @override
  String get onlinePeopleTitle => 'persone';

  @override
  String get onlinePeopleEmpty => 'Nessuno online ancora qui';

  @override
  String onlinePeopleCount(int count) {
    return '$count in linea';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · vicinanze + zona';

  @override
  String get peerOnlineMeshTitle => 'Qualcuno nelle vicinanze sulla rete';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name è nelle vicinanze sulla mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Qualcuno in linea in zona';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name è online tramite Nostr';
  }

  @override
  String get locationSheetTitle => '#canali di localizzazione';

  @override
  String get channelPinsTitle => 'Appuntato';

  @override
  String get channelPinsHint =>
      'Blocca i canali che usi spesso: rimangono in alto';

  @override
  String get channelPinTooltip => 'Blocca questo canale';

  @override
  String get channelUnpinTooltip => 'Sblocca';

  @override
  String get locationSheetIntro =>
      'Chatta con le persone nelle vicinanze utilizzando il geohash approssimativo, non il GPS preciso. La presenza su Internet utilizza chiavi Nostr anonime.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teletrasporto';

  @override
  String homeComposeHint(String channel) {
    return 'Messaggio $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Invia a $channel: pubblico';
  }

  @override
  String get messageExpiryTitle => 'scade tra';

  @override
  String get voiceRecordTapToStart =>
      'Tocca per registrare il messaggio vocale';

  @override
  String get voiceRecordTooShort => 'Registrazione troppo breve: riprova';

  @override
  String get voiceRecordFailed =>
      'Impossibile salvare la registrazione: riprova';

  @override
  String get voicePttHold => 'Tieni premuto per registrare';

  @override
  String get voicePttRelease => 'Rilascia per visualizzare l\'anteprima';

  @override
  String get voicePttRecording => 'Registrazione…';

  @override
  String get voicePttDraftReady => 'Nota vocale pronta';

  @override
  String get voicePttDiscard => 'Scartare';

  @override
  String get voicePttReRecord => 'Registra di nuovo';

  @override
  String get voicePttSend => 'Invia nota vocale';

  @override
  String get voicePttPlayPreview => 'Riproduci l\'anteprima';

  @override
  String get voicePttStopPreview => 'Interrompi l\'anteprima';

  @override
  String get noticesBackfilling => 'Caricamento avvisi...';

  @override
  String get noticesNostrOnline => 'Nostr in linea';

  @override
  String get noticesNostrOffline =>
      'Nostr offline: il bollettino necessita di Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count avvisi caricati';
  }

  @override
  String get noticePublishFailed =>
      'Impossibile pubblicare l\'avviso al consiglio di zona. Controlla la connessione Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Salvato localmente. Connettiti a una radio mesh nelle vicinanze (o gateway Wi‑Fi) in modo che altri possano riceverlo.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bollettino inviato a $count dispositivi vicini su BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Sono state rilevate radio nelle vicinanze, ma la scrittura BLE non è riuscita. Mantieni entrambe le app aperte nella schermata Avvisi e riprova (o utilizza un relè ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Il ricevitore BLE di questo dispositivo non è pronto. Attiva/disattiva Bluetooth e riapri Avvisi.';

  @override
  String get noticeDelete => 'Elimina avviso';

  @override
  String get noticeDeleteConfirmTitle => 'Eliminare questo avviso?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Verrà rimosso solo da questo dispositivo. Gli altri che l\'hanno già ricevuto lo vedranno ancora.';

  @override
  String get noticeDeleted => 'Avviso cancellato';

  @override
  String get chatNoticeHidden => 'Avviso di zona — Avvisi aperti';

  @override
  String get identityDisplayNameTitle => 'Nome da visualizzare';

  @override
  String get identitySaveName => 'Salva nome';

  @override
  String get identityUserIdLabel => 'ID utente (hash della chiave pubblica)';

  @override
  String get identityCopyHashTooltip => 'Copia l\'hash della chiave pubblica';

  @override
  String get identityMyQrTitle => 'Il mio QR (id + pubKey + nome)';

  @override
  String identityQrFailed(String error) {
    return 'Impossibile creare il QR\n$error';
  }

  @override
  String get identitySaving => 'Risparmio…';

  @override
  String get identitySaveQr => 'Salva QR nella libreria di foto';

  @override
  String get identityOpenScanner => 'Apri la fotocamera per scansionare il QR';

  @override
  String get identityQrHelp =>
      'Chiedi a un amico di scansionarlo per salvare la tua chiave pubblica e (se necessario) impostarti come emittente verificato';

  @override
  String get identityChatTip =>
      'Suggerimento: puoi anche scansionare un QR in chat per aggiungere una chiave pubblica per E2EE';

  @override
  String get infoOpen => 'Informazioni/Informazioni';

  @override
  String get docsGuideTitle => 'Guida per l\'utente';

  @override
  String get docsGuideSubtitle => 'Si apre nel browser';

  @override
  String get docsOpenAction => 'Apri la guida';

  @override
  String get docsOpenFailed => 'Impossibile aprire la guida per l\'utente';

  @override
  String get firmwareOtaGuideTitle => 'Guida Flash e protocollo OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Apre la guida Web: download di file .bin e passaggi completi';

  @override
  String get firmwareWebDownloadsTitle => 'Download del firmware sul Web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Collegamenti e checksum per versione sul sito della documentazione';

  @override
  String get inviteCopyShortLink => 'Copia il collegamento breve';

  @override
  String get inviteShareLink => 'Condividi collegamento';

  @override
  String get inviteShowFullLink => 'Collegamento completo';

  @override
  String get inviteCopyFullLink => 'Copia il collegamento completo';

  @override
  String get inviteLinkCopied => 'Collegamento copiato';

  @override
  String get inviteLongPressHint =>
      'Premi a lungo per le azioni di collegamento';

  @override
  String get inviteSendInChat => 'Invia nella chat ResilNet...';

  @override
  String get inviteSendInChatHint =>
      'Solo le persone per le quali hai già una chiave pubblica';

  @override
  String get inviteSendInChatEmpty =>
      'Nessuna chat ancora messaggiabile.\nScansiona prima un QR, apri Area/Mesh o condividi prima il collegamento all\'esterno dell\'app.';

  @override
  String get inviteSentToChat => 'Invito inviato in chat';

  @override
  String get infoTabInfo => 'Informazioni';

  @override
  String get infoTabSettingsHint =>
      'Apri Impostazioni dal menu per lingua, E2EE e strumenti dati';

  @override
  String get infoHowToTitle => 'Come usare';

  @override
  String get infoHowToBody =>
      '• Tocca l\'icona del canale per cambiare Chat / #mesh / Area\n• Tocca il luogo per scegliere la dimensione del geohash\n• Tocca le persone per i membri o chi è online\n• Apri Identity/QR da ⋮ per scambiare le chiavi di persona\n• L\'area “pubblica” invia E2EE sigillato a ciascun peer online, non a una stanza di testo in chiaro';

  @override
  String get infoFeaturesTitle => 'Caratteristiche';

  @override
  String get infoFeatureOffline =>
      'Messaggistica offline tramite Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Crittografia end-to-end con RSA-OAEP + AES-GCM (non Noise)';

  @override
  String get infoFeatureMultihop =>
      'I messaggi possono passare attraverso i peer vicini per andare più lontano';

  @override
  String get infoFeatureBridge =>
      'Mesh ibrido ↔ internet (Nostr) per buste sigillate';

  @override
  String get infoFeatureGeo =>
      'Canali geohash locali per le persone nelle vicinanze (discovery UX)';

  @override
  String get infoFeatureNotices => 'Bandi con scadenza per #mesh e Area';

  @override
  String get infoPrivacyTitle => 'Privacy';

  @override
  String get infoPrivacyNoRoom =>
      'Nessun villaggio in chiaro/chat room pubblica in rete';

  @override
  String get infoPrivacyFanout =>
      'Invio area = fan-out sigillato 1:1 verso peer con chiavi pubbliche conosciute';

  @override
  String get infoPrivacyPresence =>
      'La presenza nell\'area Internet utilizza chiavi Nostr temporanee';

  @override
  String get infoSymbolsTitle => 'Simboli';

  @override
  String get infoSymBle => 'Collegamento Bluetooth diretto';

  @override
  String get infoSymMesh => 'Raggiungibile tramite mesh (altri in avanti)';

  @override
  String get infoSymInternet => 'Via internet (Nostr) — buste sigillate';

  @override
  String get infoSymBridge =>
      'Arrivato tramite il percorso mesh↔bridge Internet';

  @override
  String get infoSymOffline => 'Offline: non raggiungibile in questo momento';

  @override
  String get infoSymInArea => 'Nell\'area del canale di questa posizione';

  @override
  String get infoSymE2eeOk => 'Sessione crittografata end-to-end';

  @override
  String get infoSymE2eeFail =>
      'Crittografia non disponibile: non inviare testo sensibile';

  @override
  String get infoSymVerified => 'Chiave di identità verificata/conosciuta';

  @override
  String get infoSymBlocked => 'Bloccato';

  @override
  String get infoSymUnread => 'Messaggio privato non letto';

  @override
  String get infoEmergencyTitle => 'Modalità di emergenza';

  @override
  String get infoEmergencyBody =>
      'Tocca tre volte il titolo ResilNet nella schermata iniziale per cancellare messaggi, chiavi e identità su questo dispositivo.';

  @override
  String get infoLegendNote =>
      'Alcune icone del percorso sono documentate qui per chiarezza; i segni di spunta di consegna in chat rimangono lo stato di invio principale.';

  @override
  String get dangerZoneTitle => 'Zona pericolosa';

  @override
  String get dangerZoneSubtitle =>
      'Elimina messaggi, chiavi di crittografia, identità Nostr, peer e nickname su questo dispositivo. Ti sistemerai di nuovo.';

  @override
  String get panicWipeTitle => 'Pulitura d\'emergenza';

  @override
  String get panicWipeSubtitle =>
      'Cancella tutto in locale, come toccare tre volte il titolo principale (il doppio tocco aggiorna le radio)';

  @override
  String get panicWipeConfirmTitle => 'Cancellare tutti i dati locali?';

  @override
  String get panicWipeConfirmBody =>
      'Ciò eliminerà permanentemente chat, chiavi e identità su questo telefono.\nI peer devono scambiare nuovamente le chiavi QR con la tua nuova identità.\nQuesta operazione non può essere annullata.';

  @override
  String get panicWipeAction => 'Pulisci tutto';

  @override
  String get panicWipeSnack => 'Identità locale cancellata: riconfigurata';

  @override
  String panicWipeFailed(String error) {
    return 'Cancellazione non riuscita: $error';
  }

  @override
  String get meshBridgeTitle => 'Ponte a rete';

  @override
  String get meshBridgeSubtitle =>
      'Se attivata (impostazione predefinita), le buste sigillate possono utilizzare sia BLE mesh che Internet (Nostr) insieme in modo che le isole mesh vicine possano connettersi. Quando è disattivato, gli invii utilizzano un solo percorso: non invia mai testo in chiaro sulla rete.';

  @override
  String get favoritesTitle => 'Preferiti';

  @override
  String get favoritesAdd => 'Aggiungi ai preferiti';

  @override
  String get favoritesRemove => 'Rimuovi dai preferiti';

  @override
  String get favoritesEmpty =>
      'Ancora nessun preferito: aggiungi un collega dall\'elenco dei membri';

  @override
  String get favoritesNearbyTitle => 'Preferito nelle vicinanze';

  @override
  String favoritesNearbyBody(String name) {
    return '$name è nelle vicinanze sulla mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Preferito in zona';

  @override
  String favoritesInAreaBody(String name) {
    return '$name è online in quest\'area';
  }

  @override
  String get topologyTitle => 'Topologia a maglie';

  @override
  String get topologySubtitle =>
      'Peer e suggerimenti di connessione dall\'annuncio mesh (sola lettura)';

  @override
  String get topologyConnectedNow => 'Connesso ora (BLE)';

  @override
  String get topologyNearby => 'Nelle vicinanze (BLE)';

  @override
  String get topologyKnown => 'Coetanei conosciuti';

  @override
  String get topologyEmpty =>
      'Nessun peer ancora imparato: rimani nelle vicinanze con BLE attivo';

  @override
  String get topologyYou => 'Voi';

  @override
  String topologyStats(int peers, int links) {
    return '$peers peer · $links collegamenti';
  }

  @override
  String get topologyGraphHint =>
      'Stima in base al rilevamento mesh nelle vicinanze: il tuo dispositivo è evidenziato. Tocca un collega per aprire la chat.';

  @override
  String get topologyOpen => 'Topologia a maglie';

  @override
  String get slashHelpTitle => 'Comandi';

  @override
  String get slashHelpBody =>
      '/help: questo elenco\n/who: persone online nel canale corrente\n/drop <testo>: appunta qui un avviso sigillato (fan-out E2EE)\n\nGuida completa: utilizza la guida Apri di seguito o Impostazioni → Guida per l\'utente.';

  @override
  String get slashWhoEmpty =>
      'Nessuno online in questo canale in questo momento';

  @override
  String slashWhoTitle(int count) {
    return 'In linea ($count)';
  }

  @override
  String get slashDropNeedText => 'Utilizzo: /rilascia il testo della nota';

  @override
  String slashDropDone(String channel) {
    return 'Avviso ritirato il $channel';
  }

  @override
  String get slashUnknown => 'Comando sconosciuto: prova /help';

  @override
  String get announceOpen => 'Annunci';

  @override
  String get announceTitle => 'Annunci';

  @override
  String get announceEmpty =>
      'Ancora nessuna bacheca: creane una per pubblicare avvisi bloccati o aperti';

  @override
  String get announceCreate => 'Crea tavola';

  @override
  String get announceCreateHint => 'Nome della scheda';

  @override
  String get announceDefaultTitle => 'Consiglio comunitario';

  @override
  String get announceSettings => 'Impostazioni della scheda';

  @override
  String get announceAllowLocked => 'Consenti post bloccati (crittografati).';

  @override
  String get announceAllowLockedSub =>
      'Crittografato sulla chiave della scheda: i lettori devono accedere';

  @override
  String get announceAllowOpen => 'Consenti post aperti (testo normale).';

  @override
  String get announceAllowOpenSub =>
      'Non E2EE: leggibile su mesh/relè. Disattivato per impostazione predefinita.';

  @override
  String get announceComposeHint => 'Scrivi un annuncio...';

  @override
  String get announceMediaInternetOnly =>
      'Annunci fotografici/vocali inviati tramite Internet (non BLE)';

  @override
  String get announceNeedInternet =>
      'Connettersi a Internet per inviare foto o annunci vocali';

  @override
  String announceVoiceFailed(String error) {
    return 'Impossibile registrare la voce: $error';
  }

  @override
  String get announceImageTooLarge =>
      'L\'immagine è troppo grande (max ~180 KB)';

  @override
  String get announcePlayVoice => 'Riproduci la nota vocale';

  @override
  String get announceImageLabel => '📷 Immagine';

  @override
  String get announceAudioLabel => '🎤 Nota vocale';

  @override
  String get announceModeLocked => 'Bloccato';

  @override
  String get announceModeOpen => 'Aprire';

  @override
  String get announceOpenBadge => 'APERTO · non crittografato';

  @override
  String get announceLockedBadge => 'Bloccato';

  @override
  String get announceLockedPlaceholder =>
      'Crittografato: richiedi l\'accesso in lettura';

  @override
  String get announceRequestAccess => 'Richiedi l\'accesso';

  @override
  String get announceRequestSent =>
      'Richiesta di accesso inviata al proprietario della scheda';

  @override
  String get announceRequestFailed =>
      'Impossibile richiedere l\'accesso (è necessaria la chiave pubblica del proprietario)';

  @override
  String get announceOpenConfirmTitle => 'Pubblicare senza crittografia?';

  @override
  String get announceOpenConfirmBody =>
      'I post aperti non sono E2EE. Chiunque sul percorso (mesh/relè) può leggerli. Continuare?';

  @override
  String get announcePostAction => 'Inviare';

  @override
  String get announcePendingRequests => 'Richieste di accesso';

  @override
  String get announceApprove => 'Approvare';

  @override
  String get announceDeny => 'Negare';

  @override
  String get announceGranted =>
      'Puoi leggere i post bloccati su questa bacheca';

  @override
  String get announceOwner => 'Possiedi questa scheda';

  @override
  String get announceCopyInvite => 'Copia il testo dell\'invito';

  @override
  String get announceShowInviteQr => 'Mostra il QR di invito';

  @override
  String get announceScanInviteQr => 'Scansiona il QR di invito della bacheca';

  @override
  String get announceFollow => 'Segui la bacheca dall\'invito';

  @override
  String get announceFollowHint =>
      'Incolla il testo dell\'invito o il link ResilNet del proprietario';

  @override
  String get announceFollowOk => 'Segue il consiglio';

  @override
  String announceFollowOkNamed(String title) {
    return 'Ora segue \"$title\"';
  }

  @override
  String get announceFollowFail => 'L\'invito non è valido o è danneggiato';

  @override
  String get announceInviteCopied => 'Testo dell\'invito copiato';

  @override
  String get announceInviteSaveQr => 'Salva QR';

  @override
  String get announceInviteShare => 'Condividi invito';

  @override
  String get announceFollowFromCompose =>
      'Invito alla bacheca rilevato nella finestra di messaggio';

  @override
  String get peerConfirmAddTitle => 'Aggiungere un membro della rete?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Aggiungere \"$name\" con la chiave pubblica in modo da potergli inviare messaggi in privato?';
  }

  @override
  String get peerConfirmAdd => 'Aggiungi membro';

  @override
  String peerAddedOk(String name) {
    return 'Aggiunto $name ai membri della rete';
  }

  @override
  String get peerAddFromCompose =>
      'Identità/chiave pubblica rilevata nella finestra di messaggio';

  @override
  String get peerHashCopied => 'Hash della chiave pubblica copiato';

  @override
  String get peerHashOpenChat => 'Apri la chat';

  @override
  String get peerHashAddHint =>
      'Ha copiato. Chiedi loro di condividere il collegamento identificativo o il QR in modo da poter aggiungere la chiave pubblica completa per E2EE.';

  @override
  String get peerQrNoCode => 'Nessun QR ResilNet trovato in questa immagine';

  @override
  String identityInviteSharePreamble(String name) {
    return 'Identità ResilNet: “$name”\nApri il collegamento o incollalo nella chat → Aggiungi membro\nOppure scansiona il QR dell\'identità.';
  }

  @override
  String get identityShareInvite => 'Condividi collegamento identità';

  @override
  String get identityInviteCopied => 'Collegamento identità copiato';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Invito al consiglio: \"$title\"\nApri ResilNet → Bacheche della community → Segui dall\'invito\nOppure scansiona il QR/tocca il link sottostante.';
  }

  @override
  String get announceConfirmFollowTitle => 'Seguire questa bacheca?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Seguire \"$title\" da questo invito?';
  }

  @override
  String get announceConfirmFollow => 'Seguire';
}

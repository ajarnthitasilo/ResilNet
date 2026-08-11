// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Actualisation ResilNet...';

  @override
  String get appRefreshed =>
      'Actualisé - les radios et la découverte ont redémarré';

  @override
  String appRefreshFailed(String error) {
    return 'Échec de l\'actualisation : $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Appuyez deux fois = actualisation douce. Appui long = récupération difficile. Appuyez trois fois = effacement d\'urgence.';

  @override
  String get softRefreshTipTitle => 'Si ResilNet se sent coincé';

  @override
  String get softRefreshTipBody =>
      'Appuyez deux fois sur ResilNet (en haut à gauche) pour une actualisation radio douce. Si le blocage persiste : appuyez longuement sur le titre, utilisez ⋮ → Récupération matérielle ou Paramètres. Appuyez trois fois pour effectuer un nettoyage d\'urgence uniquement.';

  @override
  String get softRefreshTipGotIt => 'J\'ai compris';

  @override
  String get infoSoftRefreshTitle => 'Si l\'application semble bloquée';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Appuyez deux fois sur ResilNet (en haut à gauche) → Actualiser les radios et les personnes à proximité';

  @override
  String get infoSoftRefreshStepHard =>
      'Toujours bloqué ? Appuyez longuement sur le titre, ou ⋮ / Paramètres → Récupération matérielle';

  @override
  String get infoSoftRefreshStepWait =>
      'Attendez le résultat du snack-bar, puis réessayez. La réinitialisation de session conserve vos clés.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Triple pression = effacement d\'urgence (supprime les données locales) — uniquement si intentionnel';

  @override
  String get appRecoverySection => 'Récupération d\'application';

  @override
  String get appRecoverySectionSubtitle =>
      'À utiliser lorsque l\'application semble gelée. Soft = titre double-cliquez. La récupération difficile est plus forte. La réinitialisation de session redémarre les services sans effacer les clés.';

  @override
  String get appHardRecoverAction => 'Récupération difficile';

  @override
  String get appHardRecovering => 'Difficile de récupérer…';

  @override
  String get appSessionResetAction => 'Réinitialiser la session';

  @override
  String get appSessionResetRunning => 'Réinitialisation de la session…';

  @override
  String get appSessionResetConfirmTitle => 'Réinitialiser la session ?';

  @override
  String get appSessionResetConfirmBody =>
      'Redémarre les services ResilNet sur cet appareil. Vos clés d\'identité sont conservées.';

  @override
  String get appRecoveryBusy => 'La récupération est déjà en cours…';

  @override
  String get appRecoveryOk => 'Récupération terminée';

  @override
  String get appRecoveryPartial =>
      'Récupération terminée avec quelques étapes ignorées – réessayez si vous êtes toujours bloqué';

  @override
  String get appRecoveryFailed =>
      'Échec de la récupération : essayez de réinitialiser la session ou forcez la fermeture de l\'application à partir du système d\'exploitation.';

  @override
  String get localWifiTitle => 'Local Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Reliez les appareils à proximité sans Internet, comme si vous étiez sur un seul réseau local.';

  @override
  String get localWifiNotGatewayHint =>
      'Pas la passerelle ESP32 LoRa SoftAP. Il s\'agit uniquement du téléphone↔téléphone/LAN.';

  @override
  String get localWifiUnavailable =>
      'Le local Wi‑Fi n\'est pas encore prêt : attendez le démarrage de l\'application.';

  @override
  String get lxmfBridgeTitle => 'Nœud d\'accueil';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac ou Pi en option sur votre Wi‑Fi qui relaie les discussions scellées. Désactivé par défaut. Ne remplace pas le chiffrement de bout en bout.';

  @override
  String get lxmfBridgeEnable => 'Utiliser le nœud d\'accueil';

  @override
  String get lxmfBridgeDisabledHint =>
      'Activez-la uniquement lorsque l\'application Bridge s\'exécute sur un Mac ou un Pi sur ce réseau.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'En ligne — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Impossible d\'atteindre le nœud d\'accueil – $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Adresse du nœud d\'origine';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP ou http://IP:port — exemple 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Homologue → destination LXMF (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Actualiser le statut';

  @override
  String get lxmfBridgeLabHint => 'Avancé : labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Paramètres du nœud d\'accueil';

  @override
  String get lxmfBridgeCheckConnection => 'Vérifier la connexion';

  @override
  String get lxmfBridgeStatusOnline => 'Connecté au nœud domestique';

  @override
  String get lxmfBridgeStatusOffline => 'Nœud d\'accueil non accessible';

  @override
  String get lxmfBridgeYourDest =>
      'L\'adresse de ce nœud (partager avec des amis)';

  @override
  String get lxmfBridgeCopyDest => 'Copier l\'adresse';

  @override
  String get lxmfBridgeDestCopied => 'Adresse copiée';

  @override
  String get lxmfBridgeLinkedPeers => 'Amis liés';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Chaque ami a besoin de son adresse de nœud personnel une fois. Les discussions scellées peuvent alors utiliser ce chemin.';

  @override
  String get lxmfBridgeNoLinks => 'Aucun ami lié pour l\'instant.';

  @override
  String get lxmfBridgeAddLink => 'Associer un ami';

  @override
  String get lxmfBridgePickPeer => 'Ami';

  @override
  String get lxmfBridgePeerDest => 'L\'adresse de leur nœud d\'accueil';

  @override
  String get lxmfBridgePeerDestHint =>
      'Code à 32 caractères provenant de l\'écran de leur nœud d\'accueil';

  @override
  String get lxmfBridgeInvalidDest =>
      'Cette adresse ne semble pas valide. Collez le code complet de leur nœud d\'accueil.';

  @override
  String get lxmfBridgeRemoveLink => 'Dissocier';

  @override
  String get lxmfBridgeSaveLink => 'Sauvegarder';

  @override
  String get lxmfBridgeLinkSaved => 'Ami lié';

  @override
  String get lxmfBridgeNoPeers =>
      'Aucun contact pouvant recevoir des messages pour l\'instant : ajoutez d\'abord un ami.';

  @override
  String get lxmfBridgeHelp =>
      'Gardez le pont opérationnel sur Mac/Pi. Ce chemin reste sur votre réseau local ; il n\'est pas LoRa et ne remplace pas Internet ou le maillage Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Proche';

  @override
  String get localWifiModeRouter => 'Routeur';

  @override
  String get localWifiHotspotIntro =>
      'Un appareil partage un point d\'accès personnel. D\'autres rejoignent ce point d\'accès, puis ResilNet les trouve sur le réseau local.';

  @override
  String get localWifiHostAction => 'Créer un réseau (Hôte)';

  @override
  String get localWifiJoinAction => 'Rejoindre le réseau';

  @override
  String get localWifiHostSteps =>
      '1. Ouvrez les paramètres iOS/Android et activez le point d\'accès personnel (ou le partage Internet).\n2. Dites à vos amis le nom du point d\'accès (et le mot de passe).\n3. Revenez ici et appuyez sur « Le point d\'accès est activé — commencez à attendre ».';

  @override
  String get localWifiHostReady =>
      'Le point d\'accès est activé – commencez à attendre';

  @override
  String get localWifiHostWaiting =>
      'En attendant que des amis nous rejoignent…';

  @override
  String get localWifiJoinSteps =>
      '1. Ouvrez les paramètres du système et rejoignez le point d\'accès personnel de votre ami.\n2. Revenez ici et appuyez sur « Je suis connecté – rechercher ».';

  @override
  String get localWifiJoinReady => 'Je suis connecté — recherche';

  @override
  String get localWifiRouterIntro =>
      'Connectez chaque appareil au même routeur/AP Wi‑Fi. Le routeur n\'a pas besoin d\'Internet, seulement d\'un réseau local partagé.';

  @override
  String get localWifiRouterSearch => 'Rechercher sur ce Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Actualiser les informations Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Pas le Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Rejoignez le Wi‑Fi du routeur dans les paramètres système, puis effectuez une nouvelle recherche.';

  @override
  String get localWifiDiscovering => 'Recherche sur Wi‑Fi local…';

  @override
  String get localWifiPeersFound => 'Appareils sur ce réseau';

  @override
  String get localWifiStop => 'Arrêt';

  @override
  String get localWifiSsidUnknown => 'Nom Wi‑Fi indisponible';

  @override
  String get localWifiStubBanner => 'En attente de la prise LAN…';

  @override
  String get localWifiLiveBanner =>
      'Découverte LAN en direct (UDP) – annonce + discussion scellée sur ce Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'Aucun appareil pour l\'instant.\nVérifiez que vos amis ont rejoint votre point d\'accès et ont autorisé l\'accès au réseau local.';

  @override
  String get localWifiEmptyRouter =>
      'Aucun appareil pour le moment.\nMême SSID ? Réseau local autorisé ? Certains routeurs bloquent le trafic d\'appareil à appareil (isolation AP).';

  @override
  String get localWifiIsolationHelp =>
      'Pourquoi ne pouvons-nous pas nous retrouver ?';

  @override
  String get localWifiIsolationTitle => 'Le routeur peut isoler les clients';

  @override
  String get localWifiIsolationBody =>
      'Si l\'isolation AP/Client (ou un réseau invité) est activée, les téléphones sur le même Wi‑Fi ne peuvent pas parler. Désactivez l\'isolation, utilisez le SSID principal ou passez en mode À proximité (Hotspot).';

  @override
  String get localWifiPeerReady => 'Prêt à discuter (a la clé)';

  @override
  String get localWifiPeerNeedKey =>
      'Trouvé – scannez le QR pour échanger des clés';

  @override
  String get localWifiErrorTitle => 'Erreur locale Wi‑Fi';

  @override
  String get localWifiErrorBody =>
      'Quelque chose s\'est mal passé. Arrêtez-vous et réessayez.';

  @override
  String get preparingSystem => 'Préparation du système…';

  @override
  String get bootFailedTitle => 'Impossible de démarrer';

  @override
  String get retry => 'Essayer à nouveau';

  @override
  String get bootRecoveryAction =>
      'Démarrer une nouvelle identité (effacer les données locales)';

  @override
  String get bootRecoveryConfirmTitle => 'Commencer une nouvelle identité ?';

  @override
  String get bootRecoveryConfirmBody =>
      'Cela effacera définitivement les discussions locales, les clés et l\'identité sur cet appareil.\nLes pairs doivent scanner à nouveau votre QR avec votre nouvelle identité.\nCela ne peut pas être annulé.';

  @override
  String get bootRecoveryRunning => 'Réinitialiser l’identité locale…';

  @override
  String get bootRecoverySuccess =>
      'Réinitialisation de l\'identité locale terminée';

  @override
  String bootRecoveryFailed(String error) {
    return 'Impossible de réinitialiser l\'identité : $error';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Sauvegarder';

  @override
  String get close => 'Fermer';

  @override
  String get start => 'Commencer';

  @override
  String get send => 'Envoyer';

  @override
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get languageSubtitle =>
      'Par défaut, l\'application suit la langue de votre téléphone (si elle est prise en charge). D\'autres langues reviennent à l\'anglais. Vous pouvez également verrouiller une langue ici.';

  @override
  String get languageSystem => 'Valeur par défaut du système';

  @override
  String get languageThai => 'thaïlandais';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get notificationsTooltip => 'Paramètres de notification';

  @override
  String get enableMessageNotifications =>
      'Activer les notifications de messages';

  @override
  String get settingsNotificationsSubtitle =>
      'Messages 1:1 et personnes en ligne (alertes locales)';

  @override
  String get networkMembersTooltip => 'Membres du réseau';

  @override
  String get identityQrTooltip => 'Identité / QR';

  @override
  String get feedDirects => 'Chat';

  @override
  String get feedMesh => 'Mesh ';

  @override
  String get feedGeo => 'Zone';

  @override
  String get feedDirectsSubtitle => 'Messages E2EE privés';

  @override
  String get feedMeshSubtitle => 'Pairs à proximité (BLE)';

  @override
  String get feedGeoSubtitle => 'Chaîne de découverte Geohash';

  @override
  String get peerIdHint =>
      'Collez l\'ID du récepteur (hachage de clé publique) pour démarrer une conversation';

  @override
  String get directsEmpty =>
      'Pas encore de chat : scannez un QR ou collez un identifiant de récepteur pour commencer\nLes messages sont scellés avec E2EE avant envoi (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • appuyez pour ouvrir le chat';

  @override
  String get meshIntro =>
      'Pairs dans la plage BLE – appuyez pour une discussion E2EE privée (pas de composition publique sur #mesh)\nEnvoie via un routeur hybride (BLE + LoRa + Nostr en ligne)';

  @override
  String get meshEmptyRunning =>
      'Aucun homologue à proximité pour l\'instant : ouvrez l\'application sur un autre appareil à portée de BLE';

  @override
  String get meshEmptyStopped =>
      'BLE n\'est pas en cours d\'exécution : accordez l\'autorisation Bluetooth/Localisation';

  @override
  String get meshNearbyPrefix => 'Proche';

  @override
  String get meshRetentionTitle => 'Messages à suppression automatique';

  @override
  String get meshRetentionSubtitle =>
      'L\'ancien historique des discussions locales est automatiquement supprimé';

  @override
  String get meshRetentionKeep => 'Garder';

  @override
  String get meshRetention1Day => '1 jour';

  @override
  String get meshRetention3Days => '3 jours';

  @override
  String get meshRetention7Days => '7 jours';

  @override
  String get refreshLocationTooltip => 'Actualiser l\'emplacement';

  @override
  String get geoIntro =>
      'Les personnes en ligne dans ce géohash peuvent recevoir des messages 1:1 ou avec une diffusion publique de zone (toujours scellé E2EE par homologue – pas de texte en clair)';

  @override
  String geoEmpty(String channel) {
    return 'Personne en ligne à ce $channel jour\nUtiliser Transport → Internet/Auto, attendreNostr, actualiser l\'emplacement';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'En ligne dans $channel • appuyez pour 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'À proximité (présence dans la zone d\'attente) • appuyez pour 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Vu le Nostr dans $channel • découverte uniquement (hérité)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Présence anonyme héritée : attendez un homologue lié ou échangez un code QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE à proximité – scannez le QR pour démarrer l\'E2EE 1:1';

  @override
  String get geoInternetDiscoverHint =>
      'Zone Internet Discovery nécessite Nostr connecté (Paramètres → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Localisation pas encore résolue : autorisez le GPS et actualisez pour publier votre géohash sur Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Autorisation de localisation refusée : autorisez ResilNet dans Paramètres → Confidentialité → Localisation';

  @override
  String get geoEmptyServicesDisabled =>
      'Les services de localisation sont désactivés : activez-les dans Paramètres';

  @override
  String get geoEmptyNoGpsFix =>
      'Impossible d\'obtenir une solution GPS (commune sur Wi‑Fi les iPad) — définissez géohash manuellement ci-dessous';

  @override
  String get geoEmptyTeleportHint =>
      'Appuyez sur l\'icône du lieu → entrez un géohash (par exemple w5) → Téléporter';

  @override
  String get geoSetGeohashManually => 'Définir le géohash';

  @override
  String get geoTeleportHint =>
      'Pas de GPS ? Entrez le préfixe geohash (2 à 7 caractères, par exemple w5) et appuyez sur Téléporter';

  @override
  String get geoTeleportInvalid =>
      'Geohash invalide – utilisez uniquement des lettres/chiffres en base32 (par exemple w5 ou w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Zone définie sur $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Zone manuelle : $channel (l\'actualisation du GPS sera prioritaire)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr n\'est pas prêt : appuyez sur Reconnecter (0/0 jusqu\'à ce que l\'initialisation réussisse)';

  @override
  String get geoEmptyMeshOnly =>
      'Le transport est uniquement Mesh : passez à Internet ou Auto pour découvrir les homologues sur Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Personne dans $channel pour l\'instant : gardez Zone + Internet ouverts sur les deux appareils et attendez environ 60 s';
  }

  @override
  String get geoChannelFallback => '#zone';

  @override
  String get geoRefreshLocation => 'Actualiser l\'emplacement';

  @override
  String get settingsClearLocationTitle => 'Emplacement clair';

  @override
  String get settingsClearLocationSubtitle =>
      'Supprimer le géohash GPS/téléportation (la zone devient #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Localisation claire ?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Supprime le géohash stocké sur cet appareil. Vous pouvez actualiser le GPS ou vous téléporter à nouveau par la suite.';

  @override
  String get settingsClearLocationAction => 'Emplacement clair';

  @override
  String get settingsClearLocationSnack => 'Emplacement effacé';

  @override
  String get chatVoiceTooLarge =>
      'Note vocale trop volumineuse – maximum ~ 30 secondes';

  @override
  String get chatVoiceNeedInternet =>
      'La note vocale nécessite Internet (Nostr) – trop volumineuse pour BLE seul';

  @override
  String get chatVoiceSentInternet => 'Note vocale envoyée via Internet';

  @override
  String get noticeAnonMention => 'mention';

  @override
  String get noticeAnonDm => 'message direct';

  @override
  String get noticeAnonHug => 'câlin';

  @override
  String get noticeAnonSlap => 'gifler';

  @override
  String get noticeAnonBlock => 'bloc';

  @override
  String get noticeAnonNeedKey =>
      'Pas encore de clé publique — échangez d\'abord le QR contre 1:1';

  @override
  String get noticeAnonActionSent => 'Envoyé';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Bloqué $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* câlins $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* gifle $anon *';
  }

  @override
  String get geoReconnectNostr => 'Reconnecter Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relais';

  @override
  String get nostrSectionSubtitle =>
      'La messagerie Internet et la découverte de zone utilisent ces relais. Appuyez sur se reconnecter si le statut reste hors ligne.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Connecté $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Hors ligne : relais répertoriés mais aucun connecté';

  @override
  String get nostrStatusNotInit =>
      'Non démarré (0/0) — appuyez sur Reconnecter pour initialiser';

  @override
  String get nostrReconnectAction => 'Reconnecter Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr connecté ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Toujours hors ligne : vérifiez Wi‑Fi/cellulaire ou réessayez';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Échec : $error';
  }

  @override
  String get nostrReconnecting => 'Connexion aux relais…';

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
    return 'Internet (Nostr) dans $channel • Chat scellé prêt';
  }

  @override
  String get transportModeTitle => 'Transports de zone';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE à proximité (radio) quand non Nostr · Internet & Auto = liste de Nostr personnes';

  @override
  String get transportModeMesh => 'Engrener';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

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
      'Message public à tous ceux qui sont en ligne dans ce domaine';

  @override
  String get geoPublicSend => 'Publique';

  @override
  String geoPublicHelp(int count) {
    return 'Distribution scellée à $count homologues en ligne : chacun reçoit une enveloppe privée';
  }

  @override
  String geoPublicSent(int count) {
    return 'Envoyé à $count homologue(s) dans cette zone';
  }

  @override
  String get geoPublicSentNone =>
      'Aucun homologue pouvant envoyer des messages en ligne : ouvrez la zone/le maillage avec les homologues disposant de clés ou attendez BLE/Nostr';

  @override
  String get areaPublicBadge => 'Espace public';

  @override
  String get geoErrorPermission =>
      'Impossible de lire l\'emplacement : vérifiez l\'autorisation de localisation';

  @override
  String get geoPrecisionRegion => 'Région';

  @override
  String get geoPrecisionProvince => 'Province';

  @override
  String get geoPrecisionCity => 'Ville';

  @override
  String get geoPrecisionNeighborhood => 'Quartier';

  @override
  String get geoPrecisionBlock => 'Bloc';

  @override
  String get aliasTitle => 'Définir un pseudo (alias de contact)';

  @override
  String get aliasHintBody =>
      'Cet alias est stocké sur cet appareil uniquement (local uniquement)\nIl n\'est jamais envoyé avec le trafic E2EE';

  @override
  String get aliasLabel => 'Surnom';

  @override
  String get aliasHint => 'par ex. « chef de village », « P’Somchai »…';

  @override
  String get settingsDevices => 'Appareils';

  @override
  String get settingsFirmwareTitle =>
      'Télécharger/mettre à jour le micrologiciel ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Téléchargez les fichiers .bin et mettez à jour la carte ESP32 via OTA';

  @override
  String get mtBridgeTitle => 'Pont Meshtastic';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Pont A/B texte uniquement – ​​pas ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Déplacez le texte brut court entre Meshtastic et ResilNet. Les modes A et B ne peuvent pas fonctionner en même temps. Il ne s’agit pas d’un cryptage de bout en bout.';

  @override
  String get mtBridgeModeLabel => 'Mode';

  @override
  String get mtBridgeModeOff => 'Désactivé';

  @override
  String get mtBridgeModeA => 'Ingérer un';

  @override
  String get mtBridgeModeB => 'Sortie B';

  @override
  String get mtBridgeModeOffShort => 'Désactivé';

  @override
  String get mtBridgeModeAShort => 'Dans un';

  @override
  String get mtBridgeModeBShort => 'Sortie B';

  @override
  String get mtBridgeMutexHint =>
      'La sélection d’un mode désactive automatiquement l’autre. Le A+B simultané n’est pas pris en charge.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Démo (journalisation)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Le texte entrant apparaît sous Avis sous le nom #meshtastic. Le relais maillé est facultatif (désactivé par défaut).';

  @override
  String get mtBridgeRelayTitle => 'Relais également sur le mesh ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Lorsqu\'elle est activée, des bulletins publics signés sont diffusés. Désactivé = avis de ce téléphone uniquement.';

  @override
  String get mtBridgeSimulateHint => 'Message de démonstration';

  @override
  String get mtBridgeSimulate => 'Simuler le message Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Ingéré dans les avis (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Attention : les messages envoyés ici ne sont PAS ResilNet E2EE. Toute personne se trouvant sur le chemin Meshtastic peut les lire.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Texte à publier';

  @override
  String get mtBridgeSend => 'Envoyer à Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'En file d\'attente depuis Meshtastic (voir journal/historique)';

  @override
  String get mtBridgeLastEgress => 'Dernière sortie';

  @override
  String get mtBridgeEgressHistory => 'Sortie récente';

  @override
  String get mtBridgeOffHint =>
      'Activez Ingest (A) ou Egress (B) pour utiliser le pont.';

  @override
  String get mtBridgeNoticeBadge => 'MESHASTIC · pas E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Utiliser le transport MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Désactivé = journalisation de démonstration uniquement (MQTT entrant ignoré). On = MQTT pour l\'ingestion/la sortie une fois connecté.';

  @override
  String get mtBridgeMqttHost => 'Hôte du courtier';

  @override
  String get mtBridgeMqttPort => 'Port';

  @override
  String get mtBridgeMqttTls => 'Utiliser TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Port typique 8883. Utilise des certificats système ; échoue en cas d\'erreurs de prise de contact.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Reconnexion automatique';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Lorsque cette option est activée, le client tente de se reconnecter après une interruption. L\'état indique Connexion jusqu\'à la restauration.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Assistants de rubrique';

  @override
  String get mtBridgeMqttRegion => 'Préfixe de région (facultatif)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Lorsqu\'il est défini, Apply reconstruit la racine sous msh/<region>/2/json (remplace la racine du sujet).';

  @override
  String get mtBridgeMqttTopicRoot => 'Racine du sujet JSON';

  @override
  String get mtBridgeMqttDownlinkChannel =>
      'Nom du canal de liaison descendante';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Appliquer root → s\'abonner / publier des sujets';

  @override
  String get mtBridgeMqttAdvanced => 'Avancé MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, reconnexion, sujets, informations d\'identification';

  @override
  String get mtBridgeMqttTopicIn => 'Abonnez-vous au sujet';

  @override
  String get mtBridgeMqttTopicOut => 'Publier le sujet';

  @override
  String get mtBridgeMqttGatewayFrom => 'ID du nœud de passerelle (de)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Identifiant décimal ou !hex — requis pour la liaison descendante sendtext';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Indice de canal maillé (facultatif 0 à 7)';

  @override
  String get mtBridgeMqttUser => 'Nom d\'utilisateur (facultatif)';

  @override
  String get mtBridgeMqttPass => 'Mot de passe (facultatif)';

  @override
  String get mtBridgeMqttPassStored =>
      'Un mot de passe est stocké sur cet appareil (non affiché).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Nouveau mot de passe (laisser vide pour conserver)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Laissez vide pour conserver le mot de passe stocké.';

  @override
  String get mtBridgeMqttPassClear => 'Effacer le mot de passe';

  @override
  String get mtBridgeMqttSave => 'Enregistrer les paramètres MQTT';

  @override
  String get mtBridgeMqttSaved => 'MQTT paramètres enregistrés';

  @override
  String get mtBridgeMqttConnect => 'Connecter';

  @override
  String get mtBridgeMqttDisconnect => 'Déconnecter';

  @override
  String get mtBridgeMqttConnected => 'MQTT connecté';

  @override
  String get mtBridgeMqttConnecting => 'MQTT connexion…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT déconnecté';

  @override
  String get mtBridgeMqttError => 'Erreur MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Passez d\'abord à Ingérer (A)';

  @override
  String get mtBridgeErrModeEgress => 'Basculez d\'abord vers la sortie (B)';

  @override
  String get mtBridgeErrRate => 'Ralentissez – taux limité';

  @override
  String get mtBridgeErrDedupe => 'Message en double ignoré';

  @override
  String get mtBridgeErrLoop => 'Abandonné pour empêcher une boucle de pont';

  @override
  String get mtBridgeErrEmpty => 'Le message est vide';

  @override
  String get mtBridgeErrPublish => 'Échec de la publication';

  @override
  String get mtBridgeErrNotConnected => 'MQTT non connecté';

  @override
  String get mtBridgeErrMissingHost => 'Saisissez MQTT hôte du courtier';

  @override
  String get mtBridgeErrMissingTopic =>
      'Entrez, abonnez-vous et publiez des sujets';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Entrez l\'ID du nœud de passerelle (de) pour sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT échec de la connexion';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Échec de la connexion TLS';

  @override
  String get settingsData => 'Données';

  @override
  String get settingsDataHint =>
      'Supprimez les messages locaux pour réduire la base de données : l\'identité, les clés et les pairs sont conservés';

  @override
  String get settingsSaveHistoryTitle =>
      'Enregistrer l\'historique des messages';

  @override
  String get settingsSaveHistorySubtitle =>
      'Lorsqu\'ils sont désactivés, les messages restent E2EE sur le réseau et sont conservés uniquement pour cette session (pas dans l\'historique des discussions locales). Votre propre texte s\'affiche toujours en clair sur cet appareil.';

  @override
  String get settingsPrivacy => 'Confidentialité';

  @override
  String get settingsE2eeTitle => 'Chiffrement de bout en bout';

  @override
  String get settingsE2eeSubtitle =>
      'Toujours activé : les messages sont scellés avec RSA-OAEP + AES-GCM avant d\'être envoyés. Les relais et les sauts à proximité ne peuvent pas lire le contenu.';

  @override
  String get settingsScreenshotTitle => 'Alertes de capture d\'écran';

  @override
  String get settingsScreenshotSubtitle =>
      'Afficher une ligne système dans le chat lorsque cet appareil capture l\'écran';

  @override
  String get settingsNostrExpiryTitle => 'Nostr message garder l\'heure';

  @override
  String get settingsNostrExpirySubtitle =>
      'Combien de temps les enveloppes scellées doivent rester localement lorsqu\'elles sont en ligne via Nostr';

  @override
  String get noticeExpiresIn => 'expire dans';

  @override
  String get noticesTitle => 'Avis';

  @override
  String get noticesMeshIntro =>
      'Bulletin public — visible par tous à portée radio, non crypté. Il saute de téléphone à téléphone hors ligne, et les boîtes de ResilNet relais à proximité en conservent une copie afin que les personnes qui arrivent plus tard le voient toujours.';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · non crypté';

  @override
  String get noticesGeoIntro =>
      'Ajoutez de courtes notes pour ce lieu afin que les autres visiteurs puissent les trouver.';

  @override
  String get noticesEmpty => 'pas encore d\'avis';

  @override
  String get noticesEmptyHint =>
      'épinglez le premier avis pour les gens du coin.';

  @override
  String get noticesComposeHint => 'poster un avis...';

  @override
  String get noticesUrgent => 'urgent';

  @override
  String get noticesOpen => 'Avis';

  @override
  String get screenshotTaken => '*tu as pris une capture d\'écran*';

  @override
  String get chatAttachImage => 'Joindre une image';

  @override
  String get chatImageLabel => 'Image';

  @override
  String get chatImageTooLarge => 'Image trop grande — essayez une autre photo';

  @override
  String get chatNostrExpiry => 'Nostr garder';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Envoyer à $channel — public';
  }

  @override
  String get settingsClearTitle => 'Effacer tous les messages';

  @override
  String get settingsClearSubtitle =>
      'Supprimer toutes les discussions sur cet appareil';

  @override
  String get settingsClearConfirmTitle => 'Effacer tous les messages ?';

  @override
  String get settingsClearConfirmBody =>
      'Cela supprime tous les messages de discussion sur cet appareil.\nLes pairs et les surnoms ne sont pas supprimés.';

  @override
  String get settingsClearAction => 'Effacer les données';

  @override
  String get settingsClearedSnack => 'Données effacées';

  @override
  String settingsVersion(String version) {
    return 'version $version';
  }

  @override
  String get meshBleScanning => 'BLE : recherche de nœuds';

  @override
  String get meshBleEsp32Scanning => 'ESP32 : recherche d\'un nœud à proximité';

  @override
  String get meshBleSyncing => 'BLE : synchronisation avec ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publication';

  @override
  String get meshBleIdle =>
      'BLE maillage activé – aucun téléphone à proximité pour l\'instant';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE maillage – $count téléphone(s) à proximité';
  }

  @override
  String get meshBleNeedsPermission => 'BLE : autorisation requise';

  @override
  String get meshBlePausedCamera =>
      'BLE en pause pour la caméra : appuyez sur Démarrer BLE';

  @override
  String get meshBleStopped =>
      'BLE est désactivé : vérifiez que le Bluetooth est activé, puis appuyez sur Démarrer BLE';

  @override
  String get meshBleRestart => 'Démarrer BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Local $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction =>
      'Vérifiez les autorisations et démarrez BLE';

  @override
  String get meshNostrOffline => 'Nostr hors ligne';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count pairs à proximité • LoRa $lora • synchronisation ~${meters}m';
  }

  @override
  String get meshLoraReady => 'prêt';

  @override
  String get meshLoraNotReady => 'pas prêt';

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
    return 'Passerelle UDP : $label';
  }

  @override
  String get meshGatewayReady => 'Passerelle UDP : prête';

  @override
  String get permissionTitle =>
      'Autoriser l\'accès au démarrage du réseau maillé BLE';

  @override
  String get permissionBody =>
      'L\'application a besoin de Bluetooth (analyse/connexion/publicité), de localisation (pour les anciens appareils Android) et d\'un microphone (pour les notes vocales dans le chat et les annonces) pour la messagerie communautaire.';

  @override
  String get permissionE2ee =>
      'Chiffrement de bout en bout (E2EE)\nLes nœuds relais ne peuvent pas lire le contenu du message';

  @override
  String get permissionReady => 'Autorisations prêtes';

  @override
  String get permissionRequest => 'Autoriser et continuer';

  @override
  String get permissionNotReadySnack =>
      'Le système n\'est pas encore prêt : attendez un moment et réessayez';

  @override
  String get permissionDeniedSnack =>
      'Autorisations incomplètes : ouvrez Paramètres > ResilNet et autorisez Bluetooth/Localisation/Microphone';

  @override
  String get permissionMicDenied =>
      'Accès au microphone refusé : autorisez-le dans les paramètres pour enregistrer des notes vocales';

  @override
  String get permissionMicOpenSettings => 'Paramètres';

  @override
  String get permissionCameraDenied =>
      'Accès à la caméra refusé : autorisez-le dans les paramètres pour scanner les codes QR';

  @override
  String get permissionCameraFailed =>
      'L\'autorisation de la caméra est requise pour scanner les codes QR';

  @override
  String get permissionCameraOpenSettings => 'Paramètres';

  @override
  String get permissionPhotosDenied =>
      'Accès à la photothèque refusé : autorisez-le dans les paramètres pour enregistrer votre code QR';

  @override
  String get permissionPhotosFailed =>
      'L\'autorisation de la photothèque est requise pour enregistrer votre code QR';

  @override
  String get permissionPhotosOpenSettings => 'Paramètres';

  @override
  String permissionFailedSnack(String error) {
    return 'Échec de la demande d\'autorisation : $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architecture  • Sauts multiples Store-and-Forward';

  @override
  String get onboardingSkip => 'Sauter';

  @override
  String get onboardingNext => 'Suivant';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String get onboardingWelcomeTitle => 'Bienvenue sur ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Discutez sur ResilNet sur un réseau maillé, même sans Internet';

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
  String get onboardingChannelsTitle => 'Chat crypté + chaînes à proximité';

  @override
  String get onboardingChannelsBody =>
      'Basculez #mesh / Area (geohash) pour trouver des pairs à proximité — les messages restent E2EE sur le maillage BLE et Nostr';

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
  String get chatTitle => 'Chat (E2EE)';

  @override
  String get chatScanTooltip => 'Scannez le QR pour ajouter un pair';

  @override
  String get chatBlockTooltip => 'Bloquer cet expéditeur';

  @override
  String get chatBlockedSnack =>
      'Bloqué : pas de notifications / pas de relais';

  @override
  String get chatAliasTooltip => 'Définir un surnom';

  @override
  String get chatReceiverPemLabel => 'Clé publique du destinataire (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Collez la clé publique de votre ami (à partir du QR/fichier partagé)';

  @override
  String get chatNeedPeerKey =>
      'Scannez d\'abord le QR de cet homologue (clé publique vérifiée requise)';

  @override
  String get chatPeerKeyMismatch =>
      'La clé publique stockée ne correspond pas à cet identifiant d\'homologue';

  @override
  String chatVoiceFailed(String error) {
    return 'Impossible d\'enregistrer l\'audio : $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Impossible de lire la note vocale : $error';
  }

  @override
  String get chatPlayVoice => 'Lire une note vocale';

  @override
  String get chatPauseVoice => 'Pause';

  @override
  String get chatVoiceLabelSent => '🎤 Note vocale (scellée)';

  @override
  String get chatVoiceLabel => '🎤 Note vocale';

  @override
  String get chatDecryptFailed => '[échec du décryptage]';

  @override
  String chatSentSealed(String preview) {
    return '[scellé • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[scellé]';

  @override
  String get chatComposeHint => 'Tapez un message… (scellé à l\'envoi)';

  @override
  String get chatEmptyThread =>
      'Pas encore de messages\nTapez ci-dessous pour envoyer le maillage';

  @override
  String chatLoadFailed(String error) {
    return 'Impossible de charger la conversation : $error';
  }

  @override
  String get chatEmojiTooltip => 'Émoji';

  @override
  String get statusPending => 'En attente';

  @override
  String get statusSent => 'Envoyé';

  @override
  String get statusRelayed => 'Relayé';

  @override
  String get statusDelivered => 'Livré';

  @override
  String get statusRead => 'Lire';

  @override
  String get statusFailed => 'Échoué';

  @override
  String get chatCopy => 'Copie';

  @override
  String get chatDeleteLocal => 'Supprimer sur cet appareil';

  @override
  String get chatDeletedLocalSnack => 'Supprimé sur cet appareil';

  @override
  String get chatRetry => 'Réessayer';

  @override
  String get chatSendFailed => 'Non livré — appuyez sur Réessayer';

  @override
  String get chatImageNeedInternet =>
      'Connectez-vous à Internet pour envoyer des images';

  @override
  String get chatImageTooLargeOnline =>
      'Impossible de compresser suffisamment l\'image pour l\'envoyer';

  @override
  String get chatOpenLinkFailed => 'Impossible d\'ouvrir le lien';

  @override
  String get identityTitle => 'Identité';

  @override
  String get identityScanTooltip => 'Scannez le QR avec l\'appareil photo';

  @override
  String get identityCopiedHash => 'Hachage de clé publique copié';

  @override
  String get identityPeerSaved => 'Pair enregistré depuis QR';

  @override
  String get identityGalleryDenied => 'Autorisation de la photothèque refusée';

  @override
  String get identityQrSaved => 'QR enregistré dans la photothèque';

  @override
  String identityQrSaveFailed(String error) {
    return 'Impossible d\'enregistrer le QR : $error';
  }

  @override
  String get peersTitle => 'Membres du réseau';

  @override
  String get qrScanTitle => 'Scannez le QR pour ajouter un ami';

  @override
  String get qrInvalid => 'Échec de l\'analyse : QR invalide';

  @override
  String get qrIdKeyMismatch =>
      'QR rejeté : l\'identifiant ne correspond pas à la clé publique';

  @override
  String get qrCameraNotReady => 'La caméra n\'est pas prête';

  @override
  String get qrRetrySettings => 'Réessayez/ouvrez les paramètres';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Impossible d\'ouvrir la caméra : $error';
  }

  @override
  String get qrScanAlignHint => 'Alignez le code QR à l\'intérieur du cadre';

  @override
  String get firmwareDownloadTitle => 'Télécharger le micrologiciel ESP32';

  @override
  String get firmwareSourceOnline => 'Dernier (en ligne)';

  @override
  String get firmwareSourceCached => 'Copie enregistrée (hors ligne)';

  @override
  String get firmwareSourceBaseline => 'Ligne de base groupée (hors ligne)';

  @override
  String get firmwareSourceUnavailable => 'Aucun firmware disponible';

  @override
  String get firmwareBaselineIncompatible =>
      'Le micrologiciel fourni est trop ancien : connectez-vous à Internet pour télécharger une version plus récente.';

  @override
  String get firmwareChecksumFailed =>
      'Échec de la vérification de l\'intégrité du micrologiciel – clignotement bloqué';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Micrologiciel prêt : $source';
  }

  @override
  String get peersRefreshTooltip => 'Rafraîchir';

  @override
  String get peersBlocked => 'Bloqué';

  @override
  String get peersNearbyBle => 'À proximité (BLE)';

  @override
  String get peersRecentlyOnline => 'Récemment en ligne';

  @override
  String get peersOnlineInArea => 'En ligne dans la zone';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Vu il y a $minutes min';
  }

  @override
  String get peersOffline => 'Hors ligne';

  @override
  String peersBlockedSnack(String id) {
    return 'Bloqué $id';
  }

  @override
  String get peersUnblockedSnack => 'Débloqué';

  @override
  String get peersEmpty =>
      'Aucun membre dans la base de données pour l\'instant\nScannez un QR ou attendez la découverte du maillage BLE';

  @override
  String get peersOpenChat => 'Ouvrir le chat';

  @override
  String get peersBlockAction => 'Bloc';

  @override
  String get peersUnblockAction => 'Débloquer';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Zone';

  @override
  String get locationPickerTooltip => 'Canal de localisation';

  @override
  String get transportPickerTooltip => 'Maillage / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Personnes en ligne';

  @override
  String get unreadDirectsTooltipEmpty => 'Messages privés';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count messages privés non lus';
  }

  @override
  String get onlinePeopleTitle => 'personnes';

  @override
  String get onlinePeopleEmpty => 'Personne en ligne ici encore';

  @override
  String onlinePeopleCount(int count) {
    return '$count en ligne';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · proximité + zone';

  @override
  String get peerOnlineMeshTitle => 'Quelqu\'un à proximité sur le maillage';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name est à proximité sur le maillage';
  }

  @override
  String get peerOnlineAreaTitle => 'Quelqu\'un en ligne dans la région';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name est en ligne via Nostr';
  }

  @override
  String get locationSheetTitle => '#canaux de localisation';

  @override
  String get channelPinsTitle => 'Épinglé';

  @override
  String get channelPinsHint =>
      'Épinglez les chaînes que vous utilisez souvent : elles restent en haut';

  @override
  String get channelPinTooltip => 'Épingler cette chaîne';

  @override
  String get channelUnpinTooltip => 'Détacher';

  @override
  String get locationSheetIntro =>
      'Discutez avec des personnes à proximité en utilisant un géohash grossier – pas un GPS précis. La présence sur Internet utilise des clés anonymes Nostr.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10 à 50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Téléportation';

  @override
  String homeComposeHint(String channel) {
    return 'Message $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Envoyer à $channel — public';
  }

  @override
  String get messageExpiryTitle => 'expire dans';

  @override
  String get voiceRecordTapToStart =>
      'Appuyez pour enregistrer un message vocal';

  @override
  String get voiceRecordTooShort => 'Enregistrement trop court : réessayez';

  @override
  String get voiceRecordFailed =>
      'Impossible de sauvegarder l\'enregistrement : réessayez';

  @override
  String get voicePttHold => 'Tenir pour enregistrer';

  @override
  String get voicePttRelease => 'Sortie en avant-première';

  @override
  String get voicePttRecording => 'Enregistrement…';

  @override
  String get voicePttDraftReady => 'Note vocale prête';

  @override
  String get voicePttDiscard => 'Jeter';

  @override
  String get voicePttReRecord => 'Enregistrer à nouveau';

  @override
  String get voicePttSend => 'Envoyer une note vocale';

  @override
  String get voicePttPlayPreview => 'Lire l\'aperçu';

  @override
  String get voicePttStopPreview => 'Arrêter l\'aperçu';

  @override
  String get noticesBackfilling => 'Chargement des avis…';

  @override
  String get noticesNostrOnline => 'Nostr en ligne';

  @override
  String get noticesNostrOffline =>
      'Nostr hors ligne : le bulletin nécessite Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Avis $count chargés';
  }

  @override
  String get noticePublishFailed =>
      'Impossible de publier un avis au conseil régional. Vérifiez la connexion Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Enregistré localement. Connectez-vous à une radio maillée à proximité (ou à une passerelle Wi‑Fi) pour que d\'autres personnes puissent la recevoir.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletin envoyé à $count appareil(s) à proximité sur BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Radios à proximité détectées, mais l\'écriture BLE a échoué. Gardez les deux applications ouvertes sur l\'écran Avis et réessayez (ou utilisez un relais ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Le récepteur BLE de cet appareil n’est pas prêt. Basculez Bluetooth et rouvrez les avis.';

  @override
  String get noticeDelete => 'Supprimer l\'avis';

  @override
  String get noticeDeleteConfirmTitle => 'Supprimer cet avis ?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Cela le supprime uniquement sur cet appareil. Les autres personnes qui l\'ont déjà reçu le verront encore.';

  @override
  String get noticeDeleted => 'Avis supprimé';

  @override
  String get chatNoticeHidden => 'Avis de zone — Avis ouverts';

  @override
  String get identityDisplayNameTitle => 'Nom d\'affichage';

  @override
  String get identitySaveName => 'Enregistrer le nom';

  @override
  String get identityUserIdLabel => 'ID utilisateur (hachage de clé publique)';

  @override
  String get identityCopyHashTooltip => 'Copier le hachage de la clé publique';

  @override
  String get identityMyQrTitle => 'Mon QR (identifiant + pubKey + nom)';

  @override
  String identityQrFailed(String error) {
    return 'Impossible de créer le QR\n$error';
  }

  @override
  String get identitySaving => 'Économie…';

  @override
  String get identitySaveQr => 'Enregistrer le QR dans la photothèque';

  @override
  String get identityOpenScanner =>
      'Ouvrez l\'appareil photo pour scanner le QR';

  @override
  String get identityQrHelp =>
      'Demandez à un ami de le scanner pour enregistrer votre clé publique et (si nécessaire) vous définir comme émetteur vérifié.';

  @override
  String get identityChatTip =>
      'Astuce : vous pouvez également scanner un QR dans le chat pour ajouter une clé publique pour E2EE';

  @override
  String get infoOpen => 'À propos / Informations';

  @override
  String get docsGuideTitle => 'Guide d\'utilisation';

  @override
  String get docsGuideSubtitle => 'S\'ouvre dans le navigateur';

  @override
  String get docsOpenAction => 'Ouvrir le guide';

  @override
  String get docsOpenFailed =>
      'Impossible d\'ouvrir le guide de l\'utilisateur';

  @override
  String get firmwareOtaGuideTitle => 'Guide Flash et protocole OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Ouvre le guide Web – téléchargements .bin et étapes complètes';

  @override
  String get firmwareWebDownloadsTitle =>
      'Téléchargements de firmware sur le Web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Liens par version et sommes de contrôle sur le site de documentation';

  @override
  String get inviteCopyShortLink => 'Copier le lien court';

  @override
  String get inviteShareLink => 'Partager le lien';

  @override
  String get inviteShowFullLink => 'Lien complet';

  @override
  String get inviteCopyFullLink => 'Copier le lien complet';

  @override
  String get inviteLinkCopied => 'Lien copié';

  @override
  String get inviteLongPressHint => 'Appui long pour les actions de lien';

  @override
  String get inviteSendInChat => 'Envoyer dans ResilNet chat…';

  @override
  String get inviteSendInChatHint =>
      'Uniquement les personnes pour lesquelles vous disposez déjà d\'une clé publique';

  @override
  String get inviteSendInChatEmpty =>
      'Pas encore de discussions avec message.\nScannez un QR, ouvrez Area/Mesh ou partagez d\'abord le lien en dehors de l\'application.';

  @override
  String get inviteSentToChat => 'Invitation envoyée dans le chat';

  @override
  String get infoTabInfo => 'Informations';

  @override
  String get infoTabSettingsHint =>
      'Ouvrez Paramètres dans le menu pour les outils de langue, E2EE et de données.';

  @override
  String get infoHowToTitle => 'Comment utiliser';

  @override
  String get infoHowToBody =>
      '• Appuyez sur l\'icône de la chaîne pour basculer entre Chat / #mesh / Zone.\n• Appuyez sur l\'endroit pour choisir la taille du géohash.\n• Appuyez sur les personnes pour les membres ou qui est en ligne\n• Ouvrez Identity/QR à partir de ⋮ pour échanger les clés en personne.\n• La zone « publique » envoie un E2EE scellé à chaque homologue en ligne – pas une salle en texte clair.';

  @override
  String get infoFeaturesTitle => 'Caractéristiques';

  @override
  String get infoFeatureOffline =>
      'Messagerie hors ligne via Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Chiffrement de bout en bout avec RSA-OAEP + AES-GCM (pas de bruit)';

  @override
  String get infoFeatureMultihop =>
      'Les messages peuvent passer par des pairs proches pour aller plus loin';

  @override
  String get infoFeatureBridge =>
      'Maille hybride ↔ internet (Nostr) pour enveloppes scellées';

  @override
  String get infoFeatureGeo =>
      'Canaux de géohash locaux pour les personnes à proximité (découverte UX)';

  @override
  String get infoFeatureNotices => 'Avis avec expiration pour #mesh et Area';

  @override
  String get infoPrivacyTitle => 'Confidentialité';

  @override
  String get infoPrivacyNoRoom =>
      'Pas de village en texte clair / salon de discussion public sur le fil';

  @override
  String get infoPrivacyFanout =>
      'Envoi de zone = distribution scellée 1:1 vers les pairs avec des clés publiques connues';

  @override
  String get infoPrivacyPresence =>
      'La présence sur la zone Internet utilise des clés éphémères Nostr';

  @override
  String get infoSymbolsTitle => 'Symboles';

  @override
  String get infoSymBle => 'Liaison Bluetooth directe';

  @override
  String get infoSymMesh => 'Accessible via le maillage (les autres en avant)';

  @override
  String get infoSymInternet => 'Via Internet (Nostr) — enveloppes scellées';

  @override
  String get infoSymBridge => 'Arrivé via le chemin du pont maillé↔Internet';

  @override
  String get infoSymOffline => 'Hors ligne – inaccessible pour le moment';

  @override
  String get infoSymInArea => 'Dans la zone de ce canal de localisation';

  @override
  String get infoSymE2eeOk => 'Session chiffrée de bout en bout';

  @override
  String get infoSymE2eeFail =>
      'Cryptage indisponible : n\'envoyez pas de texte sensible';

  @override
  String get infoSymVerified => 'Identité vérifiée / clé connue';

  @override
  String get infoSymBlocked => 'Bloqué';

  @override
  String get infoSymUnread => 'Message privé non lu';

  @override
  String get infoEmergencyTitle => 'Mode d\'urgence';

  @override
  String get infoEmergencyBody =>
      'Appuyez trois fois sur le titre ResilNet sur l\'écran d\'accueil pour effacer les messages, les clés et l\'identité de cet appareil.';

  @override
  String get infoLegendNote =>
      'Certaines icônes de chemin sont documentées ici pour plus de clarté ; les ticks de livraison dans le chat restent le statut d\'envoi principal.';

  @override
  String get dangerZoneTitle => 'Zone dangereuse';

  @override
  String get dangerZoneSubtitle =>
      'Supprime les messages, les clés de chiffrement, l\'identité Nostr, les pairs et les surnoms sur cet appareil. Vous vous installerez à nouveau.';

  @override
  String get panicWipeTitle => 'Essuie-glace d\'urgence';

  @override
  String get panicWipeSubtitle =>
      'Effacez tout ce qui est local – comme en appuyant trois fois sur le titre de la maison (appuyez deux fois pour actualiser les radios)';

  @override
  String get panicWipeConfirmTitle => 'Effacer toutes les données locales ?';

  @override
  String get panicWipeConfirmBody =>
      'Cela supprime définitivement les discussions, les clés et l\'identité de ce téléphone.\nLes pairs doivent rééchanger les clés QR avec votre nouvelle identité.\nCela ne peut pas être annulé.';

  @override
  String get panicWipeAction => 'Essuyez tout';

  @override
  String get panicWipeSnack => 'Identité locale effacée – reconfigurée';

  @override
  String panicWipeFailed(String error) {
    return 'Échec de l\'effacement : $error';
  }

  @override
  String get meshBridgeTitle => 'Pont en maille';

  @override
  String get meshBridgeSubtitle =>
      'Lorsque cette option est activée (par défaut), les enveloppes scellées peuvent utiliser à la fois le maillage BLE et Internet (Nostr) afin que les îlots maillés à proximité puissent se connecter. Lorsqu\'elle est désactivée, les envois utilisent un seul chemin – ne met jamais de texte en clair sur le fil.';

  @override
  String get favoritesTitle => 'Favoris';

  @override
  String get favoritesAdd => 'Ajouter aux favoris';

  @override
  String get favoritesRemove => 'Supprimer des favoris';

  @override
  String get favoritesEmpty =>
      'Pas encore de favoris : ajoutez un pair à partir de la liste des membres';

  @override
  String get favoritesNearbyTitle => 'Favoris à proximité';

  @override
  String favoritesNearbyBody(String name) {
    return '$name est à proximité sur le maillage';
  }

  @override
  String get favoritesInAreaTitle => 'Coup de coeur dans la région';

  @override
  String favoritesInAreaBody(String name) {
    return '$name est en ligne dans cette zone';
  }

  @override
  String get topologyTitle => 'Topologie maillée';

  @override
  String get topologySubtitle =>
      'Pairs et conseils de connexion issus de l\'annonce du maillage (lecture seule)';

  @override
  String get topologyConnectedNow => 'Connecté maintenant (BLE)';

  @override
  String get topologyNearby => 'À proximité (BLE)';

  @override
  String get topologyKnown => 'Pairs connus';

  @override
  String get topologyEmpty =>
      'Aucun pair n\'a encore appris — restez à proximité avec BLE sur';

  @override
  String get topologyYou => 'vous';

  @override
  String topologyStats(int peers, int links) {
    return '$peers pairs · $links liens';
  }

  @override
  String get topologyGraphHint =>
      'Estimé à partir de la découverte du maillage à proximité — votre appareil est mis en surbrillance. Appuyez sur un pair pour ouvrir le chat.';

  @override
  String get topologyOpen => 'Topologie maillée';

  @override
  String get slashHelpTitle => 'Commandes';

  @override
  String get slashHelpBody =>
      '/help — cette liste\n/who – personnes en ligne sur la chaîne actuelle\n/drop <text> — épinglez un avis scellé ici (distribution E2EE)\n\nGuide complet : utilisez Ouvrir le guide ci-dessous ou Paramètres → Guide de l\'utilisateur.';

  @override
  String get slashWhoEmpty =>
      'Personne en ligne sur cette chaîne pour le moment';

  @override
  String slashWhoTitle(int count) {
    return 'En ligne ($count)';
  }

  @override
  String get slashDropNeedText =>
      'Utilisation : /déposez le texte de votre note';

  @override
  String slashDropDone(String channel) {
    return 'Avis abandonné le $channel';
  }

  @override
  String get slashUnknown => 'Commande inconnue - essayez /help';

  @override
  String get announceOpen => 'Annonces';

  @override
  String get announceTitle => 'Annonces';

  @override
  String get announceEmpty =>
      'Aucun tableau pour l\'instant : créez-en un pour publier des avis verrouillés ou ouverts';

  @override
  String get announceCreate => 'Créer un tableau';

  @override
  String get announceCreateHint => 'Nom du conseil';

  @override
  String get announceDefaultTitle => 'Conseil communautaire';

  @override
  String get announceSettings => 'Paramètres du tableau';

  @override
  String get announceAllowLocked =>
      'Autoriser les publications verrouillées (cryptées)';

  @override
  String get announceAllowLockedSub =>
      'Crypté sur la clé du tableau — les lecteurs ont besoin d\'y accéder';

  @override
  String get announceAllowOpen =>
      'Autoriser les publications ouvertes (texte brut)';

  @override
  String get announceAllowOpenSub =>
      'Pas E2EE – lisible sur maillage/relais. Désactivé par défaut.';

  @override
  String get announceComposeHint => 'Écrivez une annonce…';

  @override
  String get announceMediaInternetOnly =>
      'Annonces photo/voix envoyées sur Internet (pas BLE)';

  @override
  String get announceNeedInternet =>
      'Connectez-vous à Internet pour envoyer des annonces photo ou vocales';

  @override
  String announceVoiceFailed(String error) {
    return 'Impossible d\'enregistrer la voix : $error';
  }

  @override
  String get announceImageTooLarge => 'L\'image est trop grande (max ~ 180 Ko)';

  @override
  String get announcePlayVoice => 'Lire une note vocale';

  @override
  String get announceImageLabel => '📷Image';

  @override
  String get announceAudioLabel => '🎤 Note vocale';

  @override
  String get announceModeLocked => 'Fermé';

  @override
  String get announceModeOpen => 'Ouvrir';

  @override
  String get announceOpenBadge => 'OUVERT · non crypté';

  @override
  String get announceLockedBadge => 'Fermé';

  @override
  String get announceLockedPlaceholder =>
      'Crypté : demander l\'accès pour lire';

  @override
  String get announceRequestAccess => 'Demander l\'accès';

  @override
  String get announceRequestSent =>
      'Demande d\'accès envoyée au propriétaire du forum';

  @override
  String get announceRequestFailed =>
      'Impossible de demander l\'accès (nécessite la clé publique du propriétaire)';

  @override
  String get announceOpenConfirmTitle => 'Publier sans cryptage ?';

  @override
  String get announceOpenConfirmBody =>
      'Les postes ouverts ne sont pas E2EE. Toute personne se trouvant sur le chemin (maille/relais) peut les lire. Continuer?';

  @override
  String get announcePostAction => 'Poste';

  @override
  String get announcePendingRequests => 'Demandes d\'accès';

  @override
  String get announceApprove => 'Approuver';

  @override
  String get announceDeny => 'Refuser';

  @override
  String get announceGranted =>
      'Vous pouvez lire les messages verrouillés sur ce forum';

  @override
  String get announceOwner => 'Vous possédez ce tableau';

  @override
  String get announceCopyInvite => 'Copier le texte d\'invitation';

  @override
  String get announceShowInviteQr => 'Afficher le QR d\'invitation';

  @override
  String get announceScanInviteQr => 'Scanner le tableau d\'invitation QR';

  @override
  String get announceFollow => 'Suivre le tableau depuis l\'invitation';

  @override
  String get announceFollowHint =>
      'Collez le texte ou le ResilNet lien d\'invitation du propriétaire';

  @override
  String get announceFollowOk => 'Tableau suivant';

  @override
  String announceFollowOkNamed(String title) {
    return 'Maintenant, je suis « $title »';
  }

  @override
  String get announceFollowFail =>
      'L\'invitation n\'est pas valide ou est endommagée';

  @override
  String get announceInviteCopied => 'Texte d\'invitation copié';

  @override
  String get announceInviteSaveQr => 'Enregistrer le code QR';

  @override
  String get announceInviteShare => 'Partager l\'invitation';

  @override
  String get announceFollowFromCompose =>
      'Invitation au forum détectée dans la boîte de message';

  @override
  String get peerConfirmAddTitle => 'Ajouter un membre du réseau ?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Ajouter «$name » avec leur clé publique afin que vous puissiez leur envoyer un message privé ?';
  }

  @override
  String get peerConfirmAdd => 'Ajouter un membre';

  @override
  String peerAddedOk(String name) {
    return 'Ajout de $name aux membres du réseau';
  }

  @override
  String get peerAddFromCompose =>
      'Identité/clé publique détectée dans la boîte de message';

  @override
  String get peerHashCopied => 'Hachage de clé publique copié';

  @override
  String get peerHashOpenChat => 'Ouvrir le chat';

  @override
  String get peerHashAddHint =>
      'Hachage copié. Demandez-leur de partager leur lien d\'identité ou QR afin que vous puissiez ajouter la clé publique complète pour E2EE.';

  @override
  String get peerQrNoCode => 'Aucun QR ResilNet trouvé dans cette image';

  @override
  String identityInviteSharePreamble(String name) {
    return 'Identité ResilNet : « $name »\nOuvrez le lien ou collez-le dans le chat → Ajouter un membre\nOu scannez le QR d\'identité.';
  }

  @override
  String get identityShareInvite => 'Partager le lien d\'identité';

  @override
  String get identityInviteCopied => 'Lien d\'identité copié';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Invitation au forum : « $title »\nOuvrir ResilNet → Tableaux de la communauté → Suivre depuis une invitation\nOu scannez le QR / appuyez sur le lien ci-dessous.';
  }

  @override
  String get announceConfirmFollowTitle => 'Suivre ce forum ?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Suivre « $title » à partir de cette invitation ?';
  }

  @override
  String get announceConfirmFollow => 'Suivre';
}

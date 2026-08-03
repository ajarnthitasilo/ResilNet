// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Refreshing ResilNet…';

  @override
  String get appRefreshed => 'Refreshed — radios and discovery restarted';

  @override
  String appRefreshFailed(String error) {
    return 'Refresh failed: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Double-tap = soft refresh. Long-press = hard recover. Triple-tap = emergency wipe.';

  @override
  String get softRefreshTipTitle => 'If ResilNet feels stuck';

  @override
  String get softRefreshTipBody =>
      'Double-tap ResilNet (top-left) for a soft radio refresh. If still stuck: long-press the title, use ⋮ → Hard recover, or Settings. Triple-tap is emergency wipe only.';

  @override
  String get softRefreshTipGotIt => 'Got it';

  @override
  String get infoSoftRefreshTitle => 'If the app feels stuck';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Double-tap ResilNet (top-left) → soft refresh radios & nearby people';

  @override
  String get infoSoftRefreshStepHard =>
      'Still stuck? Long-press title, or ⋮ / Settings → Hard recover';

  @override
  String get infoSoftRefreshStepWait =>
      'Wait for the result snackbar, then try again. Session reset keeps your keys.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Triple-tap = emergency wipe (deletes local data) — only if intentional';

  @override
  String get appRecoverySection => 'App recovery';

  @override
  String get appRecoverySectionSubtitle =>
      'Use when the app feels frozen. Soft = title double-tap. Hard recover is stronger. Session reset restarts services without wiping keys.';

  @override
  String get appHardRecoverAction => 'Hard recover';

  @override
  String get appHardRecovering => 'Hard recovering…';

  @override
  String get appSessionResetAction => 'Reset session';

  @override
  String get appSessionResetRunning => 'Resetting session…';

  @override
  String get appSessionResetConfirmTitle => 'Reset session?';

  @override
  String get appSessionResetConfirmBody =>
      'Restarts ResilNet services on this device. Your identity keys are kept.';

  @override
  String get appRecoveryBusy => 'Recovery already running…';

  @override
  String get appRecoveryOk => 'Recovery finished';

  @override
  String get appRecoveryPartial =>
      'Recovery finished with some steps skipped — try again if still stuck';

  @override
  String get appRecoveryFailed =>
      'Recovery failed — try Session reset, or force-quit the app from the OS';

  @override
  String get localWifiTitle => 'Local Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Link nearby devices without the internet — same as being on one LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Not the ESP32 LoRa gateway SoftAP. This is phone↔phone / LAN only.';

  @override
  String get localWifiUnavailable =>
      'Local Wi‑Fi is not ready yet — wait for app startup.';

  @override
  String get lxmfBridgeTitle => 'Home node';

  @override
  String get lxmfBridgeSubtitle =>
      'Optional Mac or Pi on your Wi‑Fi that relays sealed chats. Off by default. Does not replace end-to-end encryption.';

  @override
  String get lxmfBridgeEnable => 'Use home node';

  @override
  String get lxmfBridgeDisabledHint =>
      'Turn on only when the bridge app is running on a Mac or Pi on this network.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Online — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Can’t reach home node — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Home node address';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP or http://IP:port — example 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Save & refresh status';

  @override
  String get lxmfBridgeLabHint => 'Advanced: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Home node settings';

  @override
  String get lxmfBridgeCheckConnection => 'Check connection';

  @override
  String get lxmfBridgeStatusOnline => 'Connected to home node';

  @override
  String get lxmfBridgeStatusOffline => 'Home node not reachable';

  @override
  String get lxmfBridgeYourDest => 'This node’s address (share with friends)';

  @override
  String get lxmfBridgeCopyDest => 'Copy address';

  @override
  String get lxmfBridgeDestCopied => 'Address copied';

  @override
  String get lxmfBridgeLinkedPeers => 'Linked friends';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Each friend needs their home-node address once. Then sealed chats can use this path.';

  @override
  String get lxmfBridgeNoLinks => 'No friends linked yet.';

  @override
  String get lxmfBridgeAddLink => 'Link a friend';

  @override
  String get lxmfBridgePickPeer => 'Friend';

  @override
  String get lxmfBridgePeerDest => 'Their home-node address';

  @override
  String get lxmfBridgePeerDestHint =>
      '32-character code from their Home node screen';

  @override
  String get lxmfBridgeInvalidDest =>
      'That address doesn’t look valid. Paste the full code from their home node.';

  @override
  String get lxmfBridgeRemoveLink => 'Unlink';

  @override
  String get lxmfBridgeSaveLink => 'Save';

  @override
  String get lxmfBridgeLinkSaved => 'Friend linked';

  @override
  String get lxmfBridgeNoPeers =>
      'No messageable contacts yet — add a friend first.';

  @override
  String get lxmfBridgeHelp =>
      'Keep the bridge running on the Mac/Pi. This path stays on your LAN — it is not LoRa and does not replace internet or Bluetooth mesh.';

  @override
  String get localWifiModeHotspot => 'Nearby';

  @override
  String get localWifiModeRouter => 'Router';

  @override
  String get localWifiHotspotIntro =>
      'One device shares a Personal Hotspot. Others join that hotspot, then ResilNet finds them on the local network.';

  @override
  String get localWifiHostAction => 'Create network (Host)';

  @override
  String get localWifiJoinAction => 'Join network';

  @override
  String get localWifiHostSteps =>
      '1. Open iOS/Android Settings and turn on Personal Hotspot (or Internet Sharing).\n2. Tell friends the hotspot name (and password).\n3. Come back here and tap “Hotspot is on — start waiting”.';

  @override
  String get localWifiHostReady => 'Hotspot is on — start waiting';

  @override
  String get localWifiHostWaiting => 'Waiting for friends to join…';

  @override
  String get localWifiJoinSteps =>
      '1. Open system Settings and join your friend’s Personal Hotspot.\n2. Return here and tap “I’m connected — search”.';

  @override
  String get localWifiJoinReady => 'I’m connected — search';

  @override
  String get localWifiRouterIntro =>
      'Connect every device to the same Wi‑Fi router/AP. The router does not need internet — only a shared local network.';

  @override
  String get localWifiRouterSearch => 'Search on this Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Refresh Wi‑Fi info';

  @override
  String get localWifiRouterNoWifiTitle => 'Not on Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Join the router’s Wi‑Fi in system Settings, then search again.';

  @override
  String get localWifiDiscovering => 'Searching on local Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Devices on this network';

  @override
  String get localWifiStop => 'Stop';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi name unavailable';

  @override
  String get localWifiStubBanner => 'Waiting for LAN socket…';

  @override
  String get localWifiLiveBanner =>
      'LAN discovery live (UDP) — announce + sealed chat on this Wi‑Fi';

  @override
  String get localWifiEmptyHotspot =>
      'No devices yet.\nCheck that friends joined your hotspot and allowed Local Network access.';

  @override
  String get localWifiEmptyRouter =>
      'No devices yet.\nSame SSID? Local Network allowed? Some routers block device-to-device traffic (AP isolation).';

  @override
  String get localWifiIsolationHelp => 'Why can’t we find each other?';

  @override
  String get localWifiIsolationTitle => 'Router may isolate clients';

  @override
  String get localWifiIsolationBody =>
      'If AP/Client isolation (or a guest network) is on, phones on the same Wi‑Fi cannot talk. Turn isolation off, use the main SSID, or switch to Nearby (Hotspot) mode.';

  @override
  String get localWifiPeerReady => 'Ready to chat (has key)';

  @override
  String get localWifiPeerNeedKey => 'Found — scan QR to exchange keys';

  @override
  String get localWifiErrorTitle => 'Local Wi‑Fi error';

  @override
  String get localWifiErrorBody => 'Something went wrong. Stop and try again.';

  @override
  String get preparingSystem => 'Preparing system…';

  @override
  String get bootFailedTitle => 'Could not start';

  @override
  String get retry => 'Try again';

  @override
  String get bootRecoveryAction => 'Start new identity (erase local data)';

  @override
  String get bootRecoveryConfirmTitle => 'Start new identity?';

  @override
  String get bootRecoveryConfirmBody =>
      'This will permanently erase local chats, keys, and identity on this device.\nPeers must scan your QR again with your new identity.\nThis cannot be undone.';

  @override
  String get bootRecoveryRunning => 'Resetting local identity…';

  @override
  String get bootRecoverySuccess => 'Local identity reset complete';

  @override
  String bootRecoveryFailed(String error) {
    return 'Could not reset identity: $error';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get close => 'Close';

  @override
  String get start => 'Start';

  @override
  String get send => 'Send';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle =>
      'Follow the device language when Thai or English; other system languages use English. Or lock Thai / English here.';

  @override
  String get languageSystem => 'System default';

  @override
  String get languageThai => 'Thai';

  @override
  String get languageEnglish => 'English';

  @override
  String get notificationsTooltip => 'Notification settings';

  @override
  String get enableMessageNotifications => 'Enable message notifications';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 messages and people online (local alerts)';

  @override
  String get networkMembersTooltip => 'Network members';

  @override
  String get identityQrTooltip => 'Identity / QR';

  @override
  String get feedDirects => 'Chat';

  @override
  String get feedMesh => '#mesh';

  @override
  String get feedGeo => 'Area';

  @override
  String get feedDirectsSubtitle => 'Private E2EE messages';

  @override
  String get feedMeshSubtitle => 'Nearby peers (BLE)';

  @override
  String get feedGeoSubtitle => 'Geohash discovery channel';

  @override
  String get peerIdHint =>
      'Paste Receiver ID (Public Key Hash) to start a chat';

  @override
  String get directsEmpty =>
      'No chats yet — scan a QR or paste a Receiver ID to start\nMessages are sealed with E2EE before send (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • tap to open chat';

  @override
  String get meshIntro =>
      'Peers in BLE range — tap for a private E2EE chat (no public compose on #mesh)\nSends via hybrid router (BLE + LoRa + Nostr when online)';

  @override
  String get meshEmptyRunning =>
      'No nearby peers yet — open the app on another device within BLE range';

  @override
  String get meshEmptyStopped =>
      'BLE is not running — grant Bluetooth / Location permission';

  @override
  String get meshNearbyPrefix => 'Nearby';

  @override
  String get meshRetentionTitle => 'Auto-delete messages';

  @override
  String get meshRetentionSubtitle =>
      'Older local chat history is removed automatically';

  @override
  String get meshRetentionKeep => 'Keep';

  @override
  String get meshRetention1Day => '1 day';

  @override
  String get meshRetention3Days => '3 days';

  @override
  String get meshRetention7Days => '7 days';

  @override
  String get refreshLocationTooltip => 'Refresh location';

  @override
  String get geoIntro =>
      'People online in this geohash can be messaged 1:1 or with an area public fan-out (still sealed E2EE per peer — not plaintext)';

  @override
  String geoEmpty(String channel) {
    return 'No one online in $channel yet\nUse Transport → Internet/Auto, wait for Nostr, refresh location';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online in $channel • tap for 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Nearby (awaiting area presence) • tap for 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Seen on Nostr in $channel • discovery only (legacy)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Legacy anonymous presence — wait for a bound peer or exchange QR';

  @override
  String get bleRadioNearbySubtitle => 'BLE nearby — scan QR to start 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Area Internet discovery needs Nostr connected (Settings → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Location not resolved yet — allow GPS and refresh to publish your geohash on Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Location permission denied — allow ResilNet in Settings → Privacy → Location';

  @override
  String get geoEmptyServicesDisabled =>
      'Location Services are off — turn them on in Settings';

  @override
  String get geoEmptyNoGpsFix =>
      'Could not get a GPS fix (common on Wi‑Fi iPads) — set geohash manually below';

  @override
  String get geoEmptyTeleportHint =>
      'Tap the place icon → enter a geohash (e.g. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Set geohash';

  @override
  String get geoTeleportHint =>
      'No GPS? Enter geohash prefix (2–7 chars, e.g. w5) and tap Teleport';

  @override
  String get geoTeleportInvalid =>
      'Invalid geohash — use base32 letters/numbers only (e.g. w5 or w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Area set to $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Manual area: $channel (GPS refresh will override)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr not ready — tap Reconnect (0/0 until init succeeds)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport is Mesh-only — switch to Internet or Auto to discover peers over Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'No one in $channel yet — keep Area + Internet open on both devices and wait ~60s';
  }

  @override
  String get geoChannelFallback => '#area';

  @override
  String get geoRefreshLocation => 'Refresh location';

  @override
  String get settingsClearLocationTitle => 'Clear location';

  @override
  String get settingsClearLocationSubtitle =>
      'Remove GPS / teleport geohash (Area becomes #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Clear location?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Deletes the stored geohash on this device. You can refresh GPS or teleport again afterward.';

  @override
  String get settingsClearLocationAction => 'Clear location';

  @override
  String get settingsClearLocationSnack => 'Location cleared';

  @override
  String get chatVoiceTooLarge => 'Voice note too large — max ~30 seconds';

  @override
  String get chatVoiceNeedInternet =>
      'Voice note needs Internet (Nostr) — too large for BLE alone';

  @override
  String get chatVoiceSentInternet => 'Voice note sent via Internet';

  @override
  String get noticeAnonMention => 'mention';

  @override
  String get noticeAnonDm => 'direct message';

  @override
  String get noticeAnonHug => 'hug';

  @override
  String get noticeAnonSlap => 'slap';

  @override
  String get noticeAnonBlock => 'block';

  @override
  String get noticeAnonNeedKey =>
      'No public key yet — exchange QR first for 1:1';

  @override
  String get noticeAnonActionSent => 'Sent';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Blocked $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* hugs $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* slaps $anon *';
  }

  @override
  String get geoReconnectNostr => 'Reconnect Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relays';

  @override
  String get nostrSectionSubtitle =>
      'Internet messaging and Area discovery use these relays. Tap reconnect if status stays offline.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Connected $connected/$total';
  }

  @override
  String get nostrStatusOffline => 'Offline — relays listed but none connected';

  @override
  String get nostrStatusNotInit =>
      'Not started (0/0) — tap Reconnect to initialize';

  @override
  String get nostrReconnectAction => 'Reconnect Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr connected ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Still offline — check Wi‑Fi/cellular or try again';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Failed: $error';
  }

  @override
  String get nostrReconnecting => 'Connecting to relays…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) in $channel • sealed chat ready';
  }

  @override
  String get transportModeTitle => 'Area transport';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE nearby (radio) when no Nostr · Internet & Auto = Nostr people list';

  @override
  String get transportModeMesh => 'Mesh';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint => 'Public message to everyone online in this area';

  @override
  String get geoPublicSend => 'Public';

  @override
  String geoPublicHelp(int count) {
    return 'Sealed fan-out to $count online peer(s) — each receives a private envelope';
  }

  @override
  String geoPublicSent(int count) {
    return 'Sent to $count peer(s) in this area';
  }

  @override
  String get geoPublicSentNone =>
      'No messageable peers online — open Area/Mesh with peers that have keys, or wait for BLE/Nostr';

  @override
  String get areaPublicBadge => 'Area public';

  @override
  String get geoErrorPermission =>
      'Could not read location — check location permission';

  @override
  String get geoPrecisionRegion => 'Region';

  @override
  String get geoPrecisionProvince => 'Province';

  @override
  String get geoPrecisionCity => 'City';

  @override
  String get geoPrecisionNeighborhood => 'Neighborhood';

  @override
  String get geoPrecisionBlock => 'Block';

  @override
  String get aliasTitle => 'Set nickname (Contact Alias)';

  @override
  String get aliasHintBody =>
      'This alias is stored on this device only (local-only)\nIt is never sent with E2EE traffic';

  @override
  String get aliasLabel => 'Nickname';

  @override
  String get aliasHint => 'e.g. “village head”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Devices';

  @override
  String get settingsFirmwareTitle => 'Download / update ESP32 firmware';

  @override
  String get settingsFirmwareSubtitle =>
      'Download .bin files and update the ESP32 board via OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic bridge';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Text-only A/B bridge — not ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Move short plaintext between Meshtastic and ResilNet. Modes A and B cannot run at the same time. This is not end-to-end encryption.';

  @override
  String get mtBridgeModeLabel => 'Mode';

  @override
  String get mtBridgeModeOff => 'Off';

  @override
  String get mtBridgeModeA => 'Ingest A';

  @override
  String get mtBridgeModeB => 'Egress B';

  @override
  String get mtBridgeModeOffShort => 'Off';

  @override
  String get mtBridgeModeAShort => 'In A';

  @override
  String get mtBridgeModeBShort => 'Out B';

  @override
  String get mtBridgeMutexHint =>
      'Selecting a mode turns the other off automatically. Simultaneous A+B is not supported.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (logging)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Inbound text appears under Notices as #meshtastic. Mesh relay is optional (off by default).';

  @override
  String get mtBridgeRelayTitle => 'Also relay on ResilNet mesh';

  @override
  String get mtBridgeRelayHint =>
      'When on, signed public bulletins are broadcast. Off = this phone’s Notices only.';

  @override
  String get mtBridgeSimulateHint => 'Demo message';

  @override
  String get mtBridgeSimulate => 'Simulate Meshtastic message';

  @override
  String get mtBridgeIngestOk => 'Ingested into Notices (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Warning: messages sent here are NOT ResilNet E2EE. Anyone on the Meshtastic path can read them.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Text to publish';

  @override
  String get mtBridgeSend => 'Send to Meshtastic';

  @override
  String get mtBridgeEgressOk => 'Queued for Meshtastic (see log / history)';

  @override
  String get mtBridgeLastEgress => 'Last egress';

  @override
  String get mtBridgeEgressHistory => 'Recent egress';

  @override
  String get mtBridgeOffHint =>
      'Turn on Ingest (A) or Egress (B) to use the bridge.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · not E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Use MQTT transport';

  @override
  String get mtBridgeUseMqttHint =>
      'Off = demo logging only (MQTT inbound ignored). On = MQTT for ingest/egress when connected.';

  @override
  String get mtBridgeMqttHost => 'Broker host';

  @override
  String get mtBridgeMqttPort => 'Port';

  @override
  String get mtBridgeMqttTls => 'Use TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Typical port 8883. Uses system certificates; fails soft on handshake errors.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Auto-reconnect';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'When on, the client tries to reconnect after drops. Status shows Connecting until restored.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Topic helpers';

  @override
  String get mtBridgeMqttRegion => 'Region prefix (optional)';

  @override
  String get mtBridgeMqttRegionHint =>
      'When set, Apply rebuilds root as msh/<region>/2/json (overrides topic root).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON topic root';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Downlink channel name';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Apply root → subscribe / publish topics';

  @override
  String get mtBridgeMqttAdvanced => 'Advanced MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, reconnect, topics, credentials';

  @override
  String get mtBridgeMqttTopicIn => 'Subscribe topic';

  @override
  String get mtBridgeMqttTopicOut => 'Publish topic';

  @override
  String get mtBridgeMqttGatewayFrom => 'Gateway node id (from)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Decimal id or !hex — required for sendtext downlink';

  @override
  String get mtBridgeMqttChannelIndex => 'Mesh channel index (optional 0–7)';

  @override
  String get mtBridgeMqttUser => 'Username (optional)';

  @override
  String get mtBridgeMqttPass => 'Password (optional)';

  @override
  String get mtBridgeMqttPassStored =>
      'A password is stored on this device (not shown).';

  @override
  String get mtBridgeMqttPassReplace => 'New password (leave blank to keep)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Leave empty to keep the stored password.';

  @override
  String get mtBridgeMqttPassClear => 'Clear password';

  @override
  String get mtBridgeMqttSave => 'Save MQTT settings';

  @override
  String get mtBridgeMqttSaved => 'MQTT settings saved';

  @override
  String get mtBridgeMqttConnect => 'Connect';

  @override
  String get mtBridgeMqttDisconnect => 'Disconnect';

  @override
  String get mtBridgeMqttConnected => 'MQTT connected';

  @override
  String get mtBridgeMqttConnecting => 'MQTT connecting…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT disconnected';

  @override
  String get mtBridgeMqttError => 'MQTT error';

  @override
  String get mtBridgeErrModeIngest => 'Switch to Ingest (A) first';

  @override
  String get mtBridgeErrModeEgress => 'Switch to Egress (B) first';

  @override
  String get mtBridgeErrRate => 'Slow down — rate limited';

  @override
  String get mtBridgeErrDedupe => 'Duplicate message ignored';

  @override
  String get mtBridgeErrLoop => 'Dropped to prevent a bridge loop';

  @override
  String get mtBridgeErrEmpty => 'Message is empty';

  @override
  String get mtBridgeErrPublish => 'Publish failed';

  @override
  String get mtBridgeErrNotConnected => 'MQTT not connected';

  @override
  String get mtBridgeErrMissingHost => 'Enter MQTT broker host';

  @override
  String get mtBridgeErrMissingTopic => 'Enter subscribe and publish topics';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Enter gateway node id (from) for sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT connect failed';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS connect failed';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Delete local messages to shrink the database — identity, keys, and peers are kept';

  @override
  String get settingsSaveHistoryTitle => 'Save message history';

  @override
  String get settingsSaveHistorySubtitle =>
      'When off, messages stay E2EE on the wire and are kept only for this session (not in local chat history). Your own text still shows as plaintext on this device.';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsE2eeTitle => 'End-to-end encryption';

  @override
  String get settingsE2eeSubtitle =>
      'Always on — messages are sealed with RSA-OAEP + AES-GCM before send. Relays and nearby hops cannot read contents.';

  @override
  String get settingsScreenshotTitle => 'Screenshot alerts';

  @override
  String get settingsScreenshotSubtitle =>
      'Show a system line in chat when this device captures the screen';

  @override
  String get settingsNostrExpiryTitle => 'Nostr message keep time';

  @override
  String get settingsNostrExpirySubtitle =>
      'How long sealed envelopes should remain locally when online via Nostr';

  @override
  String get noticeExpiresIn => 'expires in';

  @override
  String get noticesTitle => 'Notices';

  @override
  String get noticesMeshIntro =>
      'Public bulletin — visible to everyone in radio range, not encrypted. It hops phone-to-phone offline, and nearby ResilNet relay boxes keep a copy so people who arrive later still see it.';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · not encrypted';

  @override
  String get noticesGeoIntro =>
      'Add short notes for this place so other visitors can find them.';

  @override
  String get noticesEmpty => 'no notices yet';

  @override
  String get noticesEmptyHint => 'pin the first notice for people around here.';

  @override
  String get noticesComposeHint => 'post a notice...';

  @override
  String get noticesUrgent => 'urgent';

  @override
  String get noticesOpen => 'Notices';

  @override
  String get screenshotTaken => '* you took a screenshot *';

  @override
  String get chatAttachImage => 'Attach image';

  @override
  String get chatImageLabel => 'Image';

  @override
  String get chatImageTooLarge => 'Image too large — try another photo';

  @override
  String get chatNostrExpiry => 'Nostr keep';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Send to $channel — public';
  }

  @override
  String get settingsClearTitle => 'Clear all messages';

  @override
  String get settingsClearSubtitle => 'Delete all chats on this device';

  @override
  String get settingsClearConfirmTitle => 'Clear all messages?';

  @override
  String get settingsClearConfirmBody =>
      'This deletes all chat messages on this device.\nPeers and nicknames are not removed.';

  @override
  String get settingsClearAction => 'Clear data';

  @override
  String get settingsClearedSnack => 'Data cleared';

  @override
  String settingsVersion(String version) {
    return 'version $version';
  }

  @override
  String get meshBleScanning => 'BLE: scanning for nodes';

  @override
  String get meshBleEsp32Scanning => 'ESP32: looking for a nearby node';

  @override
  String get meshBleSyncing => 'BLE: syncing with ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publishing';

  @override
  String get meshBleIdle => 'BLE mesh on — no nearby phones yet';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count phone(s) nearby';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: permission required';

  @override
  String get meshBlePausedCamera => 'BLE paused for camera — tap Start BLE';

  @override
  String get meshBleStopped =>
      'BLE is off — check Bluetooth is on, then tap Start BLE';

  @override
  String get meshBleRestart => 'Start BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Check permissions & start BLE';

  @override
  String get meshNostrOffline => 'Nostr offline';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count nearby peers • LoRa $lora • sync ~${meters}m';
  }

  @override
  String get meshLoraReady => 'ready';

  @override
  String get meshLoraNotReady => 'not ready';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: ready';

  @override
  String get permissionTitle => 'Allow access to start the BLE mesh network';

  @override
  String get permissionBody =>
      'The app needs Bluetooth (scan / connect / advertise), Location (for older Android devices), and Microphone (for voice notes in chat and announcements) for community messaging.';

  @override
  String get permissionE2ee =>
      'End-to-End Encryption (E2EE)\nRelay nodes cannot read message contents';

  @override
  String get permissionReady => 'Permissions ready';

  @override
  String get permissionRequest => 'Allow and continue';

  @override
  String get permissionNotReadySnack =>
      'System not ready yet — wait a moment and try again';

  @override
  String get permissionDeniedSnack =>
      'Permissions incomplete — open Settings > ResilNet and allow Bluetooth / Location / Microphone';

  @override
  String get permissionMicDenied =>
      'Microphone access denied — allow it in Settings to record voice notes';

  @override
  String get permissionMicOpenSettings => 'Settings';

  @override
  String get permissionCameraDenied =>
      'Camera access denied — allow it in Settings to scan QR codes';

  @override
  String get permissionCameraFailed =>
      'Camera permission is required to scan QR codes';

  @override
  String get permissionCameraOpenSettings => 'Settings';

  @override
  String get permissionPhotosDenied =>
      'Photo library access denied — allow it in Settings to save your QR code';

  @override
  String get permissionPhotosFailed =>
      'Photo library permission is required to save your QR code';

  @override
  String get permissionPhotosOpenSettings => 'Settings';

  @override
  String permissionFailedSnack(String error) {
    return 'Permission request failed: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architecture • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingNext => 'Next';

  @override
  String get onboardingStart => 'Get started';

  @override
  String get onboardingWelcomeTitle => 'Welcome to ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Chat on ResilNet over a mesh network — even without the internet';

  @override
  String get onboardingFriendsTitle => 'Add friends easily';

  @override
  String get onboardingFriendsBody =>
      'Share a QR from Identity, or scan a friend’s QR to exchange public keys';

  @override
  String get onboardingChannelsTitle => 'Encrypted chat + nearby channels';

  @override
  String get onboardingChannelsBody =>
      'Switch #mesh / Area (geohash) to find nearby peers — messages stay E2EE over BLE mesh and Nostr';

  @override
  String get chatTitle => 'Chat (E2EE)';

  @override
  String get chatScanTooltip => 'Scan QR to add a peer';

  @override
  String get chatBlockTooltip => 'Block this sender';

  @override
  String get chatBlockedSnack => 'Blocked: no notifications / no relay';

  @override
  String get chatAliasTooltip => 'Set nickname';

  @override
  String get chatReceiverPemLabel => 'Recipient public key (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Paste your friend’s public key (from QR / shared file)';

  @override
  String get chatNeedPeerKey =>
      'Scan this peer\'s QR first (verified public key required)';

  @override
  String get chatPeerKeyMismatch =>
      'Stored public key does not match this peer id';

  @override
  String chatVoiceFailed(String error) {
    return 'Could not record audio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Could not play voice note: $error';
  }

  @override
  String get chatPlayVoice => 'Play voice note';

  @override
  String get chatPauseVoice => 'Pause';

  @override
  String get chatVoiceLabelSent => '🎤 Voice note (sealed)';

  @override
  String get chatVoiceLabel => '🎤 Voice note';

  @override
  String get chatDecryptFailed => '[decryption failed]';

  @override
  String chatSentSealed(String preview) {
    return '[sealed • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[sealed]';

  @override
  String get chatComposeHint => 'Type a message… (sealed on send)';

  @override
  String get chatEmptyThread =>
      'No messages yet\nType below to send over the mesh';

  @override
  String chatLoadFailed(String error) {
    return 'Could not load conversation: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusSent => 'Sent';

  @override
  String get statusRelayed => 'Relayed';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusRead => 'Read';

  @override
  String get statusFailed => 'Failed';

  @override
  String get chatCopy => 'Copy';

  @override
  String get chatDeleteLocal => 'Delete on this device';

  @override
  String get chatDeletedLocalSnack => 'Deleted on this device';

  @override
  String get chatRetry => 'Retry';

  @override
  String get chatSendFailed => 'Not delivered — tap Retry';

  @override
  String get chatImageNeedInternet => 'Connect to the internet to send images';

  @override
  String get chatImageTooLargeOnline =>
      'Could not compress image enough to send';

  @override
  String get chatOpenLinkFailed => 'Could not open link';

  @override
  String get identityTitle => 'Identity';

  @override
  String get identityScanTooltip => 'Scan QR with camera';

  @override
  String get identityCopiedHash => 'Public key hash copied';

  @override
  String get identityPeerSaved => 'Peer saved from QR';

  @override
  String get identityGalleryDenied => 'Photo library permission denied';

  @override
  String get identityQrSaved => 'QR saved to photo library';

  @override
  String identityQrSaveFailed(String error) {
    return 'Could not save QR: $error';
  }

  @override
  String get peersTitle => 'Network members';

  @override
  String get qrScanTitle => 'Scan QR to add a friend';

  @override
  String get qrInvalid => 'Scan failed: invalid QR';

  @override
  String get qrIdKeyMismatch => 'QR rejected: id does not match public key';

  @override
  String get qrCameraNotReady => 'Camera not ready';

  @override
  String get qrRetrySettings => 'Try again / open Settings';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Could not open camera: $error';
  }

  @override
  String get qrScanAlignHint => 'Align the QR code inside the frame';

  @override
  String get firmwareDownloadTitle => 'Download ESP32 firmware';

  @override
  String get firmwareSourceOnline => 'Latest (online)';

  @override
  String get firmwareSourceCached => 'Saved copy (offline)';

  @override
  String get firmwareSourceBaseline => 'Bundled baseline (offline)';

  @override
  String get firmwareSourceUnavailable => 'No firmware available';

  @override
  String get firmwareBaselineIncompatible =>
      'Bundled firmware is too old — connect to the internet to download a newer version';

  @override
  String get firmwareChecksumFailed =>
      'Firmware failed integrity check — flashing blocked';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware ready: $source';
  }

  @override
  String get peersRefreshTooltip => 'Refresh';

  @override
  String get peersBlocked => 'Blocked';

  @override
  String get peersNearbyBle => 'Nearby (BLE)';

  @override
  String get peersRecentlyOnline => 'Recently online';

  @override
  String get peersOnlineInArea => 'Online in area';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Seen $minutes min ago';
  }

  @override
  String get peersOffline => 'Offline';

  @override
  String peersBlockedSnack(String id) {
    return 'Blocked $id';
  }

  @override
  String get peersUnblockedSnack => 'Unblocked';

  @override
  String get peersEmpty =>
      'No members in the database yet\nScan a QR or wait for BLE mesh discovery';

  @override
  String get peersOpenChat => 'Open chat';

  @override
  String get peersBlockAction => 'Block';

  @override
  String get peersUnblockAction => 'Unblock';

  @override
  String get channelPickerTooltip => 'Chat / #mesh / Area';

  @override
  String get locationPickerTooltip => 'Location channel';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'People online';

  @override
  String get unreadDirectsTooltipEmpty => 'Private messages';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count unread private messages';
  }

  @override
  String get onlinePeopleTitle => 'people';

  @override
  String get onlinePeopleEmpty => 'No one online here yet';

  @override
  String onlinePeopleCount(int count) {
    return '$count online';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · nearby + area';

  @override
  String get peerOnlineMeshTitle => 'Someone nearby on mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name is nearby on mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Someone online in area';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name is online via Nostr';
  }

  @override
  String get locationSheetTitle => '#location channels';

  @override
  String get channelPinsTitle => 'Pinned';

  @override
  String get channelPinsHint =>
      'Pin channels you use often — they stay at the top';

  @override
  String get channelPinTooltip => 'Pin this channel';

  @override
  String get channelUnpinTooltip => 'Unpin';

  @override
  String get locationSheetIntro =>
      'Chat with people nearby using coarse geohash — not precise GPS. Presence on Internet uses anonymous Nostr keys.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleport';

  @override
  String homeComposeHint(String channel) {
    return 'Message $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Send to $channel — public';
  }

  @override
  String get messageExpiryTitle => 'expires in';

  @override
  String get voiceRecordTapToStart => 'Tap to record voice message';

  @override
  String get voiceRecordTooShort => 'Recording too short — try again';

  @override
  String get voiceRecordFailed => 'Could not save recording — try again';

  @override
  String get voicePttHold => 'Hold to record';

  @override
  String get voicePttRelease => 'Release to preview';

  @override
  String get voicePttRecording => 'Recording…';

  @override
  String get voicePttDraftReady => 'Voice note ready';

  @override
  String get voicePttDiscard => 'Discard';

  @override
  String get voicePttReRecord => 'Record again';

  @override
  String get voicePttSend => 'Send voice note';

  @override
  String get voicePttPlayPreview => 'Play preview';

  @override
  String get voicePttStopPreview => 'Stop preview';

  @override
  String get noticesBackfilling => 'Loading notices…';

  @override
  String get noticesNostrOnline => 'Nostr online';

  @override
  String get noticesNostrOffline => 'Nostr offline — bulletin needs Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Loaded $count notices';
  }

  @override
  String get noticePublishFailed =>
      'Could not publish notice to the area board. Check Nostr connection.';

  @override
  String get noticeMeshPublishNoLink =>
      'Saved locally. Connect to a nearby mesh radio (or Wi‑Fi gateway) so others can receive it.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bulletin sent to $count nearby device(s) over BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Nearby radios seen, but BLE write failed. Keep both apps open on the Notices screen and try again (or use an ESP32 relay).';

  @override
  String get noticeMeshPublishNoGatt =>
      'This device’s BLE receiver is not ready. Toggle Bluetooth and reopen Notices.';

  @override
  String get noticeDelete => 'Delete notice';

  @override
  String get noticeDeleteConfirmTitle => 'Delete this notice?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'This removes it only on this device. Others who already received it will still see it.';

  @override
  String get noticeDeleted => 'Notice deleted';

  @override
  String get chatNoticeHidden => 'Area notice — open Notices';

  @override
  String get identityDisplayNameTitle => 'Display name';

  @override
  String get identitySaveName => 'Save name';

  @override
  String get identityUserIdLabel => 'User ID (Public Key Hash)';

  @override
  String get identityCopyHashTooltip => 'Copy public key hash';

  @override
  String get identityMyQrTitle => 'My QR (id + pubKey + name)';

  @override
  String identityQrFailed(String error) {
    return 'Could not create QR\n$error';
  }

  @override
  String get identitySaving => 'Saving…';

  @override
  String get identitySaveQr => 'Save QR to photo library';

  @override
  String get identityOpenScanner => 'Open camera to scan QR';

  @override
  String get identityQrHelp =>
      'Have a friend scan this to save your public key and (if needed) set you as a Verified Issuer';

  @override
  String get identityChatTip =>
      'Tip: you can also scan a QR in chat to add a public key for E2EE';

  @override
  String get infoOpen => 'About / Info';

  @override
  String get docsGuideTitle => 'User guide';

  @override
  String get docsGuideSubtitle => 'Opens in browser';

  @override
  String get docsOpenAction => 'Open guide';

  @override
  String get docsOpenFailed => 'Could not open the user guide';

  @override
  String get firmwareOtaGuideTitle => 'Flash guide & OTA protocol';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Opens the web guide — .bin downloads and full steps';

  @override
  String get firmwareWebDownloadsTitle => 'Firmware downloads on the web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Per-version links and checksums on the docs site';

  @override
  String get inviteCopyShortLink => 'Copy short link';

  @override
  String get inviteShareLink => 'Share link';

  @override
  String get inviteShowFullLink => 'Full link';

  @override
  String get inviteCopyFullLink => 'Copy full link';

  @override
  String get inviteLinkCopied => 'Link copied';

  @override
  String get inviteLongPressHint => 'Long-press for link actions';

  @override
  String get inviteSendInChat => 'Send in ResilNet chat…';

  @override
  String get inviteSendInChatHint =>
      'Only people you already have a public key for';

  @override
  String get inviteSendInChatEmpty =>
      'No messageable chats yet.\nScan a QR, open Area/Mesh, or share the link outside the app first.';

  @override
  String get inviteSentToChat => 'Invite sent in chat';

  @override
  String get infoTabInfo => 'Info';

  @override
  String get infoTabSettingsHint =>
      'Open Settings from the menu for language, E2EE, and data tools';

  @override
  String get infoHowToTitle => 'How to use';

  @override
  String get infoHowToBody =>
      '• Tap the channel icon to switch Chat / #mesh / Area\n• Tap place to pick geohash size\n• Tap people for members or who’s online\n• Open Identity/QR from ⋮ to exchange keys in person\n• Area “public” sends sealed E2EE to each online peer — not a plaintext room';

  @override
  String get infoFeaturesTitle => 'Features';

  @override
  String get infoFeatureOffline => 'Offline messaging via Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'End-to-end encryption with RSA-OAEP + AES-GCM (not Noise)';

  @override
  String get infoFeatureMultihop =>
      'Messages can hop through nearby peers to go farther';

  @override
  String get infoFeatureBridge =>
      'Hybrid mesh ↔ internet (Nostr) for sealed envelopes';

  @override
  String get infoFeatureGeo =>
      'Local geohash channels for people nearby (discovery UX)';

  @override
  String get infoFeatureNotices => 'Notices with expiry for #mesh and Area';

  @override
  String get infoPrivacyTitle => 'Privacy';

  @override
  String get infoPrivacyNoRoom =>
      'No plaintext village / public chat room on the wire';

  @override
  String get infoPrivacyFanout =>
      'Area send = sealed 1:1 fan-out to peers with known public keys';

  @override
  String get infoPrivacyPresence =>
      'Internet area presence uses ephemeral Nostr keys';

  @override
  String get infoSymbolsTitle => 'Symbols';

  @override
  String get infoSymBle => 'Direct Bluetooth link';

  @override
  String get infoSymMesh => 'Reachable via mesh (others forward)';

  @override
  String get infoSymInternet => 'Via internet (Nostr) — sealed envelopes';

  @override
  String get infoSymBridge => 'Arrived via mesh↔internet bridge path';

  @override
  String get infoSymOffline => 'Offline — not reachable right now';

  @override
  String get infoSymInArea => 'In this location channel’s area';

  @override
  String get infoSymE2eeOk => 'End-to-end encrypted session';

  @override
  String get infoSymE2eeFail =>
      'Encryption unavailable — do not send sensitive text';

  @override
  String get infoSymVerified => 'Identity verified / known key';

  @override
  String get infoSymBlocked => 'Blocked';

  @override
  String get infoSymUnread => 'Unread private message';

  @override
  String get infoEmergencyTitle => 'Emergency mode';

  @override
  String get infoEmergencyBody =>
      'Triple-tap the ResilNet title on the home screen to wipe messages, keys, and identity on this device.';

  @override
  String get infoLegendNote =>
      'Some path icons are documented here for clarity; delivery ticks in chat remain the primary send status.';

  @override
  String get dangerZoneTitle => 'Danger zone';

  @override
  String get dangerZoneSubtitle =>
      'Deletes messages, encryption keys, Nostr identity, peers, and nicknames on this device. You will set up again.';

  @override
  String get panicWipeTitle => 'Emergency wipe';

  @override
  String get panicWipeSubtitle =>
      'Erase everything local — same as triple-tapping the home title (double-tap refreshes radios)';

  @override
  String get panicWipeConfirmTitle => 'Wipe all local data?';

  @override
  String get panicWipeConfirmBody =>
      'This permanently deletes chats, keys, and identity on this phone.\nPeers must re-exchange QR keys with your new identity.\nThis cannot be undone.';

  @override
  String get panicWipeAction => 'Wipe everything';

  @override
  String get panicWipeSnack => 'Local identity wiped — set up again';

  @override
  String panicWipeFailed(String error) {
    return 'Wipe failed: $error';
  }

  @override
  String get meshBridgeTitle => 'Mesh bridge';

  @override
  String get meshBridgeSubtitle =>
      'When on (default), sealed envelopes may use both BLE mesh and internet (Nostr) together so nearby mesh islands can connect. When off, sends use one path only — never puts plaintext on the wire.';

  @override
  String get favoritesTitle => 'Favorites';

  @override
  String get favoritesAdd => 'Add to favorites';

  @override
  String get favoritesRemove => 'Remove from favorites';

  @override
  String get favoritesEmpty =>
      'No favorites yet — star a peer from the member list';

  @override
  String get favoritesNearbyTitle => 'Favorite nearby';

  @override
  String favoritesNearbyBody(String name) {
    return '$name is nearby on mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Favorite in area';

  @override
  String favoritesInAreaBody(String name) {
    return '$name is online in this area';
  }

  @override
  String get topologyTitle => 'Mesh topology';

  @override
  String get topologySubtitle =>
      'Peers and connection hints from mesh announce (read-only)';

  @override
  String get topologyConnectedNow => 'Connected now (BLE)';

  @override
  String get topologyNearby => 'Nearby (BLE)';

  @override
  String get topologyKnown => 'Known peers';

  @override
  String get topologyEmpty => 'No peers learned yet — stay nearby with BLE on';

  @override
  String get topologyYou => 'you';

  @override
  String topologyStats(int peers, int links) {
    return '$peers peers · $links links';
  }

  @override
  String get topologyGraphHint =>
      'Estimated from nearby mesh discovery — your device is highlighted. Tap a peer to open chat.';

  @override
  String get topologyOpen => 'Mesh topology';

  @override
  String get slashHelpTitle => 'Commands';

  @override
  String get slashHelpBody =>
      '/help — this list\n/who — people online in current channel\n/drop <text> — pin a sealed notice here (E2EE fan-out)\n\nFull guide: use Open guide below, or Settings → User guide.';

  @override
  String get slashWhoEmpty => 'No one online in this channel right now';

  @override
  String slashWhoTitle(int count) {
    return 'Online ($count)';
  }

  @override
  String get slashDropNeedText => 'Usage: /drop your note text';

  @override
  String slashDropDone(String channel) {
    return 'Dropped notice on $channel';
  }

  @override
  String get slashUnknown => 'Unknown command — try /help';

  @override
  String get announceOpen => 'Announcements';

  @override
  String get announceTitle => 'Announcements';

  @override
  String get announceEmpty =>
      'No boards yet — create one to post locked or open notices';

  @override
  String get announceCreate => 'Create board';

  @override
  String get announceCreateHint => 'Board name';

  @override
  String get announceDefaultTitle => 'Community board';

  @override
  String get announceSettings => 'Board settings';

  @override
  String get announceAllowLocked => 'Allow locked (encrypted) posts';

  @override
  String get announceAllowLockedSub =>
      'Encrypted to the board key — readers need access';

  @override
  String get announceAllowOpen => 'Allow open (plaintext) posts';

  @override
  String get announceAllowOpenSub =>
      'Not E2EE — readable on mesh/relays. Off by default.';

  @override
  String get announceComposeHint => 'Write an announcement…';

  @override
  String get announceMediaInternetOnly =>
      'Photo/voice announcements send over the internet (not BLE)';

  @override
  String get announceNeedInternet =>
      'Connect to the internet to send photo or voice announcements';

  @override
  String announceVoiceFailed(String error) {
    return 'Could not record voice: $error';
  }

  @override
  String get announceImageTooLarge => 'Image is too large (max ~180 KB)';

  @override
  String get announcePlayVoice => 'Play voice note';

  @override
  String get announceImageLabel => '📷 Image';

  @override
  String get announceAudioLabel => '🎤 Voice note';

  @override
  String get announceModeLocked => 'Locked';

  @override
  String get announceModeOpen => 'Open';

  @override
  String get announceOpenBadge => 'OPEN · not encrypted';

  @override
  String get announceLockedBadge => 'Locked';

  @override
  String get announceLockedPlaceholder => 'Encrypted — request access to read';

  @override
  String get announceRequestAccess => 'Request access';

  @override
  String get announceRequestSent => 'Access request sent to the board owner';

  @override
  String get announceRequestFailed =>
      'Could not request access (need owner’s public key)';

  @override
  String get announceOpenConfirmTitle => 'Post without encryption?';

  @override
  String get announceOpenConfirmBody =>
      'Open posts are not E2EE. Anyone on the path (mesh / relays) may read them. Continue?';

  @override
  String get announcePostAction => 'Post';

  @override
  String get announcePendingRequests => 'Access requests';

  @override
  String get announceApprove => 'Approve';

  @override
  String get announceDeny => 'Deny';

  @override
  String get announceGranted => 'You can read locked posts on this board';

  @override
  String get announceOwner => 'You own this board';

  @override
  String get announceCopyInvite => 'Copy invite text';

  @override
  String get announceShowInviteQr => 'Show invite QR';

  @override
  String get announceScanInviteQr => 'Scan board invite QR';

  @override
  String get announceFollow => 'Follow board from invite';

  @override
  String get announceFollowHint =>
      'Paste the invite text or ResilNet link from the owner';

  @override
  String get announceFollowOk => 'Following board';

  @override
  String announceFollowOkNamed(String title) {
    return 'Now following “$title”';
  }

  @override
  String get announceFollowFail => 'Invite is invalid or damaged';

  @override
  String get announceInviteCopied => 'Invite text copied';

  @override
  String get announceInviteSaveQr => 'Save QR';

  @override
  String get announceInviteShare => 'Share invite';

  @override
  String get announceFollowFromCompose =>
      'Board invite detected in the message box';

  @override
  String get peerConfirmAddTitle => 'Add network member?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Add “$name” with their public key so you can message them privately?';
  }

  @override
  String get peerConfirmAdd => 'Add member';

  @override
  String peerAddedOk(String name) {
    return 'Added $name to network members';
  }

  @override
  String get peerAddFromCompose =>
      'Identity / public key detected in the message box';

  @override
  String get peerHashCopied => 'Public key hash copied';

  @override
  String get peerHashOpenChat => 'Open chat';

  @override
  String get peerHashAddHint =>
      'Hash copied. Ask them to share their identity link or QR so you can add the full public key for E2EE.';

  @override
  String get peerQrNoCode => 'No ResilNet QR found in this image';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identity: “$name”\nOpen the link or paste it in chat → Add member\nOr scan the identity QR.';
  }

  @override
  String get identityShareInvite => 'Share identity link';

  @override
  String get identityInviteCopied => 'Identity link copied';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Board invite: “$title”\nOpen ResilNet → Community boards → Follow from invite\nOr scan the QR / tap the link below.';
  }

  @override
  String get announceConfirmFollowTitle => 'Follow this board?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Follow “$title” from this invite?';
  }

  @override
  String get announceConfirmFollow => 'Follow';
}

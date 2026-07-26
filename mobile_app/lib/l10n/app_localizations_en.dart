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
  String get communityTitle => 'Ban Pu Kham community chat';

  @override
  String get preparingSystem => 'Preparing system…';

  @override
  String get bootFailedTitle => 'Could not start';

  @override
  String get retry => 'Try again';

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
      'Follow system language, or choose Thai / English';

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
    return 'No one online in $channel yet\nOpen #mesh nearby, refresh location, or wait for area presence';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online in $channel • tap for 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Nearby (awaiting area presence) • tap for 1:1 E2EE';

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
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Delete local messages to shrink the database — identity, keys, and peers are kept';

  @override
  String get settingsSaveHistoryTitle => 'Save message history';

  @override
  String get settingsSaveHistorySubtitle =>
      'When off, messages are still E2EE-sealed and sent, but not stored in local chat history (ephemeral)';

  @override
  String get settingsPrivacy => 'Privacy';

  @override
  String get settingsE2eeTitle => 'End-to-end encryption';

  @override
  String get settingsE2eeSubtitle =>
      'Seal messages with RSA-OAEP + AES-GCM before send (recommended on)';

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
      'Pin short announcements for people around you. They hop phone-to-phone offline and fade after a few days.';

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
  String get meshBleSyncing => 'BLE: syncing with ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: publishing';

  @override
  String get meshBleIdle => 'BLE: standby';

  @override
  String get meshBleNeedsPermission => 'BLE: permission required';

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
      'The app needs Bluetooth (scan / connect / advertise) and Location (for older Android devices) for offline community messaging.';

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
      'Permissions incomplete — open Settings > ResilNet and allow Bluetooth / Location';

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
      'Chat in Ban Pu Kham over a mesh network — even without the internet';

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
      'Scan a peer QR or paste their public key first';

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
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Pending';

  @override
  String get statusSent => 'Transmitted';

  @override
  String get statusRelayed => 'Relayed';

  @override
  String get statusDelivered => 'Delivered';

  @override
  String get statusRead => 'Read';

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
  String get qrCameraNotReady => 'Camera not ready';

  @override
  String get qrRetrySettings => 'Try again / open Settings';

  @override
  String get firmwareDownloadTitle => 'Download ESP32 firmware';

  @override
  String get peersRefreshTooltip => 'Refresh';

  @override
  String get peersBlocked => 'Blocked';

  @override
  String get peersNearbyBle => 'Nearby (BLE)';

  @override
  String get peersRecentlyOnline => 'Recently online';

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
}

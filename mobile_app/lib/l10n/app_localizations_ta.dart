// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'புதுப்பிக்கிறது ResilNet…';

  @override
  String get appRefreshed =>
      'புதுப்பிக்கப்பட்டது - ரேடியோக்கள் மற்றும் கண்டுபிடிப்பு மீண்டும் தொடங்கப்பட்டது';

  @override
  String appRefreshFailed(String error) {
    return 'புதுப்பிக்க முடியவில்லை: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'இருமுறை தட்டவும் = மென்மையான புதுப்பிப்பு. நீண்ட அழுத்தி = கடின மீட்பு. மும்முறை தட்டு = அவசர துடைப்பு.';

  @override
  String get softRefreshTipTitle => 'ResilNet சிக்கியதாக உணர்ந்தால்';

  @override
  String get softRefreshTipBody =>
      'மென்மையான ரேடியோ புதுப்பிப்புக்கு ResilNet (மேல்-இடது) இருமுறை தட்டவும். இன்னும் சிக்கியிருந்தால்: தலைப்பை நீண்ட நேரம் அழுத்தவும், ⋮ → Hard recover அல்லது அமைப்புகளைப் பயன்படுத்தவும். டிரிபிள் டப் என்பது அவசர துடைப்பு மட்டுமே.';

  @override
  String get softRefreshTipGotIt => 'கிடைத்தது';

  @override
  String get infoSoftRefreshTitle => 'பயன்பாடு சிக்கியதாக உணர்ந்தால்';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet (மேல்-இடது) → சாஃப்ட் ரெஃப்ரெஷ் ரேடியோக்கள் மற்றும் அருகிலுள்ளவர்களை இருமுறை தட்டவும்';

  @override
  String get infoSoftRefreshStepHard =>
      'இன்னும் சிக்கியுள்ளதா? தலைப்பை நீண்ட நேரம் அழுத்தவும் அல்லது ⋮ / அமைப்புகள் → கடின மீட்பு';

  @override
  String get infoSoftRefreshStepWait =>
      'ஸ்நாக்பார் முடிவுக்காகக் காத்திருந்து, மீண்டும் முயலவும். அமர்வு மீட்டமைப்பு உங்கள் விசைகளை வைத்திருக்கும்.';

  @override
  String get infoSoftRefreshStepWipe =>
      'டிரிபிள்-டேப் = எமர்ஜென்சி துடைப்பு (உள்ளூர் தரவை நீக்குகிறது) — வேண்டுமென்றே இருந்தால் மட்டுமே';

  @override
  String get appRecoverySection => 'பயன்பாட்டு மீட்பு';

  @override
  String get appRecoverySectionSubtitle =>
      'பயன்பாடு உறைந்ததாக உணரும்போது பயன்படுத்தவும். மென்மையான = தலைப்பு இருமுறை தட்டவும். கடின மீட்பு வலிமையானது. அமர்வு மீட்டமைப்பு விசைகளைத் துடைக்காமல் சேவைகளை மறுதொடக்கம் செய்கிறது.';

  @override
  String get appHardRecoverAction => 'கடின மீட்பு';

  @override
  String get appHardRecovering => 'மீள்வது கடினம்...';

  @override
  String get appSessionResetAction => 'அமர்வை மீட்டமைக்கவும்';

  @override
  String get appSessionResetRunning => 'அமர்வை மீட்டமைக்கிறது…';

  @override
  String get appSessionResetConfirmTitle => 'அமர்வை மீட்டமைக்கவா?';

  @override
  String get appSessionResetConfirmBody =>
      'இந்தச் சாதனத்தில் ResilNet சேவைகளை மறுதொடக்கம் செய்கிறது. உங்கள் அடையாளச் சாவிகள் வைக்கப்பட்டுள்ளன.';

  @override
  String get appRecoveryBusy => 'மீட்பு ஏற்கனவே இயங்குகிறது…';

  @override
  String get appRecoveryOk => 'மீட்பு முடிந்தது';

  @override
  String get appRecoveryPartial =>
      'சில படிகள் தவிர்க்கப்பட்டு மீட்பு முடிந்தது - இன்னும் சிக்கியிருந்தால் மீண்டும் முயற்சிக்கவும்';

  @override
  String get appRecoveryFailed =>
      'மீட்டெடுப்பு தோல்வியடைந்தது - அமர்வு மீட்டமைப்பை முயற்சிக்கவும் அல்லது OS இலிருந்து பயன்பாட்டை வலுக்கட்டாயமாக வெளியேற்றவும்';

  @override
  String get localWifiTitle => 'உள்ளூர் Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'இணையம் இல்லாமலேயே அருகிலுள்ள சாதனங்களை இணைக்கவும் — ஒரு லேனில் இருப்பது போலவே.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa நுழைவாயில் SoftAP அல்ல. இது ஃபோன்↔ஃபோன் / லேன் மட்டுமே.';

  @override
  String get localWifiUnavailable =>
      'உள்ளூர் Wi‑Fi இன்னும் தயாராகவில்லை - ஆப்ஸ் தொடங்குவதற்கு காத்திருக்கவும்.';

  @override
  String get lxmfBridgeTitle => 'முகப்பு முனை';

  @override
  String get lxmfBridgeSubtitle =>
      'சீல் செய்யப்பட்ட அரட்டைகளை உங்கள் Wi‑Fi இல் விருப்பமான Mac அல்லது Pi. இயல்பாக ஆஃப். எண்ட்-டு-எண்ட் என்க்ரிப்ஷனை மாற்றாது.';

  @override
  String get lxmfBridgeEnable => 'வீட்டு முனையைப் பயன்படுத்தவும்';

  @override
  String get lxmfBridgeDisabledHint =>
      'இந்த நெட்வொர்க்கில் Mac அல்லது Pi இல் பிரிட்ஜ் ஆப் இயங்கும் போது மட்டும் இயக்கவும்.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ஆன்லைன் — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'முகப்பு முனையை அடைய முடியவில்லை — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'முகப்பு முனை முகவரி';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP அல்லது http://IP:port — உதாரணம் 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'பியர் → LXMF டெஸ்ட் (JSON)';

  @override
  String get lxmfBridgeRefresh => 'நிலையைச் சேமித்து புதுப்பிக்கவும்';

  @override
  String get lxmfBridgeLabHint => 'மேம்பட்டது: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'முகப்பு முனை அமைப்புகள்';

  @override
  String get lxmfBridgeCheckConnection => 'இணைப்பைச் சரிபார்க்கவும்';

  @override
  String get lxmfBridgeStatusOnline => 'முகப்பு முனையுடன் இணைக்கப்பட்டது';

  @override
  String get lxmfBridgeStatusOffline => 'முகப்பு முனையை அடைய முடியவில்லை';

  @override
  String get lxmfBridgeYourDest =>
      'இந்த முனையின் முகவரி (நண்பர்களுடன் பகிரவும்)';

  @override
  String get lxmfBridgeCopyDest => 'முகவரியை நகலெடுக்கவும்';

  @override
  String get lxmfBridgeDestCopied => 'முகவரி நகலெடுக்கப்பட்டது';

  @override
  String get lxmfBridgeLinkedPeers => 'இணைக்கப்பட்ட நண்பர்கள்';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ஒவ்வொரு நண்பருக்கும் அவர்களின் வீட்டு முனை முகவரி ஒருமுறை தேவை. சீல் செய்யப்பட்ட அரட்டைகள் இந்தப் பாதையைப் பயன்படுத்தலாம்.';

  @override
  String get lxmfBridgeNoLinks => 'இதுவரை நண்பர்கள் யாரும் இணைக்கப்படவில்லை.';

  @override
  String get lxmfBridgeAddLink => 'நண்பரை இணைக்கவும்';

  @override
  String get lxmfBridgePickPeer => 'நண்பர்';

  @override
  String get lxmfBridgePeerDest => 'அவர்களின் வீட்டு முனை முகவரி';

  @override
  String get lxmfBridgePeerDestHint =>
      'முகப்பு முனை திரையில் இருந்து 32-எழுத்து குறியீடு';

  @override
  String get lxmfBridgeInvalidDest =>
      'அந்த முகவரி சரியானதாக இல்லை. அவர்களின் முகப்பு முனையிலிருந்து முழு குறியீட்டையும் ஒட்டவும்.';

  @override
  String get lxmfBridgeRemoveLink => 'இணைப்பை நீக்கவும்';

  @override
  String get lxmfBridgeSaveLink => 'சேமிக்கவும்';

  @override
  String get lxmfBridgeLinkSaved => 'நண்பர் இணைத்தார்';

  @override
  String get lxmfBridgeNoPeers =>
      'இதுவரை செய்தி அனுப்பக்கூடிய தொடர்புகள் எதுவும் இல்லை — முதலில் ஒரு நண்பரைச் சேர்க்கவும்.';

  @override
  String get lxmfBridgeHelp =>
      'மேக்/பையில் பாலத்தை இயக்கவும். இந்தப் பாதை உங்கள் LAN இல் இருக்கும் — இது LoRa அல்ல மேலும் இணையம் அல்லது புளூடூத் மெஷை மாற்றாது.';

  @override
  String get localWifiModeHotspot => 'அருகில்';

  @override
  String get localWifiModeRouter => 'திசைவி';

  @override
  String get localWifiHotspotIntro =>
      'ஒரு சாதனம் தனிப்பட்ட ஹாட்ஸ்பாட்டைப் பகிர்ந்து கொள்கிறது. மற்றவர்கள் அந்த ஹாட்ஸ்பாட்டில் சேர்கிறார்கள், பிறகு ResilNet அவர்களை உள்ளூர் நெட்வொர்க்கில் கண்டுபிடிக்கும்.';

  @override
  String get localWifiHostAction => 'நெட்வொர்க்கை உருவாக்கவும் (ஹோஸ்ட்)';

  @override
  String get localWifiJoinAction => 'நெட்வொர்க்கில் சேரவும்';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android அமைப்புகளைத் திறந்து தனிப்பட்ட ஹாட்ஸ்பாட் (அல்லது இணையப் பகிர்வு) ஆன் செய்யவும்.\n2. ஹாட்ஸ்பாட் பெயரை (மற்றும் கடவுச்சொல்) நண்பர்களிடம் சொல்லுங்கள்.\n3. இங்கு வந்து “ஹாட்ஸ்பாட் ஆன் - காத்திருப்பைத் தொடங்கு” என்பதைத் தட்டவும்.';

  @override
  String get localWifiHostReady =>
      'ஹாட்ஸ்பாட் இயக்கத்தில் உள்ளது — காத்திருக்கத் தொடங்குங்கள்';

  @override
  String get localWifiHostWaiting => 'நண்பர்கள் சேர்வதற்காகக் காத்திருக்கிறது…';

  @override
  String get localWifiJoinSteps =>
      '1. கணினி அமைப்புகளைத் திறந்து, உங்கள் நண்பரின் தனிப்பட்ட ஹாட்ஸ்பாட்டில் சேரவும்.\n2. இங்கே திரும்பி \"நான் இணைக்கப்பட்டிருக்கிறேன் - தேடு\" என்பதைத் தட்டவும்.';

  @override
  String get localWifiJoinReady => 'நான் இணைக்கப்பட்டிருக்கிறேன் - தேடல்';

  @override
  String get localWifiRouterIntro =>
      'ஒவ்வொரு சாதனத்தையும் ஒரே Wi‑Fi திசைவி/AP உடன் இணைக்கவும். திசைவிக்கு இணையம் தேவையில்லை - பகிரப்பட்ட உள்ளூர் நெட்வொர்க் மட்டுமே.';

  @override
  String get localWifiRouterSearch => 'இதை Wi‑Fi இல் தேடவும்';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi தகவலைப் புதுப்பிக்கவும்';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi இல் இல்லை';

  @override
  String get localWifiRouterNoWifiBody =>
      'கணினி அமைப்புகளில் ரூட்டரின் Wi‑Fi இல் சேர்ந்து, மீண்டும் தேடவும்.';

  @override
  String get localWifiDiscovering => 'உள்ளூர் Wi‑Fi இல் தேடுகிறது…';

  @override
  String get localWifiPeersFound => 'இந்த நெட்வொர்க்கில் உள்ள சாதனங்கள்';

  @override
  String get localWifiStop => 'நிறுத்து';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi பெயர் கிடைக்கவில்லை';

  @override
  String get localWifiStubBanner => 'LAN சாக்கெட்டுக்காக காத்திருக்கிறது…';

  @override
  String get localWifiLiveBanner =>
      'LAN கண்டுபிடிப்பு நேரலை (UDP) — இந்த Wi‑Fi இல் அறிவிப்பு + சீல் செய்யப்பட்ட அரட்டை';

  @override
  String get localWifiEmptyHotspot =>
      'இதுவரை சாதனங்கள் இல்லை.\nநண்பர்கள் உங்கள் ஹாட்ஸ்பாட்டில் சேர்ந்தார்களா மற்றும் லோக்கல் நெட்வொர்க் அணுகலை அனுமதித்தார்களா என்பதைச் சரிபார்க்கவும்.';

  @override
  String get localWifiEmptyRouter =>
      'இதுவரை சாதனங்கள் இல்லை.\nஅதே SSID? உள்ளூர் நெட்வொர்க் அனுமதிக்கப்படுகிறதா? சில திசைவிகள் சாதனத்திலிருந்து சாதன போக்குவரத்தைத் தடுக்கின்றன (AP தனிமைப்படுத்தல்).';

  @override
  String get localWifiIsolationHelp =>
      'நாம் ஏன் ஒருவரையொருவர் கண்டுபிடிக்க முடியவில்லை?';

  @override
  String get localWifiIsolationTitle =>
      'திசைவி வாடிக்கையாளர்களை தனிமைப்படுத்தலாம்';

  @override
  String get localWifiIsolationBody =>
      'AP/கிளையண்ட் தனிமைப்படுத்தல் (அல்லது விருந்தினர் நெட்வொர்க்) இயக்கத்தில் இருந்தால், அதே Wi‑Fi இல் உள்ள ஃபோன்கள் பேச முடியாது. தனிமைப்படுத்தலை முடக்கவும், முக்கிய SSID ஐப் பயன்படுத்தவும் அல்லது அருகிலுள்ள (ஹாட்ஸ்பாட்) பயன்முறைக்கு மாறவும்.';

  @override
  String get localWifiPeerReady => 'அரட்டையடிக்கத் தயார் (சாவி உள்ளது)';

  @override
  String get localWifiPeerNeedKey =>
      'கிடைத்தது - விசைகளை மாற்ற QR ஐ ஸ்கேன் செய்யவும்';

  @override
  String get localWifiErrorTitle => 'உள்ளூர் Wi‑Fi பிழை';

  @override
  String get localWifiErrorBody =>
      'ஏதோ தவறாகிவிட்டது. நிறுத்திவிட்டு மீண்டும் முயற்சிக்கவும்.';

  @override
  String get preparingSystem => 'அமைப்பு தயாராகிறது…';

  @override
  String get bootFailedTitle => 'தொடங்க முடியவில்லை';

  @override
  String get retry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get bootRecoveryAction =>
      'புதிய அடையாளத்தைத் தொடங்கவும் (உள்ளூர் தரவை அழிக்கவும்)';

  @override
  String get bootRecoveryConfirmTitle => 'புதிய அடையாளத்தைத் தொடங்கவா?';

  @override
  String get bootRecoveryConfirmBody =>
      'இது இந்தச் சாதனத்தில் உள்ள உள்ளூர் அரட்டைகள், விசைகள் மற்றும் அடையாளத்தை நிரந்தரமாக அழிக்கும்.\nசகாக்கள் உங்கள் புதிய அடையாளத்துடன் உங்கள் QR ஐ மீண்டும் ஸ்கேன் செய்ய வேண்டும்.\nஇதை செயல்தவிர்க்க முடியாது.';

  @override
  String get bootRecoveryRunning => 'உள்ளூர் அடையாளத்தை மீட்டமைக்கிறது…';

  @override
  String get bootRecoverySuccess => 'உள்ளூர் அடையாள மீட்டமைப்பு முடிந்தது';

  @override
  String bootRecoveryFailed(String error) {
    return 'அடையாளத்தை மீட்டமைக்க முடியவில்லை: $error';
  }

  @override
  String get cancel => 'ரத்து செய்';

  @override
  String get save => 'சேமிக்கவும்';

  @override
  String get close => 'மூடு';

  @override
  String get start => 'தொடங்கு';

  @override
  String get send => 'அனுப்பு';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get language => 'மொழி';

  @override
  String get languageSubtitle =>
      'இயல்பாக, பயன்பாடு உங்கள் தொலைபேசி மொழியைப் பின்பற்றுகிறது (ஆதரிக்கப்படும் போது). மற்ற மொழிகள் ஆங்கிலத்திற்குத் திரும்புகின்றன. நீங்கள் ஒரு மொழியையும் இங்கே பூட்டலாம்.';

  @override
  String get languageSystem => 'கணினி இயல்புநிலை';

  @override
  String get languageThai => 'தாய்';

  @override
  String get languageEnglish => 'ஆங்கிலம்';

  @override
  String get notificationsTooltip => 'அறிவிப்பு அமைப்புகள்';

  @override
  String get enableMessageNotifications => 'செய்தி அறிவிப்புகளை இயக்கவும்';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 செய்திகள் மற்றும் ஆன்லைனில் உள்ளவர்கள் (உள்ளூர் விழிப்பூட்டல்கள்)';

  @override
  String get networkMembersTooltip => 'நெட்வொர்க் உறுப்பினர்கள்';

  @override
  String get identityQrTooltip => 'அடையாளம் / QR';

  @override
  String get feedDirects => 'அரட்டை';

  @override
  String get feedMesh => '#கண்ணி';

  @override
  String get feedGeo => 'பகுதி';

  @override
  String get feedDirectsSubtitle => 'தனிப்பட்ட E2EE செய்திகள்';

  @override
  String get feedMeshSubtitle => 'அருகிலுள்ள சகாக்கள் (BLE)';

  @override
  String get feedGeoSubtitle => 'ஜியோஹாஷ் கண்டுபிடிப்பு சேனல்';

  @override
  String get peerIdHint =>
      'அரட்டையைத் தொடங்க ரிசீவர் ஐடியை (பொது விசை ஹாஷ்) ஒட்டவும்';

  @override
  String get directsEmpty =>
      'இன்னும் அரட்டைகள் இல்லை — தொடங்குவதற்கு QR ஐ ஸ்கேன் செய்யவும் அல்லது ரிசீவர் ஐடியை ஒட்டவும்\nசெய்திகளை அனுப்புவதற்கு முன் E2EE மூலம் சீல் வைக்கப்படும் (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • அரட்டையைத் திறக்க தட்டவும்';

  @override
  String get meshIntro =>
      'BLE வரம்பில் உள்ள சகாக்கள் — தனிப்பட்ட E2EE அரட்டைக்கு தட்டவும் (#mesh இல் பொது எழுதுதல் இல்லை)\nஹைப்ரிட் ரூட்டர் வழியாக அனுப்புகிறது (BLE + LoRa + Nostr ஆன்லைனில் இருக்கும்போது)';

  @override
  String get meshEmptyRunning =>
      'அருகில் இதுவரை யாரும் இல்லை — BLE வரம்பிற்குள் மற்றொரு சாதனத்தில் பயன்பாட்டைத் திறக்கவும்';

  @override
  String get meshEmptyStopped =>
      'BLE இயங்கவில்லை - புளூடூத் / இருப்பிட அனுமதியை வழங்கவும்';

  @override
  String get meshNearbyPrefix => 'அருகில்';

  @override
  String get meshRetentionTitle => 'செய்திகளை தானாக நீக்கவும்';

  @override
  String get meshRetentionSubtitle =>
      'பழைய உள்ளூர் அரட்டை வரலாறு தானாகவே அகற்றப்படும்';

  @override
  String get meshRetentionKeep => 'வைத்துக்கொள்';

  @override
  String get meshRetention1Day => '1 நாள்';

  @override
  String get meshRetention3Days => '3 நாட்கள்';

  @override
  String get meshRetention7Days => '7 நாட்கள்';

  @override
  String get refreshLocationTooltip => 'இருப்பிடத்தைப் புதுப்பிக்கவும்';

  @override
  String get geoIntro =>
      'இந்த ஜியோஹாஷில் ஆன்லைனில் உள்ளவர்கள் 1:1 அல்லது ஒரு பகுதி பொது ரசிகர்களுக்கு செய்தி அனுப்பலாம் (இன்னும் ஒரு பியர்க்கு E2EE சீல் வைக்கப்பட்டுள்ளது — சாதாரண உரை அல்ல)';

  @override
  String geoEmpty(String channel) {
    return '$channel இல் இதுவரை யாரும் ஆன்லைனில் இல்லை\nபோக்குவரத்து → இணையம்/ஆட்டோவைப் பயன்படுத்தவும், Nostr க்கு காத்திருக்கவும், இருப்பிடத்தைப் புதுப்பிக்கவும்';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'ஆன்லைனில் $channel • 1:1 E2EEக்கு தட்டவும்';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'அருகில் (காத்திருப்புப் பகுதி) • 1:1 E2EEக்கு தட்டவும்';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nostr இல் $channel இல் பார்க்கப்பட்டது • கண்டுபிடிப்பு மட்டும் (மரபு)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'லெகசி அநாமதேய இருப்பு — பிணைக்கப்பட்ட சக அல்லது பரிமாற்ற QRக்காக காத்திருங்கள்';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE அருகில் — 1:1 E2EE ஐ தொடங்க QR ஐ ஸ்கேன் செய்யவும்';

  @override
  String get geoInternetDiscoverHint =>
      'பகுதி இணைய கண்டுபிடிப்பிற்கு Nostr இணைக்கப்பட வேண்டும் (அமைப்புகள் → போக்குவரத்து → இணையம்/தானியங்கு)';

  @override
  String get geoEmptyNoLocation =>
      'இருப்பிடம் இன்னும் தீர்க்கப்படவில்லை — உங்கள் ஜியோஹாஷை Nostr இல் வெளியிட GPS ஐ அனுமதித்து புதுப்பிக்கவும்';

  @override
  String get geoEmptyNeedsPermission =>
      'இருப்பிட அனுமதி மறுக்கப்பட்டது - அமைப்புகள் → தனியுரிமை → இருப்பிடத்தில் ResilNet ஐ அனுமதிக்கவும்';

  @override
  String get geoEmptyServicesDisabled =>
      'இருப்பிடச் சேவைகள் முடக்கப்பட்டுள்ளன - அமைப்புகளில் அவற்றை இயக்கவும்';

  @override
  String get geoEmptyNoGpsFix =>
      'ஜிபிஎஸ் பிழைத்திருத்தத்தைப் பெற முடியவில்லை (Wi‑Fi iPadகளில் பொதுவானது) — கைமுறையாக ஜியோஹாஷை கீழே அமைக்கவும்';

  @override
  String get geoEmptyTeleportHint =>
      'இட ஐகானைத் தட்டவும் → ஜியோஹாஷை உள்ளிடவும் (எ.கா. w5) → டெலிபோர்ட்';

  @override
  String get geoSetGeohashManually => 'ஜியோஹாஷை அமைக்கவும்';

  @override
  String get geoTeleportHint =>
      'ஜிபிஎஸ் இல்லையா? ஜியோஹாஷ் முன்னொட்டை உள்ளிட்டு (2–7 எழுத்துகள், எ.கா. w5) டெலிபோர்ட் என்பதைத் தட்டவும்';

  @override
  String get geoTeleportInvalid =>
      'தவறான ஜியோஹாஷ் - அடிப்படை32 எழுத்துக்கள்/எண்களை மட்டும் பயன்படுத்தவும் (எ.கா. w5 அல்லது w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'பகுதி $channel என அமைக்கப்பட்டது';
  }

  @override
  String geoManualActive(String channel) {
    return 'கையேடு பகுதி: $channel (GPS புதுப்பிப்பு மேலெழுதப்படும்)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr தயாராக இல்லை - மீண்டும் இணை என்பதைத் தட்டவும் (init வெற்றிபெறும் வரை 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'போக்குவரத்து என்பது மெஷ்-மட்டுமே — Nostrக்கு மேல் உள்ளவர்களைக் கண்டறிய இணையம் அல்லது ஆட்டோவுக்கு மாறவும்';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel இல் இதுவரை யாரும் இல்லை — இரண்டு சாதனங்களிலும் பகுதி + இணையத்தைத் திறந்து வைத்து ~60கள் காத்திருக்கவும்';
  }

  @override
  String get geoChannelFallback => '#பகுதி';

  @override
  String get geoRefreshLocation => 'இருப்பிடத்தைப் புதுப்பிக்கவும்';

  @override
  String get settingsClearLocationTitle => 'தெளிவான இடம்';

  @override
  String get settingsClearLocationSubtitle =>
      'ஜிபிஎஸ் / டெலிபோர்ட் ஜியோஹாஷை அகற்று (பகுதி #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'இருப்பிடத்தை அழிக்கவா?';

  @override
  String get settingsClearLocationConfirmBody =>
      'இந்தச் சாதனத்தில் சேமிக்கப்பட்ட ஜியோஹாஷை நீக்குகிறது. நீங்கள் GPS ஐப் புதுப்பிக்கலாம் அல்லது பின்னர் மீண்டும் டெலிபோர்ட் செய்யலாம்.';

  @override
  String get settingsClearLocationAction => 'தெளிவான இடம்';

  @override
  String get settingsClearLocationSnack => 'இடம் அழிக்கப்பட்டது';

  @override
  String get chatVoiceTooLarge =>
      'குரல் குறிப்பு மிகவும் பெரியது — அதிகபட்சம் ~30 வினாடிகள்';

  @override
  String get chatVoiceNeedInternet =>
      'குரல் குறிப்புக்கு இணையம் தேவை (Nostr) — BLEக்கு மட்டும் பெரியது';

  @override
  String get chatVoiceSentInternet =>
      'குரல் குறிப்பு இணையம் வழியாக அனுப்பப்பட்டது';

  @override
  String get noticeAnonMention => 'குறிப்பிடவும்';

  @override
  String get noticeAnonDm => 'நேரடி செய்தி';

  @override
  String get noticeAnonHug => 'கட்டிப்பிடி';

  @override
  String get noticeAnonSlap => 'அறைதல்';

  @override
  String get noticeAnonBlock => 'தொகுதி';

  @override
  String get noticeAnonNeedKey =>
      'இதுவரை பொது விசை இல்லை — QR ஐ முதலில் 1:1க்கு மாற்றவும்';

  @override
  String get noticeAnonActionSent => 'அனுப்பப்பட்டது';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon தடுக்கப்பட்டது';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* அணைப்புகள் $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* அறைகிறது $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr ஐ மீண்டும் இணைக்கவும்';

  @override
  String get nostrSectionTitle => 'Nostr ரிலேக்கள்';

  @override
  String get nostrSectionSubtitle =>
      'இணைய செய்தி அனுப்புதல் மற்றும் பகுதி கண்டுபிடிப்பு ஆகியவை இந்த ரிலேகளைப் பயன்படுத்துகின்றன. நிலை ஆஃப்லைனில் இருந்தால், மீண்டும் இணை என்பதைத் தட்டவும்.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total இணைக்கப்பட்டது';
  }

  @override
  String get nostrStatusOffline =>
      'ஆஃப்லைன் — ரிலேக்கள் பட்டியலிடப்பட்டுள்ளன ஆனால் எதுவும் இணைக்கப்படவில்லை';

  @override
  String get nostrStatusNotInit =>
      'தொடங்கவில்லை (0/0) — துவக்க மீண்டும் இணை என்பதைத் தட்டவும்';

  @override
  String get nostrReconnectAction => 'Nostr ஐ மீண்டும் இணைக்கவும்';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr இணைக்கப்பட்டுள்ளது ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'இன்னும் ஆஃப்லைனில் உள்ளது — Wi‑Fi/செல்லுலரைச் சரிபார்க்கவும் அல்லது மீண்டும் முயற்சிக்கவும்';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'தோல்வி: $error';
  }

  @override
  String get nostrReconnecting => 'ரிலேகளுடன் இணைக்கிறது…';

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
    return '$channel இல் இணையம் (Nostr) • சீல் செய்யப்பட்ட அரட்டை தயார்';
  }

  @override
  String get transportModeTitle => 'பகுதி போக்குவரத்து';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE அருகில் (ரேடியோ) Nostr · இணையம் & ஆட்டோ = Nostr பேர் பட்டியல் இல்லாத போது';

  @override
  String get transportModeMesh => 'கண்ணி';

  @override
  String get transportModeInternet => 'இணையம்';

  @override
  String get transportModeAuto => 'ஆட்டோ';

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
      'இந்தப் பகுதியில் ஆன்லைனில் உள்ள அனைவருக்கும் பொதுச் செய்தி';

  @override
  String get geoPublicSend => 'பொது';

  @override
  String geoPublicHelp(int count) {
    return '$count ஆன்லைன் பியர்(களுக்கு) சீல் செய்யப்பட்ட ஃபேன்-அவுட் - ஒவ்வொன்றும் ஒரு தனிப்பட்ட உறையைப் பெறுகின்றன';
  }

  @override
  String geoPublicSent(int count) {
    return 'இந்தப் பகுதியில் உள்ள $count பியர்(களுக்கு) அனுப்பப்பட்டது';
  }

  @override
  String get geoPublicSentNone =>
      'ஆன்லைனில் மெசேஜ் செய்யக்கூடிய சகாக்கள் இல்லை - விசைகளை வைத்திருக்கும் பியர்களுடன் ஏரியா/மெஷ் திறக்கவும் அல்லது BLE/Nostr க்கு காத்திருக்கவும்';

  @override
  String get areaPublicBadge => 'பகுதி பொதுமக்கள்';

  @override
  String get geoErrorPermission =>
      'இருப்பிடத்தைப் படிக்க முடியவில்லை - இருப்பிட அனுமதியைச் சரிபார்க்கவும்';

  @override
  String get geoPrecisionRegion => 'பிராந்தியம்';

  @override
  String get geoPrecisionProvince => 'மாகாணம்';

  @override
  String get geoPrecisionCity => 'நகரம்';

  @override
  String get geoPrecisionNeighborhood => 'அக்கம்';

  @override
  String get geoPrecisionBlock => 'தடு';

  @override
  String get aliasTitle => 'புனைப்பெயரை அமைக்கவும் (தொடர்பு மாற்றுப்பெயர்)';

  @override
  String get aliasHintBody =>
      'இந்த மாற்றுப்பெயர் இந்தச் சாதனத்தில் மட்டுமே சேமிக்கப்படுகிறது (உள்ளூர் மட்டும்)\nஇது E2EE டிராஃபிக்குடன் அனுப்பப்படாது';

  @override
  String get aliasLabel => 'புனைப்பெயர்';

  @override
  String get aliasHint => 'எ.கா. \"கிராமத் தலைவர்\", \"பி\'சோம்சாய்\"...';

  @override
  String get settingsDevices => 'சாதனங்கள்';

  @override
  String get settingsFirmwareTitle =>
      'ESP32 நிலைபொருளைப் பதிவிறக்கவும் / புதுப்பிக்கவும்';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin கோப்புகளைப் பதிவிறக்கி, OTA வழியாக ESP32 போர்டைப் புதுப்பிக்கவும்';

  @override
  String get mtBridgeTitle => 'Meshtastic பாலம்';

  @override
  String get mtBridgeSettingsSubtitle =>
      'உரை-மட்டும் A/B பிரிட்ஜ் — ResilNet E2EE அல்ல';

  @override
  String get mtBridgeIntro =>
      'Meshtastic மற்றும் ResilNet இடையே குறுகிய எளிய உரையை நகர்த்தவும். ஏ மற்றும் பி முறைகள் ஒரே நேரத்தில் இயங்க முடியாது. இது எண்ட்-டு-எண்ட் என்க்ரிப்ஷன் அல்ல.';

  @override
  String get mtBridgeModeLabel => 'பயன்முறை';

  @override
  String get mtBridgeModeOff => 'ஆஃப்';

  @override
  String get mtBridgeModeA => 'இன்ஜெஸ்ட் ஏ';

  @override
  String get mtBridgeModeB => 'எக்ரஸ் பி';

  @override
  String get mtBridgeModeOffShort => 'ஆஃப்';

  @override
  String get mtBridgeModeAShort => 'இல் ஏ';

  @override
  String get mtBridgeModeBShort => 'அவுட் பி';

  @override
  String get mtBridgeMutexHint =>
      'ஒரு பயன்முறையைத் தேர்ந்தெடுப்பது மற்றொன்று தானாகவே அணைக்கப்படும். ஒரே நேரத்தில் A+B ஆதரிக்கப்படவில்லை.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'டெமோ (பதிவு)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'உள்வரும் உரை #meshtastic என அறிவிப்புகளின் கீழ் தோன்றும். மெஷ் ரிலே விருப்பமானது (இயல்புநிலையாக ஆஃப்).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet மெஷிலும் ரிலே';

  @override
  String get mtBridgeRelayHint =>
      'இயக்கப்பட்டால், கையொப்பமிடப்பட்ட பொது அறிவிப்புகள் ஒளிபரப்பப்படும். ஆஃப் = இந்த மொபைலின் அறிவிப்புகள் மட்டும்.';

  @override
  String get mtBridgeSimulateHint => 'டெமோ செய்தி';

  @override
  String get mtBridgeSimulate => 'Meshtastic செய்தியை உருவகப்படுத்தவும்';

  @override
  String get mtBridgeIngestOk =>
      'அறிவிப்புகளில் உட்செலுத்தப்பட்டது (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'எச்சரிக்கை: இங்கு அனுப்பப்படும் செய்திகள் ResilNet E2EE அல்ல. Meshtastic பாதையில் உள்ள எவரும் அவற்றைப் படிக்கலாம்.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'வெளியிட வேண்டிய உரை';

  @override
  String get mtBridgeSend => 'Meshtastic க்கு அனுப்பவும்';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic க்கு வரிசையில் உள்ளது (பதிவு / வரலாற்றைப் பார்க்கவும்)';

  @override
  String get mtBridgeLastEgress => 'கடைசி வெளியேற்றம்';

  @override
  String get mtBridgeEgressHistory => 'சமீபத்திய முன்னேற்றம்';

  @override
  String get mtBridgeOffHint =>
      'பிரிட்ஜைப் பயன்படுத்த Ingest (A) அல்லது Egress (B) ஐ இயக்கவும்.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE அல்ல';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT போக்குவரத்தைப் பயன்படுத்தவும்';

  @override
  String get mtBridgeUseMqttHint =>
      'ஆஃப் = டெமோ பதிவு மட்டுமே (MQTT உள்வரும் புறக்கணிக்கப்பட்டது). ஆன் = MQTT இணைக்கப்படும் போது உட்கொள்ளல்/வெளியேற்றம்.';

  @override
  String get mtBridgeMqttHost => 'தரகர் ஹோஸ்ட்';

  @override
  String get mtBridgeMqttPort => 'துறைமுகம்';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) பயன்படுத்தவும்';

  @override
  String get mtBridgeMqttTlsHint =>
      'வழக்கமான போர்ட் 8883. கணினி சான்றிதழ்களைப் பயன்படுத்துகிறது; கைகுலுக்கல் பிழைகளில் மென்மையாக தோல்வியடைகிறது.';

  @override
  String get mtBridgeMqttAutoReconnect => 'தானாக மீண்டும் இணைக்கவும்';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ஆன் செய்யும்போது, ​​துளிகளுக்குப் பிறகு கிளையன்ட் மீண்டும் இணைக்க முயற்சிக்கிறார். மீட்டமைக்கப்படும் வரை இணைப்பதை நிலை காட்டுகிறது.';

  @override
  String get mtBridgeMqttTopicHelpers => 'தலைப்பு உதவியாளர்கள்';

  @override
  String get mtBridgeMqttRegion => 'பிராந்திய முன்னொட்டு (விரும்பினால்)';

  @override
  String get mtBridgeMqttRegionHint =>
      'அமைக்கப்படும்போது, ​​ரூட்டை msh/<region>/2/json ஆகப் பயன்படுத்து (தலைப்பு மூலத்தை மீறுகிறது).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON தலைப்பு ரூட்';

  @override
  String get mtBridgeMqttDownlinkChannel => 'டவுன்லிங்க் சேனல் பெயர்';

  @override
  String get mtBridgeMqttApplyTopics =>
      'ரூட்டைப் பயன்படுத்தவும் → சந்தா / தலைப்புகளை வெளியிடவும்';

  @override
  String get mtBridgeMqttAdvanced => 'மேம்பட்ட MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, மீண்டும் இணைத்தல், தலைப்புகள், சான்றுகள்';

  @override
  String get mtBridgeMqttTopicIn => 'தலைப்பை குழுசேர்';

  @override
  String get mtBridgeMqttTopicOut => 'தலைப்பை வெளியிடவும்';

  @override
  String get mtBridgeMqttGatewayFrom => 'கேட்வே நோட் ஐடி (இருந்து)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'டெசிமல் ஐடி அல்லது !ஹெக்ஸ் — அனுப்பு டெக்ஸ்ட் டவுன்லிங்கிற்கு தேவை';

  @override
  String get mtBridgeMqttChannelIndex =>
      'மெஷ் சேனல் இன்டெக்ஸ் (விரும்பினால் 0–7)';

  @override
  String get mtBridgeMqttUser => 'பயனர் பெயர் (விரும்பினால்)';

  @override
  String get mtBridgeMqttPass => 'கடவுச்சொல் (விரும்பினால்)';

  @override
  String get mtBridgeMqttPassStored =>
      'இந்தச் சாதனத்தில் கடவுச்சொல் சேமிக்கப்பட்டுள்ளது (காட்டப்படவில்லை).';

  @override
  String get mtBridgeMqttPassReplace =>
      'புதிய கடவுச்சொல் (வைக்க காலியாக விடவும்)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'சேமிக்கப்பட்ட கடவுச்சொல்லை வைத்திருக்க காலியாக விடவும்.';

  @override
  String get mtBridgeMqttPassClear => 'கடவுச்சொல்லை அழிக்கவும்';

  @override
  String get mtBridgeMqttSave => 'MQTT அமைப்புகளைச் சேமிக்கவும்';

  @override
  String get mtBridgeMqttSaved => 'MQTT அமைப்புகள் சேமிக்கப்பட்டன';

  @override
  String get mtBridgeMqttConnect => 'இணைக்கவும்';

  @override
  String get mtBridgeMqttDisconnect => 'துண்டிக்கவும்';

  @override
  String get mtBridgeMqttConnected => 'MQTT இணைக்கப்பட்டுள்ளது';

  @override
  String get mtBridgeMqttConnecting => 'MQTT இணைக்கிறது…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT துண்டிக்கப்பட்டது';

  @override
  String get mtBridgeMqttError => 'MQTT பிழை';

  @override
  String get mtBridgeErrModeIngest => 'முதலில் Ingest (A) க்கு மாறவும்';

  @override
  String get mtBridgeErrModeEgress => 'முதலில் எக்ரஸ் (B)க்கு மாறவும்';

  @override
  String get mtBridgeErrRate => 'மெதுவாக - விகிதம் வரையறுக்கப்பட்ட';

  @override
  String get mtBridgeErrDedupe => 'நகல் செய்தி புறக்கணிக்கப்பட்டது';

  @override
  String get mtBridgeErrLoop => 'பிரிட்ஜ் லூப்பைத் தடுக்க கைவிடப்பட்டது';

  @override
  String get mtBridgeErrEmpty => 'செய்தி காலியாக உள்ளது';

  @override
  String get mtBridgeErrPublish => 'வெளியிட முடியவில்லை';

  @override
  String get mtBridgeErrNotConnected => 'MQTT இணைக்கப்படவில்லை';

  @override
  String get mtBridgeErrMissingHost => 'MQTT தரகர் ஹோஸ்டை உள்ளிடவும்';

  @override
  String get mtBridgeErrMissingTopic => 'தலைப்புகளை பதிவு செய்து வெளியிடவும்';

  @override
  String get mtBridgeErrMissingFromNode =>
      'அனுப்பும் உரைக்கு நுழைவாயில் முனை ஐடியை (இருந்து) உள்ளிடவும்';

  @override
  String get mtBridgeErrConnect => 'MQTT இணைப்பு தோல்வியடைந்தது';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS இணைப்பு தோல்வியடைந்தது';

  @override
  String get settingsData => 'தரவு';

  @override
  String get settingsDataHint =>
      'தரவுத்தளத்தை சுருக்க உள்ளூர் செய்திகளை நீக்கவும் - அடையாளம், விசைகள் மற்றும் சகாக்கள் சேமிக்கப்படும்';

  @override
  String get settingsSaveHistoryTitle => 'செய்தி வரலாற்றைச் சேமிக்கவும்';

  @override
  String get settingsSaveHistorySubtitle =>
      'முடக்கப்பட்டிருக்கும் போது, ​​செய்திகள் கம்பியில் E2EE இருக்கும் மற்றும் இந்த அமர்வுக்கு மட்டுமே வைக்கப்படும் (உள்ளூர் அரட்டை வரலாற்றில் இல்லை). இந்தச் சாதனத்தில் உங்கள் சொந்த உரை இன்னும் எளிய உரையாகக் காட்டப்படும்.';

  @override
  String get settingsPrivacy => 'தனியுரிமை';

  @override
  String get settingsE2eeTitle => 'எண்ட்-டு-எண்ட் என்க்ரிப்ஷன்';

  @override
  String get settingsE2eeSubtitle =>
      'எப்போதும் இயக்கத்தில் இருக்கும் — செய்திகளை அனுப்புவதற்கு முன் RSA-OAEP + AES-GCM உடன் சீல் வைக்கப்படும். ரிலே மற்றும் அருகிலுள்ள ஹாப்ஸ் உள்ளடக்கங்களைப் படிக்க முடியாது.';

  @override
  String get settingsScreenshotTitle => 'ஸ்கிரீன்ஷாட் எச்சரிக்கைகள்';

  @override
  String get settingsScreenshotSubtitle =>
      'இந்தச் சாதனம் திரையைப் பிடிக்கும் போது, ​​அரட்டையில் கணினி வரியைக் காட்டு';

  @override
  String get settingsNostrExpiryTitle => 'Nostr செய்தியை வைத்திருக்கும் நேரம்';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr வழியாக ஆன்லைனில் இருக்கும்போது எவ்வளவு நேரம் சீல் செய்யப்பட்ட உறைகள் உள்நாட்டில் இருக்க வேண்டும்';

  @override
  String get noticeExpiresIn => 'காலாவதியாகிறது';

  @override
  String get noticesTitle => 'அறிவிப்புகள்';

  @override
  String get noticesMeshIntro =>
      'பொது புல்லட்டின் — ரேடியோ வரம்பில் அனைவருக்கும் தெரியும், குறியாக்கம் செய்யப்படவில்லை. இது ஃபோன்-டு-ஃபோன் ஆஃப்லைனில் செல்கிறது, மேலும் அருகிலுள்ள ResilNet ரிலே பெட்டிகள் ஒரு நகலை வைத்திருக்கின்றன, இதனால் பின்னர் வருபவர்கள் அதை இன்னும் பார்க்கிறார்கள்.';

  @override
  String get noticesMeshPublicBadge => 'பொது · குறியாக்கம் செய்யப்படவில்லை';

  @override
  String get noticesGeoIntro =>
      'இந்த இடத்திற்கான சிறு குறிப்புகளைச் சேர்க்கவும், அதனால் மற்ற பார்வையாளர்கள் அவற்றைக் கண்டறிய முடியும்.';

  @override
  String get noticesEmpty => 'இதுவரை எந்த அறிவிப்பும் இல்லை';

  @override
  String get noticesEmptyHint =>
      'இங்குள்ளவர்களுக்கு முதல் அறிவிப்பைப் பின் செய்யவும்.';

  @override
  String get noticesComposeHint => 'அறிவிப்பை இடுங்கள்...';

  @override
  String get noticesUrgent => 'அவசரம்';

  @override
  String get noticesOpen => 'அறிவிப்புகள்';

  @override
  String get screenshotTaken => '* நீங்கள் ஒரு ஸ்கிரீன்ஷாட் எடுத்தீர்கள் *';

  @override
  String get chatAttachImage => 'படத்தை இணைக்கவும்';

  @override
  String get chatImageLabel => 'படம்';

  @override
  String get chatImageTooLarge =>
      'படம் மிகவும் பெரியது - மற்றொரு படத்தை முயற்சிக்கவும்';

  @override
  String get chatNostrExpiry => 'Nostr வைத்திருங்கள்';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel க்கு அனுப்பு — பொது';
  }

  @override
  String get settingsClearTitle => 'அனைத்து செய்திகளையும் அழிக்கவும்';

  @override
  String get settingsClearSubtitle =>
      'இந்தச் சாதனத்தில் உள்ள அனைத்து அரட்டைகளையும் நீக்கவும்';

  @override
  String get settingsClearConfirmTitle => 'எல்லா செய்திகளையும் அழிக்கவா?';

  @override
  String get settingsClearConfirmBody =>
      'இது இந்தச் சாதனத்தில் உள்ள அனைத்து அரட்டை செய்திகளையும் நீக்குகிறது.\nசகாக்கள் மற்றும் புனைப்பெயர்கள் அகற்றப்படவில்லை.';

  @override
  String get settingsClearAction => 'தெளிவான தரவு';

  @override
  String get settingsClearedSnack => 'தரவு அழிக்கப்பட்டது';

  @override
  String settingsVersion(String version) {
    return 'பதிப்பு $version';
  }

  @override
  String get meshBleScanning => 'BLE: முனைகளை ஸ்கேன் செய்கிறது';

  @override
  String get meshBleEsp32Scanning => 'ESP32: அருகிலுள்ள முனையைத் தேடுகிறது';

  @override
  String get meshBleSyncing => 'BLE: ESP32 உடன் ஒத்திசைக்கிறது';

  @override
  String get meshNostrPublishing => 'Nostr: வெளியிடுதல்';

  @override
  String get meshBleIdle => 'BLE மெஷ் ஆன் — அருகிலுள்ள ஃபோன்கள் எதுவும் இல்லை';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE மெஷ் — $count ஃபோன்(கள்) அருகில்';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: அனுமதி தேவை';

  @override
  String get meshBlePausedCamera =>
      'கேமராவிற்கு BLE இடைநிறுத்தப்பட்டது - தொடக்கம் BLE என்பதைத் தட்டவும்';

  @override
  String get meshBleStopped =>
      'BLE முடக்கத்தில் உள்ளது - புளூடூத் இயக்கத்தில் உள்ளதா என்பதைச் சரிபார்த்து, பிறகு தொடங்கு BLE என்பதைத் தட்டவும்';

  @override
  String get meshBleRestart => 'BLE ஐத் தொடங்கவும்';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'அனுமதிகளைச் சரிபார்த்து BLEஐத் தொடங்கவும்';

  @override
  String get meshNostrOffline => 'Nostr ஆஃப்லைனில்';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count அருகிலுள்ள சகாக்கள் • LoRa $lora • ஒத்திசைவு ~$metersநி';
  }

  @override
  String get meshLoraReady => 'தயார்';

  @override
  String get meshLoraNotReady => 'தயாராக இல்லை';

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
    return 'கேட்வே UDP: $label';
  }

  @override
  String get meshGatewayReady => 'கேட்வே யுடிபி: தயார்';

  @override
  String get permissionTitle =>
      'BLE மெஷ் நெட்வொர்க்கைத் தொடங்க அணுகலை அனுமதிக்கவும்';

  @override
  String get permissionBody =>
      'பயன்பாட்டிற்கு புளூடூத் (ஸ்கேன் / இணைப்பு / விளம்பரம்), இருப்பிடம் (பழைய ஆண்ட்ராய்டு சாதனங்களுக்கு) மற்றும் மைக்ரோஃபோன் (அரட்டை மற்றும் அறிவிப்புகளில் குரல் குறிப்புகளுக்கு) சமூக செய்தியிடல் தேவை.';

  @override
  String get permissionE2ee =>
      'எண்ட்-டு-எண்ட் என்க்ரிப்ஷன் (E2EE)\nரிலே முனைகளால் செய்தி உள்ளடக்கங்களைப் படிக்க முடியாது';

  @override
  String get permissionReady => 'அனுமதிகள் தயார்';

  @override
  String get permissionRequest => 'அனுமதித்து தொடரவும்';

  @override
  String get permissionNotReadySnack =>
      'சிஸ்டம் இன்னும் தயாராகவில்லை - சிறிது நேரம் காத்திருந்து மீண்டும் முயற்சிக்கவும்';

  @override
  String get permissionDeniedSnack =>
      'அனுமதிகள் முழுமையடையவில்லை - அமைப்புகளைத் திறந்து > ResilNet மற்றும் புளூடூத் / இருப்பிடம் / மைக்ரோஃபோனை அனுமதிக்கவும்';

  @override
  String get permissionMicDenied =>
      'மைக்ரோஃபோன் அணுகல் மறுக்கப்பட்டது - குரல் குறிப்புகளை பதிவு செய்ய அமைப்புகளில் அனுமதிக்கவும்';

  @override
  String get permissionMicOpenSettings => 'அமைப்புகள்';

  @override
  String get permissionCameraDenied =>
      'கேமரா அணுகல் மறுக்கப்பட்டது - QR குறியீடுகளை ஸ்கேன் செய்ய அமைப்புகளில் அனுமதிக்கவும்';

  @override
  String get permissionCameraFailed =>
      'QR குறியீடுகளை ஸ்கேன் செய்ய கேமரா அனுமதி தேவை';

  @override
  String get permissionCameraOpenSettings => 'அமைப்புகள்';

  @override
  String get permissionPhotosDenied =>
      'புகைப்பட நூலக அணுகல் மறுக்கப்பட்டது - உங்கள் QR குறியீட்டைச் சேமிக்க அமைப்புகளில் அனுமதிக்கவும்';

  @override
  String get permissionPhotosFailed =>
      'உங்கள் QR குறியீட்டைச் சேமிக்க, புகைப்பட நூலக அனுமதி தேவை';

  @override
  String get permissionPhotosOpenSettings => 'அமைப்புகள்';

  @override
  String permissionFailedSnack(String error) {
    return 'அனுமதி கோரிக்கை தோல்வி: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet கட்டிடக்கலை • ஸ்டோர் மற்றும் ஃபார்வர்டு மல்டி-ஹாப்';

  @override
  String get onboardingSkip => 'தவிர்க்கவும்';

  @override
  String get onboardingNext => 'அடுத்து';

  @override
  String get onboardingStart => 'தொடங்குங்கள்';

  @override
  String get onboardingWelcomeTitle => 'ResilNet க்கு வரவேற்கிறோம்';

  @override
  String get onboardingWelcomeBody =>
      'இணையம் இல்லாவிட்டாலும், மெஷ் நெட்வொர்க்கில் ResilNet இல் அரட்டையடிக்கவும்';

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
  String get onboardingChannelsTitle =>
      'மறைகுறியாக்கப்பட்ட அரட்டை + அருகிலுள்ள சேனல்கள்';

  @override
  String get onboardingChannelsBody =>
      'அருகிலுள்ள சகாக்களைக் கண்டறிய #mesh / Area (geohash) ஐ மாற்றவும் - செய்திகள் BLE மெஷ் மற்றும் Nostr மீது E2EE இருக்கும்.';

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
  String get chatTitle => 'அரட்டை (E2EE)';

  @override
  String get chatScanTooltip => 'ஒரு பியர் சேர்க்க QR ஐ ஸ்கேன் செய்யவும்';

  @override
  String get chatBlockTooltip => 'இந்த அனுப்புநரைத் தடு';

  @override
  String get chatBlockedSnack =>
      'தடுக்கப்பட்டது: அறிவிப்புகள் இல்லை / ரிலே இல்லை';

  @override
  String get chatAliasTooltip => 'புனைப்பெயரை அமைக்கவும்';

  @override
  String get chatReceiverPemLabel => 'பெறுநர் பொது விசை (PEM)';

  @override
  String get chatReceiverPemHint =>
      'உங்கள் நண்பரின் பொது விசையை ஒட்டவும் (QR / பகிரப்பட்ட கோப்பிலிருந்து)';

  @override
  String get chatNeedPeerKey =>
      'இந்த இணையரின் QR ஐ முதலில் ஸ்கேன் செய்யவும் (சரிபார்க்கப்பட்ட பொது விசை தேவை)';

  @override
  String get chatPeerKeyMismatch =>
      'சேமிக்கப்பட்ட பொது விசை இந்த பியர் ஐடியுடன் பொருந்தவில்லை';

  @override
  String chatVoiceFailed(String error) {
    return 'ஆடியோவை பதிவு செய்ய முடியவில்லை: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'குரல் குறிப்பை இயக்க முடியவில்லை: $error';
  }

  @override
  String get chatPlayVoice => 'குரல் குறிப்பை இயக்கவும்';

  @override
  String get chatPauseVoice => 'இடைநிறுத்தம்';

  @override
  String get chatVoiceLabelSent => '🎤 குரல் குறிப்பு (சீல்)';

  @override
  String get chatVoiceLabel => '🎤 குரல் குறிப்பு';

  @override
  String get chatDecryptFailed => '[டிக்ரிப்ஷன் தோல்வி]';

  @override
  String chatSentSealed(String preview) {
    return '[சீல் செய்யப்பட்டது • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[சீல்]';

  @override
  String get chatComposeHint =>
      'ஒரு செய்தியைத் தட்டச்சு செய்யவும்... (அனுப்பும்போது சீல் வைக்கப்பட்டுள்ளது)';

  @override
  String get chatEmptyThread =>
      'இதுவரை செய்திகள் இல்லை\nமெஷ் மூலம் அனுப்ப கீழே உள்ளிடவும்';

  @override
  String chatLoadFailed(String error) {
    return 'உரையாடலை ஏற்ற முடியவில்லை: $error';
  }

  @override
  String get chatEmojiTooltip => 'ஈமோஜி';

  @override
  String get statusPending => 'நிலுவையில் உள்ளது';

  @override
  String get statusSent => 'அனுப்பப்பட்டது';

  @override
  String get statusRelayed => 'ஒளிபரப்பப்பட்டது';

  @override
  String get statusDelivered => 'வழங்கப்பட்டது';

  @override
  String get statusRead => 'படிக்கவும்';

  @override
  String get statusFailed => 'தோல்வியடைந்தது';

  @override
  String get chatCopy => 'நகலெடுக்கவும்';

  @override
  String get chatDeleteLocal => 'இந்தச் சாதனத்தில் நீக்கு';

  @override
  String get chatDeletedLocalSnack => 'இந்தச் சாதனத்தில் நீக்கப்பட்டது';

  @override
  String get chatRetry => 'மீண்டும் முயற்சிக்கவும்';

  @override
  String get chatSendFailed =>
      'வழங்கப்படவில்லை - மீண்டும் முயற்சி என்பதைத் தட்டவும்';

  @override
  String get chatImageNeedInternet => 'படங்களை அனுப்ப இணையத்துடன் இணைக்கவும்';

  @override
  String get chatImageTooLargeOnline =>
      'அனுப்பும் அளவுக்கு படத்தை சுருக்க முடியவில்லை';

  @override
  String get chatOpenLinkFailed => 'இணைப்பைத் திறக்க முடியவில்லை';

  @override
  String get identityTitle => 'அடையாளம்';

  @override
  String get identityScanTooltip => 'கேமரா மூலம் QR ஐ ஸ்கேன் செய்யவும்';

  @override
  String get identityCopiedHash => 'பொது விசை ஹாஷ் நகலெடுக்கப்பட்டது';

  @override
  String get identityPeerSaved => 'QR இலிருந்து சகாக் காப்பாற்றப்பட்டார்';

  @override
  String get identityGalleryDenied => 'புகைப்பட நூலக அனுமதி மறுக்கப்பட்டது';

  @override
  String get identityQrSaved => 'QR புகைப்பட நூலகத்தில் சேமிக்கப்பட்டது';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR ஐச் சேமிக்க முடியவில்லை: $error';
  }

  @override
  String get peersTitle => 'நெட்வொர்க் உறுப்பினர்கள்';

  @override
  String get qrScanTitle => 'நண்பரைச் சேர்க்க QR ஐ ஸ்கேன் செய்யவும்';

  @override
  String get qrInvalid => 'ஸ்கேன் தோல்வி: தவறான QR';

  @override
  String get qrIdKeyMismatch =>
      'QR நிராகரிக்கப்பட்டது: பொது விசையுடன் ஐடி பொருந்தவில்லை';

  @override
  String get qrCameraNotReady => 'கேமரா தயாராக இல்லை';

  @override
  String get qrRetrySettings =>
      'மீண்டும் முயற்சிக்கவும் / அமைப்புகளைத் திறக்கவும்';

  @override
  String qrCameraOpenFailed(String error) {
    return 'கேமராவைத் திறக்க முடியவில்லை: $error';
  }

  @override
  String get qrScanAlignHint => 'சட்டகத்தின் உள்ளே QR குறியீட்டை சீரமைக்கவும்';

  @override
  String get firmwareDownloadTitle => 'ESP32 நிலைபொருளைப் பதிவிறக்கவும்';

  @override
  String get firmwareSourceOnline => 'சமீபத்திய (ஆன்லைன்)';

  @override
  String get firmwareSourceCached => 'சேமிக்கப்பட்ட நகல் (ஆஃப்லைன்)';

  @override
  String get firmwareSourceBaseline => 'தொகுக்கப்பட்ட அடிப்படை (ஆஃப்லைன்)';

  @override
  String get firmwareSourceUnavailable => 'ஃபார்ம்வேர் இல்லை';

  @override
  String get firmwareBaselineIncompatible =>
      'தொகுக்கப்பட்ட ஃபார்ம்வேர் மிகவும் பழையது - புதிய பதிப்பைப் பதிவிறக்க இணையத்துடன் இணைக்கவும்';

  @override
  String get firmwareChecksumFailed =>
      'நிலைபொருள் ஒருமைப்பாடு சரிபார்ப்பில் தோல்வியடைந்தது - ஒளிரும் தடுக்கப்பட்டது';

  @override
  String firmwareReadyFromSource(String source) {
    return 'நிலைபொருள் தயார்: $source';
  }

  @override
  String get peersRefreshTooltip => 'புதுப்பிக்கவும்';

  @override
  String get peersBlocked => 'தடுக்கப்பட்டது';

  @override
  String get peersNearbyBle => 'அருகில் (BLE)';

  @override
  String get peersRecentlyOnline => 'சமீபத்தில் ஆன்லைனில்';

  @override
  String get peersOnlineInArea => 'பகுதியில் ஆன்லைன்';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes நிமிடத்திற்கு முன்பு பார்த்தேன்';
  }

  @override
  String get peersOffline => 'ஆஃப்லைன்';

  @override
  String peersBlockedSnack(String id) {
    return '$id தடுக்கப்பட்டது';
  }

  @override
  String get peersUnblockedSnack => 'தடைநீக்கப்பட்டது';

  @override
  String get peersEmpty =>
      'தரவுத்தளத்தில் இதுவரை உறுப்பினர்கள் இல்லை\nQR ஐ ஸ்கேன் செய்யவும் அல்லது BLE மெஷ் கண்டுபிடிப்புக்காக காத்திருக்கவும்';

  @override
  String get peersOpenChat => 'அரட்டையைத் திறக்கவும்';

  @override
  String get peersBlockAction => 'தடு';

  @override
  String get peersUnblockAction => 'தடைநீக்கு';

  @override
  String get channelPickerTooltip => 'அரட்டை / #மெஷ் / பகுதி';

  @override
  String get locationPickerTooltip => 'இருப்பிட சேனல்';

  @override
  String get transportPickerTooltip => 'மெஷ் / இணையம் / ஆட்டோ';

  @override
  String get onlinePeopleTooltip => 'மக்கள் ஆன்லைன்';

  @override
  String get unreadDirectsTooltipEmpty => 'தனிப்பட்ட செய்திகள்';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count படிக்காத தனிப்பட்ட செய்திகள்';
  }

  @override
  String get onlinePeopleTitle => 'மக்கள்';

  @override
  String get onlinePeopleEmpty => 'இங்கு இதுவரை யாரும் ஆன்லைனில் இல்லை';

  @override
  String onlinePeopleCount(int count) {
    return '$count ஆன்லைன்';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · அருகில் + பகுதி';

  @override
  String get peerOnlineMeshTitle => 'கண்ணி மீது அருகில் ஒருவர்';

  @override
  String peerOnlineMeshBody(String name) {
    return 'மெஷில் $name அருகில் உள்ளது';
  }

  @override
  String get peerOnlineAreaTitle => 'இப்பகுதியில் யாரோ ஆன்லைனில் உள்ளனர்';

  @override
  String peerOnlineAreaBody(String name) {
    return 'Nostr வழியாக $name ஆன்லைனில் உள்ளது';
  }

  @override
  String get locationSheetTitle => '#இருப்பிட சேனல்கள்';

  @override
  String get channelPinsTitle => 'பின் செய்யப்பட்டது';

  @override
  String get channelPinsHint =>
      'நீங்கள் அடிக்கடி பயன்படுத்தும் சேனல்களைப் பின் செய்யவும் — அவை மேலே இருக்கும்';

  @override
  String get channelPinTooltip => 'இந்த சேனலை பின் செய்யவும்';

  @override
  String get channelUnpinTooltip => 'அன்பின்';

  @override
  String get locationSheetIntro =>
      'கரடுமுரடான ஜியோஹாஷைப் பயன்படுத்தி அருகிலுள்ளவர்களுடன் அரட்டையடிக்கவும் — துல்லியமான ஜிபிஎஸ் அல்ல. இணையத்தில் இருப்பது அநாமதேய Nostr விசைகளைப் பயன்படுத்துகிறது.';

  @override
  String get locationMeshSubtitle => '#புளூடூத் • ~10-50 மீ';

  @override
  String get locationTeleportHint => '#ஜியோஹாஷ்';

  @override
  String get locationTeleport => 'டெலிபோர்ட்';

  @override
  String homeComposeHint(String channel) {
    return 'செய்தி $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel க்கு அனுப்பு — பொது';
  }

  @override
  String get messageExpiryTitle => 'காலாவதியாகிறது';

  @override
  String get voiceRecordTapToStart => 'குரல் செய்தியை பதிவு செய்ய தட்டவும்';

  @override
  String get voiceRecordTooShort =>
      'மிகக் குறைவான பதிவு - மீண்டும் முயற்சிக்கவும்';

  @override
  String get voiceRecordFailed =>
      'பதிவைச் சேமிக்க முடியவில்லை - மீண்டும் முயற்சிக்கவும்';

  @override
  String get voicePttHold => 'பதிவு செய்ய பிடி';

  @override
  String get voicePttRelease => 'முன்னோட்டத்தை வெளியிடவும்';

  @override
  String get voicePttRecording => 'பதிவு செய்கிறது…';

  @override
  String get voicePttDraftReady => 'குரல் குறிப்பு தயார்';

  @override
  String get voicePttDiscard => 'நிராகரி';

  @override
  String get voicePttReRecord => 'மீண்டும் பதிவு செய்யுங்கள்';

  @override
  String get voicePttSend => 'குரல் குறிப்பை அனுப்பவும்';

  @override
  String get voicePttPlayPreview => 'முன்னோட்டத்தை இயக்கவும்';

  @override
  String get voicePttStopPreview => 'முன்னோட்டத்தை நிறுத்து';

  @override
  String get noticesBackfilling => 'அறிவிப்புகளை ஏற்றுகிறது…';

  @override
  String get noticesNostrOnline => 'Nostr ஆன்லைன்';

  @override
  String get noticesNostrOffline => 'Nostr ஆஃப்லைன் — புல்லட்டின் இணையம் தேவை';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count அறிவிப்புகள் ஏற்றப்பட்டன';
  }

  @override
  String get noticePublishFailed =>
      'ஏரியா போர்டில் அறிவிப்பு வெளியிட முடியவில்லை. Nostr இணைப்பைச் சரிபார்க்கவும்.';

  @override
  String get noticeMeshPublishNoLink =>
      'உள்நாட்டில் சேமிக்கப்பட்டது. அருகிலுள்ள மெஷ் ரேடியோவுடன் (அல்லது Wi‑Fi கேட்வே) இணைக்கவும், அதனால் மற்றவர்கள் அதைப் பெற முடியும்.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLEக்கு மேல் $count அருகிலுள்ள சாதனங்களுக்கு (கள்) புல்லட்டின் அனுப்பப்பட்டது.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'அருகிலுள்ள ரேடியோக்கள் காணப்பட்டன, ஆனால் BLE எழுத முடியவில்லை. இரண்டு பயன்பாடுகளையும் அறிவிப்புகள் திரையில் திறந்து வைத்து மீண்டும் முயலவும் (அல்லது ESP32 ரிலேவைப் பயன்படுத்தவும்).';

  @override
  String get noticeMeshPublishNoGatt =>
      'இந்தச் சாதனத்தின் BLE ரிசீவர் தயாராக இல்லை. புளூடூத்தை நிலைமாற்றி, அறிவிப்புகளை மீண்டும் திறக்கவும்.';

  @override
  String get noticeDelete => 'அறிவிப்பை நீக்கு';

  @override
  String get noticeDeleteConfirmTitle => 'இந்த அறிவிப்பை நீக்கவா?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'இது இந்தச் சாதனத்தில் மட்டுமே அகற்றும். ஏற்கனவே அதைப் பெற்ற மற்றவர்கள் இன்னும் அதைப் பார்ப்பார்கள்.';

  @override
  String get noticeDeleted => 'அறிவிப்பு நீக்கப்பட்டது';

  @override
  String get chatNoticeHidden => 'பகுதி அறிவிப்பு - திறந்த அறிவிப்புகள்';

  @override
  String get identityDisplayNameTitle => 'காட்சி பெயர்';

  @override
  String get identitySaveName => 'பெயரை சேமிக்கவும்';

  @override
  String get identityUserIdLabel => 'பயனர் ஐடி (பொது விசை ஹாஷ்)';

  @override
  String get identityCopyHashTooltip => 'பொது விசை ஹாஷை நகலெடுக்கவும்';

  @override
  String get identityMyQrTitle => 'எனது QR (ஐடி + பப்கே + பெயர்)';

  @override
  String identityQrFailed(String error) {
    return 'QR ஐ உருவாக்க முடியவில்லை\n$error';
  }

  @override
  String get identitySaving => 'சேமிக்கிறது…';

  @override
  String get identitySaveQr => 'QR ஐ புகைப்பட நூலகத்தில் சேமிக்கவும்';

  @override
  String get identityOpenScanner => 'QR ஐ ஸ்கேன் செய்ய கேமராவைத் திறக்கவும்';

  @override
  String get identityQrHelp =>
      'உங்கள் பொது விசையைச் சேமிக்க உங்கள் நண்பர் இதை ஸ்கேன் செய்து (தேவைப்பட்டால்) சரிபார்க்கப்பட்ட வழங்குநராக உங்களை அமைக்கவும்';

  @override
  String get identityChatTip =>
      'உதவிக்குறிப்பு: E2EEக்கான பொது விசையைச் சேர்க்க, அரட்டையில் QRஐ ஸ்கேன் செய்யலாம்';

  @override
  String get infoOpen => 'பற்றி / தகவல்';

  @override
  String get docsGuideTitle => 'பயனர் வழிகாட்டி';

  @override
  String get docsGuideSubtitle => 'உலாவியில் திறக்கும்';

  @override
  String get docsOpenAction => 'திறந்த வழிகாட்டி';

  @override
  String get docsOpenFailed => 'பயனர் வழிகாட்டியைத் திறக்க முடியவில்லை';

  @override
  String get firmwareOtaGuideTitle => 'ஃபிளாஷ் வழிகாட்டி & OTA நெறிமுறை';

  @override
  String get firmwareOtaGuideSubtitle =>
      'இணைய வழிகாட்டியைத் திறக்கிறது — .bin பதிவிறக்கங்கள் மற்றும் முழுப் படிகள்';

  @override
  String get firmwareWebDownloadsTitle =>
      'இணையத்தில் நிலைபொருள் பதிவிறக்கங்கள்';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'டாக்ஸ் தளத்தில் ஒவ்வொரு பதிப்பு இணைப்புகள் மற்றும் செக்சம்கள்';

  @override
  String get inviteCopyShortLink => 'சுருக்கமான இணைப்பை நகலெடுக்கவும்';

  @override
  String get inviteShareLink => 'இணைப்பைப் பகிரவும்';

  @override
  String get inviteShowFullLink => 'முழு இணைப்பு';

  @override
  String get inviteCopyFullLink => 'முழு இணைப்பை நகலெடுக்கவும்';

  @override
  String get inviteLinkCopied => 'இணைப்பு நகலெடுக்கப்பட்டது';

  @override
  String get inviteLongPressHint =>
      'இணைப்புச் செயல்களுக்கு நீண்ட நேரம் அழுத்தவும்';

  @override
  String get inviteSendInChat => 'ResilNet அரட்டையில் அனுப்பு…';

  @override
  String get inviteSendInChatHint =>
      'உங்களிடம் ஏற்கனவே பொது விசை உள்ளவர்கள் மட்டுமே';

  @override
  String get inviteSendInChatEmpty =>
      'இதுவரை செய்தி அனுப்பக்கூடிய அரட்டைகள் எதுவும் இல்லை.\nQRஐ ஸ்கேன் செய்யவும், பகுதி/மெஷ்ஷைத் திறக்கவும் அல்லது பயன்பாட்டிற்கு வெளியே இணைப்பைப் பகிரவும்.';

  @override
  String get inviteSentToChat => 'அழைப்பு அரட்டையில் அனுப்பப்பட்டது';

  @override
  String get infoTabInfo => 'தகவல்';

  @override
  String get infoTabSettingsHint =>
      'மொழி, E2EE மற்றும் தரவுக் கருவிகளுக்கான மெனுவிலிருந்து அமைப்புகளைத் திறக்கவும்';

  @override
  String get infoHowToTitle => 'எப்படி பயன்படுத்துவது';

  @override
  String get infoHowToBody =>
      '• அரட்டை / #மெஷ் / ஏரியாவை மாற்ற சேனல் ஐகானைத் தட்டவும்\n• ஜியோஹாஷ் அளவைத் தேர்ந்தெடுக்க, இடத்தைத் தட்டவும்\n• உறுப்பினர்கள் அல்லது ஆன்லைனில் இருப்பவர்களுக்காகத் தட்டவும்\n• தனிப்பட்ட முறையில் சாவிகளை பரிமாறிக்கொள்ள ⋮ இலிருந்து அடையாளம்/QR ஐத் திறக்கவும்\n• பகுதி \"பொது\" ஒவ்வொரு ஆன்லைன் பியர்களுக்கும் சீல் செய்யப்பட்ட E2EE ஐ அனுப்புகிறது - சாதாரண உரை அறை அல்ல';

  @override
  String get infoFeaturesTitle => 'அம்சங்கள்';

  @override
  String get infoFeatureOffline =>
      'புளூடூத் குறைந்த ஆற்றல் மூலம் ஆஃப்லைன் செய்தி அனுப்புதல்';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM உடன் எண்ட்-டு-எண்ட் என்க்ரிப்ஷன் (சத்தம் அல்ல)';

  @override
  String get infoFeatureMultihop =>
      'தொலைவுக்குச் செல்ல அருகிலுள்ள சகாக்கள் மூலம் செய்திகள் வரலாம்';

  @override
  String get infoFeatureBridge =>
      'சீல் செய்யப்பட்ட உறைகளுக்கு ஹைப்ரிட் மெஷ் ↔ இணையம் (Nostr).';

  @override
  String get infoFeatureGeo =>
      'அருகிலுள்ளவர்களுக்கான உள்ளூர் ஜியோஹாஷ் சேனல்கள் (டிஸ்கவரி யுஎக்ஸ்)';

  @override
  String get infoFeatureNotices =>
      '#மெஷ் மற்றும் பகுதிக்கான காலாவதியுடன் கூடிய அறிவிப்புகள்';

  @override
  String get infoPrivacyTitle => 'தனியுரிமை';

  @override
  String get infoPrivacyNoRoom =>
      'கம்பியில் எளிய உரை கிராமம் / பொது அரட்டை அறை இல்லை';

  @override
  String get infoPrivacyFanout =>
      'அறியப்பட்ட பொது விசைகள் மூலம் சகாக்களுக்கு அனுப்பும் பகுதி = சீல் 1:1 ஃபேன்-அவுட்';

  @override
  String get infoPrivacyPresence =>
      'இணையப் பகுதி இருப்பு எபிமரல் Nostr விசைகளைப் பயன்படுத்துகிறது';

  @override
  String get infoSymbolsTitle => 'சின்னங்கள்';

  @override
  String get infoSymBle => 'நேரடி புளூடூத் இணைப்பு';

  @override
  String get infoSymMesh => 'கண்ணி மூலம் அடையலாம் (மற்றவர்கள் முன்னோக்கி)';

  @override
  String get infoSymInternet =>
      'இணையம் வழியாக (Nostr) — சீல் செய்யப்பட்ட உறைகள்';

  @override
  String get infoSymBridge =>
      'மெஷ்↔இன்டர்நெட் பிரிட்ஜ் பாதை வழியாக வந்தடைந்தது';

  @override
  String get infoSymOffline => 'ஆஃப்லைன் — இப்போது அணுக முடியாது';

  @override
  String get infoSymInArea => 'இந்த இருப்பிட சேனலின் பகுதியில்';

  @override
  String get infoSymE2eeOk => 'என்ட்-டு-எண்ட் என்க்ரிப்ட் செய்யப்பட்ட அமர்வு';

  @override
  String get infoSymE2eeFail =>
      'குறியாக்கம் கிடைக்கவில்லை - முக்கியமான உரையை அனுப்ப வேண்டாம்';

  @override
  String get infoSymVerified => 'அடையாளம் சரிபார்க்கப்பட்ட / அறியப்பட்ட விசை';

  @override
  String get infoSymBlocked => 'தடுக்கப்பட்டது';

  @override
  String get infoSymUnread => 'படிக்காத தனிப்பட்ட செய்தி';

  @override
  String get infoEmergencyTitle => 'அவசர முறை';

  @override
  String get infoEmergencyBody =>
      'இந்தச் சாதனத்தில் உள்ள செய்திகள், விசைகள் மற்றும் அடையாளத்தைத் துடைக்க முகப்புத் திரையில் உள்ள ResilNet தலைப்பை மூன்று முறை தட்டவும்.';

  @override
  String get infoLegendNote =>
      'சில பாதை சின்னங்கள் தெளிவுக்காக இங்கே ஆவணப்படுத்தப்பட்டுள்ளன; அரட்டையில் டெலிவரி டிக்குகள் முதன்மை அனுப்பும் நிலையாக இருக்கும்.';

  @override
  String get dangerZoneTitle => 'ஆபத்து மண்டலம்';

  @override
  String get dangerZoneSubtitle =>
      'இந்தச் சாதனத்தில் உள்ள செய்திகள், குறியாக்க விசைகள், Nostr அடையாளம், சகாக்கள் மற்றும் புனைப்பெயர்களை நீக்குகிறது. நீங்கள் மீண்டும் அமைப்பீர்கள்.';

  @override
  String get panicWipeTitle => 'அவசர துடைப்பான்';

  @override
  String get panicWipeSubtitle =>
      'உள்ளூரில் உள்ள அனைத்தையும் அழிக்கவும் — வீட்டுத் தலைப்பை மூன்று முறை தட்டுவது போலவே (இரண்டு தட்டினால் ரேடியோக்களை புதுப்பிக்கிறது)';

  @override
  String get panicWipeConfirmTitle => 'அனைத்து உள்ளூர் தரவையும் அழிக்கவா?';

  @override
  String get panicWipeConfirmBody =>
      'இது இந்த மொபைலில் உள்ள அரட்டைகள், விசைகள் மற்றும் அடையாளத்தை நிரந்தரமாக நீக்குகிறது.\nசகாக்கள் உங்கள் புதிய அடையாளத்துடன் QR விசைகளை மீண்டும் பரிமாறிக்கொள்ள வேண்டும்.\nஇதை செயல்தவிர்க்க முடியாது.';

  @override
  String get panicWipeAction => 'எல்லாவற்றையும் துடைக்கவும்';

  @override
  String get panicWipeSnack =>
      'உள்ளூர் அடையாளம் அழிக்கப்பட்டது - மீண்டும் அமைக்கப்பட்டது';

  @override
  String panicWipeFailed(String error) {
    return 'துடைக்க முடியவில்லை: $error';
  }

  @override
  String get meshBridgeTitle => 'கண்ணி பாலம்';

  @override
  String get meshBridgeSubtitle =>
      '(இயல்புநிலை), சீல் செய்யப்பட்ட உறைகள் BLE மெஷ் மற்றும் இணையம் (Nostr) இரண்டையும் ஒன்றாகப் பயன்படுத்தக்கூடும், இதனால் அருகிலுள்ள மெஷ் தீவுகள் இணைக்க முடியும். ஆஃப் செய்யும்போது, ​​அனுப்பும் ஒரு பாதையை மட்டும் பயன்படுத்தவும் - கம்பியில் ஒருபோதும் எளிய உரையை வைக்காது.';

  @override
  String get favoritesTitle => 'பிடித்தவை';

  @override
  String get favoritesAdd => 'பிடித்தவைகளில் சேர்க்கவும்';

  @override
  String get favoritesRemove => 'பிடித்தவற்றிலிருந்து அகற்று';

  @override
  String get favoritesEmpty =>
      'இதுவரை பிடித்தவை எதுவும் இல்லை — உறுப்பினர் பட்டியலில் இருந்து ஒரு பியர் நட்சத்திரம்';

  @override
  String get favoritesNearbyTitle => 'அருகில் பிடித்தது';

  @override
  String favoritesNearbyBody(String name) {
    return 'மெஷில் $name அருகில் உள்ளது';
  }

  @override
  String get favoritesInAreaTitle => 'பகுதியில் பிடித்தது';

  @override
  String favoritesInAreaBody(String name) {
    return 'இந்தப் பகுதியில் $name ஆன்லைனில் உள்ளது';
  }

  @override
  String get topologyTitle => 'கண்ணி இடவியல்';

  @override
  String get topologySubtitle =>
      'சகாக்கள் மற்றும் மெஷ் இணைப்பு குறிப்புகள் அறிவிக்கின்றன (படிக்க மட்டும்)';

  @override
  String get topologyConnectedNow => 'இப்போது இணைக்கப்பட்டுள்ளது (BLE)';

  @override
  String get topologyNearby => 'அருகில் (BLE)';

  @override
  String get topologyKnown => 'தெரிந்த சகாக்கள்';

  @override
  String get topologyEmpty =>
      'இதுவரை எந்த சகாக்களும் கற்றுக்கொள்ளவில்லை - BLE உடன் அருகில் இருங்கள்';

  @override
  String get topologyYou => 'நீ';

  @override
  String topologyStats(int peers, int links) {
    return '$peers சகாக்கள் · $links இணைப்புகள்';
  }

  @override
  String get topologyGraphHint =>
      'அருகிலுள்ள மெஷ் கண்டுபிடிப்பிலிருந்து மதிப்பிடப்பட்டது — உங்கள் சாதனம் ஹைலைட் செய்யப்பட்டுள்ளது. அரட்டையைத் திறக்க இணையரைத் தட்டவும்.';

  @override
  String get topologyOpen => 'கண்ணி இடவியல்';

  @override
  String get slashHelpTitle => 'கட்டளைகள்';

  @override
  String get slashHelpBody =>
      '/உதவி - இந்த பட்டியல்\n/ யார் — தற்போதைய சேனலில் ஆன்லைனில் உள்ளவர்கள்\n/drop <text> — சீல் செய்யப்பட்ட அறிவிப்பை இங்கே பொருத்தவும் (E2EE ஃபேன்-அவுட்)\n\nமுழு வழிகாட்டி: கீழே உள்ள திறந்த வழிகாட்டியைப் பயன்படுத்தவும் அல்லது அமைப்புகள் → பயனர் வழிகாட்டியைப் பயன்படுத்தவும்.';

  @override
  String get slashWhoEmpty => 'இந்தச் சேனலில் இப்போது யாரும் ஆன்லைனில் இல்லை';

  @override
  String slashWhoTitle(int count) {
    return 'ஆன்லைன் ($count)';
  }

  @override
  String get slashDropNeedText => 'பயன்பாடு: / உங்கள் குறிப்பு உரையை கைவிடவும்';

  @override
  String slashDropDone(String channel) {
    return '$channel அன்று அறிவிப்பு கைவிடப்பட்டது';
  }

  @override
  String get slashUnknown => 'தெரியாத கட்டளை - முயற்சி / உதவி';

  @override
  String get announceOpen => 'அறிவிப்புகள்';

  @override
  String get announceTitle => 'அறிவிப்புகள்';

  @override
  String get announceEmpty =>
      'இன்னும் பலகைகள் இல்லை — பூட்டிய அல்லது திறந்த அறிவிப்புகளை இடுகையிட ஒன்றை உருவாக்கவும்';

  @override
  String get announceCreate => 'பலகையை உருவாக்கவும்';

  @override
  String get announceCreateHint => 'பலகையின் பெயர்';

  @override
  String get announceDefaultTitle => 'சமூக வாரியம்';

  @override
  String get announceSettings => 'பலகை அமைப்புகள்';

  @override
  String get announceAllowLocked =>
      'பூட்டப்பட்ட (மறைகுறியாக்கப்பட்ட) இடுகைகளை அனுமதிக்கவும்';

  @override
  String get announceAllowLockedSub =>
      'போர்டு விசையில் குறியாக்கம் செய்யப்பட்டது - வாசகர்களுக்கு அணுகல் தேவை';

  @override
  String get announceAllowOpen =>
      'திறந்த (எளிமையான உரை) இடுகைகளை அனுமதிக்கவும்';

  @override
  String get announceAllowOpenSub =>
      'E2EE அல்ல - மெஷ்/ரிலேயில் படிக்கக்கூடியது. இயல்பாக ஆஃப்.';

  @override
  String get announceComposeHint => 'அறிவிப்பை எழுதுங்கள்...';

  @override
  String get announceMediaInternetOnly =>
      'புகைப்படம்/குரல் அறிவிப்புகள் இணையத்தில் அனுப்பப்படும் (BLE அல்ல)';

  @override
  String get announceNeedInternet =>
      'புகைப்படம் அல்லது குரல் அறிவிப்புகளை அனுப்ப இணையத்துடன் இணைக்கவும்';

  @override
  String announceVoiceFailed(String error) {
    return 'குரலைப் பதிவு செய்ய முடியவில்லை: $error';
  }

  @override
  String get announceImageTooLarge => 'படம் மிகப் பெரியது (அதிகபட்சம் ~180 KB)';

  @override
  String get announcePlayVoice => 'குரல் குறிப்பை இயக்கவும்';

  @override
  String get announceImageLabel => '📷 படம்';

  @override
  String get announceAudioLabel => '🎤 குரல் குறிப்பு';

  @override
  String get announceModeLocked => 'பூட்டப்பட்டது';

  @override
  String get announceModeOpen => 'திற';

  @override
  String get announceOpenBadge => 'OPEN · குறியாக்கம் செய்யப்படவில்லை';

  @override
  String get announceLockedBadge => 'பூட்டப்பட்டது';

  @override
  String get announceLockedPlaceholder =>
      'குறியாக்கம் - படிக்க அணுகலைக் கோருங்கள்';

  @override
  String get announceRequestAccess => 'அணுகலைக் கோருங்கள்';

  @override
  String get announceRequestSent =>
      'போர்டு உரிமையாளருக்கு அணுகல் கோரிக்கை அனுப்பப்பட்டது';

  @override
  String get announceRequestFailed =>
      'அணுகலைக் கோர முடியவில்லை (உரிமையாளரின் பொது விசை தேவை)';

  @override
  String get announceOpenConfirmTitle => 'குறியாக்கம் இல்லாமல் இடுகையிடவா?';

  @override
  String get announceOpenConfirmBody =>
      'திறந்த இடுகைகள் E2EE அல்ல. பாதையில் உள்ள எவரும் (மெஷ் / ரிலேக்கள்) அவற்றைப் படிக்கலாம். தொடரவா?';

  @override
  String get announcePostAction => 'இடுகை';

  @override
  String get announcePendingRequests => 'அணுகல் கோரிக்கைகள்';

  @override
  String get announceApprove => 'ஒப்புதல்';

  @override
  String get announceDeny => 'மறுக்கவும்';

  @override
  String get announceGranted => 'பூட்டிய இடுகைகளை இந்த போர்டில் படிக்கலாம்';

  @override
  String get announceOwner => 'இந்த பலகை உங்களுக்கு சொந்தமானது';

  @override
  String get announceCopyInvite => 'அழைப்பு உரையை நகலெடுக்கவும்';

  @override
  String get announceShowInviteQr => 'அழைப்பு QRஐக் காட்டு';

  @override
  String get announceScanInviteQr => 'ஸ்கேன் போர்டு அழைப்பு QR';

  @override
  String get announceFollow => 'அழைப்பிலிருந்து பலகையைப் பின்தொடரவும்';

  @override
  String get announceFollowHint =>
      'உரிமையாளரிடமிருந்து அழைப்பு உரை அல்லது ResilNet இணைப்பை ஒட்டவும்';

  @override
  String get announceFollowOk => 'தொடர்ந்து பலகை';

  @override
  String announceFollowOkNamed(String title) {
    return 'இப்போது பின்தொடர்வது “$title”';
  }

  @override
  String get announceFollowFail => 'அழைப்பு தவறானது அல்லது சேதமடைந்தது';

  @override
  String get announceInviteCopied => 'அழைப்பு உரை நகலெடுக்கப்பட்டது';

  @override
  String get announceInviteSaveQr => 'QR ஐ சேமிக்கவும்';

  @override
  String get announceInviteShare => 'அழைப்பைப் பகிரவும்';

  @override
  String get announceFollowFromCompose =>
      'செய்தி பெட்டியில் போர்டு அழைப்பு கண்டறியப்பட்டது';

  @override
  String get peerConfirmAddTitle => 'நெட்வொர்க் உறுப்பினரைச் சேர்க்கவா?';

  @override
  String peerConfirmAddBody(String name) {
    return 'அவர்களின் பொது விசையுடன் “$name” ஐச் சேர்க்கவும், அதனால் அவர்களுக்கு தனிப்பட்ட முறையில் செய்தி அனுப்பவா?';
  }

  @override
  String get peerConfirmAdd => 'உறுப்பினரைச் சேர்க்கவும்';

  @override
  String peerAddedOk(String name) {
    return 'நெட்வொர்க் உறுப்பினர்களுக்கு $name சேர்க்கப்பட்டது';
  }

  @override
  String get peerAddFromCompose =>
      'செய்தி பெட்டியில் அடையாளம் / பொது விசை கண்டறியப்பட்டது';

  @override
  String get peerHashCopied => 'பொது விசை ஹாஷ் நகலெடுக்கப்பட்டது';

  @override
  String get peerHashOpenChat => 'அரட்டையைத் திறக்கவும்';

  @override
  String get peerHashAddHint =>
      'ஹாஷ் நகலெடுத்தார். அவர்களின் அடையாள இணைப்பு அல்லது QR ஐப் பகிரும்படி அவர்களிடம் கேளுங்கள், இதன் மூலம் E2EEக்கான முழு பொது விசையையும் நீங்கள் சேர்க்கலாம்.';

  @override
  String get peerQrNoCode => 'இந்தப் படத்தில் ResilNet QR இல்லை';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet அடையாளம்: “$name”\nஇணைப்பைத் திறக்கவும் அல்லது அரட்டையில் ஒட்டவும் → உறுப்பினரைச் சேர்\nஅல்லது அடையாள QR ஐ ஸ்கேன் செய்யவும்.';
  }

  @override
  String get identityShareInvite => 'அடையாள இணைப்பைப் பகிரவும்';

  @override
  String get identityInviteCopied => 'அடையாள இணைப்பு நகலெடுக்கப்பட்டது';

  @override
  String announceInviteSharePreamble(String title) {
    return 'குழு அழைப்பு: “$title”\nResilNet → சமூகப் பலகைகளைத் திறக்கவும் → அழைப்பிலிருந்து பின்தொடரவும்\nஅல்லது QR ஐ ஸ்கேன் செய்யவும் / கீழே உள்ள இணைப்பைத் தட்டவும்.';
  }

  @override
  String get announceConfirmFollowTitle => 'இந்த பலகையைப் பின்பற்றவா?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'இந்த அழைப்பிலிருந்து \"$title\" ஐப் பின்தொடரவா?';
  }

  @override
  String get announceConfirmFollow => 'பின்பற்றவும்';
}

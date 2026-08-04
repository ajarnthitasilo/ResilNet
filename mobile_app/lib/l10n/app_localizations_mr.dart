// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'रीफ्रेश करत आहे ResilNet…';

  @override
  String get appRefreshed => 'रीफ्रेश केले — रेडिओ आणि शोध रीस्टार्ट';

  @override
  String appRefreshFailed(String error) {
    return 'रिफ्रेश अयशस्वी: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'डबल-टॅप = मऊ रिफ्रेश. दीर्घ दाबा = हार्ड पुनर्प्राप्त. ट्रिपल-टॅप = आपत्कालीन पुसणे.';

  @override
  String get softRefreshTipTitle => 'जर ResilNet अडकल्यासारखे वाटत असेल';

  @override
  String get softRefreshTipBody =>
      'सॉफ्ट रेडिओ रिफ्रेशसाठी ResilNet (वर-डावीकडे) दोनदा टॅप करा. तरीही अडकल्यास: शीर्षक जास्त वेळ दाबा, ⋮ → हार्ड रिकव्हर किंवा सेटिंग्ज वापरा. ट्रिपल-टॅप केवळ आणीबाणी पुसण्यासाठी आहे.';

  @override
  String get softRefreshTipGotIt => 'समजले';

  @override
  String get infoSoftRefreshTitle => 'ॲप अडकल्यासारखे वाटत असल्यास';

  @override
  String get infoSoftRefreshStepRefresh =>
      'दोनदा टॅप करा ResilNet (वर-डावीकडे) → सॉफ्ट रिफ्रेश रेडिओ आणि जवळपासचे लोक';

  @override
  String get infoSoftRefreshStepHard =>
      'अजूनही अडकले? शीर्षक दीर्घकाळ दाबा, किंवा ⋮ / सेटिंग्ज → हार्ड रिकव्हर';

  @override
  String get infoSoftRefreshStepWait =>
      'परिणाम स्नॅकबारची प्रतीक्षा करा, नंतर पुन्हा प्रयत्न करा. सत्र रीसेट आपल्या कळा ठेवते.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ट्रिपल-टॅप = आपत्कालीन पुसणे (स्थानिक डेटा हटवते) — केवळ हेतुपुरस्सर असल्यास';

  @override
  String get appRecoverySection => 'ॲप पुनर्प्राप्ती';

  @override
  String get appRecoverySectionSubtitle =>
      'ॲप गोठलेले वाटत असताना वापरा. सॉफ्ट = शीर्षक डबल-टॅप करा. हार्ड पुनर्प्राप्ती मजबूत आहे. की पुसल्याशिवाय सेशन रीसेट सेवा रीस्टार्ट करते.';

  @override
  String get appHardRecoverAction => 'हार्ड पुनर्प्राप्त';

  @override
  String get appHardRecovering => 'कठीण पुनर्प्राप्ती…';

  @override
  String get appSessionResetAction => 'सत्र रीसेट करा';

  @override
  String get appSessionResetRunning => 'सत्र रीसेट करत आहे...';

  @override
  String get appSessionResetConfirmTitle => 'सत्र रीसेट करायचे?';

  @override
  String get appSessionResetConfirmBody =>
      'या डिव्हाइसवर ResilNet सेवा रीस्टार्ट करते. तुमच्या ओळखीच्या कळा ठेवल्या आहेत.';

  @override
  String get appRecoveryBusy => 'पुनर्प्राप्ती आधीच चालू आहे...';

  @override
  String get appRecoveryOk => 'पुनर्प्राप्ती पूर्ण झाली';

  @override
  String get appRecoveryPartial =>
      'काही पायऱ्या वगळून पुनर्प्राप्ती पूर्ण झाली — तरीही अडकल्यास पुन्हा प्रयत्न करा';

  @override
  String get appRecoveryFailed =>
      'पुनर्प्राप्ती अयशस्वी - सत्र रीसेट करण्याचा प्रयत्न करा किंवा OS वरून ॲप सक्ती-बाहेर पडा';

  @override
  String get localWifiTitle => 'स्थानिक Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'इंटरनेटशिवाय जवळपासच्या डिव्हाइसेसशी लिंक करा — एका LAN वर असण्यासारखेच.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa गेटवे SoftAP नाही. हा फक्त फोन↔फोन / लॅन आहे.';

  @override
  String get localWifiUnavailable =>
      'स्थानिक Wi‑Fi अद्याप तयार नाही — ॲप स्टार्टअपची प्रतीक्षा करा.';

  @override
  String get lxmfBridgeTitle => 'होम नोड';

  @override
  String get lxmfBridgeSubtitle =>
      'तुमच्या Wi‑Fi वर पर्यायी Mac किंवा Pi जे सीलबंद चॅट्स रिले करते. डीफॉल्टनुसार बंद. एंड-टू-एंड एन्क्रिप्शन बदलत नाही.';

  @override
  String get lxmfBridgeEnable => 'होम नोड वापरा';

  @override
  String get lxmfBridgeDisabledHint =>
      'या नेटवर्कवरील Mac किंवा Pi वर ब्रिज ॲप चालू असतानाच चालू करा.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ऑनलाइन — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'होम नोडपर्यंत पोहोचू शकत नाही — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'होम नोड पत्ता';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP किंवा http://IP:port — उदाहरणार्थ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'पीअर → LXMF गंतव्य (JSON)';

  @override
  String get lxmfBridgeRefresh => 'स्थिती जतन करा आणि रीफ्रेश करा';

  @override
  String get lxmfBridgeLabHint => 'प्रगत: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'होम नोड सेटिंग्ज';

  @override
  String get lxmfBridgeCheckConnection => 'कनेक्शन तपासा';

  @override
  String get lxmfBridgeStatusOnline => 'होम नोडशी कनेक्ट केलेले';

  @override
  String get lxmfBridgeStatusOffline => 'होम नोड पोहोचू शकत नाही';

  @override
  String get lxmfBridgeYourDest => 'या नोडचा पत्ता (मित्रांसह सामायिक करा)';

  @override
  String get lxmfBridgeCopyDest => 'पत्ता कॉपी करा';

  @override
  String get lxmfBridgeDestCopied => 'पत्ता कॉपी केला';

  @override
  String get lxmfBridgeLinkedPeers => 'जोडलेले मित्र';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'प्रत्येक मित्राला त्यांच्या घराचा-नोड पत्ता एकदा हवा असतो. मग सीलबंद गप्पा हा मार्ग वापरू शकतात.';

  @override
  String get lxmfBridgeNoLinks => 'अद्याप कोणतेही मित्र जोडलेले नाहीत.';

  @override
  String get lxmfBridgeAddLink => 'मित्राला लिंक करा';

  @override
  String get lxmfBridgePickPeer => 'मित्र';

  @override
  String get lxmfBridgePeerDest => 'त्यांच्या घराचा-नोड पत्ता';

  @override
  String get lxmfBridgePeerDestHint =>
      'त्यांच्या होम नोड स्क्रीनवरून 32-वर्णांचा कोड';

  @override
  String get lxmfBridgeInvalidDest =>
      'तो पत्ता वैध दिसत नाही. त्यांच्या होम नोडमधून पूर्ण कोड पेस्ट करा.';

  @override
  String get lxmfBridgeRemoveLink => 'अनलिंक करा';

  @override
  String get lxmfBridgeSaveLink => 'जतन करा';

  @override
  String get lxmfBridgeLinkSaved => 'मित्र जोडले';

  @override
  String get lxmfBridgeNoPeers =>
      'अद्याप कोणतेही संदेश करण्यायोग्य संपर्क नाहीत — प्रथम मित्र जोडा.';

  @override
  String get lxmfBridgeHelp =>
      'Mac/Pi वर ब्रिज चालू ठेवा. हा मार्ग तुमच्या LAN वर राहतो — तो LoRa नाही आणि इंटरनेट किंवा ब्लूटूथ जाळी बदलत नाही.';

  @override
  String get localWifiModeHotspot => 'जवळपास';

  @override
  String get localWifiModeRouter => 'राउटर';

  @override
  String get localWifiHotspotIntro =>
      'एक डिव्हाइस वैयक्तिक हॉटस्पॉट सामायिक करते. इतर त्या हॉटस्पॉटमध्ये सामील होतात, नंतर ResilNet त्यांना स्थानिक नेटवर्कवर शोधतात.';

  @override
  String get localWifiHostAction => 'नेटवर्क तयार करा (होस्ट)';

  @override
  String get localWifiJoinAction => 'नेटवर्कमध्ये सामील व्हा';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android सेटिंग्ज उघडा आणि वैयक्तिक हॉटस्पॉट (किंवा इंटरनेट शेअरिंग) चालू करा.\n2. मित्रांना हॉटस्पॉटचे नाव (आणि पासवर्ड) सांगा.\n3. येथे परत या आणि \"हॉटस्पॉट चालू आहे — प्रतीक्षा सुरू करा\" वर टॅप करा.';

  @override
  String get localWifiHostReady => 'हॉटस्पॉट सुरू आहे — प्रतीक्षा सुरू करा';

  @override
  String get localWifiHostWaiting =>
      'मित्र सामील होण्याची प्रतीक्षा करत आहे...';

  @override
  String get localWifiJoinSteps =>
      '1. सिस्टम सेटिंग्ज उघडा आणि तुमच्या मित्राच्या वैयक्तिक हॉटस्पॉटमध्ये सामील व्हा.\n2. येथे परत या आणि \"मी कनेक्ट आहे — शोधा\" वर टॅप करा.';

  @override
  String get localWifiJoinReady => 'मी कनेक्ट आहे — शोधा';

  @override
  String get localWifiRouterIntro =>
      'प्रत्येक डिव्हाइसला समान Wi‑Fi राउटर/AP शी कनेक्ट करा. राउटरला इंटरनेटची आवश्यकता नाही — फक्त सामायिक स्थानिक नेटवर्क.';

  @override
  String get localWifiRouterSearch => 'यावर शोधा Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi माहिती रिफ्रेश करा';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi वर नाही';

  @override
  String get localWifiRouterNoWifiBody =>
      'सिस्टम सेटिंग्जमध्ये राउटरच्या Wi‑Fi मध्ये सामील व्हा, नंतर पुन्हा शोधा.';

  @override
  String get localWifiDiscovering => 'स्थानिक Wi‑Fi वर शोधत आहे…';

  @override
  String get localWifiPeersFound => 'या नेटवर्कवरील उपकरणे';

  @override
  String get localWifiStop => 'थांबा';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi नाव अनुपलब्ध';

  @override
  String get localWifiStubBanner => 'LAN सॉकेटची वाट पाहत आहे...';

  @override
  String get localWifiLiveBanner =>
      'LAN डिस्कवरी लाईव्ह (UDP) — या Wi‑Fi वर + सीलबंद चॅटची घोषणा करा';

  @override
  String get localWifiEmptyHotspot =>
      'अद्याप कोणतेही उपकरण नाहीत.\nमित्र तुमच्या हॉटस्पॉटमध्ये सामील झाले आहेत आणि स्थानिक नेटवर्क ॲक्सेसला परवानगी दिली आहे का ते तपासा.';

  @override
  String get localWifiEmptyRouter =>
      'अद्याप कोणतेही उपकरण नाहीत.\nसमान SSID? स्थानिक नेटवर्कला परवानगी आहे? काही राउटर डिव्हाइस-टू डिव्हाइस रहदारी (AP अलगाव) अवरोधित करतात.';

  @override
  String get localWifiIsolationHelp => 'आपण एकमेकांना का शोधू शकत नाही?';

  @override
  String get localWifiIsolationTitle => 'राउटर ग्राहकांना वेगळे करू शकते';

  @override
  String get localWifiIsolationBody =>
      'AP/क्लायंट आयसोलेशन (किंवा अतिथी नेटवर्क) चालू असल्यास, त्याच Wi‑Fi वरील फोन बोलू शकत नाहीत. अलगाव बंद करा, मुख्य SSID वापरा किंवा जवळच्या (हॉटस्पॉट) मोडवर स्विच करा.';

  @override
  String get localWifiPeerReady => 'चॅट करण्यासाठी तयार (की आहे)';

  @override
  String get localWifiPeerNeedKey =>
      'सापडले — की एक्सचेंज करण्यासाठी QR स्कॅन करा';

  @override
  String get localWifiErrorTitle => 'स्थानिक Wi‑Fi त्रुटी';

  @override
  String get localWifiErrorBody =>
      'काहीतरी चूक झाली. थांबा आणि पुन्हा प्रयत्न करा.';

  @override
  String get preparingSystem => 'यंत्रणा तयार करत आहे...';

  @override
  String get bootFailedTitle => 'सुरू करू शकलो नाही';

  @override
  String get retry => 'पुन्हा प्रयत्न करा';

  @override
  String get bootRecoveryAction => 'नवीन ओळख सुरू करा (स्थानिक डेटा मिटवा)';

  @override
  String get bootRecoveryConfirmTitle => 'नवीन ओळख सुरू करायची?';

  @override
  String get bootRecoveryConfirmBody =>
      'हे या डिव्हाइसवरील स्थानिक चॅट, की आणि ओळख कायमचे मिटवेल.\nसमवयस्कांनी तुमच्या नवीन ओळखीसह तुमचा QR पुन्हा स्कॅन करणे आवश्यक आहे.\nहे पूर्ववत केले जाऊ शकत नाही.';

  @override
  String get bootRecoveryRunning => 'स्थानिक ओळख रीसेट करत आहे...';

  @override
  String get bootRecoverySuccess => 'स्थानिक ओळख रीसेट पूर्ण झाले';

  @override
  String bootRecoveryFailed(String error) {
    return 'ओळख रीसेट करू शकलो नाही: $error';
  }

  @override
  String get cancel => 'रद्द करा';

  @override
  String get save => 'जतन करा';

  @override
  String get close => 'बंद करा';

  @override
  String get start => 'सुरू करा';

  @override
  String get send => 'पाठवा';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle =>
      'डीफॉल्टनुसार ॲप तुमच्या फोनची भाषा फॉलो करते (जेव्हा समर्थित असेल). इतर भाषा इंग्रजीत परत येतात. तुम्ही येथे भाषा लॉक देखील करू शकता.';

  @override
  String get languageSystem => 'सिस्टम डीफॉल्ट';

  @override
  String get languageThai => 'थाई';

  @override
  String get languageEnglish => 'इंग्रजी';

  @override
  String get notificationsTooltip => 'सूचना सेटिंग्ज';

  @override
  String get enableMessageNotifications => 'संदेश सूचना सक्षम करा';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 संदेश आणि लोक ऑनलाइन (स्थानिक सूचना)';

  @override
  String get networkMembersTooltip => 'नेटवर्क सदस्य';

  @override
  String get identityQrTooltip => 'ओळख / QR';

  @override
  String get feedDirects => 'गप्पा';

  @override
  String get feedMesh => '#जाळी';

  @override
  String get feedGeo => 'क्षेत्रफळ';

  @override
  String get feedDirectsSubtitle => 'खाजगी E2EE संदेश';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'जवळपासचे समवयस्क (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'जिओहॅश शोध चॅनेल';

  @override
  String get peerIdHint =>
      'चॅट सुरू करण्यासाठी रिसीव्हर आयडी (पब्लिक की हॅश) पेस्ट करा';

  @override
  String get directsEmpty =>
      'अद्याप कोणतेही चॅट नाहीत — प्रारंभ करण्यासाठी QR स्कॅन करा किंवा प्राप्तकर्ता आयडी पेस्ट करा\nसंदेश पाठवण्यापूर्वी E2EE सह सीलबंद केले जातात (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • चॅट उघडण्यासाठी टॅप करा';

  @override
  String get meshIntro =>
      'BLE श्रेणीतील समवयस्क — खाजगी E2EE चॅटसाठी टॅप करा (#mesh वर सार्वजनिक रचना नाही)\nहायब्रिड राउटरद्वारे पाठवते (BLE + LoRa + Nostr ऑनलाइन असताना)';

  @override
  String get meshEmptyRunning =>
      'अद्याप जवळपासचे कोणतेही साथीदार नाहीत — BLE श्रेणीतील दुसऱ्या डिव्हाइसवर ॲप उघडा';

  @override
  String get meshEmptyStopped => 'BLE चालत नाही — ब्लूटूथ / स्थान परवानगी द्या';

  @override
  String get meshNearbyPrefix => 'जवळपास';

  @override
  String get meshRetentionTitle => 'संदेश स्वयंचलितपणे हटवा';

  @override
  String get meshRetentionSubtitle =>
      'जुना स्थानिक चॅट इतिहास आपोआप काढून टाकला जातो';

  @override
  String get meshRetentionKeep => 'ठेवा';

  @override
  String get meshRetention1Day => '1 दिवस';

  @override
  String get meshRetention3Days => '3 दिवस';

  @override
  String get meshRetention7Days => '7 दिवस';

  @override
  String get refreshLocationTooltip => 'स्थान रिफ्रेश करा';

  @override
  String get geoIntro =>
      'या जिओहॅशमधील ऑनलाइन लोकांना 1:1 किंवा एरिया पब्लिक फॅन-आउटसह मेसेज केला जाऊ शकतो (अजूनही प्रति पीअर E2EE सीलबंद आहे — साधा मजकूर नाही)';

  @override
  String geoEmpty(String channel) {
    return 'अद्याप $channel मध्ये कोणीही ऑनलाइन नाही\nवाहतूक → इंटरनेट/ऑटो वापरा, Nostr साठी प्रतीक्षा करा, स्थान रिफ्रेश करा';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel मध्ये ऑनलाइन • 1:1 E2EE साठी टॅप करा';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'जवळपास (क्षेत्र उपस्थितीची प्रतीक्षा करत आहे) • 1:1 E2EE साठी टॅप करा';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel मध्ये Nostr वर पाहिले • फक्त शोध (वारसा)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'वारसा अनामिक उपस्थिती — बंधनकारक समवयस्काची प्रतीक्षा करा किंवा QR एक्सचेंज करा';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE जवळपास — 1:1 E2EE सुरू करण्यासाठी QR स्कॅन करा';

  @override
  String get geoInternetDiscoverHint =>
      'क्षेत्र इंटरनेट शोध आवश्यक आहे Nostr कनेक्ट केलेले (सेटिंग्ज → वाहतूक → इंटरनेट/ऑटो)';

  @override
  String get geoEmptyNoLocation =>
      'स्थानाचे अद्याप निराकरण झाले नाही — GPS ला अनुमती द्या आणि तुमचा जिओहॅश Nostr वर प्रकाशित करण्यासाठी रिफ्रेश करा';

  @override
  String get geoEmptyNeedsPermission =>
      'स्थान परवानगी नाकारली — सेटिंग्ज → गोपनीयता → स्थान मध्ये ResilNet ला अनुमती द्या';

  @override
  String get geoEmptyServicesDisabled =>
      'स्थान सेवा बंद आहेत — त्या सेटिंग्जमध्ये चालू करा';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS निराकरण मिळू शकले नाही (Wi‑Fi iPads वर सामान्य) — खाली जिओहॅश मॅन्युअली सेट करा';

  @override
  String get geoEmptyTeleportHint =>
      'ठिकाण चिन्हावर टॅप करा → जिओहॅश प्रविष्ट करा (उदा. w5) → टेलिपोर्ट';

  @override
  String get geoSetGeohashManually => 'जिओहॅश सेट करा';

  @override
  String get geoTeleportHint =>
      'GPS नाही? जिओहॅश उपसर्ग (2-7 वर्ण, उदा. w5) एंटर करा आणि Teleport वर टॅप करा';

  @override
  String get geoTeleportInvalid =>
      'अवैध जिओहॅश — फक्त बेस32 अक्षरे/संख्या वापरा (उदा. w5 किंवा w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'क्षेत्र $channel वर सेट केले';
  }

  @override
  String geoManualActive(String channel) {
    return 'मॅन्युअल क्षेत्र: $channel (GPS रिफ्रेश ओव्हरराइड होईल)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr तयार नाही — पुन्हा कनेक्ट करा वर टॅप करा (0/0 जोपर्यंत init यशस्वी होत नाही)';

  @override
  String get geoEmptyMeshOnly =>
      'वाहतूक फक्त मेश आहे — Nostr पेक्षा जास्त समवयस्क शोधण्यासाठी इंटरनेट किंवा ऑटोवर स्विच करा';

  @override
  String geoEmptyWaiting(String channel) {
    return 'अद्याप $channel मध्ये कोणीही नाही — दोन्ही उपकरणांवर क्षेत्र + इंटरनेट उघडे ठेवा आणि ~60s प्रतीक्षा करा';
  }

  @override
  String get geoChannelFallback => '#क्षेत्र';

  @override
  String get geoRefreshLocation => 'स्थान रिफ्रेश करा';

  @override
  String get settingsClearLocationTitle => 'स्थान साफ ​​करा';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / टेलिपोर्ट जिओहॅश काढा (क्षेत्र #— होईल)';

  @override
  String get settingsClearLocationConfirmTitle => 'स्थान साफ ​​करायचे?';

  @override
  String get settingsClearLocationConfirmBody =>
      'या डिव्हाइसवरील संग्रहित जिओहॅश हटवते. तुम्ही नंतर पुन्हा GPS किंवा टेलीपोर्ट रिफ्रेश करू शकता.';

  @override
  String get settingsClearLocationAction => 'स्थान साफ ​​करा';

  @override
  String get settingsClearLocationSnack => 'स्थान साफ ​​केले';

  @override
  String get chatVoiceTooLarge => 'व्हॉइस नोट खूप मोठी आहे — कमाल ~30 सेकंद';

  @override
  String get chatVoiceNeedInternet =>
      'व्हॉइस नोटला इंटरनेटची आवश्यकता आहे (Nostr) — एकट्या BLE साठी खूप मोठी';

  @override
  String get chatVoiceSentInternet => 'इंटरनेटद्वारे व्हॉइस नोट पाठवली';

  @override
  String get noticeAnonMention => 'उल्लेख';

  @override
  String get noticeAnonDm => 'थेट संदेश';

  @override
  String get noticeAnonHug => 'मिठी';

  @override
  String get noticeAnonSlap => 'थप्पड';

  @override
  String get noticeAnonBlock => 'ब्लॉक';

  @override
  String get noticeAnonNeedKey =>
      'अद्याप कोणतीही सार्वजनिक की नाही — 1:1 साठी प्रथम QR बदला';

  @override
  String get noticeAnonActionSent => 'पाठवले';

  @override
  String noticeAnonBlocked(String anon) {
    return 'अवरोधित $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* मिठी $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* थप्पड $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr पुन्हा कनेक्ट करा';

  @override
  String get nostrSectionTitle => 'Nostr रिले';

  @override
  String get nostrSectionSubtitle =>
      'इंटरनेट मेसेजिंग आणि एरिया डिस्कव्हरी हे रिले वापरतात. स्थिती ऑफलाइन राहिल्यास पुन्हा कनेक्ट करा वर टॅप करा.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'कनेक्ट केले $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'ऑफलाइन — रिले सूचीबद्ध आहेत परंतु कनेक्ट केलेले नाहीत';

  @override
  String get nostrStatusNotInit =>
      'सुरू झाले नाही (0/0) — सुरू करण्यासाठी पुन्हा कनेक्ट करा टॅप करा';

  @override
  String get nostrReconnectAction => 'Nostr पुन्हा कनेक्ट करा';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr कनेक्ट केलेले ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'तरीही ऑफलाइन — Wi‑Fi/सेल्युलर तपासा किंवा पुन्हा प्रयत्न करा';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'अयशस्वी: $error';
  }

  @override
  String get nostrReconnecting => 'रिलेशी कनेक्ट करत आहे...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel मध्ये इंटरनेट (Nostr) • सीलबंद चॅट तयार';
  }

  @override
  String get transportModeTitle => 'क्षेत्र वाहतूक';

  @override
  String get transportModeSubtitle =>
      'मेश = BLE जवळपास (रेडिओ) नसताना Nostr · इंटरनेट आणि ऑटो = Nostr लोकांची यादी';

  @override
  String get transportModeMesh => 'जाळी';

  @override
  String get transportModeInternet => 'इंटरनेट';

  @override
  String get transportModeAuto => 'ऑटो';

  @override
  String get geoPublicHint =>
      'या क्षेत्रातील प्रत्येकाला ऑनलाइन सार्वजनिक संदेश';

  @override
  String get geoPublicSend => 'सार्वजनिक';

  @override
  String geoPublicHelp(int count) {
    return '$count ऑनलाइन समवयस्कांना सीलबंद फॅन-आउट — प्रत्येकाला एक खाजगी लिफाफा मिळतो';
  }

  @override
  String geoPublicSent(int count) {
    return 'या क्षेत्रातील $count समवयस्कांना पाठवले';
  }

  @override
  String get geoPublicSentNone =>
      'ऑनलाइन मेसेज करण्यायोग्य समवयस्क नाहीत — की असलेल्या समवयस्कांसह क्षेत्र/जाळी उघडा किंवा BLE/Nostr ची प्रतीक्षा करा';

  @override
  String get areaPublicBadge => 'क्षेत्र सार्वजनिक';

  @override
  String get geoErrorPermission => 'स्थान वाचता आले नाही — स्थान परवानगी तपासा';

  @override
  String get geoPrecisionRegion => 'प्रदेश';

  @override
  String get geoPrecisionProvince => 'प्रांत';

  @override
  String get geoPrecisionCity => 'शहर';

  @override
  String get geoPrecisionNeighborhood => 'शेजारी';

  @override
  String get geoPrecisionBlock => 'ब्लॉक करा';

  @override
  String get aliasTitle => 'टोपणनाव सेट करा (संपर्क उपनाव)';

  @override
  String get aliasHintBody =>
      'हे उपनाव फक्त या डिव्हाइसवर संग्रहित केले आहे (केवळ-स्थानिक)\nहे कधीही E2EE रहदारीसह पाठवले जात नाही';

  @override
  String get aliasLabel => 'टोपणनाव';

  @override
  String get aliasHint => 'उदा. “गावप्रमुख”, “प’सोमचाय”…';

  @override
  String get settingsDevices => 'उपकरणे';

  @override
  String get settingsFirmwareTitle => 'ESP32 फर्मवेअर डाउनलोड / अपडेट करा';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin फाइल्स डाउनलोड करा आणि OTA द्वारे ESP32 बोर्ड अपडेट करा';

  @override
  String get mtBridgeTitle => 'Meshtastic पूल';

  @override
  String get mtBridgeSettingsSubtitle =>
      'केवळ मजकूर A/B ब्रिज — ResilNet E2EE नाही';

  @override
  String get mtBridgeIntro =>
      'लहान साधा मजकूर Meshtastic आणि ResilNet दरम्यान हलवा. मोड A आणि B एकाच वेळी चालू शकत नाहीत. हे एंड-टू-एंड एन्क्रिप्शन नाही.';

  @override
  String get mtBridgeModeLabel => 'मोड';

  @override
  String get mtBridgeModeOff => 'बंद';

  @override
  String get mtBridgeModeA => 'ए इंजेस्ट करा';

  @override
  String get mtBridgeModeB => 'एग्रेस बी';

  @override
  String get mtBridgeModeOffShort => 'बंद';

  @override
  String get mtBridgeModeAShort => 'मध्ये ए';

  @override
  String get mtBridgeModeBShort => 'आऊट बी';

  @override
  String get mtBridgeMutexHint =>
      'मोड निवडल्याने दुसरा आपोआप बंद होतो. एकाचवेळी A+B समर्थित नाही.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'डेमो (लॉगिंग)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'इनबाउंड मजकूर नोटिस अंतर्गत #meshtastic म्हणून दिसतो. मेश रिले पर्यायी आहे (डीफॉल्टनुसार बंद).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet जाळीवर देखील रिले';

  @override
  String get mtBridgeRelayHint =>
      'चालू असताना, स्वाक्षरी केलेले सार्वजनिक बुलेटिन प्रसारित केले जातात. बंद = फक्त या फोनच्या सूचना.';

  @override
  String get mtBridgeSimulateHint => 'डेमो संदेश';

  @override
  String get mtBridgeSimulate => 'Meshtastic संदेशाचे अनुकरण करा';

  @override
  String get mtBridgeIngestOk => 'सूचनांमध्ये अंतर्भूत केले (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'चेतावणी: येथे पाठवलेले संदेश ResilNet E2EE नाहीत. Meshtastic मार्गावरील कोणीही ते वाचू शकतो.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'प्रकाशित करण्यासाठी मजकूर';

  @override
  String get mtBridgeSend => 'Meshtastic वर पाठवा';

  @override
  String get mtBridgeEgressOk => 'Meshtastic साठी रांगेत (लॉग / इतिहास पहा)';

  @override
  String get mtBridgeLastEgress => 'शेवटचा निर्गमन';

  @override
  String get mtBridgeEgressHistory => 'अलीकडील निर्गमन';

  @override
  String get mtBridgeOffHint =>
      'ब्रिज वापरण्यासाठी Ingest (A) किंवा Egress (B) चालू करा.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE नाही';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT वाहतूक वापरा';

  @override
  String get mtBridgeUseMqttHint =>
      'बंद = केवळ डेमो लॉगिंग (MQTT इनबाउंड दुर्लक्षित). कनेक्ट केलेले असताना अंतर्ग्रहण/निगमनासाठी = MQTT चालू.';

  @override
  String get mtBridgeMqttHost => 'ब्रोकर होस्ट';

  @override
  String get mtBridgeMqttPort => 'बंदर';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) वापरा';

  @override
  String get mtBridgeMqttTlsHint =>
      'ठराविक पोर्ट 8883. सिस्टम प्रमाणपत्रे वापरते; हँडशेक त्रुटींवर मऊ अयशस्वी.';

  @override
  String get mtBridgeMqttAutoReconnect => 'स्वयं-पुन्हा कनेक्ट करा';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'चालू असताना, क्लायंट ड्रॉपनंतर पुन्हा कनेक्ट करण्याचा प्रयत्न करतो. पुनर्संचयित होईपर्यंत स्थिती कनेक्ट होत असल्याचे दर्शविते.';

  @override
  String get mtBridgeMqttTopicHelpers => 'विषय सहाय्यक';

  @override
  String get mtBridgeMqttRegion => 'प्रदेश उपसर्ग (पर्यायी)';

  @override
  String get mtBridgeMqttRegionHint =>
      'सेट केल्यावर, msh/<region>/2/json (विषय रूट ओव्हरराइड करते) म्हणून रीबिल्ड रूट लागू करा.';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON विषय मूळ';

  @override
  String get mtBridgeMqttDownlinkChannel => 'चॅनेलचे नाव डाउनलिंक करा';

  @override
  String get mtBridgeMqttApplyTopics =>
      'रूट → सबस्क्राइब करा / विषय प्रकाशित करा';

  @override
  String get mtBridgeMqttAdvanced => 'प्रगत MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, पुन्हा कनेक्ट करा, विषय, क्रेडेन्शियल';

  @override
  String get mtBridgeMqttTopicIn => 'विषयाची सदस्यता घ्या';

  @override
  String get mtBridgeMqttTopicOut => 'विषय प्रकाशित करा';

  @override
  String get mtBridgeMqttGatewayFrom => 'गेटवे नोड आयडी (पासून)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'दशांश आयडी किंवा !हेक्स — पाठवलेल्या डाउनलिंकसाठी आवश्यक';

  @override
  String get mtBridgeMqttChannelIndex => 'मेश चॅनेल इंडेक्स (पर्यायी 0-7)';

  @override
  String get mtBridgeMqttUser => 'वापरकर्तानाव (पर्यायी)';

  @override
  String get mtBridgeMqttPass => 'पासवर्ड (पर्यायी)';

  @override
  String get mtBridgeMqttPassStored =>
      'या डिव्हाइसवर पासवर्ड संग्रहित केला आहे (दर्शविलेला नाही).';

  @override
  String get mtBridgeMqttPassReplace => 'नवीन पासवर्ड (राखण्यासाठी रिक्त सोडा)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'संचयित पासवर्ड ठेवण्यासाठी रिक्त सोडा.';

  @override
  String get mtBridgeMqttPassClear => 'पासवर्ड साफ करा';

  @override
  String get mtBridgeMqttSave => 'MQTT सेटिंग्ज सेव्ह करा';

  @override
  String get mtBridgeMqttSaved => 'MQTT सेटिंग्ज सेव्ह केल्या';

  @override
  String get mtBridgeMqttConnect => 'कनेक्ट करा';

  @override
  String get mtBridgeMqttDisconnect => 'डिस्कनेक्ट करा';

  @override
  String get mtBridgeMqttConnected => 'MQTT कनेक्ट केले';

  @override
  String get mtBridgeMqttConnecting => 'MQTT कनेक्ट करत आहे...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT डिस्कनेक्ट केले';

  @override
  String get mtBridgeMqttError => 'MQTT त्रुटी';

  @override
  String get mtBridgeErrModeIngest => 'प्रथम Ingest (A) वर स्विच करा';

  @override
  String get mtBridgeErrModeEgress => 'प्रथम Egress (B) वर स्विच करा';

  @override
  String get mtBridgeErrRate => 'धीमा — मर्यादित दर';

  @override
  String get mtBridgeErrDedupe => 'डुप्लिकेट संदेशाकडे दुर्लक्ष केले';

  @override
  String get mtBridgeErrLoop => 'ब्रिज लूप टाळण्यासाठी सोडले';

  @override
  String get mtBridgeErrEmpty => 'संदेश रिकामा आहे';

  @override
  String get mtBridgeErrPublish => 'प्रकाशित करता आले नाही';

  @override
  String get mtBridgeErrNotConnected => 'MQTT कनेक्ट केलेले नाही';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ब्रोकर होस्ट एंटर करा';

  @override
  String get mtBridgeErrMissingTopic => 'सदस्यता घ्या आणि विषय प्रकाशित करा';

  @override
  String get mtBridgeErrMissingFromNode =>
      'पाठवलेल्या मजकूरासाठी गेटवे नोड आयडी (प्रेषक) प्रविष्ट करा';

  @override
  String get mtBridgeErrConnect => 'MQTT कनेक्ट अयशस्वी';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS कनेक्ट अयशस्वी';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsDataHint =>
      'डेटाबेस संकुचित करण्यासाठी स्थानिक संदेश हटवा — ओळख, कळा आणि समवयस्क ठेवले जातात';

  @override
  String get settingsSaveHistoryTitle => 'संदेश इतिहास जतन करा';

  @override
  String get settingsSaveHistorySubtitle =>
      'बंद असताना, संदेश वायरवर E2EE राहतात आणि फक्त या सत्रासाठी ठेवले जातात (स्थानिक चॅट इतिहासात नाही). तुमचा स्वतःचा मजकूर अजूनही या डिव्हाइसवर साधा मजकूर म्हणून दाखवतो.';

  @override
  String get settingsPrivacy => 'गोपनीयता';

  @override
  String get settingsE2eeTitle => 'एंड-टू-एंड एन्क्रिप्शन';

  @override
  String get settingsE2eeSubtitle =>
      'नेहमी चालू — संदेश पाठवण्यापूर्वी RSA-OAEP + AES-GCM सह सील केलेले असतात. रिले आणि जवळील हॉप्स सामग्री वाचू शकत नाहीत.';

  @override
  String get settingsScreenshotTitle => 'स्क्रीनशॉट सूचना';

  @override
  String get settingsScreenshotSubtitle =>
      'जेव्हा हे डिव्हाइस स्क्रीन कॅप्चर करते तेव्हा चॅटमध्ये सिस्टम लाइन दाखवा';

  @override
  String get settingsNostrExpiryTitle => 'Nostr संदेश वेळ ठेवा';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr द्वारे ऑनलाइन असताना सीलबंद लिफाफे स्थानिक पातळीवर किती काळ ठेवावेत';

  @override
  String get noticeExpiresIn => 'मध्ये कालबाह्य होते';

  @override
  String get noticesTitle => 'नोटीस';

  @override
  String get noticesMeshIntro =>
      'सार्वजनिक बुलेटिन — रेडिओ श्रेणीतील प्रत्येकासाठी दृश्यमान, एनक्रिप्ट केलेले नाही. हे फोन-टू-फोन ऑफलाइन हॉप करते आणि जवळपासचे ResilNet रिले बॉक्स एक प्रत ठेवतात जेणेकरुन नंतर येणारे लोक ते पाहतात.';

  @override
  String get noticesMeshPublicBadge => 'सार्वजनिक · एनक्रिप्ट केलेले नाही';

  @override
  String get noticesGeoIntro =>
      'या ठिकाणासाठी लहान टिपा जोडा जेणेकरून इतर अभ्यागत त्यांना शोधू शकतील.';

  @override
  String get noticesEmpty => 'अद्याप कोणतीही सूचना नाही';

  @override
  String get noticesEmptyHint => 'आजूबाजूच्या लोकांसाठी पहिली सूचना पिन करा.';

  @override
  String get noticesComposeHint => 'सूचना पोस्ट करा...';

  @override
  String get noticesUrgent => 'तात्काळ';

  @override
  String get noticesOpen => 'नोटीस';

  @override
  String get screenshotTaken => '*तुम्ही स्क्रीनशॉट घेतला*';

  @override
  String get chatAttachImage => 'प्रतिमा संलग्न करा';

  @override
  String get chatImageLabel => 'प्रतिमा';

  @override
  String get chatImageTooLarge =>
      'प्रतिमा खूप मोठी आहे — दुसरा फोटो वापरून पहा';

  @override
  String get chatNostrExpiry => 'Nostr ठेवा';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel वर पाठवा — सार्वजनिक';
  }

  @override
  String get settingsClearTitle => 'सर्व संदेश साफ करा';

  @override
  String get settingsClearSubtitle => 'या डिव्हाइसवरील सर्व चॅट हटवा';

  @override
  String get settingsClearConfirmTitle => 'सर्व संदेश साफ करायचे?';

  @override
  String get settingsClearConfirmBody =>
      'हे या डिव्हाइसवरील सर्व चॅट संदेश हटवते.\nसमवयस्क आणि टोपणनावे काढले जात नाहीत.';

  @override
  String get settingsClearAction => 'डेटा साफ करा';

  @override
  String get settingsClearedSnack => 'डेटा साफ केला';

  @override
  String settingsVersion(String version) {
    return 'आवृत्ती $version';
  }

  @override
  String get meshBleScanning => 'BLE: नोड्ससाठी स्कॅनिंग';

  @override
  String get meshBleEsp32Scanning => 'ESP32: जवळचा नोड शोधत आहे';

  @override
  String get meshBleSyncing => 'BLE: ESP32 सह सिंक करत आहे';

  @override
  String get meshNostrPublishing => 'Nostr: प्रकाशन';

  @override
  String get meshBleIdle => 'BLE जाळी चालू — अद्याप जवळपास कोणतेही फोन नाहीत';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE जाळी — $count जवळचे फोन';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: परवानगी आवश्यक आहे';

  @override
  String get meshBlePausedCamera =>
      'BLE कॅमेऱ्यासाठी विराम दिला — स्टार्ट BLE वर टॅप करा';

  @override
  String get meshBleStopped =>
      'BLE बंद आहे — ब्लूटूथ चालू आहे ते तपासा, त्यानंतर स्टार्ट BLE वर टॅप करा';

  @override
  String get meshBleRestart => 'BLE सुरू करा';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'परवानग्या तपासा आणि BLE सुरू करा';

  @override
  String get meshNostrOffline => 'Nostr ऑफलाइन';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count जवळपासचे समवयस्क • LoRa $lora • समक्रमण ~${meters}m';
  }

  @override
  String get meshLoraReady => 'तयार';

  @override
  String get meshLoraNotReady => 'तयार नाही';

  @override
  String meshGatewayProgress(String label) {
    return 'गेटवे UDP: $label';
  }

  @override
  String get meshGatewayReady => 'गेटवे UDP: तयार';

  @override
  String get permissionTitle =>
      'BLE जाळी नेटवर्क सुरू करण्यासाठी प्रवेशास अनुमती द्या';

  @override
  String get permissionBody =>
      'ॲपला समुदाय संदेशासाठी ब्लूटूथ (स्कॅन / कनेक्ट / जाहिरात), स्थान (जुन्या Android डिव्हाइससाठी) आणि मायक्रोफोन (चॅट आणि घोषणांमधील व्हॉइस नोट्ससाठी) आवश्यक आहे.';

  @override
  String get permissionE2ee =>
      'एंड-टू-एंड एन्क्रिप्शन (E2EE)\nरिले नोड्स संदेश सामग्री वाचू शकत नाहीत';

  @override
  String get permissionReady => 'परवानग्या तयार';

  @override
  String get permissionRequest => 'परवानगी द्या आणि सुरू ठेवा';

  @override
  String get permissionNotReadySnack =>
      'सिस्टम अद्याप तयार नाही — थोडा वेळ थांबा आणि पुन्हा प्रयत्न करा';

  @override
  String get permissionDeniedSnack =>
      'परवानग्या अपूर्ण आहेत — सेटिंग्ज > ResilNet उघडा आणि ब्लूटूथ / स्थान / मायक्रोफोनला अनुमती द्या';

  @override
  String get permissionMicDenied =>
      'मायक्रोफोन प्रवेश नाकारला — व्हॉइस नोट्स रेकॉर्ड करण्यासाठी सेटिंग्जमध्ये अनुमती द्या';

  @override
  String get permissionMicOpenSettings => 'सेटिंग्ज';

  @override
  String get permissionCameraDenied =>
      'कॅमेरा प्रवेश नाकारला — QR कोड स्कॅन करण्यासाठी सेटिंग्जमध्ये अनुमती द्या';

  @override
  String get permissionCameraFailed =>
      'QR कोड स्कॅन करण्यासाठी कॅमेरा परवानगी आवश्यक आहे';

  @override
  String get permissionCameraOpenSettings => 'सेटिंग्ज';

  @override
  String get permissionPhotosDenied =>
      'फोटो लायब्ररी प्रवेश नाकारला — तुमचा QR कोड जतन करण्यासाठी सेटिंग्जमध्ये परवानगी द्या';

  @override
  String get permissionPhotosFailed =>
      'तुमचा QR कोड सेव्ह करण्यासाठी फोटो लायब्ररीची परवानगी आवश्यक आहे';

  @override
  String get permissionPhotosOpenSettings => 'सेटिंग्ज';

  @override
  String permissionFailedSnack(String error) {
    return 'परवानगी विनंती अयशस्वी: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet आर्किटेक्चर • स्टोअर-आणि-फॉरवर्ड मल्टी-हॉप';

  @override
  String get onboardingSkip => 'वगळा';

  @override
  String get onboardingNext => 'पुढे';

  @override
  String get onboardingStart => 'सुरुवात करा';

  @override
  String get onboardingWelcomeTitle => 'ResilNet मध्ये आपले स्वागत आहे';

  @override
  String get onboardingWelcomeBody =>
      'जाळी नेटवर्कवर ResilNet वर चॅट करा — अगदी इंटरनेटशिवाय';

  @override
  String get onboardingFriendsTitle => 'सहज मित्र जोडा';

  @override
  String get onboardingFriendsBody =>
      'Identity वरून QR शेअर करा किंवा सार्वजनिक की अदलाबदल करण्यासाठी मित्राचा QR स्कॅन करा';

  @override
  String get onboardingChannelsTitle => 'एनक्रिप्टेड चॅट + जवळपासचे चॅनेल';

  @override
  String get onboardingChannelsBody =>
      'जवळपासच्या समवयस्कांना शोधण्यासाठी #mesh / क्षेत्र (geohash) स्विच करा — संदेश BLE मेश आणि Nostr वर E2EE राहतात';

  @override
  String get chatTitle => 'चॅट (E2EE)';

  @override
  String get chatScanTooltip => 'समवयस्क जोडण्यासाठी QR स्कॅन करा';

  @override
  String get chatBlockTooltip => 'या प्रेषकाला ब्लॉक करा';

  @override
  String get chatBlockedSnack => 'अवरोधित: कोणतीही सूचना नाही / रिले नाही';

  @override
  String get chatAliasTooltip => 'टोपणनाव सेट करा';

  @override
  String get chatReceiverPemLabel => 'प्राप्तकर्ता सार्वजनिक की (PEM)';

  @override
  String get chatReceiverPemHint =>
      'तुमच्या मित्राची सार्वजनिक की पेस्ट करा (QR / शेअर केलेल्या फाइलमधून)';

  @override
  String get chatNeedPeerKey =>
      'प्रथम या पीअरचा QR स्कॅन करा (सत्यापित सार्वजनिक की आवश्यक)';

  @override
  String get chatPeerKeyMismatch =>
      'संग्रहित सार्वजनिक की या पीअर आयडीशी जुळत नाही';

  @override
  String chatVoiceFailed(String error) {
    return 'ऑडिओ रेकॉर्ड करू शकलो नाही: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'व्हॉइस नोट प्ले करू शकलो नाही: $error';
  }

  @override
  String get chatPlayVoice => 'व्हॉइस नोट प्ले करा';

  @override
  String get chatPauseVoice => 'विराम द्या';

  @override
  String get chatVoiceLabelSent => '🎤 व्हॉइस नोट (सीलबंद)';

  @override
  String get chatVoiceLabel => '🎤 व्हॉइस नोट';

  @override
  String get chatDecryptFailed => '[डिक्रिप्शन अयशस्वी]';

  @override
  String chatSentSealed(String preview) {
    return '[सीलबंद • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[सीलबंद]';

  @override
  String get chatComposeHint => 'संदेश टाइप करा... (पाठवण्यावर सीलबंद)';

  @override
  String get chatEmptyThread =>
      'अद्याप कोणतेही संदेश नाहीत\nजाळी पाठवण्यासाठी खाली टाइप करा';

  @override
  String chatLoadFailed(String error) {
    return 'संभाषण लोड करू शकलो नाही: $error';
  }

  @override
  String get chatEmojiTooltip => 'इमोजी';

  @override
  String get statusPending => 'प्रलंबित';

  @override
  String get statusSent => 'पाठवले';

  @override
  String get statusRelayed => 'रिले केले';

  @override
  String get statusDelivered => 'वितरित केले';

  @override
  String get statusRead => 'वाचा';

  @override
  String get statusFailed => 'अयशस्वी';

  @override
  String get chatCopy => 'कॉपी करा';

  @override
  String get chatDeleteLocal => 'या डिव्हाइसवर हटवा';

  @override
  String get chatDeletedLocalSnack => 'या डिव्हाइसवरून हटवले';

  @override
  String get chatRetry => 'पुन्हा प्रयत्न करा';

  @override
  String get chatSendFailed => 'वितरित केले नाही — पुन्हा प्रयत्न करा टॅप करा';

  @override
  String get chatImageNeedInternet =>
      'प्रतिमा पाठवण्यासाठी इंटरनेटशी कनेक्ट करा';

  @override
  String get chatImageTooLargeOnline =>
      'पाठवण्यासाठी इमेज पुरेशी संकुचित करू शकलो नाही';

  @override
  String get chatOpenLinkFailed => 'लिंक उघडू शकलो नाही';

  @override
  String get identityTitle => 'ओळख';

  @override
  String get identityScanTooltip => 'कॅमेरासह QR स्कॅन करा';

  @override
  String get identityCopiedHash => 'सार्वजनिक की हॅश कॉपी केली';

  @override
  String get identityPeerSaved => 'क्यूआर मधून पीअर सेव्ह केले';

  @override
  String get identityGalleryDenied => 'फोटो लायब्ररी परवानगी नाकारली';

  @override
  String get identityQrSaved => 'QR फोटो लायब्ररीमध्ये सेव्ह केला';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR जतन करू शकलो नाही: $error';
  }

  @override
  String get peersTitle => 'नेटवर्क सदस्य';

  @override
  String get qrScanTitle => 'मित्र जोडण्यासाठी QR स्कॅन करा';

  @override
  String get qrInvalid => 'स्कॅन अयशस्वी: अवैध QR';

  @override
  String get qrIdKeyMismatch => 'QR नाकारले: आयडी सार्वजनिक कीशी जुळत नाही';

  @override
  String get qrCameraNotReady => 'कॅमेरा तयार नाही';

  @override
  String get qrRetrySettings => 'पुन्हा प्रयत्न करा / सेटिंग्ज उघडा';

  @override
  String qrCameraOpenFailed(String error) {
    return 'कॅमेरा उघडू शकलो नाही: $error';
  }

  @override
  String get qrScanAlignHint => 'फ्रेमच्या आत QR कोड संरेखित करा';

  @override
  String get firmwareDownloadTitle => 'ESP32 फर्मवेअर डाउनलोड करा';

  @override
  String get firmwareSourceOnline => 'नवीनतम (ऑनलाइन)';

  @override
  String get firmwareSourceCached => 'जतन केलेली प्रत (ऑफलाइन)';

  @override
  String get firmwareSourceBaseline => 'एकत्रित आधाररेखा (ऑफलाइन)';

  @override
  String get firmwareSourceUnavailable => 'कोणतेही फर्मवेअर उपलब्ध नाही';

  @override
  String get firmwareBaselineIncompatible =>
      'बंडल केलेले फर्मवेअर खूप जुने आहे — नवीन आवृत्ती डाउनलोड करण्यासाठी इंटरनेटशी कनेक्ट करा';

  @override
  String get firmwareChecksumFailed =>
      'फर्मवेअर अखंडता तपासणी अयशस्वी - फ्लॅशिंग अवरोधित';

  @override
  String firmwareReadyFromSource(String source) {
    return 'फर्मवेअर तयार: $source';
  }

  @override
  String get peersRefreshTooltip => 'रिफ्रेश करा';

  @override
  String get peersBlocked => 'अवरोधित';

  @override
  String peersNearbyBle(Object ble) {
    return 'जवळपास (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'अलीकडे ऑनलाइन';

  @override
  String get peersOnlineInArea => 'क्षेत्रात ऑनलाइन';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes मिनिटांपूर्वी पाहिले';
  }

  @override
  String get peersOffline => 'ऑफलाइन';

  @override
  String peersBlockedSnack(String id) {
    return 'अवरोधित $id';
  }

  @override
  String get peersUnblockedSnack => 'अनब्लॉक केले';

  @override
  String get peersEmpty =>
      'डेटाबेसमध्ये अद्याप कोणतेही सदस्य नाहीत\nQR स्कॅन करा किंवा BLE जाळी शोधण्याची प्रतीक्षा करा';

  @override
  String get peersOpenChat => 'गप्पा उघडा';

  @override
  String get peersBlockAction => 'ब्लॉक करा';

  @override
  String get peersUnblockAction => 'अनब्लॉक करा';

  @override
  String get channelPickerTooltip => 'गप्पा / #mesh / क्षेत्र';

  @override
  String get locationPickerTooltip => 'स्थान चॅनेल';

  @override
  String get transportPickerTooltip => 'जाळी / इंटरनेट / ऑटो';

  @override
  String get onlinePeopleTooltip => 'लोक ऑनलाइन';

  @override
  String get unreadDirectsTooltipEmpty => 'खाजगी संदेश';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count न वाचलेले खाजगी संदेश';
  }

  @override
  String get onlinePeopleTitle => 'लोक';

  @override
  String get onlinePeopleEmpty => 'येथे अद्याप कोणीही ऑनलाइन नाही';

  @override
  String onlinePeopleCount(int count) {
    return '$count ऑनलाइन';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · जवळपास + क्षेत्र';

  @override
  String get peerOnlineMeshTitle => 'जाळीवर जवळचे कोणीतरी';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name जाळीवर जवळपास आहे';
  }

  @override
  String get peerOnlineAreaTitle => 'परिसरात कोणीतरी ऑनलाइन';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr द्वारे ऑनलाइन आहे';
  }

  @override
  String get locationSheetTitle => '#स्थान चॅनेल';

  @override
  String get channelPinsTitle => 'पिन केलेला';

  @override
  String get channelPinsHint =>
      'तुम्ही अनेकदा वापरता ते चॅनेल पिन करा — ते शीर्षस्थानी राहतात';

  @override
  String get channelPinTooltip => 'हे चॅनल पिन करा';

  @override
  String get channelUnpinTooltip => 'अनपिन करा';

  @override
  String get locationSheetIntro =>
      'खडबडीत जिओहॅश वापरून जवळपासच्या लोकांशी चॅट करा — अचूक GPS नाही. इंटरनेटवरील उपस्थिती अनामित Nostr की वापरते.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 मी';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'टेलीपोर्ट';

  @override
  String homeComposeHint(String channel) {
    return 'संदेश $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel वर पाठवा — सार्वजनिक';
  }

  @override
  String get messageExpiryTitle => 'मध्ये कालबाह्य होते';

  @override
  String get voiceRecordTapToStart => 'व्हॉइस संदेश रेकॉर्ड करण्यासाठी टॅप करा';

  @override
  String get voiceRecordTooShort => 'खूप लहान रेकॉर्डिंग — पुन्हा प्रयत्न करा';

  @override
  String get voiceRecordFailed =>
      'रेकॉर्डिंग सेव्ह करू शकलो नाही — पुन्हा प्रयत्न करा';

  @override
  String get voicePttHold => 'रेकॉर्ड करण्यासाठी धरा';

  @override
  String get voicePttRelease => 'पूर्वावलोकनासाठी सोडा';

  @override
  String get voicePttRecording => 'रेकॉर्ड करत आहे...';

  @override
  String get voicePttDraftReady => 'व्हॉइस नोट तयार आहे';

  @override
  String get voicePttDiscard => 'टाकून द्या';

  @override
  String get voicePttReRecord => 'पुन्हा रेकॉर्ड करा';

  @override
  String get voicePttSend => 'व्हॉइस नोट पाठवा';

  @override
  String get voicePttPlayPreview => 'पूर्वावलोकन प्ले करा';

  @override
  String get voicePttStopPreview => 'पूर्वावलोकन थांबवा';

  @override
  String get noticesBackfilling => 'सूचना लोड करत आहे...';

  @override
  String get noticesNostrOnline => 'Nostr ऑनलाइन';

  @override
  String get noticesNostrOffline =>
      'Nostr ऑफलाइन — बुलेटिनला इंटरनेटची आवश्यकता आहे';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count सूचना लोड केल्या';
  }

  @override
  String get noticePublishFailed =>
      'एरिया बोर्डाला नोटीस प्रसिद्ध करता आली नाही. Nostr कनेक्शन तपासा.';

  @override
  String get noticeMeshPublishNoLink =>
      'स्थानिक पातळीवर जतन केले. जवळच्या मेश रेडिओशी (किंवा Wi‑Fi गेटवे) कनेक्ट करा जेणेकरून इतर ते प्राप्त करू शकतील.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLE वर $count जवळच्या उपकरणांवर बुलेटिन पाठवले.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'जवळपासचे रेडिओ पाहिले, परंतु BLE लिहिणे अयशस्वी झाले. दोन्ही ॲप्स सूचना स्क्रीनवर उघडे ठेवा आणि पुन्हा प्रयत्न करा (किंवा ESP32 रिले वापरा).';

  @override
  String get noticeMeshPublishNoGatt =>
      'या डिव्हाइसचा BLE प्राप्तकर्ता तयार नाही. ब्लूटूथ टॉगल करा आणि नोटिस पुन्हा उघडा.';

  @override
  String get noticeDelete => 'सूचना हटवा';

  @override
  String get noticeDeleteConfirmTitle => 'ही सूचना हटवायची?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'हे फक्त या डिव्हाइसवर काढून टाकते. इतर ज्यांना ते आधीच मिळाले आहे ते अजूनही ते पाहतील.';

  @override
  String get noticeDeleted => 'नोटीस हटवली';

  @override
  String get chatNoticeHidden => 'क्षेत्र सूचना — खुल्या सूचना';

  @override
  String get identityDisplayNameTitle => 'नाव प्रदर्शित करा';

  @override
  String get identitySaveName => 'नाव जतन करा';

  @override
  String get identityUserIdLabel => 'वापरकर्ता आयडी (पब्लिक की हॅश)';

  @override
  String get identityCopyHashTooltip => 'सार्वजनिक की हॅश कॉपी करा';

  @override
  String get identityMyQrTitle => 'माझा QR (id + pubKey + नाव)';

  @override
  String identityQrFailed(String error) {
    return 'QR तयार करू शकलो नाही\n$error';
  }

  @override
  String get identitySaving => 'सेव्ह करत आहे...';

  @override
  String get identitySaveQr => 'फोटो लायब्ररीमध्ये QR जतन करा';

  @override
  String get identityOpenScanner => 'QR स्कॅन करण्यासाठी कॅमेरा उघडा';

  @override
  String get identityQrHelp =>
      'तुमची सार्वजनिक की जतन करण्यासाठी एखाद्या मित्राला हे स्कॅन करण्यास सांगा आणि (आवश्यक असल्यास) तुम्हाला सत्यापित जारीकर्ता म्हणून सेट करा';

  @override
  String get identityChatTip =>
      'टीप: E2EE साठी सार्वजनिक की जोडण्यासाठी तुम्ही चॅटमध्ये QR देखील स्कॅन करू शकता';

  @override
  String get infoOpen => 'बद्दल / माहिती';

  @override
  String get docsGuideTitle => 'वापरकर्ता मार्गदर्शक';

  @override
  String get docsGuideSubtitle => 'ब्राउझरमध्ये उघडते';

  @override
  String get docsOpenAction => 'मार्गदर्शक उघडा';

  @override
  String get docsOpenFailed => 'वापरकर्ता मार्गदर्शक उघडू शकलो नाही';

  @override
  String get firmwareOtaGuideTitle => 'फ्लॅश मार्गदर्शक आणि OTA प्रोटोकॉल';

  @override
  String get firmwareOtaGuideSubtitle =>
      'वेब मार्गदर्शक उघडते — .bin डाउनलोड आणि पूर्ण चरण';

  @override
  String get firmwareWebDownloadsTitle => 'वेबवर फर्मवेअर डाउनलोड';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'डॉक्स साइटवरील प्रति-आवृत्ती दुवे आणि चेकसम';

  @override
  String get inviteCopyShortLink => 'लहान लिंक कॉपी करा';

  @override
  String get inviteShareLink => 'लिंक शेअर करा';

  @override
  String get inviteShowFullLink => 'पूर्ण लिंक';

  @override
  String get inviteCopyFullLink => 'पूर्ण लिंक कॉपी करा';

  @override
  String get inviteLinkCopied => 'लिंक कॉपी केली';

  @override
  String get inviteLongPressHint => 'लिंक क्रियांसाठी दीर्घकाळ दाबा';

  @override
  String get inviteSendInChat => 'ResilNet चॅटमध्ये पाठवा...';

  @override
  String get inviteSendInChatHint =>
      'फक्त लोकांसाठी तुमच्याकडे आधीच सार्वजनिक की आहे';

  @override
  String get inviteSendInChatEmpty =>
      'अद्याप संदेश करण्यायोग्य चॅट नाहीत.\nQR स्कॅन करा, एरिया/मेश उघडा किंवा ॲपच्या बाहेर लिंक शेअर करा.';

  @override
  String get inviteSentToChat => 'चॅटमध्ये आमंत्रण पाठवले';

  @override
  String get infoTabInfo => 'माहिती';

  @override
  String get infoTabSettingsHint =>
      'भाषा, E2EE आणि डेटा साधनांसाठी मेनूमधून सेटिंग्ज उघडा';

  @override
  String get infoHowToTitle => 'कसे वापरावे';

  @override
  String get infoHowToBody =>
      '• चॅट / #mesh / क्षेत्र स्विच करण्यासाठी चॅनेल चिन्हावर टॅप करा\n• जिओहॅश आकार निवडण्यासाठी ठिकाणावर टॅप करा\n• सदस्यांसाठी किंवा ऑनलाइन असलेल्या लोकांवर टॅप करा\n• व्यक्तिशः चाव्यांची देवाणघेवाण करण्यासाठी ⋮ वरून ओळख/QR उघडा\n• क्षेत्र \"सार्वजनिक\" प्रत्येक ऑनलाइन पीअरला सीलबंद E2EE पाठवते — प्लेनटेक्स्ट रूम नाही';

  @override
  String get infoFeaturesTitle => 'वैशिष्ट्ये';

  @override
  String get infoFeatureOffline => 'ब्लूटूथ लो एनर्जीद्वारे ऑफलाइन संदेशन';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM सह एंड-टू-एंड एन्क्रिप्शन (नॉईज नाही)';

  @override
  String get infoFeatureMultihop =>
      'संदेश जवळच्या समवयस्कांकडून दूर जाण्यासाठी हॉप करू शकतात';

  @override
  String get infoFeatureBridge =>
      'सीलबंद लिफाफ्यांसाठी हायब्रिड जाळी ↔ इंटरनेट (Nostr).';

  @override
  String get infoFeatureGeo =>
      'जवळपासच्या लोकांसाठी स्थानिक जिओहॅश चॅनेल (डिस्कव्हरी UX)';

  @override
  String get infoFeatureNotices =>
      '#mesh आणि क्षेत्रासाठी मुदत संपलेल्या सूचना';

  @override
  String get infoPrivacyTitle => 'गोपनीयता';

  @override
  String get infoPrivacyNoRoom =>
      'वायरवर साधा मजकूर गाव/सार्वजनिक चॅट रूम नाही';

  @override
  String get infoPrivacyFanout =>
      'क्षेत्र पाठवा = सीलबंद 1:1 ज्ञात सार्वजनिक की सह समवयस्कांना फॅन-आउट';

  @override
  String get infoPrivacyPresence =>
      'इंटरनेट क्षेत्र उपस्थिती क्षणिक Nostr की वापरते';

  @override
  String get infoSymbolsTitle => 'चिन्हे';

  @override
  String get infoSymBle => 'डायरेक्ट ब्लूटूथ लिंक';

  @override
  String get infoSymMesh => 'जाळीद्वारे पोहोचण्यायोग्य (इतर पुढे)';

  @override
  String get infoSymInternet => 'इंटरनेटद्वारे (Nostr) — सीलबंद लिफाफे';

  @override
  String get infoSymBridge => 'मेष↔इंटरनेट ब्रिज मार्गे पोहोचलो';

  @override
  String get infoSymOffline => 'ऑफलाइन — आत्ता पोहोचण्यायोग्य नाही';

  @override
  String get infoSymInArea => 'या स्थान चॅनेलच्या क्षेत्रामध्ये';

  @override
  String get infoSymE2eeOk => 'एंड-टू-एंड एन्क्रिप्टेड सत्र';

  @override
  String get infoSymE2eeFail =>
      'एनक्रिप्शन अनुपलब्ध — संवेदनशील मजकूर पाठवू नका';

  @override
  String get infoSymVerified => 'ओळख सत्यापित / ज्ञात की';

  @override
  String get infoSymBlocked => 'अवरोधित';

  @override
  String get infoSymUnread => 'न वाचलेले खाजगी संदेश';

  @override
  String get infoEmergencyTitle => 'आणीबाणी मोड';

  @override
  String get infoEmergencyBody =>
      'या डिव्हाइसवरील संदेश, की आणि ओळख पुसण्यासाठी होम स्क्रीनवरील ResilNet शीर्षकावर तीन वेळा टॅप करा.';

  @override
  String get infoLegendNote =>
      'काही पथ चिन्ह स्पष्टतेसाठी येथे दस्तऐवजीकरण केले आहेत; चॅटमधील डिलिव्हरी टिक ही प्राथमिक पाठवण्याची स्थिती राहते.';

  @override
  String get dangerZoneTitle => 'धोक्याचे क्षेत्र';

  @override
  String get dangerZoneSubtitle =>
      'या डिव्हाइसवरील संदेश, एन्क्रिप्शन की, Nostr ओळख, समवयस्क आणि टोपणनावे हटवते. तुम्ही पुन्हा सेट कराल.';

  @override
  String get panicWipeTitle => 'आणीबाणी पुसणे';

  @override
  String get panicWipeSubtitle =>
      'सर्व काही स्थानिक पुसून टाका — होम टायटल ट्रिपल-टॅप करण्यासारखेच (डबल-टॅप रेडिओ रिफ्रेश करते)';

  @override
  String get panicWipeConfirmTitle => 'सर्व स्थानिक डेटा पुसायचा?';

  @override
  String get panicWipeConfirmBody =>
      'हे या फोनवरील चॅट, की आणि ओळख कायमचे हटवते.\nसमवयस्कांनी तुमच्या नवीन ओळखीसह QR की पुन्हा अदलाबदल करणे आवश्यक आहे.\nहे पूर्ववत केले जाऊ शकत नाही.';

  @override
  String get panicWipeAction => 'सर्वकाही पुसून टाका';

  @override
  String get panicWipeSnack => 'स्थानिक ओळख पुसली — पुन्हा सेट करा';

  @override
  String panicWipeFailed(String error) {
    return 'पुसणे अयशस्वी: $error';
  }

  @override
  String get meshBridgeTitle => 'जाळीदार पूल';

  @override
  String get meshBridgeSubtitle =>
      'चालू असताना (डिफॉल्ट), सीलबंद लिफाफे BLE जाळी आणि इंटरनेट (Nostr) दोन्ही एकत्र वापरू शकतात जेणेकरून जवळपासची जाळीदार बेटे कनेक्ट होऊ शकतील. बंद असताना, पाठवते फक्त एक मार्ग वापरा — वायरवर साधा मजकूर कधीही ठेवत नाही.';

  @override
  String get favoritesTitle => 'आवडी';

  @override
  String get favoritesAdd => 'आवडींमध्ये जोडा';

  @override
  String get favoritesRemove => 'आवडीमधून काढा';

  @override
  String get favoritesEmpty =>
      'अद्याप कोणतेही आवडते नाहीत — सदस्य सूचीमधून समवयस्क तारांकित करा';

  @override
  String get favoritesNearbyTitle => 'जवळचे आवडते';

  @override
  String favoritesNearbyBody(String name) {
    return '$name जाळीवर जवळपास आहे';
  }

  @override
  String get favoritesInAreaTitle => 'परिसरात आवडते';

  @override
  String favoritesInAreaBody(String name) {
    return '$name या क्षेत्रात ऑनलाइन आहे';
  }

  @override
  String get topologyTitle => 'जाळी टोपोलॉजी';

  @override
  String get topologySubtitle =>
      'जाळीकडून समवयस्क आणि कनेक्शन सूचना जाहीर करतात (केवळ-वाचनीय)';

  @override
  String get topologyConnectedNow => 'आता कनेक्ट केले (BLE)';

  @override
  String get topologyNearby => 'जवळपास (BLE)';

  @override
  String get topologyKnown => 'ओळखीचे समवयस्क';

  @override
  String get topologyEmpty =>
      'अद्याप कोणतेही समवयस्क शिकलेले नाहीत — BLE चालू ठेवून जवळपास रहा';

  @override
  String get topologyYou => 'आपण';

  @override
  String topologyStats(int peers, int links) {
    return '$peers समवयस्क · $links दुवे';
  }

  @override
  String get topologyGraphHint =>
      'जवळपासच्या जाळी शोधावरून अंदाजित — तुमचे डिव्हाइस हायलाइट केले आहे. चॅट उघडण्यासाठी पीअरवर टॅप करा.';

  @override
  String get topologyOpen => 'जाळी टोपोलॉजी';

  @override
  String get slashHelpTitle => 'आज्ञा';

  @override
  String get slashHelpBody =>
      '/मदत — ही यादी\n/who — वर्तमान चॅनेलमध्ये ऑनलाइन लोक\n/ड्रॉप <text> — येथे एक सीलबंद सूचना पिन करा (E2EE फॅन-आउट)\n\nपूर्ण मार्गदर्शक: खाली उघडा मार्गदर्शक किंवा सेटिंग्ज → वापरकर्ता मार्गदर्शक वापरा.';

  @override
  String get slashWhoEmpty => 'या चॅनेलवर सध्या कोणीही ऑनलाइन नाही';

  @override
  String slashWhoTitle(int count) {
    return 'ऑनलाइन ($count)';
  }

  @override
  String get slashDropNeedText => 'वापर: /तुमचा टीप मजकूर ड्रॉप करा';

  @override
  String slashDropDone(String channel) {
    return '$channel वर नोटीस सोडली';
  }

  @override
  String get slashUnknown => 'अज्ञात आदेश —/मदत करून पहा';

  @override
  String get announceOpen => 'घोषणा';

  @override
  String get announceTitle => 'घोषणा';

  @override
  String get announceEmpty =>
      'अद्याप कोणतेही फलक नाहीत — लॉक केलेल्या किंवा उघडलेल्या सूचना पोस्ट करण्यासाठी एक तयार करा';

  @override
  String get announceCreate => 'बोर्ड तयार करा';

  @override
  String get announceCreateHint => 'मंडळाचे नाव';

  @override
  String get announceDefaultTitle => 'समुदाय मंडळ';

  @override
  String get announceSettings => 'बोर्ड सेटिंग्ज';

  @override
  String get announceAllowLocked =>
      'लॉक केलेल्या (एनक्रिप्टेड) ​​पोस्टना अनुमती द्या';

  @override
  String get announceAllowLockedSub =>
      'बोर्ड कीवर कूटबद्ध केलेले — वाचकांना प्रवेश आवश्यक आहे';

  @override
  String get announceAllowOpen => 'खुल्या (साधा मजकूर) पोस्टना अनुमती द्या';

  @override
  String get announceAllowOpenSub =>
      'E2EE नाही — जाळी/रिलेवर वाचनीय. डीफॉल्टनुसार बंद.';

  @override
  String get announceComposeHint => 'एक घोषणा लिहा...';

  @override
  String get announceMediaInternetOnly =>
      'फोटो/व्हॉइस घोषणा इंटरनेटवर पाठवल्या जातात (BLE नाही)';

  @override
  String get announceNeedInternet =>
      'फोटो किंवा व्हॉइस घोषणा पाठवण्यासाठी इंटरनेटशी कनेक्ट करा';

  @override
  String announceVoiceFailed(String error) {
    return 'आवाज रेकॉर्ड करू शकलो नाही: $error';
  }

  @override
  String get announceImageTooLarge => 'प्रतिमा खूप मोठी आहे (कमाल ~180 KB)';

  @override
  String get announcePlayVoice => 'व्हॉइस नोट प्ले करा';

  @override
  String get announceImageLabel => '📷 प्रतिमा';

  @override
  String get announceAudioLabel => '🎤 व्हॉइस नोट';

  @override
  String get announceModeLocked => 'कुलूपबंद';

  @override
  String get announceModeOpen => 'उघडा';

  @override
  String get announceOpenBadge => 'ओपन · एनक्रिप्ट केलेले नाही';

  @override
  String get announceLockedBadge => 'कुलूपबंद';

  @override
  String get announceLockedPlaceholder =>
      'एनक्रिप्टेड — वाचण्यासाठी प्रवेशाची विनंती करा';

  @override
  String get announceRequestAccess => 'प्रवेशाची विनंती करा';

  @override
  String get announceRequestSent => 'बोर्ड मालकाला प्रवेश विनंती पाठवली';

  @override
  String get announceRequestFailed =>
      'प्रवेशाची विनंती करता आली नाही (मालकाची सार्वजनिक की आवश्यक आहे)';

  @override
  String get announceOpenConfirmTitle => 'एनक्रिप्शनशिवाय पोस्ट करायचे?';

  @override
  String get announceOpenConfirmBody =>
      'खुल्या पोस्ट E2EE नाहीत. मार्गावरील कोणीही (जाळी / रिले) ते वाचू शकेल. सुरू ठेवायचे?';

  @override
  String get announcePostAction => 'पोस्ट';

  @override
  String get announcePendingRequests => 'प्रवेश विनंत्या';

  @override
  String get announceApprove => 'मंजूर करा';

  @override
  String get announceDeny => 'नकार द्या';

  @override
  String get announceGranted =>
      'या बोर्डवरील लॉक केलेल्या पोस्ट्स तुम्ही वाचू शकता';

  @override
  String get announceOwner => 'हा बोर्ड तुमच्या मालकीचा आहे';

  @override
  String get announceCopyInvite => 'आमंत्रण मजकूर कॉपी करा';

  @override
  String get announceShowInviteQr => 'आमंत्रण QR दर्शवा';

  @override
  String get announceScanInviteQr => 'स्कॅन बोर्ड आमंत्रण QR';

  @override
  String get announceFollow => 'आमंत्रणावरून बोर्ड फॉलो करा';

  @override
  String get announceFollowHint =>
      'मालकाकडून आमंत्रण मजकूर किंवा ResilNet लिंक पेस्ट करा';

  @override
  String get announceFollowOk => 'खालील बोर्ड';

  @override
  String announceFollowOkNamed(String title) {
    return 'आता “$title” चे अनुसरण करा';
  }

  @override
  String get announceFollowFail => 'आमंत्रण अवैध किंवा खराब झाले आहे';

  @override
  String get announceInviteCopied => 'आमंत्रण मजकूर कॉपी केला';

  @override
  String get announceInviteSaveQr => 'QR जतन करा';

  @override
  String get announceInviteShare => 'आमंत्रण शेअर करा';

  @override
  String get announceFollowFromCompose =>
      'संदेश बॉक्समध्ये बोर्ड आमंत्रण आढळले';

  @override
  String get peerConfirmAddTitle => 'नेटवर्क सदस्य जोडायचे?';

  @override
  String peerConfirmAddBody(String name) {
    return 'त्यांच्या सार्वजनिक कीसह “$name” जोडायचे जेणेकरून तुम्ही त्यांना खाजगीरित्या संदेश देऊ शकता?';
  }

  @override
  String get peerConfirmAdd => 'सदस्य जोडा';

  @override
  String peerAddedOk(String name) {
    return 'नेटवर्क सदस्यांना $name जोडले';
  }

  @override
  String get peerAddFromCompose => 'संदेश बॉक्समध्ये ओळख / सार्वजनिक की आढळली';

  @override
  String get peerHashCopied => 'सार्वजनिक की हॅश कॉपी केली';

  @override
  String get peerHashOpenChat => 'गप्पा उघडा';

  @override
  String get peerHashAddHint =>
      'हॅश कॉपी केले. त्यांना त्यांची ओळख लिंक किंवा QR शेअर करण्यास सांगा जेणेकरून तुम्ही E2EE साठी संपूर्ण सार्वजनिक की जोडू शकता.';

  @override
  String get peerQrNoCode => 'या प्रतिमेमध्ये कोणताही ResilNet QR आढळला नाही';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ओळख: “$name”\nलिंक उघडा किंवा चॅटमध्ये पेस्ट करा → सदस्य जोडा\nकिंवा ओळख QR स्कॅन करा.';
  }

  @override
  String get identityShareInvite => 'ओळख लिंक शेअर करा';

  @override
  String get identityInviteCopied => 'ओळख लिंक कॉपी केली';

  @override
  String announceInviteSharePreamble(String title) {
    return 'मंडळाचे आमंत्रण: “$title”\nResilNet उघडा → समुदाय बोर्ड → आमंत्रणावरून फॉलो करा\nकिंवा QR स्कॅन करा / खालील लिंकवर टॅप करा.';
  }

  @override
  String get announceConfirmFollowTitle => 'या बोर्डाचे अनुसरण करायचे?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'या आमंत्रणावरून “$title” चे अनुसरण करायचे?';
  }

  @override
  String get announceConfirmFollow => 'अनुसरण करा';
}

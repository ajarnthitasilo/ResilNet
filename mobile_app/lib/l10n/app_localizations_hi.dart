// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ताज़ा ResilNet…';

  @override
  String get appRefreshed => 'ताज़ा - रेडियो और खोज पुनः प्रारंभ';

  @override
  String appRefreshFailed(String error) {
    return 'रीफ़्रेश विफल: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'डबल-टैप = सॉफ्ट रिफ्रेश। लंबे समय तक दबाना = कठिन पुनर्प्राप्ति। ट्रिपल-टैप = आपातकालीन वाइप।';

  @override
  String get softRefreshTipTitle => 'यदि ResilNet अटका हुआ महसूस होता है';

  @override
  String get softRefreshTipBody =>
      'सॉफ्ट रेडियो रिफ्रेश के लिए ResilNet (ऊपर-बाएँ) डबल-टैप करें। यदि अभी भी अटका हुआ है: शीर्षक को देर तक दबाकर रखें, ⋮ → हार्ड रिकवर, या सेटिंग्स का उपयोग करें। ट्रिपल-टैप केवल आपातकालीन वाइप है।';

  @override
  String get softRefreshTipGotIt => 'समझ गया';

  @override
  String get infoSoftRefreshTitle => 'यदि ऐप अटका हुआ लगता है';

  @override
  String get infoSoftRefreshStepRefresh =>
      'डबल-टैप करें ResilNet (ऊपर-बाएँ) → सॉफ्ट रिफ्रेश रेडियो और आस-पास के लोग';

  @override
  String get infoSoftRefreshStepHard =>
      'अभी भी अटके हुए हैं? शीर्षक को लंबे समय तक दबाकर रखें, या ⋮ / सेटिंग्स → हार्ड रिकवरी';

  @override
  String get infoSoftRefreshStepWait =>
      'परिणाम स्नैकबार की प्रतीक्षा करें, फिर पुनः प्रयास करें। सत्र रीसेट आपकी कुंजियाँ रखता है.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ट्रिपल-टैप = आपातकालीन वाइप (स्थानीय डेटा हटाता है) - केवल जानबूझकर';

  @override
  String get appRecoverySection => 'ऐप पुनर्प्राप्ति';

  @override
  String get appRecoverySectionSubtitle =>
      'जब ऐप फ़्रीज़ महसूस हो तो उपयोग करें। सॉफ़्ट = शीर्षक डबल-टैप करें। कठिन पुनर्प्राप्ति अधिक मजबूत है. सत्र रीसेट कुंजी मिटाए बिना सेवाओं को पुनरारंभ करता है।';

  @override
  String get appHardRecoverAction => 'मुश्किल से उबरना';

  @override
  String get appHardRecovering => 'मुश्किल से उबरना...';

  @override
  String get appSessionResetAction => 'सत्र रीसेट करें';

  @override
  String get appSessionResetRunning => 'सत्र रीसेट किया जा रहा है...';

  @override
  String get appSessionResetConfirmTitle => 'सत्र रीसेट करें?';

  @override
  String get appSessionResetConfirmBody =>
      'इस डिवाइस पर ResilNet सेवाएँ पुनः प्रारंभ करें। आपकी पहचान कुंजियाँ रखी जाती हैं.';

  @override
  String get appRecoveryBusy => 'पुनर्प्राप्ति पहले से ही चल रही है...';

  @override
  String get appRecoveryOk => 'पुनर्प्राप्ति समाप्त';

  @override
  String get appRecoveryPartial =>
      'कुछ चरणों को छोड़ कर पुनर्प्राप्ति समाप्त हो गई - यदि अभी भी अटकी हुई है तो पुनः प्रयास करें';

  @override
  String get appRecoveryFailed =>
      'पुनर्प्राप्ति विफल - सत्र रीसेट का प्रयास करें, या ओएस से ऐप को बलपूर्वक छोड़ें';

  @override
  String get localWifiTitle => 'स्थानीय Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'इंटरनेट के बिना आस-पास के उपकरणों को लिंक करें - एक LAN पर होने के समान।';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa गेटवे SoftAP नहीं। यह केवल फ़ोन↔फ़ोन/LAN है।';

  @override
  String get localWifiUnavailable =>
      'लोकल Wi‑Fi अभी तैयार नहीं है - ऐप स्टार्टअप की प्रतीक्षा करें।';

  @override
  String get lxmfBridgeTitle => 'होम नोड';

  @override
  String get lxmfBridgeSubtitle =>
      'आपके Wi‑Fi पर वैकल्पिक Mac या Pi जो सीलबंद चैट को रिले करता है। डिफ़ॉल्ट रूप से बंद. एंड-टू-एंड एन्क्रिप्शन को प्रतिस्थापित नहीं करता.';

  @override
  String get lxmfBridgeEnable => 'होम नोड का प्रयोग करें';

  @override
  String get lxmfBridgeDisabledHint =>
      'केवल तभी चालू करें जब ब्रिज ऐप इस नेटवर्क पर Mac या Pi पर चल रहा हो।';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ऑनलाइन - $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'होम नोड तक नहीं पहुंच सकता - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'होम नोड पता';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'आईपी ​​या http://IP:पोर्ट - उदाहरण 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'सहकर्मी → LXMF गंतव्य (JSON)';

  @override
  String get lxmfBridgeRefresh => 'स्थिति सहेजें और ताज़ा करें';

  @override
  String get lxmfBridgeLabHint => 'उन्नत: लैब/रेटिकुलम_एलएक्सएमएफ';

  @override
  String get lxmfBridgeOpen => 'होम नोड सेटिंग्स';

  @override
  String get lxmfBridgeCheckConnection => 'कनेक्शन की जाँच करें';

  @override
  String get lxmfBridgeStatusOnline => 'होम नोड से जुड़ा';

  @override
  String get lxmfBridgeStatusOffline => 'होम नोड पहुंच योग्य नहीं है';

  @override
  String get lxmfBridgeYourDest => 'इस नोड का पता (दोस्तों के साथ साझा करें)';

  @override
  String get lxmfBridgeCopyDest => 'पता कॉपी करें';

  @override
  String get lxmfBridgeDestCopied => 'पता कॉपी किया गया';

  @override
  String get lxmfBridgeLinkedPeers => 'जुड़े हुए मित्र';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'प्रत्येक मित्र को एक बार अपने होम-नोड पते की आवश्यकता होती है। फिर सीलबंद चैट इस पथ का उपयोग कर सकती हैं।';

  @override
  String get lxmfBridgeNoLinks => 'अभी तक कोई मित्र नहीं जुड़ा है.';

  @override
  String get lxmfBridgeAddLink => 'किसी मित्र को लिंक करें';

  @override
  String get lxmfBridgePickPeer => 'दोस्त';

  @override
  String get lxmfBridgePeerDest => 'उनका होम-नोड पता';

  @override
  String get lxmfBridgePeerDestHint => 'उनके होम नोड स्क्रीन से 32-वर्ण का कोड';

  @override
  String get lxmfBridgeInvalidDest =>
      'वह पता वैध नहीं लगता. उनके होम नोड से पूरा कोड चिपकाएँ।';

  @override
  String get lxmfBridgeRemoveLink => 'अनलिंक';

  @override
  String get lxmfBridgeSaveLink => 'बचाना';

  @override
  String get lxmfBridgeLinkSaved => 'मित्र जुड़ा हुआ';

  @override
  String get lxmfBridgeNoPeers =>
      'अभी तक कोई संदेश योग्य संपर्क नहीं - पहले एक मित्र जोड़ें।';

  @override
  String get lxmfBridgeHelp =>
      'ब्रिज को Mac/Pi पर चालू रखें। यह पथ आपके LAN पर रहता है - यह LoRa नहीं है और यह इंटरनेट या ब्लूटूथ जाल को प्रतिस्थापित नहीं करता है।';

  @override
  String get localWifiModeHotspot => 'आस-पास';

  @override
  String get localWifiModeRouter => 'रूटर';

  @override
  String get localWifiHotspotIntro =>
      'एक डिवाइस एक व्यक्तिगत हॉटस्पॉट साझा करता है। अन्य लोग उस हॉटस्पॉट से जुड़ते हैं, फिर ResilNet उन्हें स्थानीय नेटवर्क पर ढूंढता है।';

  @override
  String get localWifiHostAction => 'नेटवर्क बनाएं (होस्ट)';

  @override
  String get localWifiJoinAction => 'नेटवर्क से जुड़ें';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android सेटिंग्स खोलें और पर्सनल हॉटस्पॉट (या इंटरनेट शेयरिंग) चालू करें।\n2. दोस्तों को हॉटस्पॉट का नाम (और पासवर्ड) बताएं।\n3. यहां वापस आएं और \"हॉटस्पॉट चालू है - प्रतीक्षा करना शुरू करें\" पर टैप करें।';

  @override
  String get localWifiHostReady =>
      'हॉटस्पॉट चालू है - प्रतीक्षा करना शुरू करें';

  @override
  String get localWifiHostWaiting =>
      'मित्रों के शामिल होने की प्रतीक्षा कर रहा हूँ...';

  @override
  String get localWifiJoinSteps =>
      '1. सिस्टम सेटिंग्स खोलें और अपने मित्र के व्यक्तिगत हॉटस्पॉट से जुड़ें।\n2. यहां लौटें और \"मैं कनेक्ट हूं - खोजें\" पर टैप करें।';

  @override
  String get localWifiJoinReady => 'मैं जुड़ा हुआ हूं - खोजें';

  @override
  String get localWifiRouterIntro =>
      'प्रत्येक डिवाइस को एक ही Wi‑Fi राउटर/एपी से कनेक्ट करें। राउटर को इंटरनेट की आवश्यकता नहीं है - केवल एक साझा स्थानीय नेटवर्क।';

  @override
  String get localWifiRouterSearch => 'इस पर खोजें Wi‑Fi';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi जानकारी ताज़ा करें';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi पर नहीं';

  @override
  String get localWifiRouterNoWifiBody =>
      'सिस्टम सेटिंग्स में राउटर के Wi‑Fi से जुड़ें, फिर दोबारा खोजें।';

  @override
  String get localWifiDiscovering => 'स्थानीय Wi‑Fi पर खोज रहे हैं...';

  @override
  String get localWifiPeersFound => 'इस नेटवर्क पर उपकरण';

  @override
  String get localWifiStop => 'रुकना';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi नाम अनुपलब्ध है';

  @override
  String get localWifiStubBanner => 'LAN सॉकेट की प्रतीक्षा की जा रही है…';

  @override
  String get localWifiLiveBanner =>
      'LAN डिस्कवरी लाइव (UDP) - इस Wi‑Fi पर घोषणा + सीलबंद चैट';

  @override
  String get localWifiEmptyHotspot =>
      'अभी तक कोई उपकरण नहीं.\nजांचें कि मित्र आपके हॉटस्पॉट में शामिल हो गए हैं और स्थानीय नेटवर्क तक पहुंच की अनुमति दी है।';

  @override
  String get localWifiEmptyRouter =>
      'अभी तक कोई उपकरण नहीं.\nवही एसएसआईडी? स्थानीय नेटवर्क की अनुमति है? कुछ राउटर डिवाइस-टू-डिवाइस ट्रैफ़िक (एपी आइसोलेशन) को ब्लॉक करते हैं।';

  @override
  String get localWifiIsolationHelp => 'हम एक दूसरे को क्यों नहीं ढूंढ पाते?';

  @override
  String get localWifiIsolationTitle => 'राउटर ग्राहकों को अलग कर सकता है';

  @override
  String get localWifiIsolationBody =>
      'यदि AP/क्लाइंट आइसोलेशन (या अतिथि नेटवर्क) चालू है, तो Wi‑Fi पर फ़ोन बात नहीं कर सकते। आइसोलेशन बंद करें, मुख्य एसएसआईडी का उपयोग करें, या निकटवर्ती (हॉटस्पॉट) मोड पर स्विच करें।';

  @override
  String get localWifiPeerReady => 'चैट करने के लिए तैयार (कुंजी है)';

  @override
  String get localWifiPeerNeedKey =>
      'मिला - कुंजियाँ बदलने के लिए QR स्कैन करें';

  @override
  String get localWifiErrorTitle => 'स्थानीय Wi‑Fi त्रुटि';

  @override
  String get localWifiErrorBody => 'कुछ गलत हो गया। रुकें और पुनः प्रयास करें.';

  @override
  String get preparingSystem => 'सिस्टम तैयार किया जा रहा है...';

  @override
  String get bootFailedTitle => 'प्रारंभ नहीं हो सका';

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get bootRecoveryAction =>
      'नई पहचान प्रारंभ करें (स्थानीय डेटा मिटाएं)';

  @override
  String get bootRecoveryConfirmTitle => 'नई पहचान शुरू करें?';

  @override
  String get bootRecoveryConfirmBody =>
      'यह इस डिवाइस पर स्थानीय चैट, कुंजियाँ और पहचान को स्थायी रूप से मिटा देगा।\nसाथियों को आपकी नई पहचान के साथ आपका क्यूआर दोबारा स्कैन करना होगा।\nइसे असंपादित नहीं किया जा सकता है।';

  @override
  String get bootRecoveryRunning => 'स्थानीय पहचान रीसेट की जा रही है...';

  @override
  String get bootRecoverySuccess => 'स्थानीय पहचान रीसेट पूर्ण';

  @override
  String bootRecoveryFailed(String error) {
    return 'पहचान रीसेट नहीं की जा सकी: $error';
  }

  @override
  String get cancel => 'रद्द करना';

  @override
  String get save => 'बचाना';

  @override
  String get close => 'बंद करना';

  @override
  String get start => 'शुरू';

  @override
  String get send => 'भेजना';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get language => 'भाषा';

  @override
  String get languageSubtitle =>
      'डिफ़ॉल्ट रूप से ऐप आपके फ़ोन की भाषा का अनुसरण करता है (समर्थित होने पर)। अन्य भाषाएँ अंग्रेजी पर वापस आ जाती हैं। आप यहां किसी भाषा को लॉक भी कर सकते हैं.';

  @override
  String get languageSystem => 'प्रणालीगत चूक';

  @override
  String get languageThai => 'थाई';

  @override
  String get languageEnglish => 'अंग्रेज़ी';

  @override
  String get notificationsTooltip => 'अधिसूचना सेटिंग्स';

  @override
  String get enableMessageNotifications => 'संदेश सूचनाएं सक्षम करें';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 संदेश और ऑनलाइन लोग (स्थानीय अलर्ट)';

  @override
  String get networkMembersTooltip => 'नेटवर्क सदस्य';

  @override
  String get identityQrTooltip => 'पहचान / क्यूआर';

  @override
  String get feedDirects => 'बात करना';

  @override
  String get feedMesh => '#जाल';

  @override
  String get feedGeo => 'क्षेत्र';

  @override
  String get feedDirectsSubtitle => 'निजी E2EE संदेश';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'आस-पास के साथी (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'जियोहैश डिस्कवरी चैनल';

  @override
  String get peerIdHint =>
      'चैट शुरू करने के लिए रिसीवर आईडी (सार्वजनिक कुंजी हैश) चिपकाएँ';

  @override
  String get directsEmpty =>
      'अभी तक कोई चैट नहीं - शुरू करने के लिए एक क्यूआर स्कैन करें या एक रिसीवर आईडी पेस्ट करें\nसंदेशों को भेजने से पहले E2EE से सील कर दिया जाता है (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • चैट खोलने के लिए टैप करें';

  @override
  String get meshIntro =>
      'BLE रेंज में सहकर्मी - एक निजी E2EE चैट के लिए टैप करें (#mesh पर कोई सार्वजनिक रचना नहीं)\nहाइब्रिड राउटर के माध्यम से भेजा जाता है (BLE + LoRa + Nostr ऑनलाइन होने पर)';

  @override
  String get meshEmptyRunning =>
      'अभी तक कोई आस-पास कोई सहकर्मी नहीं है - BLE सीमा के भीतर किसी अन्य डिवाइस पर ऐप खोलें';

  @override
  String get meshEmptyStopped =>
      'BLE नहीं चल रहा है - ब्लूटूथ/स्थान की अनुमति दें';

  @override
  String get meshNearbyPrefix => 'आस-पास';

  @override
  String get meshRetentionTitle => 'संदेशों को स्वतः हटाएं';

  @override
  String get meshRetentionSubtitle =>
      'पुराना स्थानीय चैट इतिहास स्वचालित रूप से हटा दिया जाता है';

  @override
  String get meshRetentionKeep => 'रखना';

  @override
  String get meshRetention1Day => '1 दिन';

  @override
  String get meshRetention3Days => '3 दिन';

  @override
  String get meshRetention7Days => '7 दिन';

  @override
  String get refreshLocationTooltip => 'स्थान ताज़ा करें';

  @override
  String get geoIntro =>
      'इस जियोहैश में ऑनलाइन लोगों को 1:1 या एक क्षेत्र सार्वजनिक फैन-आउट के साथ संदेश भेजा जा सकता है (अभी भी प्रति व्यक्ति ई2ईई सील किया गया है - सादा पाठ नहीं)';

  @override
  String geoEmpty(String channel) {
    return '$channel में अभी तक कोई भी ऑनलाइन नहीं है\nट्रांसपोर्ट → इंटरनेट/ऑटो का उपयोग करें, Nostr की प्रतीक्षा करें, स्थान ताज़ा करें';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel में ऑनलाइन • 1:1 E2EE के लिए टैप करें';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'आस-पास (क्षेत्र की उपस्थिति की प्रतीक्षा में) • 1:1 E2EE के लिए टैप करें';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel में Nostr पर देखा गया • केवल खोज (विरासत)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'विरासती अनाम उपस्थिति - किसी बाध्य सहकर्मी या एक्सचेंज क्यूआर की प्रतीक्षा करें';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE पास में - 1:1 ई2ईई शुरू करने के लिए क्यूआर स्कैन करें';

  @override
  String get geoInternetDiscoverHint =>
      'क्षेत्र इंटरनेट खोज को Nostr कनेक्ट करने की आवश्यकता है (सेटिंग्स → ट्रांसपोर्ट → इंटरनेट/ऑटो)';

  @override
  String get geoEmptyNoLocation =>
      'स्थान अभी तक हल नहीं हुआ है - अपने जियोहैश को Nostr पर प्रकाशित करने के लिए जीपीएस और रिफ्रेश को अनुमति दें';

  @override
  String get geoEmptyNeedsPermission =>
      'स्थान की अनुमति अस्वीकृत - सेटिंग्स → गोपनीयता → स्थान में ResilNet की अनुमति दें';

  @override
  String get geoEmptyServicesDisabled =>
      'स्थान सेवाएँ बंद हैं - उन्हें सेटिंग्स में चालू करें';

  @override
  String get geoEmptyNoGpsFix =>
      'जीपीएस फिक्स नहीं मिल सका (Wi‑Fi आईपैड पर आम) - नीचे मैन्युअल रूप से जियोहैश सेट करें';

  @override
  String get geoEmptyTeleportHint =>
      'स्थान आइकन टैप करें → जियोहैश दर्ज करें (जैसे w5) → टेलीपोर्ट';

  @override
  String get geoSetGeohashManually => 'जियोहैश सेट करें';

  @override
  String get geoTeleportHint =>
      'कोई जीपीएस नहीं? जियोहैश उपसर्ग (2-7 वर्ण, उदाहरण के लिए w5) दर्ज करें और टेलीपोर्ट पर टैप करें';

  @override
  String get geoTeleportInvalid =>
      'अमान्य जियोहैश - केवल बेस32 अक्षरों/संख्याओं का उपयोग करें (उदाहरण के लिए w5 या w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'क्षेत्र $channel पर सेट किया गया';
  }

  @override
  String geoManualActive(String channel) {
    return 'मैनुअल क्षेत्र: $channel (जीपीएस रिफ्रेश ओवरराइड हो जाएगा)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr तैयार नहीं - पुनः कनेक्ट करें टैप करें (init सफल होने तक 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'ट्रांसपोर्ट केवल मेश है - Nostr से अधिक के साथियों को खोजने के लिए इंटरनेट या ऑटो पर स्विच करें';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel में अभी तक कोई नहीं - दोनों डिवाइस पर एरिया + इंटरनेट खुला रखें और ~60 सेकंड तक प्रतीक्षा करें';
  }

  @override
  String get geoChannelFallback => '#क्षेत्र';

  @override
  String get geoRefreshLocation => 'स्थान ताज़ा करें';

  @override
  String get settingsClearLocationTitle => 'स्थान साफ़ करें';

  @override
  String get settingsClearLocationSubtitle =>
      'जीपीएस/टेलीपोर्ट जियोहैश हटाएं (क्षेत्र #— बन जाता है)';

  @override
  String get settingsClearLocationConfirmTitle => 'स्थान साफ़ करें?';

  @override
  String get settingsClearLocationConfirmBody =>
      'इस डिवाइस पर संग्रहीत जियोहैश को हटा देता है। आप बाद में जीपीएस या टेलीपोर्ट को फिर से रीफ्रेश कर सकते हैं।';

  @override
  String get settingsClearLocationAction => 'स्थान साफ़ करें';

  @override
  String get settingsClearLocationSnack => 'स्थान साफ़ कर दिया गया';

  @override
  String get chatVoiceTooLarge => 'वॉइस नोट बहुत बड़ा - अधिकतम ~30 सेकंड';

  @override
  String get chatVoiceNeedInternet =>
      'वॉइस नोट के लिए इंटरनेट की आवश्यकता है (Nostr) - अकेले BLE के लिए बहुत बड़ा है';

  @override
  String get chatVoiceSentInternet => 'वॉयस नोट इंटरनेट के माध्यम से भेजा गया';

  @override
  String get noticeAnonMention => 'उल्लेख';

  @override
  String get noticeAnonDm => 'सीधा संदेश';

  @override
  String get noticeAnonHug => 'आलिंगन';

  @override
  String get noticeAnonSlap => 'थप्पड़';

  @override
  String get noticeAnonBlock => 'अवरोध पैदा करना';

  @override
  String get noticeAnonNeedKey =>
      'अभी तक कोई सार्वजनिक कुंजी नहीं - पहले 1:1 के लिए क्यूआर का आदान-प्रदान करें';

  @override
  String get noticeAnonActionSent => 'भेजा';

  @override
  String noticeAnonBlocked(String anon) {
    return 'अवरुद्ध $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* आलिंगन $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '*थप्पड़ $anon*';
  }

  @override
  String get geoReconnectNostr => 'Nostr पुनः कनेक्ट करें';

  @override
  String get nostrSectionTitle => 'Nostr रिले';

  @override
  String get nostrSectionSubtitle =>
      'इंटरनेट मैसेजिंग और एरिया डिस्कवरी इन रिले का उपयोग करते हैं। यदि स्थिति ऑफ़लाइन रहती है तो पुनः कनेक्ट करें टैप करें।';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'कनेक्टेड $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'ऑफ़लाइन - रिले सूचीबद्ध हैं लेकिन कोई भी कनेक्ट नहीं है';

  @override
  String get nostrStatusNotInit =>
      'प्रारंभ नहीं हुआ (0/0) - प्रारंभ करने के लिए पुन: कनेक्ट करें टैप करें';

  @override
  String get nostrReconnectAction => 'Nostr पुनः कनेक्ट करें';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr कनेक्टेड ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'अभी भी ऑफ़लाइन - Wi‑Fi/सेल्यूलर जांचें या पुनः प्रयास करें';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'विफल: $error';
  }

  @override
  String get nostrReconnecting => 'रिले से कनेक्ट हो रहा है...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'इंटरनेट (Nostr) $channel में • सीलबंद चैट तैयार';
  }

  @override
  String get transportModeTitle => 'क्षेत्रीय परिवहन';

  @override
  String get transportModeSubtitle =>
      'मेश = BLE पास में (रेडियो) जब कोई Nostr नहीं हो · इंटरनेट और ऑटो = Nostr लोगों की सूची';

  @override
  String get transportModeMesh => 'जाल';

  @override
  String get transportModeInternet => 'इंटरनेट';

  @override
  String get transportModeAuto => 'ऑटो';

  @override
  String get geoPublicHint => 'इस क्षेत्र में सभी को ऑनलाइन सार्वजनिक संदेश';

  @override
  String get geoPublicSend => 'जनता';

  @override
  String geoPublicHelp(int count) {
    return '$count ऑनलाइन साथियों को सीलबंद फैन-आउट - प्रत्येक को एक निजी लिफाफा मिलता है';
  }

  @override
  String geoPublicSent(int count) {
    return 'इस क्षेत्र में $count साथियों को भेजा गया';
  }

  @override
  String get geoPublicSentNone =>
      'ऑनलाइन संदेश देने योग्य कोई सहकर्मी नहीं - उन साथियों के साथ क्षेत्र/मेष खोलें जिनके पास चाबियाँ हैं, या BLE/Nostr की प्रतीक्षा करें';

  @override
  String get areaPublicBadge => 'क्षेत्र की जनता';

  @override
  String get geoErrorPermission => 'स्थान नहीं पढ़ सका - स्थान अनुमति जांचें';

  @override
  String get geoPrecisionRegion => 'क्षेत्र';

  @override
  String get geoPrecisionProvince => 'प्रांत';

  @override
  String get geoPrecisionCity => 'शहर';

  @override
  String get geoPrecisionNeighborhood => 'अड़ोस-पड़ोस';

  @override
  String get geoPrecisionBlock => 'अवरोध पैदा करना';

  @override
  String get aliasTitle => 'उपनाम सेट करें (संपर्क उपनाम)';

  @override
  String get aliasHintBody =>
      'यह उपनाम केवल इस डिवाइस पर संग्रहीत है (केवल स्थानीय)\nइसे कभी भी E2EE ट्रैफ़िक के साथ नहीं भेजा जाता है';

  @override
  String get aliasLabel => 'उपनाम';

  @override
  String get aliasHint => 'जैसे \"ग्राम प्रधान\", \"पी\'सोमचाई\"...';

  @override
  String get settingsDevices => 'उपकरण';

  @override
  String get settingsFirmwareTitle => 'ESP32 फर्मवेयर डाउनलोड/अपडेट करें';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin फ़ाइलें डाउनलोड करें और OTA के माध्यम से ESP32 बोर्ड को अपडेट करें';

  @override
  String get mtBridgeTitle => 'Meshtastic पुल';

  @override
  String get mtBridgeSettingsSubtitle =>
      'केवल टेक्स्ट ए/बी ब्रिज - ResilNet E2EE नहीं';

  @override
  String get mtBridgeIntro =>
      'छोटे प्लेनटेक्स्ट को Meshtastic और ResilNet के बीच ले जाएँ। मोड ए और बी एक ही समय में नहीं चल सकते। यह एंड-टू-एंड एन्क्रिप्शन नहीं है.';

  @override
  String get mtBridgeModeLabel => 'तरीका';

  @override
  String get mtBridgeModeOff => 'बंद';

  @override
  String get mtBridgeModeA => 'निगलना ए';

  @override
  String get mtBridgeModeB => 'निकास बी';

  @override
  String get mtBridgeModeOffShort => 'बंद';

  @override
  String get mtBridgeModeAShort => 'में एक';

  @override
  String get mtBridgeModeBShort => 'बाहर बी';

  @override
  String get mtBridgeMutexHint =>
      'एक मोड का चयन करने से दूसरा स्वचालित रूप से बंद हो जाता है। एक साथ A+B समर्थित नहीं है.';

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
      'इनबाउंड टेक्स्ट नोटिस के अंतर्गत #मेश्टास्टिक के रूप में दिखाई देता है। मेष रिले वैकल्पिक है (डिफ़ॉल्ट रूप से बंद)।';

  @override
  String get mtBridgeRelayTitle => 'ResilNet जाल पर भी रिले करें';

  @override
  String get mtBridgeRelayHint =>
      'चालू होने पर, हस्ताक्षरित सार्वजनिक बुलेटिन प्रसारित किए जाते हैं। बंद = केवल इस फ़ोन की सूचनाएँ।';

  @override
  String get mtBridgeSimulateHint => 'डेमो संदेश';

  @override
  String get mtBridgeSimulate => 'Meshtastic संदेश का अनुकरण करें';

  @override
  String get mtBridgeIngestOk => 'नोटिस में शामिल (#मेशटैस्टिक)';

  @override
  String get mtBridgeEgressWarning =>
      'चेतावनी: यहां भेजे गए संदेश ResilNet E2EE नहीं हैं। Meshtastic पथ पर कोई भी उन्हें पढ़ सकता है।';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'प्रकाशित करने के लिए पाठ';

  @override
  String get mtBridgeSend => 'Meshtastic पर भेजें';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic के लिए कतारबद्ध (लॉग/इतिहास देखें)';

  @override
  String get mtBridgeLastEgress => 'अंतिम निकास';

  @override
  String get mtBridgeEgressHistory => 'हालिया निकास';

  @override
  String get mtBridgeOffHint =>
      'ब्रिज का उपयोग करने के लिए इंजेस्ट (ए) या इग्रेस (बी) चालू करें।';

  @override
  String get mtBridgeNoticeBadge => 'मेशटैस्टिक · E2EE नहीं';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT परिवहन का उपयोग करें';

  @override
  String get mtBridgeUseMqttHint =>
      'बंद = केवल डेमो लॉगिंग (MQTT इनबाउंड पर ध्यान नहीं दिया गया)। कनेक्ट होने पर अंतर्ग्रहण/निकास के लिए चालू = MQTT।';

  @override
  String get mtBridgeMqttHost => 'ब्रोकर मेज़बान';

  @override
  String get mtBridgeMqttPort => 'पत्तन';

  @override
  String get mtBridgeMqttTls => 'टीएलएस (एमक्यूटीटीएस) का प्रयोग करें';

  @override
  String get mtBridgeMqttTlsHint =>
      'विशिष्ट पोर्ट 8883. सिस्टम प्रमाणपत्र का उपयोग करता है; हाथ मिलाने की त्रुटियों पर सॉफ्ट विफल रहता है।';

  @override
  String get mtBridgeMqttAutoReconnect => 'ऑटो जुड़े';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'चालू होने पर, क्लाइंट ड्रॉप के बाद पुनः कनेक्ट करने का प्रयास करता है। स्थिति पुनर्स्थापित होने तक कनेक्टिंग दिखाती है।';

  @override
  String get mtBridgeMqttTopicHelpers => 'विषय सहायक';

  @override
  String get mtBridgeMqttRegion => 'क्षेत्र उपसर्ग (वैकल्पिक)';

  @override
  String get mtBridgeMqttRegionHint =>
      'सेट होने पर, अप्लाई रूट को msh/<region>/2/json के रूप में पुनः बनाता है (विषय रूट को ओवरराइड करता है)।';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON विषय रूट';

  @override
  String get mtBridgeMqttDownlinkChannel => 'डाउनलिंक चैनल का नाम';

  @override
  String get mtBridgeMqttApplyTopics =>
      'रूट लागू करें → विषयों की सदस्यता लें/प्रकाशित करें';

  @override
  String get mtBridgeMqttAdvanced => 'उन्नत MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'टीएलएस, पुन: कनेक्ट, विषय, क्रेडेंशियल';

  @override
  String get mtBridgeMqttTopicIn => 'विषय की सदस्यता लें';

  @override
  String get mtBridgeMqttTopicOut => 'विषय प्रकाशित करें';

  @override
  String get mtBridgeMqttGatewayFrom => 'गेटवे नोड आईडी (से)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'दशमलव आईडी या !हेक्स - सेंडटेक्स्ट डाउनलिंक के लिए आवश्यक';

  @override
  String get mtBridgeMqttChannelIndex => 'मेष चैनल सूचकांक (वैकल्पिक 0-7)';

  @override
  String get mtBridgeMqttUser => 'उपयोगकर्ता नाम (वैकल्पिक)';

  @override
  String get mtBridgeMqttPass => 'पासवर्ड (वैकल्पिक)';

  @override
  String get mtBridgeMqttPassStored =>
      'इस डिवाइस पर एक पासवर्ड संग्रहीत है (दिखाया नहीं गया है)।';

  @override
  String get mtBridgeMqttPassReplace => 'नया पासवर्ड (रखने के लिए खाली छोड़ें)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'संग्रहीत पासवर्ड रखने के लिए खाली छोड़ दें।';

  @override
  String get mtBridgeMqttPassClear => 'पासवर्ड साफ़ करें';

  @override
  String get mtBridgeMqttSave => 'MQTT सेटिंग्स सहेजें';

  @override
  String get mtBridgeMqttSaved => 'MQTT सेटिंग्स सहेजी गईं';

  @override
  String get mtBridgeMqttConnect => 'जोड़ना';

  @override
  String get mtBridgeMqttDisconnect => 'डिस्कनेक्ट';

  @override
  String get mtBridgeMqttConnected => 'MQTT जुड़ा हुआ';

  @override
  String get mtBridgeMqttConnecting => 'MQTT कनेक्ट हो रहा है...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT डिस्कनेक्ट हो गया';

  @override
  String get mtBridgeMqttError => 'MQTT त्रुटि';

  @override
  String get mtBridgeErrModeIngest => 'सबसे पहले Ingest (A) पर स्विच करें';

  @override
  String get mtBridgeErrModeEgress => 'पहले इग्रेशन (बी) पर स्विच करें';

  @override
  String get mtBridgeErrRate => 'गति धीमी करें - दर सीमित है';

  @override
  String get mtBridgeErrDedupe => 'डुप्लिकेट संदेश पर ध्यान नहीं दिया गया';

  @override
  String get mtBridgeErrLoop => 'ब्रिज लूप को रोकने के लिए गिराया गया';

  @override
  String get mtBridgeErrEmpty => 'संदेश खाली है';

  @override
  String get mtBridgeErrPublish => 'प्रकाशन विफल';

  @override
  String get mtBridgeErrNotConnected => 'MQTT कनेक्ट नहीं है';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ब्रोकर होस्ट दर्ज करें';

  @override
  String get mtBridgeErrMissingTopic => 'सदस्यता लें और विषय प्रकाशित करें';

  @override
  String get mtBridgeErrMissingFromNode =>
      'सेंडटेक्स्ट के लिए गेटवे नोड आईडी (से) दर्ज करें';

  @override
  String get mtBridgeErrConnect => 'MQTT कनेक्ट विफल रहा';

  @override
  String get mtBridgeErrConnectTls => 'MQTT टीएलएस कनेक्ट विफल रहा';

  @override
  String get settingsData => 'डेटा';

  @override
  String get settingsDataHint =>
      'डेटाबेस को सिकोड़ने के लिए स्थानीय संदेशों को हटाएँ - पहचान, कुंजियाँ और सहकर्मी रखे जाते हैं';

  @override
  String get settingsSaveHistoryTitle => 'संदेश इतिहास सहेजें';

  @override
  String get settingsSaveHistorySubtitle =>
      'बंद होने पर, संदेश वायर पर E2EE रहते हैं और केवल इस सत्र के लिए रखे जाते हैं (स्थानीय चैट इतिहास में नहीं)। आपका अपना टेक्स्ट अभी भी इस डिवाइस पर प्लेनटेक्स्ट के रूप में दिखाई देता है।';

  @override
  String get settingsPrivacy => 'गोपनीयता';

  @override
  String get settingsE2eeTitle => 'एंड-टू-एंड एन्क्रिप्शन';

  @override
  String get settingsE2eeSubtitle =>
      'हमेशा चालू - संदेश भेजने से पहले RSA-OAEP + AES-GCM से सील कर दिए जाते हैं। रिले और आस-पास के हॉप्स सामग्री नहीं पढ़ सकते।';

  @override
  String get settingsScreenshotTitle => 'स्क्रीनशॉट अलर्ट';

  @override
  String get settingsScreenshotSubtitle =>
      'जब यह डिवाइस स्क्रीन कैप्चर करता है तो चैट में एक सिस्टम लाइन दिखाएं';

  @override
  String get settingsNostrExpiryTitle => 'Nostr संदेश समय रखें';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr के माध्यम से ऑनलाइन होने पर सीलबंद लिफाफे स्थानीय स्तर पर कितने समय तक रहने चाहिए';

  @override
  String get noticeExpiresIn => 'में समाप्त होना';

  @override
  String get noticesTitle => 'नोटिस';

  @override
  String get noticesMeshIntro =>
      'सार्वजनिक बुलेटिन - रेडियो रेंज में सभी के लिए दृश्यमान, एन्क्रिप्टेड नहीं। यह फ़ोन-टू-फ़ोन ऑफ़लाइन हो जाता है, और पास के ResilNet रिले बॉक्स एक प्रति रखते हैं ताकि बाद में आने वाले लोग इसे देख सकें।';

  @override
  String get noticesMeshPublicBadge => 'सार्वजनिक · एन्क्रिप्टेड नहीं';

  @override
  String get noticesGeoIntro =>
      'इस स्थान के लिए संक्षिप्त नोट्स जोड़ें ताकि अन्य आगंतुक उन्हें ढूंढ सकें।';

  @override
  String get noticesEmpty => 'अभी तक कोई नोटिस नहीं';

  @override
  String get noticesEmptyHint =>
      'यहां आसपास के लोगों के लिए पहला नोटिस पिन करें।';

  @override
  String get noticesComposeHint => 'एक नोटिस पोस्ट करें...';

  @override
  String get noticesUrgent => 'अति आवश्यक';

  @override
  String get noticesOpen => 'नोटिस';

  @override
  String get screenshotTaken => '*आपने स्क्रीनशॉट लिया*';

  @override
  String get chatAttachImage => 'छवि संलग्न करें';

  @override
  String get chatImageLabel => 'छवि';

  @override
  String get chatImageTooLarge => 'छवि बहुत बड़ी है - कोई अन्य फ़ोटो आज़माएँ';

  @override
  String get chatNostrExpiry => 'Nostr रखें';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel पर भेजें - सार्वजनिक';
  }

  @override
  String get settingsClearTitle => 'सभी संदेश साफ़ करें';

  @override
  String get settingsClearSubtitle => 'इस डिवाइस पर सभी चैट हटाएं';

  @override
  String get settingsClearConfirmTitle => 'सभी संदेश साफ़ करें?';

  @override
  String get settingsClearConfirmBody =>
      'इससे इस डिवाइस पर मौजूद सभी चैट संदेश हटा दिए जाते हैं.\nसाथियों और उपनामों को नहीं हटाया जाता है.';

  @override
  String get settingsClearAction => 'स्पष्ट डेटा';

  @override
  String get settingsClearedSnack => 'डेटा साफ़ किया गया';

  @override
  String settingsVersion(String version) {
    return 'संस्करण $version';
  }

  @override
  String get meshBleScanning => 'BLE: नोड्स के लिए स्कैनिंग';

  @override
  String get meshBleEsp32Scanning => 'ESP32: नजदीकी नोड की तलाश में';

  @override
  String get meshBleSyncing => 'BLE: ESP32 के साथ सिंक हो रहा है';

  @override
  String get meshNostrPublishing => 'Nostr: प्रकाशन';

  @override
  String get meshBleIdle => 'BLE मेश ऑन - अभी तक कोई आस-पास का फ़ोन नहीं है';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE मेश - $count फ़ोन पास में';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: अनुमति आवश्यक है';

  @override
  String get meshBlePausedCamera =>
      'BLE कैमरे के लिए रोका गया - प्रारंभ करें BLE टैप करें';

  @override
  String get meshBleStopped =>
      'BLE बंद है - जांचें कि ब्लूटूथ चालू है, फिर स्टार्ट BLE पर टैप करें';

  @override
  String get meshBleRestart => 'BLE प्रारंभ करें';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'बीटी $bt · लोक $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'अनुमतियाँ जाँचें और BLE प्रारंभ करें';

  @override
  String get meshNostrOffline => 'Nostr ऑफ़लाइन';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count आस-पास के साथी • LoRa $lora • सिंक ~${meters}m';
  }

  @override
  String get meshLoraReady => 'तैयार';

  @override
  String get meshLoraNotReady => 'तैयार नहीं है';

  @override
  String meshGatewayProgress(String label) {
    return 'गेटवे यूडीपी: $label';
  }

  @override
  String get meshGatewayReady => 'गेटवे यूडीपी: तैयार';

  @override
  String get permissionTitle =>
      'BLE मेश नेटवर्क शुरू करने के लिए एक्सेस की अनुमति दें';

  @override
  String get permissionBody =>
      'ऐप को सामुदायिक संदेश भेजने के लिए ब्लूटूथ (स्कैन / कनेक्ट / विज्ञापन), स्थान (पुराने एंड्रॉइड डिवाइस के लिए), और माइक्रोफ़ोन (चैट और घोषणाओं में वॉयस नोट्स के लिए) की आवश्यकता होती है।';

  @override
  String get permissionE2ee =>
      'एंड-टू-एंड एन्क्रिप्शन (E2EE)\nरिले नोड्स संदेश सामग्री नहीं पढ़ सकते';

  @override
  String get permissionReady => 'अनुमतियाँ तैयार';

  @override
  String get permissionRequest => 'अनुमति दें और जारी रखें';

  @override
  String get permissionNotReadySnack =>
      'सिस्टम अभी तैयार नहीं है - एक क्षण प्रतीक्षा करें और पुनः प्रयास करें';

  @override
  String get permissionDeniedSnack =>
      'अनुमतियाँ अपूर्ण - सेटिंग्स > ResilNet खोलें और ब्लूटूथ/स्थान/माइक्रोफ़ोन की अनुमति दें';

  @override
  String get permissionMicDenied =>
      'माइक्रोफ़ोन पहुंच अस्वीकृत - सेटिंग्स में इसे वॉयस नोट्स रिकॉर्ड करने की अनुमति दें';

  @override
  String get permissionMicOpenSettings => 'सेटिंग्स';

  @override
  String get permissionCameraDenied =>
      'कैमरा एक्सेस अस्वीकृत - इसे सेटिंग्स में क्यूआर कोड स्कैन करने की अनुमति दें';

  @override
  String get permissionCameraFailed =>
      'क्यूआर कोड को स्कैन करने के लिए कैमरे की अनुमति आवश्यक है';

  @override
  String get permissionCameraOpenSettings => 'सेटिंग्स';

  @override
  String get permissionPhotosDenied =>
      'फोटो लाइब्रेरी का उपयोग अस्वीकृत - अपने क्यूआर कोड को सहेजने के लिए सेटिंग्स में इसकी अनुमति दें';

  @override
  String get permissionPhotosFailed =>
      'आपके QR कोड को सहेजने के लिए फोटो लाइब्रेरी की अनुमति आवश्यक है';

  @override
  String get permissionPhotosOpenSettings => 'सेटिंग्स';

  @override
  String permissionFailedSnack(String error) {
    return 'अनुमति अनुरोध विफल: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet आर्किटेक्चर • स्टोर-एंड-फॉरवर्ड मल्टी-हॉप';

  @override
  String get onboardingSkip => 'छोडना';

  @override
  String get onboardingNext => 'अगला';

  @override
  String get onboardingStart => 'शुरू हो जाओ';

  @override
  String get onboardingWelcomeTitle => 'ResilNet में आपका स्वागत है';

  @override
  String get onboardingWelcomeBody =>
      'ResilNet पर मेश नेटवर्क पर चैट करें - इंटरनेट के बिना भी';

  @override
  String get onboardingFriendsTitle => 'आसानी से मित्र जोड़ें';

  @override
  String get onboardingFriendsBody =>
      'पहचान से एक क्यूआर साझा करें, या सार्वजनिक कुंजी का आदान-प्रदान करने के लिए किसी मित्र के क्यूआर को स्कैन करें';

  @override
  String get onboardingChannelsTitle => 'एन्क्रिप्टेड चैट + आस-पास के चैनल';

  @override
  String get onboardingChannelsBody =>
      'आस-पास के साथियों को ढूंढने के लिए #मेश / एरिया (जियोहैश) स्विच करें - संदेश BLE मेश और Nostr पर E2EE रहते हैं';

  @override
  String get chatTitle => 'चैट (E2EE)';

  @override
  String get chatScanTooltip => 'किसी सहकर्मी को जोड़ने के लिए QR स्कैन करें';

  @override
  String get chatBlockTooltip => 'इस प्रेषक को ब्लॉक करें';

  @override
  String get chatBlockedSnack => 'अवरुद्ध: कोई सूचना नहीं / कोई रिले नहीं';

  @override
  String get chatAliasTooltip => 'उपनाम सेट करें';

  @override
  String get chatReceiverPemLabel => 'प्राप्तकर्ता सार्वजनिक कुंजी (पीईएम)';

  @override
  String get chatReceiverPemHint =>
      'अपने मित्र की सार्वजनिक कुंजी चिपकाएँ (QR/साझा फ़ाइल से)';

  @override
  String get chatNeedPeerKey =>
      'पहले इस सहकर्मी के क्यूआर को स्कैन करें (सत्यापित सार्वजनिक कुंजी आवश्यक है)';

  @override
  String get chatPeerKeyMismatch =>
      'संग्रहीत सार्वजनिक कुंजी इस सहकर्मी आईडी से मेल नहीं खाती';

  @override
  String chatVoiceFailed(String error) {
    return 'ऑडियो रिकॉर्ड नहीं किया जा सका: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'वॉइस नोट नहीं चलाया जा सका: $error';
  }

  @override
  String get chatPlayVoice => 'वॉइस नोट चलायें';

  @override
  String get chatPauseVoice => 'विराम';

  @override
  String get chatVoiceLabelSent => '🎤 वॉयस नोट (सीलबंद)';

  @override
  String get chatVoiceLabel => '🎤 वॉयस नोट';

  @override
  String get chatDecryptFailed => '[डिक्रिप्शन विफल]';

  @override
  String chatSentSealed(String preview) {
    return '[सीलबंद • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[मुहरबंद]';

  @override
  String get chatComposeHint => 'एक संदेश टाइप करें... (भेजने पर मुहरबंद)';

  @override
  String get chatEmptyThread =>
      'अभी तक कोई संदेश नहीं\nमेश पर भेजने के लिए नीचे टाइप करें';

  @override
  String chatLoadFailed(String error) {
    return 'वार्तालाप लोड नहीं किया जा सका: $error';
  }

  @override
  String get chatEmojiTooltip => 'इमोजी';

  @override
  String get statusPending => 'लंबित';

  @override
  String get statusSent => 'भेजा';

  @override
  String get statusRelayed => 'रिले';

  @override
  String get statusDelivered => 'पहुंचा दिया';

  @override
  String get statusRead => 'पढ़ना';

  @override
  String get statusFailed => 'असफल';

  @override
  String get chatCopy => 'प्रतिलिपि';

  @override
  String get chatDeleteLocal => 'इस डिवाइस पर हटाएँ';

  @override
  String get chatDeletedLocalSnack => 'इस डिवाइस पर हटा दिया गया';

  @override
  String get chatRetry => 'पुन: प्रयास करें';

  @override
  String get chatSendFailed => 'डिलीवर नहीं हुआ - पुनः प्रयास करें टैप करें';

  @override
  String get chatImageNeedInternet =>
      'छवियाँ भेजने के लिए इंटरनेट से कनेक्ट करें';

  @override
  String get chatImageTooLargeOnline =>
      'भेजने के लिए छवि को पर्याप्त रूप से संपीड़ित नहीं किया जा सका';

  @override
  String get chatOpenLinkFailed => 'लिंक नहीं खुल सका';

  @override
  String get identityTitle => 'पहचान';

  @override
  String get identityScanTooltip => 'कैमरे से QR स्कैन करें';

  @override
  String get identityCopiedHash => 'सार्वजनिक कुंजी हैश की प्रतिलिपि बनाई गई';

  @override
  String get identityPeerSaved => 'सहकर्मी को QR से बचाया गया';

  @override
  String get identityGalleryDenied => 'फ़ोटो लाइब्रेरी की अनुमति अस्वीकृत';

  @override
  String get identityQrSaved => 'क्यूआर को फोटो लाइब्रेरी में सहेजा गया';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR सहेजा नहीं जा सका: $error';
  }

  @override
  String get peersTitle => 'नेटवर्क सदस्य';

  @override
  String get qrScanTitle => 'किसी मित्र को जोड़ने के लिए QR स्कैन करें';

  @override
  String get qrInvalid => 'स्कैन विफल: अमान्य QR';

  @override
  String get qrIdKeyMismatch =>
      'क्यूआर अस्वीकृत: आईडी सार्वजनिक कुंजी से मेल नहीं खाती';

  @override
  String get qrCameraNotReady => 'कैमरा तैयार नहीं है';

  @override
  String get qrRetrySettings => 'पुनः प्रयास करें/सेटिंग्स खोलें';

  @override
  String qrCameraOpenFailed(String error) {
    return 'कैमरा नहीं खुल सका: $error';
  }

  @override
  String get qrScanAlignHint => 'QR कोड को फ़्रेम के अंदर संरेखित करें';

  @override
  String get firmwareDownloadTitle => 'ESP32 फर्मवेयर डाउनलोड करें';

  @override
  String get firmwareSourceOnline => 'नवीनतम (ऑनलाइन)';

  @override
  String get firmwareSourceCached => 'सहेजी गई प्रति (ऑफ़लाइन)';

  @override
  String get firmwareSourceBaseline => 'बंडल बेसलाइन (ऑफ़लाइन)';

  @override
  String get firmwareSourceUnavailable => 'कोई फ़र्मवेयर उपलब्ध नहीं है';

  @override
  String get firmwareBaselineIncompatible =>
      'बंडल फर्मवेयर बहुत पुराना है - नया संस्करण डाउनलोड करने के लिए इंटरनेट से कनेक्ट करें';

  @override
  String get firmwareChecksumFailed =>
      'फ़र्मवेयर अखंडता जांच में विफल रहा - फ़्लैशिंग अवरुद्ध';

  @override
  String firmwareReadyFromSource(String source) {
    return 'फ़र्मवेयर तैयार: $source';
  }

  @override
  String get peersRefreshTooltip => 'ताज़ा करना';

  @override
  String get peersBlocked => 'अवरोधित';

  @override
  String peersNearbyBle(Object ble) {
    return 'आस-पास (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'हाल ही में ऑनलाइन';

  @override
  String get peersOnlineInArea => 'क्षेत्र में ऑनलाइन';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes मिनट पहले देखा गया';
  }

  @override
  String get peersOffline => 'ऑफलाइन';

  @override
  String peersBlockedSnack(String id) {
    return 'अवरुद्ध $id';
  }

  @override
  String get peersUnblockedSnack => 'अनब्लॉक किया';

  @override
  String get peersEmpty =>
      'डेटाबेस में अभी तक कोई सदस्य नहीं है\nQR स्कैन करें या BLE जाल खोज की प्रतीक्षा करें';

  @override
  String get peersOpenChat => 'चैट खोलें';

  @override
  String get peersBlockAction => 'अवरोध पैदा करना';

  @override
  String get peersUnblockAction => 'अनब्लॉक';

  @override
  String get channelPickerTooltip => 'चैट/#मेष/क्षेत्र';

  @override
  String get locationPickerTooltip => 'स्थान चैनल';

  @override
  String get transportPickerTooltip => 'मेश/इंटरनेट/ऑटो';

  @override
  String get onlinePeopleTooltip => 'लोग ऑनलाइन';

  @override
  String get unreadDirectsTooltipEmpty => 'निजी संदेश';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count अपठित निजी संदेश';
  }

  @override
  String get onlinePeopleTitle => 'लोग';

  @override
  String get onlinePeopleEmpty => 'यहां अभी तक कोई भी ऑनलाइन नहीं है';

  @override
  String onlinePeopleCount(int count) {
    return '$count ऑनलाइन';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · आस-पास + क्षेत्र';

  @override
  String get peerOnlineMeshTitle => 'जाली पर पास में कोई है';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name जाल के पास है';
  }

  @override
  String get peerOnlineAreaTitle => 'क्षेत्र में कोई व्यक्ति ऑनलाइन है';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr के माध्यम से ऑनलाइन है';
  }

  @override
  String get locationSheetTitle => '#स्थान चैनल';

  @override
  String get channelPinsTitle => 'पिन की गई';

  @override
  String get channelPinsHint =>
      'आपके द्वारा अक्सर उपयोग किए जाने वाले चैनलों को पिन करें - वे शीर्ष पर रहते हैं';

  @override
  String get channelPinTooltip => 'इस चैनल को पिन करें';

  @override
  String get channelUnpinTooltip => 'अनपिन';

  @override
  String get locationSheetIntro =>
      'मोटे जियोहैश का उपयोग करके आस-पास के लोगों से चैट करें - सटीक जीपीएस नहीं। इंटरनेट पर उपस्थिति अज्ञात Nostr कुंजियों का उपयोग करती है।';

  @override
  String get locationMeshSubtitle => '#ब्लूटूथ • ~10-50 मी';

  @override
  String get locationTeleportHint => '#जियोहैश';

  @override
  String get locationTeleport => 'टेलीपोर्ट';

  @override
  String homeComposeHint(String channel) {
    return 'संदेश $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel पर भेजें - सार्वजनिक';
  }

  @override
  String get messageExpiryTitle => 'में समाप्त होना';

  @override
  String get voiceRecordTapToStart =>
      'ध्वनि संदेश रिकॉर्ड करने के लिए टैप करें';

  @override
  String get voiceRecordTooShort =>
      'रिकॉर्डिंग बहुत छोटी है - पुनः प्रयास करें';

  @override
  String get voiceRecordFailed =>
      'रिकॉर्डिंग सहेजी नहीं जा सकी - पुनः प्रयास करें';

  @override
  String get voicePttHold => 'रिकॉर्ड करने के लिए दबाए रखें';

  @override
  String get voicePttRelease => 'पूर्वावलोकन के लिए रिलीज़ करें';

  @override
  String get voicePttRecording => 'रिकॉर्डिंग...';

  @override
  String get voicePttDraftReady => 'वॉइस नोट तैयार';

  @override
  String get voicePttDiscard => 'खारिज करना';

  @override
  String get voicePttReRecord => 'फिर से रिकॉर्ड करें';

  @override
  String get voicePttSend => 'वॉइस नोट भेजें';

  @override
  String get voicePttPlayPreview => 'पूर्वावलोकन चलायें';

  @override
  String get voicePttStopPreview => 'पूर्वावलोकन बंद करो';

  @override
  String get noticesBackfilling => 'नोटिस लोड हो रहा है...';

  @override
  String get noticesNostrOnline => 'Nostr ऑनलाइन';

  @override
  String get noticesNostrOffline =>
      'Nostr ऑफ़लाइन - बुलेटिन के लिए इंटरनेट की आवश्यकता है';

  @override
  String noticesBackfillLoaded(int count) {
    return 'लोड किए गए $count नोटिस';
  }

  @override
  String get noticePublishFailed =>
      'एरिया बोर्ड को नोटिस प्रकाशित नहीं किया जा सका. Nostr कनेक्शन जांचें.';

  @override
  String get noticeMeshPublishNoLink =>
      'स्थानीय स्तर पर सहेजा गया. नजदीकी मेश रेडियो (या Wi‑Fi गेटवे) से कनेक्ट करें ताकि अन्य लोग इसे प्राप्त कर सकें।';

  @override
  String noticeMeshPublishSent(int count) {
    return 'बुलेटिन BLE से अधिक निकटवर्ती डिवाइसों पर $count भेजा गया।';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'आस-पास के रेडियो देखे गए, लेकिन BLE लिखना विफल रहा। दोनों ऐप्स को नोटिस स्क्रीन पर खुला रखें और पुनः प्रयास करें (या ESP32 रिले का उपयोग करें)।';

  @override
  String get noticeMeshPublishNoGatt =>
      'इस डिवाइस का BLE रिसीवर तैयार नहीं है। ब्लूटूथ टॉगल करें और नोटिस दोबारा खोलें।';

  @override
  String get noticeDelete => 'नोटिस हटाएँ';

  @override
  String get noticeDeleteConfirmTitle => 'यह नोटिस हटाएं?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'यह इसे केवल इस डिवाइस पर हटाता है. जिन अन्य लोगों को यह पहले ही प्राप्त हो चुका है वे अब भी इसे देखेंगे।';

  @override
  String get noticeDeleted => 'नोटिस हटा दिया गया';

  @override
  String get chatNoticeHidden => 'क्षेत्र सूचना - खुली सूचनाएँ';

  @override
  String get identityDisplayNameTitle => 'प्रदर्शित होने वाला नाम';

  @override
  String get identitySaveName => 'नाम सहेजें';

  @override
  String get identityUserIdLabel => 'उपयोगकर्ता आईडी (सार्वजनिक कुंजी हैश)';

  @override
  String get identityCopyHashTooltip => 'सार्वजनिक कुंजी हैश कॉपी करें';

  @override
  String get identityMyQrTitle => 'मेरा क्यूआर (आईडी + पबकी + नाम)';

  @override
  String identityQrFailed(String error) {
    return 'क्यूआर नहीं बनाया जा सका\n$error';
  }

  @override
  String get identitySaving => 'सहेजा जा रहा है...';

  @override
  String get identitySaveQr => 'क्यूआर को फोटो लाइब्रेरी में सेव करें';

  @override
  String get identityOpenScanner => 'क्यूआर स्कैन करने के लिए कैमरा खोलें';

  @override
  String get identityQrHelp =>
      'अपनी सार्वजनिक कुंजी को सहेजने के लिए किसी मित्र से इसे स्कैन करने को कहें और (यदि आवश्यक हो) आपको सत्यापित जारीकर्ता के रूप में सेट करें';

  @override
  String get identityChatTip =>
      'युक्ति: आप E2EE के लिए सार्वजनिक कुंजी जोड़ने के लिए चैट में QR भी स्कैन कर सकते हैं';

  @override
  String get infoOpen => 'के बारे में / जानकारी';

  @override
  String get docsGuideTitle => 'उपयोगकर्ता गाइड';

  @override
  String get docsGuideSubtitle => 'ब्राउज़र में खुलता है';

  @override
  String get docsOpenAction => 'गाइड खोलें';

  @override
  String get docsOpenFailed => 'उपयोगकर्ता मार्गदर्शिका नहीं खुल सकी';

  @override
  String get firmwareOtaGuideTitle => 'फ्लैश गाइड और ओटीए प्रोटोकॉल';

  @override
  String get firmwareOtaGuideSubtitle =>
      'वेब गाइड खोलता है - .bin डाउनलोड और पूर्ण चरण';

  @override
  String get firmwareWebDownloadsTitle => 'फ़र्मवेयर वेब पर डाउनलोड होता है';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'दस्तावेज़ साइट पर प्रति-संस्करण लिंक और चेकसम';

  @override
  String get inviteCopyShortLink => 'संक्षिप्त लिंक कॉपी करें';

  @override
  String get inviteShareLink => 'लिंक शेयर करें';

  @override
  String get inviteShowFullLink => 'पूरा लिंक';

  @override
  String get inviteCopyFullLink => 'पूरा लिंक कॉपी करें';

  @override
  String get inviteLinkCopied => 'लिंक कॉपी किया गया';

  @override
  String get inviteLongPressHint => 'लिंक क्रियाओं के लिए देर तक दबाएँ';

  @override
  String get inviteSendInChat => 'ResilNet चैट में भेजें…';

  @override
  String get inviteSendInChatHint =>
      'केवल वे लोग जिनके लिए आपके पास पहले से ही सार्वजनिक कुंजी है';

  @override
  String get inviteSendInChatEmpty =>
      'अभी तक कोई संदेश योग्य चैट नहीं है.\nपहले QR स्कैन करें, एरिया/मेश खोलें, या ऐप के बाहर लिंक साझा करें।';

  @override
  String get inviteSentToChat => 'चैट में आमंत्रण भेजा गया';

  @override
  String get infoTabInfo => 'जानकारी';

  @override
  String get infoTabSettingsHint =>
      'भाषा, E2EE और डेटा टूल के लिए मेनू से सेटिंग्स खोलें';

  @override
  String get infoHowToTitle => 'का उपयोग कैसे करें';

  @override
  String get infoHowToBody =>
      '• चैट / #मेश / एरिया स्विच करने के लिए चैनल आइकन पर टैप करें\n• जियोहैश आकार चुनने के लिए जगह पर टैप करें\n• सदस्यों या ऑनलाइन कौन है, इसके लिए लोगों पर टैप करें\n• व्यक्तिगत रूप से चाबियों का आदान-प्रदान करने के लिए ⋮ से पहचान/क्यूआर खोलें\n• क्षेत्र \"सार्वजनिक\" प्रत्येक ऑनलाइन सहकर्मी को सीलबंद E2EE भेजता है - प्लेनटेक्स्ट रूम नहीं';

  @override
  String get infoFeaturesTitle => 'विशेषताएँ';

  @override
  String get infoFeatureOffline =>
      'ब्लूटूथ लो एनर्जी के माध्यम से ऑफ़लाइन संदेश';

  @override
  String get infoFeatureE2ee =>
      'आरएसए-ओएईपी + एईएस-जीसीएम के साथ एंड-टू-एंड एन्क्रिप्शन (शोर नहीं)';

  @override
  String get infoFeatureMultihop =>
      'संदेश आस-पास के साथियों के माध्यम से दूर तक जा सकते हैं';

  @override
  String get infoFeatureBridge =>
      'सीलबंद लिफाफों के लिए हाइब्रिड जाल ↔ इंटरनेट (Nostr)।';

  @override
  String get infoFeatureGeo =>
      'आसपास के लोगों के लिए स्थानीय जियोहैश चैनल (डिस्कवरी यूएक्स)';

  @override
  String get infoFeatureNotices =>
      '#मेष और क्षेत्र के लिए समाप्ति के साथ नोटिस';

  @override
  String get infoPrivacyTitle => 'गोपनीयता';

  @override
  String get infoPrivacyNoRoom =>
      'वायर पर कोई प्लेनटेक्स्ट गांव/सार्वजनिक चैट रूम नहीं';

  @override
  String get infoPrivacyFanout =>
      'क्षेत्र भेजना = ज्ञात सार्वजनिक कुंजी वाले साथियों को सीलबंद 1:1 फैन-आउट';

  @override
  String get infoPrivacyPresence =>
      'इंटरनेट क्षेत्र की उपस्थिति अल्पकालिक Nostr कुंजियों का उपयोग करती है';

  @override
  String get infoSymbolsTitle => 'प्रतीक';

  @override
  String get infoSymBle => 'सीधा ब्लूटूथ लिंक';

  @override
  String get infoSymMesh => 'जाल के माध्यम से पहुंच योग्य (अन्य आगे)';

  @override
  String get infoSymInternet => 'इंटरनेट के माध्यम से (Nostr) - सीलबंद लिफाफे';

  @override
  String get infoSymBridge => 'मेश↔इंटरनेट ब्रिज पथ के माध्यम से पहुंचे';

  @override
  String get infoSymOffline => 'ऑफ़लाइन - अभी पहुंच योग्य नहीं है';

  @override
  String get infoSymInArea => 'इस स्थान चैनल के क्षेत्र में';

  @override
  String get infoSymE2eeOk => 'एंड-टू-एंड एन्क्रिप्टेड सत्र';

  @override
  String get infoSymE2eeFail => 'एन्क्रिप्शन अनुपलब्ध - संवेदनशील पाठ न भेजें';

  @override
  String get infoSymVerified => 'पहचान सत्यापित/ज्ञात कुंजी';

  @override
  String get infoSymBlocked => 'अवरोधित';

  @override
  String get infoSymUnread => 'अपठित निजी संदेश';

  @override
  String get infoEmergencyTitle => 'आपात मोड';

  @override
  String get infoEmergencyBody =>
      'इस डिवाइस पर संदेशों, कुंजियों और पहचान को मिटाने के लिए होम स्क्रीन पर ResilNet शीर्षक पर तीन बार टैप करें।';

  @override
  String get infoLegendNote =>
      'स्पष्टता के लिए कुछ पथ चिह्न यहां प्रलेखित हैं; चैट में डिलीवरी टिक प्राथमिक प्रेषण स्थिति बनी रहती है।';

  @override
  String get dangerZoneTitle => 'खतरा क्षेत्र';

  @override
  String get dangerZoneSubtitle =>
      'इस डिवाइस पर संदेश, एन्क्रिप्शन कुंजी, Nostr पहचान, समकक्ष और उपनाम हटा देता है। आप फिर से सेटअप करेंगे.';

  @override
  String get panicWipeTitle => 'आपातकालीन वाइप';

  @override
  String get panicWipeSubtitle =>
      'स्थानीय सब कुछ मिटा दें - होम शीर्षक को ट्रिपल-टैप करने के समान (डबल-टैप रेडियो को ताज़ा करता है)';

  @override
  String get panicWipeConfirmTitle => 'सभी स्थानीय डेटा मिटा दें?';

  @override
  String get panicWipeConfirmBody =>
      'यह इस फ़ोन पर चैट, कुंजियाँ और पहचान को स्थायी रूप से हटा देता है।\nसाथियों को आपकी नई पहचान के साथ QR कुंजियों का पुनः आदान-प्रदान करना होगा।\nइसे असंपादित नहीं किया जा सकता है।';

  @override
  String get panicWipeAction => 'सब कुछ पोंछ डालो';

  @override
  String get panicWipeSnack =>
      'स्थानीय पहचान मिटा दी गई - फिर से स्थापित की गई';

  @override
  String panicWipeFailed(String error) {
    return 'वाइप विफल: $error';
  }

  @override
  String get meshBridgeTitle => 'जाल पुल';

  @override
  String get meshBridgeSubtitle =>
      'चालू (डिफ़ॉल्ट) होने पर, सीलबंद लिफाफे BLE मेश और इंटरनेट (Nostr) दोनों का एक साथ उपयोग कर सकते हैं ताकि आस-पास के मेश द्वीप जुड़ सकें। बंद होने पर, केवल एक पथ का उपयोग करें - कभी भी तार पर सादा पाठ न डालें।';

  @override
  String get favoritesTitle => 'पसंदीदा';

  @override
  String get favoritesAdd => 'पसंदीदा में जोड़े';

  @override
  String get favoritesRemove => 'पसंदीदा से हटाएँ';

  @override
  String get favoritesEmpty =>
      'अभी तक कोई पसंदीदा नहीं - सदस्य सूची से किसी सहकर्मी को तारांकित करें';

  @override
  String get favoritesNearbyTitle => 'पास में पसंदीदा';

  @override
  String favoritesNearbyBody(String name) {
    return '$name जाल के पास है';
  }

  @override
  String get favoritesInAreaTitle => 'क्षेत्र में पसंदीदा';

  @override
  String favoritesInAreaBody(String name) {
    return '$name इस क्षेत्र में ऑनलाइन है';
  }

  @override
  String get topologyTitle => 'मेष टोपोलॉजी';

  @override
  String get topologySubtitle =>
      'मेश अनाउंसमेंट से पीयर और कनेक्शन संकेत (केवल पढ़ने के लिए)';

  @override
  String get topologyConnectedNow => 'अभी कनेक्ट किया गया है (BLE)';

  @override
  String get topologyNearby => 'आस-पास (BLE)';

  @override
  String get topologyKnown => 'परिचित साथियों';

  @override
  String get topologyEmpty =>
      'अभी तक किसी साथी ने नहीं सीखा है - BLE के साथ पास में रहें';

  @override
  String get topologyYou => 'आप';

  @override
  String topologyStats(int peers, int links) {
    return '$peers सहकर्मी · $links लिंक';
  }

  @override
  String get topologyGraphHint =>
      'निकटवर्ती जाल खोज से अनुमान लगाया गया - आपका उपकरण हाइलाइट किया गया है। चैट खोलने के लिए किसी सहकर्मी को टैप करें.';

  @override
  String get topologyOpen => 'मेष टोपोलॉजी';

  @override
  String get slashHelpTitle => 'आदेश';

  @override
  String get slashHelpBody =>
      '/सहायता - यह सूची\n/कौन - वर्तमान चैनल में ऑनलाइन लोग\n/ड्रॉप <टेक्स्ट> - यहां एक सीलबंद नोटिस पिन करें (ई2ईई फैन-आउट)\n\nपूरी गाइड: नीचे ओपन गाइड का उपयोग करें, या सेटिंग्स → उपयोगकर्ता गाइड का उपयोग करें।';

  @override
  String get slashWhoEmpty => 'अभी इस चैनल पर कोई भी ऑनलाइन नहीं है';

  @override
  String slashWhoTitle(int count) {
    return 'ऑनलाइन ($count)';
  }

  @override
  String get slashDropNeedText => 'उपयोग: /अपना नोट टेक्स्ट छोड़ें';

  @override
  String slashDropDone(String channel) {
    return '$channel पर नोटिस हटा दिया गया';
  }

  @override
  String get slashUnknown => 'अज्ञात आदेश - प्रयास करें / सहायता करें';

  @override
  String get announceOpen => 'घोषणाएं';

  @override
  String get announceTitle => 'घोषणाएं';

  @override
  String get announceEmpty =>
      'अभी तक कोई बोर्ड नहीं - बंद या खुली सूचनाएं पोस्ट करने के लिए एक बनाएं';

  @override
  String get announceCreate => 'बोर्ड बनाएं';

  @override
  String get announceCreateHint => 'बोर्ड का नाम';

  @override
  String get announceDefaultTitle => 'सामुदायिक बोर्ड';

  @override
  String get announceSettings => 'बोर्ड सेटिंग';

  @override
  String get announceAllowLocked =>
      'लॉक की गई (एन्क्रिप्टेड) ​​पोस्ट की अनुमति दें';

  @override
  String get announceAllowLockedSub =>
      'बोर्ड कुंजी को एन्क्रिप्ट किया गया - पाठकों को पहुंच की आवश्यकता है';

  @override
  String get announceAllowOpen => 'खुली (सादा पाठ) पोस्ट की अनुमति दें';

  @override
  String get announceAllowOpenSub =>
      'E2EE नहीं - मेश/रिले पर पढ़ने योग्य। डिफ़ॉल्ट रूप से बंद.';

  @override
  String get announceComposeHint => 'एक घोषणा लिखें...';

  @override
  String get announceMediaInternetOnly =>
      'फ़ोटो/आवाज़ घोषणाएँ इंटरनेट पर भेजी जाती हैं (BLE नहीं)';

  @override
  String get announceNeedInternet =>
      'फ़ोटो या ध्वनि घोषणाएँ भेजने के लिए इंटरनेट से कनेक्ट करें';

  @override
  String announceVoiceFailed(String error) {
    return 'आवाज़ रिकॉर्ड नहीं की जा सकी: $error';
  }

  @override
  String get announceImageTooLarge => 'छवि बहुत बड़ी है (अधिकतम ~180 KB)';

  @override
  String get announcePlayVoice => 'वॉइस नोट चलायें';

  @override
  String get announceImageLabel => '📷छवि';

  @override
  String get announceAudioLabel => '🎤 वॉयस नोट';

  @override
  String get announceModeLocked => 'बंद';

  @override
  String get announceModeOpen => 'खुला';

  @override
  String get announceOpenBadge => 'खुला · एन्क्रिप्टेड नहीं';

  @override
  String get announceLockedBadge => 'बंद';

  @override
  String get announceLockedPlaceholder =>
      'एन्क्रिप्टेड - पढ़ने के लिए पहुंच का अनुरोध करें';

  @override
  String get announceRequestAccess => 'अनुरोध का उपयोग';

  @override
  String get announceRequestSent => 'प्रवेश अनुरोध बोर्ड स्वामी को भेजा गया';

  @override
  String get announceRequestFailed =>
      'पहुंच का अनुरोध नहीं किया जा सका (स्वामी की सार्वजनिक कुंजी की आवश्यकता है)';

  @override
  String get announceOpenConfirmTitle => 'एन्क्रिप्शन के बिना पोस्ट करें?';

  @override
  String get announceOpenConfirmBody =>
      'खुली पोस्ट E2EE नहीं हैं. रास्ते पर कोई भी व्यक्ति (मेष/रिले) उन्हें पढ़ सकता है। जारी रखना?';

  @override
  String get announcePostAction => 'डाक';

  @override
  String get announcePendingRequests => 'प्रवेश अनुरोध';

  @override
  String get announceApprove => 'मंज़ूरी देना';

  @override
  String get announceDeny => 'अस्वीकार करना';

  @override
  String get announceGranted => 'आप इस बोर्ड पर लॉक की गई पोस्ट पढ़ सकते हैं';

  @override
  String get announceOwner => 'आप इस बोर्ड के स्वामी हैं';

  @override
  String get announceCopyInvite => 'आमंत्रण पाठ कॉपी करें';

  @override
  String get announceShowInviteQr => 'आमंत्रण QR दिखाएं';

  @override
  String get announceScanInviteQr => 'स्कैन बोर्ड आमंत्रण QR';

  @override
  String get announceFollow => 'आमंत्रण से बोर्ड का अनुसरण करें';

  @override
  String get announceFollowHint =>
      'स्वामी की ओर से आमंत्रण पाठ या ResilNet लिंक चिपकाएँ';

  @override
  String get announceFollowOk => 'निम्नलिखित बोर्ड';

  @override
  String announceFollowOkNamed(String title) {
    return 'अब \"$title\" का अनुसरण कर रहे हैं';
  }

  @override
  String get announceFollowFail => 'आमंत्रण अमान्य या क्षतिग्रस्त है';

  @override
  String get announceInviteCopied => 'आमंत्रण पाठ कॉपी किया गया';

  @override
  String get announceInviteSaveQr => 'QR सहेजें';

  @override
  String get announceInviteShare => 'आमंत्रण साझा करें';

  @override
  String get announceFollowFromCompose =>
      'संदेश बॉक्स में बोर्ड आमंत्रण का पता चला';

  @override
  String get peerConfirmAddTitle => 'नेटवर्क सदस्य जोड़ें?';

  @override
  String peerConfirmAddBody(String name) {
    return 'उनकी सार्वजनिक कुंजी के साथ \"$name\" जोड़ें ताकि आप उन्हें निजी तौर पर संदेश भेज सकें?';
  }

  @override
  String get peerConfirmAdd => 'सदस्य जोड़ें';

  @override
  String peerAddedOk(String name) {
    return '$name को नेटवर्क सदस्यों में जोड़ा गया';
  }

  @override
  String get peerAddFromCompose =>
      'संदेश बॉक्स में पहचान/सार्वजनिक कुंजी का पता चला';

  @override
  String get peerHashCopied => 'सार्वजनिक कुंजी हैश की प्रतिलिपि बनाई गई';

  @override
  String get peerHashOpenChat => 'चैट खोलें';

  @override
  String get peerHashAddHint =>
      'हैश कॉपी किया गया. उनसे अपना पहचान लिंक या क्यूआर साझा करने के लिए कहें ताकि आप E2EE के लिए पूर्ण सार्वजनिक कुंजी जोड़ सकें।';

  @override
  String get peerQrNoCode => 'इस छवि में कोई ResilNet QR नहीं मिला';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet पहचान: \"$name\"\nलिंक खोलें या इसे चैट में पेस्ट करें → सदस्य जोड़ें\nया पहचान QR स्कैन करें.';
  }

  @override
  String get identityShareInvite => 'पहचान लिंक साझा करें';

  @override
  String get identityInviteCopied => 'पहचान लिंक कॉपी किया गया';

  @override
  String announceInviteSharePreamble(String title) {
    return 'बोर्ड आमंत्रण: \"$title\"\nResilNet खोलें → सामुदायिक बोर्ड → आमंत्रण से अनुसरण करें\nया क्यूआर स्कैन करें/नीचे दिए गए लिंक पर टैप करें।';
  }

  @override
  String get announceConfirmFollowTitle => 'इस बोर्ड का अनुसरण करें?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'इस आमंत्रण से \"$title\" का अनुसरण करें?';
  }

  @override
  String get announceConfirmFollow => 'अनुसरण करना';
}

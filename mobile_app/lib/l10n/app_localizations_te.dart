// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'రిఫ్రెష్ అవుతోంది ResilNet...';

  @override
  String get appRefreshed =>
      'రిఫ్రెష్ చేయబడింది — రేడియోలు మరియు ఆవిష్కరణ పునఃప్రారంభించబడింది';

  @override
  String appRefreshFailed(String error) {
    return 'రిఫ్రెష్ విఫలమైంది: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'రెండుసార్లు నొక్కండి = మృదువైన రిఫ్రెష్. లాంగ్ ప్రెస్ = హార్డ్ రికవరీ. ట్రిపుల్-ట్యాప్ = అత్యవసర తుడవడం.';

  @override
  String get softRefreshTipTitle => 'ResilNet కష్టంగా అనిపిస్తే';

  @override
  String get softRefreshTipBody =>
      'మృదువైన రేడియో రిఫ్రెష్ కోసం ResilNet (ఎగువ-ఎడమ) రెండుసార్లు నొక్కండి. ఇప్పటికీ నిలిచిపోయినట్లయితే: శీర్షికను ఎక్కువసేపు నొక్కి, ⋮ → హార్డ్ రికవర్ లేదా సెట్టింగ్‌లను ఉపయోగించండి. ట్రిపుల్ ట్యాప్ ఎమర్జెన్సీ వైప్ మాత్రమే.';

  @override
  String get softRefreshTipGotIt => 'అర్థమైంది';

  @override
  String get infoSoftRefreshTitle => 'యాప్ నిలిచిపోయినట్లు అనిపిస్తే';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet (ఎగువ-ఎడమ) → సాఫ్ట్ రిఫ్రెష్ రేడియోలు & సమీపంలోని వ్యక్తులను రెండుసార్లు నొక్కండి';

  @override
  String get infoSoftRefreshStepHard =>
      'ఇంకా చిక్కుకుపోయారా? శీర్షికను ఎక్కువసేపు నొక్కండి లేదా ⋮ / సెట్టింగ్‌లు → హార్డ్ రికవరీ';

  @override
  String get infoSoftRefreshStepWait =>
      'ఫలితం స్నాక్‌బార్ కోసం వేచి ఉండి, ఆపై మళ్లీ ప్రయత్నించండి. సెషన్ రీసెట్ మీ కీలను ఉంచుతుంది.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ట్రిపుల్-ట్యాప్ = ఎమర్జెన్సీ వైప్ (స్థానిక డేటాను తొలగిస్తుంది) — ఉద్దేశపూర్వకంగా మాత్రమే';

  @override
  String get appRecoverySection => 'యాప్ రికవరీ';

  @override
  String get appRecoverySectionSubtitle =>
      'యాప్ స్తంభించినట్లు అనిపించినప్పుడు ఉపయోగించండి. సాఫ్ట్ = టైటిల్ రెండుసార్లు నొక్కండి. హార్డ్ రికవరీ బలంగా ఉంది. సెషన్ రీసెట్ కీలను తుడిచివేయకుండా సేవలను పునఃప్రారంభిస్తుంది.';

  @override
  String get appHardRecoverAction => 'కోలుకోవడం కష్టం';

  @override
  String get appHardRecovering => 'కోలుకోవడం కష్టం…';

  @override
  String get appSessionResetAction => 'సెషన్‌ని రీసెట్ చేయండి';

  @override
  String get appSessionResetRunning => 'సెషన్‌ని రీసెట్ చేస్తోంది…';

  @override
  String get appSessionResetConfirmTitle => 'సెషన్‌ని రీసెట్ చేయాలా?';

  @override
  String get appSessionResetConfirmBody =>
      'ఈ పరికరంలో ResilNet సేవలను పునఃప్రారంభిస్తుంది. మీ గుర్తింపు కీలు ఉంచబడ్డాయి.';

  @override
  String get appRecoveryBusy => 'పునరుద్ధరణ ఇప్పటికే అమలవుతోంది…';

  @override
  String get appRecoveryOk => 'రికవరీ పూర్తయింది';

  @override
  String get appRecoveryPartial =>
      'స్కిప్ చేయబడిన కొన్ని దశలతో రికవరీ పూర్తయింది — ఇప్పటికీ నిలిచిపోయినట్లయితే మళ్లీ ప్రయత్నించండి';

  @override
  String get appRecoveryFailed =>
      'పునరుద్ధరణ విఫలమైంది - సెషన్ రీసెట్‌ని ప్రయత్నించండి లేదా OS నుండి యాప్‌ను బలవంతంగా నిష్క్రమించండి';

  @override
  String get localWifiTitle => 'స్థానిక Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ఇంటర్నెట్ లేకుండా సమీపంలోని పరికరాలను లింక్ చేయండి — ఒక LANలో ఉన్నట్లే.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa గేట్‌వే SoftAP కాదు. ఇది ఫోన్↔ఫోన్ / LAN మాత్రమే.';

  @override
  String get localWifiUnavailable =>
      'స్థానిక Wi‑Fi ఇంకా సిద్ధంగా లేదు — యాప్ ప్రారంభం కోసం వేచి ఉండండి.';

  @override
  String get lxmfBridgeTitle => 'హోమ్ నోడ్';

  @override
  String get lxmfBridgeSubtitle =>
      'సీల్డ్ చాట్‌లను ప్రసారం చేసే మీ Wi‑Fiలో ఐచ్ఛిక Mac లేదా Pi. డిఫాల్ట్‌గా ఆఫ్. ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్‌ను భర్తీ చేయదు.';

  @override
  String get lxmfBridgeEnable => 'హోమ్ నోడ్ ఉపయోగించండి';

  @override
  String get lxmfBridgeDisabledHint =>
      'ఈ నెట్‌వర్క్‌లో Mac లేదా Piలో బ్రిడ్జ్ యాప్ రన్ అవుతున్నప్పుడు మాత్రమే ఆన్ చేయండి.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ఆన్‌లైన్ — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'హోమ్ నోడ్‌ని చేరుకోవడం సాధ్యపడదు — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ఇంటి నోడ్ చిరునామా';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP లేదా http://IP:port — ఉదాహరణ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'పీర్ → LXMF డెస్ట్ (JSON)';

  @override
  String get lxmfBridgeRefresh => 'స్థితిని సేవ్ చేయండి & రిఫ్రెష్ చేయండి';

  @override
  String get lxmfBridgeLabHint => 'అధునాతనమైనది: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'హోమ్ నోడ్ సెట్టింగ్‌లు';

  @override
  String get lxmfBridgeCheckConnection => 'కనెక్షన్‌ని తనిఖీ చేయండి';

  @override
  String get lxmfBridgeStatusOnline => 'హోమ్ నోడ్‌కి కనెక్ట్ చేయబడింది';

  @override
  String get lxmfBridgeStatusOffline => 'హోమ్ నోడ్ అందుబాటులో లేదు';

  @override
  String get lxmfBridgeYourDest => 'ఈ నోడ్ చిరునామా (స్నేహితులతో పంచుకోండి)';

  @override
  String get lxmfBridgeCopyDest => 'చిరునామాను కాపీ చేయండి';

  @override
  String get lxmfBridgeDestCopied => 'చిరునామా కాపీ చేయబడింది';

  @override
  String get lxmfBridgeLinkedPeers => 'లింక్ చేసిన స్నేహితులు';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ప్రతి స్నేహితునికి వారి ఇంటి-నోడ్ చిరునామా ఒకసారి అవసరం. అప్పుడు సీల్డ్ చాట్‌లు ఈ మార్గాన్ని ఉపయోగించవచ్చు.';

  @override
  String get lxmfBridgeNoLinks => 'ఇంకా స్నేహితులు ఎవరూ లింక్ చేయబడలేదు.';

  @override
  String get lxmfBridgeAddLink => 'స్నేహితుడిని లింక్ చేయండి';

  @override
  String get lxmfBridgePickPeer => 'స్నేహితుడు';

  @override
  String get lxmfBridgePeerDest => 'వారి ఇంటి నోడ్ చిరునామా';

  @override
  String get lxmfBridgePeerDestHint =>
      'వారి హోమ్ నోడ్ స్క్రీన్ నుండి 32-అక్షరాల కోడ్';

  @override
  String get lxmfBridgeInvalidDest =>
      'ఆ చిరునామా చెల్లుబాటు అయ్యేలా లేదు. వారి హోమ్ నోడ్ నుండి పూర్తి కోడ్‌ను అతికించండి.';

  @override
  String get lxmfBridgeRemoveLink => 'అన్‌లింక్ చేయండి';

  @override
  String get lxmfBridgeSaveLink => 'సేవ్ చేయండి';

  @override
  String get lxmfBridgeLinkSaved => 'స్నేహితుడు లింక్ చేయబడింది';

  @override
  String get lxmfBridgeNoPeers =>
      'ఇంకా మెసేజ్ చేయదగిన పరిచయాలు లేవు — ముందుగా స్నేహితుడిని జోడించండి.';

  @override
  String get lxmfBridgeHelp =>
      'Mac/Piలో వంతెనను నడుపుతూ ఉండండి. ఈ మార్గం మీ LANలో ఉంటుంది — ఇది LoRa కాదు మరియు ఇంటర్నెట్ లేదా బ్లూటూత్ మెష్‌ని భర్తీ చేయదు.';

  @override
  String get localWifiModeHotspot => 'సమీపంలో';

  @override
  String get localWifiModeRouter => 'రూటర్';

  @override
  String get localWifiHotspotIntro =>
      'ఒక పరికరం వ్యక్తిగత హాట్‌స్పాట్‌ను షేర్ చేస్తుంది. ఇతరులు ఆ హాట్‌స్పాట్‌లో చేరారు, ఆపై ResilNet వారిని స్థానిక నెట్‌వర్క్‌లో కనుగొంటారు.';

  @override
  String get localWifiHostAction => 'నెట్‌వర్క్‌ని సృష్టించండి (హోస్ట్)';

  @override
  String get localWifiJoinAction => 'నెట్‌వర్క్‌లో చేరండి';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android సెట్టింగ్‌లను తెరిచి, వ్యక్తిగత హాట్‌స్పాట్ (లేదా ఇంటర్నెట్ షేరింగ్) ఆన్ చేయండి.\n2. స్నేహితులకు హాట్‌స్పాట్ పేరు (మరియు పాస్‌వర్డ్) చెప్పండి.\n3. ఇక్కడకు తిరిగి వచ్చి, “హాట్‌స్పాట్ ఆన్‌లో ఉంది — వేచి ఉండడం ప్రారంభించండి” నొక్కండి.';

  @override
  String get localWifiHostReady =>
      'హాట్‌స్పాట్ ఆన్‌లో ఉంది — వేచి ఉండటం ప్రారంభించండి';

  @override
  String get localWifiHostWaiting => 'స్నేహితులు చేరడం కోసం వేచి ఉంది…';

  @override
  String get localWifiJoinSteps =>
      '1. సిస్టమ్ సెట్టింగ్‌లను తెరిచి, మీ స్నేహితుని వ్యక్తిగత హాట్‌స్పాట్‌లో చేరండి.\n2. ఇక్కడకు తిరిగి వచ్చి, \"నేను కనెక్ట్ అయ్యాను - శోధన\" నొక్కండి.';

  @override
  String get localWifiJoinReady => 'నేను కనెక్ట్ అయ్యాను - శోధన';

  @override
  String get localWifiRouterIntro =>
      'ప్రతి పరికరాన్ని అదే Wi‑Fi రూటర్/APకి కనెక్ట్ చేయండి. రూటర్‌కు ఇంటర్నెట్ అవసరం లేదు — భాగస్వామ్య స్థానిక నెట్‌వర్క్ మాత్రమే.';

  @override
  String get localWifiRouterSearch => 'ఈ Wi‑Fiలో శోధించండి';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi సమాచారాన్ని రిఫ్రెష్ చేయండి';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fiలో కాదు';

  @override
  String get localWifiRouterNoWifiBody =>
      'సిస్టమ్ సెట్టింగ్‌లలో రూటర్ యొక్క Wi‑Fiలో చేరండి, ఆపై మళ్లీ శోధించండి.';

  @override
  String get localWifiDiscovering => 'స్థానిక Wi‑Fiలో శోధిస్తోంది...';

  @override
  String get localWifiPeersFound => 'ఈ నెట్‌వర్క్‌లోని పరికరాలు';

  @override
  String get localWifiStop => 'ఆపు';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi పేరు అందుబాటులో లేదు';

  @override
  String get localWifiStubBanner => 'LAN సాకెట్ కోసం వేచి ఉంది…';

  @override
  String get localWifiLiveBanner =>
      'LAN డిస్కవరీ లైవ్ (UDP) — ఈ Wi‑Fiలో + సీల్డ్ చాట్‌ని ప్రకటించండి';

  @override
  String get localWifiEmptyHotspot =>
      'ఇంకా పరికరాలు లేవు.\nస్నేహితులు మీ హాట్‌స్పాట్‌లో చేరారని మరియు స్థానిక నెట్‌వర్క్ యాక్సెస్‌ను అనుమతించారని తనిఖీ చేయండి.';

  @override
  String get localWifiEmptyRouter =>
      'ఇంకా పరికరాలు లేవు.\nఅదే SSID? స్థానిక నెట్‌వర్క్ అనుమతించబడుతుందా? కొన్ని రౌటర్లు డివైజ్-టు-డివైస్ ట్రాఫిక్‌ను బ్లాక్ చేస్తాయి (AP ఐసోలేషన్).';

  @override
  String get localWifiIsolationHelp => 'మనం ఒకరినొకరు ఎందుకు కనుగొనలేము?';

  @override
  String get localWifiIsolationTitle => 'రూటర్ ఖాతాదారులను వేరుచేయవచ్చు';

  @override
  String get localWifiIsolationBody =>
      'AP/క్లయింట్ ఐసోలేషన్ (లేదా అతిథి నెట్‌వర్క్) ఆన్‌లో ఉంటే, అదే Wi‑Fiలో ఉన్న ఫోన్‌లు మాట్లాడలేవు. ఐసోలేషన్‌ను ఆఫ్ చేయండి, ప్రధాన SSIDని ఉపయోగించండి లేదా సమీప (హాట్‌స్పాట్) మోడ్‌కి మారండి.';

  @override
  String get localWifiPeerReady => 'చాట్ చేయడానికి సిద్ధంగా ఉంది (కీ ఉంది)';

  @override
  String get localWifiPeerNeedKey =>
      'కనుగొనబడింది - కీలను మార్పిడి చేయడానికి QRని స్కాన్ చేయండి';

  @override
  String get localWifiErrorTitle => 'స్థానిక Wi‑Fi లోపం';

  @override
  String get localWifiErrorBody =>
      'ఏదో తప్పు జరిగింది. ఆపి మళ్లీ ప్రయత్నించండి.';

  @override
  String get preparingSystem => 'వ్యవస్థను సిద్ధం చేస్తోంది...';

  @override
  String get bootFailedTitle => 'ప్రారంభం కాలేదు';

  @override
  String get retry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get bootRecoveryAction =>
      'కొత్త గుర్తింపును ప్రారంభించండి (స్థానిక డేటాను తొలగించండి)';

  @override
  String get bootRecoveryConfirmTitle => 'కొత్త గుర్తింపును ప్రారంభించాలా?';

  @override
  String get bootRecoveryConfirmBody =>
      'ఇది ఈ పరికరంలోని స్థానిక చాట్‌లు, కీలు మరియు గుర్తింపును శాశ్వతంగా తొలగిస్తుంది.\nసహచరులు మీ కొత్త గుర్తింపుతో మీ QRని మళ్లీ స్కాన్ చేయాలి.\nఇది రద్దు చేయబడదు.';

  @override
  String get bootRecoveryRunning => 'స్థానిక గుర్తింపును రీసెట్ చేస్తోంది...';

  @override
  String get bootRecoverySuccess => 'స్థానిక గుర్తింపు రీసెట్ పూర్తయింది';

  @override
  String bootRecoveryFailed(String error) {
    return 'గుర్తింపును రీసెట్ చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get save => 'సేవ్ చేయండి';

  @override
  String get close => 'మూసివేయి';

  @override
  String get start => 'ప్రారంభించండి';

  @override
  String get send => 'పంపండి';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get language => 'భాష';

  @override
  String get languageSubtitle =>
      'డిఫాల్ట్‌గా యాప్ మీ ఫోన్ భాషను అనుసరిస్తుంది (మద్దతు ఉన్నప్పుడు). ఇతర భాషలు తిరిగి ఇంగ్లీషులోకి వస్తాయి. మీరు ఇక్కడ భాషను కూడా లాక్ చేయవచ్చు.';

  @override
  String get languageSystem => 'సిస్టమ్ డిఫాల్ట్';

  @override
  String get languageThai => 'థాయ్';

  @override
  String get languageEnglish => 'ఇంగ్లీష్';

  @override
  String get notificationsTooltip => 'నోటిఫికేషన్ సెట్టింగ్‌లు';

  @override
  String get enableMessageNotifications =>
      'సందేశ నోటిఫికేషన్‌లను ప్రారంభించండి';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 సందేశాలు మరియు ఆన్‌లైన్ వ్యక్తులు (స్థానిక హెచ్చరికలు)';

  @override
  String get networkMembersTooltip => 'నెట్‌వర్క్ సభ్యులు';

  @override
  String get identityQrTooltip => 'గుర్తింపు / QR';

  @override
  String get feedDirects => 'చాట్ చేయండి';

  @override
  String get feedMesh => '#మెష్';

  @override
  String get feedGeo => 'ప్రాంతం';

  @override
  String get feedDirectsSubtitle => 'ప్రైవేట్ E2EE సందేశాలు';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'సమీపంలోని సహచరులు (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'జియోహాష్ డిస్కవరీ ఛానెల్';

  @override
  String get peerIdHint =>
      'చాట్‌ని ప్రారంభించడానికి రిసీవర్ ID (పబ్లిక్ కీ హాష్)ని అతికించండి';

  @override
  String get directsEmpty =>
      'ఇంకా చాట్‌లు లేవు — ప్రారంభించడానికి QRని స్కాన్ చేయండి లేదా రిసీవర్ IDని అతికించండి\nపంపే ముందు సందేశాలు E2EEతో సీలు చేయబడతాయి (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • చాట్ తెరవడానికి నొక్కండి';

  @override
  String get meshIntro =>
      'BLE పరిధిలో సహచరులు — ప్రైవేట్ E2EE చాట్ కోసం నొక్కండి (#meshలో పబ్లిక్ కంపోజ్ లేదు)\nహైబ్రిడ్ రూటర్ ద్వారా పంపుతుంది (BLE + LoRa + Nostr ఆన్‌లైన్‌లో ఉన్నప్పుడు)';

  @override
  String get meshEmptyRunning =>
      'సమీపంలోని సహచరులు లేరు — BLE పరిధిలోని మరొక పరికరంలో యాప్‌ని తెరవండి';

  @override
  String get meshEmptyStopped =>
      'BLE అమలులో లేదు — బ్లూటూత్ / స్థాన అనుమతిని మంజూరు చేయండి';

  @override
  String get meshNearbyPrefix => 'సమీపంలో';

  @override
  String get meshRetentionTitle => 'సందేశాలను స్వయంచాలకంగా తొలగించండి';

  @override
  String get meshRetentionSubtitle =>
      'పాత స్థానిక చాట్ చరిత్ర స్వయంచాలకంగా తీసివేయబడుతుంది';

  @override
  String get meshRetentionKeep => 'ఉంచండి';

  @override
  String get meshRetention1Day => '1 రోజు';

  @override
  String get meshRetention3Days => '3 రోజులు';

  @override
  String get meshRetention7Days => '7 రోజులు';

  @override
  String get refreshLocationTooltip => 'స్థానాన్ని రిఫ్రెష్ చేయండి';

  @override
  String get geoIntro =>
      'ఈ జియోహాష్‌లో ఆన్‌లైన్‌లో ఉన్న వ్యక్తులు 1:1కి లేదా పబ్లిక్ ఫ్యాన్-అవుట్‌తో మెసేజ్ చేయవచ్చు (ఇప్పటికీ పీర్‌కి E2EE అని సీలు చేయబడింది — సాదా వచనం కాదు)';

  @override
  String geoEmpty(String channel) {
    return '$channelలో ఇంకా ఎవరూ ఆన్‌లైన్‌లో లేరు\nరవాణా → ఇంటర్నెట్/ఆటోను ఉపయోగించండి, Nostr కోసం వేచి ఉండండి, స్థానాన్ని రిఫ్రెష్ చేయండి';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'ఆన్‌లైన్‌లో $channel • 1:1 E2EE కోసం నొక్కండి';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'సమీపంలో (ఏరియా ఉనికి కోసం వేచి ఉంది) • 1:1 E2EE కోసం నొక్కండి';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nostrలో $channelలో కనిపించింది • ఆవిష్కరణ మాత్రమే (లెగసీ)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'లెగసీ అనామక ఉనికి — కట్టుబడి ఉన్న పీర్ కోసం వేచి ఉండండి లేదా QR మార్పిడి చేయండి';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE సమీపంలో — 1:1 E2EEని ప్రారంభించడానికి QRని స్కాన్ చేయండి';

  @override
  String get geoInternetDiscoverHint =>
      'ఏరియా ఇంటర్నెట్ డిస్కవరీకి Nostr కనెక్ట్ కావాలి (సెట్టింగ్‌లు → రవాణా → ఇంటర్నెట్/ఆటో)';

  @override
  String get geoEmptyNoLocation =>
      'స్థానం ఇంకా పరిష్కరించబడలేదు — Nostrలో మీ జియోహాష్‌ను ప్రచురించడానికి GPSని అనుమతించండి మరియు రిఫ్రెష్ చేయండి';

  @override
  String get geoEmptyNeedsPermission =>
      'స్థాన అనుమతి నిరాకరించబడింది — సెట్టింగ్‌లు → గోప్యత → లొకేషన్‌లో ResilNetని అనుమతించండి';

  @override
  String get geoEmptyServicesDisabled =>
      'స్థాన సేవలు ఆఫ్‌లో ఉన్నాయి - వాటిని సెట్టింగ్‌లలో ఆన్ చేయండి';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS పరిష్కారాన్ని పొందడం సాధ్యపడలేదు (Wi‑Fi iPadలలో సాధారణం) — geohashని మాన్యువల్‌గా క్రింద సెట్ చేయండి';

  @override
  String get geoEmptyTeleportHint =>
      'స్థలం చిహ్నాన్ని నొక్కండి → జియోహాష్‌ను నమోదు చేయండి (ఉదా. w5) → టెలిపోర్ట్';

  @override
  String get geoSetGeohashManually => 'జియోహాష్‌ని సెట్ చేయండి';

  @override
  String get geoTeleportHint =>
      'GPS లేదా? జియోహాష్ ఉపసర్గను నమోదు చేయండి (2–7 అక్షరాలు, ఉదా. w5) మరియు టెలిపోర్ట్ నొక్కండి';

  @override
  String get geoTeleportInvalid =>
      'చెల్లని జియోహాష్ — బేస్ 32 అక్షరాలు/సంఖ్యలను మాత్రమే ఉపయోగించండి (ఉదా. w5 లేదా w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ప్రాంతం $channelకి సెట్ చేయబడింది';
  }

  @override
  String geoManualActive(String channel) {
    return 'మాన్యువల్ ప్రాంతం: $channel (GPS రిఫ్రెష్ ఓవర్‌రైడ్ అవుతుంది)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr సిద్ధంగా లేదు — మళ్లీ కనెక్ట్ చేయి నొక్కండి (init విజయవంతం అయ్యే వరకు 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'రవాణా అనేది మెష్-మాత్రమే — Nostr కంటే ఎక్కువ సహచరులను కనుగొనడానికి ఇంటర్నెట్ లేదా ఆటోకు మారండి';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channelలో ఇంకా ఎవరూ లేరు — రెండు పరికరాలలో ఏరియా + ఇంటర్నెట్‌ని తెరిచి ఉంచండి మరియు ~60లు వేచి ఉండండి';
  }

  @override
  String get geoChannelFallback => '#ప్రాంతం';

  @override
  String get geoRefreshLocation => 'స్థానాన్ని రిఫ్రెష్ చేయండి';

  @override
  String get settingsClearLocationTitle => 'స్థానాన్ని క్లియర్ చేయండి';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / టెలిపోర్ట్ జియోహాష్‌ని తీసివేయండి (ఏరియా #— అవుతుంది)';

  @override
  String get settingsClearLocationConfirmTitle => 'స్థానాన్ని క్లియర్ చేయాలా?';

  @override
  String get settingsClearLocationConfirmBody =>
      'ఈ పరికరంలో నిల్వ చేయబడిన జియోహాష్‌ను తొలగిస్తుంది. మీరు GPSని రిఫ్రెష్ చేయవచ్చు లేదా తర్వాత మళ్లీ టెలిపోర్ట్ చేయవచ్చు.';

  @override
  String get settingsClearLocationAction => 'స్థానాన్ని క్లియర్ చేయండి';

  @override
  String get settingsClearLocationSnack => 'స్థానం క్లియర్ చేయబడింది';

  @override
  String get chatVoiceTooLarge =>
      'వాయిస్ నోట్ చాలా పెద్దది — గరిష్టంగా ~30 సెకన్లు';

  @override
  String get chatVoiceNeedInternet =>
      'వాయిస్ నోట్‌కి ఇంటర్నెట్ అవసరం (Nostr) — BLEకి మాత్రమే చాలా పెద్దది';

  @override
  String get chatVoiceSentInternet => 'వాయిస్ నోట్ ఇంటర్నెట్ ద్వారా పంపబడింది';

  @override
  String get noticeAnonMention => 'ప్రస్తావన';

  @override
  String get noticeAnonDm => 'ప్రత్యక్ష సందేశం';

  @override
  String get noticeAnonHug => 'కౌగిలించుకో';

  @override
  String get noticeAnonSlap => 'చెంపదెబ్బ';

  @override
  String get noticeAnonBlock => 'నిరోధించు';

  @override
  String get noticeAnonNeedKey =>
      'ఇంకా పబ్లిక్ కీ లేదు — QRని ముందుగా 1:1కి మార్చుకోండి';

  @override
  String get noticeAnonActionSent => 'పంపబడింది';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon నిరోధించబడింది';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* కౌగిలింతలు $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* స్లాప్స్ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostrని మళ్లీ కనెక్ట్ చేయండి';

  @override
  String get nostrSectionTitle => 'Nostr రిలేలు';

  @override
  String get nostrSectionSubtitle =>
      'ఇంటర్నెట్ మెసేజింగ్ మరియు ఏరియా డిస్కవరీ ఈ రిలేలను ఉపయోగిస్తాయి. స్థితి ఆఫ్‌లైన్‌లో ఉంటే మళ్లీ కనెక్ట్ చేయి నొక్కండి.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total కనెక్ట్ చేయబడింది';
  }

  @override
  String get nostrStatusOffline =>
      'ఆఫ్‌లైన్ — రిలేలు జాబితా చేయబడ్డాయి కానీ ఏవీ కనెక్ట్ కాలేదు';

  @override
  String get nostrStatusNotInit =>
      'ప్రారంభించబడలేదు (0/0) — ప్రారంభించడానికి మళ్లీ కనెక్ట్ చేయి నొక్కండి';

  @override
  String get nostrReconnectAction => 'Nostrని మళ్లీ కనెక్ట్ చేయండి';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr కనెక్ట్ చేయబడింది ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ఇప్పటికీ ఆఫ్‌లైన్‌లో ఉంది — Wi‑Fi/సెల్యులార్‌ని తనిఖీ చేయండి లేదా మళ్లీ ప్రయత్నించండి';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'విఫలమైంది: $error';
  }

  @override
  String get nostrReconnecting => 'రిలేలకు కనెక్ట్ చేస్తోంది…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channelలో ఇంటర్నెట్ (Nostr) • సీల్డ్ చాట్ సిద్ధంగా ఉంది';
  }

  @override
  String get transportModeTitle => 'ఏరియా రవాణా';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE సమీపంలో (రేడియో) Nostr లేనప్పుడు · ఇంటర్నెట్ & ఆటో = Nostr వ్యక్తుల జాబితా';

  @override
  String get transportModeMesh => 'మెష్';

  @override
  String get transportModeInternet => 'ఇంటర్నెట్';

  @override
  String get transportModeAuto => 'ఆటో';

  @override
  String get geoPublicHint =>
      'ఈ ప్రాంతంలో ఆన్‌లైన్‌లో ప్రతి ఒక్కరికీ పబ్లిక్ సందేశం';

  @override
  String get geoPublicSend => 'పబ్లిక్';

  @override
  String geoPublicHelp(int count) {
    return '$count ఆన్‌లైన్ పీర్(లు)కి సీల్డ్ ఫ్యాన్-అవుట్ — ప్రతి ఒక్కరు ప్రైవేట్ ఎన్వలప్‌ని అందుకుంటారు';
  }

  @override
  String geoPublicSent(int count) {
    return 'ఈ ప్రాంతంలోని $count పీర్(లు)కి పంపబడింది';
  }

  @override
  String get geoPublicSentNone =>
      'ఆన్‌లైన్‌లో మెసేజ్ చేయదగిన పీర్‌లు లేరు — కీలను కలిగి ఉన్న పీర్‌లతో ఏరియా/మెష్ తెరవండి లేదా BLE/Nostr కోసం వేచి ఉండండి';

  @override
  String get areaPublicBadge => 'ఏరియా పబ్లిక్';

  @override
  String get geoErrorPermission =>
      'స్థానాన్ని చదవడం సాధ్యపడలేదు — స్థాన అనుమతిని తనిఖీ చేయండి';

  @override
  String get geoPrecisionRegion => 'ప్రాంతం';

  @override
  String get geoPrecisionProvince => 'ప్రావిన్స్';

  @override
  String get geoPrecisionCity => 'నగరం';

  @override
  String get geoPrecisionNeighborhood => 'ఇరుగుపొరుగు';

  @override
  String get geoPrecisionBlock => 'నిరోధించు';

  @override
  String get aliasTitle => 'మారుపేరును సెట్ చేయండి (సంప్రదింపు మారుపేరు)';

  @override
  String get aliasHintBody =>
      'ఈ మారుపేరు ఈ పరికరంలో మాత్రమే నిల్వ చేయబడుతుంది (స్థానికంగా మాత్రమే)\nఇది E2EE ట్రాఫిక్‌తో ఎప్పుడూ పంపబడదు';

  @override
  String get aliasLabel => 'మారుపేరు';

  @override
  String get aliasHint => 'ఉదా \"గ్రామాధికారి\", \"పి\'సోమ్‌చాయ్\"...';

  @override
  String get settingsDevices => 'పరికరాలు';

  @override
  String get settingsFirmwareTitle =>
      'ESP32 ఫర్మ్‌వేర్‌ను డౌన్‌లోడ్ / అప్‌డేట్ చేయండి';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ఫైల్‌లను డౌన్‌లోడ్ చేయండి మరియు OTA ద్వారా ESP32 బోర్డ్‌ను అప్‌డేట్ చేయండి';

  @override
  String get mtBridgeTitle => 'Meshtastic వంతెన';

  @override
  String get mtBridgeSettingsSubtitle =>
      'టెక్స్ట్-మాత్రమే A/B వంతెన — ResilNet E2EE కాదు';

  @override
  String get mtBridgeIntro =>
      'Meshtastic మరియు ResilNet మధ్య చిన్న సాదా వచనాన్ని తరలించండి. A మరియు B మోడ్‌లు ఒకే సమయంలో అమలు చేయబడవు. ఇది ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్ కాదు.';

  @override
  String get mtBridgeModeLabel => 'మోడ్';

  @override
  String get mtBridgeModeOff => 'ఆఫ్';

  @override
  String get mtBridgeModeA => 'ఇంజెస్ట్ ఎ';

  @override
  String get mtBridgeModeB => 'ఎగ్రెస్ బి';

  @override
  String get mtBridgeModeOffShort => 'ఆఫ్';

  @override
  String get mtBridgeModeAShort => 'A లో';

  @override
  String get mtBridgeModeBShort => 'అవుట్ బి';

  @override
  String get mtBridgeMutexHint =>
      'మోడ్‌ను ఎంచుకోవడం వలన మరొకటి స్వయంచాలకంగా ఆఫ్ అవుతుంది. ఏకకాలంలో A+Bకి మద్దతు లేదు.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'డెమో (లాగింగ్)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ఇన్‌బౌండ్ టెక్స్ట్ నోటీసుల క్రింద #meshtasticగా కనిపిస్తుంది. మెష్ రిలే ఐచ్ఛికం (డిఫాల్ట్‌గా ఆఫ్).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet మెష్‌పై కూడా రిలే చేయండి';

  @override
  String get mtBridgeRelayHint =>
      'ఆన్‌లో ఉన్నప్పుడు, సంతకం చేసిన పబ్లిక్ బులెటిన్‌లు ప్రసారం చేయబడతాయి. ఆఫ్ = ఈ ఫోన్ నోటీసులు మాత్రమే.';

  @override
  String get mtBridgeSimulateHint => 'డెమో సందేశం';

  @override
  String get mtBridgeSimulate => 'Meshtastic సందేశాన్ని అనుకరించండి';

  @override
  String get mtBridgeIngestOk => 'నోటీసులలోకి చేర్చబడింది (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'హెచ్చరిక: ఇక్కడ పంపిన సందేశాలు ResilNet E2EE కాదు. Meshtastic మార్గంలో ఉన్న ఎవరైనా వాటిని చదవగలరు.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'ప్రచురించడానికి వచనం';

  @override
  String get mtBridgeSend => 'Meshtasticకి పంపండి';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic కోసం క్యూలో ఉంది (లాగ్ / హిస్టరీని చూడండి)';

  @override
  String get mtBridgeLastEgress => 'చివరి ఎగ్రెస్';

  @override
  String get mtBridgeEgressHistory => 'ఇటీవలి నిష్క్రమణ';

  @override
  String get mtBridgeOffHint =>
      'వంతెనను ఉపయోగించడానికి ఇంజెస్ట్ (A) లేదా ఎగ్రెస్ (B)ని ఆన్ చేయండి.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE కాదు';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT రవాణాను ఉపయోగించండి';

  @override
  String get mtBridgeUseMqttHint =>
      'ఆఫ్ = డెమో లాగింగ్ మాత్రమే (MQTT ఇన్‌బౌండ్ విస్మరించబడింది). కనెక్ట్ చేసినప్పుడు ఇన్‌జెస్ట్/ఎగ్రెస్ కోసం ఆన్ = MQTT.';

  @override
  String get mtBridgeMqttHost => 'బ్రోకర్ హోస్ట్';

  @override
  String get mtBridgeMqttPort => 'పోర్ట్';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ఉపయోగించండి';

  @override
  String get mtBridgeMqttTlsHint =>
      'సాధారణ పోర్ట్ 8883. సిస్టమ్ సర్టిఫికేట్‌లను ఉపయోగిస్తుంది; హ్యాండ్‌షేక్ లోపాలపై సాఫ్ట్‌గా విఫలమవుతుంది.';

  @override
  String get mtBridgeMqttAutoReconnect => 'స్వయంచాలకంగా మళ్లీ కనెక్ట్ చేయండి';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ఆన్‌లో ఉన్నప్పుడు, క్లయింట్ డ్రాప్‌ల తర్వాత మళ్లీ కనెక్ట్ చేయడానికి ప్రయత్నిస్తుంది. పునరుద్ధరించబడే వరకు కనెక్ట్ అవుతున్నట్లు స్థితి చూపుతుంది.';

  @override
  String get mtBridgeMqttTopicHelpers => 'టాపిక్ సహాయకులు';

  @override
  String get mtBridgeMqttRegion => 'ప్రాంత ఉపసర్గ (ఐచ్ఛికం)';

  @override
  String get mtBridgeMqttRegionHint =>
      'సెట్ చేసినప్పుడు, msh/<region>/2/json (టాపిక్ రూట్‌ని ఓవర్‌రైడ్ చేస్తుంది) వలె రీబిల్డ్‌లను వర్తించు.';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON టాపిక్ రూట్';

  @override
  String get mtBridgeMqttDownlinkChannel => 'డౌన్‌లింక్ ఛానెల్ పేరు';

  @override
  String get mtBridgeMqttApplyTopics =>
      'రూట్‌ను వర్తింపజేయండి → సబ్‌స్క్రయిబ్ / టాపిక్‌లను ప్రచురించండి';

  @override
  String get mtBridgeMqttAdvanced => 'అధునాతన MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, రీకనెక్ట్, టాపిక్‌లు, ఆధారాలు';

  @override
  String get mtBridgeMqttTopicIn => 'సబ్స్క్రయిబ్ టాపిక్';

  @override
  String get mtBridgeMqttTopicOut => 'అంశాన్ని ప్రచురించండి';

  @override
  String get mtBridgeMqttGatewayFrom => 'గేట్‌వే నోడ్ ఐడి (నుండి)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'డెసిమల్ ఐడి లేదా !హెక్స్ — సెండ్‌టెక్స్ట్ డౌన్‌లింక్ కోసం అవసరం';

  @override
  String get mtBridgeMqttChannelIndex => 'మెష్ ఛానెల్ సూచిక (ఐచ్ఛికం 0–7)';

  @override
  String get mtBridgeMqttUser => 'వినియోగదారు పేరు (ఐచ్ఛికం)';

  @override
  String get mtBridgeMqttPass => 'పాస్‌వర్డ్ (ఐచ్ఛికం)';

  @override
  String get mtBridgeMqttPassStored =>
      'ఈ పరికరంలో పాస్‌వర్డ్ నిల్వ చేయబడింది (చూపబడలేదు).';

  @override
  String get mtBridgeMqttPassReplace =>
      'కొత్త పాస్‌వర్డ్ (ఉంచుకోవడానికి ఖాళీగా ఉంచండి)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'నిల్వ చేసిన పాస్‌వర్డ్‌ను ఉంచడానికి ఖాళీగా వదిలివేయండి.';

  @override
  String get mtBridgeMqttPassClear => 'పాస్వర్డ్ను క్లియర్ చేయండి';

  @override
  String get mtBridgeMqttSave => 'MQTT సెట్టింగ్‌లను సేవ్ చేయండి';

  @override
  String get mtBridgeMqttSaved => 'MQTT సెట్టింగ్‌లు సేవ్ చేయబడ్డాయి';

  @override
  String get mtBridgeMqttConnect => 'కనెక్ట్ చేయండి';

  @override
  String get mtBridgeMqttDisconnect => 'డిస్‌కనెక్ట్ చేయండి';

  @override
  String get mtBridgeMqttConnected => 'MQTT కనెక్ట్ చేయబడింది';

  @override
  String get mtBridgeMqttConnecting => 'MQTT కనెక్ట్ అవుతోంది…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT డిస్‌కనెక్ట్ చేయబడింది';

  @override
  String get mtBridgeMqttError => 'MQTT లోపం';

  @override
  String get mtBridgeErrModeIngest => 'ముందుగా Ingest (A)కి మారండి';

  @override
  String get mtBridgeErrModeEgress => 'ముందుగా ఎగ్రెస్ (B)కి మారండి';

  @override
  String get mtBridgeErrRate => 'స్లో డౌన్ - రేటు పరిమితం';

  @override
  String get mtBridgeErrDedupe => 'నకిలీ సందేశం విస్మరించబడింది';

  @override
  String get mtBridgeErrLoop =>
      'బ్రిడ్జ్ లూప్‌ను నిరోధించడానికి డ్రాప్ చేయబడింది';

  @override
  String get mtBridgeErrEmpty => 'సందేశం ఖాళీగా ఉంది';

  @override
  String get mtBridgeErrPublish => 'ప్రచురించడం విఫలమైంది';

  @override
  String get mtBridgeErrNotConnected => 'MQTT కనెక్ట్ కాలేదు';

  @override
  String get mtBridgeErrMissingHost => 'MQTT బ్రోకర్ హోస్ట్‌ని నమోదు చేయండి';

  @override
  String get mtBridgeErrMissingTopic =>
      'సబ్‌స్క్రైబ్ చేయండి మరియు టాపిక్‌లను ప్రచురించండి';

  @override
  String get mtBridgeErrMissingFromNode =>
      'సెండ్‌టెక్స్ట్ కోసం గేట్‌వే నోడ్ ఐడి (నుండి) నమోదు చేయండి';

  @override
  String get mtBridgeErrConnect => 'MQTT కనెక్ట్ చేయడం విఫలమైంది';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS కనెక్ట్ చేయడం విఫలమైంది';

  @override
  String get settingsData => 'డేటా';

  @override
  String get settingsDataHint =>
      'డేటాబేస్‌ను కుదించడానికి స్థానిక సందేశాలను తొలగించండి - గుర్తింపు, కీలు మరియు పీర్‌లు ఉంచబడతాయి';

  @override
  String get settingsSaveHistoryTitle => 'సందేశ చరిత్రను సేవ్ చేయండి';

  @override
  String get settingsSaveHistorySubtitle =>
      'ఆఫ్‌లో ఉన్నప్పుడు, సందేశాలు E2EE వైర్‌లో ఉంటాయి మరియు ఈ సెషన్ కోసం మాత్రమే ఉంచబడతాయి (స్థానిక చాట్ చరిత్రలో కాదు). మీ స్వంత వచనం ఇప్పటికీ ఈ పరికరంలో సాదా వచనంగా చూపబడుతుంది.';

  @override
  String get settingsPrivacy => 'గోప్యత';

  @override
  String get settingsE2eeTitle => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్';

  @override
  String get settingsE2eeSubtitle =>
      'ఎల్లప్పుడూ ఆన్‌లో ఉంటుంది — సందేశాలు పంపడానికి ముందు RSA-OAEP + AES-GCMతో సీలు చేయబడతాయి. రిలేలు మరియు సమీపంలోని హాప్‌లు కంటెంట్‌లను చదవలేవు.';

  @override
  String get settingsScreenshotTitle => 'స్క్రీన్‌షాట్ హెచ్చరికలు';

  @override
  String get settingsScreenshotSubtitle =>
      'ఈ పరికరం స్క్రీన్‌ను క్యాప్చర్ చేసినప్పుడు చాట్‌లో సిస్టమ్ లైన్‌ను చూపుతుంది';

  @override
  String get settingsNostrExpiryTitle => 'Nostr సందేశాన్ని ఉంచడానికి సమయం';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr ద్వారా ఆన్‌లైన్‌లో ఉన్నప్పుడు సీల్డ్ ఎన్వలప్‌లు స్థానికంగా ఎంతసేపు ఉండాలి';

  @override
  String get noticeExpiresIn => 'లో గడువు ముగుస్తుంది';

  @override
  String get noticesTitle => 'నోటీసులు';

  @override
  String get noticesMeshIntro =>
      'పబ్లిక్ బులెటిన్ — రేడియో పరిధిలో అందరికీ కనిపిస్తుంది, గుప్తీకరించబడలేదు. ఇది ఫోన్-టు-ఫోన్ ఆఫ్‌లైన్‌లో ఉంటుంది మరియు సమీపంలోని ResilNet రిలే బాక్స్‌లు కాపీని ఉంచుతాయి, తద్వారా తర్వాత వచ్చిన వ్యక్తులు ఇప్పటికీ దాన్ని చూస్తారు.';

  @override
  String get noticesMeshPublicBadge => 'పబ్లిక్ · ఎన్‌క్రిప్ట్ చేయబడలేదు';

  @override
  String get noticesGeoIntro =>
      'ఈ స్థలం కోసం చిన్న గమనికలను జోడించండి, తద్వారా ఇతర సందర్శకులు వాటిని కనుగొనగలరు.';

  @override
  String get noticesEmpty => 'ఇంకా నోటీసులు లేవు';

  @override
  String get noticesEmptyHint =>
      'చుట్టుపక్కల వ్యక్తుల కోసం మొదటి నోటీసును పిన్ చేయండి.';

  @override
  String get noticesComposeHint => 'నోటీసు పోస్ట్ చేయండి...';

  @override
  String get noticesUrgent => 'అత్యవసరము';

  @override
  String get noticesOpen => 'నోటీసులు';

  @override
  String get screenshotTaken => '*మీరు స్క్రీన్ షాట్ తీశారు*';

  @override
  String get chatAttachImage => 'చిత్రాన్ని అటాచ్ చేయండి';

  @override
  String get chatImageLabel => 'చిత్రం';

  @override
  String get chatImageTooLarge =>
      'చిత్రం చాలా పెద్దది — మరొక ఫోటోను ప్రయత్నించండి';

  @override
  String get chatNostrExpiry => 'Nostr ఉంచండి';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channelకి పంపండి — పబ్లిక్';
  }

  @override
  String get settingsClearTitle => 'అన్ని సందేశాలను క్లియర్ చేయండి';

  @override
  String get settingsClearSubtitle => 'ఈ పరికరంలోని అన్ని చాట్‌లను తొలగించండి';

  @override
  String get settingsClearConfirmTitle => 'అన్ని సందేశాలను క్లియర్ చేయాలా?';

  @override
  String get settingsClearConfirmBody =>
      'ఇది ఈ పరికరంలోని అన్ని చాట్ సందేశాలను తొలగిస్తుంది.\nసహచరులు మరియు మారుపేర్లు తీసివేయబడవు.';

  @override
  String get settingsClearAction => 'డేటాను క్లియర్ చేయండి';

  @override
  String get settingsClearedSnack => 'డేటా క్లియర్ చేయబడింది';

  @override
  String settingsVersion(String version) {
    return 'వెర్షన్ $version';
  }

  @override
  String get meshBleScanning => 'BLE: నోడ్‌ల కోసం స్కాన్ చేస్తోంది';

  @override
  String get meshBleEsp32Scanning => 'ESP32: సమీపంలోని నోడ్ కోసం వెతుకుతోంది';

  @override
  String get meshBleSyncing => 'BLE: ESP32తో సమకాలీకరించడం';

  @override
  String get meshNostrPublishing => 'Nostr: ప్రచురణ';

  @override
  String get meshBleIdle =>
      'BLE మెష్ ఆన్ చేయబడింది — ఇంకా సమీపంలోని ఫోన్‌లు లేవు';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE మెష్ — $count ఫోన్(లు) సమీపంలో';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: అనుమతి అవసరం';

  @override
  String get meshBlePausedCamera =>
      'కెమెరా కోసం BLE పాజ్ చేయబడింది — ప్రారంభించు BLE నొక్కండి';

  @override
  String get meshBleStopped =>
      'BLE ఆఫ్‌లో ఉంది — బ్లూటూత్ ఆన్‌లో ఉందో లేదో తనిఖీ చేసి, ఆపై ప్రారంభించు BLE నొక్కండి';

  @override
  String get meshBleRestart => 'BLEని ప్రారంభించండి';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'అనుమతులను తనిఖీ చేసి BLEని ప్రారంభించండి';

  @override
  String get meshNostrOffline => 'Nostr ఆఫ్‌లైన్';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count సమీపంలోని సహచరులు • LoRa $lora • సమకాలీకరణ ~$metersని';
  }

  @override
  String get meshLoraReady => 'సిద్ధంగా';

  @override
  String get meshLoraNotReady => 'సిద్ధంగా లేదు';

  @override
  String meshGatewayProgress(String label) {
    return 'గేట్‌వే UDP: $label';
  }

  @override
  String get meshGatewayReady => 'గేట్‌వే UDP: సిద్ధంగా ఉంది';

  @override
  String get permissionTitle =>
      'BLE మెష్ నెట్‌వర్క్‌ను ప్రారంభించడానికి ప్రాప్యతను అనుమతించండి';

  @override
  String get permissionBody =>
      'కమ్యూనిటీ మెసేజింగ్ కోసం యాప్‌కి బ్లూటూత్ (స్కాన్ / కనెక్ట్ / అడ్వర్టైజ్), లొకేషన్ (పాత Android పరికరాల కోసం) మరియు మైక్రోఫోన్ (చాట్ మరియు అనౌన్స్‌మెంట్‌లలో వాయిస్ నోట్స్ కోసం) అవసరం.';

  @override
  String get permissionE2ee =>
      'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్ (E2EE)\nరిలే నోడ్‌లు సందేశ విషయాలను చదవలేవు';

  @override
  String get permissionReady => 'అనుమతులు సిద్ధంగా ఉన్నాయి';

  @override
  String get permissionRequest => 'అనుమతించండి మరియు కొనసాగించండి';

  @override
  String get permissionNotReadySnack =>
      'సిస్టమ్ ఇంకా సిద్ధంగా లేదు — ఒక క్షణం వేచి ఉండి, మళ్లీ ప్రయత్నించండి';

  @override
  String get permissionDeniedSnack =>
      'అనుమతులు అసంపూర్తిగా ఉన్నాయి — సెట్టింగ్‌లు > ResilNet తెరిచి బ్లూటూత్ / లొకేషన్ / మైక్రోఫోన్‌ని అనుమతించండి';

  @override
  String get permissionMicDenied =>
      'మైక్రోఫోన్ యాక్సెస్ నిరాకరించబడింది - వాయిస్ నోట్‌లను రికార్డ్ చేయడానికి సెట్టింగ్‌లలో దీన్ని అనుమతించండి';

  @override
  String get permissionMicOpenSettings => 'సెట్టింగ్‌లు';

  @override
  String get permissionCameraDenied =>
      'కెమెరా యాక్సెస్ నిరాకరించబడింది - QR కోడ్‌లను స్కాన్ చేయడానికి సెట్టింగ్‌లలో దీన్ని అనుమతించండి';

  @override
  String get permissionCameraFailed =>
      'QR కోడ్‌లను స్కాన్ చేయడానికి కెమెరా అనుమతి అవసరం';

  @override
  String get permissionCameraOpenSettings => 'సెట్టింగ్‌లు';

  @override
  String get permissionPhotosDenied =>
      'ఫోటో లైబ్రరీ యాక్సెస్ నిరాకరించబడింది - మీ QR కోడ్‌ని సేవ్ చేయడానికి సెట్టింగ్‌లలో దీన్ని అనుమతించండి';

  @override
  String get permissionPhotosFailed =>
      'మీ QR కోడ్‌ని సేవ్ చేయడానికి ఫోటో లైబ్రరీ అనుమతి అవసరం';

  @override
  String get permissionPhotosOpenSettings => 'సెట్టింగ్‌లు';

  @override
  String permissionFailedSnack(String error) {
    return 'అనుమతి అభ్యర్థన విఫలమైంది: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet ఆర్కిటెక్చర్ • స్టోర్ మరియు ఫార్వర్డ్ మల్టీ-హాప్';

  @override
  String get onboardingSkip => 'దాటవేయి';

  @override
  String get onboardingNext => 'తదుపరి';

  @override
  String get onboardingStart => 'ప్రారంభించండి';

  @override
  String get onboardingWelcomeTitle => 'ResilNetకి స్వాగతం';

  @override
  String get onboardingWelcomeBody =>
      'ఇంటర్నెట్ లేకుండా కూడా - మెష్ నెట్‌వర్క్ ద్వారా ResilNetలో చాట్ చేయండి';

  @override
  String get onboardingFriendsTitle => 'స్నేహితులను సులభంగా జోడించండి';

  @override
  String get onboardingFriendsBody =>
      'గుర్తింపు నుండి QRని షేర్ చేయండి లేదా పబ్లిక్ కీలను మార్చుకోవడానికి స్నేహితుని QRని స్కాన్ చేయండి';

  @override
  String get onboardingChannelsTitle =>
      'ఎన్‌క్రిప్టెడ్ చాట్ + సమీపంలోని ఛానెల్‌లు';

  @override
  String get onboardingChannelsBody =>
      'సమీపంలోని సహచరులను కనుగొనడానికి #mesh / Area (geohash)ని మార్చండి — సందేశాలు BLE మెష్ మరియు Nostrపై E2EE ఉంటాయి';

  @override
  String get chatTitle => 'చాట్ (E2EE)';

  @override
  String get chatScanTooltip => 'పీర్‌ని జోడించడానికి QRని స్కాన్ చేయండి';

  @override
  String get chatBlockTooltip => 'ఈ పంపినవారిని బ్లాక్ చేయండి';

  @override
  String get chatBlockedSnack =>
      'బ్లాక్ చేయబడింది: నోటిఫికేషన్‌లు లేవు / రిలే లేదు';

  @override
  String get chatAliasTooltip => 'మారుపేరును సెట్ చేయండి';

  @override
  String get chatReceiverPemLabel => 'స్వీకర్త పబ్లిక్ కీ (PEM)';

  @override
  String get chatReceiverPemHint =>
      'మీ స్నేహితుని పబ్లిక్ కీని అతికించండి (QR / షేర్డ్ ఫైల్ నుండి)';

  @override
  String get chatNeedPeerKey =>
      'ముందుగా ఈ పీర్ QRని స్కాన్ చేయండి (ధృవీకరించబడిన పబ్లిక్ కీ అవసరం)';

  @override
  String get chatPeerKeyMismatch =>
      'నిల్వ చేయబడిన పబ్లిక్ కీ ఈ పీర్ ఐడితో సరిపోలడం లేదు';

  @override
  String chatVoiceFailed(String error) {
    return 'ఆడియో రికార్డ్ చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'వాయిస్ నోట్‌ని ప్లే చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String get chatPlayVoice => 'వాయిస్ నోట్‌ని ప్లే చేయండి';

  @override
  String get chatPauseVoice => 'పాజ్ చేయండి';

  @override
  String get chatVoiceLabelSent => '🎤 వాయిస్ నోట్ (సీల్డ్)';

  @override
  String get chatVoiceLabel => '🎤 వాయిస్ నోట్';

  @override
  String get chatDecryptFailed => '[డిక్రిప్షన్ విఫలమైంది]';

  @override
  String chatSentSealed(String preview) {
    return '[సీల్డ్ • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[సీల్డ్]';

  @override
  String get chatComposeHint =>
      'సందేశాన్ని టైప్ చేయండి... (పంపుపై సీలు చేయబడింది)';

  @override
  String get chatEmptyThread =>
      'ఇంకా సందేశాలు లేవు\nమెష్‌ను పంపడానికి క్రింద టైప్ చేయండి';

  @override
  String chatLoadFailed(String error) {
    return 'సంభాషణను లోడ్ చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String get chatEmojiTooltip => 'ఎమోజి';

  @override
  String get statusPending => 'పెండింగ్‌లో ఉంది';

  @override
  String get statusSent => 'పంపబడింది';

  @override
  String get statusRelayed => 'ప్రసారం చేయబడింది';

  @override
  String get statusDelivered => 'పంపిణీ చేయబడింది';

  @override
  String get statusRead => 'చదవండి';

  @override
  String get statusFailed => 'విఫలమైంది';

  @override
  String get chatCopy => 'కాపీ చేయండి';

  @override
  String get chatDeleteLocal => 'ఈ పరికరంలో తొలగించండి';

  @override
  String get chatDeletedLocalSnack => 'ఈ పరికరంలో తొలగించబడింది';

  @override
  String get chatRetry => 'మళ్లీ ప్రయత్నించండి';

  @override
  String get chatSendFailed => 'డెలివరీ కాలేదు — మళ్లీ ప్రయత్నించండి నొక్కండి';

  @override
  String get chatImageNeedInternet =>
      'చిత్రాలను పంపడానికి ఇంటర్నెట్‌కి కనెక్ట్ చేయండి';

  @override
  String get chatImageTooLargeOnline =>
      'పంపడానికి కావలసినంత చిత్రాన్ని కుదించడం సాధ్యపడలేదు';

  @override
  String get chatOpenLinkFailed => 'లింక్‌ని తెరవడం సాధ్యపడలేదు';

  @override
  String get identityTitle => 'గుర్తింపు';

  @override
  String get identityScanTooltip => 'కెమెరాతో QRని స్కాన్ చేయండి';

  @override
  String get identityCopiedHash => 'పబ్లిక్ కీ హాష్ కాపీ చేయబడింది';

  @override
  String get identityPeerSaved => 'QR నుండి పీర్ సేవ్ చేయబడింది';

  @override
  String get identityGalleryDenied => 'ఫోటో లైబ్రరీ అనుమతి నిరాకరించబడింది';

  @override
  String get identityQrSaved => 'QR ఫోటో లైబ్రరీకి సేవ్ చేయబడింది';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR: $errorని సేవ్ చేయడం సాధ్యపడలేదు';
  }

  @override
  String get peersTitle => 'నెట్‌వర్క్ సభ్యులు';

  @override
  String get qrScanTitle => 'స్నేహితుడిని జోడించడానికి QRని స్కాన్ చేయండి';

  @override
  String get qrInvalid => 'స్కాన్ విఫలమైంది: చెల్లని QR';

  @override
  String get qrIdKeyMismatch =>
      'QR తిరస్కరించబడింది: id పబ్లిక్ కీతో సరిపోలడం లేదు';

  @override
  String get qrCameraNotReady => 'కెమెరా సిద్ధంగా లేదు';

  @override
  String get qrRetrySettings => 'మళ్లీ ప్రయత్నించండి / సెట్టింగ్‌లను తెరవండి';

  @override
  String qrCameraOpenFailed(String error) {
    return 'కెమెరాను తెరవడం సాధ్యపడలేదు: $error';
  }

  @override
  String get qrScanAlignHint => 'ఫ్రేమ్ లోపల QR కోడ్‌ను సమలేఖనం చేయండి';

  @override
  String get firmwareDownloadTitle => 'ESP32 ఫర్మ్‌వేర్‌ని డౌన్‌లోడ్ చేయండి';

  @override
  String get firmwareSourceOnline => 'తాజా (ఆన్‌లైన్)';

  @override
  String get firmwareSourceCached => 'సేవ్ చేయబడిన కాపీ (ఆఫ్‌లైన్)';

  @override
  String get firmwareSourceBaseline => 'బండిల్ బేస్‌లైన్ (ఆఫ్‌లైన్)';

  @override
  String get firmwareSourceUnavailable => 'ఫర్మ్‌వేర్ అందుబాటులో లేదు';

  @override
  String get firmwareBaselineIncompatible =>
      'బండిల్ చేసిన ఫర్మ్‌వేర్ చాలా పాతది — కొత్త వెర్షన్‌ను డౌన్‌లోడ్ చేయడానికి ఇంటర్నెట్‌కి కనెక్ట్ చేయండి';

  @override
  String get firmwareChecksumFailed =>
      'ఫర్మ్‌వేర్ సమగ్రత తనిఖీ విఫలమైంది - ఫ్లాషింగ్ బ్లాక్ చేయబడింది';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ఫర్మ్‌వేర్ సిద్ధంగా ఉంది: $source';
  }

  @override
  String get peersRefreshTooltip => 'రిఫ్రెష్ చేయండి';

  @override
  String get peersBlocked => 'నిరోధించబడింది';

  @override
  String peersNearbyBle(Object ble) {
    return 'సమీపంలో (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'ఇటీవల ఆన్‌లైన్';

  @override
  String get peersOnlineInArea => 'ప్రాంతంలో ఆన్‌లైన్';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes నిమి క్రితం చూసింది';
  }

  @override
  String get peersOffline => 'ఆఫ్‌లైన్';

  @override
  String peersBlockedSnack(String id) {
    return '$id నిరోధించబడింది';
  }

  @override
  String get peersUnblockedSnack => 'అన్‌బ్లాక్ చేయబడింది';

  @override
  String get peersEmpty =>
      'డేటాబేస్‌లో ఇంకా సభ్యులు లేరు\nQRని స్కాన్ చేయండి లేదా BLE మెష్ ఆవిష్కరణ కోసం వేచి ఉండండి';

  @override
  String get peersOpenChat => 'చాట్ తెరవండి';

  @override
  String get peersBlockAction => 'నిరోధించు';

  @override
  String get peersUnblockAction => 'అన్‌బ్లాక్ చేయండి';

  @override
  String get channelPickerTooltip => 'చాట్ / #మెష్ / ప్రాంతం';

  @override
  String get locationPickerTooltip => 'స్థాన ఛానెల్';

  @override
  String get transportPickerTooltip => 'మెష్ / ఇంటర్నెట్ / ఆటో';

  @override
  String get onlinePeopleTooltip => 'ఆన్‌లైన్ వ్యక్తులు';

  @override
  String get unreadDirectsTooltipEmpty => 'ప్రైవేట్ సందేశాలు';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count చదవని ప్రైవేట్ సందేశాలు';
  }

  @override
  String get onlinePeopleTitle => 'ప్రజలు';

  @override
  String get onlinePeopleEmpty => 'ఇక్కడ ఇంకా ఎవరూ ఆన్‌లైన్‌లో లేరు';

  @override
  String onlinePeopleCount(int count) {
    return '$count ఆన్‌లైన్';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · సమీపంలోని + ప్రాంతం';

  @override
  String get peerOnlineMeshTitle => 'మెష్‌పై సమీపంలోని ఎవరైనా ఉన్నారు';

  @override
  String peerOnlineMeshBody(String name) {
    return 'మెష్‌లో $name సమీపంలో ఉంది';
  }

  @override
  String get peerOnlineAreaTitle => 'ప్రాంతంలో ఎవరైనా ఆన్‌లైన్‌లో ఉన్నారు';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr ద్వారా ఆన్‌లైన్‌లో ఉంది';
  }

  @override
  String get locationSheetTitle => '#స్థాన ఛానెల్‌లు';

  @override
  String get channelPinsTitle => 'పిన్ చేయబడింది';

  @override
  String get channelPinsHint =>
      'మీరు తరచుగా ఉపయోగించే ఛానెల్‌లను పిన్ చేయండి — అవి అగ్రస్థానంలో ఉంటాయి';

  @override
  String get channelPinTooltip => 'ఈ ఛానెల్‌ని పిన్ చేయండి';

  @override
  String get channelUnpinTooltip => 'అన్‌పిన్ చేయండి';

  @override
  String get locationSheetIntro =>
      'ముతక జియోహాష్ ఉపయోగించి సమీపంలోని వ్యక్తులతో చాట్ చేయండి — ఖచ్చితమైన GPS కాదు. ఇంటర్నెట్‌లో ఉనికి అనామక Nostr కీలను ఉపయోగిస్తుంది.';

  @override
  String get locationMeshSubtitle => '#బ్లూటూత్ • ~10–50 మీ';

  @override
  String get locationTeleportHint => '#జియోహాష్';

  @override
  String get locationTeleport => 'టెలిపోర్ట్';

  @override
  String homeComposeHint(String channel) {
    return 'సందేశం $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channelకి పంపండి — పబ్లిక్';
  }

  @override
  String get messageExpiryTitle => 'లో గడువు ముగుస్తుంది';

  @override
  String get voiceRecordTapToStart =>
      'వాయిస్ సందేశాన్ని రికార్డ్ చేయడానికి నొక్కండి';

  @override
  String get voiceRecordTooShort =>
      'రికార్డింగ్ చాలా చిన్నది — మళ్లీ ప్రయత్నించండి';

  @override
  String get voiceRecordFailed =>
      'రికార్డింగ్‌ని సేవ్ చేయడం సాధ్యపడలేదు — మళ్లీ ప్రయత్నించండి';

  @override
  String get voicePttHold => 'రికార్డ్ చేయడానికి పట్టుకోండి';

  @override
  String get voicePttRelease => 'ప్రివ్యూ కోసం విడుదల చేయండి';

  @override
  String get voicePttRecording => 'రికార్డింగ్…';

  @override
  String get voicePttDraftReady => 'వాయిస్ నోట్ సిద్ధంగా ఉంది';

  @override
  String get voicePttDiscard => 'విస్మరించండి';

  @override
  String get voicePttReRecord => 'మళ్లీ రికార్డ్ చేయండి';

  @override
  String get voicePttSend => 'వాయిస్ నోట్ పంపండి';

  @override
  String get voicePttPlayPreview => 'ప్రివ్యూని ప్లే చేయండి';

  @override
  String get voicePttStopPreview => 'ప్రివ్యూను ఆపండి';

  @override
  String get noticesBackfilling => 'నోటీసులను లోడ్ చేస్తోంది…';

  @override
  String get noticesNostrOnline => 'Nostr ఆన్‌లైన్';

  @override
  String get noticesNostrOffline =>
      'Nostr ఆఫ్‌లైన్ — బులెటిన్‌కి ఇంటర్నెట్ అవసరం';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count నోటీసులు లోడ్ చేయబడ్డాయి';
  }

  @override
  String get noticePublishFailed =>
      'ఏరియా బోర్డుకు నోటీసును ప్రచురించడం సాధ్యం కాలేదు. Nostr కనెక్షన్‌ని తనిఖీ చేయండి.';

  @override
  String get noticeMeshPublishNoLink =>
      'స్థానికంగా సేవ్ చేయబడింది. సమీపంలోని మెష్ రేడియో (లేదా Wi‑Fi గేట్‌వే)కి కనెక్ట్ చేయండి, తద్వారా ఇతరులు దానిని స్వీకరించగలరు.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'BLEకి పైగా $count సమీపంలోని పరికరం(లు)కి బులెటిన్ పంపబడింది.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'సమీపంలోని రేడియోలు కనిపించాయి, కానీ BLE వ్రాయడం విఫలమైంది. రెండు యాప్‌లను నోటీసుల స్క్రీన్‌పై తెరిచి ఉంచి, మళ్లీ ప్రయత్నించండి (లేదా ESP32 రిలేని ఉపయోగించండి).';

  @override
  String get noticeMeshPublishNoGatt =>
      'ఈ పరికరం BLE రిసీవర్ సిద్ధంగా లేదు. బ్లూటూత్‌ని టోగుల్ చేసి, నోటీసులను మళ్లీ తెరవండి.';

  @override
  String get noticeDelete => 'నోటీసును తొలగించండి';

  @override
  String get noticeDeleteConfirmTitle => 'ఈ నోటీసును తొలగించాలా?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'ఇది ఈ పరికరంలో మాత్రమే తీసివేస్తుంది. ఇప్పటికే అందుకున్న ఇతరులు దీన్ని ఇప్పటికీ చూస్తారు.';

  @override
  String get noticeDeleted => 'నోటీసు తొలగించబడింది';

  @override
  String get chatNoticeHidden => 'ఏరియా నోటీసు — ఓపెన్ నోటీసులు';

  @override
  String get identityDisplayNameTitle => 'ప్రదర్శన పేరు';

  @override
  String get identitySaveName => 'పేరును సేవ్ చేయండి';

  @override
  String get identityUserIdLabel => 'వినియోగదారు ID (పబ్లిక్ కీ హాష్)';

  @override
  String get identityCopyHashTooltip => 'పబ్లిక్ కీ హాష్‌ని కాపీ చేయండి';

  @override
  String get identityMyQrTitle => 'నా QR (id + pubKey + పేరు)';

  @override
  String identityQrFailed(String error) {
    return 'QRని సృష్టించడం సాధ్యపడలేదు\n$error';
  }

  @override
  String get identitySaving => 'సేవ్ చేస్తోంది...';

  @override
  String get identitySaveQr => 'QRని ఫోటో లైబ్రరీకి సేవ్ చేయండి';

  @override
  String get identityOpenScanner => 'QRని స్కాన్ చేయడానికి కెమెరాను తెరవండి';

  @override
  String get identityQrHelp =>
      'మీ పబ్లిక్ కీని సేవ్ చేయడానికి స్నేహితుడిని స్కాన్ చేయండి మరియు (అవసరమైతే) మిమ్మల్ని ధృవీకరించిన జారీదారుగా సెట్ చేయండి';

  @override
  String get identityChatTip =>
      'చిట్కా: E2EE కోసం పబ్లిక్ కీని జోడించడానికి మీరు చాట్‌లో QRని కూడా స్కాన్ చేయవచ్చు';

  @override
  String get infoOpen => 'గురించి / సమాచారం';

  @override
  String get docsGuideTitle => 'వినియోగదారు గైడ్';

  @override
  String get docsGuideSubtitle => 'బ్రౌజర్‌లో తెరవబడుతుంది';

  @override
  String get docsOpenAction => 'గైడ్ తెరవండి';

  @override
  String get docsOpenFailed => 'వినియోగదారు మార్గదర్శిని తెరవడం సాధ్యపడలేదు';

  @override
  String get firmwareOtaGuideTitle => 'ఫ్లాష్ గైడ్ & OTA ప్రోటోకాల్';

  @override
  String get firmwareOtaGuideSubtitle =>
      'వెబ్ గైడ్‌ను తెరుస్తుంది — .bin డౌన్‌లోడ్‌లు మరియు పూర్తి దశలు';

  @override
  String get firmwareWebDownloadsTitle => 'వెబ్‌లో ఫర్మ్‌వేర్ డౌన్‌లోడ్‌లు';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'డాక్స్ సైట్‌లో ప్రతి-వెర్షన్ లింక్‌లు మరియు చెక్‌సమ్‌లు';

  @override
  String get inviteCopyShortLink => 'చిన్న లింక్‌ని కాపీ చేయండి';

  @override
  String get inviteShareLink => 'లింక్‌ను భాగస్వామ్యం చేయండి';

  @override
  String get inviteShowFullLink => 'పూర్తి లింక్';

  @override
  String get inviteCopyFullLink => 'పూర్తి లింక్‌ను కాపీ చేయండి';

  @override
  String get inviteLinkCopied => 'లింక్ కాపీ చేయబడింది';

  @override
  String get inviteLongPressHint => 'లింక్ చర్యల కోసం ఎక్కువసేపు నొక్కండి';

  @override
  String get inviteSendInChat => 'ResilNet చాట్‌లో పంపండి…';

  @override
  String get inviteSendInChatHint =>
      'మీరు ఇప్పటికే పబ్లిక్ కీని కలిగి ఉన్న వ్యక్తులకు మాత్రమే';

  @override
  String get inviteSendInChatEmpty =>
      'ఇంకా మెసేజ్ చేయదగిన చాట్‌లు లేవు.\nQRని స్కాన్ చేయండి, ఏరియా/మెష్‌ని తెరవండి లేదా యాప్ వెలుపల లింక్‌ను ముందుగా షేర్ చేయండి.';

  @override
  String get inviteSentToChat => 'ఆహ్వానం చాట్‌లో పంపబడింది';

  @override
  String get infoTabInfo => 'సమాచారం';

  @override
  String get infoTabSettingsHint =>
      'భాష, E2EE మరియు డేటా సాధనాల కోసం మెను నుండి సెట్టింగ్‌లను తెరవండి';

  @override
  String get infoHowToTitle => 'ఎలా ఉపయోగించాలి';

  @override
  String get infoHowToBody =>
      '• చాట్ / #మెష్ / ఏరియాని మార్చడానికి ఛానెల్ చిహ్నాన్ని నొక్కండి\n• జియోహాష్ పరిమాణాన్ని ఎంచుకోవడానికి స్థలాన్ని నొక్కండి\n• సభ్యుల కోసం లేదా ఆన్‌లైన్‌లో ఉన్న వ్యక్తుల కోసం నొక్కండి\n• వ్యక్తిగతంగా కీలను మార్పిడి చేసుకోవడానికి ⋮ నుండి గుర్తింపు/QR తెరవండి\n• ఏరియా “పబ్లిక్” ప్రతి ఆన్‌లైన్ పీర్‌కి సీల్డ్ E2EEని పంపుతుంది — సాదా వచన గది కాదు';

  @override
  String get infoFeaturesTitle => 'ఫీచర్లు';

  @override
  String get infoFeatureOffline => 'బ్లూటూత్ లో ఎనర్జీ ద్వారా ఆఫ్‌లైన్ సందేశం';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCMతో ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్షన్ (నాయిస్ కాదు)';

  @override
  String get infoFeatureMultihop =>
      'మరింత దూరం వెళ్లడానికి సమీపంలోని తోటివారి ద్వారా సందేశాలు హాప్ చేయబడతాయి';

  @override
  String get infoFeatureBridge =>
      'మూసివున్న ఎన్వలప్‌ల కోసం హైబ్రిడ్ మెష్ ↔ ఇంటర్నెట్ (Nostr).';

  @override
  String get infoFeatureGeo =>
      'సమీపంలోని వ్యక్తుల కోసం స్థానిక జియోహాష్ ఛానెల్‌లు (డిస్కవరీ UX)';

  @override
  String get infoFeatureNotices =>
      '#మెష్ మరియు ఏరియా కోసం గడువుతో కూడిన నోటీసులు';

  @override
  String get infoPrivacyTitle => 'గోప్యత';

  @override
  String get infoPrivacyNoRoom =>
      'వైర్‌లో సాదా వచన గ్రామం / పబ్లిక్ చాట్ రూమ్ లేదు';

  @override
  String get infoPrivacyFanout =>
      'తెలిసిన పబ్లిక్ కీలతో పీర్‌లకు పంపే ప్రాంతం = 1:1 ఫ్యాన్-అవుట్ సీలు చేయబడింది';

  @override
  String get infoPrivacyPresence =>
      'ఇంటర్నెట్ ఏరియా ఉనికి అశాశ్వత Nostr కీలను ఉపయోగిస్తుంది';

  @override
  String get infoSymbolsTitle => 'చిహ్నాలు';

  @override
  String get infoSymBle => 'ప్రత్యక్ష బ్లూటూత్ లింక్';

  @override
  String get infoSymMesh => 'మెష్ ద్వారా చేరుకోవచ్చు (ఇతరులు ముందుకు)';

  @override
  String get infoSymInternet =>
      'ఇంటర్నెట్ ద్వారా (Nostr) — మూసివున్న ఎన్వలప్‌లు';

  @override
  String get infoSymBridge => 'మెష్↔ఇంటర్నెట్ వంతెన మార్గం ద్వారా చేరుకున్నారు';

  @override
  String get infoSymOffline => 'ఆఫ్‌లైన్ — ప్రస్తుతం అందుబాటులో లేదు';

  @override
  String get infoSymInArea => 'ఈ స్థాన ఛానెల్ ప్రాంతంలో';

  @override
  String get infoSymE2eeOk => 'ఎండ్-టు-ఎండ్ ఎన్‌క్రిప్టెడ్ సెషన్';

  @override
  String get infoSymE2eeFail =>
      'ఎన్క్రిప్షన్ అందుబాటులో లేదు - సున్నితమైన వచనాన్ని పంపవద్దు';

  @override
  String get infoSymVerified => 'గుర్తింపు ధృవీకరించబడింది / తెలిసిన కీ';

  @override
  String get infoSymBlocked => 'నిరోధించబడింది';

  @override
  String get infoSymUnread => 'చదవని ప్రైవేట్ సందేశం';

  @override
  String get infoEmergencyTitle => 'అత్యవసర మోడ్';

  @override
  String get infoEmergencyBody =>
      'ఈ పరికరంలో సందేశాలు, కీలు మరియు గుర్తింపును తొలగించడానికి హోమ్ స్క్రీన్‌పై ResilNet శీర్షికను మూడుసార్లు నొక్కండి.';

  @override
  String get infoLegendNote =>
      'కొన్ని పాత్ చిహ్నాలు స్పష్టత కోసం ఇక్కడ డాక్యుమెంట్ చేయబడ్డాయి; చాట్‌లోని డెలివరీ టిక్‌లు ప్రాథమిక పంపే స్థితిగా ఉంటాయి.';

  @override
  String get dangerZoneTitle => 'డేంజర్ జోన్';

  @override
  String get dangerZoneSubtitle =>
      'ఈ పరికరంలో సందేశాలు, ఎన్‌క్రిప్షన్ కీలు, Nostr గుర్తింపు, పీర్‌లు మరియు మారుపేర్లను తొలగిస్తుంది. మీరు మళ్లీ సెటప్ చేస్తారు.';

  @override
  String get panicWipeTitle => 'అత్యవసర తుడవడం';

  @override
  String get panicWipeSubtitle =>
      'హోమ్ టైటిల్‌ను మూడుసార్లు నొక్కినట్లే - స్థానికంగా ఉన్న ప్రతిదాన్ని తొలగించండి (రెండుసార్లు నొక్కండి రేడియోలను రిఫ్రెష్ చేస్తుంది)';

  @override
  String get panicWipeConfirmTitle => 'మొత్తం స్థానిక డేటాను తుడిచివేయాలా?';

  @override
  String get panicWipeConfirmBody =>
      'ఇది ఈ ఫోన్‌లోని చాట్‌లు, కీలు మరియు గుర్తింపును శాశ్వతంగా తొలగిస్తుంది.\nమీ కొత్త గుర్తింపుతో సహచరులు తప్పనిసరిగా QR కీలను మళ్లీ మార్చుకోవాలి.\nఇది రద్దు చేయబడదు.';

  @override
  String get panicWipeAction => 'ప్రతిదీ తుడవడం';

  @override
  String get panicWipeSnack =>
      'స్థానిక గుర్తింపు తుడిచివేయబడింది - మళ్లీ సెటప్ చేయబడింది';

  @override
  String panicWipeFailed(String error) {
    return 'తుడవడం విఫలమైంది: $error';
  }

  @override
  String get meshBridgeTitle => 'మెష్ వంతెన';

  @override
  String get meshBridgeSubtitle =>
      'ఆన్‌లో ఉన్నప్పుడు (డిఫాల్ట్), మూసివేసిన ఎన్వలప్‌లు BLE మెష్ మరియు ఇంటర్నెట్ (Nostr) రెండింటినీ కలిపి ఉపయోగించవచ్చు, తద్వారా సమీపంలోని మెష్ దీవులు కనెక్ట్ అవుతాయి. ఆఫ్‌లో ఉన్నప్పుడు, పంపేవి ఒక మార్గాన్ని మాత్రమే ఉపయోగిస్తాయి - వైర్‌పై సాదా వచనాన్ని ఎప్పుడూ ఉంచదు.';

  @override
  String get favoritesTitle => 'ఇష్టమైనవి';

  @override
  String get favoritesAdd => 'ఇష్టమైన వాటికి జోడించండి';

  @override
  String get favoritesRemove => 'ఇష్టమైన వాటి నుండి తీసివేయండి';

  @override
  String get favoritesEmpty =>
      'ఇంకా ఇష్టమైనవి ఏవీ లేవు — సభ్యుల జాబితా నుండి ఒక పీర్‌ను స్టార్ చేయండి';

  @override
  String get favoritesNearbyTitle => 'సమీపంలో ఇష్టమైనవి';

  @override
  String favoritesNearbyBody(String name) {
    return 'మెష్‌లో $name సమీపంలో ఉంది';
  }

  @override
  String get favoritesInAreaTitle => 'ప్రాంతంలో ఇష్టమైనది';

  @override
  String favoritesInAreaBody(String name) {
    return '$name ఈ ప్రాంతంలో ఆన్‌లైన్‌లో ఉంది';
  }

  @override
  String get topologyTitle => 'మెష్ టోపోలాజీ';

  @override
  String get topologySubtitle =>
      'మెష్ నుండి సహచరులు మరియు కనెక్షన్ సూచనలు ప్రకటించబడ్డాయి (చదవడానికి మాత్రమే)';

  @override
  String get topologyConnectedNow => 'ఇప్పుడు కనెక్ట్ చేయబడింది (BLE)';

  @override
  String get topologyNearby => 'సమీపంలో (BLE)';

  @override
  String get topologyKnown => 'తెలిసిన సహచరులు';

  @override
  String get topologyEmpty =>
      'సహచరులు ఎవరూ నేర్చుకోలేదు — BLE ఆన్‌తో సమీపంలో ఉండండి';

  @override
  String get topologyYou => 'మీరు';

  @override
  String topologyStats(int peers, int links) {
    return '$peers పీర్‌లు · $links లింక్‌లు';
  }

  @override
  String get topologyGraphHint =>
      'సమీపంలోని మెష్ ఆవిష్కరణ నుండి అంచనా వేయబడింది — మీ పరికరం హైలైట్ చేయబడింది. చాట్‌ని తెరవడానికి పీర్‌ని నొక్కండి.';

  @override
  String get topologyOpen => 'మెష్ టోపోలాజీ';

  @override
  String get slashHelpTitle => 'ఆదేశాలు';

  @override
  String get slashHelpBody =>
      '/ సహాయం - ఈ జాబితా\n/ఎవరు — ప్రస్తుత ఛానెల్‌లో ఆన్‌లైన్ వ్యక్తులు\n/drop <text> — ఇక్కడ మూసివున్న నోటీసును పిన్ చేయండి (E2EE ఫ్యాన్ అవుట్)\n\nపూర్తి గైడ్: దిగువ ఓపెన్ గైడ్ లేదా సెట్టింగ్‌లు → యూజర్ గైడ్‌ని ఉపయోగించండి.';

  @override
  String get slashWhoEmpty => 'ప్రస్తుతం ఈ ఛానెల్‌లో ఆన్‌లైన్‌లో ఎవరూ లేరు';

  @override
  String slashWhoTitle(int count) {
    return 'ఆన్‌లైన్ ($count)';
  }

  @override
  String get slashDropNeedText => 'ఉపయోగం: / మీ గమనిక వచనాన్ని వదలండి';

  @override
  String slashDropDone(String channel) {
    return '$channelలో నోటీసును తొలగించారు';
  }

  @override
  String get slashUnknown => 'తెలియని ఆదేశం — ప్రయత్నించండి /సహాయం';

  @override
  String get announceOpen => 'ప్రకటనలు';

  @override
  String get announceTitle => 'ప్రకటనలు';

  @override
  String get announceEmpty =>
      'ఇంకా బోర్డులు లేవు — లాక్ చేయబడిన లేదా ఓపెన్ నోటీసులను పోస్ట్ చేయడానికి ఒకదాన్ని సృష్టించండి';

  @override
  String get announceCreate => 'బోర్డుని సృష్టించండి';

  @override
  String get announceCreateHint => 'బోర్డు పేరు';

  @override
  String get announceDefaultTitle => 'కమ్యూనిటీ బోర్డు';

  @override
  String get announceSettings => 'బోర్డు సెట్టింగులు';

  @override
  String get announceAllowLocked =>
      'లాక్ చేయబడిన (ఎన్‌క్రిప్టెడ్) పోస్ట్‌లను అనుమతించండి';

  @override
  String get announceAllowLockedSub =>
      'బోర్డ్ కీకి ఎన్‌క్రిప్ట్ చేయబడింది - రీడర్‌లకు యాక్సెస్ అవసరం';

  @override
  String get announceAllowOpen =>
      'ఓపెన్ (ప్లెయిన్‌టెక్స్ట్) పోస్ట్‌లను అనుమతించండి';

  @override
  String get announceAllowOpenSub =>
      'E2EE కాదు — మెష్/రిలేలలో చదవగలిగేది. డిఫాల్ట్‌గా ఆఫ్.';

  @override
  String get announceComposeHint => 'ఒక ప్రకటన రాయండి...';

  @override
  String get announceMediaInternetOnly =>
      'ఫోటో/వాయిస్ ప్రకటనలు ఇంటర్నెట్ ద్వారా పంపబడతాయి (BLE కాదు)';

  @override
  String get announceNeedInternet =>
      'ఫోటో లేదా వాయిస్ ప్రకటనలను పంపడానికి ఇంటర్నెట్‌కు కనెక్ట్ చేయండి';

  @override
  String announceVoiceFailed(String error) {
    return 'వాయిస్ రికార్డ్ చేయడం సాధ్యపడలేదు: $error';
  }

  @override
  String get announceImageTooLarge => 'చిత్రం చాలా పెద్దది (గరిష్టంగా ~180 KB)';

  @override
  String get announcePlayVoice => 'వాయిస్ నోట్‌ని ప్లే చేయండి';

  @override
  String get announceImageLabel => '📷 చిత్రం';

  @override
  String get announceAudioLabel => '🎤 వాయిస్ నోట్';

  @override
  String get announceModeLocked => 'లాక్ చేయబడింది';

  @override
  String get announceModeOpen => 'తెరవండి';

  @override
  String get announceOpenBadge => 'తెరవబడింది · గుప్తీకరించబడలేదు';

  @override
  String get announceLockedBadge => 'లాక్ చేయబడింది';

  @override
  String get announceLockedPlaceholder =>
      'ఎన్‌క్రిప్ట్ చేయబడింది — చదవడానికి యాక్సెస్‌ని అభ్యర్థించండి';

  @override
  String get announceRequestAccess => 'యాక్సెస్‌ని అభ్యర్థించండి';

  @override
  String get announceRequestSent =>
      'యాక్సెస్ అభ్యర్థన బోర్డు యజమానికి పంపబడింది';

  @override
  String get announceRequestFailed =>
      'ప్రాప్యతను అభ్యర్థించడం సాధ్యపడలేదు (యజమాని యొక్క పబ్లిక్ కీ అవసరం)';

  @override
  String get announceOpenConfirmTitle => 'ఎన్‌క్రిప్షన్ లేకుండా పోస్ట్ చేయాలా?';

  @override
  String get announceOpenConfirmBody =>
      'ఓపెన్ పోస్ట్‌లు E2EE కాదు. మార్గంలో ఉన్న ఎవరైనా (మెష్ / రిలేలు) వాటిని చదవవచ్చు. కొనసాగించాలా?';

  @override
  String get announcePostAction => 'పోస్ట్ చేయండి';

  @override
  String get announcePendingRequests => 'యాక్సెస్ అభ్యర్థనలు';

  @override
  String get announceApprove => 'ఆమోదించండి';

  @override
  String get announceDeny => 'తిరస్కరించు';

  @override
  String get announceGranted =>
      'మీరు ఈ బోర్డులో లాక్ చేయబడిన పోస్ట్‌లను చదవవచ్చు';

  @override
  String get announceOwner => 'మీరు ఈ బోర్డుని కలిగి ఉన్నారు';

  @override
  String get announceCopyInvite => 'ఆహ్వాన వచనాన్ని కాపీ చేయండి';

  @override
  String get announceShowInviteQr => 'ఆహ్వాన QRని చూపు';

  @override
  String get announceScanInviteQr => 'స్కాన్ బోర్డు QRని ఆహ్వానిస్తుంది';

  @override
  String get announceFollow => 'ఆహ్వానం నుండి బోర్డుని అనుసరించండి';

  @override
  String get announceFollowHint =>
      'యజమాని నుండి ఆహ్వాన వచనాన్ని లేదా ResilNet లింక్‌ను అతికించండి';

  @override
  String get announceFollowOk => 'క్రింది బోర్డు';

  @override
  String announceFollowOkNamed(String title) {
    return 'ఇప్పుడు “$title”ని అనుసరిస్తున్నారు';
  }

  @override
  String get announceFollowFail => 'ఆహ్వానం చెల్లదు లేదా దెబ్బతిన్నది';

  @override
  String get announceInviteCopied => 'ఆహ్వాన వచనం కాపీ చేయబడింది';

  @override
  String get announceInviteSaveQr => 'QRని సేవ్ చేయండి';

  @override
  String get announceInviteShare => 'ఆహ్వానాన్ని షేర్ చేయండి';

  @override
  String get announceFollowFromCompose =>
      'సందేశ పెట్టెలో బోర్డు ఆహ్వానం కనుగొనబడింది';

  @override
  String get peerConfirmAddTitle => 'నెట్‌వర్క్ సభ్యుడిని జోడించాలా?';

  @override
  String peerConfirmAddBody(String name) {
    return 'వారి పబ్లిక్ కీతో “$name”ని జోడించండి, తద్వారా మీరు వారికి ప్రైవేట్‌గా సందేశం పంపగలరా?';
  }

  @override
  String get peerConfirmAdd => 'సభ్యుడిని జోడించండి';

  @override
  String peerAddedOk(String name) {
    return 'నెట్‌వర్క్ సభ్యులకు $name జోడించబడింది';
  }

  @override
  String get peerAddFromCompose =>
      'సందేశ పెట్టెలో గుర్తింపు / పబ్లిక్ కీ కనుగొనబడింది';

  @override
  String get peerHashCopied => 'పబ్లిక్ కీ హాష్ కాపీ చేయబడింది';

  @override
  String get peerHashOpenChat => 'చాట్ తెరవండి';

  @override
  String get peerHashAddHint =>
      'మ హేష్ కాపీ కొట్టాడు. వారి గుర్తింపు లింక్ లేదా QRని భాగస్వామ్యం చేయమని వారిని అడగండి, తద్వారా మీరు E2EE కోసం పూర్తి పబ్లిక్ కీని జోడించవచ్చు.';

  @override
  String get peerQrNoCode => 'ఈ చిత్రంలో ResilNet QR కనుగొనబడలేదు';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet గుర్తింపు: “$name”\nలింక్‌ని తెరవండి లేదా చాట్‌లో అతికించండి → సభ్యుడిని జోడించండి\nలేదా గుర్తింపు QRని స్కాన్ చేయండి.';
  }

  @override
  String get identityShareInvite => 'గుర్తింపు లింక్‌ను భాగస్వామ్యం చేయండి';

  @override
  String get identityInviteCopied => 'గుర్తింపు లింక్ కాపీ చేయబడింది';

  @override
  String announceInviteSharePreamble(String title) {
    return 'బోర్డు ఆహ్వానం: “$title”\nResilNet → కమ్యూనిటీ బోర్డ్‌లను తెరవండి → ఆహ్వానం నుండి అనుసరించండి\nలేదా QRని స్కాన్ చేయండి / దిగువ లింక్‌ను నొక్కండి.';
  }

  @override
  String get announceConfirmFollowTitle => 'ఈ బోర్డుని అనుసరించాలా?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ఈ ఆహ్వానం నుండి “$title”ని అనుసరించాలా?';
  }

  @override
  String get announceConfirmFollow => 'అనుసరించండి';
}

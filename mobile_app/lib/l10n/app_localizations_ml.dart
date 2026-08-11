// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ResilNet പുതുക്കുന്നു...';

  @override
  String get appRefreshed => 'പുതുക്കി - റേഡിയോകളും കണ്ടെത്തലും പുനരാരംഭിച്ചു';

  @override
  String appRefreshFailed(String error) {
    return 'പുതുക്കൽ പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ഇരട്ട-ടാപ്പ് = മൃദുവായ പുതുക്കൽ. ദീർഘനേരം അമർത്തുക = കഠിനമായ വീണ്ടെടുക്കൽ. ട്രിപ്പിൾ-ടാപ്പ് = എമർജൻസി വൈപ്പ്.';

  @override
  String get softRefreshTipTitle =>
      'കുടുങ്ങിക്കിടക്കുന്നതായി ResilNet തോന്നുന്നുവെങ്കിൽ';

  @override
  String get softRefreshTipBody =>
      'മൃദുവായ റേഡിയോ പുതുക്കലിനായി ResilNet (മുകളിൽ-ഇടത്) രണ്ടുതവണ ടാപ്പ് ചെയ്യുക. ഇപ്പോഴും കുടുങ്ങിയിട്ടുണ്ടെങ്കിൽ: ശീർഷകം ദീർഘനേരം അമർത്തുക, ⋮ → ഹാർഡ് റിക്കവർ അല്ലെങ്കിൽ ക്രമീകരണങ്ങൾ ഉപയോഗിക്കുക. ട്രിപ്പിൾ ടാപ്പ് എന്നത് എമർജൻസി വൈപ്പ് മാത്രമാണ്.';

  @override
  String get softRefreshTipGotIt => 'മനസ്സിലായി';

  @override
  String get infoSoftRefreshTitle => 'ആപ്പ് സ്തംഭിച്ചതായി തോന്നുന്നുവെങ്കിൽ';

  @override
  String get infoSoftRefreshStepRefresh =>
      'രണ്ടുതവണ ResilNet (മുകളിൽ-ഇടത്) → സോഫ്റ്റ് റിഫ്രഷ് റേഡിയോകളും സമീപത്തുള്ള ആളുകളും ടാപ്പ് ചെയ്യുക';

  @override
  String get infoSoftRefreshStepHard =>
      'ഇപ്പോഴും കുടുങ്ങിയിട്ടുണ്ടോ? ശീർഷകം ദീർഘനേരം അമർത്തുക, അല്ലെങ്കിൽ ⋮ / ക്രമീകരണങ്ങൾ → ഹാർഡ് റിക്കവർ ചെയ്യുക';

  @override
  String get infoSoftRefreshStepWait =>
      'ഫല ലഘുഭക്ഷണത്തിനായി കാത്തിരിക്കുക, തുടർന്ന് വീണ്ടും ശ്രമിക്കുക. സെഷൻ റീസെറ്റ് നിങ്ങളുടെ കീകൾ സൂക്ഷിക്കുന്നു.';

  @override
  String get infoSoftRefreshStepWipe =>
      'ട്രിപ്പിൾ-ടാപ്പ് = എമർജൻസി വൈപ്പ് (പ്രാദേശിക ഡാറ്റ ഇല്ലാതാക്കുന്നു) — മനഃപൂർവമാണെങ്കിൽ മാത്രം';

  @override
  String get appRecoverySection => 'ആപ്പ് വീണ്ടെടുക്കൽ';

  @override
  String get appRecoverySectionSubtitle =>
      'ആപ്പ് ഫ്രീസ് ആയി തോന്നുമ്പോൾ ഉപയോഗിക്കുക. സോഫ്റ്റ് = ശീർഷകം രണ്ടുതവണ ടാപ്പ് ചെയ്യുക. കഠിനമായ വീണ്ടെടുക്കൽ കൂടുതൽ ശക്തമാണ്. സെഷൻ റീസെറ്റ് കീകൾ തുടയ്ക്കാതെ സേവനങ്ങൾ പുനരാരംഭിക്കുന്നു.';

  @override
  String get appHardRecoverAction => 'ഹാർഡ് വീണ്ടെടുക്കൽ';

  @override
  String get appHardRecovering => 'കഠിനമായ വീണ്ടെടുക്കൽ…';

  @override
  String get appSessionResetAction => 'സെഷൻ പുനഃസജ്ജമാക്കുക';

  @override
  String get appSessionResetRunning => 'സെഷൻ പുനഃസജ്ജീകരിക്കുന്നു...';

  @override
  String get appSessionResetConfirmTitle => 'സെഷൻ പുനഃസജ്ജമാക്കണോ?';

  @override
  String get appSessionResetConfirmBody =>
      'ഈ ഉപകരണത്തിൽ ResilNet സേവനങ്ങൾ പുനരാരംഭിക്കുന്നു. നിങ്ങളുടെ ഐഡൻ്റിറ്റി കീകൾ സൂക്ഷിച്ചിരിക്കുന്നു.';

  @override
  String get appRecoveryBusy => 'വീണ്ടെടുക്കൽ ഇതിനകം പ്രവർത്തിക്കുന്നു...';

  @override
  String get appRecoveryOk => 'വീണ്ടെടുക്കൽ പൂർത്തിയായി';

  @override
  String get appRecoveryPartial =>
      'ചില ഘട്ടങ്ങൾ ഒഴിവാക്കി വീണ്ടെടുക്കൽ പൂർത്തിയായി - ഇപ്പോഴും കുടുങ്ങിയെങ്കിൽ വീണ്ടും ശ്രമിക്കുക';

  @override
  String get appRecoveryFailed =>
      'വീണ്ടെടുക്കൽ പരാജയപ്പെട്ടു - സെഷൻ പുനഃസജ്ജമാക്കാൻ ശ്രമിക്കുക, അല്ലെങ്കിൽ OS-ൽ നിന്ന് ആപ്പ് നിർബന്ധിതമായി ഉപേക്ഷിക്കുക';

  @override
  String get localWifiTitle => 'പ്രാദേശിക Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ഇൻറർനെറ്റ് ഇല്ലാതെ അടുത്തുള്ള ഡിവൈസുകൾ ലിങ്കുചെയ്യുക — ഒരു LAN-ൽ ഉള്ളതിന് സമാനമാണ്.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ഗേറ്റ്‌വേ SoftAP അല്ല. ഇത് ഫോൺ↔ഫോൺ / ലാൻ മാത്രമാണ്.';

  @override
  String get localWifiUnavailable =>
      'പ്രാദേശിക Wi‑Fi ഇതുവരെ തയ്യാറായിട്ടില്ല - ആപ്പ് സ്റ്റാർട്ടപ്പിനായി കാത്തിരിക്കുക.';

  @override
  String get lxmfBridgeTitle => 'ഹോം നോഡ്';

  @override
  String get lxmfBridgeSubtitle =>
      'സീൽ ചെയ്ത ചാറ്റുകൾ റിലേ ചെയ്യുന്ന നിങ്ങളുടെ Wi‑Fi-ൽ ഓപ്ഷണൽ Mac അല്ലെങ്കിൽ Pi. സ്ഥിരസ്ഥിതിയായി ഓഫ്. എൻഡ്-ടു-എൻഡ് എൻക്രിപ്ഷൻ മാറ്റിസ്ഥാപിക്കുന്നില്ല.';

  @override
  String get lxmfBridgeEnable => 'ഹോം നോഡ് ഉപയോഗിക്കുക';

  @override
  String get lxmfBridgeDisabledHint =>
      'ഈ നെറ്റ്‌വർക്കിൽ Mac അല്ലെങ്കിൽ Pi-യിൽ ബ്രിഡ്ജ് ആപ്പ് പ്രവർത്തിക്കുമ്പോൾ മാത്രം ഓണാക്കുക.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ഓൺലൈൻ — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ഹോം നോഡിൽ എത്താൻ കഴിയുന്നില്ല - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ഹോം നോഡ് വിലാസം';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP അല്ലെങ്കിൽ http://IP:port — ഉദാഹരണം 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'പിയർ → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'അവസ്ഥ പുതുക്കുക';

  @override
  String get lxmfBridgeLabHint => 'വിപുലമായത്: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ഹോം നോഡ് ക്രമീകരണങ്ങൾ';

  @override
  String get lxmfBridgeCheckConnection => 'കണക്ഷൻ പരിശോധിക്കുക';

  @override
  String get lxmfBridgeStatusOnline =>
      'ഹോം നോഡിലേക്ക് കണക്റ്റുചെയ്തിരിക്കുന്നു';

  @override
  String get lxmfBridgeStatusOffline => 'ഹോം നോഡ് ലഭ്യമല്ല';

  @override
  String get lxmfBridgeYourDest =>
      'ഈ നോഡിൻ്റെ വിലാസം (സുഹൃത്തുക്കളുമായി പങ്കിടുക)';

  @override
  String get lxmfBridgeCopyDest => 'വിലാസം പകർത്തുക';

  @override
  String get lxmfBridgeDestCopied => 'വിലാസം പകർത്തി';

  @override
  String get lxmfBridgeLinkedPeers => 'ലിങ്കുചെയ്ത സുഹൃത്തുക്കൾ';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ഓരോ സുഹൃത്തിനും അവരുടെ ഹോം-നോഡ് വിലാസം ഒരിക്കൽ ആവശ്യമാണ്. അപ്പോൾ സീൽ ചെയ്ത ചാറ്റുകൾക്ക് ഈ പാത ഉപയോഗിക്കാം.';

  @override
  String get lxmfBridgeNoLinks =>
      'ഇതുവരെ സുഹൃത്തുക്കളൊന്നും ലിങ്ക് ചെയ്‌തിട്ടില്ല.';

  @override
  String get lxmfBridgeAddLink => 'ഒരു സുഹൃത്തിനെ ലിങ്ക് ചെയ്യുക';

  @override
  String get lxmfBridgePickPeer => 'സുഹൃത്ത്';

  @override
  String get lxmfBridgePeerDest => 'അവരുടെ ഹോം-നോഡ് വിലാസം';

  @override
  String get lxmfBridgePeerDestHint =>
      'അവരുടെ ഹോം നോഡ് സ്ക്രീനിൽ നിന്നുള്ള 32-അക്ഷര കോഡ്';

  @override
  String get lxmfBridgeInvalidDest =>
      'ആ വിലാസം സാധുതയുള്ളതായി തോന്നുന്നില്ല. അവരുടെ ഹോം നോഡിൽ നിന്ന് മുഴുവൻ കോഡും ഒട്ടിക്കുക.';

  @override
  String get lxmfBridgeRemoveLink => 'അൺലിങ്ക് ചെയ്യുക\n';

  @override
  String get lxmfBridgeSaveLink => 'സംരക്ഷിക്കുക';

  @override
  String get lxmfBridgeLinkSaved => 'സുഹൃത്ത് ലിങ്ക് ചെയ്തു';

  @override
  String get lxmfBridgeNoPeers =>
      'ഇതുവരെ സന്ദേശമയയ്‌ക്കാവുന്ന കോൺടാക്റ്റുകളൊന്നുമില്ല — ആദ്യം ഒരു സുഹൃത്തിനെ ചേർക്കുക.';

  @override
  String get lxmfBridgeHelp =>
      'മാക്/പൈയിൽ ബ്രിഡ്ജ് പ്രവർത്തിപ്പിക്കുന്നത് നിലനിർത്തുക. ഈ പാത നിങ്ങളുടെ LAN-ൽ നിലനിൽക്കുന്നു — ഇത് LoRa ഇന്റർനെറ്റ് അല്ലെങ്കിൽ ബ്ലൂടൂത്ത് മെഷ് മാറ്റിസ്ഥാപിക്കുന്നില്ല.';

  @override
  String get localWifiModeHotspot => 'സമീപത്ത്';

  @override
  String get localWifiModeRouter => 'റൂട്ടർ';

  @override
  String get localWifiHotspotIntro =>
      'ഒരു ഉപകരണം ഒരു വ്യക്തിഗത ഹോട്ട്‌സ്പോട്ട് പങ്കിടുന്നു. മറ്റുള്ളവർ ആ ഹോട്ട്‌സ്പോട്ടിൽ ചേരുക, തുടർന്ന് അവയെ ലോക്കൽ നെറ്റ്‌വർക്കിൽ ResilNet കണ്ടെത്തുന്നു.';

  @override
  String get localWifiHostAction => 'നെറ്റ്‌വർക്ക് സൃഷ്‌ടിക്കുക (ഹോസ്റ്റ്)';

  @override
  String get localWifiJoinAction => 'നെറ്റ്‌വർക്കിൽ ചേരുക';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android ക്രമീകരണങ്ങൾ തുറന്ന് വ്യക്തിഗത ഹോട്ട്‌സ്‌പോട്ട് (അല്ലെങ്കിൽ ഇൻ്റർനെറ്റ് പങ്കിടൽ) ഓണാക്കുക.\n2. ഹോട്ട്‌സ്‌പോട്ട് പേരും (പാസ്‌വേഡും) സുഹൃത്തുക്കളോട് പറയുക.\n3. ഇവിടെ തിരികെ വന്ന് \"ഹോട്ട്‌സ്‌പോട്ട് ഓണാണ് - കാത്തിരിപ്പ് ആരംഭിക്കുക\" ടാപ്പ് ചെയ്യുക.';

  @override
  String get localWifiHostReady =>
      'ഹോട്ട്‌സ്‌പോട്ട് ഓണാണ് - കാത്തിരിപ്പ് ആരംഭിക്കുക';

  @override
  String get localWifiHostWaiting =>
      'സുഹൃത്തുക്കൾ ചേരുന്നതിനായി കാത്തിരിക്കുന്നു...';

  @override
  String get localWifiJoinSteps =>
      '1. സിസ്റ്റം ക്രമീകരണങ്ങൾ തുറന്ന് നിങ്ങളുടെ സുഹൃത്തിൻ്റെ സ്വകാര്യ ഹോട്ട്‌സ്‌പോട്ടിൽ ചേരുക.\n2. ഇവിടെ തിരിച്ചെത്തി \"ഞാൻ കണക്റ്റുചെയ്‌തിരിക്കുന്നു - തിരയുക\" ടാപ്പ് ചെയ്യുക.';

  @override
  String get localWifiJoinReady => 'ഞാൻ ബന്ധപ്പെട്ടിരിക്കുന്നു - തിരയുക';

  @override
  String get localWifiRouterIntro =>
      'എല്ലാ ഉപകരണവും ഒരേ Wi‑Fi റൂട്ടർ/AP-ലേക്ക് ബന്ധിപ്പിക്കുക. റൂട്ടറിന് ഇൻ്റർനെറ്റ് ആവശ്യമില്ല - ഒരു പങ്കിട്ട പ്രാദേശിക നെറ്റ്‌വർക്ക് മാത്രം.';

  @override
  String get localWifiRouterSearch => 'ഇതിൽ Wi‑Fi തിരയുക';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi വിവരം പുതുക്കുക';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi-ൽ അല്ല';

  @override
  String get localWifiRouterNoWifiBody =>
      'സിസ്റ്റം ക്രമീകരണങ്ങളിൽ റൂട്ടറിൻ്റെ Wi‑Fi-ൽ ചേരുക, തുടർന്ന് വീണ്ടും തിരയുക.';

  @override
  String get localWifiDiscovering => 'ലോക്കലിൽ തിരയുന്നു Wi‑Fi...';

  @override
  String get localWifiPeersFound => 'ഈ നെറ്റ്‌വർക്കിലെ ഉപകരണങ്ങൾ';

  @override
  String get localWifiStop => 'നിർത്തുക';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi പേര് ലഭ്യമല്ല';

  @override
  String get localWifiStubBanner => 'LAN സോക്കറ്റിനായി കാത്തിരിക്കുന്നു...';

  @override
  String get localWifiLiveBanner =>
      'LAN കണ്ടെത്തൽ തത്സമയം (UDP) — ഈ Wi‑Fi-ൽ പ്രഖ്യാപിക്കുക + സീൽ ചെയ്ത ചാറ്റ്';

  @override
  String get localWifiEmptyHotspot =>
      'ഇതുവരെ ഉപകരണങ്ങളൊന്നുമില്ല.\nസുഹൃത്തുക്കൾ നിങ്ങളുടെ ഹോട്ട്‌സ്‌പോട്ടിൽ ചേർന്നിട്ടുണ്ടോ എന്നും ലോക്കൽ നെറ്റ്‌വർക്ക് ആക്‌സസ് അനുവദിച്ചിട്ടുണ്ടെന്നും പരിശോധിക്കുക.';

  @override
  String get localWifiEmptyRouter =>
      'ഇതുവരെ ഉപകരണങ്ങളൊന്നുമില്ല.\nഅതേ SSID? ലോക്കൽ നെറ്റ്‌വർക്ക് അനുവദനീയമാണോ? ചില റൂട്ടറുകൾ ഡിവൈസ് ടു ഡിവൈസ് ട്രാഫിക് (എപി ഐസൊലേഷൻ) തടയുന്നു.';

  @override
  String get localWifiIsolationHelp =>
      'എന്തുകൊണ്ടാണ് നമുക്ക് പരസ്പരം കണ്ടെത്താൻ കഴിയാത്തത്?';

  @override
  String get localWifiIsolationTitle => 'റൂട്ടർ ക്ലയൻ്റുകളെ ഒറ്റപ്പെടുത്താം';

  @override
  String get localWifiIsolationBody =>
      'AP/ക്ലയൻ്റ് ഐസൊലേഷൻ (അല്ലെങ്കിൽ ഒരു അതിഥി നെറ്റ്‌വർക്ക്) ഓണാണെങ്കിൽ, അതേ Wi‑Fi-ലെ ഫോണുകൾക്ക് സംസാരിക്കാനാകില്ല. ഐസൊലേഷൻ ഓഫാക്കുക, പ്രധാന SSID ഉപയോഗിക്കുക, അല്ലെങ്കിൽ Nearby (Hotspot) മോഡിലേക്ക് മാറുക.';

  @override
  String get localWifiPeerReady => 'ചാറ്റ് ചെയ്യാൻ തയ്യാറാണ് (കീ ഉണ്ട്)';

  @override
  String get localWifiPeerNeedKey =>
      'കണ്ടെത്തി - കീകൾ കൈമാറാൻ QR സ്കാൻ ചെയ്യുക';

  @override
  String get localWifiErrorTitle => 'പ്രാദേശിക Wi‑Fi പിശക്';

  @override
  String get localWifiErrorBody =>
      'എന്തോ കുഴപ്പം സംഭവിച്ചു. നിർത്തി വീണ്ടും ശ്രമിക്കുക.';

  @override
  String get preparingSystem => 'സംവിധാനം തയ്യാറാക്കുന്നു...';

  @override
  String get bootFailedTitle => 'ആരംഭിക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get retry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get bootRecoveryAction =>
      'പുതിയ ഐഡൻ്റിറ്റി ആരംഭിക്കുക (പ്രാദേശിക ഡാറ്റ മായ്‌ക്കുക)';

  @override
  String get bootRecoveryConfirmTitle => 'പുതിയ ഐഡൻ്റിറ്റി ആരംഭിക്കണോ?';

  @override
  String get bootRecoveryConfirmBody =>
      'ഇത് ഈ ഉപകരണത്തിലെ പ്രാദേശിക ചാറ്റുകൾ, കീകൾ, ഐഡൻ്റിറ്റി എന്നിവ ശാശ്വതമായി മായ്‌ക്കും.\nനിങ്ങളുടെ പുതിയ ഐഡൻ്റിറ്റി ഉപയോഗിച്ച് സമപ്രായക്കാർ നിങ്ങളുടെ QR വീണ്ടും സ്കാൻ ചെയ്യണം.\nഇത് പഴയപടിയാക്കാനാകില്ല.';

  @override
  String get bootRecoveryRunning =>
      'പ്രാദേശിക ഐഡന്റിറ്റി പുനഃസജ്ജീകരിക്കുന്നു...';

  @override
  String get bootRecoverySuccess => 'പ്രാദേശിക ഐഡൻ്റിറ്റി റീസെറ്റ് പൂർത്തിയായി';

  @override
  String bootRecoveryFailed(String error) {
    return 'ഐഡൻ്റിറ്റി പുനഃസജ്ജമാക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get save => 'സംരക്ഷിക്കുക';

  @override
  String get close => 'അടയ്ക്കുക';

  @override
  String get start => 'ആരംഭിക്കുക';

  @override
  String get send => 'അയക്കുക';

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get language => 'ഭാഷ';

  @override
  String get languageSubtitle =>
      'ഡിഫോൾട്ടായി ആപ്പ് നിങ്ങളുടെ ഫോൺ ഭാഷ പിന്തുടരുന്നു (പിന്തുണയ്‌ക്കുമ്പോൾ). മറ്റ് ഭാഷകൾ ഇംഗ്ലീഷിലേക്ക് മടങ്ങുന്നു. നിങ്ങൾക്ക് ഇവിടെ ഒരു ഭാഷ ലോക്ക് ചെയ്യാനും കഴിയും.';

  @override
  String get languageSystem => 'സിസ്റ്റം ഡിഫോൾട്ട്';

  @override
  String get languageThai => 'തായ്';

  @override
  String get languageEnglish => 'ഇംഗ്ലീഷ്';

  @override
  String get notificationsTooltip => 'അറിയിപ്പ് ക്രമീകരണങ്ങൾ';

  @override
  String get enableMessageNotifications =>
      'സന്ദേശ അറിയിപ്പുകൾ പ്രവർത്തനക്ഷമമാക്കുക';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 സന്ദേശങ്ങളും ഓൺലൈനിൽ ആളുകളും (പ്രാദേശിക അലേർട്ടുകൾ)';

  @override
  String get networkMembersTooltip => 'നെറ്റ്‌വർക്ക് അംഗങ്ങൾ';

  @override
  String get identityQrTooltip => 'ഐഡൻ്റിറ്റി / QR';

  @override
  String get feedDirects => 'ചാറ്റ്';

  @override
  String get feedMesh => '#മെഷ്';

  @override
  String get feedGeo => 'ഏരിയ';

  @override
  String get feedDirectsSubtitle => 'സ്വകാര്യ E2EE സന്ദേശങ്ങൾ';

  @override
  String get feedMeshSubtitle => 'സമീപത്തുള്ള സമപ്രായക്കാർ (BLE)';

  @override
  String get feedGeoSubtitle => 'ജിയോഹാഷ് കണ്ടെത്തൽ ചാനൽ';

  @override
  String get peerIdHint =>
      'ഒരു ചാറ്റ് ആരംഭിക്കാൻ റിസീവർ ഐഡി (പബ്ലിക് കീ ഹാഷ്) ഒട്ടിക്കുക';

  @override
  String get directsEmpty =>
      'ഇതുവരെ ചാറ്റുകളൊന്നുമില്ല - ആരംഭിക്കുന്നതിന് ഒരു QR സ്കാൻ ചെയ്യുക അല്ലെങ്കിൽ ഒരു റിസീവർ ഐഡി ഒട്ടിക്കുക\nഅയയ്‌ക്കുന്നതിന് മുമ്പ് സന്ദേശങ്ങൾ E2EE ഉപയോഗിച്ച് സീൽ ചെയ്‌തിരിക്കുന്നു (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ചാറ്റ് തുറക്കാൻ ടാപ്പ് ചെയ്യുക';

  @override
  String get meshIntro =>
      'BLE ശ്രേണിയിലുള്ള സമപ്രായക്കാർ — ഒരു സ്വകാര്യ E2EE ചാറ്റിനായി ടാപ്പുചെയ്യുക (#mesh-ൽ പൊതു രചനയില്ല)\nഹൈബ്രിഡ് റൂട്ടർ വഴി അയയ്ക്കുന്നു (BLE + LoRa + Nostr ഓൺലൈനായിരിക്കുമ്പോൾ)';

  @override
  String get meshEmptyRunning =>
      'ഇതുവരെ സമീപത്തുള്ള സമപ്രായക്കാരില്ല - BLE പരിധിക്കുള്ളിൽ മറ്റൊരു ഉപകരണത്തിൽ ആപ്പ് തുറക്കുക';

  @override
  String get meshEmptyStopped =>
      'BLE പ്രവർത്തിക്കുന്നില്ല - ബ്ലൂടൂത്ത് / ലൊക്കേഷൻ അനുമതി നൽകുക';

  @override
  String get meshNearbyPrefix => 'സമീപത്ത്';

  @override
  String get meshRetentionTitle => 'സന്ദേശങ്ങൾ സ്വയമേവ ഇല്ലാതാക്കുക';

  @override
  String get meshRetentionSubtitle =>
      'പഴയ പ്രാദേശിക ചാറ്റ് ചരിത്രം സ്വയമേവ നീക്കം ചെയ്യപ്പെടും';

  @override
  String get meshRetentionKeep => 'സൂക്ഷിക്കുക';

  @override
  String get meshRetention1Day => '1 ദിവസം';

  @override
  String get meshRetention3Days => '3 ദിവസം';

  @override
  String get meshRetention7Days => '7 ദിവസം';

  @override
  String get refreshLocationTooltip => 'സ്ഥാനം പുതുക്കുക';

  @override
  String get geoIntro =>
      'ഈ ജിയോഹാഷിൽ ഓൺലൈനിൽ ഉള്ള ആളുകൾക്ക് 1:1 അല്ലെങ്കിൽ ഒരു ഏരിയ പബ്ലിക് ഫാൻ-ഔട്ട് ഉപയോഗിച്ച് സന്ദേശം അയയ്‌ക്കാം (ഇപ്പോഴും ഒരു പിയർക്ക് E2EE സീൽ ചെയ്തിരിക്കുന്നു - പ്ലെയിൻ ടെക്‌സ്‌റ്റ് അല്ല)';

  @override
  String geoEmpty(String channel) {
    return '$channel ൽ ഇതുവരെ ആരും ഓൺലൈനിൽ ഇല്ല\nഗതാഗതം → ഇൻ്റർനെറ്റ്/ഓട്ടോ ഉപയോഗിക്കുക, Nostr നായി കാത്തിരിക്കുക, ലൊക്കേഷൻ പുതുക്കുക';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'ഓൺലൈനിൽ $channel • 1:1 E2EE എന്നതിനായി ടാപ്പുചെയ്യുക';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'സമീപത്തുള്ള (ഏരിയയുടെ സാന്നിധ്യം കാത്തിരിക്കുന്നു) • 1:1 E2EE എന്നതിനായി ടാപ്പ് ചെയ്യുക';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nostr ൽ $channel ൽ കണ്ടു • കണ്ടെത്തൽ മാത്രം (പൈതൃകം)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'ലെഗസി അജ്ഞാത സാന്നിധ്യം - ഒരു ബന്ധിത പിയറിനായി കാത്തിരിക്കുക അല്ലെങ്കിൽ QR കൈമാറുക';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE സമീപത്ത് — 1:1 E2EE ആരംഭിക്കാൻ QR സ്കാൻ ചെയ്യുക';

  @override
  String get geoInternetDiscoverHint =>
      'ഏരിയ ഇൻ്റർനെറ്റ് കണ്ടെത്തലിന് Nostr കണക്റ്റ് ചെയ്യേണ്ടതുണ്ട് (ക്രമീകരണങ്ങൾ → ഗതാഗതം → ഇൻ്റർനെറ്റ്/ഓട്ടോ)';

  @override
  String get geoEmptyNoLocation =>
      'ലൊക്കേഷൻ ഇതുവരെ പരിഹരിച്ചിട്ടില്ല - Nostr-ൽ നിങ്ങളുടെ ജിയോഹാഷ് പ്രസിദ്ധീകരിക്കാൻ GPS-നെ അനുവദിക്കുകയും പുതുക്കുകയും ചെയ്യുക';

  @override
  String get geoEmptyNeedsPermission =>
      'ലൊക്കേഷൻ അനുമതി നിരസിച്ചു - ക്രമീകരണങ്ങൾ → സ്വകാര്യത → ലൊക്കേഷനിൽ ResilNet അനുവദിക്കുക';

  @override
  String get geoEmptyServicesDisabled =>
      'ലൊക്കേഷൻ സേവനങ്ങൾ ഓഫാണ് - ക്രമീകരണങ്ങളിൽ അവ ഓണാക്കുക';

  @override
  String get geoEmptyNoGpsFix =>
      'ഒരു GPS ഫിക്സ് (Wi‑Fi iPad-കളിൽ സാധാരണമാണ്) നേടാനായില്ല - ജിയോഹാഷ് മാനുവലായി താഴെ സജ്ജമാക്കുക';

  @override
  String get geoEmptyTeleportHint =>
      'സ്ഥല ഐക്കണിൽ ടാപ്പ് ചെയ്യുക → ഒരു ജിയോഹാഷ് നൽകുക (ഉദാ. w5) → ടെലിപോർട്ട്';

  @override
  String get geoSetGeohashManually => 'ജിയോഹാഷ് സജ്ജമാക്കുക';

  @override
  String get geoTeleportHint =>
      'GPS ഇല്ലേ? ജിയോഹാഷ് പ്രിഫിക്‌സ് (2–7 അക്ഷരങ്ങൾ, ഉദാ. w5) നൽകി ടെലിപോർട്ട് ടാപ്പുചെയ്യുക';

  @override
  String get geoTeleportInvalid =>
      'അസാധുവായ ജിയോഹാഷ് - അടിസ്ഥാന 32 അക്ഷരങ്ങൾ/അക്കങ്ങൾ മാത്രം ഉപയോഗിക്കുക (ഉദാ. w5 അല്ലെങ്കിൽ w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ഏരിയ $channel ആയി സജ്ജീകരിച്ചു';
  }

  @override
  String geoManualActive(String channel) {
    return 'മാനുവൽ ഏരിയ: $channel (GPS പുതുക്കൽ അസാധുവാക്കും)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr തയ്യാറല്ല — വീണ്ടും കണക്റ്റുചെയ്യുക ടാപ്പ് ചെയ്യുക (0/0 ഇത് വിജയിക്കുന്നതുവരെ)';

  @override
  String get geoEmptyMeshOnly =>
      'ഗതാഗതം മെഷിന് മാത്രമുള്ളതാണ് - Nostr-ന് മുകളിലുള്ള സഹപാഠികളെ കണ്ടെത്താൻ ഇൻ്റർനെറ്റിലേക്കോ ഓട്ടോയിലേക്കോ മാറുക';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel-ൽ ഇതുവരെ ആരും ഇല്ല - രണ്ട് ഉപകരണങ്ങളിലും ഏരിയ + ഇൻ്റർനെറ്റ് തുറന്ന് ~60-കൾ കാത്തിരിക്കുക';
  }

  @override
  String get geoChannelFallback => '#ഏരിയ';

  @override
  String get geoRefreshLocation => 'സ്ഥാനം പുതുക്കുക';

  @override
  String get settingsClearLocationTitle => 'സ്ഥലം മായ്‌ക്കുക';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / ടെലിപോർട്ട് ജിയോഹാഷ് നീക്കം ചെയ്യുക (ഏരിയ #- ആയി മാറുന്നു)';

  @override
  String get settingsClearLocationConfirmTitle => 'ലൊക്കേഷൻ മായ്‌ക്കണോ?';

  @override
  String get settingsClearLocationConfirmBody =>
      'ഈ ഉപകരണത്തിൽ സംഭരിച്ചിരിക്കുന്ന ജിയോഹാഷ് ഇല്ലാതാക്കുന്നു. നിങ്ങൾക്ക് ജിപിഎസ് പുതുക്കുകയോ ടെലിപോർട്ട് ചെയ്യുകയോ ചെയ്യാം.';

  @override
  String get settingsClearLocationAction => 'സ്ഥലം മായ്‌ക്കുക';

  @override
  String get settingsClearLocationSnack => 'സ്ഥലം മായ്ച്ചു';

  @override
  String get chatVoiceTooLarge =>
      'വോയ്സ് നോട്ട് വളരെ വലുതാണ് - പരമാവധി ~30 സെക്കൻഡ്';

  @override
  String get chatVoiceNeedInternet =>
      'വോയ്സ് നോട്ടിന് ഇൻ്റർനെറ്റ് ആവശ്യമാണ് (Nostr) — BLE എന്നതിന് മാത്രം വളരെ വലുതാണ്';

  @override
  String get chatVoiceSentInternet => 'ഇൻ്റർനെറ്റ് വഴി വോയ്സ് നോട്ട് അയച്ചു';

  @override
  String get noticeAnonMention => 'പരാമർശിക്കുക';

  @override
  String get noticeAnonDm => 'നേരിട്ടുള്ള സന്ദേശം';

  @override
  String get noticeAnonHug => 'ആലിംഗനം';

  @override
  String get noticeAnonSlap => 'അടിക്കുക';

  @override
  String get noticeAnonBlock => 'തടയുക';

  @override
  String get noticeAnonNeedKey =>
      'ഇതുവരെ പബ്ലിക് കീ ഒന്നുമില്ല - ആദ്യം QR 1:1 ന് കൈമാറുക';

  @override
  String get noticeAnonActionSent => 'അയച്ചു';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon തടഞ്ഞു';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* ആലിംഗനം $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* സ്ലാപ്പുകൾ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr വീണ്ടും ബന്ധിപ്പിക്കുക';

  @override
  String get nostrSectionTitle => 'Nostr റിലേകൾ';

  @override
  String get nostrSectionSubtitle =>
      'ഇൻ്റർനെറ്റ് സന്ദേശമയയ്‌ക്കലും ഏരിയ കണ്ടെത്തലും ഈ റിലേകൾ ഉപയോഗിക്കുന്നു. സ്റ്റാറ്റസ് ഓഫ്‌ലൈനിൽ തുടരുകയാണെങ്കിൽ വീണ്ടും കണക്റ്റുചെയ്യുക ടാപ്പ് ചെയ്യുക.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return '$connected/$total ബന്ധിപ്പിച്ചു';
  }

  @override
  String get nostrStatusOffline =>
      'ഓഫ്‌ലൈൻ - റിലേകൾ ലിസ്‌റ്റ് ചെയ്‌തിട്ടുണ്ടെങ്കിലും ഒന്നും കണക്‌റ്റ് ചെയ്‌തിട്ടില്ല';

  @override
  String get nostrStatusNotInit =>
      'ആരംഭിച്ചിട്ടില്ല (0/0) — സമാരംഭിക്കാൻ വീണ്ടും ബന്ധിപ്പിക്കുക ടാപ്പ് ചെയ്യുക';

  @override
  String get nostrReconnectAction => 'Nostr വീണ്ടും ബന്ധിപ്പിക്കുക';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr ബന്ധിപ്പിച്ചിരിക്കുന്നു ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ഇപ്പോഴും ഓഫ്‌ലൈനിൽ - Wi‑Fi/സെല്ലുലാർ പരിശോധിക്കുക അല്ലെങ്കിൽ വീണ്ടും ശ്രമിക്കുക';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get nostrReconnecting => 'റിലേകളിലേക്ക് ബന്ധിപ്പിക്കുന്നു...';

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
    return '$channel-ൽ ഇൻ്റർനെറ്റ് (Nostr) • സീൽ ചെയ്ത ചാറ്റ് തയ്യാറാണ്';
  }

  @override
  String get transportModeTitle => 'ഏരിയ ഗതാഗതം';

  @override
  String get transportModeSubtitle =>
      'മെഷ് = BLE സമീപത്തുള്ള (റേഡിയോ) Nostr · ഇൻ്റർനെറ്റ് & ഓട്ടോ = Nostr ആളുകളുടെ ലിസ്റ്റ് ഇല്ലെങ്കിൽ';

  @override
  String get transportModeMesh => 'മെഷ്';

  @override
  String get transportModeInternet => 'ഇൻ്റർനെറ്റ്';

  @override
  String get transportModeAuto => 'ഓട്ടോ';

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
  String get geoPublicHint => 'ഈ പ്രദേശത്തെ ഓൺലൈനിൽ എല്ലാവർക്കും പൊതു സന്ദേശം';

  @override
  String get geoPublicSend => 'പൊതു';

  @override
  String geoPublicHelp(int count) {
    return '$count ഓൺലൈൻ പിയർ(കൾ) ലേക്ക് സീൽ ചെയ്ത ഫാൻ-ഔട്ട് - ഓരോരുത്തർക്കും ഒരു സ്വകാര്യ എൻവലപ്പ് ലഭിക്കുന്നു';
  }

  @override
  String geoPublicSent(int count) {
    return 'ഈ ഏരിയയിലെ $count പിയർ(കൾ)ക്ക് അയച്ചു';
  }

  @override
  String get geoPublicSentNone =>
      'ഓൺലൈനിൽ സന്ദേശമയയ്‌ക്കാവുന്ന സമപ്രായക്കാരില്ല - കീകളുള്ള സമപ്രായക്കാർക്കൊപ്പം ഏരിയ/മെഷ് തുറക്കുക, അല്ലെങ്കിൽ BLE/Nostr നായി കാത്തിരിക്കുക';

  @override
  String get areaPublicBadge => 'ഏരിയ പൊതു';

  @override
  String get geoErrorPermission =>
      'ലൊക്കേഷൻ വായിക്കാൻ കഴിഞ്ഞില്ല - ലൊക്കേഷൻ അനുമതി പരിശോധിക്കുക';

  @override
  String get geoPrecisionRegion => 'മേഖല';

  @override
  String get geoPrecisionProvince => 'പ്രവിശ്യ';

  @override
  String get geoPrecisionCity => 'നഗരം';

  @override
  String get geoPrecisionNeighborhood => 'അയൽപ്പക്കം';

  @override
  String get geoPrecisionBlock => 'തടയുക';

  @override
  String get aliasTitle => 'വിളിപ്പേര് സജ്ജീകരിക്കുക (അപരനാമം ബന്ധപ്പെടുക)';

  @override
  String get aliasHintBody =>
      'ഈ അപരനാമം ഈ ഉപകരണത്തിൽ മാത്രം സംഭരിച്ചിരിക്കുന്നു (പ്രാദേശികമായി മാത്രം)\nഇത് ഒരിക്കലും E2EE ട്രാഫിക്കിനൊപ്പം അയയ്ക്കില്ല';

  @override
  String get aliasLabel => 'വിളിപ്പേര്';

  @override
  String get aliasHint => 'ഉദാ. \"ഗ്രാമത്തലവൻ\", \"പി\'സോംചായി\"...';

  @override
  String get settingsDevices => 'ഉപകരണങ്ങൾ';

  @override
  String get settingsFirmwareTitle =>
      'ESP32 ഫേംവെയർ ഡൗൺലോഡ് / അപ്ഡേറ്റ് ചെയ്യുക';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ഫയലുകൾ ഡൗൺലോഡ് ചെയ്‌ത് OTA വഴി ESP32 ബോർഡ് അപ്‌ഡേറ്റ് ചെയ്യുക';

  @override
  String get mtBridgeTitle => 'Meshtastic പാലം';

  @override
  String get mtBridgeSettingsSubtitle =>
      'വാചകം മാത്രമുള്ള A/B ബ്രിഡ്ജ് — ResilNet E2EE അല്ല';

  @override
  String get mtBridgeIntro =>
      'Meshtastic നും ResilNet നും ഇടയിൽ ചെറിയ പ്ലെയിൻ ടെക്സ്റ്റ് നീക്കുക. എ, ബി മോഡുകൾ ഒരേ സമയം പ്രവർത്തിക്കാൻ കഴിയില്ല. ഇത് എൻഡ്-ടു-എൻഡ് എൻക്രിപ്ഷൻ അല്ല.';

  @override
  String get mtBridgeModeLabel => 'മോഡ്';

  @override
  String get mtBridgeModeOff => 'ഓഫ് ചെയ്യുക';

  @override
  String get mtBridgeModeA => 'ഇൻജസ്റ്റ് എ';

  @override
  String get mtBridgeModeB => 'എഗ്രസ് ബി';

  @override
  String get mtBridgeModeOffShort => 'ഓഫ്';

  @override
  String get mtBridgeModeAShort => 'എയിൽ';

  @override
  String get mtBridgeModeBShort => 'പുറത്ത് ബി';

  @override
  String get mtBridgeMutexHint =>
      'ഒരു മോഡ് തിരഞ്ഞെടുക്കുന്നത് മറ്റൊന്ന് യാന്ത്രികമായി ഓഫാകും. ഒരേസമയം A+B പിന്തുണയ്ക്കുന്നില്ല.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ഡെമോ (ലോഗിംഗ്)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ഇൻബൗണ്ട് ടെക്‌സ്‌റ്റ് അറിയിപ്പുകൾക്ക് കീഴിൽ #meshtastic ആയി ദൃശ്യമാകുന്നു. മെഷ് റിലേ ഓപ്ഷണലാണ് (സ്ഥിരസ്ഥിതിയായി ഓഫ്).';

  @override
  String get mtBridgeRelayTitle => 'ResilNet മെഷിലും റിലേ';

  @override
  String get mtBridgeRelayHint =>
      'ഓണായിരിക്കുമ്പോൾ, ഒപ്പിട്ട പൊതു ബുള്ളറ്റിനുകൾ പ്രക്ഷേപണം ചെയ്യും. ഓഫ് = ഈ ഫോണിൻ്റെ അറിയിപ്പുകൾ മാത്രം.';

  @override
  String get mtBridgeSimulateHint => 'ഡെമോ സന്ദേശം';

  @override
  String get mtBridgeSimulate => 'Meshtastic സന്ദേശം അനുകരിക്കുക';

  @override
  String get mtBridgeIngestOk => 'നോട്ടീസുകളിൽ ഉൾപ്പെടുത്തി (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'മുന്നറിയിപ്പ്: ഇവിടെ അയച്ച സന്ദേശങ്ങൾ ResilNet E2EE അല്ല. Meshtastic പാതയിലുള്ള ആർക്കും അവ വായിക്കാനാകും.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'പ്രസിദ്ധീകരിക്കാനുള്ള വാചകം';

  @override
  String get mtBridgeSend => 'Meshtastic എന്നതിലേക്ക് അയയ്‌ക്കുക';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic എന്നതിനായി ക്യൂവിലാണ് (ലോഗ് / ചരിത്രം കാണുക)';

  @override
  String get mtBridgeLastEgress => 'അവസാന കയറ്റം';

  @override
  String get mtBridgeEgressHistory => 'സമീപകാല മുന്നേറ്റം';

  @override
  String get mtBridgeOffHint =>
      'ബ്രിഡ്ജ് ഉപയോഗിക്കാൻ Ingest (A) അല്ലെങ്കിൽ Egress (B) ഓണാക്കുക.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE അല്ല';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT ഗതാഗതം ഉപയോഗിക്കുക';

  @override
  String get mtBridgeUseMqttHint =>
      'ഓഫ് = ഡെമോ ലോഗിംഗ് മാത്രം (MQTT ഇൻബൗണ്ട് അവഗണിച്ചു). കണക്‌റ്റുചെയ്‌തിരിക്കുമ്പോൾ ഇൻജസ്റ്റ്/എഗ്രസ് ചെയ്യുന്നതിനായി ഓൺ = MQTT.';

  @override
  String get mtBridgeMqttHost => 'ബ്രോക്കർ ഹോസ്റ്റ്';

  @override
  String get mtBridgeMqttPort => 'തുറമുഖം';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ഉപയോഗിക്കുക';

  @override
  String get mtBridgeMqttTlsHint =>
      'സാധാരണ പോർട്ട് 8883. സിസ്റ്റം സർട്ടിഫിക്കറ്റുകൾ ഉപയോഗിക്കുന്നു; ഹാൻഡ്‌ഷേക്ക് പിശകുകളിൽ മൃദുവായി പരാജയപ്പെടുന്നു.';

  @override
  String get mtBridgeMqttAutoReconnect => 'സ്വയമേവ വീണ്ടും ബന്ധിപ്പിക്കുക';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ഓണായിരിക്കുമ്പോൾ, ഡ്രോപ്പുകൾക്കുശേഷം ക്ലയൻ്റ് വീണ്ടും കണക്റ്റുചെയ്യാൻ ശ്രമിക്കുന്നു. പുനഃസ്ഥാപിക്കുന്നതുവരെ കണക്റ്റുചെയ്യുന്നതായി സ്റ്റാറ്റസ് കാണിക്കുന്നു.';

  @override
  String get mtBridgeMqttTopicHelpers => 'വിഷയ സഹായികൾ';

  @override
  String get mtBridgeMqttRegion => 'മേഖല പ്രിഫിക്സ് (ഓപ്ഷണൽ)';

  @override
  String get mtBridgeMqttRegionHint =>
      'സജ്ജമാക്കുമ്പോൾ, msh/<region>/2/json ആയി പുനർനിർമ്മിക്കുന്ന റൂട്ട് പ്രയോഗിക്കുക (വിഷയ റൂട്ട് അസാധുവാക്കുന്നു).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON വിഷയ റൂട്ട്';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ഡൗൺലിങ്ക് ചാനലിൻ്റെ പേര്';

  @override
  String get mtBridgeMqttApplyTopics =>
      'റൂട്ട് പ്രയോഗിക്കുക → സബ്‌സ്‌ക്രൈബ് ചെയ്യുക / വിഷയങ്ങൾ പ്രസിദ്ധീകരിക്കുക';

  @override
  String get mtBridgeMqttAdvanced => 'വിപുലമായ MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, വീണ്ടും ബന്ധിപ്പിക്കുക, വിഷയങ്ങൾ, ക്രെഡൻഷ്യലുകൾ';

  @override
  String get mtBridgeMqttTopicIn => 'വിഷയം സബ്സ്ക്രൈബ് ചെയ്യുക';

  @override
  String get mtBridgeMqttTopicOut => 'വിഷയം പ്രസിദ്ധീകരിക്കുക';

  @override
  String get mtBridgeMqttGatewayFrom => 'ഗേറ്റ്‌വേ നോഡ് ഐഡി (നിന്ന്)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ഡെസിമൽ ഐഡി അല്ലെങ്കിൽ !ഹെക്സ് — sendtext ഡൗൺലിങ്കിന് ആവശ്യമാണ്';

  @override
  String get mtBridgeMqttChannelIndex => 'മെഷ് ചാനൽ സൂചിക (ഓപ്ഷണൽ 0–7)';

  @override
  String get mtBridgeMqttUser => 'ഉപയോക്തൃനാമം (ഓപ്ഷണൽ)';

  @override
  String get mtBridgeMqttPass => 'പാസ്‌വേഡ് (ഓപ്ഷണൽ)';

  @override
  String get mtBridgeMqttPassStored =>
      'ഈ ഉപകരണത്തിൽ ഒരു പാസ്‌വേഡ് സംഭരിച്ചിരിക്കുന്നു (കാണിച്ചിട്ടില്ല).';

  @override
  String get mtBridgeMqttPassReplace =>
      'പുതിയ പാസ്‌വേഡ് (സൂക്ഷിക്കാൻ ശൂന്യമായി ഇടുക)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'സംഭരിച്ച പാസ്‌വേഡ് സൂക്ഷിക്കാൻ ശൂന്യമായി ഇടുക.';

  @override
  String get mtBridgeMqttPassClear => 'പാസ്‌വേഡ് മായ്‌ക്കുക';

  @override
  String get mtBridgeMqttSave => 'MQTT ക്രമീകരണങ്ങൾ സംരക്ഷിക്കുക';

  @override
  String get mtBridgeMqttSaved => 'MQTT ക്രമീകരണങ്ങൾ സംരക്ഷിച്ചു';

  @override
  String get mtBridgeMqttConnect => 'ബന്ധിപ്പിക്കുക';

  @override
  String get mtBridgeMqttDisconnect => 'വിച്ഛേദിക്കുക';

  @override
  String get mtBridgeMqttConnected => 'MQTT ബന്ധിപ്പിച്ചു';

  @override
  String get mtBridgeMqttConnecting => 'MQTT ബന്ധിപ്പിക്കുന്നു...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT വിച്ഛേദിച്ചു';

  @override
  String get mtBridgeMqttError => 'MQTT പിശക്';

  @override
  String get mtBridgeErrModeIngest => 'ആദ്യം Ingest (A) എന്നതിലേക്ക് മാറുക';

  @override
  String get mtBridgeErrModeEgress => 'ആദ്യം Egress (B) ലേക്ക് മാറുക';

  @override
  String get mtBridgeErrRate => 'വേഗത കുറയ്ക്കുക - നിരക്ക് പരിമിതമാണ്';

  @override
  String get mtBridgeErrDedupe => 'തനിപ്പകർപ്പ് സന്ദേശം അവഗണിച്ചു';

  @override
  String get mtBridgeErrLoop => 'ഒരു ബ്രിഡ്ജ് ലൂപ്പ് തടയാൻ ഉപേക്ഷിച്ചു';

  @override
  String get mtBridgeErrEmpty => 'സന്ദേശം ശൂന്യമാണ്';

  @override
  String get mtBridgeErrPublish => 'പ്രസിദ്ധീകരിക്കുന്നത് പരാജയപ്പെട്ടു';

  @override
  String get mtBridgeErrNotConnected => 'MQTT ബന്ധിപ്പിച്ചിട്ടില്ല';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ബ്രോക്കർ ഹോസ്റ്റ് നൽകുക';

  @override
  String get mtBridgeErrMissingTopic =>
      'സബ്‌സ്‌ക്രൈബ് ചെയ്‌ത് വിഷയങ്ങൾ പ്രസിദ്ധീകരിക്കുക';

  @override
  String get mtBridgeErrMissingFromNode =>
      'അയയ്ക്കുന്നതിനുള്ള ഗേറ്റ്‌വേ നോഡ് ഐഡി (ഇതിൽ നിന്ന്) നൽകുക';

  @override
  String get mtBridgeErrConnect => 'MQTT കണക്ഷൻ പരാജയപ്പെട്ടു';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS കണക്ഷൻ പരാജയപ്പെട്ടു';

  @override
  String get settingsData => 'ഡാറ്റ';

  @override
  String get settingsDataHint =>
      'ഡാറ്റാബേസ് ചുരുക്കാൻ പ്രാദേശിക സന്ദേശങ്ങൾ ഇല്ലാതാക്കുക - ഐഡൻ്റിറ്റി, കീകൾ, പിയർ എന്നിവ സൂക്ഷിക്കുന്നു';

  @override
  String get settingsSaveHistoryTitle => 'സന്ദേശ ചരിത്രം സംരക്ഷിക്കുക';

  @override
  String get settingsSaveHistorySubtitle =>
      'ഓഫായിരിക്കുമ്പോൾ, സന്ദേശങ്ങൾ വയറിൽ E2EE ആയി തുടരുകയും ഈ സെഷനിൽ മാത്രം സൂക്ഷിക്കുകയും ചെയ്യും (പ്രാദേശിക ചാറ്റ് ചരിത്രത്തിലല്ല). നിങ്ങളുടെ സ്വന്തം ടെക്‌സ്‌റ്റ് ഇപ്പോഴും ഈ ഉപകരണത്തിൽ പ്ലെയിൻടെക്‌സ്‌റ്റായി കാണിക്കുന്നു.';

  @override
  String get settingsPrivacy => 'സ്വകാര്യത';

  @override
  String get settingsE2eeTitle => 'എൻഡ്-ടു-എൻഡ് എൻക്രിപ്ഷൻ';

  @override
  String get settingsE2eeSubtitle =>
      'എല്ലായ്പ്പോഴും ഓൺ — സന്ദേശങ്ങൾ അയയ്ക്കുന്നതിന് മുമ്പ് RSA-OAEP + AES-GCM ഉപയോഗിച്ച് സീൽ ചെയ്തിരിക്കുന്നു. റിലേകൾക്കും അടുത്തുള്ള ഹോപ്പുകൾക്കും ഉള്ളടക്കങ്ങൾ വായിക്കാൻ കഴിയില്ല.';

  @override
  String get settingsScreenshotTitle => 'സ്ക്രീൻഷോട്ട് അലേർട്ടുകൾ';

  @override
  String get settingsScreenshotSubtitle =>
      'ഈ ഉപകരണം സ്‌ക്രീൻ ക്യാപ്‌ചർ ചെയ്യുമ്പോൾ ചാറ്റിൽ ഒരു സിസ്റ്റം ലൈൻ കാണിക്കുക';

  @override
  String get settingsNostrExpiryTitle => 'Nostr സന്ദേശം സൂക്ഷിക്കുന്ന സമയം';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr വഴി ഓൺലൈനിൽ ആയിരിക്കുമ്പോൾ സീൽ ചെയ്ത എൻവലപ്പുകൾ പ്രാദേശികമായി എത്രത്തോളം നിലനിൽക്കണം';

  @override
  String get noticeExpiresIn => 'ൽ കാലഹരണപ്പെടുന്നു';

  @override
  String get noticesTitle => 'അറിയിപ്പുകൾ';

  @override
  String get noticesMeshIntro =>
      'പൊതു ബുള്ളറ്റിൻ - റേഡിയോ ശ്രേണിയിലുള്ള എല്ലാവർക്കും ദൃശ്യമാണ്, എൻക്രിപ്റ്റ് ചെയ്തിട്ടില്ല. ഇത് ഫോണിൽ നിന്ന് ഫോണിലേക്ക് ഓഫ്‌ലൈനായി ഹോപ്പ് ചെയ്യുന്നു, കൂടാതെ സമീപത്തെ ResilNet റിലേ ബോക്സുകൾ ഒരു പകർപ്പ് സൂക്ഷിക്കുന്നതിനാൽ പിന്നീട് എത്തുന്ന ആളുകൾക്ക് അത് കാണാനാകും.';

  @override
  String get noticesMeshPublicBadge => 'പൊതുവായത് · എൻക്രിപ്റ്റ് ചെയ്തിട്ടില്ല';

  @override
  String get noticesGeoIntro =>
      'ഈ സ്ഥലത്തിനായി ചെറിയ കുറിപ്പുകൾ ചേർക്കുക, അതുവഴി മറ്റ് സന്ദർശകർക്ക് അവ കണ്ടെത്താനാകും.';

  @override
  String get noticesEmpty => 'ഇതുവരെ അറിയിപ്പുകളൊന്നുമില്ല';

  @override
  String get noticesEmptyHint =>
      'ഇവിടെ ചുറ്റുമുള്ള ആളുകൾക്ക് ആദ്യ അറിയിപ്പ് പിൻ ചെയ്യുക.';

  @override
  String get noticesComposeHint => 'ഒരു നോട്ടീസ് ഇടൂ...';

  @override
  String get noticesUrgent => 'അടിയന്തിരം';

  @override
  String get noticesOpen => 'അറിയിപ്പുകൾ';

  @override
  String get screenshotTaken => '*നിങ്ങൾ ഒരു സ്ക്രീൻഷോട്ട് എടുത്തു*';

  @override
  String get chatAttachImage => 'ചിത്രം അറ്റാച്ചുചെയ്യുക';

  @override
  String get chatImageLabel => 'ചിത്രം';

  @override
  String get chatImageTooLarge =>
      'ചിത്രം വളരെ വലുതാണ് - മറ്റൊരു ഫോട്ടോ പരീക്ഷിക്കുക';

  @override
  String get chatNostrExpiry => 'Nostr സൂക്ഷിക്കുക';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel-ലേക്ക് അയയ്‌ക്കുക — പൊതുവായത്';
  }

  @override
  String get settingsClearTitle => 'എല്ലാ സന്ദേശങ്ങളും മായ്‌ക്കുക';

  @override
  String get settingsClearSubtitle =>
      'ഈ ഉപകരണത്തിലെ എല്ലാ ചാറ്റുകളും ഇല്ലാതാക്കുക';

  @override
  String get settingsClearConfirmTitle => 'എല്ലാ സന്ദേശങ്ങളും മായ്‌ക്കണോ?';

  @override
  String get settingsClearConfirmBody =>
      'ഇത് ഈ ഉപകരണത്തിലെ എല്ലാ ചാറ്റ് സന്ദേശങ്ങളും ഇല്ലാതാക്കുന്നു.\nസമപ്രായക്കാരും വിളിപ്പേരുകളും നീക്കം ചെയ്യപ്പെടുന്നില്ല.';

  @override
  String get settingsClearAction => 'ഡാറ്റ മായ്‌ക്കുക';

  @override
  String get settingsClearedSnack => 'ഡാറ്റ മായ്‌ച്ചു';

  @override
  String settingsVersion(String version) {
    return 'പതിപ്പ് $version';
  }

  @override
  String get meshBleScanning => 'BLE: നോഡുകൾക്കായി സ്കാൻ ചെയ്യുന്നു';

  @override
  String get meshBleEsp32Scanning => 'ESP32: അടുത്തുള്ള ഒരു നോഡിനായി തിരയുന്നു';

  @override
  String get meshBleSyncing => 'BLE: ESP32 മായി സമന്വയിപ്പിക്കുന്നു';

  @override
  String get meshNostrPublishing => 'Nostr: പ്രസിദ്ധീകരിക്കുന്നു';

  @override
  String get meshBleIdle =>
      'BLE മെഷ് ഓണാണ് — ഇതുവരെ സമീപത്തുള്ള ഫോണുകളൊന്നുമില്ല';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE മെഷ് — $count ഫോൺ(കൾ) സമീപത്ത്';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: അനുമതി ആവശ്യമാണ്';

  @override
  String get meshBlePausedCamera =>
      'ക്യാമറയ്ക്കായി BLE താൽക്കാലികമായി നിർത്തി - ആരംഭിക്കുക BLE ടാപ്പ് ചെയ്യുക';

  @override
  String get meshBleStopped =>
      'BLE ഓഫാണ് - ബ്ലൂടൂത്ത് ഓണാണെന്ന് പരിശോധിക്കുക, തുടർന്ന് ആരംഭിക്കുക BLE ടാപ്പ് ചെയ്യുക';

  @override
  String get meshBleRestart => 'ആരംഭിക്കുക';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · ലോക്ക് $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'അനുമതികൾ പരിശോധിച്ച് BLE ആരംഭിക്കുക';

  @override
  String get meshNostrOffline => 'Nostr ഓഫ്‌ലൈൻ';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count സമീപത്തുള്ള സമപ്രായക്കാർ • LoRa $lora • സമന്വയം ~$metersമി';
  }

  @override
  String get meshLoraReady => 'തയ്യാറാണ്';

  @override
  String get meshLoraNotReady => 'തയ്യാറല്ല';

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
    return 'ഗേറ്റ്‌വേ UDP: $label';
  }

  @override
  String get meshGatewayReady => 'ഗേറ്റ്‌വേ UDP: തയ്യാറാണ്';

  @override
  String get permissionTitle =>
      'BLE മെഷ് നെറ്റ്‌വർക്ക് ആരംഭിക്കാൻ ആക്‌സസ് അനുവദിക്കുക';

  @override
  String get permissionBody =>
      'കമ്മ്യൂണിറ്റി സന്ദേശമയയ്‌ക്കുന്നതിന് ആപ്പിന് ബ്ലൂടൂത്ത് (സ്കാൻ / കണക്റ്റ് / പരസ്യം ചെയ്യുക), ലൊക്കേഷൻ (പഴയ Android ഉപകരണങ്ങൾക്ക്), മൈക്രോഫോൺ (ചാറ്റിലെയും അറിയിപ്പുകളിലെയും വോയ്‌സ് കുറിപ്പുകൾക്കായി) എന്നിവ ആവശ്യമാണ്.';

  @override
  String get permissionE2ee =>
      'എൻഡ്-ടു-എൻഡ് എൻക്രിപ്ഷൻ (E2EE)\nറിലേ നോഡുകൾക്ക് സന്ദേശ ഉള്ളടക്കങ്ങൾ വായിക്കാൻ കഴിയില്ല';

  @override
  String get permissionReady => 'അനുമതികൾ തയ്യാറാണ്';

  @override
  String get permissionRequest => 'അനുവദിക്കുക, തുടരുക';

  @override
  String get permissionNotReadySnack =>
      'സിസ്റ്റം ഇതുവരെ തയ്യാറായിട്ടില്ല - ഒരു നിമിഷം കാത്തിരുന്ന് വീണ്ടും ശ്രമിക്കുക';

  @override
  String get permissionDeniedSnack =>
      'അനുമതികൾ അപൂർണ്ണമാണ് - ക്രമീകരണങ്ങൾ > ResilNet തുറന്ന് ബ്ലൂടൂത്ത് / ലൊക്കേഷൻ / മൈക്രോഫോൺ അനുവദിക്കുക';

  @override
  String get permissionMicDenied =>
      'മൈക്രോഫോൺ ആക്‌സസ് നിരസിച്ചു - വോയ്‌സ് നോട്ടുകൾ റെക്കോർഡ് ചെയ്യാൻ ക്രമീകരണങ്ങളിൽ ഇത് അനുവദിക്കുക';

  @override
  String get permissionMicOpenSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get permissionCameraDenied =>
      'ക്യാമറ ആക്‌സസ് നിരസിച്ചു - QR കോഡുകൾ സ്കാൻ ചെയ്യാൻ ക്രമീകരണങ്ങളിൽ ഇത് അനുവദിക്കുക';

  @override
  String get permissionCameraFailed =>
      'QR കോഡുകൾ സ്കാൻ ചെയ്യുന്നതിന് ക്യാമറ അനുമതി ആവശ്യമാണ്';

  @override
  String get permissionCameraOpenSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get permissionPhotosDenied =>
      'ഫോട്ടോ ലൈബ്രറി ആക്സസ് നിരസിച്ചു - നിങ്ങളുടെ QR കോഡ് സംരക്ഷിക്കാൻ ക്രമീകരണങ്ങളിൽ ഇത് അനുവദിക്കുക';

  @override
  String get permissionPhotosFailed =>
      'നിങ്ങളുടെ QR കോഡ് സംരക്ഷിക്കാൻ ഫോട്ടോ ലൈബ്രറി അനുമതി ആവശ്യമാണ്';

  @override
  String get permissionPhotosOpenSettings => 'ക്രമീകരണങ്ങൾ';

  @override
  String permissionFailedSnack(String error) {
    return 'അനുമതി അഭ്യർത്ഥന പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet ആർക്കിടെക്ചർ • സ്റ്റോർ-ആൻഡ്-ഫോർവേഡ് മൾട്ടി-ഹോപ്പ്';

  @override
  String get onboardingSkip => 'ഒഴിവാക്കുക';

  @override
  String get onboardingNext => 'അടുത്തത്';

  @override
  String get onboardingStart => 'ആരംഭിക്കുക';

  @override
  String get onboardingWelcomeTitle => 'ResilNet ലേക്ക് സ്വാഗതം';

  @override
  String get onboardingWelcomeBody =>
      'ഒരു മെഷ് നെറ്റ്‌വർക്കിലൂടെ ResilNet-ൽ ചാറ്റ് ചെയ്യുക — ഇൻ്റർനെറ്റ് ഇല്ലാതെ പോലും';

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
      'എൻക്രിപ്റ്റ് ചെയ്ത ചാറ്റ് + സമീപത്തുള്ള ചാനലുകൾ';

  @override
  String get onboardingChannelsBody =>
      'സമീപത്തുള്ള സമപ്രായക്കാരെ കണ്ടെത്താൻ #mesh / Area (geohash) മാറുക - സന്ദേശങ്ങൾ BLE മെഷ്, Nostr എന്നിവയിൽ E2EE ആയി തുടരും.';

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
  String get chatTitle => 'ചാറ്റ് (E2EE)';

  @override
  String get chatScanTooltip => 'ഒരു പിയർ ചേർക്കാൻ QR സ്കാൻ ചെയ്യുക';

  @override
  String get chatBlockTooltip => 'ഈ അയച്ചയാളെ തടയുക';

  @override
  String get chatBlockedSnack => 'തടഞ്ഞു: അറിയിപ്പുകളില്ല / റിലേ ഇല്ല';

  @override
  String get chatAliasTooltip => 'വിളിപ്പേര് സജ്ജീകരിക്കുക';

  @override
  String get chatReceiverPemLabel => 'സ്വീകർത്താവിൻ്റെ പൊതു കീ (PEM)';

  @override
  String get chatReceiverPemHint =>
      'നിങ്ങളുടെ സുഹൃത്തിൻ്റെ പൊതു കീ ഒട്ടിക്കുക (QR / പങ്കിട്ട ഫയലിൽ നിന്ന്)';

  @override
  String get chatNeedPeerKey =>
      'ഈ പിയറുടെ QR ആദ്യം സ്കാൻ ചെയ്യുക (പരിശോധിച്ച പൊതു കീ ആവശ്യമാണ്)';

  @override
  String get chatPeerKeyMismatch =>
      'സംഭരിച്ച പൊതു കീ ഈ പിയർ ഐഡിയുമായി പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String chatVoiceFailed(String error) {
    return 'ഓഡിയോ റെക്കോർഡ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'വോയ്‌സ് നോട്ട് പ്ലേ ചെയ്യാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get chatPlayVoice => 'വോയ്‌സ് നോട്ട് പ്ലേ ചെയ്യുക';

  @override
  String get chatPauseVoice => 'താൽക്കാലികമായി നിർത്തുക';

  @override
  String get chatVoiceLabelSent => '🎤 വോയ്‌സ് നോട്ട് (മുദ്രവെച്ചത്)';

  @override
  String get chatVoiceLabel => '🎤 വോയിസ് നോട്ട്';

  @override
  String get chatDecryptFailed => '[ഡീക്രിപ്ഷൻ പരാജയപ്പെട്ടു]';

  @override
  String chatSentSealed(String preview) {
    return '[മുദ്രയിട്ടത് • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[മുദ്രയിട്ടത്]';

  @override
  String get chatComposeHint =>
      'ഒരു സന്ദേശം ടൈപ്പുചെയ്യുക… (അയയ്‌ക്കുമ്പോൾ സീൽ ചെയ്‌തിരിക്കുന്നു)';

  @override
  String get chatEmptyThread =>
      'ഇതുവരെ സന്ദേശങ്ങളൊന്നുമില്ല\nമെഷ് അയക്കാൻ താഴെ ടൈപ്പ് ചെയ്യുക';

  @override
  String chatLoadFailed(String error) {
    return 'സംഭാഷണം ലോഡ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get chatEmojiTooltip => 'ഇമോജി';

  @override
  String get statusPending => 'തീർപ്പാക്കാത്തത്';

  @override
  String get statusSent => 'അയച്ചു';

  @override
  String get statusRelayed => 'റിലേ ചെയ്തു';

  @override
  String get statusDelivered => 'എത്തിച്ചു';

  @override
  String get statusRead => 'വായിക്കുക';

  @override
  String get statusFailed => 'പരാജയപ്പെട്ടു';

  @override
  String get chatCopy => 'പകർത്തുക';

  @override
  String get chatDeleteLocal => 'ഈ ഉപകരണത്തിൽ ഇല്ലാതാക്കുക';

  @override
  String get chatDeletedLocalSnack => 'ഈ ഉപകരണത്തിൽ ഇല്ലാതാക്കി';

  @override
  String get chatRetry => 'വീണ്ടും ശ്രമിക്കുക';

  @override
  String get chatSendFailed =>
      'ഡെലിവർ ചെയ്തിട്ടില്ല - വീണ്ടും ശ്രമിക്കുക ടാപ്പ് ചെയ്യുക';

  @override
  String get chatImageNeedInternet =>
      'ചിത്രങ്ങൾ അയയ്‌ക്കാൻ ഇൻ്റർനെറ്റിലേക്ക് കണക്‌റ്റ് ചെയ്യുക';

  @override
  String get chatImageTooLargeOnline =>
      'അയയ്‌ക്കാൻ പര്യാപ്തമായ ഇമേജ് കംപ്രസ് ചെയ്യാൻ കഴിഞ്ഞില്ല';

  @override
  String get chatOpenLinkFailed => 'ലിങ്ക് തുറക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get identityTitle => 'ഐഡൻ്റിറ്റി';

  @override
  String get identityScanTooltip => 'ക്യാമറ ഉപയോഗിച്ച് QR സ്കാൻ ചെയ്യുക';

  @override
  String get identityCopiedHash => 'പബ്ലിക് കീ ഹാഷ് പകർത്തി';

  @override
  String get identityPeerSaved => 'QR-ൽ നിന്ന് പിയർ രക്ഷപ്പെട്ടു';

  @override
  String get identityGalleryDenied => 'ഫോട്ടോ ലൈബ്രറി അനുമതി നിരസിച്ചു';

  @override
  String get identityQrSaved => 'QR ഫോട്ടോ ലൈബ്രറിയിൽ സംരക്ഷിച്ചു';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR സംരക്ഷിക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get peersTitle => 'നെറ്റ്‌വർക്ക് അംഗങ്ങൾ';

  @override
  String get qrScanTitle => 'ഒരു സുഹൃത്തിനെ ചേർക്കാൻ QR സ്കാൻ ചെയ്യുക';

  @override
  String get qrInvalid => 'സ്കാൻ പരാജയപ്പെട്ടു: അസാധുവായ QR';

  @override
  String get qrIdKeyMismatch =>
      'QR നിരസിച്ചു: ഐഡി പൊതു കീയുമായി പൊരുത്തപ്പെടുന്നില്ല';

  @override
  String get qrCameraNotReady => 'ക്യാമറ തയ്യാറായിട്ടില്ല';

  @override
  String get qrRetrySettings => 'വീണ്ടും ശ്രമിക്കുക / ക്രമീകരണങ്ങൾ തുറക്കുക';

  @override
  String qrCameraOpenFailed(String error) {
    return 'ക്യാമറ തുറക്കാൻ കഴിഞ്ഞില്ല: $error';
  }

  @override
  String get qrScanAlignHint => 'ഫ്രെയിമിനുള്ളിൽ QR കോഡ് വിന്യസിക്കുക';

  @override
  String get firmwareDownloadTitle => 'ESP32 ഫേംവെയർ ഡൗൺലോഡ് ചെയ്യുക';

  @override
  String get firmwareSourceOnline => 'ഏറ്റവും പുതിയത് (ഓൺലൈൻ)';

  @override
  String get firmwareSourceCached => 'സംരക്ഷിച്ച പകർപ്പ് (ഓഫ്‌ലൈൻ)';

  @override
  String get firmwareSourceBaseline => 'ബണ്ടിൽ ചെയ്ത അടിസ്ഥാനരേഖ (ഓഫ്‌ലൈൻ)';

  @override
  String get firmwareSourceUnavailable => 'ഫേംവെയറുകൾ ലഭ്യമല്ല';

  @override
  String get firmwareBaselineIncompatible =>
      'ബണ്ടിൽ ചെയ്ത ഫേംവെയർ വളരെ പഴയതാണ് - ഒരു പുതിയ പതിപ്പ് ഡൗൺലോഡ് ചെയ്യാൻ ഇൻ്റർനെറ്റിലേക്ക് കണക്റ്റുചെയ്യുക';

  @override
  String get firmwareChecksumFailed =>
      'ഫേംവെയർ സമഗ്രത പരിശോധിക്കുന്നതിൽ പരാജയപ്പെട്ടു - ഫ്ലാഷിംഗ് തടഞ്ഞു';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ഫേംവെയർ തയ്യാറാണ്: $source';
  }

  @override
  String get peersRefreshTooltip => 'പുതുക്കുക';

  @override
  String get peersBlocked => 'തടഞ്ഞു';

  @override
  String get peersNearbyBle => 'സമീപത്ത് (BLE)';

  @override
  String get peersRecentlyOnline => 'അടുത്തിടെ ഓൺലൈനിൽ';

  @override
  String get peersOnlineInArea => 'പ്രദേശത്ത് ഓൺലൈൻ';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes മിനിറ്റ് മുമ്പ് കണ്ടു';
  }

  @override
  String get peersOffline => 'ഓഫ്‌ലൈൻ';

  @override
  String peersBlockedSnack(String id) {
    return '$id തടഞ്ഞു';
  }

  @override
  String get peersUnblockedSnack => 'അൺബ്ലോക്ക് ചെയ്തു';

  @override
  String get peersEmpty =>
      'ഡാറ്റാബേസിൽ ഇതുവരെ അംഗങ്ങളില്ല\nഒരു QR സ്കാൻ ചെയ്യുക അല്ലെങ്കിൽ BLE മെഷ് കണ്ടെത്തലിനായി കാത്തിരിക്കുക';

  @override
  String get peersOpenChat => 'ചാറ്റ് തുറക്കുക';

  @override
  String get peersBlockAction => 'തടയുക';

  @override
  String get peersUnblockAction => 'തടഞ്ഞത് മാറ്റുക';

  @override
  String get channelPickerTooltip => 'ചാറ്റ് / #മെഷ് / ഏരിയ';

  @override
  String get locationPickerTooltip => 'ലൊക്കേഷൻ ചാനൽ';

  @override
  String get transportPickerTooltip => 'മെഷ് / ഇൻ്റർനെറ്റ് / ഓട്ടോ';

  @override
  String get onlinePeopleTooltip => 'ആളുകൾ ഓൺലൈനിൽ';

  @override
  String get unreadDirectsTooltipEmpty => 'സ്വകാര്യ സന്ദേശങ്ങൾ';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count വായിക്കാത്ത സ്വകാര്യ സന്ദേശങ്ങൾ';
  }

  @override
  String get onlinePeopleTitle => 'ആളുകൾ';

  @override
  String get onlinePeopleEmpty => 'ഇവിടെ ഇതുവരെ ആരും ഓൺലൈനിൽ ഇല്ല';

  @override
  String onlinePeopleCount(int count) {
    return '$count ഓൺലൈനിൽ';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · സമീപത്തുള്ള + പ്രദേശം';

  @override
  String get peerOnlineMeshTitle => 'മെഷിൽ സമീപത്തുള്ള ഒരാൾ';

  @override
  String peerOnlineMeshBody(String name) {
    return 'മെഷിൽ $name സമീപത്തുണ്ട്';
  }

  @override
  String get peerOnlineAreaTitle => 'പ്രദേശത്ത് ഓൺലൈനിൽ ഒരാൾ';

  @override
  String peerOnlineAreaBody(String name) {
    return 'Nostr വഴി $name ഓൺലൈനാണ്';
  }

  @override
  String get locationSheetTitle => '#ലൊക്കേഷൻ ചാനലുകൾ';

  @override
  String get channelPinsTitle => 'പിൻ ചെയ്തു';

  @override
  String get channelPinsHint =>
      'നിങ്ങൾ പതിവായി ഉപയോഗിക്കുന്ന ചാനലുകൾ പിൻ ചെയ്യുക - അവ മുകളിൽ തന്നെ തുടരും';

  @override
  String get channelPinTooltip => 'ഈ ചാനൽ പിൻ ചെയ്യുക';

  @override
  String get channelUnpinTooltip => 'അൺപിൻ ചെയ്യുക';

  @override
  String get locationSheetIntro =>
      'പരുക്കൻ ജിയോഹാഷ് ഉപയോഗിച്ച് സമീപത്തുള്ള ആളുകളുമായി ചാറ്റ് ചെയ്യുക — കൃത്യമായ GPS അല്ല. ഇൻറർനെറ്റിലെ സാന്നിധ്യം അജ്ഞാത Nostr കീകൾ ഉപയോഗിക്കുന്നു.';

  @override
  String get locationMeshSubtitle => '#ബ്ലൂടൂത്ത് • ~10-50 മീ';

  @override
  String get locationTeleportHint => '#ജിയോഹാഷ്';

  @override
  String get locationTeleport => 'ടെലിപോർട്ട്';

  @override
  String homeComposeHint(String channel) {
    return 'സന്ദേശം $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel-ലേക്ക് അയയ്‌ക്കുക — പൊതുവായത്';
  }

  @override
  String get messageExpiryTitle => 'ൽ കാലഹരണപ്പെടുന്നു';

  @override
  String get voiceRecordTapToStart =>
      'ശബ്ദ സന്ദേശം റെക്കോർഡ് ചെയ്യാൻ ടാപ്പ് ചെയ്യുക';

  @override
  String get voiceRecordTooShort =>
      'റെക്കോർഡിംഗ് വളരെ ചെറുതാണ് - വീണ്ടും ശ്രമിക്കുക';

  @override
  String get voiceRecordFailed =>
      'റെക്കോർഡിംഗ് സംരക്ഷിക്കാൻ കഴിഞ്ഞില്ല - വീണ്ടും ശ്രമിക്കുക';

  @override
  String get voicePttHold => 'റെക്കോർഡുചെയ്യാൻ പിടിക്കുക';

  @override
  String get voicePttRelease => 'പ്രിവ്യൂവിന് റിലീസ് ചെയ്യുക';

  @override
  String get voicePttRecording => 'റെക്കോർഡ് ചെയ്യുന്നു...';

  @override
  String get voicePttDraftReady => 'വോയ്സ് നോട്ട് തയ്യാറാണ്';

  @override
  String get voicePttDiscard => 'നിരസിക്കുക';

  @override
  String get voicePttReRecord => 'വീണ്ടും രേഖപ്പെടുത്തുക';

  @override
  String get voicePttSend => 'വോയിസ് നോട്ട് അയക്കുക';

  @override
  String get voicePttPlayPreview => 'പ്രിവ്യൂ പ്ലേ ചെയ്യുക';

  @override
  String get voicePttStopPreview => 'പ്രിവ്യൂ നിർത്തുക';

  @override
  String get noticesBackfilling => 'അറിയിപ്പുകൾ ലോഡ് ചെയ്യുന്നു...';

  @override
  String get noticesNostrOnline => 'Nostr ഓൺലൈനിൽ';

  @override
  String get noticesNostrOffline =>
      'Nostr ഓഫ്‌ലൈൻ — ബുള്ളറ്റിന് ഇൻ്റർനെറ്റ് ആവശ്യമാണ്';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count അറിയിപ്പുകൾ ലോഡ് ചെയ്തു';
  }

  @override
  String get noticePublishFailed =>
      'ഏരിയാ ബോർഡിന് നോട്ടീസ് പ്രസിദ്ധീകരിക്കാൻ കഴിഞ്ഞില്ല. Nostr കണക്ഷൻ പരിശോധിക്കുക.';

  @override
  String get noticeMeshPublishNoLink =>
      'പ്രാദേശികമായി സംരക്ഷിച്ചു. അടുത്തുള്ള ഒരു മെഷ് റേഡിയോയിലേക്ക് (അല്ലെങ്കിൽ Wi‑Fi ഗേറ്റ്‌വേ) കണക്റ്റുചെയ്യുക, അതുവഴി മറ്റുള്ളവർക്ക് അത് സ്വീകരിക്കാനാകും.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'ബുള്ളറ്റിൻ BLE-ന് മുകളിൽ $count സമീപത്തുള്ള ഉപകരണത്തിലേക്ക്(കൾ) അയച്ചു.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'സമീപത്തുള്ള റേഡിയോകൾ കണ്ടു, പക്ഷേ BLE എഴുത്ത് പരാജയപ്പെട്ടു. നോട്ടീസ് സ്ക്രീനിൽ രണ്ട് ആപ്പുകളും തുറന്ന് സൂക്ഷിച്ച് വീണ്ടും ശ്രമിക്കുക (അല്ലെങ്കിൽ ഒരു ESP32 റിലേ ഉപയോഗിക്കുക).';

  @override
  String get noticeMeshPublishNoGatt =>
      'ഈ ഉപകരണത്തിൻ്റെ BLE റിസീവർ തയ്യാറായിട്ടില്ല. ബ്ലൂടൂത്ത് ടോഗിൾ ചെയ്‌ത് അറിയിപ്പുകൾ വീണ്ടും തുറക്കുക.';

  @override
  String get noticeDelete => 'അറിയിപ്പ് ഇല്ലാതാക്കുക';

  @override
  String get noticeDeleteConfirmTitle => 'ഈ അറിയിപ്പ് ഇല്ലാതാക്കണോ?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'ഇത് ഈ ഉപകരണത്തിൽ മാത്രം നീക്കംചെയ്യുന്നു. ഇതിനകം ലഭിച്ച മറ്റുള്ളവർ അത് തുടർന്നും കാണും.';

  @override
  String get noticeDeleted => 'അറിയിപ്പ് ഇല്ലാതാക്കി';

  @override
  String get chatNoticeHidden => 'ഏരിയ അറിയിപ്പ് - തുറന്ന അറിയിപ്പുകൾ';

  @override
  String get identityDisplayNameTitle => 'പ്രദർശന നാമം';

  @override
  String get identitySaveName => 'പേര് സംരക്ഷിക്കുക';

  @override
  String get identityUserIdLabel => 'ഉപയോക്തൃ ഐഡി (പബ്ലിക് കീ ഹാഷ്)';

  @override
  String get identityCopyHashTooltip => 'പബ്ലിക് കീ ഹാഷ് പകർത്തുക';

  @override
  String get identityMyQrTitle => 'എൻ്റെ QR (id + pubKey + പേര്)';

  @override
  String identityQrFailed(String error) {
    return 'QR സൃഷ്ടിക്കാൻ കഴിഞ്ഞില്ല\n$error';
  }

  @override
  String get identitySaving => 'സംരക്ഷിക്കുന്നു...';

  @override
  String get identitySaveQr => 'ഫോട്ടോ ലൈബ്രറിയിൽ QR സംരക്ഷിക്കുക';

  @override
  String get identityOpenScanner => 'QR സ്കാൻ ചെയ്യാൻ ക്യാമറ തുറക്കുക';

  @override
  String get identityQrHelp =>
      'നിങ്ങളുടെ പബ്ലിക് കീ സംരക്ഷിക്കാൻ ഒരു സുഹൃത്തിനെ ഇത് സ്കാൻ ചെയ്യൂ, കൂടാതെ (ആവശ്യമെങ്കിൽ) നിങ്ങളെ ഒരു സ്ഥിരീകരിച്ച ഇഷ്യൂവറായി സജ്ജമാക്കുക';

  @override
  String get identityChatTip =>
      'നുറുങ്ങ്: E2EE-യ്‌ക്കായി ഒരു പൊതു കീ ചേർക്കാൻ നിങ്ങൾക്ക് ചാറ്റിൽ ഒരു QR സ്കാൻ ചെയ്യാനും കഴിയും';

  @override
  String get infoOpen => 'കുറിച്ച് / വിവരങ്ങൾ';

  @override
  String get docsGuideTitle => 'ഉപയോക്തൃ ഗൈഡ്';

  @override
  String get docsGuideSubtitle => 'ബ്രൗസറിൽ തുറക്കുന്നു';

  @override
  String get docsOpenAction => 'ഗൈഡ് തുറക്കുക';

  @override
  String get docsOpenFailed => 'ഉപയോക്തൃ ഗൈഡ് തുറക്കാൻ കഴിഞ്ഞില്ല';

  @override
  String get firmwareOtaGuideTitle => 'ഫ്ലാഷ് ഗൈഡും OTA പ്രോട്ടോക്കോളും';

  @override
  String get firmwareOtaGuideSubtitle =>
      'വെബ് ഗൈഡ് തുറക്കുന്നു — .bin ഡൗൺലോഡുകളും പൂർണ്ണ ഘട്ടങ്ങളും';

  @override
  String get firmwareWebDownloadsTitle => 'വെബിൽ ഫേംവെയർ ഡൗൺലോഡുകൾ';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'ഡോക്സ് സൈറ്റിലെ ഓരോ പതിപ്പിനും ലിങ്കുകളും ചെക്ക്സമുകളും';

  @override
  String get inviteCopyShortLink => 'ഹ്രസ്വ ലിങ്ക് പകർത്തുക';

  @override
  String get inviteShareLink => 'ലിങ്ക് പങ്കിടുക';

  @override
  String get inviteShowFullLink => 'പൂർണ്ണ ലിങ്ക്';

  @override
  String get inviteCopyFullLink => 'മുഴുവൻ ലിങ്കും പകർത്തുക';

  @override
  String get inviteLinkCopied => 'ലിങ്ക് പകർത്തി';

  @override
  String get inviteLongPressHint =>
      'ലിങ്ക് പ്രവർത്തനങ്ങൾക്കായി ദീർഘനേരം അമർത്തുക';

  @override
  String get inviteSendInChat => 'ResilNet ചാറ്റിൽ അയയ്‌ക്കുക...';

  @override
  String get inviteSendInChatHint =>
      'നിങ്ങൾക്ക് ഇതിനകം ഒരു പൊതു കീ ഉള്ള ആളുകൾക്ക് മാത്രം';

  @override
  String get inviteSendInChatEmpty =>
      'ഇതുവരെ സന്ദേശമയയ്‌ക്കാവുന്ന ചാറ്റുകളൊന്നുമില്ല.\nഒരു QR സ്കാൻ ചെയ്യുക, ഏരിയ/മെഷ് തുറക്കുക, അല്ലെങ്കിൽ ആപ്പിന് പുറത്ത് ലിങ്ക് ആദ്യം പങ്കിടുക.';

  @override
  String get inviteSentToChat => 'ക്ഷണം ചാറ്റിൽ അയച്ചു';

  @override
  String get infoTabInfo => 'വിവരം';

  @override
  String get infoTabSettingsHint =>
      'ഭാഷ, E2EE, ഡാറ്റ ടൂളുകൾ എന്നിവയ്‌ക്കായുള്ള മെനുവിൽ നിന്ന് ക്രമീകരണങ്ങൾ തുറക്കുക';

  @override
  String get infoHowToTitle => 'എങ്ങനെ ഉപയോഗിക്കാം';

  @override
  String get infoHowToBody =>
      '• ചാറ്റ് / #മെഷ് / ഏരിയ മാറാൻ ചാനൽ ഐക്കണിൽ ടാപ്പ് ചെയ്യുക\n• ജിയോഹാഷ് വലുപ്പം തിരഞ്ഞെടുക്കാൻ സ്ഥലത്ത് ടാപ്പ് ചെയ്യുക\n• അംഗങ്ങൾക്കായി അല്ലെങ്കിൽ ഓൺലൈനിൽ ഉള്ളവരെ ടാപ്പ് ചെയ്യുക\n• വ്യക്തിപരമായി കീകൾ കൈമാറാൻ ⋮-ൽ നിന്ന് ഐഡൻ്റിറ്റി/ക്യുആർ തുറക്കുക\n• ഏരിയ \"പബ്ലിക്\" ഓരോ ഓൺലൈൻ പിയർക്കും സീൽ ചെയ്ത E2EE അയയ്ക്കുന്നു - ഒരു പ്ലെയിൻ ടെക്സ്റ്റ് റൂം അല്ല';

  @override
  String get infoFeaturesTitle => 'ഫീച്ചറുകൾ';

  @override
  String get infoFeatureOffline =>
      'ബ്ലൂടൂത്ത് ലോ എനർജി വഴിയുള്ള ഓഫ്‌ലൈൻ സന്ദേശമയയ്‌ക്കൽ';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM ഉള്ള എൻഡ്-ടു-എൻഡ് എൻക്രിപ്ഷൻ (നോയിസ് അല്ല)';

  @override
  String get infoFeatureMultihop =>
      'കൂടുതൽ ദൂരത്തേക്ക് പോകുന്നതിന് സമീപത്തുള്ള സഹപാഠികളിലൂടെ സന്ദേശങ്ങൾ എത്താം';

  @override
  String get infoFeatureBridge =>
      'സീൽ ചെയ്ത എൻവലപ്പുകൾക്കുള്ള ഹൈബ്രിഡ് മെഷ് ↔ ഇൻ്റർനെറ്റ് (Nostr).';

  @override
  String get infoFeatureGeo =>
      'സമീപത്തുള്ള ആളുകൾക്കുള്ള പ്രാദേശിക ജിയോഹാഷ് ചാനലുകൾ (ഡിസ്കവറി യുഎക്സ്)';

  @override
  String get infoFeatureNotices =>
      '#മെഷിനും ഏരിയയ്ക്കും കാലഹരണപ്പെടുന്ന അറിയിപ്പുകൾ';

  @override
  String get infoPrivacyTitle => 'സ്വകാര്യത';

  @override
  String get infoPrivacyNoRoom =>
      'വയറിൽ പ്ലെയിൻ ടെക്സ്റ്റ് വില്ലേജ് / പൊതു ചാറ്റ് റൂം ഇല്ല';

  @override
  String get infoPrivacyFanout =>
      'അറിയാവുന്ന പബ്ലിക് കീകളുള്ള സമപ്രായക്കാർക്ക് ഏരിയ അയയ്‌ക്കൽ = സീൽ ചെയ്‌ത 1:1 ഫാൻ-ഔട്ട്';

  @override
  String get infoPrivacyPresence =>
      'ഇൻ്റർനെറ്റ് ഏരിയ സാന്നിധ്യം എഫെമെറൽ Nostr കീകൾ ഉപയോഗിക്കുന്നു';

  @override
  String get infoSymbolsTitle => 'ചിഹ്നങ്ങൾ';

  @override
  String get infoSymBle => 'നേരിട്ടുള്ള ബ്ലൂടൂത്ത് ലിങ്ക്';

  @override
  String get infoSymMesh => 'മെഷ് വഴി എത്തിച്ചേരാം (മറ്റുള്ളവ മുന്നോട്ട്)';

  @override
  String get infoSymInternet =>
      'ഇന്റർനെറ്റ് വഴി (Nostr) — സീൽ ചെയ്ത എൻ‌വലപ്പുകൾ';

  @override
  String get infoSymBridge => 'മെഷ്↔ഇൻ്റർനെറ്റ് ബ്രിഡ്ജ് പാത്ത് വഴി എത്തി';

  @override
  String get infoSymOffline => 'ഓഫ്‌ലൈൻ — ഇപ്പോൾ എത്തിച്ചേരാനാകില്ല';

  @override
  String get infoSymInArea => 'ഈ ലൊക്കേഷൻ ചാനലിൻ്റെ പ്രദേശത്ത്';

  @override
  String get infoSymE2eeOk => 'എൻഡ്-ടു-എൻഡ് എൻക്രിപ്റ്റ് ചെയ്ത സെഷൻ';

  @override
  String get infoSymE2eeFail =>
      'എൻക്രിപ്ഷൻ ലഭ്യമല്ല - സെൻസിറ്റീവ് ടെക്സ്റ്റ് അയക്കരുത്';

  @override
  String get infoSymVerified => 'ഐഡൻ്റിറ്റി സ്ഥിരീകരിച്ച / അറിയപ്പെടുന്ന കീ';

  @override
  String get infoSymBlocked => 'തടഞ്ഞു';

  @override
  String get infoSymUnread => 'വായിക്കാത്ത സ്വകാര്യ സന്ദേശം';

  @override
  String get infoEmergencyTitle => 'എമർജൻസി മോഡ്';

  @override
  String get infoEmergencyBody =>
      'ഈ ഉപകരണത്തിലെ സന്ദേശങ്ങൾ, കീകൾ, ഐഡൻ്റിറ്റി എന്നിവ മായ്‌ക്കാൻ ഹോം സ്‌ക്രീനിലെ ResilNet ശീർഷകത്തിൽ മൂന്ന് തവണ ടാപ്പ് ചെയ്യുക.';

  @override
  String get infoLegendNote =>
      'വ്യക്തതയ്ക്കായി ചില പാത്ത് ഐക്കണുകൾ ഇവിടെ രേഖപ്പെടുത്തിയിട്ടുണ്ട്; ചാറ്റിലെ ഡെലിവറി ടിക്കുകൾ പ്രാഥമിക അയയ്‌ക്കൽ സ്റ്റാറ്റസായി തുടരുന്നു.';

  @override
  String get dangerZoneTitle => 'അപകട മേഖല';

  @override
  String get dangerZoneSubtitle =>
      'ഈ ഉപകരണത്തിലെ സന്ദേശങ്ങൾ, എൻക്രിപ്ഷൻ കീകൾ, Nostr ഐഡൻ്റിറ്റി, സമപ്രായക്കാർ, വിളിപ്പേരുകൾ എന്നിവ ഇല്ലാതാക്കുന്നു. നിങ്ങൾ വീണ്ടും സജ്ജീകരിക്കും.';

  @override
  String get panicWipeTitle => 'എമർജൻസി വൈപ്പ്';

  @override
  String get panicWipeSubtitle =>
      'പ്രാദേശികമായ എല്ലാം മായ്‌ക്കുക - ഹോം ടൈറ്റിൽ ട്രിപ്പിൾ ടാപ്പ് ചെയ്യുന്നത് പോലെ (റേഡിയോകൾ രണ്ടുതവണ ടാപ്പ് ചെയ്യുക)';

  @override
  String get panicWipeConfirmTitle => 'എല്ലാ പ്രാദേശിക ഡാറ്റയും മായ്‌ക്കണോ?';

  @override
  String get panicWipeConfirmBody =>
      'ഇത് ഈ ഫോണിലെ ചാറ്റുകൾ, കീകൾ, ഐഡൻ്റിറ്റി എന്നിവ ശാശ്വതമായി ഇല്ലാതാക്കുന്നു.\nനിങ്ങളുടെ പുതിയ ഐഡൻ്റിറ്റി ഉപയോഗിച്ച് സമപ്രായക്കാർ QR കീകൾ വീണ്ടും കൈമാറ്റം ചെയ്യണം.\nഇത് പഴയപടിയാക്കാനാകില്ല.';

  @override
  String get panicWipeAction => 'എല്ലാം തുടയ്ക്കുക';

  @override
  String get panicWipeSnack =>
      'പ്രാദേശിക ഐഡൻ്റിറ്റി തുടച്ചു - വീണ്ടും സജ്ജീകരിച്ചു';

  @override
  String panicWipeFailed(String error) {
    return 'വൈപ്പ് പരാജയപ്പെട്ടു: $error';
  }

  @override
  String get meshBridgeTitle => 'മെഷ് പാലം';

  @override
  String get meshBridgeSubtitle =>
      'ഓണായിരിക്കുമ്പോൾ (ഡിഫോൾട്ട്), സീൽ ചെയ്ത എൻവലപ്പുകൾ BLE മെഷും ഇൻ്റർനെറ്റും (Nostr) ഒരുമിച്ച് ഉപയോഗിച്ചേക്കാം, അങ്ങനെ അടുത്തുള്ള മെഷ് ദ്വീപുകൾക്ക് കണക്റ്റുചെയ്യാനാകും. ഓഫായിരിക്കുമ്പോൾ, അയയ്ക്കുന്നവ ഒരു പാത മാത്രം ഉപയോഗിക്കുക - ഒരിക്കലും പ്ലെയിൻ ടെക്‌സ്‌റ്റ് വയറിൽ ഇടരുത്.';

  @override
  String get favoritesTitle => 'പ്രിയപ്പെട്ടവ';

  @override
  String get favoritesAdd => 'പ്രിയങ്കരങ്ങളിലേക്ക് ചേര്‍ക്കുക';

  @override
  String get favoritesRemove => 'പ്രിയപ്പെട്ടവയിൽ നിന്ന് നീക്കം ചെയ്യുക';

  @override
  String get favoritesEmpty =>
      'ഇതുവരെ പ്രിയങ്കരങ്ങളൊന്നുമില്ല - അംഗങ്ങളുടെ പട്ടികയിൽ നിന്ന് ഒരു പിയർ നക്ഷത്രമിടുക';

  @override
  String get favoritesNearbyTitle => 'അടുത്തുള്ള പ്രിയപ്പെട്ടത്';

  @override
  String favoritesNearbyBody(String name) {
    return 'മെഷിൽ $name സമീപത്തുണ്ട്';
  }

  @override
  String get favoritesInAreaTitle => 'പ്രദേശത്ത് പ്രിയപ്പെട്ടത്';

  @override
  String favoritesInAreaBody(String name) {
    return 'ഈ മേഖലയിൽ $name ഓൺലൈനാണ്';
  }

  @override
  String get topologyTitle => 'മെഷ് ടോപ്പോളജി';

  @override
  String get topologySubtitle =>
      'മെഷിൽ നിന്നുള്ള സമപ്രായക്കാരും കണക്ഷൻ സൂചനകളും പ്രഖ്യാപിക്കുന്നു (വായിക്കാൻ മാത്രം)';

  @override
  String get topologyConnectedNow => 'ഇപ്പോൾ കണക്റ്റുചെയ്‌തു (BLE)';

  @override
  String get topologyNearby => 'സമീപം (BLE)';

  @override
  String get topologyKnown => 'അറിയപ്പെടുന്ന സമപ്രായക്കാർ';

  @override
  String get topologyEmpty =>
      'സമപ്രായക്കാരൊന്നും ഇതുവരെ പഠിച്ചിട്ടില്ല - BLE ഓണാക്കി സമീപത്ത് നിൽക്കുക';

  @override
  String get topologyYou => 'നിങ്ങൾ';

  @override
  String topologyStats(int peers, int links) {
    return '$peers സമപ്രായക്കാർ · $links ലിങ്കുകൾ';
  }

  @override
  String get topologyGraphHint =>
      'സമീപത്തുള്ള മെഷ് കണ്ടെത്തലിൽ നിന്ന് കണക്കാക്കിയത് — നിങ്ങളുടെ ഉപകരണം ഹൈലൈറ്റ് ചെയ്‌തിരിക്കുന്നു. ചാറ്റ് തുറക്കാൻ ഒരു പിയർ ടാപ്പ് ചെയ്യുക.';

  @override
  String get topologyOpen => 'മെഷ് ടോപ്പോളജി';

  @override
  String get slashHelpTitle => 'കമാൻഡുകൾ';

  @override
  String get slashHelpBody =>
      '/സഹായം - ഈ ലിസ്റ്റ്\n/who — നിലവിലെ ചാനലിലെ ആളുകൾ ഓൺലൈനിൽ\n/ഡ്രോപ്പ് <text> — മുദ്രയിട്ട ഒരു അറിയിപ്പ് ഇവിടെ പിൻ ചെയ്യുക (E2EE ഫാൻ ഔട്ട്)\n\nപൂർണ്ണ ഗൈഡ്: താഴെയുള്ള ഓപ്പൺ ഗൈഡ് ഉപയോഗിക്കുക, അല്ലെങ്കിൽ ക്രമീകരണങ്ങൾ → ഉപയോക്തൃ ഗൈഡ് ഉപയോഗിക്കുക.';

  @override
  String get slashWhoEmpty => 'ഈ ചാനലിൽ ഇപ്പോൾ ഓൺലൈനിൽ ആരും ഇല്ല';

  @override
  String slashWhoTitle(int count) {
    return 'ഓൺലൈൻ ($count)';
  }

  @override
  String get slashDropNeedText =>
      'ഉപയോഗം: / നിങ്ങളുടെ കുറിപ്പ് വാചകം ഡ്രോപ്പ് ചെയ്യുക';

  @override
  String slashDropDone(String channel) {
    return '$channel-ന് നോട്ടീസ് ഉപേക്ഷിച്ചു';
  }

  @override
  String get slashUnknown => 'അജ്ഞാത കമാൻഡ് - ശ്രമിക്കുക /സഹായം';

  @override
  String get announceOpen => 'പ്രഖ്യാപനങ്ങൾ';

  @override
  String get announceTitle => 'പ്രഖ്യാപനങ്ങൾ';

  @override
  String get announceEmpty =>
      'ഇതുവരെ ബോർഡുകളൊന്നുമില്ല - ലോക്ക് ചെയ്‌തതോ തുറന്നതോ ആയ അറിയിപ്പുകൾ പോസ്റ്റുചെയ്യാൻ ഒരെണ്ണം സൃഷ്‌ടിക്കുക';

  @override
  String get announceCreate => 'ബോർഡ് സൃഷ്ടിക്കുക';

  @override
  String get announceCreateHint => 'ബോർഡിൻ്റെ പേര്';

  @override
  String get announceDefaultTitle => 'കമ്മ്യൂണിറ്റി ബോർഡ്';

  @override
  String get announceSettings => 'ബോർഡ് ക്രമീകരണങ്ങൾ';

  @override
  String get announceAllowLocked =>
      'ലോക്ക് ചെയ്ത (എൻക്രിപ്റ്റ് ചെയ്ത) പോസ്റ്റുകൾ അനുവദിക്കുക';

  @override
  String get announceAllowLockedSub =>
      'ബോർഡ് കീയിലേക്ക് എൻക്രിപ്റ്റ് ചെയ്തിരിക്കുന്നു — വായനക്കാർക്ക് ആക്‌സസ് ആവശ്യമാണ്';

  @override
  String get announceAllowOpen =>
      'തുറന്ന (പ്ലെയിൻടെക്സ്റ്റ്) പോസ്റ്റുകൾ അനുവദിക്കുക';

  @override
  String get announceAllowOpenSub =>
      'E2EE അല്ല - മെഷ്/റിലേകളിൽ വായിക്കാൻ കഴിയും. സ്ഥിരസ്ഥിതിയായി ഓഫ്.';

  @override
  String get announceComposeHint => 'ഒരു അറിയിപ്പ് എഴുതുക…';

  @override
  String get announceMediaInternetOnly =>
      'ഫോട്ടോ/വോയ്‌സ് അറിയിപ്പുകൾ ഇൻ്റർനെറ്റിലൂടെ അയയ്‌ക്കുന്നു (BLE അല്ല)';

  @override
  String get announceNeedInternet =>
      'ഫോട്ടോ അല്ലെങ്കിൽ വോയ്‌സ് അറിയിപ്പുകൾ അയയ്‌ക്കാൻ ഇൻ്റർനെറ്റിലേക്ക് കണക്‌റ്റ് ചെയ്യുക';

  @override
  String announceVoiceFailed(String error) {
    return 'ശബ്ദം റെക്കോർഡ് ചെയ്യാനായില്ല: $error';
  }

  @override
  String get announceImageTooLarge => 'ചിത്രം വളരെ വലുതാണ് (പരമാവധി ~180 KB)';

  @override
  String get announcePlayVoice => 'വോയ്‌സ് നോട്ട് പ്ലേ ചെയ്യുക';

  @override
  String get announceImageLabel => 'ചിത്രം';

  @override
  String get announceAudioLabel => '🎤 വോയിസ് നോട്ട്';

  @override
  String get announceModeLocked => 'പൂട്ടി';

  @override
  String get announceModeOpen => 'തുറക്കുക';

  @override
  String get announceOpenBadge => 'തുറക്കുക · എൻക്രിപ്റ്റ് ചെയ്തിട്ടില്ല';

  @override
  String get announceLockedBadge => 'പൂട്ടി';

  @override
  String get announceLockedPlaceholder =>
      'എൻക്രിപ്റ്റ് ചെയ്തിരിക്കുന്നു — വായിക്കാൻ ആക്‌സസ് അഭ്യർത്ഥിക്കുക';

  @override
  String get announceRequestAccess => 'പ്രവേശനം അഭ്യർത്ഥിക്കുക';

  @override
  String get announceRequestSent => 'പ്രവേശന അഭ്യർത്ഥന ബോർഡ് ഉടമയ്ക്ക് അയച്ചു';

  @override
  String get announceRequestFailed =>
      'ആക്സസ് അഭ്യർത്ഥിക്കാൻ കഴിഞ്ഞില്ല (ഉടമയുടെ പൊതു കീ ആവശ്യമാണ്)';

  @override
  String get announceOpenConfirmTitle => 'എൻക്രിപ്ഷൻ ഇല്ലാതെ പോസ്റ്റ് ചെയ്യണോ?';

  @override
  String get announceOpenConfirmBody =>
      'ഓപ്പൺ പോസ്റ്റുകൾ E2EE അല്ല. പാതയിലുള്ള ആർക്കും (മെഷ് / റിലേകൾ) അവ വായിച്ചേക്കാം. തുടരുക?';

  @override
  String get announcePostAction => 'പോസ്റ്റ്';

  @override
  String get announcePendingRequests => 'ആക്സസ് അഭ്യർത്ഥനകൾ';

  @override
  String get announceApprove => 'അംഗീകരിക്കുക';

  @override
  String get announceDeny => 'നിഷേധിക്കുക';

  @override
  String get announceGranted =>
      'ഈ ബോർഡിൽ നിങ്ങൾക്ക് ലോക്ക് ചെയ്ത പോസ്റ്റുകൾ വായിക്കാം';

  @override
  String get announceOwner => 'ഈ ബോർഡ് നിങ്ങളുടേതാണ്';

  @override
  String get announceCopyInvite => 'ക്ഷണ വാചകം പകർത്തുക';

  @override
  String get announceShowInviteQr => 'ക്ഷണം QR കാണിക്കുക';

  @override
  String get announceScanInviteQr => 'സ്കാൻ ബോർഡ് ക്ഷണം QR';

  @override
  String get announceFollow => 'ക്ഷണത്തിൽ നിന്നുള്ള ബോർഡ് പിന്തുടരുക';

  @override
  String get announceFollowHint =>
      'ഉടമയിൽ നിന്നുള്ള ക്ഷണ സന്ദേശമോ ResilNet ലിങ്കോ ഒട്ടിക്കുക';

  @override
  String get announceFollowOk => 'പിന്തുടരുന്ന ബോർഡ്';

  @override
  String announceFollowOkNamed(String title) {
    return 'ഇപ്പോൾ പിന്തുടരുന്നത് “$title”';
  }

  @override
  String get announceFollowFail => 'ക്ഷണം അസാധുവാണ് അല്ലെങ്കിൽ കേടായതാണ്';

  @override
  String get announceInviteCopied => 'ക്ഷണം വാചകം പകർത്തി';

  @override
  String get announceInviteSaveQr => 'QR സംരക്ഷിക്കുക';

  @override
  String get announceInviteShare => 'ക്ഷണം പങ്കിടുക';

  @override
  String get announceFollowFromCompose =>
      'സന്ദേശ ബോക്സിൽ ബോർഡ് ക്ഷണം കണ്ടെത്തി';

  @override
  String get peerConfirmAddTitle => 'നെറ്റ്‌വർക്ക് അംഗത്തെ ചേർക്കണോ?';

  @override
  String peerConfirmAddBody(String name) {
    return '\"$name\" അവരുടെ പബ്ലിക് കീ ഉപയോഗിച്ച് ചേർക്കുക, അതുവഴി നിങ്ങൾക്ക് അവർക്ക് സ്വകാര്യമായി സന്ദേശമയയ്‌ക്കാനാകുമോ?';
  }

  @override
  String get peerConfirmAdd => 'അംഗത്തെ ചേർക്കുക';

  @override
  String peerAddedOk(String name) {
    return 'നെറ്റ്‌വർക്ക് അംഗങ്ങളിലേക്ക് $name ചേർത്തു';
  }

  @override
  String get peerAddFromCompose =>
      'സന്ദേശ ബോക്സിൽ ഐഡൻ്റിറ്റി / പൊതു കീ കണ്ടെത്തി';

  @override
  String get peerHashCopied => 'പബ്ലിക് കീ ഹാഷ് പകർത്തി';

  @override
  String get peerHashOpenChat => 'ചാറ്റ് തുറക്കുക';

  @override
  String get peerHashAddHint =>
      'ഹാഷ് പകർത്തി. അവരുടെ ഐഡൻ്റിറ്റി ലിങ്ക് അല്ലെങ്കിൽ ക്യുആർ പങ്കിടാൻ അവരോട് ആവശ്യപ്പെടുക, അതുവഴി നിങ്ങൾക്ക് E2EE-യ്‌ക്കായി മുഴുവൻ പൊതു കീയും ചേർക്കാനാകും.';

  @override
  String get peerQrNoCode => 'ഈ ചിത്രത്തിൽ ResilNet QR ഒന്നും കണ്ടെത്തിയില്ല';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet ഐഡൻ്റിറ്റി: \"$name\"\nലിങ്ക് തുറക്കുക അല്ലെങ്കിൽ ചാറ്റിൽ ഒട്ടിക്കുക → അംഗത്തെ ചേർക്കുക\nഅല്ലെങ്കിൽ ഐഡൻ്റിറ്റി QR സ്കാൻ ചെയ്യുക.';
  }

  @override
  String get identityShareInvite => 'ഐഡൻ്റിറ്റി ലിങ്ക് പങ്കിടുക';

  @override
  String get identityInviteCopied => 'ഐഡൻ്റിറ്റി ലിങ്ക് പകർത്തി';

  @override
  String announceInviteSharePreamble(String title) {
    return 'ബോർഡ് ക്ഷണം: “$title”\nResilNet → കമ്മ്യൂണിറ്റി ബോർഡുകൾ തുറക്കുക → ക്ഷണത്തിൽ നിന്ന് പിന്തുടരുക\nഅല്ലെങ്കിൽ QR സ്കാൻ ചെയ്യുക / താഴെയുള്ള ലിങ്കിൽ ടാപ്പ് ചെയ്യുക.';
  }

  @override
  String get announceConfirmFollowTitle => 'ഈ ബോർഡ് പിന്തുടരണോ?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ഈ ക്ഷണത്തിൽ നിന്ന് \"$title\" പിന്തുടരണോ?';
  }

  @override
  String get announceConfirmFollow => 'പിന്തുടരുക';
}

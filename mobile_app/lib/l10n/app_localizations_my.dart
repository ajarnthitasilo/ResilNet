// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ပြန်လည်စတင်နေသည် ResilNet…';

  @override
  String get appRefreshed =>
      'ပြန်လည်စတင်သည် — ရေဒီယိုများနှင့် ရှာဖွေတွေ့ရှိမှု ပြန်လည်စတင်ခဲ့သည်။';

  @override
  String appRefreshFailed(String error) {
    return 'ပြန်လည်စတင်ခြင်း မအောင်မြင်ပါ- $error';
  }

  @override
  String get appRefreshTitleHint =>
      'နှစ်ချက်တို့ပါ = ပျော့ပျောင်းသော ပြန်လည်စတင်ခြင်း။ Long-press = ခက်ခက်ခဲခဲ ပြန်လည်ရယူသည်။ Triple-tap = အရေးပေါ် သုတ်ခြင်း။';

  @override
  String get softRefreshTipTitle =>
      'အကယ်၍ ResilNet သည် ပိတ်မိနေသည်ဟု ခံစားရသည်။';

  @override
  String get softRefreshTipBody =>
      'ပျော့ပျောင်းသောရေဒီယို ResilNet refresh အတွက်နှစ်ချက်ထိပုတ်ပါ (ဘယ်ဘက်ထိပ်) ။ ပိတ်ဆို့နေဆဲဖြစ်ပါက: ခေါင်းစဉ်ကိုကြာမြင့်စွာနှိပ်ပါ ၊ ခက်ခဲသောပြန်လည်နာလန်ထူမှု (→သို့) Settings ကိုသုံးပါ ။ သုံးချက်နှိပ်ခြင်းသည် အရေးပေါ်သုတ်ခြင်းသာဖြစ်သည် ။';

  @override
  String get softRefreshTipGotIt => 'နားလည်ပြီ';

  @override
  String get infoSoftRefreshTitle => 'အက်ပ်သည် ကပ်ငြိနေပါက၊';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet (အပေါ်-ဘယ်) ကို နှစ်ချက်တို့ပြီး → နူးညံ့သော ပြန်လည်ဆန်းသစ်သော ရေဒီယိုများနှင့် အနီးနားရှိ လူများ';

  @override
  String get infoSoftRefreshStepHard =>
      'ကပ်နေသေးလား။ ခေါင်းစဉ်ကို ကြာရှည်စွာ နှိပ်ပါ သို့မဟုတ် ⋮ / ဆက်တင်များ → ခက်ခဲစွာ ပြန်လည်ရယူပါ။';

  @override
  String get infoSoftRefreshStepWait =>
      'ရလဒ် snackbar ကို စောင့်ပါ၊ ထို့နောက် ထပ်လုပ်ကြည့်ပါ။ ဆက်ရှင်ပြန်လည်သတ်မှတ်ခြင်းသည် သင့်သော့များကို သိမ်းဆည်းထားသည်။';

  @override
  String get infoSoftRefreshStepWipe =>
      'Triple-tap = အရေးပေါ် သုတ်ခြင်း (ဒေသခံ ဒေတာကို ဖျက်သည်) — ရည်ရွယ်ချက်ရှိမှသာလျှင်';

  @override
  String get appRecoverySection => 'အက်ပ်ပြန်လည်ရယူခြင်း။';

  @override
  String get appRecoverySectionSubtitle =>
      'အက်ပ်ကို အေးခဲသွားသည်ဟု ခံစားရသည့်အခါ သုံးပါ။ Soft = ခေါင်းစဉ်ကို နှစ်ချက်တို့ပါ။ Hard recover က ပိုအားကောင်းတယ်။ စက်ရှင်ပြန်လည်သတ်မှတ်ခြင်းသည် သော့များကို ဖျက်ခြင်းမရှိဘဲ ဝန်ဆောင်မှုများကို ပြန်လည်စတင်သည်။';

  @override
  String get appHardRecoverAction => 'ခက်ခက်ခဲခဲ ပြန်လည်ရယူပါ။';

  @override
  String get appHardRecovering => 'ပြန်လည်ရယူရန်ခက်ခဲသည်...';

  @override
  String get appSessionResetAction => 'သတ်မှတ်ချိန်ကို ပြန်လည်သတ်မှတ်ပါ။';

  @override
  String get appSessionResetRunning => 'စက်ရှင်ကို ပြန်လည်သတ်မှတ်နေသည်...';

  @override
  String get appSessionResetConfirmTitle => 'စက်ရှင်ကို ပြန်လည်သတ်မှတ်မလား။';

  @override
  String get appSessionResetConfirmBody =>
      'ဤစက်ပစ္စည်းပေါ်ရှိ ResilNet ဝန်ဆောင်မှုများကို ပြန်လည်စတင်သည်။ သင်၏အထောက်အထားသော့များကို သိမ်းဆည်းထားသည်။';

  @override
  String get appRecoveryBusy => 'ပြန်လည်ရယူရေး လုပ်ဆောင်နေပြီ…';

  @override
  String get appRecoveryOk => 'ပြန်လည်ရယူခြင်း ပြီးပါပြီ။';

  @override
  String get appRecoveryPartial =>
      'ပြန်လည်ရယူခြင်းသည် အချို့သောအဆင့်များကို ကျော်သွားသဖြင့် ပြီးသွားသည် — ပိတ်ထားပါက ထပ်စမ်းကြည့်ပါ။';

  @override
  String get appRecoveryFailed =>
      'ပြန်လည်ရယူခြင်း မအောင်မြင်ပါ — Session reset လုပ်ကြည့်ပါ သို့မဟုတ် OS မှ အက်ပ်ကို အတင်းပိတ်ပါ။';

  @override
  String get localWifiTitle => 'ဒေသဆိုင်ရာ Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'အင်တာနက်မပါဘဲ အနီးနားရှိ စက်များကို လင့်ခ်ချိတ်ပါ — LAN တစ်ခုတွင် ရှိနေသကဲ့သို့ပင်။';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ဂိတ်ဝ SoftAP မဟုတ်ပါ။ ၎င်းသည် phone↔phone/LAN သာဖြစ်သည်။';

  @override
  String get localWifiUnavailable =>
      'Local Wi‑Fi သည် အဆင်သင့်မဖြစ်သေးပါ — အက်ပ်စတင်ခြင်းကို စောင့်ပါ။';

  @override
  String get lxmfBridgeTitle => 'Home node';

  @override
  String get lxmfBridgeSubtitle =>
      'အလုံပိတ်ချတ်များကို ထပ်ဆင့်ပို့သော သင်၏ Wi‑Fi တွင် ရွေးချယ်နိုင်သော Mac သို့မဟုတ် Pi။ မူရင်းအတိုင်း ပိတ်ပါ။ အဆုံးမှ အဆုံး ကုဒ်ဝှက်ခြင်းကို အစားမထိုးပါ။';

  @override
  String get lxmfBridgeEnable => 'home node ကိုသုံးပါ။';

  @override
  String get lxmfBridgeDisabledHint =>
      'Bridge အက်ပ်ကို ဤကွန်ရက်ပေါ်တွင် Mac သို့မဟုတ် Pi ပေါ်တွင် လုပ်ဆောင်နေမှသာ ဖွင့်ပါ။';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'အွန်လိုင်း — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'home node သို့ မရောက်နိုင်ပါ — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Home node လိပ်စာ';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'အိုင်ပီသို့မဟုတ် http://အိုင်ပီ:port ကို — ဥပမာ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'ရွယ်တူချင်း → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'အခြေအနေကို သိမ်းဆည်းပြီး ပြန်လည်စတင်ပါ။';

  @override
  String get lxmfBridgeLabHint => 'အဆင့်မြင့်- labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Home node ဆက်တင်များ';

  @override
  String get lxmfBridgeCheckConnection => 'ချိတ်ဆက်မှုကို စစ်ဆေးပါ။';

  @override
  String get lxmfBridgeStatusOnline => 'home node သို့ ချိတ်ဆက်ထားသည်။';

  @override
  String get lxmfBridgeStatusOffline => 'Home node ကို ဆက်သွယ်၍မရပါ။';

  @override
  String get lxmfBridgeYourDest =>
      'ဤ node ၏လိပ်စာ (သူငယ်ချင်းများနှင့်မျှဝေပါ)';

  @override
  String get lxmfBridgeCopyDest => 'လိပ်စာကို ကူးယူပါ။';

  @override
  String get lxmfBridgeDestCopied => 'လိပ်စာ ကူးယူထားပါသည်။';

  @override
  String get lxmfBridgeLinkedPeers => 'ချိတ်ဆက်ထားသော သူငယ်ချင်းများ';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'သူငယ်ချင်းတစ်ဦးစီသည် ၎င်းတို့၏ အိမ်လိပ်စာ တစ်ကြိမ် လိုအပ်ပါသည်။ ထို့နောက် အလုံပိတ်ချတ်များသည် ဤလမ်းကြောင်းကို အသုံးပြုနိုင်သည်။';

  @override
  String get lxmfBridgeNoLinks =>
      'သူငယ်ချင်းများနှင့် ချိတ်ဆက်ထားခြင်း မရှိသေးပါ။';

  @override
  String get lxmfBridgeAddLink => 'သူငယ်ချင်းတစ်ယောက်နဲ့ ချိတ်ဆက်ပါ။';

  @override
  String get lxmfBridgePickPeer => 'သူငယ်ချင်း';

  @override
  String get lxmfBridgePeerDest => 'သူတို့ရဲ့ home-node လိပ်စာ';

  @override
  String get lxmfBridgePeerDestHint =>
      '၎င်းတို့၏ Home node မျက်နှာပြင်မှ စာလုံး ၃၂ လုံးပါသော ကုဒ်';

  @override
  String get lxmfBridgeInvalidDest =>
      'ထိုလိပ်စာသည် တရားဝင်ပုံမပေါ်ပါ။ ၎င်းတို့၏ home node မှ ကုဒ်အပြည့်အစုံကို ကူးထည့်ပါ။';

  @override
  String get lxmfBridgeRemoveLink => 'လင့်ခ်ဖြုတ်ပါ။';

  @override
  String get lxmfBridgeSaveLink => 'သိမ်းဆည်းပါ။';

  @override
  String get lxmfBridgeLinkSaved => 'သူငယ်ချင်းက ချိတ်ထားတယ်။';

  @override
  String get lxmfBridgeNoPeers =>
      'စာတိုပေးပို့နိုင်သော အဆက်အသွယ်များ မရှိသေးပါ — မိတ်ဆွေတစ်ဦးဦးစွာ ပေါင်းထည့်ပါ။';

  @override
  String get lxmfBridgeHelp =>
      'တံတားကို Mac/Pi ပေါ်တွင် လည်ပတ်နေပါစေ။ ဤလမ်းကြောင်းသည် သင့် LAN တွင်ရှိနေသည် — ၎င်းသည် LoRa မဟုတ်ဘဲ အင်တာနက် သို့မဟုတ် ဘလူးတုသ်ကွက်ကို အစားထိုးမည်မဟုတ်ပါ။';

  @override
  String get localWifiModeHotspot => 'အနီးနား';

  @override
  String get localWifiModeRouter => 'Router ပါ။';

  @override
  String get localWifiHotspotIntro =>
      'စက်တစ်ခုသည် Personal Hotspot ကို မျှဝေသည်။ အခြားသူများသည် ထိုဟော့စပေါ့တွင် ပါဝင်ကြပြီး၊ ထို့နောက် ResilNet သည် ၎င်းတို့ကို ဒေသတွင်း ကွန်ရက်တွင် တွေ့ရှိသည်။';

  @override
  String get localWifiHostAction => 'ကွန်ရက် (Host) ဖန်တီးပါ';

  @override
  String get localWifiJoinAction => 'ကွန်ရက်ချိတ်ဆက်ပါ။';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android ဆက်တင်များကိုဖွင့်ပြီး Personal Hotspot (သို့မဟုတ် Internet Sharing) ကိုဖွင့်ပါ။\n2. သူငယ်ချင်းများကို ဟော့စပေါ့အမည် (နှင့် စကားဝှက်) ကို ပြောပြပါ။\n3. ဤနေရာကိုပြန်လာပြီး “ဟော့စပေါ့ဖွင့်ထားသည် — စတင်စောင့်ဆိုင်းပါ” ကိုနှိပ်ပါ။';

  @override
  String get localWifiHostReady => 'ဟော့စပေါ့ဖွင့်ထားသည် — စတင်စောင့်ဆိုင်းပါ။';

  @override
  String get localWifiHostWaiting =>
      'ပါဝင်မည့်သူငယ်ချင်းများကို စောင့်နေသည်...';

  @override
  String get localWifiJoinSteps =>
      '1. စနစ်ဆက်တင်များကိုဖွင့်ပြီး သင့်သူငယ်ချင်း၏ Personal Hotspot သို့ ဝင်ရောက်ပါ။\n2. ဤနေရာကိုပြန်လာပြီး “ကျွန်တော်ချိတ်ဆက်ထားသည် — ရှာဖွေရန်” ကိုနှိပ်ပါ။';

  @override
  String get localWifiJoinReady => 'ငါချိတ်ဆက်နေသည် — ရှာဖွေမှု';

  @override
  String get localWifiRouterIntro =>
      'စက်ပစ္စည်းတိုင်းကို တူညီသော Wi‑Fi router/AP သို့ ချိတ်ဆက်ပါ။ Router သည် အင်တာနက် မလိုအပ်ပါ — မျှဝေထားသော ဒေသတွင်း ကွန်ရက်တစ်ခုသာ ဖြစ်သည်။';

  @override
  String get localWifiRouterSearch => 'ဤ Wi‑Fi တွင် ရှာပါ။';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi အချက်အလက်ကို ပြန်လည်စတင်ပါ။';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi တွင် မရှိပါ။';

  @override
  String get localWifiRouterNoWifiBody =>
      'စနစ်ဆက်တင်များတွင် router ၏ Wi‑Fi နှင့် ချိတ်ဆက်ပြီး ထပ်မံရှာဖွေပါ။';

  @override
  String get localWifiDiscovering => 'ဒေသတွင်း Wi‑Fi တွင် ရှာဖွေနေသည်…';

  @override
  String get localWifiPeersFound => 'ဤကွန်ရက်ရှိ စက်ပစ္စည်းများ';

  @override
  String get localWifiStop => 'ရပ်';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi အမည်ကို မရနိုင်ပါ။';

  @override
  String get localWifiStubBanner => 'LAN ပေါက်ပေါက်ကို စောင့်နေသည်...';

  @override
  String get localWifiLiveBanner =>
      'LAN ရှာဖွေတွေ့ရှိမှု တိုက်ရိုက်ထုတ်လွှင့်ခြင်း (UDP) — ဤ Wi‑Fi တွင် ကြေငြာ + အလုံပိတ်ချတ်လုပ်ပါ။';

  @override
  String get localWifiEmptyHotspot =>
      'စက်များ မရှိသေးပါ။\nသူငယ်ချင်းများသည် သင့်ဟော့စပေါ့တွင် ပါဝင်ပြီး Local Network အသုံးပြုခွင့်ကို ခွင့်ပြုထားကြောင်း စစ်ဆေးပါ။';

  @override
  String get localWifiEmptyRouter =>
      'စက်များ မရှိသေးပါ။\nSSID အတူတူလား။ Local Network ကို ခွင့်ပြုမလား။ အချို့သော router များသည် device-to-device traffic (AP isolation) ကို ပိတ်ဆို့ထားသည်။';

  @override
  String get localWifiIsolationHelp =>
      'ငါတို့ဘာလို့ တစ်ယောက်နဲ့တစ်ယောက်မတွေ့နိုင်ရတာလဲ။';

  @override
  String get localWifiIsolationTitle =>
      'Router သည် client များကို သီးခြားခွဲထုတ်နိုင်သည်။';

  @override
  String get localWifiIsolationBody =>
      'AP/Client isolation (သို့မဟုတ် Guest network) ကိုဖွင့်ထားပါက၊ တူညီသော Wi‑Fi မှ ဖုန်းများသည် စကားမပြောနိုင်ပါ။ အထီးကျန်မှုကို ပိတ်ပါ၊ ပင်မ SSID ကို အသုံးပြုပါ သို့မဟုတ် အနီးနား (ဟော့စပေါ့) မုဒ်သို့ ပြောင်းပါ။';

  @override
  String get localWifiPeerReady => 'စကားပြောရန်အဆင်သင့် (သော့ပါရှိသည်)';

  @override
  String get localWifiPeerNeedKey =>
      'တွေ့ရှိသည် — သော့လဲလှယ်ရန် QR စကင်န်ဖတ်ပါ။';

  @override
  String get localWifiErrorTitle => 'စက်တွင်း Wi‑Fi အမှား';

  @override
  String get localWifiErrorBody =>
      'တစ်ခုခုမှားသွားသည်။ ရပ်ပြီး ထပ်စမ်းကြည့်ပါ။';

  @override
  String get preparingSystem => 'စနစ်ပြင်ဆင်နေသည်…';

  @override
  String get bootFailedTitle => 'မစတင်နိုင်ခဲ့ပါ။';

  @override
  String get retry => 'ထပ်ကြိုးစားပါ။';

  @override
  String get bootRecoveryAction =>
      'အထောက်အထားအသစ်ကို စတင်ပါ (ဒေသခံဒေတာကို ဖျက်ပါ)';

  @override
  String get bootRecoveryConfirmTitle => 'အထောက်အထားအသစ်ကို စတင်မလား။';

  @override
  String get bootRecoveryConfirmBody =>
      '၎င်းက ဤစက်ပစ္စည်းပေါ်ရှိ စက်တွင်းရှိ ချတ်များ၊ သော့များနှင့် အထောက်အထားများကို အပြီးအပိုင် ဖျက်လိုက်ပါမည်။\nရွယ်တူများသည် သင်၏အထောက်အထားအသစ်ဖြင့် သင်၏ QR ကို ထပ်မံစကင်န်ဖတ်ရပါမည်။\nဒါကို ပြန်ပြင်လို့ မရပါဘူး။';

  @override
  String get bootRecoveryRunning =>
      'ဒေသဆိုင်ရာအထောက်အထားကို ပြန်လည်သတ်မှတ်နေသည်...';

  @override
  String get bootRecoverySuccess =>
      'ဒေသတွင်း အထောက်အထား ပြန်လည်သတ်မှတ်မှု ပြီးပါပြီ။';

  @override
  String bootRecoveryFailed(String error) {
    return 'အထောက်အထားကို ပြန်လည်သတ်မှတ်၍မရပါ- $error';
  }

  @override
  String get cancel => 'မလုပ်တော့';

  @override
  String get save => 'သိမ်းဆည်းပါ။';

  @override
  String get close => 'ပိတ်လိုက်';

  @override
  String get start => 'စတင်ပါ။';

  @override
  String get send => 'ပို့ပါ။';

  @override
  String get settings => 'ဆက်တင်များ';

  @override
  String get language => 'ဘာသာစကား';

  @override
  String get languageSubtitle =>
      'ပုံမှန်အားဖြင့် အက်ပ်သည် သင့်ဖုန်းဘာသာစကားကို လိုက်နာသည် (ပံ့ပိုးပေးသောအခါ)။ အခြားဘာသာစကားများကို အင်္ဂလိပ်ဘာသာသို့ ပြန်ပြောင်းသည်။ ဤနေရာတွင် ဘာသာစကားတစ်ခုကိုလည်း လော့ခ်ချနိုင်သည်။';

  @override
  String get languageSystem => 'စနစ် ပုံသေ';

  @override
  String get languageThai => 'ထိုင်း';

  @override
  String get languageEnglish => 'အင်္ဂလိပ်စာ';

  @override
  String get notificationsTooltip => 'အကြောင်းကြားချက် ဆက်တင်များ';

  @override
  String get enableMessageNotifications =>
      'မက်ဆေ့ဂျ် အသိပေးချက်များကို ဖွင့်ပါ။';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 မက်ဆေ့ဂျ်များနှင့် အွန်လိုင်းရှိလူများ (ဒေသခံသတိပေးချက်များ)';

  @override
  String get networkMembersTooltip => 'ကွန်ရက်အဖွဲ့ဝင်များ';

  @override
  String get identityQrTooltip => 'အထောက်အထား / QR';

  @override
  String get feedDirects => 'စကားစမြည်';

  @override
  String get feedMesh => '#ကွက်';

  @override
  String get feedGeo => 'ဧရိယာ';

  @override
  String get feedDirectsSubtitle => 'သီးသန့် E2EE မက်ဆေ့ဂျ်များ';

  @override
  String get feedMeshSubtitle => 'အနီးနားရှိ ရွယ်တူများ (BLE)';

  @override
  String get feedGeoSubtitle => 'Geohash ရှာဖွေတွေ့ရှိမှုချန်နယ်';

  @override
  String get peerIdHint =>
      'ချတ်စတင်ရန် လက်ခံသူ ID (အများပြည်သူကီး ဟက်ရှ်) ကို ကူးထည့်ပါ။';

  @override
  String get directsEmpty =>
      'ချတ်လုပ်ခြင်းမရှိသေးပါ — စတင်ရန် QR ကို စကင်န်ဖတ်ပါ သို့မဟုတ် လက်ခံသူ ID ကို ကူးထည့်ပါ။\nမက်ဆေ့ဂျ်များကို မပို့မီ E2EE ဖြင့် တံဆိပ်ခတ်ထားပါသည် (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ချတ်ဖွင့်ရန် တို့ပါ။';

  @override
  String get meshIntro =>
      'BLE အပိုင်းအခြားရှိ ရွယ်တူများ — သီးသန့် E2EE ချတ်အတွက် တို့ပါ ( #mesh တွင် အများသူငှာ မရေးပါနှင့်)\nဟိုက်ဘရစ်ရောက်တာမှတဆင့် ပို့သည် (BLE + LoRa + Nostr)';

  @override
  String get meshEmptyRunning =>
      'အနီးနားရှိ ရွယ်တူများ မရှိသေးပါ — BLE အပိုင်းအခြားအတွင်း အခြားစက်ပစ္စည်းပေါ်တွင် အက်ပ်ကိုဖွင့်ပါ။';

  @override
  String get meshEmptyStopped =>
      'BLE သည် အလုပ်မလုပ်ပါ — Bluetooth / တည်နေရာခွင့်ပြုချက်ပေးပါ။';

  @override
  String get meshNearbyPrefix => 'အနီးနား';

  @override
  String get meshRetentionTitle => 'မက်ဆေ့ဂျ်များကို အလိုအလျောက်ဖျက်ပါ။';

  @override
  String get meshRetentionSubtitle =>
      'ဒေသတွင်း ချတ်မှတ်တမ်းဟောင်းကို အလိုအလျောက် ဖယ်ရှားသည်။';

  @override
  String get meshRetentionKeep => 'စောင့်ရှောက်ပါ။';

  @override
  String get meshRetention1Day => '၁ ရက်';

  @override
  String get meshRetention3Days => '၃ ရက်';

  @override
  String get meshRetention7Days => '၇ ရက်';

  @override
  String get refreshLocationTooltip => 'တည်နေရာကို ပြန်လည်စတင်ပါ။';

  @override
  String get geoIntro =>
      'ဤ geohash ရှိ အွန်လိုင်းလူများအား 1:1 သို့မဟုတ် ဧရိယာ အများသူငှာ အားပေးသူထံ မက်ဆေ့ချ်ပို့နိုင်သည် (ရွယ်တူတစ်ဦးလျှင် E2EE တံဆိပ်ခတ်ထားဆဲဖြစ်သည် — စာသားမပါ)';

  @override
  String geoEmpty(String channel) {
    return '$channel တွင် မည်သူမျှ အွန်လိုင်းမရသေးပါ။\nသယ်ယူပို့ဆောင်ရေး → အင်တာနက်/အလိုအလျောက်သုံးပါ၊ Nostr ကိုစောင့်ပါ၊ တည်နေရာကို ပြန်လည်စတင်ပါ။';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel တွင် အွန်လိုင်း • 1:1 E2EE အတွက် တို့ပါ။';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'အနီးနားရှိ (ဧရိယာတည်ရှိမှုကို စောင့်ဆိုင်းနေသည်) • 1:1 E2EE အတွက် နှိပ်ပါ။';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Nostr တွင် $channel တွင် တွေ့ရသည် • ရှာဖွေတွေ့ရှိမှုသာ (အမွေအနှစ်)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'အမွေအနှစ်အမည်မသိရှိခြင်း — နှောင်ဖွဲ့ထားသည့်ရွယ်တူ သို့မဟုတ် QR လဲလှယ်မှုကို စောင့်ပါ။';

  @override
  String get bleRadioNearbySubtitle =>
      'အနီးနားရှိ BLE — 1:1 E2EE စတင်ရန် QR ကို စကင်န်ဖတ်ပါ။';

  @override
  String get geoInternetDiscoverHint =>
      'ဧရိယာအင်တာနက်ရှာဖွေတွေ့ရှိမှုသည် Nostr လိုအပ်သည် (ဆက်တင်များ → သယ်ယူပို့ဆောင်ရေး → အင်တာနက်/ အလိုအလျောက်)';

  @override
  String get geoEmptyNoLocation =>
      'တည်နေရာကို မဖြေရှင်းရသေးပါ — သင်၏ geohash ကို Nostr တွင် ထုတ်ဝေရန် GPS ကို ခွင့်ပြုပြီး ပြန်လည်စတင်ပါ။';

  @override
  String get geoEmptyNeedsPermission =>
      'တည်နေရာခွင့်ပြုချက်ကို ငြင်းပယ်ထားသည် — ဆက်တင်များ → ကိုယ်ရေးကိုယ်တာ → တည်နေရာတွင် ResilNet ကို ခွင့်ပြုပါ။';

  @override
  String get geoEmptyServicesDisabled =>
      'တည်နေရာဝန်ဆောင်မှုများကို ပိတ်ထားသည် — ဆက်တင်များတွင် ၎င်းတို့ကို ဖွင့်ပါ။';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS ပြုပြင်ခြင်း ( Wi‑Fi> iPads များတွင် အဖြစ်များသည်) — အောက်တွင် geohash ကို ကိုယ်တိုင်သတ်မှတ်ပါ။';

  @override
  String get geoEmptyTeleportHint =>
      'နေရာ အိုင်ကွန်ကို နှိပ်ပါ → geohash (ဥပမာ w5) → တယ်လီပို့ကို ရိုက်ထည့်ပါ။';

  @override
  String get geoSetGeohashManually => 'geohash သတ်မှတ်ပါ။';

  @override
  String get geoTeleportHint =>
      'GPS မရှိဘူးလား? geohash ရှေ့စာလုံး (၂-၇ လုံး၊ ဥပမာ w5) ကို ရိုက်ထည့်ပြီး တယ်လီပို့ကို နှိပ်ပါ။';

  @override
  String get geoTeleportInvalid =>
      'မမှန်ကန်သော geohash — အခြေခံ 32 စာလုံး/နံပါတ်များကိုသာ အသုံးပြုပါ (ဥပမာ w5 သို့မဟုတ် w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ဧရိယာကို $channel ဟု သတ်မှတ်ထားသည်။';
  }

  @override
  String geoManualActive(String channel) {
    return 'လူကိုယ်တိုင် ဧရိယာ- $channel (GPS ပြန်လည်ဆန်းသစ်မှုကို အစားထိုးမည်)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr အဆင်သင့်မဖြစ်သေး — ပြန်လည်ချိတ်ဆက်ပါ (0/0 init အောင်မြင်သည်အထိ) ကိုနှိပ်ပါ။';

  @override
  String get geoEmptyMeshOnly =>
      'သယ်ယူပို့ဆောင်ရေးသည် မက်ရှ်-သာဖြစ်သည် — Nostr နှင့် ရွယ်တူများကို ရှာဖွေရန် အင်တာနက် သို့မဟုတ် အော်တိုသို့ ပြောင်းပါ။';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel တွင် မည်သူမျှ မရှိသေးပါ — Area + Internet ကို စက်နှစ်ခုလုံးတွင် ဖွင့်ထားပြီး ~60s စောင့်ပါ။';
  }

  @override
  String get geoChannelFallback => '#ဧရိယာ';

  @override
  String get geoRefreshLocation => 'တည်နေရာကို ပြန်လည်စတင်ပါ။';

  @override
  String get settingsClearLocationTitle => 'တည်နေရာကို ရှင်းလင်းပါ။';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / teleport geohash ကို ဖယ်ရှားပါ (ဧရိယာ #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'တည်နေရာကို ရှင်းမလား။';

  @override
  String get settingsClearLocationConfirmBody =>
      'ဤစက်တွင် သိမ်းဆည်းထားသော geohash ကို ဖျက်သည်။ သင်သည် GPS ကို ပြန်လည်စတင်နိုင်သည် သို့မဟုတ် တယ်လီပို့တ်ပြီးနောက်တွင် ထပ်မံလုပ်ဆောင်နိုင်သည်။';

  @override
  String get settingsClearLocationAction => 'တည်နေရာကို ရှင်းလင်းပါ။';

  @override
  String get settingsClearLocationSnack => 'တည်နေရာကို ရှင်းလင်းထားသည်။';

  @override
  String get chatVoiceTooLarge =>
      'အသံမှတ်စု ကြီးလွန်းသည် — အများဆုံး စက္ကန့် ၃၀';

  @override
  String get chatVoiceNeedInternet =>
      'အသံမှတ်စုသည် အင်တာနက် (Nostr) လိုအပ်သည် — BLE တစ်ခုတည်းအတွက် အလွန်ကြီးမားသည်။';

  @override
  String get chatVoiceSentInternet =>
      'အသံမှတ်စုကို အင်တာနက်မှတစ်ဆင့် ပေးပို့ခဲ့သည်။';

  @override
  String get noticeAnonMention => 'ဖော်ပြခြင်း။';

  @override
  String get noticeAnonDm => 'တိုက်ရိုက်သတင်းစကား';

  @override
  String get noticeAnonHug => 'ပွေ့ဖက်';

  @override
  String get noticeAnonSlap => 'ပါးရိုက်';

  @override
  String get noticeAnonBlock => 'ဘလောက်';

  @override
  String get noticeAnonNeedKey =>
      'အများသူငှာသော့မရှိသေးပါ — QR ကို 1:1 အတွက် ဦးစွာလဲလှယ်ပါ။';

  @override
  String get noticeAnonActionSent => 'ပို့လိုက်ပါတယ်။';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon ကို ပိတ်ဆို့ထားသည်။';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* ပွေ့ဖက် $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '*ပါးရိုက်ခြင်း $anon*';
  }

  @override
  String get geoReconnectNostr => 'Nostr ကို ပြန်လည်ချိတ်ဆက်ပါ။';

  @override
  String get nostrSectionTitle => 'Nostr ထပ်ဆင့်များ';

  @override
  String get nostrSectionSubtitle =>
      'အင်တာနက် စာတိုပေးပို့ခြင်း နှင့် ဧရိယာ ရှာဖွေတွေ့ရှိမှု တို့သည် ဤထပ်ဆင့်လွှင့်မှုများကို အသုံးပြုသည်။ အခြေအနေ အော့ဖ်လိုင်းဖြစ်နေပါက ပြန်လည်ချိတ်ဆက်ပါ ကိုနှိပ်ပါ။';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'ချိတ်ဆက်ထားသည် $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'အော့ဖ်လိုင်း — relay များကို စာရင်းပြုစုထားသော်လည်း ချိတ်ဆက်ထားခြင်းမရှိပါ။';

  @override
  String get nostrStatusNotInit =>
      'မစတင်ပါ (0/0) — စတင်ရန် ပြန်လည်ချိတ်ဆက်ရန် ကိုနှိပ်ပါ။';

  @override
  String get nostrReconnectAction => 'Nostr ကို ပြန်လည်ချိတ်ဆက်ပါ။';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr ချိတ်ဆက်ထားသည် ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'အော့ဖ်လိုင်းဖြစ်နေဆဲ — Wi‑Fi/cellular ကိုစစ်ဆေးပါ သို့မဟုတ် ထပ်စမ်းကြည့်ပါ။';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'မအောင်မြင်ပါ- $error';
  }

  @override
  String get nostrReconnecting => 'Relay များနှင့် ချိတ်ဆက်နေသည်...';

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
    return '$channel ရှိ အင်တာနက် (Nostr) • အလုံပိတ်ချတ် အဆင်သင့်ဖြစ်ပါပြီ။';
  }

  @override
  String get transportModeTitle => 'ဧရိယာသယ်ယူပို့ဆောင်ရေး';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE အနီးနားရှိ (ရေဒီယို) Nostr · အင်တာနက် & အော်တို = Nostr လူများစာရင်း';

  @override
  String get transportModeMesh => 'ကွက်';

  @override
  String get transportModeInternet => 'အင်တာနက်';

  @override
  String get transportModeAuto => 'အော်တို';

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
      'ဤဧရိယာရှိ အွန်လိုင်းရှိ လူတိုင်းထံ အများသူငှာ မက်ဆေ့ချ်';

  @override
  String get geoPublicSend => 'အများသူငှာ';

  @override
  String geoPublicHelp(int count) {
    return '$count အွန်လိုင်းမှ သက်တူရွယ်တူ(များ)ထံ ပန်ကာအပိတ်ခံထားရသည် — တစ်ဦးစီသည် သီးသန့်စာအိတ်ကို ရရှိသည်။';
  }

  @override
  String geoPublicSent(int count) {
    return 'ဤဧရိယာရှိ $count ရွယ်တူ(များ)ထံ ပို့လိုက်သည်။';
  }

  @override
  String get geoPublicSentNone =>
      'အွန်လိုင်းတွင် စာတိုပေးပို့နိုင်သော ရွယ်တူများ မရှိပါ — သော့ပါသော လုပ်ဖော်ကိုင်ဖက်များနှင့် Area/Mesh ကိုဖွင့်ပါ၊ သို့မဟုတ် BLE/Nostr ကို စောင့်ပါ။';

  @override
  String get areaPublicBadge => 'နယ်မြေလူထု';

  @override
  String get geoErrorPermission =>
      'တည်နေရာကို ဖတ်၍မရပါ — တည်နေရာခွင့်ပြုချက်ကို စစ်ဆေးပါ။';

  @override
  String get geoPrecisionRegion => 'တိုင်းဒေသကြီး';

  @override
  String get geoPrecisionProvince => 'ပြည်နယ်';

  @override
  String get geoPrecisionCity => 'မြို';

  @override
  String get geoPrecisionNeighborhood => 'ရပ်ကွက်ထဲ';

  @override
  String get geoPrecisionBlock => 'ပိတ်ဆို့သည်။';

  @override
  String get aliasTitle => 'အမည်ပြောင် သတ်မှတ်ပါ (အဆက်အသွယ်အမည်များ)';

  @override
  String get aliasHintBody =>
      'ဤအမည်နာမကို ဤစက်ပစ္စည်းပေါ်တွင်သာ သိမ်းဆည်းထားပါသည် (စက်တွင်းသီးသန့်)\n၎င်းကို E2EE အသွားအလာဖြင့် ဘယ်သောအခါမှ မပို့ပါ။';

  @override
  String get aliasLabel => 'နာမည်ပြောင်';

  @override
  String get aliasHint => 'ဥပမာ \"ရွာခေါင်း\" \"P\'Somchai\"...';

  @override
  String get settingsDevices => 'စက်များ';

  @override
  String get settingsFirmwareTitle => 'ဒေါင်းလုဒ်လုပ်/အပ်ဒိတ် ESP32 ဖိုင်းဝဲ';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ဖိုင်များကိုဒေါင်းလုဒ်လုပ်ပြီး OTA မှတစ်ဆင့် ESP32 ဘုတ်ကို အပ်ဒိတ်လုပ်ပါ။';

  @override
  String get mtBridgeTitle => 'Meshtastic တံတား';

  @override
  String get mtBridgeSettingsSubtitle =>
      'စာသားသီးသန့် A/B တံတား — ResilNet E2EE မဟုတ်ပါ။';

  @override
  String get mtBridgeIntro =>
      'Meshtastic နှင့် ResilNet ကြားတွင် တိုတောင်းသော စာသားကို ရွှေ့ပါ။ မုဒ် A နှင့် B သည် တစ်ချိန်တည်းတွင် မလည်ပတ်နိုင်ပါ။ ၎င်းသည် အဆုံးမှ အဆုံး ကုဒ်ဝှက်ခြင်းမဟုတ်ပါ။';

  @override
  String get mtBridgeModeLabel => 'မုဒ်';

  @override
  String get mtBridgeModeOff => 'ပိတ်သည်။';

  @override
  String get mtBridgeModeA => 'စားသုံးရန် A';

  @override
  String get mtBridgeModeB => 'Egress B';

  @override
  String get mtBridgeModeOffShort => 'ပိတ်သည်။';

  @override
  String get mtBridgeModeAShort => 'Aတွ၊';

  @override
  String get mtBridgeModeBShort => 'အဲ B';

  @override
  String get mtBridgeMutexHint =>
      'မုဒ်တစ်ခုကို ရွေးချယ်ခြင်းသည် အခြားတစ်ခုကို အလိုအလျောက် ပိတ်သွားစေသည်။ တစ်ပြိုင်နက် A+B ကို မပံ့ပိုးပါ။';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ဒီမို (မှတ်တမ်း)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      '#meshtastic အဖြစ် Notices အောက်တွင် Inbound စာသားပေါ်လာပါသည်။ Mesh relay သည် ရွေးချယ်နိုင်သည် (ပုံမှန်အားဖြင့် ပိတ်သည်)။';

  @override
  String get mtBridgeRelayTitle => 'ResilNet ကွက်ပေါ်တွင်လည်း ထပ်ဆင့်လွှင့်ပါ။';

  @override
  String get mtBridgeRelayHint =>
      'ဖွင့်သည့်အခါတွင် လက်မှတ်ရေးထိုးထားသော အများသူငှာ စာစောင်များကို ထုတ်လွှင့်သည်။ ပိတ် = ဤဖုန်း၏ သတိပေးချက်များသာ။';

  @override
  String get mtBridgeSimulateHint => 'ဒီမို မက်ဆေ့ချ်';

  @override
  String get mtBridgeSimulate => 'Meshtastic မက်ဆေ့ဂျ်ကို ပုံစံတူလုပ်ပါ။';

  @override
  String get mtBridgeIngestOk =>
      'သတိပေးချက်များ (#meshtastic) တွင် ထည့်သွင်းထားသည်';

  @override
  String get mtBridgeEgressWarning =>
      'သတိပေးချက်- ဤနေရာတွင် ပေးပို့ထားသော စာများသည် ResilNet E2EE မဟုတ်ပါ။ Meshtastic လမ်းကြောင်းရှိ မည်သူမဆို ၎င်းတို့ကို ဖတ်နိုင်သည်။';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'ထုတ်ဝေရန် စာသား';

  @override
  String get mtBridgeSend => 'Meshtastic သို့ ပို့ပါ။';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic အတွက် တန်းစီထားသည် (မှတ်တမ်း/မှတ်တမ်းကို ကြည့်ပါ)';

  @override
  String get mtBridgeLastEgress => 'နောက်ဆုံးထွက်';

  @override
  String get mtBridgeEgressHistory => 'မကြာသေးမီက ထွက်ခွာခဲ့သည်။';

  @override
  String get mtBridgeOffHint =>
      'တံတားကိုအသုံးပြုရန် Ingest (A) သို့မဟုတ် Egress (B) ကိုဖွင့်ပါ။';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · E2EE မဟုတ်ပါ။';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT သယ်ယူပို့ဆောင်ရေးကို အသုံးပြုပါ။';

  @override
  String get mtBridgeUseMqttHint =>
      'Off = ဒီမို လော့ဂ်အင်ဂရန် (MQTT အတွင်းဘက်သို့ လျစ်လျူရှုထားသည်)။ ချိတ်ဆက်ထားသောအခါတွင် ထည့်သွင်းခြင်း/egress အတွက် = MQTT ကို ဖွင့်သည်။';

  @override
  String get mtBridgeMqttHost => 'ပွဲစားအိမ်ရှင်';

  @override
  String get mtBridgeMqttPort => 'ဆိပ်ကမ်း';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ကိုသုံးပါ';

  @override
  String get mtBridgeMqttTlsHint =>
      'ပုံမှန် port 8883. စနစ်လက်မှတ်များကိုအသုံးပြုသည်; ပျော့ပျောင်းသော လက်ဆွဲခြင်း အမှားအယွင်းများ အဆင်မပြေပါ။';

  @override
  String get mtBridgeMqttAutoReconnect => 'အလိုအလျောက် ပြန်လည်ချိတ်ဆက်ပါ။';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'ဖွင့်သောအခါတွင်၊ လိုင်းကျသွားပြီးနောက် ပြန်လည်ချိတ်ဆက်ရန် ကြိုးစားသည်။ အခြေအနေကို ပြန်လည်ရယူသည်အထိ ချိတ်ဆက်ခြင်းကို ပြသသည်။';

  @override
  String get mtBridgeMqttTopicHelpers => 'ခေါင်းစဉ်ထောက်များ';

  @override
  String get mtBridgeMqttRegion => 'ဒေသရှေ့ဆက် (ချန်လှပ်ထားနိုင်သည်)';

  @override
  String get mtBridgeMqttRegionHint =>
      'သတ်မှတ်သည့်အခါ၊ msh/<region>/2/json အဖြစ် အမြစ်ကို ပြန်လည်တည်ဆောက်ပါ (ခေါင်းစဉ်ကို အစားထိုးသည်)။';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON ခေါင်းစဉ် root';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Downlink ချန်နယ်အမည်';

  @override
  String get mtBridgeMqttApplyTopics =>
      'root → စာရင်းသွင်း/ထုတ်ဝေခြင်း အကြောင်းအရာများကို အသုံးပြုပါ။';

  @override
  String get mtBridgeMqttAdvanced => 'အဆင့်မြင့် MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS၊ ပြန်လည်ချိတ်ဆက်ရန်၊ အကြောင်းအရာများ၊ အထောက်အထားများ';

  @override
  String get mtBridgeMqttTopicIn => 'ခေါင်းစဉ်စာရင်းသွင်းပါ။';

  @override
  String get mtBridgeMqttTopicOut => 'အကြောင်းအရာကို ထုတ်ဝေပါ။';

  @override
  String get mtBridgeMqttGatewayFrom => 'Gateway node id (မှ)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ဒဿမ အိုင်ဒီ သို့မဟုတ် !hex — ပေးပို့သည့် စာသားဒေါင်းလုပ်လင့်ခ်အတွက် လိုအပ်သည်။';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Mesh ချန်နယ်ညွှန်းကိန်း (ချန်နယ် 0–7)';

  @override
  String get mtBridgeMqttUser => 'အသုံးပြုသူအမည် (ချန်လှပ်ထားနိုင်သည်)';

  @override
  String get mtBridgeMqttPass => 'စကားဝှက် (ချန်လှပ်ထားနိုင်သည်)';

  @override
  String get mtBridgeMqttPassStored =>
      'စကားဝှက်ကို ဤစက်ပစ္စည်းတွင် သိမ်းဆည်းထားပါသည် (မပြပါ)။';

  @override
  String get mtBridgeMqttPassReplace =>
      'စကားဝှက်အသစ် (သိမ်းဆည်းရန် ကွက်လပ်ထားခဲ့ပါ)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'သိမ်းဆည်းထားသော စကားဝှက်ကို သိမ်းဆည်းရန် ဗလာချန်ထားပါ။';

  @override
  String get mtBridgeMqttPassClear => 'စကားဝှက်ကို ရှင်းလင်းပါ။';

  @override
  String get mtBridgeMqttSave => 'MQTT ဆက်တင်များကို သိမ်းဆည်းပါ။';

  @override
  String get mtBridgeMqttSaved => 'MQTT ဆက်တင်များကို သိမ်းဆည်းပြီးပါပြီ။';

  @override
  String get mtBridgeMqttConnect => 'ချိတ်ဆက်ပါ။';

  @override
  String get mtBridgeMqttDisconnect => 'အဆက်အသွယ်ဖြတ်ပါ။';

  @override
  String get mtBridgeMqttConnected => 'MQTT ချိတ်ဆက်ထားသည်။';

  @override
  String get mtBridgeMqttConnecting => 'MQTT ချိတ်ဆက်နေသည်…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT ကို ချိတ်ဆက်မှု ဖြတ်ထားသည်။';

  @override
  String get mtBridgeMqttError => 'MQTT အမှား';

  @override
  String get mtBridgeErrModeIngest => 'ပထမဆုံး Ingest (A) သို့ပြောင်းပါ။';

  @override
  String get mtBridgeErrModeEgress => 'ဦးစွာ Egress (B) သို့ပြောင်းပါ။';

  @override
  String get mtBridgeErrRate => 'နှေးကွေးသည် — နှုန်းထားကန့်သတ်ထားသည်။';

  @override
  String get mtBridgeErrDedupe => 'ပွားနေသည့် မက်ဆေ့ဂျ်ကို လျစ်လျူရှုထားသည်။';

  @override
  String get mtBridgeErrLoop => 'တံတားကွင်းကို တားဆီးရန် ရေစက်';

  @override
  String get mtBridgeErrEmpty => 'Message သည် ဗလာဖြစ်နေသည်။';

  @override
  String get mtBridgeErrPublish => 'ထုတ်ဝေမှု မအောင်မြင်ပါ။';

  @override
  String get mtBridgeErrNotConnected => 'MQTT မချိတ်ဆက်ပါ။';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ပွဲစားအိမ်ရှင်ကို ထည့်ပါ။';

  @override
  String get mtBridgeErrMissingTopic =>
      'စာရင်းသွင်းပြီး အကြောင်းအရာများကို ထည့်သွင်းပါ။';

  @override
  String get mtBridgeErrMissingFromNode =>
      'ပေးပို့စာအတွက် gateway node id (မှ) ထည့်ပါ။';

  @override
  String get mtBridgeErrConnect => 'MQTT ချိတ်ဆက်မှု မအောင်မြင်ပါ။';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS ချိတ်ဆက်မှု မအောင်မြင်ပါ။';

  @override
  String get settingsData => 'ဒေ';

  @override
  String get settingsDataHint =>
      'ဒေတာဘေ့စ်ကို ကျုံ့ရန် ပြည်တွင်းစာများကို ဖျက်ပါ — အထောက်အထား၊ သော့များနှင့် ရွယ်တူများကို သိမ်းဆည်းထားသည်။';

  @override
  String get settingsSaveHistoryTitle => 'မက်ဆေ့ဂျ်မှတ်တမ်းကို သိမ်းဆည်းပါ။';

  @override
  String get settingsSaveHistorySubtitle =>
      'ပိတ်ထားသည့်အခါ၊ မက်ဆေ့ချ်များသည် E2EE ဝိုင်ယာကြိုးပေါ်တွင် ရှိနေပြီး ဤစက်ရှင်အတွက်သာ (ဒေသတွင်း ချတ်မှတ်တမ်းတွင် မဟုတ်ပါ)။ သင့်ကိုယ်ပိုင်စာသားကို ဤစက်ပစ္စည်းပေါ်တွင် ရိုးရိုးစာသားအဖြစ် ပြသနေဆဲဖြစ်သည်။';

  @override
  String get settingsPrivacy => 'ကိုယ်ရေးကိုယ်တာ';

  @override
  String get settingsE2eeTitle => 'အဆုံးမှ အဆုံးထိ ကုဒ်ဝှက်ခြင်း';

  @override
  String get settingsE2eeSubtitle =>
      'အမြဲတမ်းဖွင့်ထားသည် — မက်ဆေ့ဂျ်များကို မပို့မီ RSA-OAEP + AES-GCM ဖြင့် တံဆိပ်ခတ်ထားသည်။ Relay များနှင့် အနီးနားရှိ ဟော့စ်များသည် အကြောင်းအရာများကို ဖတ်၍မရပါ။';

  @override
  String get settingsScreenshotTitle => 'ဖန်သားပြင်ဓာတ်ပုံ သတိပေးချက်များ';

  @override
  String get settingsScreenshotSubtitle =>
      'ဤစက်သည် မျက်နှာပြင်ကို ဖမ်းယူသောအခါ ချတ်တွင် စနစ်လိုင်းတစ်ခုကို ပြပါ။';

  @override
  String get settingsNostrExpiryTitle => 'Nostr မက်ဆေ့ခ်ျကို အချိန်ပေးပါ။';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr မှတစ်ဆင့် အွန်လိုင်းတွင် အလုံပိတ်စာအိတ်များသည် ပြည်တွင်း၌ မည်မျှကြာကြာ ရှိနေသင့်သည်။';

  @override
  String get noticeExpiresIn => 'သက်တမ်းကုန်ဆုံးသည်။';

  @override
  String get noticesTitle => 'သတိပေးချက်များ';

  @override
  String get noticesMeshIntro =>
      'အများသူငှာ စာစောင် — ကုဒ်ဝှက်မထားဘဲ ရေဒီယိုအကွာအဝေးရှိ လူတိုင်းမြင်နိုင်သည်။ ၎င်းသည် ဖုန်းမှဖုန်းသို့ အော့ဖ်လိုင်း ခုန်တက်လာပြီး အနီးနားရှိ ResilNet relay box တွင် မိတ္တူကို သိမ်းဆည်းထားသောကြောင့် နောက်မှရောက်လာသူများသည် ၎င်းကိုမြင်နိုင်ဆဲဖြစ်သည်။';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · ကုဒ်ဝှက်မထားပါ။';

  @override
  String get noticesGeoIntro =>
      'အခြားဧည့်သည်များ ၎င်းတို့ကို ရှာဖွေနိုင်စေရန် ဤနေရာအတွက် မှတ်စုတိုများကို ထည့်ပါ။';

  @override
  String get noticesEmpty => 'သတိပေးချက်မရှိသေးပါ။';

  @override
  String get noticesEmptyHint =>
      'ဤနေရာရှိလူများအတွက် ပထမဆုံးသတိပေးချက်ကို ချိတ်ပါ။';

  @override
  String get noticesComposeHint => 'သတိပေးချက်တင်ပါ...';

  @override
  String get noticesUrgent => 'အရေးတကြီး';

  @override
  String get noticesOpen => 'သတိပေးချက်များ';

  @override
  String get screenshotTaken => '* မင်း စခရင်ရှော့ရိုက်ထားတာ *';

  @override
  String get chatAttachImage => 'ပုံကို ပူးတွဲပါ။';

  @override
  String get chatImageLabel => 'ပုံ';

  @override
  String get chatImageTooLarge =>
      'ပုံကြီးလွန်းသည် — အခြားဓာတ်ပုံကို စမ်းကြည့်ပါ။';

  @override
  String get chatNostrExpiry => 'Nostr ထားပါ။';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel — အများသူငှာ ပေးပို့ပါ။';
  }

  @override
  String get settingsClearTitle => 'မက်ဆေ့ဂျ်အားလုံးကို ရှင်းလင်းပါ။';

  @override
  String get settingsClearSubtitle =>
      'ဤစက်ပစ္စည်းပေါ်ရှိ ချတ်အားလုံးကို ဖျက်ပါ။';

  @override
  String get settingsClearConfirmTitle => 'မက်ဆေ့ဂျ်အားလုံးကို ရှင်းမလား။';

  @override
  String get settingsClearConfirmBody =>
      '၎င်းသည် ဤစက်ပစ္စည်းပေါ်ရှိ ချတ်စာများအားလုံးကို ဖျက်ပစ်သည်။\nရွယ်တူများနှင့် နာမည်ပြောင်များကို မဖယ်ရှားပါ။';

  @override
  String get settingsClearAction => 'ဒေတာရှင်းလင်းပါ။';

  @override
  String get settingsClearedSnack => 'ဒေတာရှင်းပြီးပါပြီ။';

  @override
  String settingsVersion(String version) {
    return 'ဗားရှင်း $version';
  }

  @override
  String get meshBleScanning => 'BLE- nodes အတွက် စကင်န်ဖတ်ခြင်း။';

  @override
  String get meshBleEsp32Scanning => 'ESP32- အနီးနားရှိ node ကို ရှာနေပါသည်။';

  @override
  String get meshBleSyncing => 'BLE- ESP32 နှင့် စင့်ခ်လုပ်နေသည်။';

  @override
  String get meshNostrPublishing => 'Nostr- ထုတ်ဝေခြင်း။';

  @override
  String get meshBleIdle =>
      'BLE mesh ဖွင့်ထားသည် — အနီးနားရှိ ဖုန်းများ မရှိသေးပါ။';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE ကွက် — $count ဖုန်း(များ) အနီးတဝိုက်';
  }

  @override
  String get meshBleNeedsPermission => 'BLE- ခွင့်ပြုချက် လိုအပ်သည်။';

  @override
  String get meshBlePausedCamera =>
      'ကင်မရာအတွက် BLE ခေတ္တရပ်ထားသည် — Start BLE ကိုနှိပ်ပါ။';

  @override
  String get meshBleStopped =>
      'BLE ကို ပိတ်ထားသည် — ဘလူးတုသ်ကိုဖွင့်ထားကြောင်း စစ်ဆေးပါ၊ ထို့နောက် Start BLE ကိုနှိပ်ပါ။';

  @override
  String get meshBleRestart => 'BLE ကို စတင်ပါ။';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction =>
      'ခွင့်ပြုချက်များကို စစ်ဆေးပြီး BLE စတင်ပါ။';

  @override
  String get meshNostrOffline => 'Nostr အော့ဖ်လိုင်း';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count အနီးတဝိုက်ရှိ သက်တူရွယ်တူ • LoRa $lora • စင့်ခ်လုပ်ခြင်း ~${meters}m';
  }

  @override
  String get meshLoraReady => 'အဆင်သင့်';

  @override
  String get meshLoraNotReady => 'အဆင်သင့်မဖြစ်သေးပါ။';

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
    return 'ဂိတ်ဝေး UDP- $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP- အဆင်သင့်ဖြစ်ပါပြီ။';

  @override
  String get permissionTitle =>
      'BLE mesh ကွန်ရက်ကို စတင်ရန် ဝင်ရောက်ခွင့်ပြုပါ။';

  @override
  String get permissionBody =>
      'အပလီကေးရှင်းသည် ရပ်ရွာစာတိုပေးပို့ခြင်းအတွက် Bluetooth (စကင်န်ဖတ်/ချိတ်ဆက်/ကြော်ငြာ)၊ တည်နေရာ (Android စက်အဟောင်းများအတွက်) နှင့် မိုက်ခရိုဖုန်း (ချတ်နှင့် ကြေညာချက်များတွင် အသံမှတ်စုများအတွက်) လိုအပ်ပါသည်။';

  @override
  String get permissionE2ee =>
      'End-to-End ကုဒ်ဝှက်ခြင်း (E2EE)\nRelay node များသည် မက်ဆေ့ချ် အကြောင်းအရာများကို မဖတ်နိုင်ပါ။';

  @override
  String get permissionReady => 'ခွင့်ပြုချက်များ အဆင်သင့်ဖြစ်နေပါပြီ။';

  @override
  String get permissionRequest => 'ခွင့်ပြုပြီး ဆက်လုပ်ပါ။';

  @override
  String get permissionNotReadySnack =>
      'စနစ် အဆင်သင့်မဖြစ်သေးပါ — ခဏစောင့်ပြီး ထပ်စမ်းကြည့်ပါ။';

  @override
  String get permissionDeniedSnack =>
      'ခွင့်ပြုချက်များ မပြည့်စုံပါ — ဆက်တင်များ > ResilNet ကိုဖွင့်ပြီး Bluetooth / တည်နေရာ / မိုက်ခရိုဖုန်းကို ခွင့်ပြုပါ။';

  @override
  String get permissionMicDenied =>
      'မိုက်ခရိုဖုန်းအသုံးပြုခွင့်ကို ငြင်းပယ်လိုက်သည် — ၎င်းကို ဆက်တင်များတွင် အသံမှတ်စုများ မှတ်တမ်းတင်ခွင့်ပြုပါ။';

  @override
  String get permissionMicOpenSettings => 'ဆက်တင်များ';

  @override
  String get permissionCameraDenied =>
      'ကင်မရာအသုံးပြုခွင့်ကို ငြင်းပယ်ထားသည် — ချိန်ညှိချက်များတွင် QR ကုဒ်များကို စကင်န်ဖတ်ခွင့်ပြုပါ။';

  @override
  String get permissionCameraFailed =>
      'QR ကုဒ်များကို စကင်န်ဖတ်ရန် ကင်မရာခွင့်ပြုချက် လိုအပ်ပါသည်။';

  @override
  String get permissionCameraOpenSettings => 'ဆက်တင်များ';

  @override
  String get permissionPhotosDenied =>
      'ဓာတ်ပုံဒစ်ဂျစ်တိုက်အသုံးပြုခွင့်ကို ငြင်းဆိုထားသည် — သင့် QR ကုဒ်ကို သိမ်းဆည်းရန် ဆက်တင်များတွင် ခွင့်ပြုပါ။';

  @override
  String get permissionPhotosFailed =>
      'သင်၏ QR ကုဒ်ကိုသိမ်းဆည်းရန် ဓာတ်ပုံဒစ်ဂျစ်တိုက်ခွင့်ပြုချက် လိုအပ်သည်။';

  @override
  String get permissionPhotosOpenSettings => 'ဆက်တင်များ';

  @override
  String permissionFailedSnack(String error) {
    return 'ခွင့်ပြုချက်တောင်းခံမှု မအောင်မြင်ပါ- $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet ဗိသုကာ • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'ကျော်သွားပါ။';

  @override
  String get onboardingNext => 'နောက်တစ်ခု';

  @override
  String get onboardingStart => 'စတင်လိုက်ပါ။';

  @override
  String get onboardingWelcomeTitle => 'ResilNet မှကြိုဆိုပါသည်။';

  @override
  String get onboardingWelcomeBody =>
      'အင်တာနက်မရှိသော်လည်း mesh ကွန်ရက်မှတဆင့် ResilNet တွင် ချတ်လုပ်ပါ။';

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
      'ကုဒ်ဝှက်ထားသော ချတ် + အနီးနားရှိ ချန်နယ်များ';

  @override
  String get onboardingChannelsBody =>
      'အနီးနားရှိရွယ်တူများကိုရှာရန် #mesh / Area (geohash) သို့ပြောင်းပါ — မက်ဆေ့ချ်များသည် E2EE တွင် BLE mesh နှင့် Nostr တွင်ရှိနေသည်';

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
  String get chatTitle => 'ချတ် (E2EE)';

  @override
  String get chatScanTooltip => 'ရွယ်တူတစ်ဦးထည့်ရန် QR စကန်ဖတ်ပါ။';

  @override
  String get chatBlockTooltip => 'ဤပေးပို့သူကို ပိတ်ပါ။';

  @override
  String get chatBlockedSnack =>
      'ပိတ်ဆို့ထားသည်- အကြောင်းကြားချက်မရှိ/ ထပ်ဆင့်လွှင့်ခြင်း မရှိပါ။';

  @override
  String get chatAliasTooltip => 'အမည်ပြောင် သတ်မှတ်ပါ။';

  @override
  String get chatReceiverPemLabel => 'လက်ခံသူ အများသူငှာသော့ (PEM)';

  @override
  String get chatReceiverPemHint =>
      'သင့်သူငယ်ချင်း၏ အများသူငှာသော့ကို ကူးထည့်ပါ (QR / မျှဝေထားသောဖိုင်မှ)';

  @override
  String get chatNeedPeerKey =>
      'ဤရွယ်တူ၏ QR ကို ဦးစွာစကင်န်ဖတ်ပါ (အတည်ပြုထားသော အများသူငှာသော့ လိုအပ်သည်)';

  @override
  String get chatPeerKeyMismatch =>
      'သိမ်းဆည်းထားသော အများသူငှာသော့သည် ဤမျိုးတူ ID နှင့် မကိုက်ညီပါ။';

  @override
  String chatVoiceFailed(String error) {
    return 'အသံကို မှတ်တမ်းတင်၍မရပါ- $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'အသံမှတ်စုကို ဖွင့်၍မရပါ- $error';
  }

  @override
  String get chatPlayVoice => 'အသံမှတ်စုကို ဖွင့်ပါ။';

  @override
  String get chatPauseVoice => 'ခဏရပ်ပါ။';

  @override
  String get chatVoiceLabelSent => '🎤 အသံမှတ်စု (အလုံပိတ်)';

  @override
  String get chatVoiceLabel => '🎤 အသံမှတ်စု';

  @override
  String get chatDecryptFailed => '[ကုဒ်ဝှက်ခြင်း မအောင်မြင်ပါ]';

  @override
  String chatSentSealed(String preview) {
    return '[အလုံပိတ် • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[အလုံပိတ်]';

  @override
  String get chatComposeHint =>
      'မက်ဆေ့ချ်ကို ရိုက်ထည့်ပါ… (ပို့သည့်အခါတွင် ချိတ်ပိတ်ထားသည်)';

  @override
  String get chatEmptyThread =>
      'မက်ဆေ့ချ်များ မရှိသေးပါ။\nကွက်ကျော်ပေးပို့ရန် အောက်တွင် ရိုက်ထည့်ပါ။';

  @override
  String chatLoadFailed(String error) {
    return 'စကားဝိုင်းကို တင်၍မရပါ- $error';
  }

  @override
  String get chatEmojiTooltip => 'အီမိုဂျီ';

  @override
  String get statusPending => 'ဆိုင်းငံ့ထားသည်။';

  @override
  String get statusSent => 'ပို့လိုက်ပါတယ်။';

  @override
  String get statusRelayed => 'လက်ဆင့်ကမ်း';

  @override
  String get statusDelivered => 'ပေးပို့ခဲ့သည်။';

  @override
  String get statusRead => 'ဖတ်ပါ။';

  @override
  String get statusFailed => 'မအောင်မြင်ပါ။';

  @override
  String get chatCopy => 'ကော်ပီ';

  @override
  String get chatDeleteLocal => 'ဤစက်ပစ္စည်းပေါ်တွင် ဖျက်ပါ။';

  @override
  String get chatDeletedLocalSnack => 'ဤစက်ပစ္စည်းတွင် ဖျက်လိုက်သည်';

  @override
  String get chatRetry => 'ပြန်ကြိုးစားပါ။';

  @override
  String get chatSendFailed => 'မပို့ပေးပါ — ထပ်စမ်းကြည့်ပါ ကိုနှိပ်ပါ။';

  @override
  String get chatImageNeedInternet =>
      'ပုံများပေးပို့ရန် အင်တာနက်သို့ ချိတ်ဆက်ပါ။';

  @override
  String get chatImageTooLargeOnline =>
      'ပုံပို့ရန် လုံလောက်အောင် မချုံ့နိုင်ပါ။';

  @override
  String get chatOpenLinkFailed => 'လင့်ခ်ကို ဖွင့်၍မရပါ။';

  @override
  String get identityTitle => 'အထောက်အထား';

  @override
  String get identityScanTooltip => 'ကင်မရာဖြင့် QR စကင်န်ဖတ်ပါ။';

  @override
  String get identityCopiedHash => 'အများသူငှာသော့ hash ကို ကူးယူထားသည်။';

  @override
  String get identityPeerSaved => 'ရွယ်တူများကို QR မှ သိမ်းဆည်းထားသည်။';

  @override
  String get identityGalleryDenied =>
      'ဓာတ်ပုံစာကြည့်တိုက်ခွင့်ပြုချက်ကို ငြင်းဆိုထားသည်။';

  @override
  String get identityQrSaved =>
      'QR ကို ဓာတ်ပုံဒစ်ဂျစ်တိုက်တွင် သိမ်းဆည်းထားသည်။';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR: $error ကို မသိမ်းဆည်းနိုင်ပါ။';
  }

  @override
  String get peersTitle => 'ကွန်ရက်အဖွဲ့ဝင်များ';

  @override
  String get qrScanTitle => 'သူငယ်ချင်းတစ်ဦးထည့်ရန် QR စကင်န်ဖတ်ပါ။';

  @override
  String get qrInvalid => 'စကင်န်မအောင်မြင်ပါ- မမှန်ကန်သော QR';

  @override
  String get qrIdKeyMismatch =>
      'QR ငြင်းဆိုထားသည်- ID သည် အများသူငှာသော့နှင့် မကိုက်ညီပါ။';

  @override
  String get qrCameraNotReady => 'ကင်မရာ အဆင်သင့် မဖြစ်သေးပါ။';

  @override
  String get qrRetrySettings => 'ထပ်စမ်းကြည့်ပါ / ဆက်တင်များကိုဖွင့်ပါ။';

  @override
  String qrCameraOpenFailed(String error) {
    return 'ကင်မရာကို ဖွင့်၍မရပါ- $error';
  }

  @override
  String get qrScanAlignHint => 'ဘောင်အတွင်းရှိ QR ကုဒ်ကို ချိန်ညှိပါ။';

  @override
  String get firmwareDownloadTitle => 'ESP32 Firmware ကိုဒေါင်းလုဒ်လုပ်ပါ။';

  @override
  String get firmwareSourceOnline => 'နောက်ဆုံး (အွန်လိုင်း)';

  @override
  String get firmwareSourceCached => 'သိမ်းဆည်းထားသောမိတ္တူ (အော့ဖ်လိုင်း)';

  @override
  String get firmwareSourceBaseline =>
      'စုစည်းထားသော အခြေခံလိုင်း (အော့ဖ်လိုင်း)';

  @override
  String get firmwareSourceUnavailable => 'Firmware မရနိုင်ပါ။';

  @override
  String get firmwareBaselineIncompatible =>
      'စုစည်းထားသော ဆော့ဖ်ဝဲသည် ဟောင်းလွန်းသည် — ဗားရှင်းအသစ်ကို ဒေါင်းလုဒ်လုပ်ရန် အင်တာနက်သို့ ချိတ်ဆက်ပါ။';

  @override
  String get firmwareChecksumFailed =>
      'Firmware ၏ ခိုင်မာမှုကို စစ်ဆေးခြင်း မအောင်မြင်ပါ — မှိတ်တုတ်မှိတ်တုတ် ပိတ်ဆို့ထားသည်။';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ဖမ်ဝဲအဆင်သင့်ဖြစ်ပြီ- $source';
  }

  @override
  String get peersRefreshTooltip => 'ပြန်လည်စတင်ပါ။';

  @override
  String get peersBlocked => 'ပိတ်ဆို့ထားသည်။';

  @override
  String get peersNearbyBle => 'အနီးနား (BLE)';

  @override
  String get peersRecentlyOnline => 'မကြာသေးမီက အွန်လိုင်း';

  @override
  String get peersOnlineInArea => 'အွန်လိုင်းဧရိယာ';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'လွန်ခဲ့သော $minutes မိနစ်က တွေ့ခဲ့သည်။';
  }

  @override
  String get peersOffline => 'အော့ဖ်လိုင်း';

  @override
  String peersBlockedSnack(String id) {
    return '$id ကို ပိတ်ဆို့ထားသည်။';
  }

  @override
  String get peersUnblockedSnack => 'ပိတ်ဆို့ထားသည်။';

  @override
  String get peersEmpty =>
      'ဒေတာဘေ့စ်တွင် အဖွဲ့ဝင်များ မရှိသေးပါ။\nQR ကို စကင်ဖတ်ပါ သို့မဟုတ် BLE mesh ရှာဖွေတွေ့ရှိမှုကို စောင့်ပါ။';

  @override
  String get peersOpenChat => 'ချတ်ဖွင့်ပါ။';

  @override
  String get peersBlockAction => 'ပိတ်ဆို့သည်။';

  @override
  String get peersUnblockAction => 'ပြန်ဖွင့်ပါ။';

  @override
  String get channelPickerTooltip => 'ချတ် / #mesh / ဧရိယာ';

  @override
  String get locationPickerTooltip => 'တည်နေရာချန်နယ်';

  @override
  String get transportPickerTooltip => 'Mesh/Internet/Auto';

  @override
  String get onlinePeopleTooltip => 'အွန်လိုင်းကလူတွေ';

  @override
  String get unreadDirectsTooltipEmpty => 'သီးသန့်စာများ';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count မဖတ်ရသေးသော ကိုယ်ပိုင်စာများ';
  }

  @override
  String get onlinePeopleTitle => 'လူတွေ';

  @override
  String get onlinePeopleEmpty => 'ဒီမှာ အွန်လိုင်းမှာ တစ်ယောက်မှ မရှိသေးဘူး။';

  @override
  String onlinePeopleCount(int count) {
    return '$count အွန်လိုင်း';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · အနီးနား + ဧရိယာ';

  @override
  String get peerOnlineMeshTitle => 'အနီးတစ်ဝိုက်တွင် တစ်စုံတစ်ယောက်';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name သည် mesh အနီးတွင်ရှိသည်။';
  }

  @override
  String get peerOnlineAreaTitle => 'အွန်လိုင်းမှာ တစ်စုံတစ်ယောက်ရှိတယ်။';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name သည် Nostr မှတစ်ဆင့် အွန်လိုင်းပေါ်တွင် ရှိနေသည်။';
  }

  @override
  String get locationSheetTitle => '#တည်နေရာချန်နယ်များ';

  @override
  String get channelPinsTitle => 'ပင်ထိုးထားသည်။';

  @override
  String get channelPinsHint =>
      'သင်မကြာခဏအသုံးပြုသည့်ချန်နယ်များကို ပင်ထိုးပါ — ၎င်းတို့သည် ထိပ်ဆုံးတွင်ရှိနေပါသည်။';

  @override
  String get channelPinTooltip => 'ဤချန်နယ်ကို ပင်ထိုးပါ။';

  @override
  String get channelUnpinTooltip => 'ပင်ဖြုတ်ပါ။';

  @override
  String get locationSheetIntro =>
      'ကြမ်းသော geohash သုံးပြီး အနီးနားရှိလူများနှင့် စကားပြောပါ — တိကျသော GPS မဟုတ်ပါ။ အင်တာနက်ပေါ်တွင် ရှိနေခြင်းသည် အမည်မသိ Nostr ကီးများကို အသုံးပြုသည်။';

  @override
  String get locationMeshSubtitle => '#ဘလူးတုသ် • ~10-50 မီတာ';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'ရတနာပုံတယ်လီပို့';

  @override
  String homeComposeHint(String channel) {
    return 'မက်ဆေ့ဂျ် $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel — အများသူငှာ ပေးပို့ပါ။';
  }

  @override
  String get messageExpiryTitle => 'သက်တမ်းကုန်ဆုံးသည်။';

  @override
  String get voiceRecordTapToStart => 'အသံမက်ဆေ့ဂျ်ကို မှတ်တမ်းတင်ရန် တို့ပါ။';

  @override
  String get voiceRecordTooShort =>
      'အသံသွင်းခြင်းသည် တိုလွန်းသည် — ထပ်စမ်းကြည့်ပါ။';

  @override
  String get voiceRecordFailed =>
      'မှတ်တမ်းတင်ခြင်းကို မသိမ်းဆည်းနိုင်ခဲ့ပါ — ထပ်စမ်းကြည့်ပါ။';

  @override
  String get voicePttHold => 'မှတ်တမ်းတင်ရန် ကိုင်ထားပါ။';

  @override
  String get voicePttRelease => 'အစမ်းကြည့်ရှုရန် ထုတ်ဝေပါ။';

  @override
  String get voicePttRecording => 'မှတ်တမ်းတင်နေသည်...';

  @override
  String get voicePttDraftReady => 'အသံမှတ်စု အဆင်သင့်ဖြစ်ပါပြီ။';

  @override
  String get voicePttDiscard => 'ပစ်ပယ်';

  @override
  String get voicePttReRecord => 'မှတ်တမ်းတင်ပြန်တယ်။';

  @override
  String get voicePttSend => 'အသံမှတ်စုပို့ပါ။';

  @override
  String get voicePttPlayPreview => 'အစမ်းကစားပါ။';

  @override
  String get voicePttStopPreview => 'အစမ်းကြည့်ရှုခြင်းကို ရပ်လိုက်ပါ။';

  @override
  String get noticesBackfilling => 'သတိပေးချက်များကို ဖွင့်နေသည်…';

  @override
  String get noticesNostrOnline => 'Nostr အွန်လိုင်း';

  @override
  String get noticesNostrOffline =>
      'Nostr အော့ဖ်လိုင်း — စာစောင်သည် အင်တာနက် လိုအပ်သည်။';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count သတိပေးချက်များကို တင်ထားသည်။';
  }

  @override
  String get noticePublishFailed =>
      'ဧရိယာဘုတ်အဖွဲ့သို့ အကြောင်းကြားစာ မထုတ်ပြန်နိုင်ပါ။ Nostr ချိတ်ဆက်မှုကို စစ်ဆေးပါ။';

  @override
  String get noticeMeshPublishNoLink =>
      'ပြည်တွင်းမှာ သိမ်းတယ်။ အခြားသူများ လက်ခံနိုင်စေရန်အတွက် အနီးနားရှိ mesh ရေဒီယို (သို့မဟုတ် Wi‑Fi) ဂိတ်ဝသို့ ချိတ်ဆက်ပါ။';

  @override
  String noticeMeshPublishSent(int count) {
    return 'စာစောင်ကို BLE ကျော် $count အနီးတဝိုက်ရှိ စက်(များ) သို့ ပေးပို့ခဲ့သည်။';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'အနီးနားရှိ ရေဒီယိုများကို မြင်တွေ့ခဲ့ရသော်လည်း BLE ရေး၍ မရပါ။ အပလီကေးရှင်းနှစ်ခုလုံးကို Notices ဖန်သားပြင်ပေါ်တွင် ဖွင့်ထားပြီး ထပ်စမ်းကြည့်ပါ (သို့မဟုတ် ESP32 relay ကိုသုံးပါ)။';

  @override
  String get noticeMeshPublishNoGatt =>
      'ဤစက်ပစ္စည်း၏ BLE လက်ခံကိရိယာ အဆင်သင့်မဖြစ်သေးပါ။ ဘလူးတုသ်ကို ပြောင်းပြီး သတိပေးချက်များကို ပြန်ဖွင့်ပါ။';

  @override
  String get noticeDelete => 'အသိပေးချက်ကို ဖျက်ပါ။';

  @override
  String get noticeDeleteConfirmTitle => 'ဤသတိပေးချက်ကို ဖျက်မလား။';

  @override
  String get noticeDeleteLocalOnlyBody =>
      '၎င်းသည် ဤစက်ပစ္စည်းပေါ်တွင်သာ ဖယ်ရှားသည်။ လက်ခံရရှိပြီးသော အခြားသူများကလည်း ၎င်းကို မြင်နေကြဆဲဖြစ်သည်။';

  @override
  String get noticeDeleted => 'အသိပေးချက်ကို ဖျက်လိုက်ပါပြီ။';

  @override
  String get chatNoticeHidden => 'ဧရိယာသတိပေးချက် — Notices ကိုဖွင့်ပါ။';

  @override
  String get identityDisplayNameTitle => 'ဖော်ပြမည့်အမည်';

  @override
  String get identitySaveName => 'နာမည်ကို သိမ်းဆည်းပါ။';

  @override
  String get identityUserIdLabel => 'အသုံးပြုသူ ID (အများပြည်သူကီး ဟက်ရှ်)';

  @override
  String get identityCopyHashTooltip => 'အများသူငှာသော့ hash ကို ကူးယူပါ။';

  @override
  String get identityMyQrTitle => 'ကျွန်ုပ်၏ QR (id + pubKey + အမည်)';

  @override
  String identityQrFailed(String error) {
    return 'QR ကို ဖန်တီး၍မရပါ။\n$error';
  }

  @override
  String get identitySaving => 'သိမ်းဆည်းနေသည်...';

  @override
  String get identitySaveQr => 'ဓာတ်ပုံစာကြည့်တိုက်တွင် QR သိမ်းဆည်းပါ။';

  @override
  String get identityOpenScanner => 'QR စကင်န်ဖတ်ရန် ကင်မရာကိုဖွင့်ပါ။';

  @override
  String get identityQrHelp =>
      'သင်၏ အများသူငှာသော့ကို သိမ်းဆည်းရန် ၎င်းကို သူငယ်ချင်းတစ်ဦးအား စကင်ဖတ်ခိုင်းပြီး (လိုအပ်ပါက) သင့်ကို စိစစ်ပြီး ထုတ်ပေးသူအဖြစ် သတ်မှတ်ပါ။';

  @override
  String get identityChatTip =>
      'အကြံပြုချက်- E2EE အတွက် အများသူငှာသော့ထည့်ရန် ချတ်တွင် QR ကို စကင်ဖတ်နိုင်သည်။';

  @override
  String get infoOpen => 'အကြောင်း/အချက်အလက်';

  @override
  String get docsGuideTitle => 'အသုံးပြုသူလမ်းညွှန်';

  @override
  String get docsGuideSubtitle => 'ဘရောက်ဆာတွင်ဖွင့်သည်။';

  @override
  String get docsOpenAction => 'လမ်းညွှန်ဖွင့်ပါ။';

  @override
  String get docsOpenFailed => 'အသုံးပြုသူလမ်းညွှန်ကို ဖွင့်၍မရပါ။';

  @override
  String get firmwareOtaGuideTitle => 'Flash လမ်းညွှန် & OTA ပရိုတိုကော';

  @override
  String get firmwareOtaGuideSubtitle =>
      'ဝဘ်လမ်းညွှန်ကိုဖွင့်ပါ — .bin ဒေါင်းလုဒ်များနှင့် အဆင့်များ အပြည့်အစုံ';

  @override
  String get firmwareWebDownloadsTitle =>
      'ဝဘ်ပေါ်တွင် Firmware ဒေါင်းလုဒ်လုပ်ပါ။';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'docs ဆိုက်ရှိ ဗားရှင်းအလိုက် လင့်ခ်များနှင့် ချက်စမ်များ';

  @override
  String get inviteCopyShortLink => 'လင့်ခ်အတိုကို ကူးယူပါ။';

  @override
  String get inviteShareLink => 'လင့်ခ်ကို မျှဝေပါ။';

  @override
  String get inviteShowFullLink => 'လင့်အပြည့်အစုံ';

  @override
  String get inviteCopyFullLink => 'လင့်အပြည့်အစုံကို ကူးယူပါ။';

  @override
  String get inviteLinkCopied => 'လင့်ခ်ကို ကူးယူထားသည်။';

  @override
  String get inviteLongPressHint =>
      'လင့်ခ်လုပ်ဆောင်ချက်များအတွက် ကြာကြာနှိပ်ပါ။';

  @override
  String get inviteSendInChat => 'ResilNet ချတ်တွင် ပို့ပါ…';

  @override
  String get inviteSendInChatHint =>
      'သင့်အတွက် အများသူငှာသော့ရှိပြီးသားလူများသာ';

  @override
  String get inviteSendInChatEmpty =>
      'စာတိုပေးပို့နိုင်သော ချတ်များ မရှိသေးပါ။\nQR ကို စကင်န်ဖတ်ပါ၊ Area/Mesh ကိုဖွင့်ပါ၊ သို့မဟုတ် အက်ပ်ပြင်ပရှိ လင့်ခ်ကို ဦးစွာမျှဝေပါ။';

  @override
  String get inviteSentToChat => 'ဖိတ်ကြားချက်ကို ချတ်တွင် ပေးပို့ခဲ့သည်။';

  @override
  String get infoTabInfo => 'အချက်အလက်';

  @override
  String get infoTabSettingsHint =>
      'ဘာသာစကား၊ E2EE နှင့် ဒေတာကိရိယာများအတွက် မီနူးမှ ဆက်တင်များကို ဖွင့်ပါ။';

  @override
  String get infoHowToTitle => 'အသုံးပြုနည်း';

  @override
  String get infoHowToBody =>
      '• Chat / #mesh / Area ကိုပြောင်းရန် ချန်နယ်အိုင်ကွန်ကို တို့ပါ။\n• geohash အရွယ်အစားကို ရွေးရန် နေရာကို တို့ပါ။\n• အဖွဲ့ဝင်များ သို့မဟုတ် အွန်လိုင်းရှိသူများအတွက် လူများကို တို့ပါ။\n• လူကိုယ်တိုင်သော့လဲလှယ်ရန် ⋮ မှ Identity/QR ကိုဖွင့်ပါ။\n• ဧရိယာ \"အများပြည်သူ\" သည် အလုံပိတ် E2EE ကို အွန်လိုင်းမှရွယ်တူတစ်ဦးစီထံ ပေးပို့သည် — ရိုးရှင်းသောအခန်းမဟုတ်ပေ။';

  @override
  String get infoFeaturesTitle => 'အင်္ဂါရပ်များ';

  @override
  String get infoFeatureOffline =>
      'စွမ်းအင်နိမ့် Bluetooth မှတဆင့် အော့ဖ်လိုင်းစာတိုပေးပို့ခြင်း။';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM ဖြင့် အဆုံးမှ အဆုံးထိ ကုဒ်ဝှက်ခြင်း (Noise မဟုတ်ပါ။)';

  @override
  String get infoFeatureMultihop =>
      'မက်ဆေ့ဂျ်များသည် အနီးနားရှိရွယ်တူများမှတဆင့် ပိုဝေးသွားနိုင်သည်။';

  @override
  String get infoFeatureBridge =>
      'အလုံပိတ်စာအိတ်များအတွက် Hybrid mesh ↔ အင်တာနက် (Nostr)';

  @override
  String get infoFeatureGeo =>
      'အနီးနားရှိလူများအတွက် ဒေသတွင်း geohash ချန်နယ်များ (discovery UX)';

  @override
  String get infoFeatureNotices =>
      '#mesh နှင့် Area အတွက် သက်တမ်းကုန်ဆုံးမည့် သတိပေးချက်များ';

  @override
  String get infoPrivacyTitle => 'ကိုယ်ရေးကိုယ်တာ';

  @override
  String get infoPrivacyNoRoom =>
      'ဝါယာကြိုးပေါ်တွင် လွင်ပြင်ကျေးရွာ / အများသူငှာ စကားပြောခန်းမရှိပါ။';

  @override
  String get infoPrivacyFanout =>
      'ဧရိယာ ပေးပို့ခြင်း = အများသူငှာသော့များပါသော 1:1 ကို အလုံပိတ် 1:1 fan-out';

  @override
  String get infoPrivacyPresence =>
      'အင်တာနက် ဧရိယာတည်ရှိမှုသည် ပေါ်ပင် Nostr သော့များကို အသုံးပြုသည်။';

  @override
  String get infoSymbolsTitle => 'သင်္ကေတများ';

  @override
  String get infoSymBle => 'တိုက်ရိုက် Bluetooth လင့်ခ်';

  @override
  String get infoSymMesh => 'Mesh မှတဆင့် လက်လှမ်းမီနိုင်သည် (အခြားရှေ့ဆက်သည်)';

  @override
  String get infoSymInternet => 'အင်တာနက်မှတဆင့် (Nostr) — အလုံပိတ်စာအိတ်များ';

  @override
  String get infoSymBridge =>
      'mesh↔internet တံတားလမ်းကြောင်းမှတဆင့် ရောက်ရှိခဲ့သည်။';

  @override
  String get infoSymOffline => 'အော့ဖ်လိုင်း — လောလောဆယ် ဆက်သွယ်၍မရပါ။';

  @override
  String get infoSymInArea => 'ဤတည်နေရာချန်နယ်၏ဧရိယာတွင်';

  @override
  String get infoSymE2eeOk => 'အဆုံးမှ အဆုံးထိ ကုဒ်ဝှက်ထားသော စက်ရှင်';

  @override
  String get infoSymE2eeFail =>
      'ကုဒ်ဝှက်ခြင်း မရရှိနိုင်ပါ — အရေးကြီးသော စာသားများ မပို့ပါနှင့်';

  @override
  String get infoSymVerified => 'အထောက်အထား စိစစ်ပြီး/သိသော သော့';

  @override
  String get infoSymBlocked => 'ပိတ်ဆို့ထားသည်။';

  @override
  String get infoSymUnread => 'မဖတ်ရသေးသော ကိုယ်ရေးကိုယ်တာ မက်ဆေ့ချ်';

  @override
  String get infoEmergencyTitle => 'အရေးပေါ်မုဒ်';

  @override
  String get infoEmergencyBody =>
      'ဤစက်ပစ္စည်းပေါ်ရှိ မက်ဆေ့ချ်များ၊ သော့များနှင့် အထောက်အထားများကို ရှင်းလင်းရန် ပင်မစခရင်ရှိ ResilNet ခေါင်းစဉ်ကို သုံးချက်တို့ပါ။';

  @override
  String get infoLegendNote =>
      'အချို့သော လမ်းကြောင်း အိုင်ကွန်များကို ရှင်းလင်းရန်အတွက် ဤနေရာတွင် မှတ်တမ်းတင်ထားပါသည်။ ချတ်တွင် ပေးပို့မှု အမှတ်အသားများသည် ပင်မ ပေးပို့မှု အခြေအနေအဖြစ် ကျန်ရှိနေပါသည်။';

  @override
  String get dangerZoneTitle => 'အန္တရာယ်ဇုန်';

  @override
  String get dangerZoneSubtitle =>
      'မက်ဆေ့ဂျ်များ၊ ကုဒ်ဝှက်ခြင်းသော့များ၊ Nostr အထောက်အထား၊ ရွယ်တူများနှင့် ဤစက်ပစ္စည်းပေါ်ရှိ အမည်ဝှက်များကို ဖျက်ပါ။ သင် ထပ်မံသတ်မှတ်ပါမည်။';

  @override
  String get panicWipeTitle => 'အရေးပေါ်သုတ်';

  @override
  String get panicWipeSubtitle =>
      'စက်တွင်းရှိ အရာအားလုံးကို ဖျက်ပါ — ပင်မခေါင်းစဉ်ကို သုံးကြိမ်နှိပ်ခြင်းကဲ့သို့ပင် (နှစ်ချက်တို့ပြီး ရေဒီယိုများကို ပြန်လည်ဆန်းသစ်စေသည်)';

  @override
  String get panicWipeConfirmTitle => 'စက်တွင်းဒေတာအားလုံးကို ဖျက်မလား။';

  @override
  String get panicWipeConfirmBody =>
      '၎င်းသည် ဤဖုန်းပေါ်ရှိ ချတ်များ၊ သော့များနှင့် အထောက်အထားများကို အပြီးအပိုင် ဖျက်သည်။\nရွယ်တူများသည် သင်၏အထောက်အထားအသစ်နှင့် QR ကီးများကို ပြန်လည်လဲလှယ်ရပါမည်။\nဒါကို ပြန်ပြင်လို့ မရပါဘူး။';

  @override
  String get panicWipeAction => 'အကုန်သုတ်';

  @override
  String get panicWipeSnack =>
      'ဒေသဆိုင်ရာအထောက်အထားကို ဖယ်ရှားလိုက်သည် — ထပ်မံသတ်မှတ်ပါ။';

  @override
  String panicWipeFailed(String error) {
    return 'ရှင်းလင်းခြင်း မအောင်မြင်ပါ- $error';
  }

  @override
  String get meshBridgeTitle => 'ကွက်တံတား';

  @override
  String get meshBridgeSubtitle =>
      'ဖွင့်ထားသည့်အခါ (မူလ)၊ အလုံပိတ်စာအိတ်များသည် BLE mesh နှင့် internet (Nostr) နှစ်ခုလုံးကို အတူတကွ အသုံးပြုနိုင်ပြီး အနီးနားရှိ mesh ကျွန်းများကို ချိတ်ဆက်နိုင်သည်။ ပိတ်ထားသောအခါ၊ ပေးပို့မှုများသည် လမ်းကြောင်းတစ်ခုတည်းကိုသာ အသုံးပြုပါ — ဝိုင်ယာကြိုးပေါ်တွင် ရိုးရိုးစာသားကို ဘယ်သောအခါမှ မတင်ပါ။';

  @override
  String get favoritesTitle => 'အကြိုက်ဆုံးများ';

  @override
  String get favoritesAdd => 'စိတ်ကြိုက်များထဲသို့ ထည့်ပါ။';

  @override
  String get favoritesRemove => 'စိတ်ကြိုက်များမှ ဖယ်ရှားပါ။';

  @override
  String get favoritesEmpty =>
      'အကြိုက်ဆုံးများ မရှိသေးပါ — အဖွဲ့ဝင်စာရင်းမှ ရွယ်တူတစ်ဦးကို ကြယ်ပွင့်ပြပါ။';

  @override
  String get favoritesNearbyTitle => 'အနီးနားတွင် အကြိုက်ဆုံး';

  @override
  String favoritesNearbyBody(String name) {
    return '$name သည် mesh အနီးတွင်ရှိသည်။';
  }

  @override
  String get favoritesInAreaTitle => 'အကြိုက်ဆုံးဧရိယာ';

  @override
  String favoritesInAreaBody(String name) {
    return '$name သည် ဤဧရိယာတွင် အွန်လိုင်းဖြစ်သည်။';
  }

  @override
  String get topologyTitle => 'Mesh topology';

  @override
  String get topologySubtitle =>
      'Mesh ကြေညာခြင်းမှ ရွယ်တူများနှင့် ချိတ်ဆက်မှု အရိပ်အမြွက်များ (ဖတ်ရန်သာ)';

  @override
  String get topologyConnectedNow => 'ယခုချိတ်ဆက်ထားသည် (BLE)';

  @override
  String get topologyNearby => 'အနီးနား (BLE)';

  @override
  String get topologyKnown => 'ရွယ်တူများ သိကြသည်။';

  @override
  String get topologyEmpty =>
      'ရွယ်တူများ မလေ့လာရသေးပါ — BLE ကိုဖွင့်ပြီး အနီးအနားတွင်နေပါ။';

  @override
  String get topologyYou => 'သင်';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ရွယ်တူများ · $links လင့်ခ်များ';
  }

  @override
  String get topologyGraphHint =>
      'အနီးနားရှိ ကွက်ကွက်ရှာဖွေတွေ့ရှိမှုမှ ခန့်မှန်းထားသည် — သင့်စက်ကို မီးမောင်းထိုးပြထားသည်။ ချတ်ဖွင့်ရန် ရွယ်တူတစ်ဦးကို တို့ပါ။';

  @override
  String get topologyOpen => 'Mesh topology';

  @override
  String get slashHelpTitle => 'အမိန့်များ';

  @override
  String get slashHelpBody =>
      '/help — ဤစာရင်း\n/who — လက်ရှိချန်နယ်ရှိ အွန်လိုင်းရှိလူများ\n/drop <text> — ဤနေရာတွင် အလုံပိတ်သတိပေးချက်ကို ချိတ်ပါ (E2EE fan-out)\n\nလမ်းညွှန်ချက်အပြည့်အစုံ- အောက်ပါဖွင့်လမ်းညွှန်ချက်ကို အသုံးပြုပါ သို့မဟုတ် ဆက်တင်များ → အသုံးပြုသူလမ်းညွှန်။';

  @override
  String get slashWhoEmpty => 'ယခုချန်နယ်တွင် မည်သူမျှ အွန်လိုင်းမရှိပါ။';

  @override
  String slashWhoTitle(int count) {
    return 'အွန်လိုင်း ($count)';
  }

  @override
  String get slashDropNeedText =>
      'အသုံးပြုမှု- / သင့်မှတ်စုစာသားကို ချလိုက်ပါ။';

  @override
  String slashDropDone(String channel) {
    return '$channel တွင် သတိပေးချက် ချထားသည်။';
  }

  @override
  String get slashUnknown => 'အမည်မသိ ကွန်မန်း - ကြိုးစား /help';

  @override
  String get announceOpen => 'ကြေညာချက်များ';

  @override
  String get announceTitle => 'ကြေညာချက်များ';

  @override
  String get announceEmpty =>
      'ဘုတ်များမရှိသေးပါ — လော့ခ်ချထားသော သို့မဟုတ် ဖွင့်ထားသောသတိပေးချက်များကို တင်ရန်တစ်ခုကို ဖန်တီးပါ။';

  @override
  String get announceCreate => 'ဘုတ်ကိုဖန်တီးပါ။';

  @override
  String get announceCreateHint => 'ဘုတ်နာမည်';

  @override
  String get announceDefaultTitle => 'ရပ်ရွာဘုတ်အဖွဲ့';

  @override
  String get announceSettings => 'ဘုတ်ဆက်တင်များ';

  @override
  String get announceAllowLocked =>
      'လော့ခ်ချထားသော (ကုဒ်ဝှက်ထားသော) ပို့စ်များကို ခွင့်ပြုပါ။';

  @override
  String get announceAllowLockedSub =>
      'ဘုတ်ကီးသို့ ကုဒ်ဝှက်ထားသည် — စာဖတ်သူများသည် ဝင်ရောက်အသုံးပြုခွင့် လိုအပ်သည်။';

  @override
  String get announceAllowOpen =>
      'ပွင့်လင်းမြင်သာသော (လွင်ပြင်) ပို့စ်များကို ခွင့်ပြုပါ။';

  @override
  String get announceAllowOpenSub =>
      'E2EE မဟုတ်ပါ — mesh/relays များတွင် ဖတ်နိုင်သည်။ မူရင်းအတိုင်း ပိတ်ပါ။';

  @override
  String get announceComposeHint => 'ကြေငြာချက်ရေးပါ...';

  @override
  String get announceMediaInternetOnly =>
      'ဓာတ်ပုံ/အသံ ကြေငြာချက်များကို အင်တာနက်မှ ပေးပို့ပါ (BLE မဟုတ်ပါ)';

  @override
  String get announceNeedInternet =>
      'ဓာတ်ပုံ သို့မဟုတ် အသံကြေငြာချက်များကို ပေးပို့ရန် အင်တာနက်သို့ ချိတ်ဆက်ပါ။';

  @override
  String announceVoiceFailed(String error) {
    return 'အသံကို မှတ်တမ်းတင်၍မရပါ- $error';
  }

  @override
  String get announceImageTooLarge => 'ပုံသည် ကြီးလွန်းသည် (အများဆုံး ~180 KB)';

  @override
  String get announcePlayVoice => 'အသံမှတ်စုကို ဖွင့်ပါ။';

  @override
  String get announceImageLabel => '📷 ပုံ';

  @override
  String get announceAudioLabel => '🎤 အသံမှတ်စု';

  @override
  String get announceModeLocked => 'သော့ခတ်ထားသည်။';

  @override
  String get announceModeOpen => 'ဖွင့်သည်။';

  @override
  String get announceOpenBadge => 'OPEN · စာဝှက်မထားပါ။';

  @override
  String get announceLockedBadge => 'သော့ခတ်ထားသည်။';

  @override
  String get announceLockedPlaceholder =>
      'ကုဒ်ဝှက်ထားသည် — ဖတ်ရန် ဝင်ရောက်ခွင့် တောင်းဆိုပါ။';

  @override
  String get announceRequestAccess => 'ဝင်ရောက်ခွင့်တောင်းပါ။';

  @override
  String get announceRequestSent =>
      'ဝင်ရောက်ခွင့် တောင်းဆိုချက်ကို ဘုတ်ပိုင်ရှင်ထံ ပေးပို့ခဲ့သည်။';

  @override
  String get announceRequestFailed =>
      'ဝင်ရောက်ခွင့် တောင်းဆို၍မရပါ (ပိုင်ရှင်၏ အများသူငှာသော့ လိုအပ်သည်)';

  @override
  String get announceOpenConfirmTitle => 'ကုဒ်ဝှက်ခြင်းမရှိဘဲ ပို့စ်တင်မလား။';

  @override
  String get announceOpenConfirmBody =>
      'ဖွင့်ထားသော ပို့စ်များသည် E2EE မဟုတ်ပါ။ လမ်းကြောင်း (mesh / relays) ရှိ မည်သူမဆို ၎င်းတို့ကို ဖတ်နိုင်ပါသည်။ ဆက်မလား။';

  @override
  String get announcePostAction => 'ပို့စ်';

  @override
  String get announcePendingRequests => 'ဝင်ခွင့်တောင်းဆိုမှုများ';

  @override
  String get announceApprove => 'လက်မခံပါ။';

  @override
  String get announceDeny => 'ငြင်းတယ်။';

  @override
  String get announceGranted =>
      'ဤဘုတ်ပေါ်တွင် သော့ခတ်ထားသော ပို့စ်များကို သင်ဖတ်နိုင်သည်။';

  @override
  String get announceOwner => 'ဒီဘုတ်ကို မင်းပိုင်တယ်။';

  @override
  String get announceCopyInvite => 'ဖိတ်ကြားချက်စာသားကို ကူးယူပါ။';

  @override
  String get announceShowInviteQr => 'ဖိတ်ကြားချက် QR ကိုပြပါ။';

  @override
  String get announceScanInviteQr => 'ဘုတ်အဖွဲ့ ဖိတ်ကြားချက် QR ကို စကင်ဖတ်ပါ။';

  @override
  String get announceFollow => 'ဖိတ်ကြားချက်မှ ဘုတ်အဖွဲ့သို့ လိုက်ပါ။';

  @override
  String get announceFollowHint =>
      'ဖိတ်ကြားချက်စာသား သို့မဟုတ် ပိုင်ရှင်ထံမှ ResilNet လင့်ခ်ကို ကူးထည့်ပါ။';

  @override
  String get announceFollowOk => 'ဘုတ်အဖွဲ့နောက်လိုက်';

  @override
  String announceFollowOkNamed(String title) {
    return 'ယခု “$title” ကို လိုက်ကြည့်နေသည်';
  }

  @override
  String get announceFollowFail =>
      'ဖိတ်ကြားချက် မမှန်ကန်ပါ သို့မဟုတ် ပျက်စီးနေပါသည်။';

  @override
  String get announceInviteCopied => 'ဖိတ်ကြားစာ ကူးယူထားသည်။';

  @override
  String get announceInviteSaveQr => 'QR သိမ်းဆည်းပါ။';

  @override
  String get announceInviteShare => 'မျှဝေရန် ဖိတ်ကြားအပ်ပါသည်။';

  @override
  String get announceFollowFromCompose =>
      'ဘုတ်အဖွဲ့ ဖိတ်ကြားချက်ကို မက်ဆေ့ချ်ဘောက်စ်တွင် တွေ့ရှိခဲ့သည်။';

  @override
  String get peerConfirmAddTitle => 'ကွန်ရက်အဖွဲ့ဝင်ကို ထည့်မလား။';

  @override
  String peerConfirmAddBody(String name) {
    return '၎င်းတို့၏ အများသူငှာသော့ဖြင့် “$name” ကို ပေါင်းထည့်ခြင်းဖြင့် ၎င်းတို့ကို သီးသန့် မက်ဆေ့ချ်ပို့နိုင်ပါသလား။';
  }

  @override
  String get peerConfirmAdd => 'အဖွဲ့ဝင်ထည့်ပါ။';

  @override
  String peerAddedOk(String name) {
    return 'ကွန်ရက်အဖွဲ့ဝင်များသို့ $name ကို ပေါင်းထည့်ခဲ့သည်။';
  }

  @override
  String get peerAddFromCompose =>
      'မက်ဆေ့ချ်ဘောက်စ်တွင် အထောက်အထား/ အများသူငှာသော့ကို တွေ့ရှိခဲ့သည်။';

  @override
  String get peerHashCopied => 'အများသူငှာသော့ hash ကို ကူးယူထားသည်။';

  @override
  String get peerHashOpenChat => 'ချတ်ဖွင့်ပါ။';

  @override
  String get peerHashAddHint =>
      'Hash ကူးယူထားသည်။ E2EE အတွက် အများသူငှာသော့အပြည့်အစုံကို သင်ထည့်နိုင်စေရန် ၎င်းတို့၏အထောက်အထားလင့်ခ် သို့မဟုတ် QR ကိုမျှဝေရန် ၎င်းတို့အား တောင်းဆိုပါ။';

  @override
  String get peerQrNoCode => 'ဤပုံတွင် ResilNet QR မတွေ့ပါ။';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet အထောက်အထား- “$name”\nလင့်ခ်ကိုဖွင့်ပါ သို့မဟုတ် ချတ်တွင် → အဖွဲ့ဝင်ထည့်ပါ။\nသို့မဟုတ် အထောက်အထား QR ကို စကင်န်ဖတ်ပါ။';
  }

  @override
  String get identityShareInvite => 'အထောက်အထားလင့်ခ်ကို မျှဝေပါ။';

  @override
  String get identityInviteCopied => 'အထောက်အထားလင့်ခ်ကို ကူးယူထားသည်။';

  @override
  String announceInviteSharePreamble(String title) {
    return 'ဘုတ်အဖွဲ့ ဖိတ်ကြားချက်- “$title”\nResilNet ကိုဖွင့်ပါ → ကွန်မြူနတီဘုတ်များ → ဖိတ်ကြားချက်မှ လိုက်နာပါ။\nသို့မဟုတ် QR ကိုစကင်ဖတ်ပါ / အောက်ပါလင့်ခ်ကိုနှိပ်ပါ။';
  }

  @override
  String get announceConfirmFollowTitle => 'ဒီဘုတ်ကို လိုက်လုပ်မလား။';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ဤဖိတ်ကြားချက်မှ “$title” ကို လိုက်ကြည့်မလား။';
  }

  @override
  String get announceConfirmFollow => 'လိုက်နာပါ။';
}

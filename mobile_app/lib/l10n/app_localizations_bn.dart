// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'রিফ্রেশ করা হচ্ছে ResilNet…';

  @override
  String get appRefreshed =>
      'রিফ্রেশ করা হয়েছে — রেডিও এবং আবিষ্কার পুনরায় চালু হয়েছে';

  @override
  String appRefreshFailed(String error) {
    return 'রিফ্রেশ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'ডবল-ট্যাপ = নরম রিফ্রেশ। লং-প্রেস = হার্ড রিকভার। ট্রিপল-ট্যাপ = জরুরী মুছা।';

  @override
  String get softRefreshTipTitle => 'যদি ResilNet আটকে থাকে';

  @override
  String get softRefreshTipBody =>
      'নরম রেডিও রিফ্রেশের জন্য ResilNet (উপরে-বামে) ডবল-ট্যাপ করুন। যদি এখনও আটকে থাকে: শিরোনামটি দীর্ঘক্ষণ চাপুন, ⋮ → হার্ড রিকভার বা সেটিংস ব্যবহার করুন। ট্রিপল-ট্যাপ শুধুমাত্র জরুরি মুছা।';

  @override
  String get softRefreshTipGotIt => 'বুঝেছি';

  @override
  String get infoSoftRefreshTitle => 'যদি অ্যাপ আটকে থাকে';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ডাবল-ট্যাপ করুন ResilNet (উপরে-বাঁ দিকে) → সফট রিফ্রেশ রেডিও এবং আশেপাশের লোকজন';

  @override
  String get infoSoftRefreshStepHard =>
      'এখনও আটকে আছে? শিরোনাম দীর্ঘক্ষণ চাপুন, অথবা ⋮ / সেটিংস → হার্ড পুনরুদ্ধার করুন৷';

  @override
  String get infoSoftRefreshStepWait =>
      'ফলাফলের জন্য অপেক্ষা করুন স্ন্যাকবার, তারপর আবার চেষ্টা করুন। সেশন রিসেট আপনার কী রাখে।';

  @override
  String get infoSoftRefreshStepWipe =>
      'ট্রিপল-ট্যাপ = জরুরী মুছা (স্থানীয় ডেটা মুছে দেয়) — শুধুমাত্র ইচ্ছাকৃত হলে';

  @override
  String get appRecoverySection => 'অ্যাপ পুনরুদ্ধার';

  @override
  String get appRecoverySectionSubtitle =>
      'অ্যাপটি হিমায়িত মনে হলে ব্যবহার করুন। নরম = শিরোনাম ডবল-ট্যাপ করুন। হার্ড পুনরুদ্ধার শক্তিশালী. সেশন রিসেট কী মুছা ছাড়া পরিষেবাগুলি পুনরায় চালু করে৷';

  @override
  String get appHardRecoverAction => 'কঠিন পুনরুদ্ধার';

  @override
  String get appHardRecovering => 'কঠিন পুনরুদ্ধার…';

  @override
  String get appSessionResetAction => 'সেশন রিসেট করুন';

  @override
  String get appSessionResetRunning => 'সেশন রিসেট করা হচ্ছে...';

  @override
  String get appSessionResetConfirmTitle => 'সেশন রিসেট করবেন?';

  @override
  String get appSessionResetConfirmBody =>
      'এই ডিভাইসে ResilNet পরিষেবাগুলি পুনরায় চালু করে৷ আপনার পরিচয় কী রাখা হয়.';

  @override
  String get appRecoveryBusy => 'পুনরুদ্ধার ইতিমধ্যেই চলছে...';

  @override
  String get appRecoveryOk => 'পুনরুদ্ধার সমাপ্ত';

  @override
  String get appRecoveryPartial =>
      'কিছু ধাপ বাদ দিয়ে পুনরুদ্ধার শেষ হয়েছে — এখনও আটকে থাকলে আবার চেষ্টা করুন';

  @override
  String get appRecoveryFailed =>
      'পুনরুদ্ধার ব্যর্থ হয়েছে — সেশন রিসেট করার চেষ্টা করুন, অথবা OS থেকে অ্যাপটিকে জোর করে প্রস্থান করুন';

  @override
  String get localWifiTitle => 'স্থানীয় Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'ইন্টারনেট ছাড়াই আশেপাশের ডিভাইসগুলিকে লিঙ্ক করুন — একই LAN-এ থাকা।';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa গেটওয়ে SoftAP নয়। এটি শুধুমাত্র phone↔phone/LAN।';

  @override
  String get localWifiUnavailable =>
      'স্থানীয় Wi‑Fi এখনও প্রস্তুত নয় — অ্যাপ স্টার্টআপের জন্য অপেক্ষা করুন।';

  @override
  String get lxmfBridgeTitle => 'হোম নোড';

  @override
  String get lxmfBridgeSubtitle =>
      'আপনার Wi‑Fi-এ ঐচ্ছিক Mac বা Pi যা সিল করা চ্যাটগুলিকে রিলে করে। ডিফল্টরূপে বন্ধ। এন্ড-টু-এন্ড এনক্রিপশন প্রতিস্থাপন করে না।';

  @override
  String get lxmfBridgeEnable => 'হোম নোড ব্যবহার করুন';

  @override
  String get lxmfBridgeDisabledHint =>
      'এই নেটওয়ার্কের Mac বা Pi-এ ব্রিজ অ্যাপ চালু হলেই চালু করুন।';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'অনলাইন — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'হোম নোডে পৌঁছানো যাচ্ছে না — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'হোম নোড ঠিকানা';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP বা http://IP:port — উদাহরণ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'পিয়ার → LXMF গন্তব্য (JSON)';

  @override
  String get lxmfBridgeRefresh => 'স্থিতি সংরক্ষণ করুন এবং রিফ্রেশ করুন';

  @override
  String get lxmfBridgeLabHint => 'উন্নত: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'হোম নোড সেটিংস';

  @override
  String get lxmfBridgeCheckConnection => 'সংযোগ পরীক্ষা করুন';

  @override
  String get lxmfBridgeStatusOnline => 'হোম নোডের সাথে সংযুক্ত';

  @override
  String get lxmfBridgeStatusOffline => 'হোম নোড পৌঁছানো যায় না';

  @override
  String get lxmfBridgeYourDest =>
      'এই নোডের ঠিকানা (বন্ধুদের সাথে শেয়ার করুন)';

  @override
  String get lxmfBridgeCopyDest => 'ঠিকানা কপি করুন';

  @override
  String get lxmfBridgeDestCopied => 'ঠিকানা কপি করা হয়েছে';

  @override
  String get lxmfBridgeLinkedPeers => 'সংযুক্ত বন্ধু';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'প্রতিটি বন্ধুর একবার তাদের হোম-নোড ঠিকানা প্রয়োজন। তারপর সিল চ্যাট এই পথ ব্যবহার করতে পারেন.';

  @override
  String get lxmfBridgeNoLinks => 'কোন বন্ধু এখনো লিঙ্ক.';

  @override
  String get lxmfBridgeAddLink => 'একটি বন্ধু লিঙ্ক';

  @override
  String get lxmfBridgePickPeer => 'বন্ধু';

  @override
  String get lxmfBridgePeerDest => 'তাদের বাড়ির-নোড ঠিকানা';

  @override
  String get lxmfBridgePeerDestHint =>
      'তাদের হোম নোড স্ক্রীন থেকে 32-অক্ষরের কোড';

  @override
  String get lxmfBridgeInvalidDest =>
      'এই ঠিকানাটি বৈধ বলে মনে হচ্ছে না। তাদের হোম নোড থেকে সম্পূর্ণ কোড পেস্ট করুন।';

  @override
  String get lxmfBridgeRemoveLink => 'লিঙ্কমুক্ত করুন';

  @override
  String get lxmfBridgeSaveLink => 'সংরক্ষণ করুন';

  @override
  String get lxmfBridgeLinkSaved => 'বন্ধু লিঙ্ক করা';

  @override
  String get lxmfBridgeNoPeers =>
      'এখনও কোন বার্তাযোগ্য পরিচিতি নেই — প্রথমে একজন বন্ধু যোগ করুন।';

  @override
  String get lxmfBridgeHelp =>
      'ব্রিজটিকে Mac/Pi-এ চলমান রাখুন। এই পথটি আপনার LAN-এ থাকে — এটি LoRa নয় এবং ইন্টারনেট বা ব্লুটুথ জাল প্রতিস্থাপন করে না।';

  @override
  String get localWifiModeHotspot => 'কাছাকাছি';

  @override
  String get localWifiModeRouter => 'রাউটার';

  @override
  String get localWifiHotspotIntro =>
      'একটি ডিভাইস একটি ব্যক্তিগত হটস্পট শেয়ার করে। অন্যরা সেই হটস্পটে যোগ দেয়, তারপর ResilNet তাদের স্থানীয় নেটওয়ার্কে খুঁজে পায়।';

  @override
  String get localWifiHostAction => 'নেটওয়ার্ক তৈরি করুন (হোস্ট)';

  @override
  String get localWifiJoinAction => 'নেটওয়ার্কে যোগ দিন';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android সেটিংস খুলুন এবং ব্যক্তিগত হটস্পট (বা ইন্টারনেট শেয়ারিং) চালু করুন।\n2. বন্ধুদের হটস্পটের নাম (এবং পাসওয়ার্ড) বলুন।\n3. এখানে ফিরে আসুন এবং \"হটস্পট চালু আছে - অপেক্ষা শুরু করুন\" এ আলতো চাপুন।';

  @override
  String get localWifiHostReady => 'হটস্পট চালু আছে — অপেক্ষা শুরু করুন';

  @override
  String get localWifiHostWaiting =>
      'বন্ধুদের যোগদানের জন্য অপেক্ষা করা হচ্ছে...';

  @override
  String get localWifiJoinSteps =>
      '1. সিস্টেম সেটিংস খুলুন এবং আপনার বন্ধুর ব্যক্তিগত হটস্পটে যোগ দিন।\n2. এখানে ফিরে যান এবং \"আমি সংযুক্ত — অনুসন্ধান করুন\" এ আলতো চাপুন৷';

  @override
  String get localWifiJoinReady => 'আমি সংযুক্ত — অনুসন্ধান';

  @override
  String get localWifiRouterIntro =>
      'প্রতিটি ডিভাইসকে একই Wi‑Fi রাউটার/AP এর সাথে সংযুক্ত করুন। রাউটারের ইন্টারনেটের প্রয়োজন নেই - শুধুমাত্র একটি ভাগ করা স্থানীয় নেটওয়ার্ক।';

  @override
  String get localWifiRouterSearch => 'এই Wi‑Fi এ অনুসন্ধান করুন';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi তথ্য রিফ্রেশ করুন';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi এ নয়';

  @override
  String get localWifiRouterNoWifiBody =>
      'সিস্টেম সেটিংসে রাউটারের Wi‑Fi যোগ দিন, তারপর আবার অনুসন্ধান করুন।';

  @override
  String get localWifiDiscovering => 'স্থানীয় Wi‑Fi এ অনুসন্ধান করা হচ্ছে…';

  @override
  String get localWifiPeersFound => 'এই নেটওয়ার্কে ডিভাইস';

  @override
  String get localWifiStop => 'থামো';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi নাম অনুপলব্ধ';

  @override
  String get localWifiStubBanner => 'LAN সকেটের জন্য অপেক্ষা করা হচ্ছে...';

  @override
  String get localWifiLiveBanner =>
      'LAN আবিষ্কার লাইভ (UDP) — এই Wi‑Fi-এ + সিল করা চ্যাট ঘোষণা করুন';

  @override
  String get localWifiEmptyHotspot =>
      'এখনো কোনো ডিভাইস নেই।\nবন্ধুরা আপনার হটস্পটে যোগদান করেছে এবং স্থানীয় নেটওয়ার্ক অ্যাক্সেসের অনুমতি দিয়েছে তা পরীক্ষা করুন৷';

  @override
  String get localWifiEmptyRouter =>
      'এখনো কোনো ডিভাইস নেই।\nএকই SSID? স্থানীয় নেটওয়ার্ক অনুমোদিত? কিছু রাউটার ডিভাইস-টু-ডিভাইস ট্রাফিক (এপি আইসোলেশন) ব্লক করে।';

  @override
  String get localWifiIsolationHelp => 'কেন আমরা একে অপরকে খুঁজে পাচ্ছি না?';

  @override
  String get localWifiIsolationTitle =>
      'রাউটার ক্লায়েন্টদের বিচ্ছিন্ন করতে পারে';

  @override
  String get localWifiIsolationBody =>
      'যদি AP/ক্লায়েন্ট আইসোলেশন (বা একটি গেস্ট নেটওয়ার্ক) চালু থাকে, তাহলে একই Wi‑Fi ফোনে কথা বলা যাবে না। বিচ্ছিন্নতা বন্ধ করুন, প্রধান SSID ব্যবহার করুন, বা কাছাকাছি (হটস্পট) মোডে স্যুইচ করুন।';

  @override
  String get localWifiPeerReady => 'চ্যাট করার জন্য প্রস্তুত (চাবি আছে)';

  @override
  String get localWifiPeerNeedKey =>
      'পাওয়া গেছে — কী বিনিময় করতে QR স্ক্যান করুন';

  @override
  String get localWifiErrorTitle => 'স্থানীয় Wi‑Fi ত্রুটি';

  @override
  String get localWifiErrorBody =>
      'কিছু ভুল হয়েছে থামুন এবং আবার চেষ্টা করুন.';

  @override
  String get preparingSystem => 'সিস্টেম প্রস্তুত করা হচ্ছে...';

  @override
  String get bootFailedTitle => 'শুরু করতে পারিনি';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get bootRecoveryAction =>
      'নতুন পরিচয় শুরু করুন (স্থানীয় ডেটা মুছুন)';

  @override
  String get bootRecoveryConfirmTitle => 'নতুন পরিচয় শুরু করবেন?';

  @override
  String get bootRecoveryConfirmBody =>
      'এটি স্থায়ীভাবে এই ডিভাইসে স্থানীয় চ্যাট, কী এবং পরিচয় মুছে ফেলবে৷\nসমবয়সীদের আপনার নতুন পরিচয় দিয়ে আবার আপনার QR স্ক্যান করতে হবে।\nএটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get bootRecoveryRunning => 'স্থানীয় পরিচয় রিসেট করা হচ্ছে...';

  @override
  String get bootRecoverySuccess => 'স্থানীয় পরিচয় রিসেট সম্পূর্ণ';

  @override
  String bootRecoveryFailed(String error) {
    return 'পরিচয় রিসেট করা যায়নি: $error';
  }

  @override
  String get cancel => 'বাতিল করুন';

  @override
  String get save => 'সংরক্ষণ করুন';

  @override
  String get close => 'বন্ধ';

  @override
  String get start => 'শুরু করুন';

  @override
  String get send => 'পাঠান';

  @override
  String get settings => 'সেটিংস';

  @override
  String get language => 'ভাষা';

  @override
  String get languageSubtitle =>
      'ডিফল্টরূপে অ্যাপটি আপনার ফোনের ভাষা অনুসরণ করে (যখন সমর্থিত হয়)। অন্যান্য ভাষা ইংরেজিতে ফিরে আসে। আপনি এখানে একটি ভাষা লক করতে পারেন।';

  @override
  String get languageSystem => 'সিস্টেম ডিফল্ট';

  @override
  String get languageThai => 'থাই';

  @override
  String get languageEnglish => 'ইংরেজি';

  @override
  String get notificationsTooltip => 'বিজ্ঞপ্তি সেটিংস';

  @override
  String get enableMessageNotifications => 'বার্তা বিজ্ঞপ্তি সক্রিয় করুন';

  @override
  String get settingsNotificationsSubtitle =>
      '1:1 বার্তা এবং মানুষ অনলাইন (স্থানীয় সতর্কতা)';

  @override
  String get networkMembersTooltip => 'নেটওয়ার্ক সদস্য';

  @override
  String get identityQrTooltip => 'আইডেন্টিটি/কিউআর';

  @override
  String get feedDirects => 'চ্যাট';

  @override
  String get feedMesh => '#জাল';

  @override
  String get feedGeo => 'এলাকা';

  @override
  String get feedDirectsSubtitle => 'ব্যক্তিগত E2EE বার্তা';

  @override
  String feedMeshSubtitle(Object ble) {
    return 'কাছাকাছি সমবয়সীদের (BLE)';
  }

  @override
  String get feedGeoSubtitle => 'জিওহ্যাশ আবিষ্কার চ্যানেল';

  @override
  String get peerIdHint =>
      'চ্যাট শুরু করতে রিসিভার আইডি (পাবলিক কী হ্যাশ) পেস্ট করুন';

  @override
  String get directsEmpty =>
      'এখনও কোনও চ্যাট নেই — একটি QR স্ক্যান করুন বা শুরু করতে একটি রিসিভার আইডি পেস্ট করুন৷\nবার্তা পাঠানোর আগে E2EE দিয়ে সিল করা হয় (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • চ্যাট খুলতে আলতো চাপুন';

  @override
  String get meshIntro =>
      'BLE পরিসরে সহকর্মীরা — একটি ব্যক্তিগত E2EE চ্যাটের জন্য আলতো চাপুন (#mesh-এ কোনো পাবলিক কম্পোজ নয়)\nহাইব্রিড রাউটারের মাধ্যমে পাঠানো হয় (BLE + LoRa + Nostr যখন অনলাইনে)';

  @override
  String get meshEmptyRunning =>
      'এখনও কাছাকাছি কোনো সহকর্মী নেই — BLE পরিসরের মধ্যে অন্য ডিভাইসে অ্যাপটি খুলুন';

  @override
  String get meshEmptyStopped => 'BLE চলছে না — ব্লুটুথ / অবস্থানের অনুমতি দিন';

  @override
  String get meshNearbyPrefix => 'কাছাকাছি';

  @override
  String get meshRetentionTitle => 'বার্তাগুলি স্বয়ংক্রিয়ভাবে মুছুন';

  @override
  String get meshRetentionSubtitle =>
      'পুরানো স্থানীয় চ্যাট ইতিহাস স্বয়ংক্রিয়ভাবে মুছে ফেলা হয়';

  @override
  String get meshRetentionKeep => 'রাখা';

  @override
  String get meshRetention1Day => '1 দিন';

  @override
  String get meshRetention3Days => '3 দিন';

  @override
  String get meshRetention7Days => '7 দিন';

  @override
  String get refreshLocationTooltip => 'অবস্থান রিফ্রেশ করুন';

  @override
  String get geoIntro =>
      'এই জিওহ্যাশে অনলাইনে থাকা লোকেদের 1:1 বা একটি এলাকা পাবলিক ফ্যান-আউটের সাথে মেসেজ করা যেতে পারে (এখনও প্রতি পিয়ার E2EE সিল করা হয়েছে - প্লেইনটেক্সট নয়)';

  @override
  String geoEmpty(String channel) {
    return 'এখনো $channel এ কেউ অনলাইনে নেই\nপরিবহন → ইন্টারনেট/অটো ব্যবহার করুন, Nostr এর জন্য অপেক্ষা করুন, অবস্থান রিফ্রেশ করুন';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel-এ অনলাইন • 1:1 E2EE-এর জন্য ট্যাপ করুন';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'কাছাকাছি (এলাকায় উপস্থিতির জন্য অপেক্ষা করা হচ্ছে) • 1:1 E2EE এর জন্য আলতো চাপুন';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel এ Nostr এ দেখা হয়েছে • শুধুমাত্র আবিষ্কার (উত্তরাধিকার)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'উত্তরাধিকারী বেনামী উপস্থিতি — একটি আবদ্ধ সহকর্মীর জন্য অপেক্ষা করুন বা QR বিনিময় করুন';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE কাছাকাছি — 1:1 E2EE শুরু করতে QR স্ক্যান করুন';

  @override
  String get geoInternetDiscoverHint =>
      'এলাকা ইন্টারনেট আবিষ্কারের প্রয়োজন Nostr সংযুক্ত (সেটিংস → পরিবহন → ইন্টারনেট/অটো)';

  @override
  String get geoEmptyNoLocation =>
      'অবস্থান এখনও সমাধান করা হয়নি — GPS অনুমতি দিন এবং Nostr-এ আপনার জিওহ্যাশ প্রকাশ করতে রিফ্রেশ করুন';

  @override
  String get geoEmptyNeedsPermission =>
      'অবস্থানের অনুমতি অস্বীকৃত — সেটিংস → গোপনীয়তা → অবস্থানে ResilNet অনুমতি দিন';

  @override
  String get geoEmptyServicesDisabled =>
      'অবস্থান পরিষেবাগুলি বন্ধ রয়েছে — সেগুলিকে সেটিংসে চালু করুন৷';

  @override
  String get geoEmptyNoGpsFix =>
      'একটি GPS ফিক্স পাওয়া যায়নি (Wi‑Fi iPads-এ প্রচলিত) — নীচে ম্যানুয়ালি জিওহ্যাশ সেট করুন';

  @override
  String get geoEmptyTeleportHint =>
      'স্থান আইকনে আলতো চাপুন → একটি জিওহ্যাশ লিখুন (যেমন w5) → টেলিপোর্ট';

  @override
  String get geoSetGeohashManually => 'জিওহ্যাশ সেট করুন';

  @override
  String get geoTeleportHint =>
      'জিপিএস নেই? জিওহ্যাশ উপসর্গ লিখুন (2-7 অক্ষর, যেমন w5) এবং টেলিপোর্টে আলতো চাপুন';

  @override
  String get geoTeleportInvalid =>
      'অবৈধ জিওহ্যাশ — শুধুমাত্র বেস 32 অক্ষর/সংখ্যা ব্যবহার করুন (যেমন w5 বা w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'এলাকা $channel এ সেট করা হয়েছে';
  }

  @override
  String geoManualActive(String channel) {
    return 'ম্যানুয়াল এলাকা: $channel (GPS রিফ্রেশ ওভাররাইড করবে)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr প্রস্তুত নয় — পুনঃসংযোগে আলতো চাপুন (ইনটি সফল না হওয়া পর্যন্ত 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'ট্রান্সপোর্ট হল মেশ-শুধু — Nostr-এর বেশি সমবয়সীদের খুঁজে পেতে ইন্টারনেট বা অটোতে স্যুইচ করুন';

  @override
  String geoEmptyWaiting(String channel) {
    return 'এখনও $channel-এ কেউ নেই — উভয় ডিভাইসেই এলাকা + ইন্টারনেট খোলা রাখুন এবং ~60 সেকেন্ড অপেক্ষা করুন';
  }

  @override
  String get geoChannelFallback => '# এলাকা';

  @override
  String get geoRefreshLocation => 'অবস্থান রিফ্রেশ করুন';

  @override
  String get settingsClearLocationTitle => 'অবস্থান পরিষ্কার করুন';

  @override
  String get settingsClearLocationSubtitle =>
      'জিপিএস / টেলিপোর্ট জিওহ্যাশ সরান (এরিয়া #— হয়ে যায়)';

  @override
  String get settingsClearLocationConfirmTitle => 'অবস্থান পরিষ্কার করবেন?';

  @override
  String get settingsClearLocationConfirmBody =>
      'এই ডিভাইসে সঞ্চিত জিওহ্যাশ মুছে দেয়। আপনি পরে আবার GPS বা টেলিপোর্ট রিফ্রেশ করতে পারেন।';

  @override
  String get settingsClearLocationAction => 'অবস্থান পরিষ্কার করুন';

  @override
  String get settingsClearLocationSnack => 'অবস্থান সাফ করা হয়েছে';

  @override
  String get chatVoiceTooLarge => 'ভয়েস নোট খুব বড় — সর্বোচ্চ ~30 সেকেন্ড';

  @override
  String get chatVoiceNeedInternet =>
      'ভয়েস নোটের ইন্টারনেট প্রয়োজন (Nostr) — একা BLE এর জন্য অনেক বড়';

  @override
  String get chatVoiceSentInternet =>
      'ইন্টারনেটের মাধ্যমে ভয়েস নোট পাঠানো হয়েছে';

  @override
  String get noticeAnonMention => 'উল্লেখ';

  @override
  String get noticeAnonDm => 'সরাসরি বার্তা';

  @override
  String get noticeAnonHug => 'আলিঙ্গন';

  @override
  String get noticeAnonSlap => 'চড়';

  @override
  String get noticeAnonBlock => 'ব্লক';

  @override
  String get noticeAnonNeedKey =>
      'এখনও কোন পাবলিক কী — প্রথমে 1:1 এর জন্য QR বিনিময় করুন';

  @override
  String get noticeAnonActionSent => 'পাঠানো হয়েছে';

  @override
  String noticeAnonBlocked(String anon) {
    return 'ব্লক করা হয়েছে $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* আলিঙ্গন $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* চড় $anon *';
  }

  @override
  String get geoReconnectNostr => 'Nostr পুনরায় সংযোগ করুন';

  @override
  String get nostrSectionTitle => 'Nostr রিলে';

  @override
  String get nostrSectionSubtitle =>
      'ইন্টারনেট মেসেজিং এবং এলাকা আবিষ্কার এই রিলে ব্যবহার করে। স্ট্যাটাস অফলাইনে থাকলে পুনঃসংযোগে ট্যাপ করুন।';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'সংযুক্ত $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'অফলাইন — রিলে তালিকাভুক্ত কিন্তু কোনোটিই সংযুক্ত নেই';

  @override
  String get nostrStatusNotInit =>
      'শুরু হয়নি (0/0) — আরম্ভ করতে পুনরায় সংযোগ করুন আলতো চাপুন';

  @override
  String get nostrReconnectAction => 'Nostr পুনরায় সংযোগ করুন';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr সংযুক্ত ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'এখনও অফলাইন — Wi‑Fi/সেলুলার চেক করুন বা আবার চেষ্টা করুন';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ব্যর্থ হয়েছে: $error';
  }

  @override
  String get nostrReconnecting => 'রিলেতে সংযোগ করা হচ্ছে...';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel এ ইন্টারনেট (Nostr) • সিল করা চ্যাট প্রস্তুত';
  }

  @override
  String get transportModeTitle => 'এলাকা পরিবহন';

  @override
  String get transportModeSubtitle =>
      'মেশ = BLE কাছাকাছি (রেডিও) যখন নেই Nostr · ইন্টারনেট এবং অটো = Nostr লোকের তালিকা';

  @override
  String get transportModeMesh => 'জাল';

  @override
  String get transportModeInternet => 'ইন্টারনেট';

  @override
  String get transportModeAuto => 'অটো';

  @override
  String get geoPublicHint => 'এই এলাকায় অনলাইনে সবার কাছে পাবলিক বার্তা';

  @override
  String get geoPublicSend => 'পাবলিক';

  @override
  String geoPublicHelp(int count) {
    return '$count অনলাইন সমবয়সীদের কাছে সিল করা ফ্যান-আউট — প্রত্যেকে একটি ব্যক্তিগত খাম পায়';
  }

  @override
  String geoPublicSent(int count) {
    return 'এই এলাকায় $count সমবয়সীদের কাছে পাঠানো হয়েছে';
  }

  @override
  String get geoPublicSentNone =>
      'অনলাইনে কোনো মেসেজযোগ্য সহকর্মী নেই — চাবি আছে এমন সমবয়সীদের দিয়ে এলাকা/মেশ খুলুন, অথবা BLE/Nostr-এর জন্য অপেক্ষা করুন';

  @override
  String get areaPublicBadge => 'এলাকা পাবলিক';

  @override
  String get geoErrorPermission =>
      'অবস্থান পড়া যায়নি — অবস্থান অনুমতি পরীক্ষা করুন';

  @override
  String get geoPrecisionRegion => 'অঞ্চল';

  @override
  String get geoPrecisionProvince => 'প্রদেশ';

  @override
  String get geoPrecisionCity => 'শহর';

  @override
  String get geoPrecisionNeighborhood => 'পাড়া';

  @override
  String get geoPrecisionBlock => 'ব্লক';

  @override
  String get aliasTitle => 'ডাকনাম সেট করুন (পরিচিতি উপনাম)';

  @override
  String get aliasHintBody =>
      'এই উপনাম শুধুমাত্র এই ডিভাইসে সংরক্ষণ করা হয় (শুধুমাত্র স্থানীয়)\nএটি কখনই E2EE ট্রাফিকের সাথে পাঠানো হয় না';

  @override
  String get aliasLabel => 'ডাকনাম';

  @override
  String get aliasHint => 'যেমন \"গ্রাম প্রধান\", \"প\'সোমচাই\"...';

  @override
  String get settingsDevices => 'ডিভাইস';

  @override
  String get settingsFirmwareTitle => 'ESP32 ফার্মওয়্যার ডাউনলোড/আপডেট করুন';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin ফাইল ডাউনলোড করুন এবং OTA এর মাধ্যমে ESP32 বোর্ড আপডেট করুন';

  @override
  String get mtBridgeTitle => 'Meshtastic সেতু';

  @override
  String get mtBridgeSettingsSubtitle =>
      'শুধুমাত্র পাঠ্য A/B সেতু — ResilNet E2EE নয়';

  @override
  String get mtBridgeIntro =>
      'Meshtastic এবং ResilNet এর মধ্যে ছোট প্লেইনটেক্সট সরান। মোড A এবং B একই সময়ে চলতে পারে না। এটি এন্ড-টু-এন্ড এনক্রিপশন নয়।';

  @override
  String get mtBridgeModeLabel => 'মোড';

  @override
  String get mtBridgeModeOff => 'বন্ধ';

  @override
  String get mtBridgeModeA => 'ইনজেস্ট এ';

  @override
  String get mtBridgeModeB => 'প্রস্থান বি';

  @override
  String get mtBridgeModeOffShort => 'বন্ধ';

  @override
  String get mtBridgeModeAShort => 'এ';

  @override
  String get mtBridgeModeBShort => 'আউট বি';

  @override
  String get mtBridgeMutexHint =>
      'একটি মোড নির্বাচন করা অন্যটিকে স্বয়ংক্রিয়ভাবে বন্ধ করে দেয়। যুগপত A+B সমর্থিত নয়।';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ডেমো (লগিং)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ইনবাউন্ড টেক্সট নোটিশের অধীনে #meshtastic হিসাবে উপস্থিত হয়। মেশ রিলে ঐচ্ছিক (ডিফল্টরূপে বন্ধ)।';

  @override
  String get mtBridgeRelayTitle => 'এছাড়াও ResilNet জাল রিলে';

  @override
  String get mtBridgeRelayHint =>
      'চালু হলে, স্বাক্ষরিত পাবলিক বুলেটিন সম্প্রচার করা হয়। বন্ধ = শুধুমাত্র এই ফোনের নোটিশ।';

  @override
  String get mtBridgeSimulateHint => 'ডেমো বার্তা';

  @override
  String get mtBridgeSimulate => 'Meshtastic বার্তা অনুকরণ করুন';

  @override
  String get mtBridgeIngestOk => 'নোটিশে প্রবেশ করানো হয়েছে (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'সতর্কতা: এখানে পাঠানো বার্তাগুলি ResilNet E2EE নয়। Meshtastic পথে যে কেউ সেগুলি পড়তে পারে৷';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'প্রকাশ করার জন্য পাঠ্য';

  @override
  String get mtBridgeSend => 'Meshtastic এ পাঠান';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic এর জন্য সারিবদ্ধ (লগ / ইতিহাস দেখুন)';

  @override
  String get mtBridgeLastEgress => 'শেষ প্রস্থান';

  @override
  String get mtBridgeEgressHistory => 'সাম্প্রতিক প্রস্থান';

  @override
  String get mtBridgeOffHint =>
      'ব্রিজ ব্যবহার করতে Ingest (A) বা Egress (B) চালু করুন।';

  @override
  String get mtBridgeNoticeBadge => 'মেশটাস্টিক · E2EE নয়';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT পরিবহন ব্যবহার করুন';

  @override
  String get mtBridgeUseMqttHint =>
      'বন্ধ = শুধুমাত্র ডেমো লগিং (MQTT ইনবাউন্ড উপেক্ষা করা হয়েছে)। অন ​​= MQTT ইনজেস্ট/প্রস্থানের জন্য যখন সংযুক্ত থাকে।';

  @override
  String get mtBridgeMqttHost => 'দালাল হোস্ট';

  @override
  String get mtBridgeMqttPort => 'বন্দর';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) ব্যবহার করুন';

  @override
  String get mtBridgeMqttTlsHint =>
      'সাধারণ পোর্ট 8883. সিস্টেম সার্টিফিকেট ব্যবহার করে; হ্যান্ডশেক ত্রুটির উপর নরম ব্যর্থ হয়.';

  @override
  String get mtBridgeMqttAutoReconnect => 'স্বতঃ-পুনঃসংযোগ';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'চালু হলে, ক্লায়েন্ট ড্রপের পরে পুনরায় সংযোগ করার চেষ্টা করে। পুনরুদ্ধার না হওয়া পর্যন্ত স্থিতি সংযোগ দেখায়।';

  @override
  String get mtBridgeMqttTopicHelpers => 'বিষয় সহায়ক';

  @override
  String get mtBridgeMqttRegion => 'অঞ্চল উপসর্গ (ঐচ্ছিক)';

  @override
  String get mtBridgeMqttRegionHint =>
      'সেট করা হলে, msh/<region>/2/json হিসেবে রিবিল্ড রুট প্রয়োগ করুন (বিষয় রুট ওভাররাইড করে)।';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON বিষয়ের মূল';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ডাউনলিংক চ্যানেলের নাম';

  @override
  String get mtBridgeMqttApplyTopics =>
      'রুট → সাবস্ক্রাইব/প্রকাশিত বিষয় প্রয়োগ করুন';

  @override
  String get mtBridgeMqttAdvanced => 'উন্নত MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, পুনরায় সংযোগ করুন, বিষয়, শংসাপত্র';

  @override
  String get mtBridgeMqttTopicIn => 'বিষয় সদস্যতা';

  @override
  String get mtBridgeMqttTopicOut => 'বিষয় প্রকাশ করুন';

  @override
  String get mtBridgeMqttGatewayFrom => 'গেটওয়ে নোড আইডি (থেকে)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'ডেসিমাল আইডি বা !হেক্স — সেন্ডটেক্সট ডাউনলিংকের জন্য প্রয়োজন';

  @override
  String get mtBridgeMqttChannelIndex => 'মেশ চ্যানেল সূচক (ঐচ্ছিক 0-7)';

  @override
  String get mtBridgeMqttUser => 'ব্যবহারকারীর নাম (ঐচ্ছিক)';

  @override
  String get mtBridgeMqttPass => 'পাসওয়ার্ড (ঐচ্ছিক)';

  @override
  String get mtBridgeMqttPassStored =>
      'এই ডিভাইসে একটি পাসওয়ার্ড সংরক্ষিত আছে (দেখানো হয়নি)।';

  @override
  String get mtBridgeMqttPassReplace =>
      'নতুন পাসওয়ার্ড (রাখতে ফাঁকা ছেড়ে দিন)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'সংরক্ষিত পাসওয়ার্ড রাখতে খালি ছেড়ে দিন।';

  @override
  String get mtBridgeMqttPassClear => 'পাসওয়ার্ড সাফ করুন';

  @override
  String get mtBridgeMqttSave => 'MQTT সেটিংস সংরক্ষণ করুন';

  @override
  String get mtBridgeMqttSaved => 'MQTT সেটিংস সংরক্ষিত';

  @override
  String get mtBridgeMqttConnect => 'সংযোগ করুন';

  @override
  String get mtBridgeMqttDisconnect => 'সংযোগ বিচ্ছিন্ন করুন';

  @override
  String get mtBridgeMqttConnected => 'MQTT সংযুক্ত';

  @override
  String get mtBridgeMqttConnecting => 'MQTT সংযোগ করা হচ্ছে...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT সংযোগ বিচ্ছিন্ন';

  @override
  String get mtBridgeMqttError => 'MQTT ত্রুটি';

  @override
  String get mtBridgeErrModeIngest => 'প্রথমে ইনজেস্ট (A) এ স্যুইচ করুন';

  @override
  String get mtBridgeErrModeEgress => 'প্রথমে Egress (B) এ স্যুইচ করুন';

  @override
  String get mtBridgeErrRate => 'মন্থর করুন — হার সীমিত';

  @override
  String get mtBridgeErrDedupe => 'ডুপ্লিকেট বার্তা উপেক্ষা করা হয়েছে';

  @override
  String get mtBridgeErrLoop => 'একটি সেতু লুপ প্রতিরোধ ড্রপ';

  @override
  String get mtBridgeErrEmpty => 'বার্তা খালি';

  @override
  String get mtBridgeErrPublish => 'প্রকাশ করা ব্যর্থ হয়েছে৷';

  @override
  String get mtBridgeErrNotConnected => 'MQTT সংযুক্ত নয়';

  @override
  String get mtBridgeErrMissingHost => 'MQTT ব্রোকার হোস্ট লিখুন';

  @override
  String get mtBridgeErrMissingTopic => 'সদস্যতা লিখুন এবং বিষয় প্রকাশ করুন';

  @override
  String get mtBridgeErrMissingFromNode =>
      'সেন্ডটেক্সটের জন্য গেটওয়ে নোড আইডি (থেকে) লিখুন';

  @override
  String get mtBridgeErrConnect => 'MQTT সংযোগ ব্যর্থ হয়েছে৷';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS সংযোগ ব্যর্থ হয়েছে৷';

  @override
  String get settingsData => 'ডেটা';

  @override
  String get settingsDataHint =>
      'ডাটাবেস সঙ্কুচিত করতে স্থানীয় বার্তাগুলি মুছুন — পরিচয়, কী এবং সহকর্মী রাখা হয়';

  @override
  String get settingsSaveHistoryTitle => 'বার্তা ইতিহাস সংরক্ষণ করুন';

  @override
  String get settingsSaveHistorySubtitle =>
      'বন্ধ থাকাকালীন, বার্তাগুলি তারের উপর E2EE থাকে এবং শুধুমাত্র এই সেশনের জন্য রাখা হয় (স্থানীয় চ্যাট ইতিহাসে নয়)। আপনার নিজের টেক্সট এখনও এই ডিভাইসে প্লেইন টেক্সট হিসাবে দেখায়।';

  @override
  String get settingsPrivacy => 'গোপনীয়তা';

  @override
  String get settingsE2eeTitle => 'এন্ড-টু-এন্ড এনক্রিপশন';

  @override
  String get settingsE2eeSubtitle =>
      'সর্বদা চালু — বার্তা পাঠানোর আগে RSA-OAEP + AES-GCM দিয়ে সিল করা হয়। রিলে এবং আশেপাশের হপগুলি বিষয়বস্তু পড়তে পারে না।';

  @override
  String get settingsScreenshotTitle => 'স্ক্রিনশট সতর্কতা';

  @override
  String get settingsScreenshotSubtitle =>
      'যখন এই ডিভাইসটি স্ক্রীন ক্যাপচার করে তখন চ্যাটে একটি সিস্টেম লাইন দেখান৷';

  @override
  String get settingsNostrExpiryTitle => 'Nostr মেসেজ সময় রাখুন';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr এর মাধ্যমে অনলাইনে থাকাকালীন কতক্ষণ সিল করা খামগুলি স্থানীয়ভাবে থাকা উচিত';

  @override
  String get noticeExpiresIn => 'মেয়াদ শেষ হয়';

  @override
  String get noticesTitle => 'নোটিশ';

  @override
  String get noticesMeshIntro =>
      'পাবলিক বুলেটিন — রেডিও পরিসরে প্রত্যেকের কাছে দৃশ্যমান, এনক্রিপ্ট করা নয়। এটি ফোন-টু-ফোন অফলাইনে হপ করে, এবং কাছাকাছি ResilNet রিলে বাক্সে একটি অনুলিপি থাকে যাতে যারা পরে আসে তারা এখনও এটি দেখতে পায়।';

  @override
  String get noticesMeshPublicBadge => 'পাবলিক · এনক্রিপ্ট করা নেই';

  @override
  String get noticesGeoIntro =>
      'এই জায়গার জন্য ছোট নোট যোগ করুন যাতে অন্য দর্শকরা সেগুলি খুঁজে পেতে পারে।';

  @override
  String get noticesEmpty => 'এখনও কোন নোটিশ';

  @override
  String get noticesEmptyHint =>
      'এখানে আশেপাশের লোকেদের জন্য প্রথম বিজ্ঞপ্তি পিন করুন।';

  @override
  String get noticesComposeHint => 'একটি বিজ্ঞপ্তি পোস্ট করুন...';

  @override
  String get noticesUrgent => 'জরুরী';

  @override
  String get noticesOpen => 'নোটিশ';

  @override
  String get screenshotTaken => '* আপনি একটি স্ক্রিনশট নিয়েছেন *';

  @override
  String get chatAttachImage => 'ছবি সংযুক্ত করুন';

  @override
  String get chatImageLabel => 'ছবি';

  @override
  String get chatImageTooLarge => 'ছবি অনেক বড় — অন্য ফটো চেষ্টা করুন';

  @override
  String get chatNostrExpiry => 'Nostr রাখুন';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel-এ পাঠান — সর্বজনীন';
  }

  @override
  String get settingsClearTitle => 'সমস্ত বার্তা সাফ করুন';

  @override
  String get settingsClearSubtitle => 'এই ডিভাইসে সমস্ত চ্যাট মুছুন';

  @override
  String get settingsClearConfirmTitle => 'সব বার্তা সাফ করবেন?';

  @override
  String get settingsClearConfirmBody =>
      'এটি এই ডিভাইসের সমস্ত চ্যাট বার্তা মুছে দেয়৷\nসহকর্মী এবং ডাকনাম মুছে ফেলা হয় না.';

  @override
  String get settingsClearAction => 'ডেটা সাফ করুন';

  @override
  String get settingsClearedSnack => 'ডেটা সাফ করা হয়েছে';

  @override
  String settingsVersion(String version) {
    return 'সংস্করণ $version';
  }

  @override
  String get meshBleScanning => 'BLE: নোডের জন্য স্ক্যান করা হচ্ছে';

  @override
  String get meshBleEsp32Scanning => 'ESP32: কাছাকাছি একটি নোড খুঁজছেন';

  @override
  String get meshBleSyncing => 'BLE: ESP32 এর সাথে সিঙ্ক করা হচ্ছে';

  @override
  String get meshNostrPublishing => 'Nostr: প্রকাশনা';

  @override
  String get meshBleIdle => 'BLE মেশ চালু — এখনও কাছাকাছি কোনো ফোন নেই';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE জাল — $count ফোন(গুলি) কাছাকাছি';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: অনুমতি প্রয়োজন';

  @override
  String get meshBlePausedCamera =>
      'ক্যামেরার জন্য BLE পজ করা হয়েছে — শুরু করুন BLE এ আলতো চাপুন';

  @override
  String get meshBleStopped =>
      'BLE বন্ধ আছে — ব্লুটুথ চালু আছে কিনা দেখুন, তারপর শুরু করুন BLE এ আলতো চাপুন';

  @override
  String get meshBleRestart => 'BLE শুরু করুন';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'অনুমতি পরীক্ষা করুন এবং BLE শুরু করুন';

  @override
  String get meshNostrOffline => 'Nostr অফলাইন';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count কাছাকাছি সমবয়সীদের • LoRa $lora • সিঙ্ক ~${meters}m';
  }

  @override
  String get meshLoraReady => 'প্রস্তুত';

  @override
  String get meshLoraNotReady => 'প্রস্তুত না';

  @override
  String meshGatewayProgress(String label) {
    return 'গেটওয়ে UDP: $label';
  }

  @override
  String get meshGatewayReady => 'গেটওয়ে UDP: প্রস্তুত';

  @override
  String get permissionTitle =>
      'BLE মেশ নেটওয়ার্ক শুরু করতে অ্যাক্সেসের অনুমতি দিন';

  @override
  String get permissionBody =>
      'অ্যাপটির কমিউনিটি মেসেজিংয়ের জন্য ব্লুটুথ (স্ক্যান/সংযোগ/বিজ্ঞাপন), অবস্থান (পুরনো অ্যান্ড্রয়েড ডিভাইসের জন্য), এবং মাইক্রোফোন (চ্যাট এবং ঘোষণায় ভয়েস নোটের জন্য) প্রয়োজন।';

  @override
  String get permissionE2ee =>
      'এন্ড-টু-এন্ড এনক্রিপশন (E2EE)\nরিলে নোড বার্তা বিষয়বস্তু পড়তে পারে না';

  @override
  String get permissionReady => 'অনুমতি প্রস্তুত';

  @override
  String get permissionRequest => 'অনুমতি দিন এবং চালিয়ে যান';

  @override
  String get permissionNotReadySnack =>
      'সিস্টেম এখনও প্রস্তুত নয় — কিছুক্ষণ অপেক্ষা করুন এবং আবার চেষ্টা করুন';

  @override
  String get permissionDeniedSnack =>
      'অনুমতিগুলি অসম্পূর্ণ — সেটিংস > ResilNet খুলুন এবং ব্লুটুথ / অবস্থান / মাইক্রোফোনের অনুমতি দিন';

  @override
  String get permissionMicDenied =>
      'মাইক্রোফোন অ্যাক্সেস অস্বীকৃত — ভয়েস নোট রেকর্ড করতে সেটিংসে অনুমতি দিন';

  @override
  String get permissionMicOpenSettings => 'সেটিংস';

  @override
  String get permissionCameraDenied =>
      'ক্যামেরা অ্যাক্সেস অস্বীকৃত — সেটিংসে গিয়ে QR কোড স্ক্যান করার অনুমতি দিন';

  @override
  String get permissionCameraFailed =>
      'QR কোড স্ক্যান করার জন্য ক্যামেরার অনুমতি প্রয়োজন';

  @override
  String get permissionCameraOpenSettings => 'সেটিংস';

  @override
  String get permissionPhotosDenied =>
      'ফটো লাইব্রেরি অ্যাক্সেস অস্বীকৃত — আপনার QR কোড সংরক্ষণ করতে সেটিংসে অনুমতি দিন';

  @override
  String get permissionPhotosFailed =>
      'আপনার QR কোড সংরক্ষণ করতে ফটো লাইব্রেরির অনুমতি প্রয়োজন৷';

  @override
  String get permissionPhotosOpenSettings => 'সেটিংস';

  @override
  String permissionFailedSnack(String error) {
    return 'অনুমতির অনুরোধ ব্যর্থ হয়েছে: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet আর্কিটেকচার • স্টোর-এন্ড-ফরওয়ার্ড মাল্টি-হপ';

  @override
  String get onboardingSkip => 'এড়িয়ে যান';

  @override
  String get onboardingNext => 'পরবর্তী';

  @override
  String get onboardingStart => 'শুরু করুন';

  @override
  String get onboardingWelcomeTitle => 'ResilNet-এ স্বাগতম';

  @override
  String get onboardingWelcomeBody =>
      'একটি মেশ নেটওয়ার্কের মাধ্যমে ResilNet-এ চ্যাট করুন — এমনকি ইন্টারনেট ছাড়াই';

  @override
  String get onboardingFriendsTitle => 'সহজেই বন্ধুদের যোগ করুন';

  @override
  String get onboardingFriendsBody =>
      'আইডেন্টিটি থেকে একটি QR শেয়ার করুন বা সর্বজনীন কী বিনিময় করতে বন্ধুর QR স্ক্যান করুন৷';

  @override
  String get onboardingChannelsTitle =>
      'এনক্রিপ্ট করা চ্যাট + কাছাকাছি চ্যানেল';

  @override
  String get onboardingChannelsBody =>
      'কাছাকাছি সমবয়সীদের খুঁজে পেতে #mesh / এলাকা (জিওহ্যাশ) পাল্টান — বার্তাগুলি BLE মেশ এবং Nostr থেকে E2EE থাকে';

  @override
  String get chatTitle => 'চ্যাট (E2EE)';

  @override
  String get chatScanTooltip => 'পিয়ার যোগ করতে QR স্ক্যান করুন';

  @override
  String get chatBlockTooltip => 'এই প্রেরককে ব্লক করুন';

  @override
  String get chatBlockedSnack => 'অবরুদ্ধ: কোনও বিজ্ঞপ্তি নেই / কোনও রিলে নেই৷';

  @override
  String get chatAliasTooltip => 'ডাক নাম সেট করুন';

  @override
  String get chatReceiverPemLabel => 'প্রাপক সর্বজনীন কী (PEM)';

  @override
  String get chatReceiverPemHint =>
      'আপনার বন্ধুর পাবলিক কী পেস্ট করুন (QR / শেয়ার করা ফাইল থেকে)';

  @override
  String get chatNeedPeerKey =>
      'প্রথমে এই পিয়ারের QR স্ক্যান করুন (যাচাই করা পাবলিক কী প্রয়োজন)';

  @override
  String get chatPeerKeyMismatch =>
      'সংরক্ষিত সর্বজনীন কী এই পিয়ার আইডির সাথে মেলে না';

  @override
  String chatVoiceFailed(String error) {
    return 'অডিও রেকর্ড করা যায়নি: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'ভয়েস নোট প্লে করা যায়নি: $error';
  }

  @override
  String get chatPlayVoice => 'ভয়েস নোট চালান';

  @override
  String get chatPauseVoice => 'বিরতি';

  @override
  String get chatVoiceLabelSent => '🎤 ভয়েস নোট (সিল করা)';

  @override
  String get chatVoiceLabel => '🎤 ভয়েস নোট';

  @override
  String get chatDecryptFailed => '[ডিক্রিপশন ব্যর্থ হয়েছে]';

  @override
  String chatSentSealed(String preview) {
    return '[সিল করা • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[সিল করা]';

  @override
  String get chatComposeHint =>
      'একটি বার্তা টাইপ করুন... (পাঠাতে সিল করা হয়েছে)';

  @override
  String get chatEmptyThread =>
      'এখনও কোন বার্তা নেই\nজাল পাঠাতে নীচে টাইপ করুন';

  @override
  String chatLoadFailed(String error) {
    return 'কথোপকথন লোড করা যায়নি: $error';
  }

  @override
  String get chatEmojiTooltip => 'ইমোজি';

  @override
  String get statusPending => 'মুলতুবি';

  @override
  String get statusSent => 'পাঠানো হয়েছে';

  @override
  String get statusRelayed => 'রিলেড';

  @override
  String get statusDelivered => 'বিতরণ করা হয়েছে';

  @override
  String get statusRead => 'পড়ুন';

  @override
  String get statusFailed => 'ব্যর্থ হয়েছে';

  @override
  String get chatCopy => 'কপি';

  @override
  String get chatDeleteLocal => 'এই ডিভাইসে মুছুন';

  @override
  String get chatDeletedLocalSnack => 'এই ডিভাইসে মুছে ফেলা হয়েছে';

  @override
  String get chatRetry => 'আবার চেষ্টা করুন';

  @override
  String get chatSendFailed => 'বিতরণ করা হয়নি — আবার চেষ্টা করুন আলতো চাপুন';

  @override
  String get chatImageNeedInternet => 'ছবি পাঠাতে ইন্টারনেটে সংযোগ করুন';

  @override
  String get chatImageTooLargeOnline =>
      'পাঠানোর জন্য যথেষ্ট ইমেজ সংকুচিত করা যায়নি';

  @override
  String get chatOpenLinkFailed => 'লিঙ্ক খুলতে পারেনি';

  @override
  String get identityTitle => 'পরিচয়';

  @override
  String get identityScanTooltip => 'ক্যামেরা দিয়ে QR স্ক্যান করুন';

  @override
  String get identityCopiedHash => 'পাবলিক কী হ্যাশ কপি করা হয়েছে';

  @override
  String get identityPeerSaved => 'পিয়ার QR থেকে সংরক্ষিত';

  @override
  String get identityGalleryDenied =>
      'ফটো লাইব্রেরির অনুমতি অস্বীকার করা হয়েছে৷';

  @override
  String get identityQrSaved => 'QR ফটো লাইব্রেরিতে সংরক্ষিত';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR সংরক্ষণ করা যায়নি: $error';
  }

  @override
  String get peersTitle => 'নেটওয়ার্ক সদস্য';

  @override
  String get qrScanTitle => 'একটি বন্ধু যোগ করতে QR স্ক্যান করুন';

  @override
  String get qrInvalid => 'স্ক্যান ব্যর্থ হয়েছে: অবৈধ QR৷';

  @override
  String get qrIdKeyMismatch => 'QR প্রত্যাখ্যান: আইডি পাবলিক কী মেলে না';

  @override
  String get qrCameraNotReady => 'ক্যামেরা প্রস্তুত নয়';

  @override
  String get qrRetrySettings => 'আবার চেষ্টা করুন / সেটিংস খুলুন';

  @override
  String qrCameraOpenFailed(String error) {
    return 'ক্যামেরা খোলা যায়নি: $error';
  }

  @override
  String get qrScanAlignHint => 'ফ্রেমের ভিতরে QR কোডটি সারিবদ্ধ করুন';

  @override
  String get firmwareDownloadTitle => 'ESP32 ফার্মওয়্যার ডাউনলোড করুন';

  @override
  String get firmwareSourceOnline => 'সর্বশেষ (অনলাইন)';

  @override
  String get firmwareSourceCached => 'সংরক্ষিত অনুলিপি (অফলাইন)';

  @override
  String get firmwareSourceBaseline => 'বান্ডেল করা বেসলাইন (অফলাইন)';

  @override
  String get firmwareSourceUnavailable => 'কোন ফার্মওয়্যার উপলব্ধ নেই';

  @override
  String get firmwareBaselineIncompatible =>
      'বান্ডেল করা ফার্মওয়্যার অনেক পুরানো — একটি নতুন সংস্করণ ডাউনলোড করতে ইন্টারনেটের সাথে সংযোগ করুন৷';

  @override
  String get firmwareChecksumFailed =>
      'ফার্মওয়্যার অখণ্ডতা পরীক্ষা ব্যর্থ হয়েছে — ফ্ল্যাশিং ব্লক করা হয়েছে৷';

  @override
  String firmwareReadyFromSource(String source) {
    return 'ফার্মওয়্যার প্রস্তুত: $source';
  }

  @override
  String get peersRefreshTooltip => 'রিফ্রেশ';

  @override
  String get peersBlocked => 'অবরুদ্ধ';

  @override
  String peersNearbyBle(Object ble) {
    return 'কাছাকাছি (BLE)';
  }

  @override
  String get peersRecentlyOnline => 'সম্প্রতি অনলাইন';

  @override
  String get peersOnlineInArea => 'এলাকায় অনলাইন';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes মিনিট আগে দেখা হয়েছে';
  }

  @override
  String get peersOffline => 'অফলাইন';

  @override
  String peersBlockedSnack(String id) {
    return 'ব্লক করা হয়েছে $id';
  }

  @override
  String get peersUnblockedSnack => 'আনব্লক করা হয়েছে';

  @override
  String get peersEmpty =>
      'ডাটাবেসে এখনো কোনো সদস্য নেই\nএকটি QR স্ক্যান করুন বা BLE মেশ আবিষ্কারের জন্য অপেক্ষা করুন';

  @override
  String get peersOpenChat => 'খোলা চ্যাট';

  @override
  String get peersBlockAction => 'ব্লক';

  @override
  String get peersUnblockAction => 'আনব্লক করুন';

  @override
  String get channelPickerTooltip => 'চ্যাট / #mesh / এলাকা';

  @override
  String get locationPickerTooltip => 'অবস্থান চ্যানেল';

  @override
  String get transportPickerTooltip => 'মেশ/ইন্টারনেট/অটো';

  @override
  String get onlinePeopleTooltip => 'মানুষ অনলাইন';

  @override
  String get unreadDirectsTooltipEmpty => 'ব্যক্তিগত বার্তা';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count অপঠিত ব্যক্তিগত বার্তা';
  }

  @override
  String get onlinePeopleTitle => 'মানুষ';

  @override
  String get onlinePeopleEmpty => 'এখানে এখনো কেউ অনলাইন নেই';

  @override
  String onlinePeopleCount(int count) {
    return '$count অনলাইন';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · কাছাকাছি + এলাকা';

  @override
  String get peerOnlineMeshTitle => 'জাল উপর কাছাকাছি কেউ';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name জালের কাছাকাছি আছে';
  }

  @override
  String get peerOnlineAreaTitle => 'এলাকায় কেউ অনলাইন';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr এর মাধ্যমে অনলাইন';
  }

  @override
  String get locationSheetTitle => '#অবস্থান চ্যানেল';

  @override
  String get channelPinsTitle => 'পিন করা হয়েছে';

  @override
  String get channelPinsHint =>
      'আপনি প্রায়শই ব্যবহার করেন এমন চ্যানেলগুলি পিন করুন — তারা শীর্ষে থাকে';

  @override
  String get channelPinTooltip => 'এই চ্যানেলটি পিন করুন';

  @override
  String get channelUnpinTooltip => 'আনপিন করুন';

  @override
  String get locationSheetIntro =>
      'মোটা জিওহ্যাশ ব্যবহার করে কাছাকাছি লোকেদের সাথে চ্যাট করুন — সুনির্দিষ্ট GPS নয়। ইন্টারনেটে উপস্থিতি বেনামী Nostr কী ব্যবহার করে।';

  @override
  String get locationMeshSubtitle => '#ব্লুটুথ • ~10-50 মি';

  @override
  String get locationTeleportHint => '#জিওহাশ';

  @override
  String get locationTeleport => 'টেলিপোর্ট';

  @override
  String homeComposeHint(String channel) {
    return 'বার্তা $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel-এ পাঠান — সর্বজনীন';
  }

  @override
  String get messageExpiryTitle => 'মেয়াদ শেষ হয়';

  @override
  String get voiceRecordTapToStart => 'ভয়েস বার্তা রেকর্ড করতে আলতো চাপুন';

  @override
  String get voiceRecordTooShort => 'রেকর্ডিং খুব ছোট — আবার চেষ্টা করুন';

  @override
  String get voiceRecordFailed =>
      'রেকর্ডিং সংরক্ষণ করা যায়নি — আবার চেষ্টা করুন';

  @override
  String get voicePttHold => 'রেকর্ড করতে ধরে রাখুন';

  @override
  String get voicePttRelease => 'প্রিভিউ করতে রিলিজ করুন';

  @override
  String get voicePttRecording => 'রেকর্ডিং...';

  @override
  String get voicePttDraftReady => 'ভয়েস নোট প্রস্তুত';

  @override
  String get voicePttDiscard => 'বাতিল করুন';

  @override
  String get voicePttReRecord => 'আবার রেকর্ড করুন';

  @override
  String get voicePttSend => 'ভয়েস নোট পাঠান';

  @override
  String get voicePttPlayPreview => 'প্রিভিউ খেলুন';

  @override
  String get voicePttStopPreview => 'প্রিভিউ বন্ধ করুন';

  @override
  String get noticesBackfilling => 'বিজ্ঞপ্তি লোড হচ্ছে...';

  @override
  String get noticesNostrOnline => 'Nostr অনলাইন';

  @override
  String get noticesNostrOffline => 'Nostr অফলাইন — বুলেটিন ইন্টারনেট প্রয়োজন';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count নোটিশ লোড করা হয়েছে';
  }

  @override
  String get noticePublishFailed =>
      'এরিয়া বোর্ডে বিজ্ঞপ্তি প্রকাশ করতে পারেনি। Nostr সংযোগ পরীক্ষা করুন।';

  @override
  String get noticeMeshPublishNoLink =>
      'স্থানীয়ভাবে সংরক্ষণ করা হয়েছে। কাছাকাছি একটি মেশ রেডিও (বা Wi‑Fi গেটওয়ে) এর সাথে সংযোগ করুন যাতে অন্যরা এটি গ্রহণ করতে পারে৷';

  @override
  String noticeMeshPublishSent(int count) {
    return 'বুলেটিন $count কাছের ডিভাইসে BLE-এ পাঠানো হয়েছে।';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'কাছাকাছি রেডিও দেখা গেছে, কিন্তু BLE লিখতে ব্যর্থ হয়েছে। নোটিশ স্ক্রিনে উভয় অ্যাপ খোলা রাখুন এবং আবার চেষ্টা করুন (বা একটি ESP32 রিলে ব্যবহার করুন)।';

  @override
  String get noticeMeshPublishNoGatt =>
      'এই ডিভাইসের BLE রিসিভার প্রস্তুত নয়। ব্লুটুথ টগল করুন এবং বিজ্ঞপ্তিগুলি পুনরায় খুলুন।';

  @override
  String get noticeDelete => 'নোটিশ মুছুন';

  @override
  String get noticeDeleteConfirmTitle => 'এই বিজ্ঞপ্তি মুছে ফেলবেন?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'এটি শুধুমাত্র এই ডিভাইসে এটি সরিয়ে দেয়। অন্য যারা ইতিমধ্যে এটি পেয়েছেন তারা এখনও এটি দেখতে পাবেন।';

  @override
  String get noticeDeleted => 'নোটিশ মুছে ফেলা হয়েছে';

  @override
  String get chatNoticeHidden => 'এলাকার নোটিশ — খোলা নোটিশ';

  @override
  String get identityDisplayNameTitle => 'প্রদর্শনের নাম';

  @override
  String get identitySaveName => 'নাম সংরক্ষণ করুন';

  @override
  String get identityUserIdLabel => 'ইউজার আইডি (পাবলিক কী হ্যাশ)';

  @override
  String get identityCopyHashTooltip => 'পাবলিক কী হ্যাশ কপি করুন';

  @override
  String get identityMyQrTitle => 'আমার QR (id + pubKey + নাম)';

  @override
  String identityQrFailed(String error) {
    return 'QR তৈরি করা যায়নি\n$error';
  }

  @override
  String get identitySaving => 'সংরক্ষণ করা হচ্ছে...';

  @override
  String get identitySaveQr => 'ফটো লাইব্রেরিতে QR সংরক্ষণ করুন';

  @override
  String get identityOpenScanner => 'QR স্ক্যান করতে ক্যামেরা খুলুন';

  @override
  String get identityQrHelp =>
      'আপনার সর্বজনীন কী সংরক্ষণ করতে একজন বন্ধুকে এটি স্ক্যান করুন এবং (যদি প্রয়োজন হয়) আপনাকে একটি যাচাইকৃত ইস্যুকারী হিসাবে সেট করুন';

  @override
  String get identityChatTip =>
      'পরামর্শ: E2EE এর জন্য একটি পাবলিক কী যোগ করতে আপনি চ্যাটে একটি QR স্ক্যান করতে পারেন';

  @override
  String get infoOpen => 'সম্পর্কে / তথ্য';

  @override
  String get docsGuideTitle => 'ব্যবহারকারীর নির্দেশিকা';

  @override
  String get docsGuideSubtitle => 'ব্রাউজারে খোলে';

  @override
  String get docsOpenAction => 'গাইড খুলুন';

  @override
  String get docsOpenFailed => 'ব্যবহারকারী গাইড খুলতে পারেনি';

  @override
  String get firmwareOtaGuideTitle => 'ফ্ল্যাশ গাইড এবং ওটিএ প্রোটোকল';

  @override
  String get firmwareOtaGuideSubtitle =>
      'ওয়েব গাইড খোলে — .bin ডাউনলোড এবং সম্পূর্ণ পদক্ষেপ';

  @override
  String get firmwareWebDownloadsTitle => 'ওয়েবে ফার্মওয়্যার ডাউনলোড';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'ডক্স সাইটে প্রতি-সংস্করণ লিঙ্ক এবং চেকসাম';

  @override
  String get inviteCopyShortLink => 'সংক্ষিপ্ত লিঙ্ক কপি করুন';

  @override
  String get inviteShareLink => 'লিঙ্ক শেয়ার করুন';

  @override
  String get inviteShowFullLink => 'সম্পূর্ণ লিঙ্ক';

  @override
  String get inviteCopyFullLink => 'সম্পূর্ণ লিঙ্ক কপি করুন';

  @override
  String get inviteLinkCopied => 'লিঙ্ক কপি করা হয়েছে';

  @override
  String get inviteLongPressHint => 'লিঙ্ক অ্যাকশনের জন্য দীর্ঘক্ষণ প্রেস করুন';

  @override
  String get inviteSendInChat => 'ResilNet চ্যাটে পাঠান...';

  @override
  String get inviteSendInChatHint =>
      'আপনার কাছে ইতিমধ্যেই একটি সর্বজনীন কী আছে শুধুমাত্র সেই ব্যক্তিদের৷';

  @override
  String get inviteSendInChatEmpty =>
      'এখনও কোন বার্তাযোগ্য চ্যাট.\nএকটি QR স্ক্যান করুন, এলাকা/মেশ খুলুন, বা অ্যাপের বাইরে লিঙ্কটি প্রথমে শেয়ার করুন।';

  @override
  String get inviteSentToChat => 'চ্যাটে আমন্ত্রণ পাঠানো হয়েছে';

  @override
  String get infoTabInfo => 'তথ্য';

  @override
  String get infoTabSettingsHint =>
      'ভাষা, E2EE এবং ডেটা টুলের জন্য মেনু থেকে সেটিংস খুলুন';

  @override
  String get infoHowToTitle => 'কিভাবে ব্যবহার করবেন';

  @override
  String get infoHowToBody =>
      '• চ্যাট / #মেশ / এলাকা পরিবর্তন করতে চ্যানেল আইকনে আলতো চাপুন৷\n• জিওহ্যাশ আকার বাছাই করার জন্য জায়গাটিতে আলতো চাপুন\n• সদস্যদের জন্য বা যারা অনলাইনে আছেন তাদের জন্য ট্যাপ করুন\n• ব্যক্তিগতভাবে কী বিনিময় করতে ⋮ থেকে আইডেন্টিটি/কিউআর খুলুন\n• এলাকা \"পাবলিক\" প্রতিটি অনলাইন পিয়ারকে সিল করা E2EE পাঠায় — প্লেইনটেক্সট রুম নয়';

  @override
  String get infoFeaturesTitle => 'বৈশিষ্ট্য';

  @override
  String get infoFeatureOffline => 'ব্লুটুথ লো এনার্জির মাধ্যমে অফলাইন মেসেজিং';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM সহ এন্ড-টু-এন্ড এনক্রিপশন (কোলাহল নয়)';

  @override
  String get infoFeatureMultihop =>
      'বার্তাগুলি কাছাকাছি সহকর্মীদের মাধ্যমে আরও দূরে যেতে পারে৷';

  @override
  String get infoFeatureBridge =>
      'হাইব্রিড জাল ↔ ইন্টারনেট (Nostr) সিল করা খামের জন্য';

  @override
  String get infoFeatureGeo =>
      'আশেপাশের লোকেদের জন্য স্থানীয় জিওহ্যাশ চ্যানেল (আবিষ্কার ইউএক্স)';

  @override
  String get infoFeatureNotices =>
      '#মেশ এবং এলাকার জন্য মেয়াদ শেষ হওয়ার বিজ্ঞপ্তি';

  @override
  String get infoPrivacyTitle => 'গোপনীয়তা';

  @override
  String get infoPrivacyNoRoom =>
      'তারে কোন প্লেইনটেক্সট গ্রাম/পাবলিক চ্যাট রুম নেই';

  @override
  String get infoPrivacyFanout =>
      'এলাকা পাঠানো = 1:1 পরিচিত পাবলিক কী সহ সমবয়সীদের কাছে ফ্যান-আউট সিল করা';

  @override
  String get infoPrivacyPresence =>
      'ইন্টারনেট এলাকায় উপস্থিতি ক্ষণস্থায়ী Nostr কী ব্যবহার করে';

  @override
  String get infoSymbolsTitle => 'প্রতীক';

  @override
  String get infoSymBle => 'সরাসরি ব্লুটুথ লিঙ্ক';

  @override
  String get infoSymMesh => 'জালের মাধ্যমে পৌঁছানো যায় (অন্যরা এগিয়ে)';

  @override
  String get infoSymInternet => 'ইন্টারনেটের মাধ্যমে (Nostr) — সিল করা খাম';

  @override
  String get infoSymBridge => 'মেশ↔ইন্টারনেট সেতু পথের মাধ্যমে পৌঁছেছি';

  @override
  String get infoSymOffline => 'অফলাইন — এই মুহূর্তে পৌঁছানো যাচ্ছে না';

  @override
  String get infoSymInArea => 'এই অবস্থান চ্যানেল এর এলাকায়';

  @override
  String get infoSymE2eeOk => 'এন্ড-টু-এন্ড এনক্রিপ্ট করা সেশন';

  @override
  String get infoSymE2eeFail =>
      'এনক্রিপশন অনুপলব্ধ — সংবেদনশীল পাঠ্য পাঠাবেন না';

  @override
  String get infoSymVerified => 'পরিচয় যাচাইকৃত/পরিচিত কী';

  @override
  String get infoSymBlocked => 'অবরুদ্ধ';

  @override
  String get infoSymUnread => 'অপঠিত ব্যক্তিগত বার্তা';

  @override
  String get infoEmergencyTitle => 'জরুরী মোড';

  @override
  String get infoEmergencyBody =>
      'এই ডিভাইসে বার্তা, কী এবং পরিচয় মুছে ফেলার জন্য হোম স্ক্রিনে ResilNet শিরোনামটিতে তিনবার আলতো চাপুন।';

  @override
  String get infoLegendNote =>
      'কিছু পাথ আইকন এখানে স্বচ্ছতার জন্য নথিভুক্ত করা হয়েছে; চ্যাটে ডেলিভারি টিক প্রাথমিক সেন্ড স্ট্যাটাস থেকে যায়।';

  @override
  String get dangerZoneTitle => 'বিপদ অঞ্চল';

  @override
  String get dangerZoneSubtitle =>
      'এই ডিভাইসে বার্তা, এনক্রিপশন কী, Nostr পরিচয়, সহকর্মী এবং ডাকনাম মুছে দেয়। আপনি আবার সেট আপ হবে.';

  @override
  String get panicWipeTitle => 'জরুরী মোছা';

  @override
  String get panicWipeSubtitle =>
      'স্থানীয় সবকিছু মুছুন — হোম শিরোনাম ট্রিপল-ট্যাপ করার মতো (ডাবল-ট্যাপ রেডিও রিফ্রেশ করে)';

  @override
  String get panicWipeConfirmTitle => 'সমস্ত স্থানীয় ডেটা মুছবেন?';

  @override
  String get panicWipeConfirmBody =>
      'এটি স্থায়ীভাবে এই ফোনের চ্যাট, কী এবং পরিচয় মুছে দেয়৷\nসমবয়সীদের অবশ্যই আপনার নতুন পরিচয়ের সাথে QR কী পুনরায় বিনিময় করতে হবে।\nএটি পূর্বাবস্থায় ফেরানো যাবে না।';

  @override
  String get panicWipeAction => 'সবকিছু মুছে ফেলুন';

  @override
  String get panicWipeSnack => 'স্থানীয় পরিচয় মুছে ফেলা হয়েছে — আবার সেট আপ';

  @override
  String panicWipeFailed(String error) {
    return 'মুছা ব্যর্থ হয়েছে: $error';
  }

  @override
  String get meshBridgeTitle => 'জাল সেতু';

  @override
  String get meshBridgeSubtitle =>
      'চালু থাকলে (ডিফল্ট), সিল করা খামে BLE জাল এবং ইন্টারনেট (Nostr) উভয়ই একসাথে ব্যবহার করতে পারে যাতে কাছাকাছি জাল দ্বীপগুলি সংযোগ করতে পারে। বন্ধ থাকাকালীন, পাঠায় শুধুমাত্র একটি পথ ব্যবহার করে — কখনই তারের উপর প্লেইনটেক্সট রাখে না।';

  @override
  String get favoritesTitle => 'প্রিয়';

  @override
  String get favoritesAdd => 'পছন্দসই যোগ করুন';

  @override
  String get favoritesRemove => 'প্রিয় থেকে সরান';

  @override
  String get favoritesEmpty =>
      'এখনও কোন পছন্দসই নেই — সদস্য তালিকা থেকে একজন সমবয়সী তারকা';

  @override
  String get favoritesNearbyTitle => 'কাছাকাছি প্রিয়';

  @override
  String favoritesNearbyBody(String name) {
    return '$name জালের কাছাকাছি আছে';
  }

  @override
  String get favoritesInAreaTitle => 'এলাকায় প্রিয়';

  @override
  String favoritesInAreaBody(String name) {
    return '$name এই এলাকায় অনলাইন আছে';
  }

  @override
  String get topologyTitle => 'মেশ টপোলজি';

  @override
  String get topologySubtitle =>
      'জাল থেকে সমবয়সীদের এবং সংযোগের ইঙ্গিতগুলি ঘোষণা (শুধু পড়ার জন্য)';

  @override
  String get topologyConnectedNow => 'এখন সংযুক্ত (BLE)';

  @override
  String get topologyNearby => 'কাছাকাছি (BLE)';

  @override
  String get topologyKnown => 'পরিচিত সমবয়সীদের';

  @override
  String get topologyEmpty =>
      'কোনো সহকর্মীরা এখনও শিখেনি — BLE চালু রেখে কাছাকাছি থাকুন';

  @override
  String get topologyYou => 'আপনি';

  @override
  String topologyStats(int peers, int links) {
    return '$peers সহকর্মী · $links লিঙ্ক';
  }

  @override
  String get topologyGraphHint =>
      'কাছাকাছি জাল আবিষ্কার থেকে অনুমান করা হয়েছে — আপনার ডিভাইস হাইলাইট করা হয়েছে। চ্যাট খুলতে পিয়ারে ট্যাপ করুন।';

  @override
  String get topologyOpen => 'মেশ টপোলজি';

  @override
  String get slashHelpTitle => 'কমান্ড';

  @override
  String get slashHelpBody =>
      '/help — এই তালিকা\n/who — বর্তমান চ্যানেলে অনলাইনে মানুষ\n/ড্রপ <text> — এখানে একটি সিল করা নোটিশ পিন করুন (E2EE ফ্যান-আউট)\n\nসম্পূর্ণ নির্দেশিকা: নিচের ওপেন গাইড ব্যবহার করুন, অথবা সেটিংস → ব্যবহারকারী নির্দেশিকা ব্যবহার করুন।';

  @override
  String get slashWhoEmpty => 'এই মুহূর্তে এই চ্যানেলে কেউ অনলাইনে নেই';

  @override
  String slashWhoTitle(int count) {
    return 'অনলাইন ($count)';
  }

  @override
  String get slashDropNeedText => 'ব্যবহার: / আপনার নোট পাঠ্য ড্রপ';

  @override
  String slashDropDone(String channel) {
    return '$channel-এ নোটিশ বাদ দেওয়া হয়েছে';
  }

  @override
  String get slashUnknown => 'অজানা কমান্ড - চেষ্টা করুন /help';

  @override
  String get announceOpen => 'ঘোষণা';

  @override
  String get announceTitle => 'ঘোষণা';

  @override
  String get announceEmpty =>
      'এখনও কোনো বোর্ড নেই — লক করা বা খোলা নোটিশ পোস্ট করার জন্য একটি তৈরি করুন';

  @override
  String get announceCreate => 'বোর্ড তৈরি করুন';

  @override
  String get announceCreateHint => 'বোর্ডের নাম';

  @override
  String get announceDefaultTitle => 'কমিউনিটি বোর্ড';

  @override
  String get announceSettings => 'বোর্ড সেটিংস';

  @override
  String get announceAllowLocked => 'লক করা (এনক্রিপ্ট করা) পোস্টের অনুমতি দিন';

  @override
  String get announceAllowLockedSub =>
      'বোর্ড কীতে এনক্রিপ্ট করা হয়েছে — পাঠকদের অ্যাক্সেস প্রয়োজন';

  @override
  String get announceAllowOpen => 'খোলা (সরলপাঠ্য) পোস্টের অনুমতি দিন';

  @override
  String get announceAllowOpenSub =>
      'E2EE নয় — মেশ/রিলেতে পঠনযোগ্য। ডিফল্টরূপে বন্ধ।';

  @override
  String get announceComposeHint => 'একটি ঘোষণা লিখুন...';

  @override
  String get announceMediaInternetOnly =>
      'ছবি/ভয়েস ঘোষণা ইন্টারনেটে পাঠানো হয় (BLE নয়)';

  @override
  String get announceNeedInternet =>
      'ছবি বা ভয়েস ঘোষণা পাঠাতে ইন্টারনেটে সংযোগ করুন';

  @override
  String announceVoiceFailed(String error) {
    return 'ভয়েস রেকর্ড করা যায়নি: $error';
  }

  @override
  String get announceImageTooLarge => 'ছবি খুবই বড় (সর্বোচ্চ ~180 KB)';

  @override
  String get announcePlayVoice => 'ভয়েস নোট চালান';

  @override
  String get announceImageLabel => '📷 ছবি';

  @override
  String get announceAudioLabel => '🎤 ভয়েস নোট';

  @override
  String get announceModeLocked => 'তালাবদ্ধ';

  @override
  String get announceModeOpen => 'খোলা';

  @override
  String get announceOpenBadge => 'খোলা · এনক্রিপ্ট করা নেই';

  @override
  String get announceLockedBadge => 'তালাবদ্ধ';

  @override
  String get announceLockedPlaceholder =>
      'এনক্রিপ্ট করা — পড়ার অ্যাক্সেসের অনুরোধ করুন';

  @override
  String get announceRequestAccess => 'অ্যাক্সেসের অনুরোধ করুন';

  @override
  String get announceRequestSent =>
      'বোর্ড মালিকের কাছে অ্যাক্সেসের অনুরোধ পাঠানো হয়েছে';

  @override
  String get announceRequestFailed =>
      'অ্যাক্সেসের অনুরোধ করা যায়নি (মালিকের সর্বজনীন কী প্রয়োজন)';

  @override
  String get announceOpenConfirmTitle => 'এনক্রিপশন ছাড়া পোস্ট?';

  @override
  String get announceOpenConfirmBody =>
      'খোলা পোস্ট E2EE নয়। পথে যে কেউ (জাল/রিলে) সেগুলি পড়তে পারে। চালিয়ে যান?';

  @override
  String get announcePostAction => 'পোস্ট';

  @override
  String get announcePendingRequests => 'অ্যাক্সেস অনুরোধ';

  @override
  String get announceApprove => 'অনুমোদন করুন';

  @override
  String get announceDeny => 'অস্বীকার করুন';

  @override
  String get announceGranted => 'আপনি এই বোর্ডে লক করা পোস্ট পড়তে পারেন';

  @override
  String get announceOwner => 'আপনি এই বোর্ড মালিক';

  @override
  String get announceCopyInvite => 'আমন্ত্রণ পাঠ্য অনুলিপি করুন';

  @override
  String get announceShowInviteQr => 'আমন্ত্রণ QR দেখান';

  @override
  String get announceScanInviteQr => 'স্ক্যান বোর্ড আমন্ত্রণ QR';

  @override
  String get announceFollow => 'আমন্ত্রণ থেকে বোর্ড অনুসরণ করুন';

  @override
  String get announceFollowHint =>
      'মালিকের কাছ থেকে আমন্ত্রণ পাঠ্য বা ResilNet লিঙ্ক আটকান';

  @override
  String get announceFollowOk => 'বোর্ড অনুসরণ';

  @override
  String announceFollowOkNamed(String title) {
    return 'এখন “$title” অনুসরণ করছে';
  }

  @override
  String get announceFollowFail => 'আমন্ত্রণটি অবৈধ বা ক্ষতিগ্রস্ত';

  @override
  String get announceInviteCopied => 'আমন্ত্রণ টেক্সট কপি করা হয়েছে';

  @override
  String get announceInviteSaveQr => 'QR সংরক্ষণ করুন';

  @override
  String get announceInviteShare => 'আমন্ত্রণ শেয়ার করুন';

  @override
  String get announceFollowFromCompose =>
      'বার্তা বাক্সে বোর্ডের আমন্ত্রণ সনাক্ত করা হয়েছে';

  @override
  String get peerConfirmAddTitle => 'নেটওয়ার্ক সদস্য যোগ করবেন?';

  @override
  String peerConfirmAddBody(String name) {
    return 'তাদের সর্বজনীন কী দিয়ে \"$name\" যোগ করুন যাতে আপনি তাদের ব্যক্তিগতভাবে বার্তা দিতে পারেন?';
  }

  @override
  String get peerConfirmAdd => 'সদস্য যোগ করুন';

  @override
  String peerAddedOk(String name) {
    return 'নেটওয়ার্ক সদস্যদের সাথে $name যোগ করা হয়েছে';
  }

  @override
  String get peerAddFromCompose =>
      'বার্তা বাক্সে সনাক্তকরণ / সর্বজনীন কী সনাক্ত করা হয়েছে';

  @override
  String get peerHashCopied => 'পাবলিক কী হ্যাশ কপি করা হয়েছে';

  @override
  String get peerHashOpenChat => 'খোলা চ্যাট';

  @override
  String get peerHashAddHint =>
      'হ্যাশ কপি করা হয়েছে। তাদের পরিচয় লিঙ্ক বা QR শেয়ার করতে বলুন যাতে আপনি E2EE এর জন্য সম্পূর্ণ পাবলিক কী যোগ করতে পারেন।';

  @override
  String get peerQrNoCode => 'এই ছবিতে কোনো ResilNet QR পাওয়া যায়নি';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet পরিচয়: “$name”\nলিঙ্কটি খুলুন বা চ্যাটে পেস্ট করুন → সদস্য যোগ করুন\nঅথবা পরিচয় QR স্ক্যান করুন।';
  }

  @override
  String get identityShareInvite => 'পরিচয় লিঙ্ক শেয়ার করুন';

  @override
  String get identityInviteCopied => 'পরিচয় লিঙ্ক কপি করা হয়েছে';

  @override
  String announceInviteSharePreamble(String title) {
    return 'বোর্ডের আমন্ত্রণ: “$title”\nResilNet খুলুন → কমিউনিটি বোর্ড → আমন্ত্রণ থেকে অনুসরণ করুন\nঅথবা QR স্ক্যান করুন/নীচের লিঙ্কে ট্যাপ করুন।';
  }

  @override
  String get announceConfirmFollowTitle => 'এই বোর্ড অনুসরণ?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'এই আমন্ত্রণ থেকে “$title” অনুসরণ করবেন?';
  }

  @override
  String get announceConfirmFollow => 'অনুসরণ করুন';
}

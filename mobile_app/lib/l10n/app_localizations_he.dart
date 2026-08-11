// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'מרענן את ResilNet...';

  @override
  String get appRefreshed => 'רענן - מכשירי רדיו וגילוי הופעלו מחדש';

  @override
  String appRefreshFailed(String error) {
    return 'הרענון נכשל: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'הקשה כפולה = רענון רך. לחיצה ארוכה = התאוששות קשה. הקשה משולשת = מגב חירום.';

  @override
  String get softRefreshTipTitle => 'אם ResilNet מרגיש תקוע';

  @override
  String get softRefreshTipBody =>
      'הקש פעמיים על ResilNet (למעלה משמאל) לרענון רדיו רך. אם עדיין תקוע: לחץ לחיצה ארוכה על הכותרת, השתמש ב-⋮ → שחזור קשה, או בהגדרות. הקשה משולשת היא ניגוב חירום בלבד.';

  @override
  String get softRefreshTipGotIt => 'הבנתי';

  @override
  String get infoSoftRefreshTitle => 'אם האפליקציה מרגישה תקועה';

  @override
  String get infoSoftRefreshStepRefresh =>
      'הקש פעמיים על ResilNet (למעלה משמאל) → מכשירי רדיו רענון רך ואנשים קרובים';

  @override
  String get infoSoftRefreshStepHard =>
      'עדיין תקוע? לחץ לחיצה ארוכה על הכותרת, או ⋮ / הגדרות ← שחזור קשה';

  @override
  String get infoSoftRefreshStepWait =>
      'המתן למזנון התוצאה ולאחר מכן נסה שוב. איפוס הפעלה שומר על המפתחות שלך.';

  @override
  String get infoSoftRefreshStepWipe =>
      'הקשה משולשת = מחיקת חירום (מוחקת נתונים מקומיים) - רק אם מכוון';

  @override
  String get appRecoverySection => 'שחזור אפליקציה';

  @override
  String get appRecoverySectionSubtitle =>
      'השתמש כאשר האפליקציה מרגישה קפואה. רך = כותרת הקש פעמיים. החלמה קשה היא חזקה יותר. איפוס הפעלה מפעיל מחדש שירותים מבלי למחוק מפתחות.';

  @override
  String get appHardRecoverAction => 'התאוששות קשה';

  @override
  String get appHardRecovering => 'התאוששות קשה…';

  @override
  String get appSessionResetAction => 'אפס הפעלה';

  @override
  String get appSessionResetRunning => 'מאפס את ההפעלה...';

  @override
  String get appSessionResetConfirmTitle => 'לאפס את ההפעלה?';

  @override
  String get appSessionResetConfirmBody =>
      'מפעיל מחדש שירותי ResilNet במכשיר זה. מפתחות הזהות שלך נשמרים.';

  @override
  String get appRecoveryBusy => 'השחזור כבר פועל...';

  @override
  String get appRecoveryOk => 'השחזור הסתיים';

  @override
  String get appRecoveryPartial =>
      'השחזור הסתיים עם דילוג על כמה שלבים - נסה שוב אם עדיין תקוע';

  @override
  String get appRecoveryFailed =>
      'השחזור נכשל - נסה לאפס הפעלה, או עזוב את האפליקציה בכוח ממערכת ההפעלה';

  @override
  String get localWifiTitle => 'Wi‑Fi מקומי';

  @override
  String get localWifiSubtitle =>
      'קשר מכשירים קרובים ללא אינטרנט - זהה לחיבור LAN אחד.';

  @override
  String get localWifiNotGatewayHint =>
      'לא השער ESP32 LoRa SoftAP. זהו טלפון ↔ טלפון / LAN בלבד.';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi המקומי עדיין לא מוכן - המתן להפעלת האפליקציה.';

  @override
  String get lxmfBridgeTitle => 'צומת בית';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac או Pi אופציונליים ב-Wi‑Fi שלך שמעביר צ\'אטים חתומים. כבוי כברירת מחדל. אינו מחליף הצפנה מקצה לקצה.';

  @override
  String get lxmfBridgeEnable => 'השתמש בצומת הבית';

  @override
  String get lxmfBridgeDisabledHint =>
      'הפעל רק כאשר אפליקציית הגשר פועלת ב-Mac או Pi ברשת זו.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'מקוון - $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'לא ניתן להגיע לצומת הבית - $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'כתובת צומת בית';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP או http://IP:port — דוגמה 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'עמית ← LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'מצב שמירה ורענון';

  @override
  String get lxmfBridgeLabHint => 'מתקדם: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'הגדרות צומת בית';

  @override
  String get lxmfBridgeCheckConnection => 'בדוק חיבור';

  @override
  String get lxmfBridgeStatusOnline => 'מחובר לצומת הבית';

  @override
  String get lxmfBridgeStatusOffline => 'צומת בית לא נגיש';

  @override
  String get lxmfBridgeYourDest => 'כתובת הצומת הזו (שתף עם חברים)';

  @override
  String get lxmfBridgeCopyDest => 'העתק כתובת';

  @override
  String get lxmfBridgeDestCopied => 'הכתובת הועתקה';

  @override
  String get lxmfBridgeLinkedPeers => 'חברים מקושרים';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'כל חבר צריך את כתובת הצומת הביתית שלו פעם אחת. אז צ\'אטים חתומים יכולים להשתמש בנתיב הזה.';

  @override
  String get lxmfBridgeNoLinks => 'עדיין אין חברים מקושרים.';

  @override
  String get lxmfBridgeAddLink => 'קשר חבר';

  @override
  String get lxmfBridgePickPeer => 'חבר';

  @override
  String get lxmfBridgePeerDest => 'כתובת צומת הבית שלהם';

  @override
  String get lxmfBridgePeerDestHint => 'קוד בן 32 תווים ממסך צומת הבית שלהם';

  @override
  String get lxmfBridgeInvalidDest =>
      'הכתובת הזו לא נראית חוקית. הדבק את הקוד המלא מהצומת הביתי שלהם.';

  @override
  String get lxmfBridgeRemoveLink => 'בטל את הקישור';

  @override
  String get lxmfBridgeSaveLink => 'לְהַצִיל';

  @override
  String get lxmfBridgeLinkSaved => 'חבר מקושר';

  @override
  String get lxmfBridgeNoPeers =>
      'אין עדיין אנשי קשר שניתן לשלוח להם הודעות - הוסף חבר קודם.';

  @override
  String get lxmfBridgeHelp =>
      'השאר את הגשר פועל ב-Mac/Pi. נתיב זה נשאר ברשת ה-LAN שלך - הוא אינו LoRa ואינו מחליף רשת אינטרנט או Bluetooth.';

  @override
  String get localWifiModeHotspot => 'סָמוּך';

  @override
  String get localWifiModeRouter => 'נתב';

  @override
  String get localWifiHotspotIntro =>
      'מכשיר אחד חולק נקודה חמה אישית. אחרים מצטרפים לנקודה חמה זו, ואז ResilNet מוצא אותם ברשת המקומית.';

  @override
  String get localWifiHostAction => 'צור רשת (מארח)';

  @override
  String get localWifiJoinAction => 'הצטרף לרשת';

  @override
  String get localWifiHostSteps =>
      '1. פתח את הגדרות iOS/Android והפעל נקודה חמה אישית (או שיתוף אינטרנט).\n2. ספר לחברים את שם הנקודה החמה (והסיסמה).\n3. חזור לכאן והקש על \"נקודה חמה מופעלת - התחל לחכות\".';

  @override
  String get localWifiHostReady => 'נקודה חמה מופעלת - התחל לחכות';

  @override
  String get localWifiHostWaiting => 'מחכה לחברים שיצטרפו...';

  @override
  String get localWifiJoinSteps =>
      '1. פתח את הגדרות המערכת והצטרף לנקודה החמה האישית של חברך.\n2. חזור לכאן והקש על \"אני מחובר - חפש\".';

  @override
  String get localWifiJoinReady => 'אני מחובר - חפש';

  @override
  String get localWifiRouterIntro =>
      'חבר כל מכשיר לאותו נתב/AP של Wi‑Fi. הנתב אינו זקוק לאינטרנט - רק רשת מקומית משותפת.';

  @override
  String get localWifiRouterSearch => 'חפש ב-Wi‑Fi הזה';

  @override
  String get localWifiRefreshNetwork => 'רענן מידע Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'לא ב-Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'הצטרף ל-Wi‑Fi של הנתב בהגדרות המערכת, ואז חפש שוב.';

  @override
  String get localWifiDiscovering => 'מחפש ב-Wi‑Fi מקומי...';

  @override
  String get localWifiPeersFound => 'מכשירים ברשת זו';

  @override
  String get localWifiStop => 'לְהַפְסִיק';

  @override
  String get localWifiSsidUnknown => 'שם Wi‑Fi אינו זמין';

  @override
  String get localWifiStubBanner => 'ממתין לשקע LAN...';

  @override
  String get localWifiLiveBanner =>
      'גילוי LAN בשידור חי (UDP) - הכרזה + צ\'אט חתום ב-Wi‑Fi הזה';

  @override
  String get localWifiEmptyHotspot =>
      'עדיין אין מכשירים.\nבדוק שחברים הצטרפו לנקודה החמה שלך ואפשרו גישה לרשת המקומית.';

  @override
  String get localWifiEmptyRouter =>
      'עדיין אין מכשירים.\nאותו SSID? רשת מקומית מותרת? חלק מהנתבים חוסמים תעבורה בין מכשיר למכשיר (בידוד AP).';

  @override
  String get localWifiIsolationHelp => 'למה אנחנו לא יכולים למצוא אחד את השני?';

  @override
  String get localWifiIsolationTitle => 'הנתב עשוי לבודד לקוחות';

  @override
  String get localWifiIsolationBody =>
      'אם בידוד AP/Client (או רשת אורח) פועל, טלפונים באותו Wi‑Fi אינם יכולים לדבר. כבה את הבידוד, השתמש ב-SSID הראשי או עבור למצב Nearby (Hotspot).';

  @override
  String get localWifiPeerReady => 'מוכן לצ\'אט (יש מפתח)';

  @override
  String get localWifiPeerNeedKey => 'נמצא - סרוק QR כדי להחליף מפתחות';

  @override
  String get localWifiErrorTitle => 'שגיאה מקומית Wi‑Fi';

  @override
  String get localWifiErrorBody => 'משהו השתבש. עצור ונסה שוב.';

  @override
  String get preparingSystem => 'מכין מערכת...';

  @override
  String get bootFailedTitle => 'לא ניתן היה להתחיל';

  @override
  String get retry => 'נסה שוב';

  @override
  String get bootRecoveryAction => 'התחל זהות חדשה (מחק נתונים מקומיים)';

  @override
  String get bootRecoveryConfirmTitle => 'להתחיל זהות חדשה?';

  @override
  String get bootRecoveryConfirmBody =>
      'פעולה זו תמחק לצמיתות צ\'אטים מקומיים, מפתחות וזהות במכשיר זה.\nעמיתים חייבים לסרוק שוב את ה-QR שלך עם הזהות החדשה שלך.\nלא ניתן לבטל זאת.';

  @override
  String get bootRecoveryRunning => 'מאפס את הזהות המקומית...';

  @override
  String get bootRecoverySuccess => 'איפוס הזהות המקומית הושלם';

  @override
  String bootRecoveryFailed(String error) {
    return 'לא ניתן לאפס את הזהות: $error';
  }

  @override
  String get cancel => 'לְבַטֵל';

  @override
  String get save => 'לְהַצִיל';

  @override
  String get close => 'לִסְגוֹר';

  @override
  String get start => 'הַתחָלָה';

  @override
  String get send => 'לִשְׁלוֹחַ';

  @override
  String get settings => 'הגדרות';

  @override
  String get language => 'שָׂפָה';

  @override
  String get languageSubtitle =>
      'כברירת מחדל, האפליקציה עוקבת אחר שפת הטלפון שלך (כאשר היא נתמכת). שפות אחרות חוזרות לאנגלית. אתה יכול גם לנעול שפה כאן.';

  @override
  String get languageSystem => 'ברירת המחדל של המערכת';

  @override
  String get languageThai => 'תאילנדית';

  @override
  String get languageEnglish => 'אַנגְלִית';

  @override
  String get notificationsTooltip => 'הגדרות התראות';

  @override
  String get enableMessageNotifications => 'אפשר התראות על הודעות';

  @override
  String get settingsNotificationsSubtitle =>
      'הודעות 1:1 ואנשים מקוונים (התראות מקומיות)';

  @override
  String get networkMembersTooltip => 'חברי רשת';

  @override
  String get identityQrTooltip => 'זהות / QR';

  @override
  String get feedDirects => 'לְשׂוֹחֵחַ';

  @override
  String get feedMesh => '#רֶשֶׁת';

  @override
  String get feedGeo => 'אֵזוֹר';

  @override
  String get feedDirectsSubtitle => 'הודעות E2EE פרטיות';

  @override
  String get feedMeshSubtitle => 'עמיתים בקרבת מקום (BLE)';

  @override
  String get feedGeoSubtitle => 'ערוץ גילוי Geohash';

  @override
  String get peerIdHint => 'הדבק מזהה נמען (Public Key Hash) כדי להתחיל צ\'אט';

  @override
  String get directsEmpty =>
      'עדיין אין צ\'אטים - סרוק QR או הדבק מזהה נמען כדי להתחיל\nהודעות נאטמות ב-E2EE לפני השליחה (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • הקש כדי לפתוח צ\'אט';

  @override
  String get meshIntro =>
      'עמיתים בטווח BLE - הקש לצ\'אט E2EE פרטי (ללא חיבור ציבורי ב-#mesh)\nשולח דרך נתב היברידי (BLE + LoRa + Nostr במצב מקוון)';

  @override
  String get meshEmptyRunning =>
      'עדיין אין עמיתים בקרבת מקום - פתח את האפליקציה במכשיר אחר בטווח BLE';

  @override
  String get meshEmptyStopped => 'BLE אינו פועל - הענק הרשאת Bluetooth / מיקום';

  @override
  String get meshNearbyPrefix => 'סָמוּך';

  @override
  String get meshRetentionTitle => 'מחיקה אוטומטית של הודעות';

  @override
  String get meshRetentionSubtitle =>
      'היסטוריית צ\'אט מקומית ישנה יותר מוסרת אוטומטית';

  @override
  String get meshRetentionKeep => 'לִשְׁמוֹר';

  @override
  String get meshRetention1Day => 'יום אחד';

  @override
  String get meshRetention3Days => '3 ימים';

  @override
  String get meshRetention7Days => '7 ימים';

  @override
  String get refreshLocationTooltip => 'רענון המיקום';

  @override
  String get geoIntro =>
      'לאנשים מקוונים ב-geohash זה ניתן לשלוח הודעות 1:1 או עם מאוורר ציבורי באזור (עדיין חתום E2EE לכל עמית - לא טקסט רגיל)';

  @override
  String geoEmpty(String channel) {
    return 'אף אחד עדיין לא מקוון ב-$channel\nהשתמש בתחבורה ← אינטרנט/אוטומטי, המתן ל-Nostr, רענן מיקום';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'מקוון ב-$channel • הקש עבור 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'בקרבת מקום (ממתין לנוכחות באזור) • הקש עבור 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'נראה ב-Nostr ב-$channel • גילוי בלבד (מדור קודם)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'נוכחות אנונימית מדור קודם - המתן לעמית קשור או החלף QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE בקרבת מקום - סרוק QR כדי להתחיל ב-1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'לגילוי אינטרנט באזור צריך להיות מחובר Nostr (הגדרות ← תחבורה ← אינטרנט/אוטומטי)';

  @override
  String get geoEmptyNoLocation =>
      'המיקום עדיין לא נפתר - אפשר ל-GPS ולרענן כדי לפרסם את ה-Geohash שלך ב-Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'הרשאת מיקום נדחתה - אפשר ResilNet בהגדרות ← פרטיות ← מיקום';

  @override
  String get geoEmptyServicesDisabled =>
      'שירותי המיקום כבויים - הפעל אותם בהגדרות';

  @override
  String get geoEmptyNoGpsFix =>
      'לא ניתן היה להשיג תיקון GPS (נפוץ במכשירי Wi‑Fi iPad) - הגדר את geoash ידנית למטה';

  @override
  String get geoEmptyTeleportHint =>
      'הקש על סמל המקום ← הזן גיאואש (למשל w5) ← Teleport';

  @override
  String get geoSetGeohashManually => 'הגדר גיאואש';

  @override
  String get geoTeleportHint =>
      'אין GPS? הזן קידומת geoash (2–7 תווים, למשל w5) והקש על Teleport';

  @override
  String get geoTeleportInvalid =>
      'Geohash לא חוקי - השתמש באותיות/מספרים בבסיס 32 בלבד (לדוגמה, w5 או w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'האזור מוגדר ל-$channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'אזור ידני: $channel (רענון GPS יעקוף)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr לא מוכן - הקש על התחבר מחדש (0/0 עד שההתחלה תצליח)';

  @override
  String get geoEmptyMeshOnly =>
      'התחבורה היא Mesh בלבד - עבור לאינטרנט או אוטומטי כדי לגלות עמיתים מעל Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'אף אחד ב-$channel עדיין לא - השאר אזור + אינטרנט פתוח בשני המכשירים והמתן ~60 שניות';
  }

  @override
  String get geoChannelFallback => '#אֵזוֹר';

  @override
  String get geoRefreshLocation => 'רענן מיקום';

  @override
  String get settingsClearLocationTitle => 'מיקום ברור';

  @override
  String get settingsClearLocationSubtitle =>
      'הסר GPS / טלפורט גיאואש (האזור הופך ל-#—)';

  @override
  String get settingsClearLocationConfirmTitle => 'לנקות מיקום?';

  @override
  String get settingsClearLocationConfirmBody =>
      'מוחק את ה- geoash המאוחסן במכשיר זה. אתה יכול לרענן את ה-GPS או טלפורט שוב ​​לאחר מכן.';

  @override
  String get settingsClearLocationAction => 'מיקום ברור';

  @override
  String get settingsClearLocationSnack => 'המיקום נוקה';

  @override
  String get chatVoiceTooLarge => 'הערה קולית גדולה מדי - מקסימום ~30 שניות';

  @override
  String get chatVoiceNeedInternet =>
      'הערה קולית זקוקה לאינטרנט (Nostr) - גדולה מדי עבור BLE בלבד';

  @override
  String get chatVoiceSentInternet => 'הערה קולית שנשלחה דרך האינטרנט';

  @override
  String get noticeAnonMention => 'אִזְכּוּר';

  @override
  String get noticeAnonDm => 'הודעה ישירה';

  @override
  String get noticeAnonHug => 'לְחַבֵּק';

  @override
  String get noticeAnonSlap => 'סְטִירָה';

  @override
  String get noticeAnonBlock => 'לַחסוֹם';

  @override
  String get noticeAnonNeedKey =>
      'עדיין אין מפתח ציבורי - החלף קודם QR עבור 1:1';

  @override
  String get noticeAnonActionSent => 'נשלח';

  @override
  String noticeAnonBlocked(String anon) {
    return 'חסום $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* חיבוקים $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* סטירות $anon *';
  }

  @override
  String get geoReconnectNostr => 'חבר מחדש את Nostr';

  @override
  String get nostrSectionTitle => 'Nostr ממסרים';

  @override
  String get nostrSectionSubtitle =>
      'הודעות אינטרנט וגילוי אזור משתמשים בממסרים אלה. הקש על התחבר מחדש אם הסטטוס נשאר במצב לא מקוון.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'מחובר $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'לא מקוון - ממסרים רשומים אך אף אחד לא מחובר';

  @override
  String get nostrStatusNotInit =>
      'לא התחיל (0/0) - הקש על התחבר מחדש כדי לאתחל';

  @override
  String get nostrReconnectAction => 'חבר מחדש את Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr מחובר ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'עדיין במצב לא מקוון - בדוק את Wi‑Fi/cellular או נסה שוב';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'נכשל: $error';
  }

  @override
  String get nostrReconnecting => 'מתחבר לממסרים...';

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
    return 'אינטרנט (Nostr) ב-$channel • צ\'אט סגור מוכן';
  }

  @override
  String get transportModeTitle => 'הובלה אזורית';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE בקרבת מקום (רדיו) כאשר אין Nostr · אינטרנט ואוטומטי = Nostr רשימת אנשים';

  @override
  String get transportModeMesh => 'רֶשֶׁת';

  @override
  String get transportModeInternet => 'לַאִינטֶרנֶט';

  @override
  String get transportModeAuto => 'אוטומטי';

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
  String get geoPublicHint => 'הודעה ציבורית לכל המקוונים באזור זה';

  @override
  String get geoPublicSend => 'פּוּמְבֵּי';

  @override
  String geoPublicHelp(int count) {
    return 'מאוורר אטום ל-$count עמיתים מקוונים - כל אחד מקבל מעטפה פרטית';
  }

  @override
  String geoPublicSent(int count) {
    return 'נשלח אל $count עמית(ים) באזור זה';
  }

  @override
  String get geoPublicSentNone =>
      'אין עמיתים שניתן לשלוח אליהם הודעות באינטרנט - פתח את Area/Mesh עם עמיתים שיש להם מפתחות, או המתן ל-BLE/Nostr';

  @override
  String get areaPublicBadge => 'ציבורי באזור';

  @override
  String get geoErrorPermission =>
      'לא ניתן היה לקרוא את המיקום - בדוק את הרשאת המיקום';

  @override
  String get geoPrecisionRegion => 'אֵזוֹר';

  @override
  String get geoPrecisionProvince => 'מָחוֹז';

  @override
  String get geoPrecisionCity => 'עִיר';

  @override
  String get geoPrecisionNeighborhood => 'שְׁכוּנָה';

  @override
  String get geoPrecisionBlock => 'לַחסוֹם';

  @override
  String get aliasTitle => 'הגדר כינוי (כינוי ליצירת קשר)';

  @override
  String get aliasHintBody =>
      'כינוי זה מאוחסן במכשיר זה בלבד (מקומי בלבד)\nזה אף פעם לא נשלח עם תעבורת E2EE';

  @override
  String get aliasLabel => 'כינוי';

  @override
  String get aliasHint => 'לְמָשָׁל \"ראש כפר\", \"פ\'סומצ\'אי\"...';

  @override
  String get settingsDevices => 'התקנים';

  @override
  String get settingsFirmwareTitle => 'הורד / עדכן את הקושחה ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'הורד קבצי .bin ועדכן את לוח ESP32 באמצעות OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic גשר';

  @override
  String get mtBridgeSettingsSubtitle =>
      'גשר A/B לטקסט בלבד - לא ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'העבר טקסט רגיל קצר בין Meshtastic ל-ResilNet. מצבים A ו-B אינם יכולים לפעול בו-זמנית. זו לא הצפנה מקצה לקצה.';

  @override
  String get mtBridgeModeLabel => 'מצב';

  @override
  String get mtBridgeModeOff => 'כבוי';

  @override
  String get mtBridgeModeA => 'לבלוע את א';

  @override
  String get mtBridgeModeB => 'יציאה ב\'';

  @override
  String get mtBridgeModeOffShort => 'כבוי';

  @override
  String get mtBridgeModeAShort => 'ב-A';

  @override
  String get mtBridgeModeBShort => 'יוצא ב';

  @override
  String get mtBridgeMutexHint =>
      'בחירת מצב מכבה את השני באופן אוטומטי. סימולטני A+B אינו נתמך.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'הדגמה (רישום)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic ← ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'טקסט נכנס מופיע תחת \'הודעות\' בתור #meshtastic. ממסר רשת הוא אופציונלי (כבוי כברירת מחדל).';

  @override
  String get mtBridgeRelayTitle => 'ממסר גם על רשת ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'כאשר פועל, עלונים ציבוריים חתומים משודרים. כבוי = הודעות הטלפון הזה בלבד.';

  @override
  String get mtBridgeSimulateHint => 'הודעת הדגמה';

  @override
  String get mtBridgeSimulate => 'הדמיית הודעת Meshtastic';

  @override
  String get mtBridgeIngestOk => 'מוכנס להודעות (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'אזהרה: הודעות שנשלחו כאן אינן ResilNet E2EE. כל אחד בנתיב Meshtastic יכול לקרוא אותם.';

  @override
  String get mtBridgeEgressSection => 'ResilNet ← Meshtastic';

  @override
  String get mtBridgeComposeHint => 'טקסט לפרסום';

  @override
  String get mtBridgeSend => 'שלח אל Meshtastic';

  @override
  String get mtBridgeEgressOk => 'בתור עבור Meshtastic (ראה יומן / היסטוריה)';

  @override
  String get mtBridgeLastEgress => 'יציאה אחרונה';

  @override
  String get mtBridgeEgressHistory => 'יציאה אחרונה';

  @override
  String get mtBridgeOffHint =>
      'הפעל את הטמעה (A) או יציאה (B) כדי להשתמש בגשר.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · לא E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'השתמש בתחבורה MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'כיבוי = רישום הדגמה בלבד (התעלמותMQTT נכנסת). פועל = MQTT עבור בליעה/יציאה כאשר מחובר.';

  @override
  String get mtBridgeMqttHost => 'מארח ברוקר';

  @override
  String get mtBridgeMqttPort => 'נָמָל';

  @override
  String get mtBridgeMqttTls => 'השתמש ב-TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'יציאה טיפוסית 8883. משתמש בתעודות מערכת; נכשל רך על שגיאות לחיצת יד.';

  @override
  String get mtBridgeMqttAutoReconnect => 'התחבר אוטומטית';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'כאשר פועל, הלקוח מנסה להתחבר מחדש לאחר נפילות. המצב מציג מתחבר עד לשחזור.';

  @override
  String get mtBridgeMqttTopicHelpers => 'עוזרי נושא';

  @override
  String get mtBridgeMqttRegion => 'קידומת אזור (אופציונלי)';

  @override
  String get mtBridgeMqttRegionHint =>
      'כאשר מוגדר, Apply בונה מחדש את השורש כ-msh/<region>/2/json (עובר את שורש הנושא).';

  @override
  String get mtBridgeMqttTopicRoot => 'שורש נושא JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'שם ערוץ Downlink';

  @override
  String get mtBridgeMqttApplyTopics => 'החל שורש → הירשם / פרסם נושאים';

  @override
  String get mtBridgeMqttAdvanced => 'מתקדם MQTT';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, התחבר מחדש, נושאים, אישורים';

  @override
  String get mtBridgeMqttTopicIn => 'נושא הרשמה';

  @override
  String get mtBridgeMqttTopicOut => 'פרסם נושא';

  @override
  String get mtBridgeMqttGatewayFrom => 'מזהה צומת שער (מאת)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'מזהה עשרוני או !hex - נדרש עבור sendtext downlink';

  @override
  String get mtBridgeMqttChannelIndex => 'אינדקס ערוץ רשת (אופציונלי 0–7)';

  @override
  String get mtBridgeMqttUser => 'שם משתמש (אופציונלי)';

  @override
  String get mtBridgeMqttPass => 'סיסמא (אופציונלי)';

  @override
  String get mtBridgeMqttPassStored => 'סיסמה מאוחסנת במכשיר זה (לא מוצגת).';

  @override
  String get mtBridgeMqttPassReplace => 'סיסמה חדשה (להשאיר ריק כדי לשמור)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'השאר ריק כדי לשמור את הסיסמה המאוחסנת.';

  @override
  String get mtBridgeMqttPassClear => 'נקה סיסמה';

  @override
  String get mtBridgeMqttSave => 'שמור הגדרות MQTT';

  @override
  String get mtBridgeMqttSaved => 'הגדרות MQTT נשמרו';

  @override
  String get mtBridgeMqttConnect => 'לְחַבֵּר';

  @override
  String get mtBridgeMqttDisconnect => 'לְנַתֵק';

  @override
  String get mtBridgeMqttConnected => 'MQTT מחובר';

  @override
  String get mtBridgeMqttConnecting => 'MQTT מתחבר...';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT מנותק';

  @override
  String get mtBridgeMqttError => 'שגיאה MQTT';

  @override
  String get mtBridgeErrModeIngest => 'עבור ל-Input (A) תחילה';

  @override
  String get mtBridgeErrModeEgress => 'עבור אל יציאה (B) תחילה';

  @override
  String get mtBridgeErrRate => 'האטו - שיעור מוגבל';

  @override
  String get mtBridgeErrDedupe => 'התעלמו מהודעה כפולה';

  @override
  String get mtBridgeErrLoop => 'נשמט כדי למנוע לולאת גשר';

  @override
  String get mtBridgeErrEmpty => 'ההודעה ריקה';

  @override
  String get mtBridgeErrPublish => 'הפרסום נכשל';

  @override
  String get mtBridgeErrNotConnected => 'MQTT לא מחובר';

  @override
  String get mtBridgeErrMissingHost => 'הזן MQTT מארח ברוקר';

  @override
  String get mtBridgeErrMissingTopic => 'הכנס להירשם ופרסם נושאים';

  @override
  String get mtBridgeErrMissingFromNode =>
      'הזן את מזהה הצומת של השער (מאת) עבור sendtext';

  @override
  String get mtBridgeErrConnect => 'חיבור MQTT נכשל';

  @override
  String get mtBridgeErrConnectTls => 'MQTT חיבור TLS נכשל';

  @override
  String get settingsData => 'נְתוּנִים';

  @override
  String get settingsDataHint =>
      'מחק הודעות מקומיות כדי לכווץ את מסד הנתונים - זהות, מפתחות ועמיתים נשמרים';

  @override
  String get settingsSaveHistoryTitle => 'שמור היסטוריית הודעות';

  @override
  String get settingsSaveHistorySubtitle =>
      'כשההודעות כבויות, ההודעות נשארות E2EE על הרשת ונשמרות רק להפעלה זו (לא בהיסטוריית הצ\'אט המקומית). הטקסט שלך עדיין מופיע כטקסט רגיל במכשיר זה.';

  @override
  String get settingsPrivacy => 'פְּרָטִיוּת';

  @override
  String get settingsE2eeTitle => 'הצפנה מקצה לקצה';

  @override
  String get settingsE2eeSubtitle =>
      'פועל תמיד - הודעות אטומות עם RSA-OAEP + AES-GCM לפני השליחה. ממסרים והכשות בקרבת מקום אינם יכולים לקרוא את התוכן.';

  @override
  String get settingsScreenshotTitle => 'התראות צילום מסך';

  @override
  String get settingsScreenshotSubtitle =>
      'הצג קו מערכת בצ\'אט כאשר המכשיר הזה מצלם את המסך';

  @override
  String get settingsNostrExpiryTitle => 'Nostr הודעה לשמור זמן';

  @override
  String get settingsNostrExpirySubtitle =>
      'כמה זמן מעטפות סגורות צריכות להישאר מקומיות כשהן מקוונות דרך Nostr';

  @override
  String get noticeExpiresIn => 'יפוג ב';

  @override
  String get noticesTitle => 'הודעות';

  @override
  String get noticesMeshIntro =>
      'עלון ציבורי - גלוי לכולם בטווח הרדיו, לא מוצפן. הוא מעביר טלפון לטלפון במצב לא מקוון, ותיבות ממסר ResilNet בקרבת מקום שומרים עותק כך שאנשים שמגיעים מאוחר יותר עדיין רואים אותו.';

  @override
  String get noticesMeshPublicBadge => 'PUBLIC · לא מוצפן';

  @override
  String get noticesGeoIntro =>
      'הוסף הערות קצרות עבור המקום הזה כדי שמבקרים אחרים יוכלו למצוא אותם.';

  @override
  String get noticesEmpty => 'עדיין אין הודעות';

  @override
  String get noticesEmptyHint => 'הצמד את ההודעה הראשונה לאנשים בסביבה.';

  @override
  String get noticesComposeHint => 'פרסם הודעה...';

  @override
  String get noticesUrgent => 'דָחוּף';

  @override
  String get noticesOpen => 'הודעות';

  @override
  String get screenshotTaken => '*צילמת צילום מסך*';

  @override
  String get chatAttachImage => 'צרף תמונה';

  @override
  String get chatImageLabel => 'תְמוּנָה';

  @override
  String get chatImageTooLarge => 'תמונה גדולה מדי - נסה תמונה אחרת';

  @override
  String get chatNostrExpiry => 'Nostr שמור';

  @override
  String geoPublicComposeHint(String channel) {
    return 'שלח אל $channel - ציבורי';
  }

  @override
  String get settingsClearTitle => 'נקה את כל ההודעות';

  @override
  String get settingsClearSubtitle => 'מחק את כל הצ\'אטים במכשיר הזה';

  @override
  String get settingsClearConfirmTitle => 'לנקות את כל ההודעות?';

  @override
  String get settingsClearConfirmBody =>
      'פעולה זו מוחקת את כל הודעות הצ\'אט במכשיר זה.\nעמיתים וכינויים אינם מוסרים.';

  @override
  String get settingsClearAction => 'נקה נתונים';

  @override
  String get settingsClearedSnack => 'הנתונים נוקו';

  @override
  String settingsVersion(String version) {
    return 'גרסה $version';
  }

  @override
  String get meshBleScanning => 'BLE: סריקה לאיתור צמתים';

  @override
  String get meshBleEsp32Scanning => 'ESP32: מחפש צומת קרוב';

  @override
  String get meshBleSyncing => 'BLE: מסתנכרן עם ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: פרסום';

  @override
  String get meshBleIdle => 'BLE mesh on - עדיין אין טלפונים קרובים';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh - $count טלפונים בקרבת מקום';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: נדרשת הרשאה';

  @override
  String get meshBlePausedCamera => 'BLE מושהה למצלמה - הקש על התחל BLE';

  @override
  String get meshBleStopped =>
      'BLE כבוי - בדוק שה-Bluetooth מופעל ולאחר מכן הקש על התחל BLE';

  @override
  String get meshBleRestart => 'התחל את BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'בדוק הרשאות והתחל את BLE';

  @override
  String get meshNostrOffline => 'Nostr במצב לא מקוון';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count עמיתים בקרבת מקום • LoRa $lora • סנכרון ~${meters}m';
  }

  @override
  String get meshLoraReady => 'מוּכָן';

  @override
  String get meshLoraNotReady => 'לא מוכן';

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
    return 'שער UDP: $label';
  }

  @override
  String get meshGatewayReady => 'שער UDP: מוכן';

  @override
  String get permissionTitle => 'אפשר גישה כדי להפעיל את רשת הרשת BLE';

  @override
  String get permissionBody =>
      'האפליקציה זקוקה ל-Bluetooth (סריקה / חיבור / פרסום), מיקום (עבור מכשירי אנדרואיד ישנים יותר), ומיקרופון (להערות קוליות בצ\'אט והודעות) להעברת הודעות בקהילה.';

  @override
  String get permissionE2ee =>
      'הצפנה מקצה לקצה (E2EE)\nצמתי ממסר אינם יכולים לקרוא את תוכן ההודעה';

  @override
  String get permissionReady => 'ההרשאות מוכנות';

  @override
  String get permissionRequest => 'אפשר והמשך';

  @override
  String get permissionNotReadySnack =>
      'המערכת עדיין לא מוכנה - המתן רגע ונסה שוב';

  @override
  String get permissionDeniedSnack =>
      'הרשאות לא שלמות - פתח את \'הגדרות\' > ResilNet ואפשר Bluetooth / מיקום / מיקרופון';

  @override
  String get permissionMicDenied =>
      'גישה למיקרופון נדחתה - אפשר בהגדרות להקליט הערות קוליות';

  @override
  String get permissionMicOpenSettings => 'הגדרות';

  @override
  String get permissionCameraDenied =>
      'הגישה למצלמה נדחתה - אפשר לה בהגדרות לסרוק קודי QR';

  @override
  String get permissionCameraFailed => 'נדרשת הרשאת מצלמה כדי לסרוק קודי QR';

  @override
  String get permissionCameraOpenSettings => 'הגדרות';

  @override
  String get permissionPhotosDenied =>
      'הגישה לספריית התמונות נדחתה - אפשר לה בהגדרות כדי לשמור את קוד ה-QR שלך';

  @override
  String get permissionPhotosFailed =>
      'יש צורך באישור ספריית תמונות כדי לשמור את קוד ה-QR שלך';

  @override
  String get permissionPhotosOpenSettings => 'הגדרות';

  @override
  String permissionFailedSnack(String error) {
    return 'בקשת ההרשאה נכשלה: $error';
  }

  @override
  String get permissionFooter => 'ResilNet ארכיטקטורה • אחסן והעבר מולטי-הופ';

  @override
  String get onboardingSkip => 'לְדַלֵג';

  @override
  String get onboardingNext => 'הַבָּא';

  @override
  String get onboardingStart => 'התחל';

  @override
  String get onboardingWelcomeTitle => 'ברוכים הבאים אל ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'צ\'אט ב-ResilNet דרך רשת רשת - אפילו בלי אינטרנט';

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
  String get onboardingChannelsTitle => 'צ\'אט מוצפן + ערוצים קרובים';

  @override
  String get onboardingChannelsBody =>
      'החלף #mesh / Area (geohash) כדי למצוא עמיתים בקרבת מקום - ההודעות נשארות E2EE מעל BLE mesh ו-Nostr';

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
  String get chatTitle => 'צ\'אט (E2EE)';

  @override
  String get chatScanTooltip => 'סרוק QR כדי להוסיף עמית';

  @override
  String get chatBlockTooltip => 'חסום את השולח הזה';

  @override
  String get chatBlockedSnack => 'חסום: אין התראות / אין ממסר';

  @override
  String get chatAliasTooltip => 'הגדר כינוי';

  @override
  String get chatReceiverPemLabel => 'מפתח ציבורי של נמען (PEM)';

  @override
  String get chatReceiverPemHint =>
      'הדבק את המפתח הציבורי של חברך (מ-QR / קובץ משותף)';

  @override
  String get chatNeedPeerKey =>
      'סרוק תחילה את ה-QR של עמית זה (נדרש מפתח ציבורי מאומת)';

  @override
  String get chatPeerKeyMismatch =>
      'מפתח ציבורי מאוחסן אינו תואם לזהות עמית זה';

  @override
  String chatVoiceFailed(String error) {
    return 'לא ניתן להקליט אודיו: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'לא ניתן היה להשמיע הערה קולית: $error';
  }

  @override
  String get chatPlayVoice => 'הפעל הערה קולית';

  @override
  String get chatPauseVoice => 'הַפסָקָה';

  @override
  String get chatVoiceLabelSent => '🎤 הערה קולית (חתומה)';

  @override
  String get chatVoiceLabel => '🎤 הערה קולית';

  @override
  String get chatDecryptFailed => '[פענוח נכשל]';

  @override
  String chatSentSealed(String preview) {
    return '[אטום • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[אָטוּם]';

  @override
  String get chatComposeHint => 'הקלד הודעה... (חתומה בשלח)';

  @override
  String get chatEmptyThread =>
      'עדיין אין הודעות\nהקלד למטה כדי לשלוח מעל הרשת';

  @override
  String chatLoadFailed(String error) {
    return 'לא ניתן לטעון את השיחה: $error';
  }

  @override
  String get chatEmojiTooltip => 'אימוג\'י';

  @override
  String get statusPending => 'תָלוּי וְעוֹמֵד';

  @override
  String get statusSent => 'נשלח';

  @override
  String get statusRelayed => 'מועבר';

  @override
  String get statusDelivered => 'נמסר';

  @override
  String get statusRead => 'לִקְרוֹא';

  @override
  String get statusFailed => 'נִכשָׁל';

  @override
  String get chatCopy => 'לְהַעְתִיק';

  @override
  String get chatDeleteLocal => 'מחק במכשיר זה';

  @override
  String get chatDeletedLocalSnack => 'נמחק במכשיר זה';

  @override
  String get chatRetry => 'נסה שוב';

  @override
  String get chatSendFailed => 'לא נמסר - הקש על נסה שוב';

  @override
  String get chatImageNeedInternet => 'התחבר לאינטרנט כדי לשלוח תמונות';

  @override
  String get chatImageTooLargeOnline =>
      'לא ניתן היה לדחוס תמונה מספיק כדי לשלוח';

  @override
  String get chatOpenLinkFailed => 'לא ניתן היה לפתוח את הקישור';

  @override
  String get identityTitle => 'זֶהוּת';

  @override
  String get identityScanTooltip => 'סרוק QR עם מצלמה';

  @override
  String get identityCopiedHash => 'הועתק גיבוב של מפתח ציבורי';

  @override
  String get identityPeerSaved => 'עמית נשמר מ-QR';

  @override
  String get identityGalleryDenied => 'הרשאת ספריית התמונות נדחתה';

  @override
  String get identityQrSaved => 'QR נשמר בספריית התמונות';

  @override
  String identityQrSaveFailed(String error) {
    return 'לא ניתן לשמור את ה-QR: $error';
  }

  @override
  String get peersTitle => 'חברי רשת';

  @override
  String get qrScanTitle => 'סרוק QR כדי להוסיף חבר';

  @override
  String get qrInvalid => 'הסריקה נכשלה: QR לא חוקי';

  @override
  String get qrIdKeyMismatch => 'QR נדחה: המזהה אינו תואם מפתח ציבורי';

  @override
  String get qrCameraNotReady => 'המצלמה לא מוכנה';

  @override
  String get qrRetrySettings => 'נסה שוב / פתח את ההגדרות';

  @override
  String qrCameraOpenFailed(String error) {
    return 'לא ניתן היה לפתוח את המצלמה: $error';
  }

  @override
  String get qrScanAlignHint => 'יישר את קוד ה-QR בתוך המסגרת';

  @override
  String get firmwareDownloadTitle => 'הורד קושחה ESP32';

  @override
  String get firmwareSourceOnline => 'האחרון (מקוון)';

  @override
  String get firmwareSourceCached => 'עותק שמור (לא מקוון)';

  @override
  String get firmwareSourceBaseline => 'קו בסיס מאגד (לא מקוון)';

  @override
  String get firmwareSourceUnavailable => 'אין קושחה זמינה';

  @override
  String get firmwareBaselineIncompatible =>
      'הקושחה המצורפת ישנה מדי - התחבר לאינטרנט כדי להוריד גרסה חדשה יותר';

  @override
  String get firmwareChecksumFailed =>
      'בדיקת תקינות הקושחה נכשלה - מהבהבת חסומה';

  @override
  String firmwareReadyFromSource(String source) {
    return 'קושחה מוכנה: $source';
  }

  @override
  String get peersRefreshTooltip => 'לְרַעֲנֵן';

  @override
  String get peersBlocked => 'חָסוּם';

  @override
  String get peersNearbyBle => 'בקרבת מקום (BLE)';

  @override
  String get peersRecentlyOnline => 'לאחרונה באינטרנט';

  @override
  String get peersOnlineInArea => 'מקוון באזור';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'נראה לפני $minutes דקות';
  }

  @override
  String get peersOffline => 'לא מקוון';

  @override
  String peersBlockedSnack(String id) {
    return 'חסום $id';
  }

  @override
  String get peersUnblockedSnack => 'בוטלה החסימה';

  @override
  String get peersEmpty =>
      'עדיין אין חברים במסד הנתונים\nסרוק QR או המתן לגילוי רשת BLE';

  @override
  String get peersOpenChat => 'פתח צ\'אט';

  @override
  String get peersBlockAction => 'לַחסוֹם';

  @override
  String get peersUnblockAction => 'בטל את החסימה';

  @override
  String get channelPickerTooltip => 'צ\'אט / #mesh / אזור';

  @override
  String get locationPickerTooltip => 'ערוץ מיקום';

  @override
  String get transportPickerTooltip => 'רשת / אינטרנט / אוטומטי';

  @override
  String get onlinePeopleTooltip => 'אנשים באינטרנט';

  @override
  String get unreadDirectsTooltipEmpty => 'הודעות פרטיות';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count הודעות פרטיות שלא נקראו';
  }

  @override
  String get onlinePeopleTitle => 'אֲנָשִׁים';

  @override
  String get onlinePeopleEmpty => 'אף אחד עדיין לא מחובר כאן';

  @override
  String onlinePeopleCount(int count) {
    return '$count באינטרנט';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · קרוב + אזור';

  @override
  String get peerOnlineMeshTitle => 'מישהו קרוב על רשת';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name נמצא בקרבת מקום ברשת';
  }

  @override
  String get peerOnlineAreaTitle => 'מישהו מקוון באזור';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name מחובר דרך Nostr';
  }

  @override
  String get locationSheetTitle => '#ערוצי מיקום';

  @override
  String get channelPinsTitle => 'מוצמד';

  @override
  String get channelPinsHint =>
      'הצמד ערוצים שבהם אתה משתמש לעתים קרובות - הם נשארים בראש';

  @override
  String get channelPinTooltip => 'הצמד את הערוץ הזה';

  @override
  String get channelUnpinTooltip => 'לְהוֹצִיא סִיכָּה';

  @override
  String get locationSheetIntro =>
      'צ\'אט עם אנשים בקרבת מקום באמצעות גיאואש גס - לא GPS מדויק. נוכחות באינטרנט משתמשת במפתחות Nostr אנונימיים.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 מ\'';

  @override
  String get locationTeleportHint => '#גיאואש';

  @override
  String get locationTeleport => 'טלפורט';

  @override
  String homeComposeHint(String channel) {
    return 'הודעה $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'שלח אל $channel - ציבורי';
  }

  @override
  String get messageExpiryTitle => 'יפוג ב';

  @override
  String get voiceRecordTapToStart => 'הקש כדי להקליט הודעה קולית';

  @override
  String get voiceRecordTooShort => 'הקלטה קצרה מדי - נסה שוב';

  @override
  String get voiceRecordFailed => 'לא ניתן לשמור את ההקלטה - נסה שוב';

  @override
  String get voicePttHold => 'החזק כדי להקליט';

  @override
  String get voicePttRelease => 'שחרר לתצוגה מקדימה';

  @override
  String get voicePttRecording => 'הַקלָטָה…';

  @override
  String get voicePttDraftReady => 'הערה קולית מוכנה';

  @override
  String get voicePttDiscard => 'לְהַשְׁלִיך';

  @override
  String get voicePttReRecord => 'הקלט שוב';

  @override
  String get voicePttSend => 'שלח הערה קולית';

  @override
  String get voicePttPlayPreview => 'הפעל תצוגה מקדימה';

  @override
  String get voicePttStopPreview => 'עצור את התצוגה המקדימה';

  @override
  String get noticesBackfilling => 'טוען הודעות...';

  @override
  String get noticesNostrOnline => 'Nostr באינטרנט';

  @override
  String get noticesNostrOffline => 'Nostr במצב לא מקוון - עלון צריך אינטרנט';

  @override
  String noticesBackfillLoaded(int count) {
    return 'הודעות $count טעונות';
  }

  @override
  String get noticePublishFailed =>
      'לא ניתן לפרסם הודעה לוועדת האזור. בדוק את חיבור Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'נשמר באופן מקומי. התחבר לרדיו רשת קרוב (או שער Wi‑Fi) כדי שאחרים יוכלו לקבל אותו.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'עלון נשלח אל $count מכשירים קרובים מעל BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'נראו מכשירי רדיו בקרבת מקום, אך הכתיבה של BLE נכשלה. השאר את שתי האפליקציות פתוחות במסך ההודעות ונסה שוב (או השתמש בממסר ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'המקלט BLE של המכשיר הזה לא מוכן. החלף את ה-Bluetooth ופתח מחדש את ההודעות.';

  @override
  String get noticeDelete => 'מחק הודעה';

  @override
  String get noticeDeleteConfirmTitle => 'למחוק את ההודעה הזו?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'זה מסיר אותו רק במכשיר זה. אחרים שכבר קיבלו אותו עדיין יראו אותו.';

  @override
  String get noticeDeleted => 'ההודעה נמחקה';

  @override
  String get chatNoticeHidden => 'הודעת אזור — פתח את ההודעות';

  @override
  String get identityDisplayNameTitle => 'שם תצוגה';

  @override
  String get identitySaveName => 'שמור שם';

  @override
  String get identityUserIdLabel => 'מזהה משתמש (Public Key Hash)';

  @override
  String get identityCopyHashTooltip => 'העתק Hash של מפתח ציבורי';

  @override
  String get identityMyQrTitle => 'ה-QR שלי (מזהה + פאבKey + שם)';

  @override
  String identityQrFailed(String error) {
    return 'לא ניתן ליצור QR\n$error';
  }

  @override
  String get identitySaving => 'חִסָכוֹן…';

  @override
  String get identitySaveQr => 'שמור QR לספריית התמונות';

  @override
  String get identityOpenScanner => 'פתח את המצלמה כדי לסרוק QR';

  @override
  String get identityQrHelp =>
      'בקש מחבר לסרוק את זה כדי לשמור את המפתח הציבורי שלך ו(במידת הצורך) להגדיר אותך כמנפיק מאומת';

  @override
  String get identityChatTip =>
      'טיפ: אתה יכול גם לסרוק QR בצ\'אט כדי להוסיף מפתח ציבורי עבור E2EE';

  @override
  String get infoOpen => 'אודות / מידע';

  @override
  String get docsGuideTitle => 'מדריך למשתמש';

  @override
  String get docsGuideSubtitle => 'נפתח בדפדפן';

  @override
  String get docsOpenAction => 'פתח את המדריך';

  @override
  String get docsOpenFailed => 'לא ניתן היה לפתוח את המדריך למשתמש';

  @override
  String get firmwareOtaGuideTitle => 'מדריך פלאש ופרוטוקול OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'פותח את מדריך האינטרנט — הורדות .bin ושלבים מלאים';

  @override
  String get firmwareWebDownloadsTitle => 'הורדות קושחה באינטרנט';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'קישורים וסיכומי בדיקה לפי גרסה באתר docs';

  @override
  String get inviteCopyShortLink => 'העתק קישור קצר';

  @override
  String get inviteShareLink => 'שתף קישור';

  @override
  String get inviteShowFullLink => 'קישור מלא';

  @override
  String get inviteCopyFullLink => 'העתק את הקישור המלא';

  @override
  String get inviteLinkCopied => 'הקישור הועתק';

  @override
  String get inviteLongPressHint => 'לחץ לחיצה ארוכה לפעולות קישור';

  @override
  String get inviteSendInChat => 'שלח בצ\'אט ResilNet...';

  @override
  String get inviteSendInChatHint => 'רק אנשים שכבר יש לך מפתח ציבורי עבורם';

  @override
  String get inviteSendInChatEmpty =>
      'עדיין אין צ\'אטים שניתן לשלוח אליהם הודעות.\nתחילה סרוק QR, פתח אזור/רשת או שתף את הקישור מחוץ לאפליקציה.';

  @override
  String get inviteSentToChat => 'ההזמנה נשלחה בצ\'אט';

  @override
  String get infoTabInfo => 'מידע';

  @override
  String get infoTabSettingsHint =>
      'פתח את ההגדרות מהתפריט עבור כלי שפה, E2EE וכלי נתונים';

  @override
  String get infoHowToTitle => 'כיצד להשתמש';

  @override
  String get infoHowToBody =>
      '• הקש על סמל הערוץ כדי לעבור צ\'אט / #mesh / אזור\n• הקש על מקום כדי לבחור גודל גיאואש\n• הקש על אנשים עבור חברים או מי מחובר\n• פתח את Identity/QR מ-⋮ כדי להחליף מפתחות באופן אישי\n• אזור \"ציבורי\" שולח E2EE חתום לכל עמית מקוון - לא חדר טקסט רגיל';

  @override
  String get infoFeaturesTitle => 'תכונות';

  @override
  String get infoFeatureOffline =>
      'העברת הודעות לא מקוונות באמצעות Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'הצפנה מקצה לקצה עם RSA-OAEP + AES-GCM (לא רעש)';

  @override
  String get infoFeatureMultihop =>
      'הודעות יכולות לדלג בין עמיתים בקרבת מקום כדי להגיע רחוק יותר';

  @override
  String get infoFeatureBridge =>
      'רשת היברידית ↔ אינטרנט (Nostr) עבור מעטפות סגורות';

  @override
  String get infoFeatureGeo =>
      'ערוצי גיאואש מקומיים לאנשים בקרבת מקום (UX לגילוי)';

  @override
  String get infoFeatureNotices => 'הודעות עם תפוגה עבור #mesh ואזור';

  @override
  String get infoPrivacyTitle => 'פְּרָטִיוּת';

  @override
  String get infoPrivacyNoRoom => 'אין כפר בטקסט רגיל / חדר צ\'אט ציבורי ברשת';

  @override
  String get infoPrivacyFanout =>
      'אזור שליחת = מאוורר אטום 1:1 לעמיתים עם מפתחות ציבוריים ידועים';

  @override
  String get infoPrivacyPresence =>
      'נוכחות באזור אינטרנט משתמשת במפתחות Nostr ארעיים';

  @override
  String get infoSymbolsTitle => 'סמלים';

  @override
  String get infoSymBle => 'קישור בלוטות\' ישיר';

  @override
  String get infoSymMesh => 'ניתן להגיע באמצעות רשת (אחרים קדימה)';

  @override
  String get infoSymInternet => 'דרך האינטרנט (Nostr) - מעטפות סגורות';

  @override
  String get infoSymBridge => 'הגיע דרך גשר mesh↔אינטרנט';

  @override
  String get infoSymOffline => 'לא מקוון - לא ניתן להשיג כרגע';

  @override
  String get infoSymInArea => 'באזור של ערוץ מיקום זה';

  @override
  String get infoSymE2eeOk => 'הפעלה מוצפנת מקצה לקצה';

  @override
  String get infoSymE2eeFail => 'ההצפנה אינה זמינה - אל תשלח טקסט רגיש';

  @override
  String get infoSymVerified => 'זהות מאומתת / מפתח ידוע';

  @override
  String get infoSymBlocked => 'חָסוּם';

  @override
  String get infoSymUnread => 'הודעה פרטית שלא נקראה';

  @override
  String get infoEmergencyTitle => 'מצב חירום';

  @override
  String get infoEmergencyBody =>
      'הקש שלוש פעמים על הכותרת ResilNet במסך הבית כדי למחוק הודעות, מפתחות וזהות במכשיר זה.';

  @override
  String get infoLegendNote =>
      'כמה סמלי נתיב מתועדים כאן לצורך הבהירות; סימני משלוח בצ\'אט נשארים כסטטוס השליחה העיקרי.';

  @override
  String get dangerZoneTitle => 'אזור סכנה';

  @override
  String get dangerZoneSubtitle =>
      'מוחק הודעות, מפתחות הצפנה, זהות Nostr, עמיתים וכינויים במכשיר זה. אתה תגדיר שוב.';

  @override
  String get panicWipeTitle => 'מגבון חירום';

  @override
  String get panicWipeSubtitle =>
      'מחק כל דבר מקומי - כמו הקשה משולשת על שם הבית (הקשה כפולה מרעננת מכשירי רדיו)';

  @override
  String get panicWipeConfirmTitle => 'למחוק את כל הנתונים המקומיים?';

  @override
  String get panicWipeConfirmBody =>
      'פעולה זו מוחקת לצמיתות צ\'אטים, מפתחות וזהות בטלפון זה.\nעמיתים חייבים להחליף מחדש מפתחות QR עם הזהות החדשה שלך.\nלא ניתן לבטל זאת.';

  @override
  String get panicWipeAction => 'נגב הכל';

  @override
  String get panicWipeSnack => 'זהות מקומית נמחקה - הגדר שוב';

  @override
  String panicWipeFailed(String error) {
    return 'המחיקה נכשלה: $error';
  }

  @override
  String get meshBridgeTitle => 'גשר רשת';

  @override
  String get meshBridgeSubtitle =>
      'כשהם מופעלים (ברירת מחדל), מעטפות סגורות עשויות להשתמש הן ברשת BLE והן באינטרנט (Nostr) יחד כך שאיי רשת סמוכים יוכלו להתחבר. כשכבוי, שליחה השתמש בנתיב אחד בלבד - אף פעם לא שמה טקסט רגיל על החוט.';

  @override
  String get favoritesTitle => 'מועדפים';

  @override
  String get favoritesAdd => 'הוסף למועדפים';

  @override
  String get favoritesRemove => 'הסר מהמועדפים';

  @override
  String get favoritesEmpty => 'עדיין אין מועדפים - כוכב עמית מרשימת החברים';

  @override
  String get favoritesNearbyTitle => 'מועדף בקרבת מקום';

  @override
  String favoritesNearbyBody(String name) {
    return '$name נמצא בקרבת מקום ברשת';
  }

  @override
  String get favoritesInAreaTitle => 'מועדף באזור';

  @override
  String favoritesInAreaBody(String name) {
    return '$name מקוון באזור זה';
  }

  @override
  String get topologyTitle => 'טופולוגיה של רשת';

  @override
  String get topologySubtitle =>
      'עמיתים ורמזים לחיבור מהכרזה ברשת (לקריאה בלבד)';

  @override
  String get topologyConnectedNow => 'מחובר עכשיו (BLE)';

  @override
  String get topologyNearby => 'בקרבת מקום (BLE)';

  @override
  String get topologyKnown => 'עמיתים ידועים';

  @override
  String get topologyEmpty =>
      'עדיין לא למדו עמיתים - הישאר בקרבת מקום עם BLE פועל';

  @override
  String get topologyYou => 'אַתָה';

  @override
  String topologyStats(int peers, int links) {
    return '$peers עמיתים · $links קישורים';
  }

  @override
  String get topologyGraphHint =>
      'משוער מגילוי רשת בקרבת מקום - המכשיר שלך מודגש. הקש על עמית כדי לפתוח צ\'אט.';

  @override
  String get topologyOpen => 'טופולוגיה של רשת';

  @override
  String get slashHelpTitle => 'פקודות';

  @override
  String get slashHelpBody =>
      '/help - רשימה זו\n/מי - אנשים מקוונים בערוץ הנוכחי\n/drop <text> - הצמד כאן הודעה חתומה (E2EE מאוורר)\n\nמדריך מלא: השתמש במדריך פתח למטה, או בהגדרות ← מדריך למשתמש.';

  @override
  String get slashWhoEmpty => 'אף אחד לא מחובר בערוץ הזה כרגע';

  @override
  String slashWhoTitle(int count) {
    return 'מקוון ($count)';
  }

  @override
  String get slashDropNeedText => 'שימוש: /הורד את טקסט ההערה שלך';

  @override
  String slashDropDone(String channel) {
    return 'הוסר הודעה ב-$channel';
  }

  @override
  String get slashUnknown => 'פקודה לא ידועה - נסה /help';

  @override
  String get announceOpen => 'הכרזות';

  @override
  String get announceTitle => 'הכרזות';

  @override
  String get announceEmpty =>
      'עדיין אין לוחות - צור לוח כדי לפרסם הודעות נעולות או פתוחות';

  @override
  String get announceCreate => 'צור לוח';

  @override
  String get announceCreateHint => 'שם הלוח';

  @override
  String get announceDefaultTitle => 'מועצת קהילה';

  @override
  String get announceSettings => 'הגדרות לוח';

  @override
  String get announceAllowLocked => 'אפשר פוסטים נעולים (מוצפנים).';

  @override
  String get announceAllowLockedSub => 'מוצפן למפתח הלוח - קוראים צריכים גישה';

  @override
  String get announceAllowOpen => 'אפשר פוסטים פתוחים (טקסט פשוט).';

  @override
  String get announceAllowOpenSub =>
      'לא E2EE - קריא ברשת/ממסרים. כבוי כברירת מחדל.';

  @override
  String get announceComposeHint => 'כתוב הודעה…';

  @override
  String get announceMediaInternetOnly =>
      'הודעות תמונות/קוליות נשלחות דרך האינטרנט (לא BLE)';

  @override
  String get announceNeedInternet =>
      'התחבר לאינטרנט כדי לשלוח הודעות תמונות או קוליות';

  @override
  String announceVoiceFailed(String error) {
    return 'לא ניתן להקליט קול: $error';
  }

  @override
  String get announceImageTooLarge => 'התמונה גדולה מדי (מקסימום ~180 KB)';

  @override
  String get announcePlayVoice => 'הפעל הערה קולית';

  @override
  String get announceImageLabel => '📷 תמונה';

  @override
  String get announceAudioLabel => '🎤 הערה קולית';

  @override
  String get announceModeLocked => 'נָעוּל';

  @override
  String get announceModeOpen => 'לִפְתוֹחַ';

  @override
  String get announceOpenBadge => 'OPEN · לא מוצפן';

  @override
  String get announceLockedBadge => 'נָעוּל';

  @override
  String get announceLockedPlaceholder => 'מוצפן - בקש גישה לקריאה';

  @override
  String get announceRequestAccess => 'בקש/י גישה';

  @override
  String get announceRequestSent => 'בקשת גישה נשלחה לבעל הלוח';

  @override
  String get announceRequestFailed =>
      'לא ניתן לבקש גישה (צריך מפתח ציבורי של הבעלים)';

  @override
  String get announceOpenConfirmTitle => 'לפרסם ללא הצפנה?';

  @override
  String get announceOpenConfirmBody =>
      'פוסטים פתוחים אינם E2EE. כל מי שנמצא בנתיב (רשת / ממסרים) רשאי לקרוא אותם. לְהַמשִׁיך?';

  @override
  String get announcePostAction => 'שֶׁלְאַחַר';

  @override
  String get announcePendingRequests => 'בקשות גישה';

  @override
  String get announceApprove => 'לְאַשֵׁר';

  @override
  String get announceDeny => 'לְהַכּחִישׁ';

  @override
  String get announceGranted => 'אתה יכול לקרוא פוסטים נעולים בלוח הזה';

  @override
  String get announceOwner => 'אתה הבעלים של הלוח הזה';

  @override
  String get announceCopyInvite => 'העתק טקסט הזמנה';

  @override
  String get announceShowInviteQr => 'הצג QR להזמנה';

  @override
  String get announceScanInviteQr => 'סריקת לוח הזמנת QR';

  @override
  String get announceFollow => 'עקוב אחר הלוח מההזמנה';

  @override
  String get announceFollowHint =>
      'הדבק את טקסט ההזמנה או הקישור ResilNet מהבעלים';

  @override
  String get announceFollowOk => 'עוקב אחר לוח';

  @override
  String announceFollowOkNamed(String title) {
    return 'עכשיו עוקב אחרי \"$title\"';
  }

  @override
  String get announceFollowFail => 'ההזמנה לא חוקית או פגומה';

  @override
  String get announceInviteCopied => 'טקסט ההזמנה הועתק';

  @override
  String get announceInviteSaveQr => 'שמור QR';

  @override
  String get announceInviteShare => 'שתף הזמנה';

  @override
  String get announceFollowFromCompose => 'הזמנת לוח זוהתה בתיבת ההודעות';

  @override
  String get peerConfirmAddTitle => 'להוסיף חבר ברשת?';

  @override
  String peerConfirmAddBody(String name) {
    return 'האם להוסיף \"$name\" עם המפתח הציבורי שלהם כדי שתוכל לשלוח להם הודעה פרטית?';
  }

  @override
  String get peerConfirmAdd => 'הוסף חבר';

  @override
  String peerAddedOk(String name) {
    return 'נוסף $name לחברי הרשת';
  }

  @override
  String get peerAddFromCompose => 'זהות / מפתח ציבורי זוהה בתיבת ההודעה';

  @override
  String get peerHashCopied => 'הועתק גיבוב של מפתח ציבורי';

  @override
  String get peerHashOpenChat => 'פתח צ\'אט';

  @override
  String get peerHashAddHint =>
      'האש הועתק. בקש מהם לשתף את קישור הזהות שלהם או QR כדי שתוכל להוסיף את המפתח הציבורי המלא עבור E2EE.';

  @override
  String get peerQrNoCode => 'לא נמצא ResilNet QR בתמונה זו';

  @override
  String identityInviteSharePreamble(String name) {
    return 'זהות ResilNet: \"$name\"\nפתח את הקישור או הדבק אותו בצ\'אט ← הוסף חבר\nאו סרוק את ה-QR הזהות.';
  }

  @override
  String get identityShareInvite => 'שתף קישור זהות';

  @override
  String get identityInviteCopied => 'קישור הזהות הועתק';

  @override
  String announceInviteSharePreamble(String title) {
    return 'הזמנה למועצה: \"$title\"\nפתח את ResilNet ← לוחות קהילה ← עקוב מההזמנה\nאו סרוק את ה-QR / הקש על הקישור למטה.';
  }

  @override
  String get announceConfirmFollowTitle => 'לעקוב אחרי הלוח הזה?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'לעקוב אחרי \"$title\" מההזמנה הזו?';
  }

  @override
  String get announceConfirmFollow => 'לַעֲקוֹב';
}

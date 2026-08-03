// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'กำลังรีเฟรช ResilNet…';

  @override
  String get appRefreshed => 'รีเฟรชแล้ว — เชื่อมวิทยุและค้นหาใหม่แล้ว';

  @override
  String appRefreshFailed(String error) {
    return 'รีเฟรชไม่สำเร็จ: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'แตะสองครั้ง = รีเฟรชเบา · กดค้าง = กู้หนัก · แตะสามครั้ง = ล้างฉุกเฉิน';

  @override
  String get softRefreshTipTitle => 'ถ้าแอปดูนิ่งหรือค้าง';

  @override
  String get softRefreshTipBody =>
      'แตะชื่อ ResilNet สองครั้งเพื่อรีเฟรชวิทยุ หากยังค้าง: กดค้างที่ชื่อ หรือ ⋮ / ตั้งค่า → กู้แอป แตะสามครั้ง = ล้างฉุกเฉินเมื่อตั้งใจเท่านั้น';

  @override
  String get softRefreshTipGotIt => 'เข้าใจแล้ว';

  @override
  String get infoSoftRefreshTitle => 'ถ้าแอปดูนิ่งหรือค้าง';

  @override
  String get infoSoftRefreshStepRefresh =>
      'แตะชื่อ ResilNet มุมซ้ายบนสองครั้ง → รีเฟรชวิทยุและคนใกล้ ๆ';

  @override
  String get infoSoftRefreshStepHard =>
      'ยังค้าง? กดค้างที่ชื่อ หรือ ⋮ / ตั้งค่า → กู้แอป';

  @override
  String get infoSoftRefreshStepWait =>
      'รอผลแล้วลองใหม่ — รีเซ็ตเซสชันจะเก็บกุญแจไว้';

  @override
  String get infoSoftRefreshStepWipe =>
      'แตะสามครั้ง = ล้างข้อมูลฉุกเฉิน (ลบข้อมูลในเครื่อง) — ใช้เมื่อตั้งใจเท่านั้น';

  @override
  String get appRecoverySection => 'กู้แอป';

  @override
  String get appRecoverySectionSubtitle =>
      'ใช้เมื่อแอปค้าง รีเฟรชเบา = แตะชื่อสองครั้ง · กู้หนักแรงกว่า · รีเซ็ตเซสชันไม่ลบกุญแจ';

  @override
  String get appHardRecoverAction => 'กู้แอป (Hard recover)';

  @override
  String get appHardRecovering => 'กำลังกู้แอป…';

  @override
  String get appSessionResetAction => 'รีเซ็ตเซสชัน';

  @override
  String get appSessionResetRunning => 'กำลังรีเซ็ตเซสชัน…';

  @override
  String get appSessionResetConfirmTitle => 'รีเซ็ตเซสชัน?';

  @override
  String get appSessionResetConfirmBody =>
      'รีสตาร์ทบริการ ResilNet บนเครื่องนี้ กุญแจตัวตนยังอยู่';

  @override
  String get appRecoveryBusy => 'กำลังกู้อยู่แล้ว…';

  @override
  String get appRecoveryOk => 'กู้เสร็จแล้ว';

  @override
  String get appRecoveryPartial => 'กู้เสร็จบางส่วน — ถ้ายังค้างให้ลองอีกครั้ง';

  @override
  String get appRecoveryFailed =>
      'กู้ไม่สำเร็จ — ลองรีเซ็ตเซสชัน หรือบังคับปิดแอปจากระบบ';

  @override
  String get localWifiTitle => 'Wi‑Fi ท้องถิ่น';

  @override
  String get localWifiSubtitle =>
      'เชื่อมเครื่องใกล้ ๆ โดยไม่ต้องมีอินเทอร์เน็ต — อยู่เครือข่ายท้องถิ่นเดียวกัน';

  @override
  String get localWifiNotGatewayHint =>
      'ไม่ใช่ SoftAP ของเกตเวย์ ESP32 LoRa — นี่คือมือถือ↔มือถือ / LAN เท่านั้น';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi ท้องถิ่นยังไม่พร้อม — รอแอปเริ่มระบบก่อน';

  @override
  String get lxmfBridgeTitle => 'โหนดบ้าน';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac หรือ Pi บน Wi‑Fi บ้านที่ช่วยส่งแชทที่เข้ารหัสแล้ว — ปิดเป็นค่าเริ่มต้น ไม่แทนที่การเข้ารหัสปลายทาง';

  @override
  String get lxmfBridgeEnable => 'ใช้โหนดบ้าน';

  @override
  String get lxmfBridgeDisabledHint =>
      'เปิดเมื่อรันโปรแกรม bridge บน Mac/Pi ในเครือข่ายนี้แล้วเท่านั้น';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'ออนไลน์ — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'ติดต่อโหนดบ้านไม่ได้ — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'ที่อยู่โหนดบ้าน';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP หรือ http://IP:พอร์ต เช่น 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'บันทึกและรีเฟรชสถานะ';

  @override
  String get lxmfBridgeLabHint => 'ขั้นสูง: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'ตั้งค่าโหนดบ้าน';

  @override
  String get lxmfBridgeCheckConnection => 'ตรวจการเชื่อมต่อ';

  @override
  String get lxmfBridgeStatusOnline => 'เชื่อมต่อโหนดบ้านแล้ว';

  @override
  String get lxmfBridgeStatusOffline => 'ยังถึงโหนดบ้านไม่ได้';

  @override
  String get lxmfBridgeYourDest => 'ที่อยู่โหนดนี้ (แชร์ให้เพื่อน)';

  @override
  String get lxmfBridgeCopyDest => 'คัดลอกที่อยู่';

  @override
  String get lxmfBridgeDestCopied => 'คัดลอกแล้ว';

  @override
  String get lxmfBridgeLinkedPeers => 'เพื่อนที่ผูกแล้ว';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'ผูกที่อยู่โหนดบ้านของเพื่อนหนึ่งครั้ง แล้วแชทที่เข้ารหัสสามารถใช้เส้นทางนี้ได้';

  @override
  String get lxmfBridgeNoLinks => 'ยังไม่ได้ผูกเพื่อน';

  @override
  String get lxmfBridgeAddLink => 'ผูกเพื่อน';

  @override
  String get lxmfBridgePickPeer => 'เพื่อน';

  @override
  String get lxmfBridgePeerDest => 'ที่อยู่โหนดบ้านของเขา';

  @override
  String get lxmfBridgePeerDestHint => 'รหัส 32 ตัวจากหน้าโหนดบ้านของเขา';

  @override
  String get lxmfBridgeInvalidDest =>
      'ที่อยู่ไม่ถูกต้อง — วางรหัสเต็มจากหน้าโหนดบ้านของเพื่อน';

  @override
  String get lxmfBridgeRemoveLink => 'เลิกผูก';

  @override
  String get lxmfBridgeSaveLink => 'บันทึก';

  @override
  String get lxmfBridgeLinkSaved => 'ผูกเพื่อนแล้ว';

  @override
  String get lxmfBridgeNoPeers =>
      'ยังไม่มีผู้ติดต่อที่ส่งข้อความได้ — เพิ่มเพื่อนก่อน';

  @override
  String get lxmfBridgeHelp =>
      'ให้โปรแกรม bridge บน Mac/Pi ทำงานอยู่ เส้นทางนี้อยู่ใน LAN — ไม่ใช่ LoRa และไม่แทนที่อินเทอร์เน็ตหรือ Bluetooth mesh';

  @override
  String get localWifiModeHotspot => 'ใกล้ตัว';

  @override
  String get localWifiModeRouter => 'เราเตอร์';

  @override
  String get localWifiHotspotIntro =>
      'เครื่องหนึ่งเปิด Personal Hotspot อีกเครื่องเข้าร่วม แล้วให้ ResilNet ค้นหาบนเครือข่ายท้องถิ่น';

  @override
  String get localWifiHostAction => 'สร้างเครือข่าย (Host)';

  @override
  String get localWifiJoinAction => 'เข้าร่วมเครือข่าย';

  @override
  String get localWifiHostSteps =>
      '1. ไปที่ตั้งค่าเครื่อง เปิด Personal Hotspot (หรือแชร์อินเทอร์เน็ต)\n2. บอกชื่อฮอตสปอต (และรหัส) ให้เพื่อน\n3. กลับมาที่นี่แล้วแตะ “เปิดฮอตสปอตแล้ว — เริ่มรอ”';

  @override
  String get localWifiHostReady => 'เปิดฮอตสปอตแล้ว — เริ่มรอ';

  @override
  String get localWifiHostWaiting => 'รอเพื่อนเข้าร่วม…';

  @override
  String get localWifiJoinSteps =>
      '1. ไปตั้งค่าเครื่อง แล้วเชื่อม Personal Hotspot ของเพื่อน\n2. กลับมาที่นี่แล้วแตะ “ฉันเชื่อมแล้ว — ค้นหา”';

  @override
  String get localWifiJoinReady => 'ฉันเชื่อมแล้ว — ค้นหา';

  @override
  String get localWifiRouterIntro =>
      'ให้ทุกเครื่องเชื่อม Wi‑Fi เราเตอร์/AP เดียวกัน — เราเตอร์ไม่จำเป็นต้องมีเน็ต แค่เครือข่ายท้องถิ่นร่วมกัน';

  @override
  String get localWifiRouterSearch => 'ค้นหาบน Wi‑Fi นี้';

  @override
  String get localWifiRefreshNetwork => 'รีเฟรชข้อมูล Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'ยังไม่ได้อยู่บน Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'ไปเชื่อม Wi‑Fi ของเราเตอร์ในตั้งค่าระบบ แล้วค้นหาอีกครั้ง';

  @override
  String get localWifiDiscovering => 'กำลังค้นหาบน Wi‑Fi ท้องถิ่น…';

  @override
  String get localWifiPeersFound => 'เครื่องบนเครือข่ายนี้';

  @override
  String get localWifiStop => 'หยุด';

  @override
  String get localWifiSsidUnknown => 'อ่านชื่อ Wi‑Fi ไม่ได้';

  @override
  String get localWifiStubBanner => 'กำลังเปิดซ็อกเก็ต LAN…';

  @override
  String get localWifiLiveBanner =>
      'ค้นหาบน LAN ทำงานแล้ว (UDP) — ประกาศตัวตน + แชทแบบ sealed บน Wi‑Fi นี้';

  @override
  String get localWifiEmptyHotspot =>
      'ยังไม่พบเครื่อง\nตรวจว่าเพื่อนเข้าฮอตสปอตแล้ว และอนุญาต Local Network';

  @override
  String get localWifiEmptyRouter =>
      'ยังไม่พบเครื่อง\nSSID เดียวกัน? อนุญาต Local Network? บางเราเตอร์ปิดการคุยระหว่างเครื่อง (AP isolation)';

  @override
  String get localWifiIsolationHelp => 'ทำไมหากันไม่เจอ?';

  @override
  String get localWifiIsolationTitle => 'เราเตอร์อาจแยกคลายเอนต์';

  @override
  String get localWifiIsolationBody =>
      'ถ้าเปิด AP/Client isolation หรือใช้ guest network มือถือบน Wi‑Fi เดียวกันจะคุยกันไม่ได้ — ปิด isolation หรือใช้โหมดใกล้ตัว (Hotspot)';

  @override
  String get localWifiPeerReady => 'พร้อมแชท (มีกุญแจ)';

  @override
  String get localWifiPeerNeedKey => 'พบแล้ว — สแกน QR เพื่อแลกกุญแจ';

  @override
  String get localWifiErrorTitle => 'Wi‑Fi ท้องถิ่นผิดพลาด';

  @override
  String get localWifiErrorBody => 'มีปัญหา หยุดแล้วลองใหม่';

  @override
  String get preparingSystem => 'กำลังเตรียมระบบ…';

  @override
  String get bootFailedTitle => 'เริ่มระบบไม่สำเร็จ';

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get bootRecoveryAction => 'เริ่มตัวตนใหม่ (ลบข้อมูลในเครื่อง)';

  @override
  String get bootRecoveryConfirmTitle => 'เริ่มตัวตนใหม่?';

  @override
  String get bootRecoveryConfirmBody =>
      'การกระทำนี้จะลบแชท กุญแจ และตัวตนในเครื่องนี้ถาวร\nเพื่อนต้องสแกน QR ของคุณใหม่\nย้อนกลับไม่ได้';

  @override
  String get bootRecoveryRunning => 'กำลังรีเซ็ตตัวตนในเครื่อง…';

  @override
  String get bootRecoverySuccess => 'รีเซ็ตตัวตนในเครื่องแล้ว';

  @override
  String bootRecoveryFailed(String error) {
    return 'รีเซ็ตตัวตนไม่สำเร็จ: $error';
  }

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get save => 'บันทึก';

  @override
  String get close => 'ปิด';

  @override
  String get start => 'เริ่ม';

  @override
  String get send => 'ส่ง';

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSubtitle =>
      'ตามภาษาเครื่องเมื่อเป็นไทยหรืออังกฤษ — ภาษาอื่นของระบบใช้อังกฤษ หรือล็อกเป็นไทย / อังกฤษที่นี่';

  @override
  String get languageSystem => 'ตามระบบ';

  @override
  String get languageThai => 'ไทย';

  @override
  String get languageEnglish => 'English';

  @override
  String get notificationsTooltip => 'การตั้งค่าแจ้งเตือน';

  @override
  String get enableMessageNotifications => 'เปิดแจ้งเตือนข้อความ';

  @override
  String get settingsNotificationsSubtitle =>
      'ข้อความ 1:1 และคนออนไลน์ (แจ้งเตือนในเครื่อง)';

  @override
  String get networkMembersTooltip => 'สมาชิกเครือข่าย';

  @override
  String get identityQrTooltip => 'ตัวตน/QR';

  @override
  String get feedDirects => 'แชท';

  @override
  String get feedMesh => '#mesh';

  @override
  String get feedGeo => 'พื้นที่';

  @override
  String get feedDirectsSubtitle => 'ข้อความส่วนตัว E2EE';

  @override
  String get feedMeshSubtitle => 'เพื่อนใกล้ตัว (BLE)';

  @override
  String get feedGeoSubtitle => 'ช่องตาม geohash (ค้นพบ)';

  @override
  String get peerIdHint => 'วาง Receiver ID (Public Key Hash) เพื่อเริ่มแชต';

  @override
  String get directsEmpty =>
      'ยังไม่มีแชต — สแกน QR หรือวาง Receiver ID เพื่อเริ่ม\nข้อความถูกผนึก E2EE ก่อนส่ง (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • แตะเพื่อเปิดแชต';

  @override
  String get meshIntro =>
      'เพื่อนในรัศมี BLE — แตะเพื่อแชตส่วนตัว E2EE (ไม่มีช่องพิมพ์สาธารณะใน #mesh)\nส่งผ่าน hybrid router (BLE + LoRa + Nostr เมื่อออนไลน์)';

  @override
  String get meshEmptyRunning =>
      'ยังไม่พบเพื่อนใกล้ตัว — เปิดแอปคู่อีกเครื่องในระยะ BLE';

  @override
  String get meshEmptyStopped =>
      'BLE ยังไม่ทำงาน — ขอสิทธิ์ Bluetooth / Location';

  @override
  String get meshNearbyPrefix => 'ใกล้ตัว';

  @override
  String get meshRetentionTitle => 'ลบข้อความอัตโนมัติ';

  @override
  String get meshRetentionSubtitle =>
      'ลบประวัติแชตในเครื่องที่เก่ากว่าช่วงที่เลือก';

  @override
  String get meshRetentionKeep => 'เก็บไว้';

  @override
  String get meshRetention1Day => '1 วัน';

  @override
  String get meshRetention3Days => '3 วัน';

  @override
  String get meshRetention7Days => '7 วัน';

  @override
  String get refreshLocationTooltip => 'รีเฟรชพิกัด';

  @override
  String get geoIntro =>
      'คนที่ออนไลน์ใน geohash นี้ ส่งได้ทั้ง 1:1 และสาธารณะในพื้นที่ (ยังผนึก E2EE รายคน — ไม่ใช่ plaintext)';

  @override
  String geoEmpty(String channel) {
    return 'ยังไม่มีใครออนไลน์ใน $channel\nใช้ Transport → Internet/Auto รอ Nostr แล้วรีเฟรชพิกัด';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'ออนไลน์ใน $channel • แตะเพื่อแชต 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'ใกล้ตัว (รอ presence พื้นที่) • แตะเพื่อแชต 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'เห็นบน Nostr ใน $channel • ค้นพบอย่างเดียว (มรดก)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'presence นิรนามแบบเก่า — รอ peer ที่ผูกกุญแจ หรือสแกน QR';

  @override
  String get bleRadioNearbySubtitle =>
      'สัญญาณ BLE ใกล้ตัว — สแกน QR เพื่อแชท 1:1';

  @override
  String get geoInternetDiscoverHint =>
      'การค้นพบ Area ผ่านเน็ตต้องต่อ Nostr (Settings → Transport → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'ยังไม่ได้พิกัด — อนุญาต GPS แล้วกด refresh เพื่อประกาศ geohash บน Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'ไม่อนุญาตตำแหน่ง — เปิดใน Settings → Privacy → Location';

  @override
  String get geoEmptyServicesDisabled =>
      'ปิด Location Services — เปิดใน Settings';

  @override
  String get geoEmptyNoGpsFix =>
      'หาพิกัดไม่ได้ (iPad Wi‑Fi มักเจอ) — ใส่ geohash เองด้านล่าง';

  @override
  String get geoEmptyTeleportHint =>
      'แตะไอคอนสถานที่ → ใส่ geohash (เช่น w5) → เทเลพอร์ต';

  @override
  String get geoSetGeohashManually => 'ใส่ geohash';

  @override
  String get geoTeleportHint =>
      'ไม่มี GPS? ใส่ geohash 2–7 ตัว (เช่น w5) แล้วกดเทเลพอร์ต';

  @override
  String get geoTeleportInvalid =>
      'geohash ไม่ถูกต้อง — ใช้ตัวอักษร base32 เท่านั้น (เช่น w5 หรือ w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'ตั้ง Area เป็น $channel แล้ว';
  }

  @override
  String geoManualActive(String channel) {
    return 'Area แบบ manual: $channel (refresh GPS จะทับค่านี้)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr ยังไม่พร้อม — กด Reconnect (จะเป็น 0/0 จนกว่า init สำเร็จ)';

  @override
  String get geoEmptyMeshOnly =>
      'Transport เป็น Mesh อย่างเดียว — เปลี่ยนเป็น Internet หรือ Auto เพื่อค้นหาผ่าน Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'ยังไม่มีใครใน $channel — เปิด Area + Internet ทั้งสองเครื่อง แล้วรอ ~60 วินาที';
  }

  @override
  String get geoChannelFallback => '#area';

  @override
  String get geoRefreshLocation => 'Refresh ตำแหน่ง';

  @override
  String get settingsClearLocationTitle => 'ลบพิกัดตำแหน่ง';

  @override
  String get settingsClearLocationSubtitle =>
      'ลบ GPS / geohash ที่เทเลพอร์ตไว้ (Area กลับเป็น #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'ลบพิกัด?';

  @override
  String get settingsClearLocationConfirmBody =>
      'ลบ geohash ที่เก็บในเครื่องนี้ คุณสามารถรีเฟรช GPS หรือเทเลพอร์ตใหม่ได้ภายหลัง';

  @override
  String get settingsClearLocationAction => 'ลบพิกัด';

  @override
  String get settingsClearLocationSnack => 'ลบพิกัดแล้ว';

  @override
  String get chatVoiceTooLarge => 'ข้อความเสียงใหญ่เกินไป — สูงสุด ~30 วินาที';

  @override
  String get chatVoiceNeedInternet =>
      'ข้อความเสียงต้องใช้ Internet (Nostr) — ใหญ่เกินสำหรับ BLE อย่างเดียว';

  @override
  String get chatVoiceSentInternet => 'ส่งข้อความเสียงผ่าน Internet แล้ว';

  @override
  String get noticeAnonMention => 'mention';

  @override
  String get noticeAnonDm => 'ข้อความตรง';

  @override
  String get noticeAnonHug => 'hug';

  @override
  String get noticeAnonSlap => 'slap';

  @override
  String get noticeAnonBlock => 'บล็อก';

  @override
  String get noticeAnonNeedKey => 'ยังไม่มีกุญแจสาธารณะ — แลก QR ก่อนส่ง 1:1';

  @override
  String get noticeAnonActionSent => 'ส่งแล้ว';

  @override
  String noticeAnonBlocked(String anon) {
    return 'บล็อก $anon แล้ว';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* กอด $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* ตบ $anon *';
  }

  @override
  String get geoReconnectNostr => 'Reconnect Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relays';

  @override
  String get nostrSectionSubtitle =>
      'ข้อความผ่านอินเทอร์เน็ตและการค้นหา Area ใช้ relay เหล่านี้ หากออฟไลน์ค้าง ให้กด reconnect';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'เชื่อมต่อแล้ว $connected/$total';
  }

  @override
  String get nostrStatusOffline => 'ออฟไลน์ — มีรายการ relay แต่ยังไม่ต่อ';

  @override
  String get nostrStatusNotInit =>
      'ยังไม่เริ่ม (0/0) — กด Reconnect เพื่อเริ่มระบบ';

  @override
  String get nostrReconnectAction => 'Reconnect Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'เชื่อม Nostr แล้ว ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'ยังออฟไลน์ — ตรวจ Wi‑Fi/เซลลูลาร์ หรือลองใหม่';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'ล้มเหลว: $error';
  }

  @override
  String get nostrReconnecting => 'กำลังเชื่อม relay…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'อินเทอร์เน็ต (Nostr) ใน $channel • พร้อมแชตผนึก';
  }

  @override
  String get transportModeTitle => 'ช่องทางพื้นที่';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE ใกล้ตัว (radio) เมื่อไม่มี Nostr · Internet & Auto = รายชื่อจาก Nostr';

  @override
  String get transportModeMesh => 'Mesh';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

  @override
  String get geoPublicHint => 'ข้อความสาธารณะถึงทุกคนที่ออนไลน์ในพื้นที่นี้';

  @override
  String get geoPublicSend => 'สาธารณะ';

  @override
  String geoPublicHelp(int count) {
    return 'ส่งแบบผนึกถึง $count คนที่ออนไลน์ — แต่ละคนได้ซองส่วนตัว';
  }

  @override
  String geoPublicSent(int count) {
    return 'ส่งแล้วถึง $count คนในพื้นที่';
  }

  @override
  String get geoPublicSentNone =>
      'ยังไม่มีเพื่อนที่ส่งถึงได้ — เปิด Area/Mesh ให้มีคนที่ผูกคีย์แล้ว หรือรอ BLE/Nostr';

  @override
  String get areaPublicBadge => 'สาธารณะในพื้นที่';

  @override
  String get geoErrorPermission => 'ไม่สามารถอ่านพิกัดได้ — ตรวจสิทธิ์ตำแหน่ง';

  @override
  String get geoPrecisionRegion => 'ภูมิภาค';

  @override
  String get geoPrecisionProvince => 'จังหวัด';

  @override
  String get geoPrecisionCity => 'เมือง';

  @override
  String get geoPrecisionNeighborhood => 'ย่าน';

  @override
  String get geoPrecisionBlock => 'บล็อก';

  @override
  String get aliasTitle => 'ตั้งชื่อเล่น (Contact Alias)';

  @override
  String get aliasHintBody =>
      'Alias นี้เก็บในเครื่องเท่านั้น (Local-only)\nไม่ถูกส่งออกไปกับระบบ E2EE';

  @override
  String get aliasLabel => 'ชื่อเล่น';

  @override
  String get aliasHint => 'เช่น “ผู้ใหญ่บ้าน”, “พี่สมชาย”…';

  @override
  String get settingsDevices => 'อุปกรณ์';

  @override
  String get settingsFirmwareTitle => 'ดาวน์โหลด/อัปเดตเฟิร์มแวร์ ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'ดาวน์โหลดไฟล์ .bin และอัปเดตแอป/บอร์ด ESP32 ผ่าน OTA';

  @override
  String get mtBridgeTitle => 'สะพาน Meshtastic';

  @override
  String get mtBridgeSettingsSubtitle =>
      'สะพานข้อความสั้นโหมด A/B — ไม่ใช่ E2EE ของ ResilNet';

  @override
  String get mtBridgeIntro =>
      'ส่งข้อความสั้นแบบ plaintext ระหว่าง Meshtastic กับ ResilNet โหมด A กับ B ใช้พร้อมกันไม่ได้ และไม่ใช่การเข้ารหัสปลายทางถึงปลายทาง';

  @override
  String get mtBridgeModeLabel => 'โหมด';

  @override
  String get mtBridgeModeOff => 'ปิด';

  @override
  String get mtBridgeModeA => 'รับเข้า A';

  @override
  String get mtBridgeModeB => 'ส่งออก B';

  @override
  String get mtBridgeModeOffShort => 'ปิด';

  @override
  String get mtBridgeModeAShort => 'รับ A';

  @override
  String get mtBridgeModeBShort => 'ส่ง B';

  @override
  String get mtBridgeMutexHint =>
      'เลือกโหมดหนึ่งจะปิดอีกโหมดโดยอัตโนมัติ — ไม่รองรับเปิด A และ B พร้อมกัน';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'ทดลอง (logging)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'ข้อความขาเข้าจะอยู่ในประกาศเป็น #meshtastic การทวนขึ้น mesh เป็นทางเลือก (ปิดเป็นค่าเริ่มต้น)';

  @override
  String get mtBridgeRelayTitle => 'ทวนขึ้น mesh ของ ResilNet ด้วย';

  @override
  String get mtBridgeRelayHint =>
      'เมื่อเปิด จะกระจายประกาศสาธารณะที่เซ็นแล้ว ปิด = เก็บในประกาศของเครื่องนี้เท่านั้น';

  @override
  String get mtBridgeSimulateHint => 'ข้อความทดลอง';

  @override
  String get mtBridgeSimulate => 'จำลองข้อความจาก Meshtastic';

  @override
  String get mtBridgeIngestOk => 'รับเข้าประกาศแล้ว (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'คำเตือน: ข้อความที่ส่งตรงนี้ไม่ใช่ E2EE ของ ResilNet ผู้ที่อยู่บนเส้นทาง Meshtastic อ่านได้';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'ข้อความที่จะส่ง';

  @override
  String get mtBridgeSend => 'ส่งไป Meshtastic';

  @override
  String get mtBridgeEgressOk => 'จัดคิวไป Meshtastic แล้ว (ดู log / ประวัติ)';

  @override
  String get mtBridgeLastEgress => 'ข้อความส่งออกล่าสุด';

  @override
  String get mtBridgeEgressHistory => 'ประวัติส่งออก';

  @override
  String get mtBridgeOffHint =>
      'เปิดโหมดรับเข้า (A) หรือส่งออก (B) เพื่อใช้สะพาน';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIC · ไม่ใช่ E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'ใช้ MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'ปิด = ทดลองในเครื่องเท่านั้น (ไม่รับ MQTT เข้า) เปิด = ใช้ MQTT เมื่อเชื่อมต่อแล้ว';

  @override
  String get mtBridgeMqttHost => 'โฮสต์ broker';

  @override
  String get mtBridgeMqttPort => 'พอร์ต';

  @override
  String get mtBridgeMqttTls => 'ใช้ TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'พอร์ตทั่วไป 8883 ใช้ใบรับรองของระบบ — ล้มเหลวแบบชัดเจนถ้า handshake ไม่ผ่าน';

  @override
  String get mtBridgeMqttAutoReconnect => 'เชื่อมต่อใหม่อัตโนมัติ';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'เมื่อเปิด ลูกค้าจะพยายามเชื่อมใหม่หลังหลุด สถานะจะเป็น Connecting จนกลับมา';

  @override
  String get mtBridgeMqttTopicHelpers => 'ตัวช่วยท็อปิก';

  @override
  String get mtBridgeMqttRegion => 'คำนำหน้า region (ถ้ามี)';

  @override
  String get mtBridgeMqttRegionHint =>
      'ถ้ามีค่า กด Apply จะสร้างราก msh/<region>/2/json (ทับ topic root)';

  @override
  String get mtBridgeMqttTopicRoot => 'รากท็อปิก JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'ชื่อช่อง downlink';

  @override
  String get mtBridgeMqttApplyTopics => 'ใช้ราก → ท็อปิก subscribe / publish';

  @override
  String get mtBridgeMqttAdvanced => 'MQTT ขั้นสูง';

  @override
  String get mtBridgeMqttAdvancedHint => 'TLS, เชื่อมใหม่, ท็อปิก, รหัสผ่าน';

  @override
  String get mtBridgeMqttTopicIn => 'ท็อปิก subscribe';

  @override
  String get mtBridgeMqttTopicOut => 'ท็อปิก publish';

  @override
  String get mtBridgeMqttGatewayFrom => 'Node id ของเกตเวย์ (from)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'เลขทศนิยม หรือ !hex — จำเป็นสำหรับ sendtext';

  @override
  String get mtBridgeMqttChannelIndex => 'ดัชนีช่อง mesh (ถ้ามี 0–7)';

  @override
  String get mtBridgeMqttUser => 'ชื่อผู้ใช้ (ถ้ามี)';

  @override
  String get mtBridgeMqttPass => 'รหัสผ่าน (ถ้ามี)';

  @override
  String get mtBridgeMqttPassStored =>
      'มีรหัสผ่านเก็บในเครื่องแล้ว (ไม่แสดงค่า)';

  @override
  String get mtBridgeMqttPassReplace => 'รหัสผ่านใหม่ (ว่าง = คงของเดิม)';

  @override
  String get mtBridgeMqttPassReplaceHint => 'เว้นว่างเพื่อคงรหัสผ่านที่เก็บไว้';

  @override
  String get mtBridgeMqttPassClear => 'ล้างรหัสผ่าน';

  @override
  String get mtBridgeMqttSave => 'บันทึก MQTT';

  @override
  String get mtBridgeMqttSaved => 'บันทึกการตั้งค่า MQTT แล้ว';

  @override
  String get mtBridgeMqttConnect => 'เชื่อมต่อ';

  @override
  String get mtBridgeMqttDisconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get mtBridgeMqttConnected => 'MQTT เชื่อมต่อแล้ว';

  @override
  String get mtBridgeMqttConnecting => 'กำลังเชื่อม MQTT…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT ยังไม่เชื่อมต่อ';

  @override
  String get mtBridgeMqttError => 'MQTT ผิดพลาด';

  @override
  String get mtBridgeErrModeIngest => 'สลับเป็นโหมดรับเข้า (A) ก่อน';

  @override
  String get mtBridgeErrModeEgress => 'สลับเป็นโหมดส่งออก (B) ก่อน';

  @override
  String get mtBridgeErrRate => 'ช้าลง — จำกัดอัตราการส่ง';

  @override
  String get mtBridgeErrDedupe => 'ข้อความซ้ำ ข้ามแล้ว';

  @override
  String get mtBridgeErrLoop => 'ตัดทิ้งเพื่อกันลูปของสะพาน';

  @override
  String get mtBridgeErrEmpty => 'ข้อความว่าง';

  @override
  String get mtBridgeErrPublish => 'ส่งไม่สำเร็จ';

  @override
  String get mtBridgeErrNotConnected => 'ยังไม่ได้เชื่อม MQTT';

  @override
  String get mtBridgeErrMissingHost => 'กรอกโฮสต์ MQTT';

  @override
  String get mtBridgeErrMissingTopic => 'กรอกท็อปิก subscribe และ publish';

  @override
  String get mtBridgeErrMissingFromNode =>
      'กรอก node id ของเกตเวย์ (from) สำหรับ sendtext';

  @override
  String get mtBridgeErrConnect => 'เชื่อม MQTT ไม่สำเร็จ';

  @override
  String get mtBridgeErrConnectTls => 'เชื่อม MQTT แบบ TLS ไม่สำเร็จ';

  @override
  String get settingsData => 'จัดการข้อมูล';

  @override
  String get settingsDataHint =>
      'ลบข้อความในเครื่องเพื่อลดขนาดฐานข้อมูล — ไม่กระทบตัวตน คีย์ หรือรายชื่อเพื่อน';

  @override
  String get settingsSaveHistoryTitle => 'บันทึกประวัติข้อความ';

  @override
  String get settingsSaveHistorySubtitle =>
      'เมื่อปิด ข้อความยังถูกเข้ารหัส E2EE ตอนส่ง และเก็บเฉพาะในเซสชันนี้ (ไม่ลงประวัติแชต) — ข้อความที่คุณพิมพ์ยังอ่านได้บนเครื่องนี้';

  @override
  String get settingsPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get settingsE2eeTitle => 'การเข้ารหัสปลายทางถึงปลายทาง (E2EE)';

  @override
  String get settingsE2eeSubtitle =>
      'เปิดตลอด — ผนึกข้อความด้วย RSA-OAEP + AES-GCM ก่อนส่ง โหนดกลางอ่านเนื้อหาไม่ได้';

  @override
  String get settingsScreenshotTitle => 'แจ้งเตือนการแคปหน้าจอ';

  @override
  String get settingsScreenshotSubtitle =>
      'แสดงบรรทัดระบบในแชตเมื่ออุปกรณ์นี้แคปหน้าจอ';

  @override
  String get settingsNostrExpiryTitle => 'ระยะเวลาเก็บข้อความบน Nostr';

  @override
  String get settingsNostrExpirySubtitle =>
      'ระยะที่ซองข้อความควรคงอยู่บนเครื่องเมื่อส่งผ่าน Nostr';

  @override
  String get noticeExpiresIn => 'หมดอายุใน';

  @override
  String get noticesTitle => 'ประกาศ';

  @override
  String get noticesMeshIntro =>
      'ประกาศสาธารณะ — ทุกคนในรัศมีวิทยุอ่านได้ ไม่เข้ารหัส ส่งต่อจากมือถือสู่มือถือได้แม้ออฟไลน์ และกล่องทวนสัญญาณ ResilNet ใกล้เคียงจะเก็บสำเนาไว้ให้คนที่เพิ่งเข้ามาทีหลังเห็นด้วย';

  @override
  String get noticesMeshPublicBadge => 'สาธารณะ · ไม่เข้ารหัส';

  @override
  String get noticesGeoIntro =>
      'เพิ่มบันทึกถาวรสั้น ๆ ให้สถานที่นี้เพื่อให้ผู้มาเยือนคนอื่นพบได้';

  @override
  String get noticesEmpty => 'ยังไม่มีประกาศ';

  @override
  String get noticesEmptyHint => 'ปักประกาศแรกให้คนรอบนี้';

  @override
  String get noticesComposeHint => 'เขียนประกาศ...';

  @override
  String get noticesUrgent => 'ด่วน';

  @override
  String get noticesOpen => 'ประกาศ';

  @override
  String get screenshotTaken => '* คุณแคปหน้าจอ *';

  @override
  String get chatAttachImage => 'แนบรูป';

  @override
  String get chatImageLabel => 'รูปภาพ';

  @override
  String get chatImageTooLarge => 'รูปใหญ่เกินไป — ลองเลือกรูปอื่น';

  @override
  String get chatNostrExpiry => 'เก็บบน Nostr';

  @override
  String geoPublicComposeHint(String channel) {
    return 'ส่งข้อความถึง $channel — สาธารณะ';
  }

  @override
  String get settingsClearTitle => 'ล้างข้อความทั้งหมด';

  @override
  String get settingsClearSubtitle => 'ลบแชตทั้งหมดในเครื่อง';

  @override
  String get settingsClearConfirmTitle => 'ล้างข้อความทั้งหมด?';

  @override
  String get settingsClearConfirmBody =>
      'การดำเนินการนี้จะลบข้อความแชตทั้งหมดในเครื่องนี้\nรายชื่อเพื่อน (peers) และชื่อเล่นจะไม่ถูกลบ';

  @override
  String get settingsClearAction => 'ล้างข้อมูล';

  @override
  String get settingsClearedSnack => 'ล้างข้อมูลเรียบร้อยแล้ว';

  @override
  String settingsVersion(String version) {
    return 'เวอร์ชัน $version';
  }

  @override
  String get meshBleScanning => 'BLE: กำลังค้นหา Node';

  @override
  String get meshBleEsp32Scanning => 'ESP32: กำลังหาโหนดใกล้ ๆ';

  @override
  String get meshBleSyncing => 'BLE: กำลังซิงก์กับ ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: กำลังเผยแพร่';

  @override
  String get meshBleIdle => 'BLE mesh เปิด — ยังไม่พบมือถือใกล้ ๆ';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — พบมือถือใกล้ ๆ $count เครื่อง';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: ต้องขอสิทธิ์ก่อน';

  @override
  String get meshBlePausedCamera => 'BLE หยุดชั่วคราว (กล้อง) — แตะ เริ่ม BLE';

  @override
  String get meshBleStopped => 'BLE ปิดอยู่ — เปิด Bluetooth แล้วแตะ เริ่ม BLE';

  @override
  String get meshBleRestart => 'เริ่ม BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'ตรวจสิทธิ์และเริ่ม BLE';

  @override
  String get meshNostrOffline => 'Nostr ออฟไลน์';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count เพื่อนใกล้เคียง • LoRa $lora • รัศมีซิงก์ ~${meters}m';
  }

  @override
  String get meshLoraReady => 'พร้อม';

  @override
  String get meshLoraNotReady => 'ไม่พร้อม';

  @override
  String meshGatewayProgress(String label) {
    return 'Gateway UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: พร้อมส่ง';

  @override
  String get permissionTitle => 'ขอสิทธิ์เพื่อเริ่มใช้งานเครือข่าย BLE Mesh';

  @override
  String get permissionBody =>
      'แอปต้องใช้ Bluetooth (สแกน/เชื่อมต่อ/โฆษณาตัวตน), Location (รองรับ Android รุ่นเก่า) และไมโครโฟน (สำหรับข้อความเสียงในแชตและประกาศ) เพื่อสื่อสารในชุมชน';

  @override
  String get permissionE2ee =>
      'End-to-End Encryption (E2EE)\nโหนดทางผ่านจะไม่สามารถอ่านเนื้อหาข้อความได้';

  @override
  String get permissionReady => 'สิทธิ์พร้อมใช้งาน';

  @override
  String get permissionRequest => 'ขอสิทธิ์และเริ่มใช้งาน';

  @override
  String get permissionNotReadySnack =>
      'ระบบยังไม่พร้อม — รอสักครู่แล้วลองใหม่';

  @override
  String get permissionDeniedSnack =>
      'ยังไม่ได้สิทธิ์ครบ — เปิด Settings > ResilNet แล้วอนุญาต Bluetooth/Location/ไมโครโฟน';

  @override
  String get permissionMicDenied =>
      'ไม่ได้รับอนุญาตไมโครโฟน — เปิด Settings เพื่ออนุญาตการบันทึกเสียง';

  @override
  String get permissionMicOpenSettings => 'Settings';

  @override
  String get permissionCameraDenied =>
      'ไม่ได้รับอนุญาตกล้อง — เปิด Settings เพื่อสแกน QR';

  @override
  String get permissionCameraFailed => 'ต้องอนุญาตกล้องเพื่อสแกน QR';

  @override
  String get permissionCameraOpenSettings => 'Settings';

  @override
  String get permissionPhotosDenied =>
      'ไม่ได้รับสิทธิ์คลังภาพ — เปิด Settings เพื่อบันทึก QR';

  @override
  String get permissionPhotosFailed => 'ต้องอนุญาตคลังภาพเพื่อบันทึก QR';

  @override
  String get permissionPhotosOpenSettings => 'Settings';

  @override
  String permissionFailedSnack(String error) {
    return 'ขอสิทธิ์ล้มเหลว: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Architecture • Store-and-Forward Multi-hop';

  @override
  String get onboardingSkip => 'ข้าม';

  @override
  String get onboardingNext => 'ถัดไป';

  @override
  String get onboardingStart => 'เริ่มใช้งาน';

  @override
  String get onboardingWelcomeTitle => 'ยินดีต้อนรับสู่ ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'สื่อสารบน ResilNet ผ่านเครือข่าย Mesh แม้ไม่มีอินเทอร์เน็ต';

  @override
  String get onboardingFriendsTitle => 'เพิ่มเพื่อนได้ง่าย';

  @override
  String get onboardingFriendsBody =>
      'แชร์ QR จากหน้า “ตัวตน” หรือสแกน QR ของเพื่อนเพื่อแลกเปลี่ยน Public Key';

  @override
  String get onboardingChannelsTitle => 'แชทแบบเข้ารหัส + ช่องใกล้ตัว';

  @override
  String get onboardingChannelsBody =>
      'สลับ #mesh / พื้นที่ (geohash) เพื่อค้นหาเพื่อนใกล้ตัว — ส่งข้อความยังเป็น E2EE ผ่าน BLE Mesh และ Nostr เสมอ';

  @override
  String get chatTitle => 'แชต (E2EE)';

  @override
  String get chatScanTooltip => 'สแกน QR เพิ่มเพื่อน';

  @override
  String get chatBlockTooltip => 'บล็อกผู้ส่งนี้';

  @override
  String get chatBlockedSnack => 'บล็อกแล้ว: จะไม่แจ้งเตือน/ไม่ relay';

  @override
  String get chatAliasTooltip => 'ตั้งชื่อเล่น';

  @override
  String get chatReceiverPemLabel => 'Public Key (PEM) ของผู้รับ';

  @override
  String get chatReceiverPemHint =>
      'วาง Public Key ของเพื่อนที่นี่ (ได้จาก QR/แชร์ไฟล์)';

  @override
  String get chatNeedPeerKey =>
      'สแกน QR ของเพื่อนนี้ก่อน (ต้องมีกุญแจที่ยืนยันแล้ว)';

  @override
  String get chatPeerKeyMismatch =>
      'กุญแจสาธารณะที่เก็บไว้ไม่ตรงกับรหัสเพื่อนนี้';

  @override
  String chatVoiceFailed(String error) {
    return 'ไม่สามารถอัดเสียงได้: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'เล่นเสียงไม่สำเร็จ: $error';
  }

  @override
  String get chatPlayVoice => 'เล่นข้อความเสียง';

  @override
  String get chatPauseVoice => 'หยุดชั่วคราว';

  @override
  String get chatVoiceLabelSent => '🎤 ข้อความเสียง (ผนึกแล้ว)';

  @override
  String get chatVoiceLabel => '🎤 ข้อความเสียง';

  @override
  String get chatDecryptFailed => '[ถอดรหัสไม่สำเร็จ]';

  @override
  String chatSentSealed(String preview) {
    return '[ผนึกแล้ว • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[ผนึกแล้ว]';

  @override
  String get chatComposeHint => 'พิมพ์ข้อความ… (เข้ารหัสทันทีเมื่อกดส่ง)';

  @override
  String get chatEmptyThread =>
      'ยังไม่มีข้อความ\nพิมพ์ข้อความด้านล่างเพื่อส่งผ่าน Mesh';

  @override
  String chatLoadFailed(String error) {
    return 'โหลดบทสนทนาไม่สำเร็จ: $error';
  }

  @override
  String get chatEmojiTooltip => 'อิโมจิ';

  @override
  String get statusPending => 'รอส่ง';

  @override
  String get statusSent => 'ส่งแล้ว';

  @override
  String get statusRelayed => 'ส่งต่อแล้ว';

  @override
  String get statusDelivered => 'ส่งถึงแล้ว';

  @override
  String get statusRead => 'อ่านแล้ว';

  @override
  String get statusFailed => 'ส่งไม่สำเร็จ';

  @override
  String get chatCopy => 'คัดลอก';

  @override
  String get chatDeleteLocal => 'ลบในเครื่องนี้';

  @override
  String get chatDeletedLocalSnack => 'ลบในเครื่องนี้แล้ว';

  @override
  String get chatRetry => 'ส่งซ้ำ';

  @override
  String get chatSendFailed => 'ส่งไม่สำเร็จ — แตะส่งซ้ำ';

  @override
  String get chatImageNeedInternet => 'ต้องมีเน็ตถึงจะส่งรูปได้';

  @override
  String get chatImageTooLargeOnline => 'บีบรูปไม่เล็กพอสำหรับส่ง';

  @override
  String get chatOpenLinkFailed => 'เปิดลิงก์ไม่สำเร็จ';

  @override
  String get identityTitle => 'ตัวตน (Identity)';

  @override
  String get identityScanTooltip => 'สแกน QR ด้วยกล้อง';

  @override
  String get identityCopiedHash => 'คัดลอก Public Key Hash เรียบร้อยแล้ว';

  @override
  String get identityPeerSaved => 'บันทึกเพื่อนจาก QR แล้ว';

  @override
  String get identityGalleryDenied => 'ไม่ได้รับสิทธิ์บันทึกลงคลังภาพ';

  @override
  String get identityQrSaved => 'บันทึก QR ลงคลังภาพแล้ว';

  @override
  String identityQrSaveFailed(String error) {
    return 'บันทึก QR ไม่สำเร็จ: $error';
  }

  @override
  String get peersTitle => 'สมาชิกเครือข่าย';

  @override
  String get qrScanTitle => 'สแกน QR เพิ่มเพื่อน';

  @override
  String get qrInvalid => 'สแกนไม่สำเร็จ: QR ไม่ถูกต้อง';

  @override
  String get qrIdKeyMismatch => 'ปฏิเสธ QR: id ไม่ตรงกับกุญแจสาธารณะ';

  @override
  String get qrCameraNotReady => 'กล้องยังไม่พร้อม';

  @override
  String get qrRetrySettings => 'ลองอีกครั้ง / เปิด Settings';

  @override
  String qrCameraOpenFailed(String error) {
    return 'เปิดกล้องไม่สำเร็จ: $error';
  }

  @override
  String get qrScanAlignHint => 'จัด QR ให้อยู่ในกรอบตรงกลาง';

  @override
  String get firmwareDownloadTitle => 'ดาวน์โหลดเฟิร์มแวร์ ESP32';

  @override
  String get firmwareSourceOnline => 'ล่าสุด (ออนไลน์)';

  @override
  String get firmwareSourceCached => 'สำเนาในเครื่อง (ออฟไลน์)';

  @override
  String get firmwareSourceBaseline => 'ตัวสำรองในแอป (ออฟไลน์)';

  @override
  String get firmwareSourceUnavailable => 'ไม่มีเฟิร์มแวร์พร้อมใช้';

  @override
  String get firmwareBaselineIncompatible =>
      'เฟิร์มแวร์ที่ฝังในแอปเก่าเกินไป — ต้องต่ออินเทอร์เน็ตเพื่อดาวน์โหลดเวอร์ชันใหม่';

  @override
  String get firmwareChecksumFailed =>
      'ไฟล์เฟิร์มแวร์ไม่ผ่านการตรวจสอบ — ห้ามแฟลช';

  @override
  String firmwareReadyFromSource(String source) {
    return 'เฟิร์มแวร์พร้อมใช้: $source';
  }

  @override
  String get peersRefreshTooltip => 'รีเฟรช';

  @override
  String get peersBlocked => 'บล็อกแล้ว';

  @override
  String get peersNearbyBle => 'ใกล้เคียง (BLE)';

  @override
  String get peersRecentlyOnline => 'ออนไลน์ล่าสุด';

  @override
  String get peersOnlineInArea => 'ออนไลน์ในพื้นที่';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'เห็นเมื่อ $minutes นาทีที่แล้ว';
  }

  @override
  String get peersOffline => 'ออฟไลน์';

  @override
  String peersBlockedSnack(String id) {
    return 'บล็อก $id แล้ว';
  }

  @override
  String get peersUnblockedSnack => 'ปลดบล็อกแล้ว';

  @override
  String get peersEmpty =>
      'ยังไม่มีสมาชิกในฐานข้อมูล\nสแกน QR หรือรอค้นพบผ่าน BLE Mesh';

  @override
  String get peersOpenChat => 'เปิดแชต';

  @override
  String get peersBlockAction => 'บล็อก';

  @override
  String get peersUnblockAction => 'ปลดบล็อก';

  @override
  String get channelPickerTooltip => 'แชท / #mesh / พื้นที่';

  @override
  String get locationPickerTooltip => 'ช่องตามตำแหน่ง';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'คนออนไลน์';

  @override
  String get unreadDirectsTooltipEmpty => 'ข้อความส่วนตัว';

  @override
  String unreadDirectsTooltip(int count) {
    return 'ข้อความส่วนตัวที่ยังไม่ได้อ่าน $count ข้อความ';
  }

  @override
  String get onlinePeopleTitle => 'คนออนไลน์';

  @override
  String get onlinePeopleEmpty => 'ยังไม่มีใครออนไลน์ที่นี่';

  @override
  String onlinePeopleCount(int count) {
    return 'ออนไลน์ $count คน';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · ใกล้ตัว + พื้นที่';

  @override
  String get peerOnlineMeshTitle => 'มีคนออนไลน์บน mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name อยู่ใกล้บน mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'มีคนออนไลน์ในพื้นที่';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name ออนไลน์ผ่าน Nostr';
  }

  @override
  String get locationSheetTitle => '#ช่องตามตำแหน่ง';

  @override
  String get channelPinsTitle => 'ปักหมุดไว้';

  @override
  String get channelPinsHint => 'ปักหมุดช่องที่ใช้บ่อย — จะโชว์ด้านบนของรายการ';

  @override
  String get channelPinTooltip => 'ปักหมุดช่องนี้';

  @override
  String get channelUnpinTooltip => 'เอาหมุดออก';

  @override
  String get locationSheetIntro =>
      'คุยกับคนใกล้ตัวผ่าน geohash แบบหยาบ — ไม่ใช่ GPS แม่นยำ Presence บน Internet ใช้นามแฝง Nostr';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 ม.';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'เทเลพอร์ต';

  @override
  String homeComposeHint(String channel) {
    return 'ข้อความถึง $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'ส่งข้อความถึง $channel — สาธารณะ';
  }

  @override
  String get messageExpiryTitle => 'หมดอายุใน';

  @override
  String get voiceRecordTapToStart => 'แตะเพื่อบันทึกข้อความเสียง';

  @override
  String get voiceRecordTooShort => 'อัดสั้นเกินไป — ลองใหม่';

  @override
  String get voiceRecordFailed => 'บันทึกเสียงไม่สำเร็จ — ลองใหม่';

  @override
  String get voicePttHold => 'กดค้างเพื่ออัด';

  @override
  String get voicePttRelease => 'ปล่อยเพื่อดูตัวอย่าง';

  @override
  String get voicePttRecording => 'กำลังบันทึก…';

  @override
  String get voicePttDraftReady => 'พร้อมส่งข้อความเสียง';

  @override
  String get voicePttDiscard => 'ลบ';

  @override
  String get voicePttReRecord => 'อัดใหม่';

  @override
  String get voicePttSend => 'ส่งข้อความเสียง';

  @override
  String get voicePttPlayPreview => 'ฟังตัวอย่าง';

  @override
  String get voicePttStopPreview => 'หยุดฟัง';

  @override
  String get noticesBackfilling => 'กำลังโหลดประกาศ…';

  @override
  String get noticesNostrOnline => 'Nostr ออนไลน์';

  @override
  String get noticesNostrOffline =>
      'Nostr ออฟไลน์ — กระดานประกาศต้องใช้อินเทอร์เน็ต';

  @override
  String noticesBackfillLoaded(int count) {
    return 'ดึงประกาศแล้ว $count รายการ';
  }

  @override
  String get noticePublishFailed =>
      'โพสต์ประกาศไปกระดานพื้นที่ไม่สำเร็จ ตรวจการเชื่อมต่อ Nostr';

  @override
  String get noticeMeshPublishNoLink =>
      'บันทึกในเครื่องแล้ว เชื่อมต่อวิทยุ mesh ใกล้เคียง (หรือ Wi‑Fi gateway) เพื่อให้เครื่องอื่นรับได้';

  @override
  String noticeMeshPublishSent(int count) {
    return 'ส่งประกาศไปยังอุปกรณ์ใกล้เคียง $count เครื่องผ่าน BLE แล้ว';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'เห็นวิทยุใกล้ ๆ แต่ส่ง BLE ไม่สำเร็จ เปิดหน้าประกาศทั้งสองเครื่องแล้วลองใหม่ (หรือใช้ ESP32 เป็นตัวกลาง)';

  @override
  String get noticeMeshPublishNoGatt =>
      'ตัวรับ BLE ของเครื่องนี้ยังไม่พร้อม ลองปิด/เปิด Bluetooth แล้วเปิดหน้าประกาศใหม่';

  @override
  String get noticeDelete => 'ลบประกาศ';

  @override
  String get noticeDeleteConfirmTitle => 'ลบประกาศนี้?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'ลบเฉพาะในเครื่องนี้ เครื่องอื่นที่รับไปแล้วจะยังเห็นประกาศอยู่';

  @override
  String get noticeDeleted => 'ลบประกาศแล้ว';

  @override
  String get chatNoticeHidden => 'ประกาศพื้นที่ — เปิดหน้าประกาศ';

  @override
  String get identityDisplayNameTitle => 'ชื่อที่แสดง';

  @override
  String get identitySaveName => 'บันทึกชื่อ';

  @override
  String get identityUserIdLabel => 'รหัสผู้ใช้ (Public Key Hash)';

  @override
  String get identityCopyHashTooltip => 'คัดลอก Public Key Hash';

  @override
  String get identityMyQrTitle => 'QR ของฉัน (id + pubKey + ชื่อ)';

  @override
  String identityQrFailed(String error) {
    return 'สร้าง QR ไม่สำเร็จ\n$error';
  }

  @override
  String get identitySaving => 'กำลังบันทึก...';

  @override
  String get identitySaveQr => 'บันทึก QR ลงคลังภาพ';

  @override
  String get identityOpenScanner => 'เปิดกล้องสแกน QR';

  @override
  String get identityQrHelp =>
      'ให้เพื่อนสแกนเพื่อบันทึก public key และ (ถ้าจำเป็น) ตั้งเป็น Verified Issuer';

  @override
  String get identityChatTip =>
      'ทิป: สามารถสแกน QR ในหน้าแชตเพื่อเติม Public Key ให้พร้อมส่ง E2EE';

  @override
  String get infoOpen => 'เกี่ยวกับ / ข้อมูล';

  @override
  String get docsGuideTitle => 'คู่มือการใช้งาน';

  @override
  String get docsGuideSubtitle => 'เปิดในเบราว์เซอร์';

  @override
  String get docsOpenAction => 'เปิดคู่มือ';

  @override
  String get docsOpenFailed => 'เปิดคู่มือไม่สำเร็จ';

  @override
  String get firmwareOtaGuideTitle => 'วิธีแฟลชและโปรโตคอล OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'เปิดคู่มือบนเว็บ — ดาวน์โหลด .bin และขั้นตอนละเอียด';

  @override
  String get firmwareWebDownloadsTitle => 'ดาวน์โหลดเฟิร์มแวร์บนเว็บ';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'ลิงก์แต่ละเวอร์ชัน / checksum บนหน้าเอกสาร';

  @override
  String get inviteCopyShortLink => 'คัดลอกลิงก์สั้น';

  @override
  String get inviteShareLink => 'แชร์ลิงก์';

  @override
  String get inviteShowFullLink => 'ลิงก์เต็ม';

  @override
  String get inviteCopyFullLink => 'คัดลอกลิงก์เต็ม';

  @override
  String get inviteLinkCopied => 'คัดลอกลิงก์แล้ว';

  @override
  String get inviteLongPressHint => 'กดค้างเพื่อจัดการลิงก์';

  @override
  String get inviteSendInChat => 'ส่งในแชท ResilNet…';

  @override
  String get inviteSendInChatHint => 'เฉพาะคนที่คุณมีกุญแจสาธารณะอยู่แล้ว';

  @override
  String get inviteSendInChatEmpty =>
      'ยังไม่มีแชทที่ส่งได้\nสแกน QR เปิด Area/Mesh หรือแชร์ลิงก์นอกแอปก่อน';

  @override
  String get inviteSentToChat => 'ส่ง invite ในแชทแล้ว';

  @override
  String get infoTabInfo => 'ข้อมูล';

  @override
  String get infoTabSettingsHint =>
      'เปิดตั้งค่าจากเมนู ⋮ สำหรับภาษา, E2EE และข้อมูล';

  @override
  String get infoHowToTitle => 'วิธีใช้งาน';

  @override
  String get infoHowToBody =>
      '• แตะไอคอนช่องเพื่อสลับ Chat / #mesh / Area\n• แตะไอคอนสถานที่เพื่อเลือกขนาด geohash\n• แตะไอคอนคนเพื่อดูสมาชิกหรือคนออนไลน์\n• เปิด Identity/QR จาก ⋮ เพื่อแลกกุญแจตัวต่อตัว\n• ข้อความ “สาธารณะ” ใน Area คือการส่งแบบ sealed E2EE ทีละคน — ไม่ใช่ห้อง plaintext';

  @override
  String get infoFeaturesTitle => 'ฟีเจอร์';

  @override
  String get infoFeatureOffline => 'สื่อสารออฟไลน์ด้วย Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'เข้ารหัสปลายทางด้วย RSA-OAEP + AES-GCM (ไม่ใช่ Noise)';

  @override
  String get infoFeatureMultihop => 'ข้อความส่งต่อผ่านเพียร์เพื่อไปได้ไกลขึ้น';

  @override
  String get infoFeatureBridge =>
      'เชื่อม mesh ↔ อินเทอร์เน็ต (Nostr) สำหรับซองที่เข้ารหัสแล้ว';

  @override
  String get infoFeatureGeo =>
      'ช่อง geohash สำหรับคนใกล้ตัว (ใช้ค้นหา ไม่ใช่ห้องเปิด)';

  @override
  String get infoFeatureNotices =>
      'ประกาศ/โน้ตพร้อมวันหมดอายุใน #mesh และ Area';

  @override
  String get infoPrivacyTitle => 'ความเป็นส่วนตัว';

  @override
  String get infoPrivacyNoRoom => 'ไม่มีห้องแชทหมู่บ้านแบบ plaintext บนสาย';

  @override
  String get infoPrivacyFanout =>
      'ส่งใน Area = sealed fan-out 1:1 ไปยังเพียร์ที่มี public key';

  @override
  String get infoPrivacyPresence =>
      'Presence บน Internet ใช้นามแฝง Nostr ชั่วคราว';

  @override
  String get infoSymbolsTitle => 'สัญลักษณ์';

  @override
  String get infoSymBle => 'เชื่อมต่อโดยตรงผ่าน Bluetooth';

  @override
  String get infoSymMesh => 'เข้าถึงได้ผ่าน mesh โดยมีผู้อื่นส่งต่อ';

  @override
  String get infoSymInternet => 'ผ่านอินเทอร์เน็ต (Nostr) — ซองที่เข้ารหัสแล้ว';

  @override
  String get infoSymBridge => 'มาถึงผ่านเส้นทางบริดจ์ mesh↔internet';

  @override
  String get infoSymOffline => 'ออฟไลน์ — เข้าถึงไม่ได้ตอนนี้';

  @override
  String get infoSymInArea => 'อยู่ในพื้นที่ของช่องตำแหน่งนี้';

  @override
  String get infoSymE2eeOk => 'เซสชันที่เข้ารหัสแบบครบวงจร';

  @override
  String get infoSymE2eeFail => 'เข้ารหัสไม่ได้ — อย่าส่งข้อความอ่อนไหว';

  @override
  String get infoSymVerified => 'ยืนยันตัวตน / มีกุญแจแล้ว';

  @override
  String get infoSymBlocked => 'ถูกบล็อก';

  @override
  String get infoSymUnread => 'ข้อความส่วนตัวที่ยังไม่ได้อ่าน';

  @override
  String get infoEmergencyTitle => 'โหมดฉุกเฉิน';

  @override
  String get infoEmergencyBody =>
      'แตะชื่อ ResilNet บนหน้าหลักสามครั้งเพื่อลบข้อความ กุญแจ และตัวตนบนเครื่องนี้ทันที';

  @override
  String get infoLegendNote =>
      'ไอคอนเส้นทางบางรายการอธิบายไว้เพื่อความชัดเจน — สถานะส่งหลักในแชทยังเป็นเครื่องหมายส่ง/อ่าน';

  @override
  String get dangerZoneTitle => 'โซนอันตราย';

  @override
  String get dangerZoneSubtitle =>
      'ลบข้อความ กุญแจเข้ารหัส ตัวตน Nostr เพียร์ และชื่อเล่นบนเครื่องนี้ คุณจะต้องตั้งค่าใหม่';

  @override
  String get panicWipeTitle => 'ล้างข้อมูลฉุกเฉิน';

  @override
  String get panicWipeSubtitle =>
      'ลบทุกอย่างในเครื่อง — เหมือนแตะชื่อบนหน้าหลักสามครั้ง (แตะสองครั้ง = รีเฟรชวิทยุ)';

  @override
  String get panicWipeConfirmTitle => 'ล้างข้อมูลทั้งหมดในเครื่อง?';

  @override
  String get panicWipeConfirmBody =>
      'จะลบแชท กุญแจ และตัวตนบนโทรศัพท์นี้ถาวร\nเพื่อนต้องสแกน QR ใหม่กับตัวตนใหม่ของคุณ\nย้อนกลับไม่ได้';

  @override
  String get panicWipeAction => 'ล้างทั้งหมด';

  @override
  String get panicWipeSnack => 'ล้างตัวตนในเครื่องแล้ว — ตั้งค่าใหม่ได้';

  @override
  String panicWipeFailed(String error) {
    return 'ล้างข้อมูลล้มเหลว: $error';
  }

  @override
  String get meshBridgeTitle => 'บริดจ์ mesh';

  @override
  String get meshBridgeSubtitle =>
      'เมื่อเปิด (ค่าเริ่มต้น) ซองที่เข้ารหัสแล้วอาจใช้ทั้ง BLE mesh และอินเทอร์เน็ต (Nostr) พร้อมกัน เพื่อเชื่อมเกาะ mesh ใกล้กัน เมื่อปิดจะส่งทางเดียว — ไม่ใส่ข้อความ plaintext บนสาย';

  @override
  String get favoritesTitle => 'รายการโปรด';

  @override
  String get favoritesAdd => 'เพิ่มเป็นคนโปรด';

  @override
  String get favoritesRemove => 'เอาออกจากคนโปรด';

  @override
  String get favoritesEmpty => 'ยังไม่มีคนโปรด — กดดาวจากรายชื่อสมาชิก';

  @override
  String get favoritesNearbyTitle => 'คนโปรดอยู่ใกล้';

  @override
  String favoritesNearbyBody(String name) {
    return '$name อยู่ใกล้บน mesh';
  }

  @override
  String get favoritesInAreaTitle => 'คนโปรดในพื้นที่';

  @override
  String favoritesInAreaBody(String name) {
    return '$name ออนไลน์ในพื้นที่นี้';
  }

  @override
  String get topologyTitle => 'โทโพโลยี mesh';

  @override
  String get topologySubtitle =>
      'เพียร์และสถานะการเชื่อมต่อจาก mesh announce (อ่านอย่างเดียว)';

  @override
  String get topologyConnectedNow => 'เชื่อมต่ออยู่ตอนนี้ (BLE)';

  @override
  String get topologyNearby => 'ใกล้ตัว (BLE)';

  @override
  String get topologyKnown => 'เพียร์ที่รู้จัก';

  @override
  String get topologyEmpty =>
      'ยังไม่มีเพียร์ — เปิด BLE แล้วอยู่ใกล้เครื่องอื่น';

  @override
  String get topologyYou => 'คุณ';

  @override
  String topologyStats(int peers, int links) {
    return '$peers เพียร์ · $links ลิงก์';
  }

  @override
  String get topologyGraphHint =>
      'ประมาณจาก discovery ใกล้เคียง — เครื่องของคุณถูกไฮไลต์ แตะเพียร์เพื่อเปิดแชท';

  @override
  String get topologyOpen => 'โทโพโลยี mesh';

  @override
  String get slashHelpTitle => 'คำสั่ง';

  @override
  String get slashHelpBody =>
      '/help — รายการนี้\n/who — คนออนไลน์ในช่องปัจจุบัน\n/drop <ข้อความ> — ปักโน้ตแบบ sealed ในช่องนี้ (E2EE fan-out)\n\nคู่มือเต็ม: กดเปิดคู่มือด้านล่าง หรือ Settings → คู่มือการใช้งาน';

  @override
  String get slashWhoEmpty => 'ยังไม่มีใครออนไลน์ในช่องนี้';

  @override
  String slashWhoTitle(int count) {
    return 'ออนไลน์ ($count)';
  }

  @override
  String get slashDropNeedText => 'ใช้แบบ: /drop ข้อความของคุณ';

  @override
  String slashDropDone(String channel) {
    return 'ปักโน้ตที่ $channel แล้ว';
  }

  @override
  String get slashUnknown => 'ไม่รู้จักคำสั่ง — ลอง /help';

  @override
  String get announceOpen => 'ประกาศ';

  @override
  String get announceTitle => 'ประกาศ';

  @override
  String get announceEmpty =>
      'ยังไม่มีกระดาน — สร้างเพื่อโพสต์แบบล็อกหรือแบบเปิด';

  @override
  String get announceCreate => 'สร้างกระดาน';

  @override
  String get announceCreateHint => 'ชื่อกระดาน';

  @override
  String get announceDefaultTitle => 'กระดานชุมชน';

  @override
  String get announceSettings => 'ตั้งค่ากระดาน';

  @override
  String get announceAllowLocked => 'อนุญาตโพสต์แบบล็อก (เข้ารหัส)';

  @override
  String get announceAllowLockedSub =>
      'เข้ารหัสด้วยกุญแจกระดาน — ผู้อ่านต้องได้รับสิทธิ์';

  @override
  String get announceAllowOpen => 'อนุญาตโพสต์แบบเปิด (plaintext)';

  @override
  String get announceAllowOpenSub =>
      'ไม่ใช่ E2EE — อ่านได้บน mesh/รีเลย์ (ปิดเป็นค่าเริ่มต้น)';

  @override
  String get announceComposeHint => 'เขียนประกาศ…';

  @override
  String get announceMediaInternetOnly =>
      'รูป/เสียงในประกาศส่งผ่านเน็ตเท่านั้น (ไม่ใช้ BLE)';

  @override
  String get announceNeedInternet =>
      'ต้องเชื่อมต่ออินเทอร์เน็ตเพื่อส่งรูปหรือเสียงในประกาศ';

  @override
  String announceVoiceFailed(String error) {
    return 'อัดเสียงไม่สำเร็จ: $error';
  }

  @override
  String get announceImageTooLarge => 'รูปใหญ่เกินไป (สูงสุด ~180 KB)';

  @override
  String get announcePlayVoice => 'เล่นข้อความเสียง';

  @override
  String get announceImageLabel => '📷 รูปภาพ';

  @override
  String get announceAudioLabel => '🎤 ข้อความเสียง';

  @override
  String get announceModeLocked => 'ล็อก';

  @override
  String get announceModeOpen => 'เปิด';

  @override
  String get announceOpenBadge => 'เปิด · ไม่เข้ารหัส';

  @override
  String get announceLockedBadge => 'ล็อก';

  @override
  String get announceLockedPlaceholder => 'เข้ารหัสแล้ว — ขอสิทธิ์เพื่ออ่าน';

  @override
  String get announceRequestAccess => 'ขอสิทธิ์อ่าน';

  @override
  String get announceRequestSent => 'ส่งคำขอไปยังเจ้าของกระดานแล้ว';

  @override
  String get announceRequestFailed =>
      'ขอสิทธิ์ไม่ได้ (ต้องมี public key ของเจ้าของ)';

  @override
  String get announceOpenConfirmTitle => 'โพสต์โดยไม่เข้ารหัส?';

  @override
  String get announceOpenConfirmBody =>
      'โพสต์แบบเปิดไม่ใช่ E2EE ผู้ที่อยู่บนเส้นทาง (mesh / รีเลย์) อาจอ่านได้ ดำเนินการต่อ?';

  @override
  String get announcePostAction => 'โพสต์';

  @override
  String get announcePendingRequests => 'คำขอเข้าถึง';

  @override
  String get announceApprove => 'อนุมัติ';

  @override
  String get announceDeny => 'ปฏิเสธ';

  @override
  String get announceGranted => 'อ่านโพสต์ล็อกบนกระดานนี้ได้แล้ว';

  @override
  String get announceOwner => 'คุณเป็นเจ้าของกระดานนี้';

  @override
  String get announceCopyInvite => 'คัดลอกข้อความเชิญ';

  @override
  String get announceShowInviteQr => 'แสดง QR คำเชิญ';

  @override
  String get announceScanInviteQr => 'สแกน QR คำเชิญกระดาน';

  @override
  String get announceFollow => 'ติดตามกระดานจากคำเชิญ';

  @override
  String get announceFollowHint =>
      'วางข้อความเชิญหรือลิงก์ ResilNet จากเจ้าของกระดาน';

  @override
  String get announceFollowOk => 'ติดตามกระดานแล้ว';

  @override
  String announceFollowOkNamed(String title) {
    return 'ติดตามกระดาน “$title” แล้ว';
  }

  @override
  String get announceFollowFail => 'คำเชิญไม่ถูกต้องหรือเสียหาย';

  @override
  String get announceInviteCopied => 'คัดลอกข้อความเชิญแล้ว';

  @override
  String get announceInviteSaveQr => 'บันทึก QR';

  @override
  String get announceInviteShare => 'แชร์คำเชิญ';

  @override
  String get announceFollowFromCompose => 'พบคำเชิญกระดานในกล่องข้อความ';

  @override
  String get peerConfirmAddTitle => 'เพิ่มสมาชิกเครือข่าย?';

  @override
  String peerConfirmAddBody(String name) {
    return 'เพิ่ม “$name” พร้อมกุญแจสาธารณะ เพื่อส่งข้อความส่วนตัวได้?';
  }

  @override
  String get peerConfirmAdd => 'เพิ่มสมาชิก';

  @override
  String peerAddedOk(String name) {
    return 'เพิ่ม $name ในสมาชิกเครือข่ายแล้ว';
  }

  @override
  String get peerAddFromCompose => 'พบตัวตน / กุญแจสาธารณะในกล่องข้อความ';

  @override
  String get peerHashCopied => 'คัดลอก Public key hash แล้ว';

  @override
  String get peerHashOpenChat => 'เปิดแชต';

  @override
  String get peerHashAddHint =>
      'คัดลอก hash แล้ว ให้เพื่อนแชร์ลิงก์ตัวตนหรือ QR เพื่อเพิ่มกุญแจเต็มสำหรับ E2EE';

  @override
  String get peerQrNoCode => 'ไม่พบ QR ของ ResilNet ในรูปนี้';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ตัวตน ResilNet: “$name”\nเปิดลิงก์หรือวางในแชต → เพิ่มสมาชิก\nหรือสแกน QR ตัวตน';
  }

  @override
  String get identityShareInvite => 'แชร์ลิงก์ตัวตน';

  @override
  String get identityInviteCopied => 'คัดลอกลิงก์ตัวตนแล้ว';

  @override
  String announceInviteSharePreamble(String title) {
    return 'คำเชิญเข้ากระดานชุมชน “$title”\nเปิด ResilNet → กระดานชุมชน → ติดตามจากคำเชิญ\nหรือสแกน QR / แตะลิงก์ด้านล่าง';
  }

  @override
  String get announceConfirmFollowTitle => 'ติดตามกระดานนี้?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'ติดตาม “$title” จากคำเชิญนี้หรือไม่?';
  }

  @override
  String get announceConfirmFollow => 'ติดตาม';
}

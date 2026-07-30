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
  String get languageSubtitle => 'ตามภาษาของระบบ หรือเลือกไทย / อังกฤษ';

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
  String get chatImageTooLarge => 'รูปใหญ่เกินไป (สูงสุด ~180KB)';

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
      'ลบทุกอย่างในเครื่อง — เหมือนแตะชื่อบนหน้าหลักสามครั้ง';

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
  String get topologyOpen => 'โทโพโลยี mesh';

  @override
  String get slashHelpTitle => 'คำสั่ง';

  @override
  String get slashHelpBody =>
      '/help — รายการนี้\n/who — คนออนไลน์ในช่องปัจจุบัน\n/drop <ข้อความ> — ปักโน้ตแบบ sealed ในช่องนี้ (E2EE fan-out)';

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
  String get announceCopyInvite => 'คัดลอกคำเชิญกระดาน';

  @override
  String get announceFollow => 'ติดตามกระดานจากคำเชิญ';

  @override
  String get announceFollowHint => 'วาง JSON คำเชิญจากเจ้าของ';

  @override
  String get announceFollowOk => 'ติดตามกระดานแล้ว';

  @override
  String get announceFollowFail => 'คำเชิญไม่ถูกต้อง';

  @override
  String get announceInviteCopied => 'คัดลอกคำเชิญแล้ว';
}

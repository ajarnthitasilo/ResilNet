// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Menyegarkan ResilNet…';

  @override
  String get appRefreshed =>
      'Disegarkan semula — radio dan penemuan dimulakan semula';

  @override
  String appRefreshFailed(String error) {
    return 'Muat semula gagal: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Ketik dua kali = muat semula lembut. Tekan lama = keras pulih. Ketik tiga kali = lap kecemasan.';

  @override
  String get softRefreshTipTitle => 'Jika ResilNet terasa tersekat';

  @override
  String get softRefreshTipBody =>
      'Ketik dua kali ResilNet (kiri atas) untuk muat semula radio lembut. Jika masih tersekat: tekan lama pada tajuk, gunakan ⋮ → Pulih keras atau Tetapan. Ketik tiga kali ialah lap kecemasan sahaja.';

  @override
  String get softRefreshTipGotIt => 'faham';

  @override
  String get infoSoftRefreshTitle => 'Jika apl terasa tersekat';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Ketik dua kali ResilNet (kiri atas) → radio segar semula lembut & orang berdekatan';

  @override
  String get infoSoftRefreshStepHard =>
      'Masih tersekat? Tekan lama tajuk, atau ⋮ / Tetapan → Pulih keras';

  @override
  String get infoSoftRefreshStepWait =>
      'Tunggu hasil snackbar, kemudian cuba lagi. Tetapan semula sesi menyimpan kunci anda.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Ketik tiga kali = lap kecemasan (memadam data setempat) — hanya jika disengajakan';

  @override
  String get appRecoverySection => 'Pemulihan apl';

  @override
  String get appRecoverySectionSubtitle =>
      'Gunakan apabila apl terasa beku. Lembut = tajuk dwiketik. Pulih keras lebih kuat. Tetapan semula sesi memulakan semula perkhidmatan tanpa mengelap kekunci.';

  @override
  String get appHardRecoverAction => 'Sukar pulih';

  @override
  String get appHardRecovering => 'Sukar pulih…';

  @override
  String get appSessionResetAction => 'Set semula sesi';

  @override
  String get appSessionResetRunning => 'Menetapkan semula sesi…';

  @override
  String get appSessionResetConfirmTitle => 'Set semula sesi?';

  @override
  String get appSessionResetConfirmBody =>
      'Memulakan semula perkhidmatan ResilNet pada peranti ini. Kunci identiti anda disimpan.';

  @override
  String get appRecoveryBusy => 'Pemulihan sudah berjalan…';

  @override
  String get appRecoveryOk => 'Pemulihan selesai';

  @override
  String get appRecoveryPartial =>
      'Pemulihan selesai dengan beberapa langkah dilangkau — cuba lagi jika masih tersekat';

  @override
  String get appRecoveryFailed =>
      'Pemulihan gagal — cuba tetapan semula Sesi, atau keluar paksa apl daripada OS';

  @override
  String get localWifiTitle => 'Setempat Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Pautkan peranti berdekatan tanpa internet — sama seperti berada di satu LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Bukan gerbang ESP32 LoRa SoftAP. Ini telefon↔telefon / LAN sahaja.';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi setempat belum bersedia — tunggu untuk permulaan apl.';

  @override
  String get lxmfBridgeTitle => 'Nod rumah';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac atau Pi pilihan pada Wi‑Fi anda yang menyampaikan sembang tertutup. Mati secara lalai. Tidak menggantikan penyulitan hujung ke hujung.';

  @override
  String get lxmfBridgeEnable => 'Gunakan nod rumah';

  @override
  String get lxmfBridgeDisabledHint =>
      'Hidupkan hanya apabila apl jambatan berjalan pada Mac atau Pi pada rangkaian ini.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Dalam talian — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Tidak dapat mencapai nod rumah — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Alamat nod rumah';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP atau http://IP:port — contoh 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Peer → LXMF dest (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Simpan & muat semula status';

  @override
  String get lxmfBridgeLabHint => 'Lanjutan: makmal/retikulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Tetapan nod rumah';

  @override
  String get lxmfBridgeCheckConnection => 'Semak sambungan';

  @override
  String get lxmfBridgeStatusOnline => 'Disambungkan ke nod rumah';

  @override
  String get lxmfBridgeStatusOffline => 'Nod rumah tidak boleh dicapai';

  @override
  String get lxmfBridgeYourDest => 'Alamat nod ini (kongsi dengan rakan)';

  @override
  String get lxmfBridgeCopyDest => 'Salin alamat';

  @override
  String get lxmfBridgeDestCopied => 'Alamat disalin';

  @override
  String get lxmfBridgeLinkedPeers => 'Rakan yang dipautkan';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Setiap rakan memerlukan alamat nod rumah mereka sekali. Kemudian sembang tertutup boleh menggunakan laluan ini.';

  @override
  String get lxmfBridgeNoLinks => 'Belum ada rakan yang dipautkan.';

  @override
  String get lxmfBridgeAddLink => 'Pautkan rakan';

  @override
  String get lxmfBridgePickPeer => 'kawan';

  @override
  String get lxmfBridgePeerDest => 'Alamat nod rumah mereka';

  @override
  String get lxmfBridgePeerDestHint =>
      'Kod 32 aksara daripada skrin nod Utama mereka';

  @override
  String get lxmfBridgeInvalidDest =>
      'Alamat itu kelihatan tidak sah. Tampalkan kod penuh daripada nod rumah mereka.';

  @override
  String get lxmfBridgeRemoveLink => 'Nyahpaut';

  @override
  String get lxmfBridgeSaveLink => 'Jimat';

  @override
  String get lxmfBridgeLinkSaved => 'Rakan dipautkan';

  @override
  String get lxmfBridgeNoPeers =>
      'Tiada kenalan boleh mesej lagi — tambah rakan dahulu.';

  @override
  String get lxmfBridgeHelp =>
      'Pastikan jambatan berjalan pada Mac/Pi. Laluan ini kekal pada LAN anda — ia bukan LoRa dan tidak menggantikan Internet atau mesh Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Berdekatan';

  @override
  String get localWifiModeRouter => 'Penghala';

  @override
  String get localWifiHotspotIntro =>
      'Satu peranti berkongsi Hotspot Peribadi. Orang lain menyertai tempat liputan itu, kemudian ResilNet menemui mereka di rangkaian tempatan.';

  @override
  String get localWifiHostAction => 'Buat rangkaian (Hos)';

  @override
  String get localWifiJoinAction => 'Sertai rangkaian';

  @override
  String get localWifiHostSteps =>
      '1. Buka Tetapan iOS/Android dan hidupkan Hotspot Peribadi (atau Perkongsian Internet).\n2. Beritahu rakan nama tempat liputan (dan kata laluan).\n3. Kembali ke sini dan ketik “Hotspot dihidupkan — mula menunggu”.';

  @override
  String get localWifiHostReady => 'Tempat liputan dihidupkan — mula menunggu';

  @override
  String get localWifiHostWaiting => 'Menunggu rakan-rakan untuk menyertai…';

  @override
  String get localWifiJoinSteps =>
      '1. Buka Tetapan sistem dan sertai Hotspot Peribadi rakan anda.\n2. Kembali ke sini dan ketik \"Saya disambungkan — cari\".';

  @override
  String get localWifiJoinReady => 'Saya disambungkan — cari';

  @override
  String get localWifiRouterIntro =>
      'Sambungkan setiap peranti ke Wi‑Fi penghala/AP yang sama. Penghala tidak memerlukan internet — hanya rangkaian tempatan yang dikongsi.';

  @override
  String get localWifiRouterSearch => 'Cari pada Wi‑Fi ini';

  @override
  String get localWifiRefreshNetwork => 'Muat semula Wi‑Fi maklumat';

  @override
  String get localWifiRouterNoWifiTitle => 'Bukan pada Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Sertai penghala Wi‑Fi dalam Tetapan sistem, kemudian cari semula.';

  @override
  String get localWifiDiscovering => 'Mencari pada Wi‑Fi setempat…';

  @override
  String get localWifiPeersFound => 'Peranti pada rangkaian ini';

  @override
  String get localWifiStop => 'Berhenti';

  @override
  String get localWifiSsidUnknown => 'Nama Wi‑Fi tidak tersedia';

  @override
  String get localWifiStubBanner => 'Menunggu soket LAN…';

  @override
  String get localWifiLiveBanner =>
      'LAN discovery live (UDP) — umumkan + sembang tertutup pada Wi‑Fi ini';

  @override
  String get localWifiEmptyHotspot =>
      'Tiada peranti lagi.\nSemak sama ada rakan menyertai hotspot anda dan membenarkan akses Rangkaian Tempatan.';

  @override
  String get localWifiEmptyRouter =>
      'Tiada peranti lagi.\nSSID yang sama? Rangkaian Tempatan dibenarkan? Sesetengah penghala menyekat trafik peranti ke peranti (pengasingan AP).';

  @override
  String get localWifiIsolationHelp =>
      'Mengapa kita tidak dapat mencari satu sama lain?';

  @override
  String get localWifiIsolationTitle => 'Penghala boleh mengasingkan pelanggan';

  @override
  String get localWifiIsolationBody =>
      'Jika pengasingan AP/Pelanggan (atau rangkaian tetamu) dihidupkan, telefon pada Wi‑Fi yang sama tidak boleh bercakap. Matikan pengasingan, gunakan SSID utama atau tukar kepada mod Berdekatan (Hotspot).';

  @override
  String get localWifiPeerReady => 'Sedia untuk berbual (ada kunci)';

  @override
  String get localWifiPeerNeedKey => 'Ditemui — imbas QR untuk menukar kunci';

  @override
  String get localWifiErrorTitle => 'Ralat Wi‑Fi setempat';

  @override
  String get localWifiErrorBody =>
      'Sesuatu telah berlaku. Berhenti dan cuba lagi.';

  @override
  String get preparingSystem => 'Menyediakan sistem…';

  @override
  String get bootFailedTitle => 'tidak dapat bermula';

  @override
  String get retry => 'Cuba lagi';

  @override
  String get bootRecoveryAction =>
      'Mulakan identiti baharu (padamkan data setempat)';

  @override
  String get bootRecoveryConfirmTitle => 'Mulakan identiti baharu?';

  @override
  String get bootRecoveryConfirmBody =>
      'Ini akan memadamkan sembang, kunci dan identiti setempat secara kekal pada peranti ini.\nRakan sebaya mesti mengimbas QR anda sekali lagi dengan identiti baharu anda.\nIni tidak boleh dibuat asal.';

  @override
  String get bootRecoveryRunning => 'Menetapkan semula identiti setempat…';

  @override
  String get bootRecoverySuccess =>
      'Penetapan semula identiti setempat selesai';

  @override
  String bootRecoveryFailed(String error) {
    return 'Tidak dapat menetapkan semula identiti: $error';
  }

  @override
  String get cancel => 'Batal';

  @override
  String get save => 'Jimat';

  @override
  String get close => 'tutup';

  @override
  String get start => 'Mulakan';

  @override
  String get send => 'Hantar';

  @override
  String get settings => 'tetapan';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle =>
      'Secara lalai apl mengikut bahasa telefon anda (apabila disokong). Bahasa lain kembali kepada bahasa Inggeris. Anda juga boleh mengunci bahasa di sini.';

  @override
  String get languageSystem => 'Sistem lalai';

  @override
  String get languageThai => 'Thai';

  @override
  String get languageEnglish => 'Inggeris';

  @override
  String get notificationsTooltip => 'Tetapan pemberitahuan';

  @override
  String get enableMessageNotifications => 'Dayakan pemberitahuan mesej';

  @override
  String get settingsNotificationsSubtitle =>
      'Mesej 1:1 dan orang dalam talian (makluman tempatan)';

  @override
  String get networkMembersTooltip => 'Ahli rangkaian';

  @override
  String get identityQrTooltip => 'Identiti / QR';

  @override
  String get feedDirects => 'Sembang';

  @override
  String get feedMesh => '#mesh';

  @override
  String get feedGeo => 'Kawasan';

  @override
  String get feedDirectsSubtitle => 'Mesej E2EE peribadi';

  @override
  String get feedMeshSubtitle => 'Rakan sebaya yang berdekatan (BLE)';

  @override
  String get feedGeoSubtitle => 'Saluran penemuan Geohash';

  @override
  String get peerIdHint =>
      'Tampalkan ID Penerima (Cencangan Kunci Awam) untuk memulakan sembang';

  @override
  String get directsEmpty =>
      'Belum ada sembang — imbas QR atau tampal ID Penerima untuk bermula\nMesej dimeterai dengan E2EE sebelum dihantar (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ketik untuk membuka sembang';

  @override
  String get meshIntro =>
      'Rakan sebaya dalam julat BLE — ketik untuk sembang E2EE peribadi (tiada karang awam pada #mesh)\nMenghantar melalui penghala hibrid (BLE + LoRa + Nostr apabila dalam talian)';

  @override
  String get meshEmptyRunning =>
      'Belum ada rakan sebaya yang berdekatan — buka apl pada peranti lain dalam lingkungan BLE';

  @override
  String get meshEmptyStopped =>
      'BLE tidak berjalan — berikan kebenaran Bluetooth / Lokasi';

  @override
  String get meshNearbyPrefix => 'Berdekatan';

  @override
  String get meshRetentionTitle => 'Autopadam mesej';

  @override
  String get meshRetentionSubtitle =>
      'Sejarah sembang tempatan lama dialih keluar secara automatik';

  @override
  String get meshRetentionKeep => 'Simpan';

  @override
  String get meshRetention1Day => '1 hari';

  @override
  String get meshRetention3Days => '3 hari';

  @override
  String get meshRetention7Days => '7 hari';

  @override
  String get refreshLocationTooltip => 'Muat semula lokasi';

  @override
  String get geoIntro =>
      'Orang dalam talian dalam geohash ini boleh dihantar mesej 1:1 atau dengan kawasan awam fan-out (masih dimeterai E2EE setiap rakan sebaya — bukan plaintext)';

  @override
  String geoEmpty(String channel) {
    return 'Tiada sesiapa dalam talian di $channel lagi\nGunakan Pengangkutan → Internet/Auto, tunggu Nostr, muat semula lokasi';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Dalam talian dalam $channel • ketik untuk 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Berdekatan (menunggu kehadiran kawasan) • ketik untuk 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Dilihat pada Nostr dalam $channel • penemuan sahaja (warisan)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Kehadiran tanpa nama lama — tunggu rakan sebaya terikat atau tukar QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE berdekatan — imbas QR untuk memulakan 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Kawasan memerlukan penemuan Internet Nostr disambungkan (Tetapan → Pengangkutan → Internet/Auto)';

  @override
  String get geoEmptyNoLocation =>
      'Lokasi belum diselesaikan lagi — benarkan GPS dan muat semula untuk menerbitkan geohash anda pada Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Kebenaran lokasi ditolak — benarkan ResilNet dalam Tetapan → Privasi → Lokasi';

  @override
  String get geoEmptyServicesDisabled =>
      'Perkhidmatan Lokasi dimatikan — hidupkannya dalam Tetapan';

  @override
  String get geoEmptyNoGpsFix =>
      'Tidak boleh mendapatkan pembetulan GPS (biasa pada Wi‑Fi iPad) — tetapkan geohash secara manual di bawah';

  @override
  String get geoEmptyTeleportHint =>
      'Ketik ikon tempat → masukkan geohash (cth. w5) → Teleport';

  @override
  String get geoSetGeohashManually => 'Tetapkan geohash';

  @override
  String get geoTeleportHint =>
      'Tiada GPS? Masukkan awalan geohash (2–7 aksara, cth. w5) dan ketik Teleport';

  @override
  String get geoTeleportInvalid =>
      'Geohash tidak sah — gunakan huruf/nombor asas32 sahaja (cth. w5 atau w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Kawasan ditetapkan kepada $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Kawasan manual: $channel (pemuatan semula GPS akan mengatasi)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr tidak bersedia — ketik Sambung semula (0/0 sehingga init berjaya)';

  @override
  String get geoEmptyMeshOnly =>
      'Pengangkutan adalah Mesh sahaja — beralih kepada Internet atau Auto untuk menemui rakan sebaya melebihi Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Tiada sesiapa dalam $channel lagi — pastikan Kawasan + Internet terbuka pada kedua-dua peranti dan tunggu ~60s';
  }

  @override
  String get geoChannelFallback => '#kawasan';

  @override
  String get geoRefreshLocation => 'Muat semula lokasi';

  @override
  String get settingsClearLocationTitle => 'Kosongkan lokasi';

  @override
  String get settingsClearLocationSubtitle =>
      'Alih keluar GPS / teleport geohash (Kawasan menjadi #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Kosongkan lokasi?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Memadamkan geohash yang disimpan pada peranti ini. Anda boleh memuat semula GPS atau teleport semula selepas itu.';

  @override
  String get settingsClearLocationAction => 'Kosongkan lokasi';

  @override
  String get settingsClearLocationSnack => 'Lokasi dibersihkan';

  @override
  String get chatVoiceTooLarge => 'Nota suara terlalu besar — ​​maks ~30 saat';

  @override
  String get chatVoiceNeedInternet =>
      'Nota suara memerlukan Internet (Nostr) — terlalu besar untuk BLE sahaja';

  @override
  String get chatVoiceSentInternet => 'Nota suara dihantar melalui Internet';

  @override
  String get noticeAnonMention => 'menyebut';

  @override
  String get noticeAnonDm => 'mesej langsung';

  @override
  String get noticeAnonHug => 'peluk';

  @override
  String get noticeAnonSlap => 'tampar';

  @override
  String get noticeAnonBlock => 'blok';

  @override
  String get noticeAnonNeedKey =>
      'Belum ada kunci awam — tukar QR dahulu untuk 1:1';

  @override
  String get noticeAnonActionSent => 'Dihantar';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Disekat $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*peluk $anon*';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* tamparan $anon *';
  }

  @override
  String get geoReconnectNostr => 'Sambung semula Nostr';

  @override
  String get nostrSectionTitle => 'Nostr geganti';

  @override
  String get nostrSectionSubtitle =>
      'Pemesejan Internet dan Penemuan kawasan menggunakan geganti ini. Ketik sambung semula jika status kekal di luar talian.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Disambungkan $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Luar talian — geganti disenaraikan tetapi tiada bersambung';

  @override
  String get nostrStatusNotInit =>
      'Tidak dimulakan (0/0) — ketik Sambung semula untuk memulakan';

  @override
  String get nostrReconnectAction => 'Sambung semula Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr disambungkan ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Masih di luar talian — semak Wi‑Fi/selular atau cuba lagi';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Gagal: $error';
  }

  @override
  String get nostrReconnecting => 'Menyambung ke geganti…';

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
    return 'Internet (Nostr) dalam $channel • sembang tertutup sedia';
  }

  @override
  String get transportModeTitle => 'Pengangkutan kawasan';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE berdekatan (radio) apabila tiada Nostr · Internet & Auto = Nostr senarai orang';

  @override
  String get transportModeMesh => 'mesh';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Auto';

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
      'Mesej awam kepada semua orang dalam talian di kawasan ini';

  @override
  String get geoPublicSend => 'Awam';

  @override
  String geoPublicHelp(int count) {
    return 'Ditutup kipas kepada $count rakan sebaya dalam talian — masing-masing menerima sampul surat peribadi';
  }

  @override
  String geoPublicSent(int count) {
    return 'Dihantar kepada $count rakan sebaya di kawasan ini';
  }

  @override
  String get geoPublicSentNone =>
      'Tiada rakan sebaya boleh mesej dalam talian — buka Area/Mesh dengan rakan sebaya yang mempunyai kunci, atau tunggu BLE/Nostr';

  @override
  String get areaPublicBadge => 'Awam kawasan';

  @override
  String get geoErrorPermission =>
      'Tidak dapat membaca lokasi — semak kebenaran lokasi';

  @override
  String get geoPrecisionRegion => 'Wilayah';

  @override
  String get geoPrecisionProvince => 'Wilayah';

  @override
  String get geoPrecisionCity => 'Bandar';

  @override
  String get geoPrecisionNeighborhood => 'Kejiranan';

  @override
  String get geoPrecisionBlock => 'Sekat';

  @override
  String get aliasTitle => 'Tetapkan nama panggilan (Hubungi Alias)';

  @override
  String get aliasHintBody =>
      'Alias ini disimpan pada peranti ini sahaja (tempatan sahaja)\nIa tidak pernah dihantar dengan trafik E2EE';

  @override
  String get aliasLabel => 'nama samaran';

  @override
  String get aliasHint => 'cth. “ketua kampung”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Peranti';

  @override
  String get settingsFirmwareTitle =>
      'Muat turun / kemas kini ESP32 perisian tegar';

  @override
  String get settingsFirmwareSubtitle =>
      'Muat turun fail .bin dan kemas kini papan ESP32 melalui OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic jambatan';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Jambatan A/B teks sahaja — bukan ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Alihkan teks biasa pendek antara Meshtastic dan ResilNet. Mod A dan B tidak boleh berjalan pada masa yang sama. Ini bukan penyulitan hujung ke hujung.';

  @override
  String get mtBridgeModeLabel => 'Mod';

  @override
  String get mtBridgeModeOff => 'Mati';

  @override
  String get mtBridgeModeA => 'Termakan A';

  @override
  String get mtBridgeModeB => 'Jalan keluar B';

  @override
  String get mtBridgeModeOffShort => 'Mati';

  @override
  String get mtBridgeModeAShort => 'Dalam A';

  @override
  String get mtBridgeModeBShort => 'Keluar B';

  @override
  String get mtBridgeMutexHint =>
      'Memilih mod mematikan mod yang lain secara automatik. A+B serentak tidak disokong.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (pelog masuk)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Teks masuk muncul di bawah Notis sebagai #meshtastic. Geganti mesh adalah pilihan (dimatikan secara lalai).';

  @override
  String get mtBridgeRelayTitle => 'Juga geganti pada ResilNet mesh';

  @override
  String get mtBridgeRelayHint =>
      'Apabila dihidupkan, buletin awam yang ditandatangani disiarkan. Mati = Notis telefon ini sahaja.';

  @override
  String get mtBridgeSimulateHint => 'Mesej demo';

  @override
  String get mtBridgeSimulate => 'Simulasikan Meshtastic mesej';

  @override
  String get mtBridgeIngestOk => 'Dimakan ke dalam Notis (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Amaran: mesej yang dihantar di sini BUKAN ResilNet E2EE. Sesiapa sahaja di laluan Meshtastic boleh membacanya.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Teks untuk diterbitkan';

  @override
  String get mtBridgeSend => 'Hantar ke Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'Beratur untuk Meshtastic (lihat log / sejarah)';

  @override
  String get mtBridgeLastEgress => 'Jalan keluar terakhir';

  @override
  String get mtBridgeEgressHistory => 'Keluar baru-baru ini';

  @override
  String get mtBridgeOffHint =>
      'Hidupkan Ingest (A) atau Egress (B) untuk menggunakan jambatan.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIK · bukan E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Gunakan MQTT pengangkutan';

  @override
  String get mtBridgeUseMqttHint =>
      'Mati = pengelogan demo sahaja (MQTT masuk diabaikan). Hidup = MQTT untuk pengambilan/keluar apabila disambungkan.';

  @override
  String get mtBridgeMqttHost => 'Hos broker';

  @override
  String get mtBridgeMqttPort => 'Pelabuhan';

  @override
  String get mtBridgeMqttTls => 'Gunakan TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Port biasa 8883. Menggunakan sijil sistem; gagal lembut pada kesilapan jabat tangan.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Auto-sambung semula';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Apabila dihidupkan, pelanggan cuba menyambung semula selepas terputus. Status menunjukkan Menyambung sehingga dipulihkan.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Pembantu topik';

  @override
  String get mtBridgeMqttRegion => 'Awalan wilayah (pilihan)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Apabila ditetapkan, Apply membina semula akar sebagai msh/<region>/2/json (mengatasi akar topik).';

  @override
  String get mtBridgeMqttTopicRoot => 'Akar topik JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nama saluran pautan bawah';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Gunakan akar → langgan / terbitkan topik';

  @override
  String get mtBridgeMqttAdvanced => 'Lanjutan MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, sambung semula, topik, bukti kelayakan';

  @override
  String get mtBridgeMqttTopicIn => 'Langgan topik';

  @override
  String get mtBridgeMqttTopicOut => 'Terbitkan topik';

  @override
  String get mtBridgeMqttGatewayFrom => 'Id nod gerbang (daripada)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Id perpuluhan atau !hex — diperlukan untuk pautan turun teks hantar';

  @override
  String get mtBridgeMqttChannelIndex =>
      'Indeks saluran jaringan (pilihan 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nama pengguna (pilihan)';

  @override
  String get mtBridgeMqttPass => 'Kata laluan (pilihan)';

  @override
  String get mtBridgeMqttPassStored =>
      'Kata laluan disimpan pada peranti ini (tidak ditunjukkan).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Kata laluan baharu (biarkan kosong untuk disimpan)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Biarkan kosong untuk menyimpan kata laluan yang disimpan.';

  @override
  String get mtBridgeMqttPassClear => 'Kosongkan kata laluan';

  @override
  String get mtBridgeMqttSave => 'Simpan tetapan MQTT';

  @override
  String get mtBridgeMqttSaved => 'MQTT tetapan disimpan';

  @override
  String get mtBridgeMqttConnect => 'Sambung';

  @override
  String get mtBridgeMqttDisconnect => 'Putuskan sambungan';

  @override
  String get mtBridgeMqttConnected => 'MQTT disambungkan';

  @override
  String get mtBridgeMqttConnecting => 'MQTT menyambung…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT terputus sambungan';

  @override
  String get mtBridgeMqttError => 'MQTT ralat';

  @override
  String get mtBridgeErrModeIngest => 'Tukar kepada Ingest (A) dahulu';

  @override
  String get mtBridgeErrModeEgress => 'Tukar ke Egress (B) dahulu';

  @override
  String get mtBridgeErrRate => 'Perlahan — kadar terhad';

  @override
  String get mtBridgeErrDedupe => 'Mesej pendua diabaikan';

  @override
  String get mtBridgeErrLoop => 'Dijatuhkan untuk mengelakkan gelung jambatan';

  @override
  String get mtBridgeErrEmpty => 'Mesej kosong';

  @override
  String get mtBridgeErrPublish => 'Terbitan gagal';

  @override
  String get mtBridgeErrNotConnected => 'MQTT tidak disambungkan';

  @override
  String get mtBridgeErrMissingHost => 'Masukkan MQTT hos broker';

  @override
  String get mtBridgeErrMissingTopic => 'Masukkan topik langgan dan terbitkan';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Masukkan id nod get laluan (daripada) untuk teks hantar';

  @override
  String get mtBridgeErrConnect => 'MQTT sambungan gagal';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Sambungan TLS gagal';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Padamkan mesej setempat untuk mengecilkan pangkalan data — identiti, kunci dan rakan sebaya disimpan';

  @override
  String get settingsSaveHistoryTitle => 'Simpan sejarah mesej';

  @override
  String get settingsSaveHistorySubtitle =>
      'Apabila dimatikan, mesej kekal E2EE pada wayar dan disimpan hanya untuk sesi ini (bukan dalam sejarah sembang tempatan). Teks anda sendiri masih dipaparkan sebagai teks biasa pada peranti ini.';

  @override
  String get settingsPrivacy => 'Privasi';

  @override
  String get settingsE2eeTitle => 'Penyulitan hujung ke hujung';

  @override
  String get settingsE2eeSubtitle =>
      'Sentiasa hidup — mesej dimeterai dengan RSA-OAEP + AES-GCM sebelum dihantar. Relay dan hop berdekatan tidak boleh membaca kandungan.';

  @override
  String get settingsScreenshotTitle => 'Makluman tangkapan skrin';

  @override
  String get settingsScreenshotSubtitle =>
      'Tunjukkan baris sistem dalam sembang apabila peranti ini menangkap skrin';

  @override
  String get settingsNostrExpiryTitle => 'Nostr mesej kekalkan masa';

  @override
  String get settingsNostrExpirySubtitle =>
      'Berapa lama sampul surat yang dimeterai harus kekal secara setempat apabila dalam talian melalui Nostr';

  @override
  String get noticeExpiresIn => 'tamat tempoh dalam';

  @override
  String get noticesTitle => 'Notis';

  @override
  String get noticesMeshIntro =>
      'Buletin awam — boleh dilihat oleh semua orang dalam julat radio, tidak disulitkan. Ia melompat telefon ke telefon di luar talian dan kotak geganti ResilNet berdekatan menyimpan salinan supaya orang yang tiba kemudian masih melihatnya.';

  @override
  String get noticesMeshPublicBadge => 'AWAM · tidak disulitkan';

  @override
  String get noticesGeoIntro =>
      'Tambahkan nota ringkas untuk tempat ini supaya pelawat lain boleh menemuinya.';

  @override
  String get noticesEmpty => 'tiada notis lagi';

  @override
  String get noticesEmptyHint =>
      'sematkan notis pertama untuk orang di sekitar sini.';

  @override
  String get noticesComposeHint => 'hantar notis...';

  @override
  String get noticesUrgent => 'mendesak';

  @override
  String get noticesOpen => 'Notis';

  @override
  String get screenshotTaken => '*anda mengambil tangkapan skrin*';

  @override
  String get chatAttachImage => 'Lampirkan imej';

  @override
  String get chatImageLabel => 'Imej';

  @override
  String get chatImageTooLarge => 'Imej terlalu besar — ​​cuba foto lain';

  @override
  String get chatNostrExpiry => 'Nostr simpan';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Hantar kepada $channel — awam';
  }

  @override
  String get settingsClearTitle => 'Kosongkan semua mesej';

  @override
  String get settingsClearSubtitle => 'Padamkan semua sembang pada peranti ini';

  @override
  String get settingsClearConfirmTitle => 'Kosongkan semua mesej?';

  @override
  String get settingsClearConfirmBody =>
      'Ini memadamkan semua mesej sembang pada peranti ini.\nRakan sebaya dan nama panggilan tidak dialih keluar.';

  @override
  String get settingsClearAction => 'Kosongkan data';

  @override
  String get settingsClearedSnack => 'Data dikosongkan';

  @override
  String settingsVersion(String version) {
    return 'versi $version';
  }

  @override
  String get meshBleScanning => 'BLE: mengimbas nod';

  @override
  String get meshBleEsp32Scanning => 'ESP32: mencari nod berdekatan';

  @override
  String get meshBleSyncing => 'BLE: menyegerak dengan ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: penerbitan';

  @override
  String get meshBleIdle => 'BLE mesh on — belum ada telefon berdekatan';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count telefon berdekatan';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: kebenaran diperlukan';

  @override
  String get meshBlePausedCamera => 'BLE dijeda untuk kamera — ketik Mula BLE';

  @override
  String get meshBleStopped =>
      'BLE dimatikan — semak Bluetooth dihidupkan, kemudian ketik Mula BLE';

  @override
  String get meshBleRestart => 'Mulakan BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Loc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Semak kebenaran & mulakan BLE';

  @override
  String get meshNostrOffline => 'Nostr luar talian';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count rakan sebaya berdekatan • LoRa $lora • penyegerakan ~${meters}m';
  }

  @override
  String get meshLoraReady => 'sedia';

  @override
  String get meshLoraNotReady => 'tidak bersedia';

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
    return 'UDP Gerbang: $label';
  }

  @override
  String get meshGatewayReady => 'Gateway UDP: sedia';

  @override
  String get permissionTitle =>
      'Benarkan akses untuk memulakan rangkaian mesh BLE';

  @override
  String get permissionBody =>
      'Apl ini memerlukan Bluetooth (imbas / sambung / iklan), Lokasi (untuk peranti Android yang lebih lama) dan Mikrofon (untuk nota suara dalam sembang dan pengumuman) untuk pemesejan komuniti.';

  @override
  String get permissionE2ee =>
      'Penyulitan Hujung ke Hujung (E2EE)\nNod geganti tidak boleh membaca kandungan mesej';

  @override
  String get permissionReady => 'Keizinan sedia';

  @override
  String get permissionRequest => 'Benarkan dan teruskan';

  @override
  String get permissionNotReadySnack =>
      'Sistem belum sedia — tunggu sebentar dan cuba lagi';

  @override
  String get permissionDeniedSnack =>
      'Kebenaran tidak lengkap — buka Tetapan > ResilNet dan benarkan Bluetooth / Lokasi / Mikrofon';

  @override
  String get permissionMicDenied =>
      'Akses mikrofon ditolak — benarkan dalam Tetapan untuk merakam nota suara';

  @override
  String get permissionMicOpenSettings => 'tetapan';

  @override
  String get permissionCameraDenied =>
      'Akses kamera ditolak — benarkan dalam Tetapan untuk mengimbas kod QR';

  @override
  String get permissionCameraFailed =>
      'Kebenaran kamera diperlukan untuk mengimbas kod QR';

  @override
  String get permissionCameraOpenSettings => 'tetapan';

  @override
  String get permissionPhotosDenied =>
      'Akses pustaka foto ditolak — benarkan dalam Tetapan untuk menyimpan kod QR anda';

  @override
  String get permissionPhotosFailed =>
      'Kebenaran perpustakaan foto diperlukan untuk menyimpan kod QR anda';

  @override
  String get permissionPhotosOpenSettings => 'tetapan';

  @override
  String permissionFailedSnack(String error) {
    return 'Permintaan kebenaran gagal: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Seni Bina • Kedai-dan-Maju Berbilang-hop';

  @override
  String get onboardingSkip => 'Langkau';

  @override
  String get onboardingNext => 'Seterusnya';

  @override
  String get onboardingStart => 'Mulakan';

  @override
  String get onboardingWelcomeTitle => 'Selamat datang ke ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Sembang di ResilNet melalui rangkaian mesh — walaupun tanpa internet';

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
      'Sembang disulitkan + saluran berdekatan';

  @override
  String get onboardingChannelsBody =>
      'Tukar #mesh / Area (geohash) untuk mencari rakan sebaya yang berdekatan — mesej kekal E2EE melebihi BLE mesh dan Nostr';

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
  String get chatTitle => 'Sembang (E2EE)';

  @override
  String get chatScanTooltip => 'Imbas QR untuk menambah rakan sebaya';

  @override
  String get chatBlockTooltip => 'Sekat penghantar ini';

  @override
  String get chatBlockedSnack => 'Disekat: tiada pemberitahuan / tiada geganti';

  @override
  String get chatAliasTooltip => 'Tetapkan nama panggilan';

  @override
  String get chatReceiverPemLabel => 'Kunci awam penerima (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Tampalkan kunci awam rakan anda (daripada QR / fail kongsi)';

  @override
  String get chatNeedPeerKey =>
      'Imbas QR rakan sebaya ini dahulu (kunci awam yang disahkan diperlukan)';

  @override
  String get chatPeerKeyMismatch =>
      'Kunci awam yang disimpan tidak sepadan dengan id rakan sebaya ini';

  @override
  String chatVoiceFailed(String error) {
    return 'Tidak dapat merakam audio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Tidak dapat memainkan nota suara: $error';
  }

  @override
  String get chatPlayVoice => 'Mainkan nota suara';

  @override
  String get chatPauseVoice => 'jeda';

  @override
  String get chatVoiceLabelSent => '🎤 Nota suara (dimeterai)';

  @override
  String get chatVoiceLabel => '🎤 Nota suara';

  @override
  String get chatDecryptFailed => '[penyahsulitan gagal]';

  @override
  String chatSentSealed(String preview) {
    return '[dimeterai • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[dimeterai]';

  @override
  String get chatComposeHint => 'Taip mesej… (dimeterai pada hantar)';

  @override
  String get chatEmptyThread =>
      'Tiada mesej lagi\nTaip di bawah untuk menghantar melalui mesh';

  @override
  String chatLoadFailed(String error) {
    return 'Tidak dapat memuatkan perbualan: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Belum selesai';

  @override
  String get statusSent => 'Dihantar';

  @override
  String get statusRelayed => 'disampaikan';

  @override
  String get statusDelivered => 'Dihantar';

  @override
  String get statusRead => 'Baca';

  @override
  String get statusFailed => 'gagal';

  @override
  String get chatCopy => 'salin';

  @override
  String get chatDeleteLocal => 'Padam pada peranti ini';

  @override
  String get chatDeletedLocalSnack => 'Dipadamkan pada peranti ini';

  @override
  String get chatRetry => 'Cuba semula';

  @override
  String get chatSendFailed => 'Tidak dihantar — ketik Cuba Semula';

  @override
  String get chatImageNeedInternet =>
      'Sambung ke Internet untuk menghantar imej';

  @override
  String get chatImageTooLargeOnline =>
      'Tidak dapat memampatkan imej secukupnya untuk dihantar';

  @override
  String get chatOpenLinkFailed => 'Tidak dapat membuka pautan';

  @override
  String get identityTitle => 'identiti';

  @override
  String get identityScanTooltip => 'Imbas QR dengan kamera';

  @override
  String get identityCopiedHash => 'Cincang kunci awam disalin';

  @override
  String get identityPeerSaved => 'Rakan sebaya disimpan daripada QR';

  @override
  String get identityGalleryDenied => 'Kebenaran pustaka foto ditolak';

  @override
  String get identityQrSaved => 'QR disimpan ke pustaka foto';

  @override
  String identityQrSaveFailed(String error) {
    return 'Tidak dapat menyimpan QR: $error';
  }

  @override
  String get peersTitle => 'Ahli rangkaian';

  @override
  String get qrScanTitle => 'Imbas QR untuk menambah rakan';

  @override
  String get qrInvalid => 'Imbasan gagal: QR tidak sah';

  @override
  String get qrIdKeyMismatch =>
      'QR ditolak: id tidak sepadan dengan kunci awam';

  @override
  String get qrCameraNotReady => 'Kamera tidak bersedia';

  @override
  String get qrRetrySettings => 'Cuba lagi / buka Tetapan';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Tidak dapat membuka kamera: $error';
  }

  @override
  String get qrScanAlignHint => 'Jajarkan kod QR di dalam bingkai';

  @override
  String get firmwareDownloadTitle => 'Muat turun ESP32 perisian tegar';

  @override
  String get firmwareSourceOnline => 'Terkini (dalam talian)';

  @override
  String get firmwareSourceCached => 'Salinan disimpan (luar talian)';

  @override
  String get firmwareSourceBaseline =>
      'Garis dasar yang digabungkan (luar talian)';

  @override
  String get firmwareSourceUnavailable => 'Tiada perisian tegar tersedia';

  @override
  String get firmwareBaselineIncompatible =>
      'Perisian tegar yang digabungkan terlalu lama — sambung ke Internet untuk memuat turun versi yang lebih baharu';

  @override
  String get firmwareChecksumFailed =>
      'Perisian tegar gagal semakan integriti — berkelip disekat';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Perisian tegar sedia: $source';
  }

  @override
  String get peersRefreshTooltip => 'Muat semula';

  @override
  String get peersBlocked => 'Disekat';

  @override
  String get peersNearbyBle => 'Berdekatan (BLE)';

  @override
  String get peersRecentlyOnline => 'Baru-baru ini dalam talian';

  @override
  String get peersOnlineInArea => 'Dalam talian di kawasan';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Dilihat $minutes min yang lalu';
  }

  @override
  String get peersOffline => 'Luar talian';

  @override
  String peersBlockedSnack(String id) {
    return 'Disekat $id';
  }

  @override
  String get peersUnblockedSnack => 'Disekat';

  @override
  String get peersEmpty =>
      'Tiada ahli dalam pangkalan data lagi\nImbas QR atau tunggu BLE penemuan mesh';

  @override
  String get peersOpenChat => 'Buka sembang';

  @override
  String get peersBlockAction => 'Sekat';

  @override
  String get peersUnblockAction => 'Nyahsekat';

  @override
  String get channelPickerTooltip => 'Sembang / #mesh / Kawasan';

  @override
  String get locationPickerTooltip => 'Saluran lokasi';

  @override
  String get transportPickerTooltip => 'Mesh / Internet / Auto';

  @override
  String get onlinePeopleTooltip => 'Orang dalam talian';

  @override
  String get unreadDirectsTooltipEmpty => 'Mesej peribadi';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count mesej peribadi yang belum dibaca';
  }

  @override
  String get onlinePeopleTitle => 'orang ramai';

  @override
  String get onlinePeopleEmpty => 'Belum ada orang dalam talian di sini';

  @override
  String onlinePeopleCount(int count) {
    return '$count dalam talian';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · berdekatan + kawasan';

  @override
  String get peerOnlineMeshTitle => 'Seseorang berhampiran pada mesh';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name terletak berdekatan pada mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Seseorang dalam talian di kawasan itu';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name berada dalam talian melalui Nostr';
  }

  @override
  String get locationSheetTitle => 'saluran #lokasi';

  @override
  String get channelPinsTitle => 'Disemat';

  @override
  String get channelPinsHint =>
      'Sematkan saluran yang sering anda gunakan — ia kekal di bahagian atas';

  @override
  String get channelPinTooltip => 'Sematkan saluran ini';

  @override
  String get channelUnpinTooltip => 'Nyahsemat';

  @override
  String get locationSheetIntro =>
      'Berbual dengan orang berdekatan menggunakan geohash kasar — ​​GPS tidak tepat. Kehadiran di Internet menggunakan kekunci Nostr tanpa nama.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleport';

  @override
  String homeComposeHint(String channel) {
    return 'Mesej $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Hantar kepada $channel — awam';
  }

  @override
  String get messageExpiryTitle => 'tamat tempoh dalam';

  @override
  String get voiceRecordTapToStart => 'Ketik untuk merakam mesej suara';

  @override
  String get voiceRecordTooShort => 'Rakaman terlalu pendek — cuba lagi';

  @override
  String get voiceRecordFailed => 'Tidak dapat menyimpan rakaman — cuba lagi';

  @override
  String get voicePttHold => 'Tahan untuk merakam';

  @override
  String get voicePttRelease => 'Keluarkan untuk pratonton';

  @override
  String get voicePttRecording => 'Rakaman…';

  @override
  String get voicePttDraftReady => 'Nota suara sedia';

  @override
  String get voicePttDiscard => 'Buang';

  @override
  String get voicePttReRecord => 'Rakam semula';

  @override
  String get voicePttSend => 'Hantar nota suara';

  @override
  String get voicePttPlayPreview => 'Mainkan pratonton';

  @override
  String get voicePttStopPreview => 'Hentikan pratonton';

  @override
  String get noticesBackfilling => 'Memuatkan notis…';

  @override
  String get noticesNostrOnline => 'Nostr dalam talian';

  @override
  String get noticesNostrOffline =>
      'Nostr luar talian — buletin memerlukan Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Notis $count dimuatkan';
  }

  @override
  String get noticePublishFailed =>
      'Tidak dapat menerbitkan notis kepada papan kawasan. Semak sambungan Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Disimpan secara tempatan. Sambung ke radio mesh berdekatan (atau Wi‑Fi get laluan) supaya orang lain boleh menerimanya.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Buletin dihantar ke $count peranti berdekatan melebihi BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Radio berdekatan dilihat, tetapi BLE gagal menulis. Pastikan kedua-dua apl dibuka pada skrin Notis dan cuba lagi (atau gunakan geganti ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Penerima BLE peranti ini belum sedia. Togol Bluetooth dan buka semula Notis.';

  @override
  String get noticeDelete => 'Padamkan notis';

  @override
  String get noticeDeleteConfirmTitle => 'Padamkan notis ini?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Ini mengalih keluarnya hanya pada peranti ini. Orang lain yang sudah menerimanya masih akan melihatnya.';

  @override
  String get noticeDeleted => 'Notis dipadamkan';

  @override
  String get chatNoticeHidden => 'Notis kawasan — buka Notis';

  @override
  String get identityDisplayNameTitle => 'Nama paparan';

  @override
  String get identitySaveName => 'Simpan nama';

  @override
  String get identityUserIdLabel => 'ID Pengguna (Cencangan Kunci Awam)';

  @override
  String get identityCopyHashTooltip => 'Salin cincangan kunci awam';

  @override
  String get identityMyQrTitle => 'QR saya (id + pubKey + nama)';

  @override
  String identityQrFailed(String error) {
    return 'Tidak dapat membuat QR\n$error';
  }

  @override
  String get identitySaving => 'Menyimpan…';

  @override
  String get identitySaveQr => 'Simpan QR ke pustaka foto';

  @override
  String get identityOpenScanner => 'Buka kamera untuk mengimbas QR';

  @override
  String get identityQrHelp =>
      'Minta rakan mengimbas ini untuk menyimpan kunci awam anda dan (jika perlu) tetapkan anda sebagai Pengeluar Disahkan';

  @override
  String get identityChatTip =>
      'Petua: anda juga boleh mengimbas QR dalam sembang untuk menambah kunci awam untuk E2EE';

  @override
  String get infoOpen => 'Perihal / Maklumat';

  @override
  String get docsGuideTitle => 'Panduan pengguna';

  @override
  String get docsGuideSubtitle => 'Dibuka dalam penyemak imbas';

  @override
  String get docsOpenAction => 'Buka panduan';

  @override
  String get docsOpenFailed => 'Tidak dapat membuka panduan pengguna';

  @override
  String get firmwareOtaGuideTitle => 'Panduan kilat & protokol OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Membuka panduan web — muat turun .bin dan langkah penuh';

  @override
  String get firmwareWebDownloadsTitle => 'Muat turun perisian tegar di web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Pautan setiap versi dan jumlah semak pada tapak dokumen';

  @override
  String get inviteCopyShortLink => 'Salin pautan pendek';

  @override
  String get inviteShareLink => 'Kongsi pautan';

  @override
  String get inviteShowFullLink => 'Pautan penuh';

  @override
  String get inviteCopyFullLink => 'Salin pautan penuh';

  @override
  String get inviteLinkCopied => 'Pautan disalin';

  @override
  String get inviteLongPressHint => 'Tekan lama untuk tindakan pautan';

  @override
  String get inviteSendInChat => 'Hantar dalam ResilNet sembang…';

  @override
  String get inviteSendInChatHint =>
      'Hanya orang yang anda sudah mempunyai kunci awam';

  @override
  String get inviteSendInChatEmpty =>
      'Tiada sembang boleh mesej lagi.\nImbas QR, buka Area/Mesh atau kongsi pautan di luar apl dahulu.';

  @override
  String get inviteSentToChat => 'Jemputan dihantar dalam sembang';

  @override
  String get infoTabInfo => 'info';

  @override
  String get infoTabSettingsHint =>
      'Buka Tetapan daripada menu untuk bahasa, E2EE dan alatan data';

  @override
  String get infoHowToTitle => 'Cara menggunakan';

  @override
  String get infoHowToBody =>
      '• Ketik ikon saluran untuk menukar Sembang / #mesh / Kawasan\n• Ketik tempat untuk memilih saiz geohash\n• Ketik orang untuk ahli atau orang dalam talian\n• Buka Identiti/QR daripada ⋮ untuk menukar kunci secara peribadi\n• Kawasan \"awam\" menghantar E2EE yang dimeterai kepada setiap rakan dalam talian — bukan bilik teks biasa';

  @override
  String get infoFeaturesTitle => 'Ciri-ciri';

  @override
  String get infoFeatureOffline =>
      'Pemesejan luar talian melalui Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Penyulitan hujung ke hujung dengan RSA-OAEP + AES-GCM (bukan Noise)';

  @override
  String get infoFeatureMultihop =>
      'Mesej boleh melompat melalui rakan sebaya yang berdekatan untuk pergi lebih jauh';

  @override
  String get infoFeatureBridge =>
      'Jaringan hibrid ↔ internet (Nostr) untuk sampul surat bertutup';

  @override
  String get infoFeatureGeo =>
      'Saluran geohash tempatan untuk orang berdekatan (UX penemuan)';

  @override
  String get infoFeatureNotices =>
      'Notis dengan tamat tempoh untuk #mesh dan Kawasan';

  @override
  String get infoPrivacyTitle => 'Privasi';

  @override
  String get infoPrivacyNoRoom =>
      'Tiada plaintext kampung / ruang sembang awam pada wayar';

  @override
  String get infoPrivacyFanout =>
      'Hantar kawasan = dimeterai 1:1 kipas keluar kepada rakan sebaya dengan kunci awam yang diketahui';

  @override
  String get infoPrivacyPresence =>
      'Kehadiran kawasan Internet menggunakan kekunci Nostr fana';

  @override
  String get infoSymbolsTitle => 'Simbol';

  @override
  String get infoSymBle => 'Pautan Bluetooth terus';

  @override
  String get infoSymMesh =>
      'Boleh dihubungi melalui jaringan (yang lain ke hadapan)';

  @override
  String get infoSymInternet =>
      'Melalui internet (Nostr) — sampul surat tertutup';

  @override
  String get infoSymBridge => 'Tiba melalui mesh↔laluan jambatan internet';

  @override
  String get infoSymOffline => 'Luar talian — tidak dapat dihubungi sekarang';

  @override
  String get infoSymInArea => 'Dalam kawasan saluran lokasi ini';

  @override
  String get infoSymE2eeOk => 'Sesi disulitkan hujung ke hujung';

  @override
  String get infoSymE2eeFail =>
      'Penyulitan tidak tersedia — jangan hantar teks sensitif';

  @override
  String get infoSymVerified => 'Identiti disahkan / kunci diketahui';

  @override
  String get infoSymBlocked => 'Disekat';

  @override
  String get infoSymUnread => 'Mesej peribadi yang belum dibaca';

  @override
  String get infoEmergencyTitle => 'Mod kecemasan';

  @override
  String get infoEmergencyBody =>
      'Ketik tiga kali pada tajuk ResilNet pada skrin utama untuk memadam mesej, kekunci dan identiti pada peranti ini.';

  @override
  String get infoLegendNote =>
      'Beberapa ikon laluan didokumenkan di sini untuk kejelasan; tanda penghantaran dalam sembang kekal sebagai status penghantaran utama.';

  @override
  String get dangerZoneTitle => 'Zon bahaya';

  @override
  String get dangerZoneSubtitle =>
      'Memadamkan mesej, kunci penyulitan, identiti Nostr, rakan sebaya dan nama panggilan pada peranti ini. Anda akan menyediakan semula.';

  @override
  String get panicWipeTitle => 'Lap kecemasan';

  @override
  String get panicWipeSubtitle =>
      'Padamkan semua yang setempat — sama seperti mengetik tiga kali pada tajuk rumah (ketik dua kali menyegarkan radio)';

  @override
  String get panicWipeConfirmTitle => 'Padam semua data setempat?';

  @override
  String get panicWipeConfirmBody =>
      'Ini memadamkan sembang, kunci dan identiti pada telefon ini secara kekal.\nRakan sebaya mesti menukar semula kunci QR dengan identiti baharu anda.\nIni tidak boleh dibuat asal.';

  @override
  String get panicWipeAction => 'Lap semua';

  @override
  String get panicWipeSnack => 'Identiti tempatan dipadamkan — sediakan semula';

  @override
  String panicWipeFailed(String error) {
    return 'Lap gagal: $error';
  }

  @override
  String get meshBridgeTitle => 'Jambatan jala';

  @override
  String get meshBridgeSubtitle =>
      'Apabila dihidupkan (lalai), sampul surat bermeterai boleh menggunakan kedua-dua BLE mesh dan internet (Nostr) bersama-sama supaya pulau mesh berdekatan boleh bersambung. Apabila dimatikan, hantar menggunakan satu laluan sahaja — jangan sekali-kali meletakkan teks biasa pada wayar.';

  @override
  String get favoritesTitle => 'Kegemaran';

  @override
  String get favoritesAdd => 'Tambahkan pada kegemaran';

  @override
  String get favoritesRemove => 'Alih keluar daripada kegemaran';

  @override
  String get favoritesEmpty =>
      'Tiada kegemaran lagi — bintangkan rakan sebaya daripada senarai ahli';

  @override
  String get favoritesNearbyTitle => 'Kegemaran berdekatan';

  @override
  String favoritesNearbyBody(String name) {
    return '$name terletak berdekatan pada mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Kegemaran di kawasan';

  @override
  String favoritesInAreaBody(String name) {
    return '$name berada dalam talian di kawasan ini';
  }

  @override
  String get topologyTitle => 'Topologi jaringan';

  @override
  String get topologySubtitle =>
      'Rakan sebaya dan pembayang sambungan daripada pengumuman mesh (baca sahaja)';

  @override
  String get topologyConnectedNow => 'Disambungkan sekarang (BLE)';

  @override
  String get topologyNearby => 'Berdekatan (BLE)';

  @override
  String get topologyKnown => 'Rakan sebaya yang dikenali';

  @override
  String get topologyEmpty =>
      'Belum ada rakan sebaya yang belajar — kekal berdekatan dengan BLE dihidupkan';

  @override
  String get topologyYou => 'awak';

  @override
  String topologyStats(int peers, int links) {
    return '$peers rakan sebaya · $links pautan';
  }

  @override
  String get topologyGraphHint =>
      'Dianggarkan daripada penemuan mesh berdekatan — peranti anda diserlahkan. Ketik rakan sebaya untuk membuka sembang.';

  @override
  String get topologyOpen => 'Topologi jaringan';

  @override
  String get slashHelpTitle => 'Perintah';

  @override
  String get slashHelpBody =>
      '/help — senarai ini\n/siapa — orang dalam talian dalam saluran semasa\n/drop <text> — sematkan notis tertutup di sini (E2EE fan-out)\n\nPanduan penuh: gunakan Buka panduan di bawah, atau Tetapan → Panduan pengguna.';

  @override
  String get slashWhoEmpty =>
      'Tiada sesiapa dalam talian dalam saluran ini sekarang';

  @override
  String slashWhoTitle(int count) {
    return 'Dalam talian ($count)';
  }

  @override
  String get slashDropNeedText => 'Penggunaan: /lepaskan teks nota anda';

  @override
  String slashDropDone(String channel) {
    return 'Notis digugurkan pada $channel';
  }

  @override
  String get slashUnknown => 'Perintah tidak diketahui — cuba /help';

  @override
  String get announceOpen => 'Pengumuman';

  @override
  String get announceTitle => 'Pengumuman';

  @override
  String get announceEmpty =>
      'Belum ada papan — buat satu untuk menyiarkan notis yang dikunci atau terbuka';

  @override
  String get announceCreate => 'Buat papan';

  @override
  String get announceCreateHint => 'Nama lembaga';

  @override
  String get announceDefaultTitle => 'Lembaga komuniti';

  @override
  String get announceSettings => 'Tetapan papan';

  @override
  String get announceAllowLocked => 'Benarkan siaran terkunci (disulitkan).';

  @override
  String get announceAllowLockedSub =>
      'Disulitkan ke kunci papan — pembaca memerlukan akses';

  @override
  String get announceAllowOpen => 'Benarkan siaran terbuka (teks biasa).';

  @override
  String get announceAllowOpenSub =>
      'Bukan E2EE — boleh dibaca pada mesh/geganti. Mati secara lalai.';

  @override
  String get announceComposeHint => 'Tulis pengumuman…';

  @override
  String get announceMediaInternetOnly =>
      'Pengumuman foto/suara dihantar melalui internet (bukan BLE)';

  @override
  String get announceNeedInternet =>
      'Sambung ke Internet untuk menghantar pengumuman foto atau suara';

  @override
  String announceVoiceFailed(String error) {
    return 'Tidak dapat merakam suara: $error';
  }

  @override
  String get announceImageTooLarge => 'Imej terlalu besar (maks ~180 KB)';

  @override
  String get announcePlayVoice => 'Mainkan nota suara';

  @override
  String get announceImageLabel => '📷 Imej';

  @override
  String get announceAudioLabel => '🎤 Nota suara';

  @override
  String get announceModeLocked => 'Dikunci';

  @override
  String get announceModeOpen => 'Buka';

  @override
  String get announceOpenBadge => 'BUKA · tidak disulitkan';

  @override
  String get announceLockedBadge => 'Dikunci';

  @override
  String get announceLockedPlaceholder =>
      'Disulitkan — minta akses untuk membaca';

  @override
  String get announceRequestAccess => 'Minta akses';

  @override
  String get announceRequestSent =>
      'Permintaan akses dihantar kepada pemilik papan';

  @override
  String get announceRequestFailed =>
      'Tidak dapat meminta akses (memerlukan kunci awam pemilik)';

  @override
  String get announceOpenConfirmTitle => 'Siarkan tanpa penyulitan?';

  @override
  String get announceOpenConfirmBody =>
      'Jawatan terbuka bukan E2EE. Sesiapa sahaja di laluan (mesh / relay) boleh membacanya. teruskan?';

  @override
  String get announcePostAction => 'Pos';

  @override
  String get announcePendingRequests => 'Permintaan akses';

  @override
  String get announceApprove => 'Luluskan';

  @override
  String get announceDeny => 'Nafikan';

  @override
  String get announceGranted =>
      'Anda boleh membaca catatan berkunci pada papan ini';

  @override
  String get announceOwner => 'Anda memiliki papan ini';

  @override
  String get announceCopyInvite => 'Salin teks jemputan';

  @override
  String get announceShowInviteQr => 'Tunjukkan QR jemputan';

  @override
  String get announceScanInviteQr => 'Imbas papan jemputan QR';

  @override
  String get announceFollow => 'Ikut papan daripada jemputan';

  @override
  String get announceFollowHint =>
      'Tampalkan teks jemputan atau pautan ResilNet daripada pemilik';

  @override
  String get announceFollowOk => 'Mengikut papan';

  @override
  String announceFollowOkNamed(String title) {
    return 'Sekarang mengikuti \"$title\"';
  }

  @override
  String get announceFollowFail => 'Jemputan tidak sah atau rosak';

  @override
  String get announceInviteCopied => 'Teks jemputan disalin';

  @override
  String get announceInviteSaveQr => 'Simpan QR';

  @override
  String get announceInviteShare => 'Kongsi jemputan';

  @override
  String get announceFollowFromCompose =>
      'Jemputan papan dikesan dalam kotak mesej';

  @override
  String get peerConfirmAddTitle => 'Tambah ahli rangkaian?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Tambahkan \"$name\" dengan kunci awam mereka supaya anda boleh menghantar mesej kepada mereka secara peribadi?';
  }

  @override
  String get peerConfirmAdd => 'Tambah ahli';

  @override
  String peerAddedOk(String name) {
    return 'Menambahkan $name pada ahli rangkaian';
  }

  @override
  String get peerAddFromCompose =>
      'Identiti / kunci awam dikesan dalam kotak mesej';

  @override
  String get peerHashCopied => 'Cincang kunci awam disalin';

  @override
  String get peerHashOpenChat => 'Buka sembang';

  @override
  String get peerHashAddHint =>
      'Hash disalin. Minta mereka berkongsi pautan identiti atau QR mereka supaya anda boleh menambah kunci awam penuh untuk E2EE.';

  @override
  String get peerQrNoCode => 'Tiada ResilNet QR ditemui dalam imej ini';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identiti: “$name”\nBuka pautan atau tampalkannya dalam sembang → Tambah ahli\nAtau imbas QR identiti.';
  }

  @override
  String get identityShareInvite => 'Kongsi pautan identiti';

  @override
  String get identityInviteCopied => 'Pautan identiti disalin';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Jemputan lembaga: “$title”\nBuka ResilNet → Papan komuniti → Ikuti daripada jemputan\nAtau imbas QR / ketik pautan di bawah.';
  }

  @override
  String get announceConfirmFollowTitle => 'Ikut papan ini?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Ikuti “$title” daripada jemputan ini?';
  }

  @override
  String get announceConfirmFollow => 'Ikut';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Menyegarkan ResilNet…';

  @override
  String get appRefreshed => 'Disegarkan — radio dan penemuan dimulai kembali';

  @override
  String appRefreshFailed(String error) {
    return 'Penyegaran gagal: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Ketuk dua kali = penyegaran lembut. Tekan lama = sulit pulih. Ketuk tiga kali = penghapusan darurat.';

  @override
  String get softRefreshTipTitle => 'Jika ResilNet terasa macet';

  @override
  String get softRefreshTipBody =>
      'Ketuk dua kali ResilNet (kiri atas) untuk penyegaran radio secara lembut. Jika masih macet: tekan lama judulnya, gunakan ⋮ → Pemulihan sulit, atau Pengaturan. Ketuk tiga kali hanya untuk penghapusan darurat.';

  @override
  String get softRefreshTipGotIt => 'Mengerti';

  @override
  String get infoSoftRefreshTitle => 'Jika aplikasi terasa macet';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Ketuk dua kali ResilNet (kiri atas) → segarkan perlahan radio & orang di sekitar';

  @override
  String get infoSoftRefreshStepHard =>
      'Masih macet? Tekan lama judul, atau ⋮ / Pengaturan → Pemulihan sulit';

  @override
  String get infoSoftRefreshStepWait =>
      'Tunggu hasilnya snackbar, lalu coba lagi. Penyetelan ulang sesi menyimpan kunci Anda.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Ketuk tiga kali = penghapusan darurat (menghapus data lokal) — hanya jika disengaja';

  @override
  String get appRecoverySection => 'Pemulihan aplikasi';

  @override
  String get appRecoverySectionSubtitle =>
      'Gunakan saat aplikasi terasa terhenti. Lembut = ketuk dua kali judul. Pemulihan yang sulit lebih kuat. Penyetelan ulang sesi memulai ulang layanan tanpa menghapus kunci.';

  @override
  String get appHardRecoverAction => 'Sulit pulih';

  @override
  String get appHardRecovering => 'Sulit pulih…';

  @override
  String get appSessionResetAction => 'Atur ulang sesi';

  @override
  String get appSessionResetRunning => 'Menyetel ulang sesi…';

  @override
  String get appSessionResetConfirmTitle => 'Setel ulang sesi?';

  @override
  String get appSessionResetConfirmBody =>
      'Mulai ulang layanan ResilNet di perangkat ini. Kunci identitas Anda disimpan.';

  @override
  String get appRecoveryBusy => 'Pemulihan sudah berjalan…';

  @override
  String get appRecoveryOk => 'Pemulihan selesai';

  @override
  String get appRecoveryPartial =>
      'Pemulihan selesai dengan beberapa langkah dilewati — coba lagi jika masih macet';

  @override
  String get appRecoveryFailed =>
      'Pemulihan gagal — coba Reset sesi, atau tutup paksa aplikasi dari OS';

  @override
  String get localWifiTitle => 'Lokal Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Tautkan perangkat terdekat tanpa internet — sama seperti berada di satu LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Bukan gerbang ESP32 LoRa SoftAP. Ini hanya telepon↔telepon / LAN saja.';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi lokal belum siap — tunggu aplikasi dimulai.';

  @override
  String get lxmfBridgeTitle => 'simpul rumah';

  @override
  String get lxmfBridgeSubtitle =>
      'Mac atau Pi opsional di Wi‑Fi Anda yang meneruskan obrolan tersegel. Mati secara default. Tidak menggantikan enkripsi ujung ke ujung.';

  @override
  String get lxmfBridgeEnable => 'Gunakan simpul rumah';

  @override
  String get lxmfBridgeDisabledHint =>
      'Aktifkan hanya ketika aplikasi jembatan berjalan di Mac atau Pi di jaringan ini.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Daring — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Tidak dapat menjangkau node asal — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Alamat simpul rumah';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP atau http://IP:port — contoh 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Rekan → LXMF tujuan (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Simpan & segarkan status';

  @override
  String get lxmfBridgeLabHint => 'Lanjutan: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Pengaturan simpul rumah';

  @override
  String get lxmfBridgeCheckConnection => 'Periksa koneksi';

  @override
  String get lxmfBridgeStatusOnline => 'Terhubung ke node rumah';

  @override
  String get lxmfBridgeStatusOffline => 'Node rumah tidak dapat dijangkau';

  @override
  String get lxmfBridgeYourDest => 'Alamat node ini (bagikan dengan teman)';

  @override
  String get lxmfBridgeCopyDest => 'Salin alamat';

  @override
  String get lxmfBridgeDestCopied => 'Alamat disalin';

  @override
  String get lxmfBridgeLinkedPeers => 'Teman yang terhubung';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Setiap teman membutuhkan alamat node rumahnya satu kali. Kemudian obrolan yang tersegel dapat menggunakan jalur ini.';

  @override
  String get lxmfBridgeNoLinks => 'Belum ada teman yang tertaut.';

  @override
  String get lxmfBridgeAddLink => 'Tautkan teman';

  @override
  String get lxmfBridgePickPeer => 'Teman';

  @override
  String get lxmfBridgePeerDest => 'Alamat node rumah mereka';

  @override
  String get lxmfBridgePeerDestHint =>
      'Kode 32 karakter dari layar simpul Beranda mereka';

  @override
  String get lxmfBridgeInvalidDest =>
      'Alamat itu sepertinya tidak valid. Tempelkan kode lengkap dari node asalnya.';

  @override
  String get lxmfBridgeRemoveLink => 'Putuskan tautan';

  @override
  String get lxmfBridgeSaveLink => 'Menyimpan';

  @override
  String get lxmfBridgeLinkSaved => 'Teman tertaut';

  @override
  String get lxmfBridgeNoPeers =>
      'Belum ada kontak yang dapat dikirimi pesan — tambahkan teman terlebih dahulu.';

  @override
  String get lxmfBridgeHelp =>
      'Jaga agar jembatan tetap berjalan di Mac/Pi. Jalur ini tetap ada di LAN Anda — bukan LoRa dan tidak menggantikan internet atau mesh Bluetooth.';

  @override
  String get localWifiModeHotspot => 'Di dekat sini';

  @override
  String get localWifiModeRouter => 'Perute';

  @override
  String get localWifiHotspotIntro =>
      'Satu perangkat berbagi Hotspot Pribadi. Yang lain bergabung dengan hotspot tersebut, lalu ResilNet menemukannya di jaringan lokal.';

  @override
  String get localWifiHostAction => 'Buat jaringan (Host)';

  @override
  String get localWifiJoinAction => 'Bergabunglah dengan jaringan';

  @override
  String get localWifiHostSteps =>
      '1. Buka Pengaturan iOS/Android dan aktifkan Hotspot Pribadi (atau Berbagi Internet).\n2. Beritahu teman nama hotspot (dan kata sandinya).\n3. Kembali ke sini dan ketuk “Hotspot aktif — mulai menunggu”.';

  @override
  String get localWifiHostReady => 'Hotspot aktif — mulailah menunggu';

  @override
  String get localWifiHostWaiting => 'Menunggu teman untuk bergabung…';

  @override
  String get localWifiJoinSteps =>
      '1. Buka Pengaturan sistem dan bergabunglah dengan Hotspot Pribadi teman Anda.\n2. Kembali ke sini dan ketuk “Saya terhubung — cari”.';

  @override
  String get localWifiJoinReady => 'Saya terhubung - cari';

  @override
  String get localWifiRouterIntro =>
      'Hubungkan setiap perangkat ke router/AP Wi‑Fi yang sama. Router tidak memerlukan internet — hanya jaringan lokal bersama.';

  @override
  String get localWifiRouterSearch => 'Telusuri Wi‑Fi ini';

  @override
  String get localWifiRefreshNetwork => 'Segarkan Wi‑Fi info';

  @override
  String get localWifiRouterNoWifiTitle => 'Tidak pada Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Bergabunglah dengan Wi‑Fi router di Pengaturan sistem, lalu cari lagi.';

  @override
  String get localWifiDiscovering => 'Menelusuri di Wi‑Fi lokal…';

  @override
  String get localWifiPeersFound => 'Perangkat di jaringan ini';

  @override
  String get localWifiStop => 'Berhenti';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi nama tidak tersedia';

  @override
  String get localWifiStubBanner => 'Menunggu soket LAN…';

  @override
  String get localWifiLiveBanner =>
      'LAN Discovery Live (UDP) — umumkan + obrolan tersegel di Wi‑Fi ini';

  @override
  String get localWifiEmptyHotspot =>
      'Belum ada perangkat.\nPeriksa apakah teman bergabung dengan hotspot Anda dan mengizinkan akses Jaringan Lokal.';

  @override
  String get localWifiEmptyRouter =>
      'Belum ada perangkat.\nSSIDnya sama? Jaringan Lokal diperbolehkan? Beberapa router memblokir lalu lintas perangkat-ke-perangkat (isolasi AP).';

  @override
  String get localWifiIsolationHelp =>
      'Mengapa kita tidak dapat menemukan satu sama lain?';

  @override
  String get localWifiIsolationTitle => 'Router mungkin mengisolasi klien';

  @override
  String get localWifiIsolationBody =>
      'Jika isolasi AP/Klien (atau jaringan tamu) aktif, ponsel pada Wi‑Fi yang sama tidak dapat berbicara. Matikan isolasi, gunakan SSID utama, atau alihkan ke mode Terdekat (Hotspot).';

  @override
  String get localWifiPeerReady => 'Siap ngobrol (memiliki kunci)';

  @override
  String get localWifiPeerNeedKey =>
      'Ditemukan — pindai QR untuk bertukar kunci';

  @override
  String get localWifiErrorTitle => 'Kesalahan Wi‑Fi lokal';

  @override
  String get localWifiErrorBody =>
      'Ada yang tidak beres. Berhenti dan coba lagi.';

  @override
  String get preparingSystem => 'Mempersiapkan sistem…';

  @override
  String get bootFailedTitle => 'Tidak dapat memulai';

  @override
  String get retry => 'Coba lagi';

  @override
  String get bootRecoveryAction => 'Mulai identitas baru (hapus data lokal)';

  @override
  String get bootRecoveryConfirmTitle => 'Mulai identitas baru?';

  @override
  String get bootRecoveryConfirmBody =>
      'Tindakan ini akan menghapus chat lokal, kunci, dan identitas di perangkat ini secara permanen.\nRekan harus memindai QR Anda lagi dengan identitas baru Anda.\nHal ini tidak dapat dibatalkan.';

  @override
  String get bootRecoveryRunning => 'Menyetel ulang identitas lokal…';

  @override
  String get bootRecoverySuccess => 'Penyetelan ulang identitas lokal selesai';

  @override
  String bootRecoveryFailed(String error) {
    return 'Tidak dapat menyetel ulang identitas: $error';
  }

  @override
  String get cancel => 'Membatalkan';

  @override
  String get save => 'Menyimpan';

  @override
  String get close => 'Menutup';

  @override
  String get start => 'Awal';

  @override
  String get send => 'Mengirim';

  @override
  String get settings => 'Pengaturan';

  @override
  String get language => 'Bahasa';

  @override
  String get languageSubtitle =>
      'Secara default, aplikasi mengikuti bahasa telepon Anda (bila didukung). Bahasa lain kembali ke bahasa Inggris. Anda juga dapat mengunci bahasa di sini.';

  @override
  String get languageSystem => 'Bawaan sistem';

  @override
  String get languageThai => 'Thai';

  @override
  String get languageEnglish => 'Bahasa inggris';

  @override
  String get notificationsTooltip => 'Pengaturan notifikasi';

  @override
  String get enableMessageNotifications => 'Aktifkan notifikasi pesan';

  @override
  String get settingsNotificationsSubtitle =>
      'pesan 1:1 dan orang-orang online (peringatan lokal)';

  @override
  String get networkMembersTooltip => 'Anggota jaringan';

  @override
  String get identityQrTooltip => 'Identitas / QR';

  @override
  String get feedDirects => 'Mengobrol';

  @override
  String get feedMesh => '#jala';

  @override
  String get feedGeo => 'Daerah';

  @override
  String get feedDirectsSubtitle => 'Pesan E2EE pribadi';

  @override
  String get feedMeshSubtitle => 'Rekan terdekat (BLE)';

  @override
  String get feedGeoSubtitle => 'Saluran penemuan Geohash';

  @override
  String get peerIdHint =>
      'Tempel ID Penerima (Hash Kunci Publik) untuk memulai obrolan';

  @override
  String get directsEmpty =>
      'Belum ada obrolan — pindai QR atau tempel ID Penerima untuk memulai\nPesan disegel dengan E2EE sebelum dikirim (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • ketuk untuk membuka obrolan';

  @override
  String get meshIntro =>
      'Rekan dalam rentang BLE — ketuk untuk obrolan E2EE pribadi (tidak ada penulisan publik di #mesh)\nMengirim melalui router hybrid (BLE + LoRa + Nostr saat online)';

  @override
  String get meshEmptyRunning =>
      'Belum ada rekan terdekat — buka aplikasi di perangkat lain dalam jangkauan BLE';

  @override
  String get meshEmptyStopped =>
      'BLE tidak berjalan — berikan izin Bluetooth / Lokasi';

  @override
  String get meshNearbyPrefix => 'Di dekat sini';

  @override
  String get meshRetentionTitle => 'Hapus pesan secara otomatis';

  @override
  String get meshRetentionSubtitle =>
      'Riwayat obrolan lokal lama akan dihapus secara otomatis';

  @override
  String get meshRetentionKeep => 'Menyimpan';

  @override
  String get meshRetention1Day => '1 hari';

  @override
  String get meshRetention3Days => '3 hari';

  @override
  String get meshRetention7Days => '7 hari';

  @override
  String get refreshLocationTooltip => 'Segarkan lokasi';

  @override
  String get geoIntro =>
      'Orang-orang yang daring dalam geohash ini dapat dikirimi pesan 1:1 atau dengan penyebaran publik (masih tersegel E2EE per rekan — bukan teks biasa)';

  @override
  String geoEmpty(String channel) {
    return 'Belum ada orang yang online di $channel\nGunakan Transportasi → Internet/Otomatis, tunggu Nostr, segarkan lokasi';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Online dalam $channel • ketuk untuk 1:1 E2EE';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Terdekat (menunggu keberadaan area) • ketuk untuk 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Terlihat di Nostr di $channel • hanya penemuan (lama)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Kehadiran anonim lama — tunggu rekan terikat atau tukar QR';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE terdekat — pindai QR untuk memulai 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Area penemuan Internet perlu Nostr terhubung (Pengaturan → Transportasi → Internet/Otomatis)';

  @override
  String get geoEmptyNoLocation =>
      'Lokasi belum ditentukan — izinkan GPS dan segarkan untuk mempublikasikan geohash Anda pada Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Izin lokasi ditolak — izinkan ResilNet di Pengaturan → Privasi → Lokasi';

  @override
  String get geoEmptyServicesDisabled =>
      'Layanan Lokasi tidak aktif — aktifkan di Pengaturan';

  @override
  String get geoEmptyNoGpsFix =>
      'Tidak dapat memperoleh perbaikan GPS (umum terjadi pada Wi‑Fi iPad) — atur geohash secara manual di bawah';

  @override
  String get geoEmptyTeleportHint =>
      'Ketuk ikon tempat → masukkan geohash (misalnya w5) → Teleportasi';

  @override
  String get geoSetGeohashManually => 'Setel geohash';

  @override
  String get geoTeleportHint =>
      'Tidak ada GPS? Masukkan awalan geohash (2–7 karakter, misalnya w5) dan ketuk Teleportasi';

  @override
  String get geoTeleportInvalid =>
      'Geohash tidak valid — hanya menggunakan huruf/angka base32 (misalnya w5 atau w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Area disetel ke $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Area manual: $channel (Penyegaran GPS akan dikesampingkan)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr belum siap — ketuk Sambungkan kembali (0/0 hingga init berhasil)';

  @override
  String get geoEmptyMeshOnly =>
      'Transportasi hanya untuk Mesh — beralih ke Internet atau Otomatis untuk menemukan rekan melalui Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Belum ada seorang pun di $channel — biarkan Area + Internet tetap terbuka di kedua perangkat dan tunggu ~60 detik';
  }

  @override
  String get geoChannelFallback => '#daerah';

  @override
  String get geoRefreshLocation => 'Segarkan lokasi';

  @override
  String get settingsClearLocationTitle => 'Lokasi yang jelas';

  @override
  String get settingsClearLocationSubtitle =>
      'Hapus GPS / teleport geohash (Area menjadi #—)';

  @override
  String get settingsClearLocationConfirmTitle => 'Hapus lokasi?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Menghapus geohash yang tersimpan di perangkat ini. Anda dapat menyegarkan GPS atau berteleportasi lagi setelahnya.';

  @override
  String get settingsClearLocationAction => 'Lokasi yang jelas';

  @override
  String get settingsClearLocationSnack => 'Lokasi dibersihkan';

  @override
  String get chatVoiceTooLarge =>
      'Catatan suara terlalu besar — ​​maks ~30 detik';

  @override
  String get chatVoiceNeedInternet =>
      'Catatan suara memerlukan Internet (Nostr) — terlalu besar untuk BLE saja';

  @override
  String get chatVoiceSentInternet => 'Catatan suara dikirim melalui Internet';

  @override
  String get noticeAnonMention => 'menyebutkan';

  @override
  String get noticeAnonDm => 'pesan langsung';

  @override
  String get noticeAnonHug => 'memeluk';

  @override
  String get noticeAnonSlap => 'tamparan';

  @override
  String get noticeAnonBlock => 'memblokir';

  @override
  String get noticeAnonNeedKey =>
      'Belum ada kunci publik — tukarkan QR terlebih dahulu dengan 1:1';

  @override
  String get noticeAnonActionSent => 'Terkirim';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Diblokir $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*peluk $anon*';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* menampar $anon *';
  }

  @override
  String get geoReconnectNostr => 'Hubungkan kembali Nostr';

  @override
  String get nostrSectionTitle => 'Nostr relai';

  @override
  String get nostrSectionSubtitle =>
      'Pesan internet dan penemuan Area menggunakan relay ini. Ketuk sambungkan kembali jika status tetap offline.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Terhubung $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Offline — relai terdaftar tetapi tidak ada yang tersambung';

  @override
  String get nostrStatusNotInit =>
      'Belum dimulai (0/0) — ketuk Hubungkan kembali untuk menginisialisasi';

  @override
  String get nostrReconnectAction => 'Hubungkan kembali Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr terhubung ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Masih offline — periksa Wi‑Fi/seluler atau coba lagi';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Gagal: $error';
  }

  @override
  String get nostrReconnecting => 'Menyambungkan ke relai…';

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
    return 'Internet (Nostr) di $channel • obrolan tersegel siap';
  }

  @override
  String get transportModeTitle => 'Transportasi daerah';

  @override
  String get transportModeSubtitle =>
      'Mesh = BLE terdekat (radio) ketika tidak ada Nostr · Internet & Otomatis = Nostr daftar orang';

  @override
  String get transportModeMesh => 'Jala';

  @override
  String get transportModeInternet => 'Internet';

  @override
  String get transportModeAuto => 'Mobil';

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
      'Pesan publik kepada semua orang yang online di area ini';

  @override
  String get geoPublicSend => 'Publik';

  @override
  String geoPublicHelp(int count) {
    return 'Penyebaran tersegel ke $count rekan online — masing-masing menerima amplop pribadi';
  }

  @override
  String geoPublicSent(int count) {
    return 'Dikirim ke $count rekan di area ini';
  }

  @override
  String get geoPublicSentNone =>
      'Tidak ada rekan yang dapat mengirim pesan secara online — buka Area/Mesh dengan rekan yang memiliki kunci, atau tunggu BLE/Nostr';

  @override
  String get areaPublicBadge => 'Area publik';

  @override
  String get geoErrorPermission =>
      'Tidak dapat membaca lokasi — periksa izin lokasi';

  @override
  String get geoPrecisionRegion => 'Wilayah';

  @override
  String get geoPrecisionProvince => 'Propinsi';

  @override
  String get geoPrecisionCity => 'Kota';

  @override
  String get geoPrecisionNeighborhood => 'Lingkungan';

  @override
  String get geoPrecisionBlock => 'Memblokir';

  @override
  String get aliasTitle => 'Tetapkan nama panggilan (Hubungi Alias)';

  @override
  String get aliasHintBody =>
      'Alias ini hanya disimpan di perangkat ini (khusus lokal)\nItu tidak pernah dikirim dengan lalu lintas E2EE';

  @override
  String get aliasLabel => 'Nama panggilan';

  @override
  String get aliasHint => 'misalnya “kepala desa”, “P\'Somchai”…';

  @override
  String get settingsDevices => 'Perangkat';

  @override
  String get settingsFirmwareTitle => 'Unduh / perbarui ESP32 firmware';

  @override
  String get settingsFirmwareSubtitle =>
      'Unduh file .bin dan perbarui papan ESP32 melalui OTA';

  @override
  String get mtBridgeTitle => 'Meshtastic jembatan';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Jembatan A/B hanya teks — bukan ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Pindahkan teks biasa pendek antara Meshtastic dan ResilNet. Mode A dan B tidak dapat dijalankan secara bersamaan. Ini bukan enkripsi ujung ke ujung.';

  @override
  String get mtBridgeModeLabel => 'Mode';

  @override
  String get mtBridgeModeOff => 'Mati';

  @override
  String get mtBridgeModeA => 'Menelan A';

  @override
  String get mtBridgeModeB => 'jalan keluar B';

  @override
  String get mtBridgeModeOffShort => 'Mati';

  @override
  String get mtBridgeModeAShort => 'Di sebuah';

  @override
  String get mtBridgeModeBShort => 'Keluar B';

  @override
  String get mtBridgeMutexHint =>
      'Memilih salah satu mode akan menonaktifkan mode lainnya secara otomatis. A+B secara bersamaan tidak didukung.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (pencatatan)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Teks masuk muncul di bawah Pemberitahuan sebagai #meshtastic. Relai mesh bersifat opsional (dinonaktifkan secara default).';

  @override
  String get mtBridgeRelayTitle => 'Juga sampaikan pada mesh ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Ketika aktif, buletin publik yang ditandatangani disiarkan. Mati = Hanya Pemberitahuan pada ponsel ini.';

  @override
  String get mtBridgeSimulateHint => 'Pesan demo';

  @override
  String get mtBridgeSimulate => 'Simulasikan pesan Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Diserap ke dalam Pemberitahuan (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Peringatan: pesan yang dikirim di sini BUKAN ResilNet E2EE. Siapa pun di jalur Meshtastic dapat membacanya.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Teks untuk dipublikasikan';

  @override
  String get mtBridgeSend => 'Kirim ke Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'Mengantri untuk Meshtastic (lihat log/riwayat)';

  @override
  String get mtBridgeLastEgress => 'Jalan keluar terakhir';

  @override
  String get mtBridgeEgressHistory => 'Jalan keluar baru-baru ini';

  @override
  String get mtBridgeOffHint =>
      'Aktifkan Ingest (A) atau Egress (B) untuk menggunakan bridge.';

  @override
  String get mtBridgeNoticeBadge => 'MESHTASTIS · bukan E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Gunakan transportasi MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Off = demo logging saja (MQTT inbound diabaikan). Aktif = MQTT untuk penyerapan/keluar saat terhubung.';

  @override
  String get mtBridgeMqttHost => 'Tuan rumah pialang';

  @override
  String get mtBridgeMqttPort => 'Pelabuhan';

  @override
  String get mtBridgeMqttTls => 'Gunakan TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Port khas 8883. Menggunakan sertifikat sistem; gagal lunak pada kesalahan jabat tangan.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Sambungkan kembali secara otomatis';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Saat aktif, klien mencoba menyambung kembali setelah terputus. Status menunjukkan Menghubungkan hingga dipulihkan.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Pembantu topik';

  @override
  String get mtBridgeMqttRegion => 'Awalan wilayah (opsional)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Jika disetel, Apply akan membangun kembali root sebagai msh/<region>/2/json (mengganti root topik).';

  @override
  String get mtBridgeMqttTopicRoot => 'Akar topik JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Nama saluran downlink';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Terapkan root → berlangganan / publikasikan topik';

  @override
  String get mtBridgeMqttAdvanced => 'Lanjutan MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, sambungkan kembali, topik, kredensial';

  @override
  String get mtBridgeMqttTopicIn => 'Berlangganan topik';

  @override
  String get mtBridgeMqttTopicOut => 'Publikasikan topik';

  @override
  String get mtBridgeMqttGatewayFrom => 'Id simpul gerbang (dari)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Id desimal atau !hex — diperlukan untuk downlink sendtext';

  @override
  String get mtBridgeMqttChannelIndex => 'Indeks saluran mesh (opsional 0–7)';

  @override
  String get mtBridgeMqttUser => 'Nama pengguna (opsional)';

  @override
  String get mtBridgeMqttPass => 'Kata sandi (opsional)';

  @override
  String get mtBridgeMqttPassStored =>
      'Kata sandi disimpan di perangkat ini (tidak ditampilkan).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Kata sandi baru (biarkan kosong untuk disimpan)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Biarkan kosong untuk menyimpan kata sandi yang disimpan.';

  @override
  String get mtBridgeMqttPassClear => 'Hapus kata sandi';

  @override
  String get mtBridgeMqttSave => 'Simpan pengaturan MQTT';

  @override
  String get mtBridgeMqttSaved => 'MQTT pengaturan disimpan';

  @override
  String get mtBridgeMqttConnect => 'Menghubungkan';

  @override
  String get mtBridgeMqttDisconnect => 'Memutuskan';

  @override
  String get mtBridgeMqttConnected => 'MQTT terhubung';

  @override
  String get mtBridgeMqttConnecting => 'MQTT menghubungkan…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT terputus';

  @override
  String get mtBridgeMqttError => 'kesalahan MQTT';

  @override
  String get mtBridgeErrModeIngest =>
      'Beralih ke Penyerapan (A) terlebih dahulu';

  @override
  String get mtBridgeErrModeEgress => 'Beralih ke Egress (B) terlebih dahulu';

  @override
  String get mtBridgeErrRate => 'Perlambat — kecepatan terbatas';

  @override
  String get mtBridgeErrDedupe => 'Pesan duplikat diabaikan';

  @override
  String get mtBridgeErrLoop => 'Dijatuhkan untuk mencegah loop jembatan';

  @override
  String get mtBridgeErrEmpty => 'Pesan kosong';

  @override
  String get mtBridgeErrPublish => 'Publikasi gagal';

  @override
  String get mtBridgeErrNotConnected => 'MQTT tidak terhubung';

  @override
  String get mtBridgeErrMissingHost => 'Masukkan MQTT host pialang';

  @override
  String get mtBridgeErrMissingTopic =>
      'Masukkan topik berlangganan dan publikasikan';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Masukkan id node gateway (dari) untuk sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT koneksi gagal';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Koneksi TLS gagal';

  @override
  String get settingsData => 'Data';

  @override
  String get settingsDataHint =>
      'Hapus pesan lokal untuk mengecilkan database — identitas, kunci, dan rekan disimpan';

  @override
  String get settingsSaveHistoryTitle => 'Simpan riwayat pesan';

  @override
  String get settingsSaveHistorySubtitle =>
      'Saat tidak aktif, pesan tetap terkirim secara E2EE dan disimpan hanya untuk sesi ini (bukan dalam riwayat obrolan lokal). Teks Anda sendiri masih ditampilkan sebagai teks biasa di perangkat ini.';

  @override
  String get settingsPrivacy => 'Pribadi';

  @override
  String get settingsE2eeTitle => 'Enkripsi ujung ke ujung';

  @override
  String get settingsE2eeSubtitle =>
      'Selalu aktif — pesan disegel dengan RSA-OAEP + AES-GCM sebelum dikirim. Relai dan hop terdekat tidak dapat membaca konten.';

  @override
  String get settingsScreenshotTitle => 'Peringatan tangkapan layar';

  @override
  String get settingsScreenshotSubtitle =>
      'Tampilkan baris sistem dalam obrolan saat perangkat ini menangkap layar';

  @override
  String get settingsNostrExpiryTitle => 'Nostr pesan menjaga waktu';

  @override
  String get settingsNostrExpirySubtitle =>
      'Berapa lama amplop tersegel harus disimpan secara lokal saat online melalui Nostr';

  @override
  String get noticeExpiresIn => 'habis masa berlakunya';

  @override
  String get noticesTitle => 'Pemberitahuan';

  @override
  String get noticesMeshIntro =>
      'Buletin publik — dapat dilihat oleh semua orang dalam jangkauan radio, tidak dienkripsi. Ini berpindah dari telepon ke telepon secara offline, dan kotak relai ResilNet di dekatnya menyimpan salinannya sehingga orang yang datang terlambat masih dapat melihatnya.';

  @override
  String get noticesMeshPublicBadge => 'UMUM · tidak dienkripsi';

  @override
  String get noticesGeoIntro =>
      'Tambahkan catatan singkat untuk tempat ini agar pengunjung lain dapat menemukannya.';

  @override
  String get noticesEmpty => 'belum ada pemberitahuan';

  @override
  String get noticesEmptyHint =>
      'sematkan pemberitahuan pertama untuk orang-orang di sekitar sini.';

  @override
  String get noticesComposeHint => 'pasang pemberitahuan...';

  @override
  String get noticesUrgent => 'mendesak';

  @override
  String get noticesOpen => 'Pemberitahuan';

  @override
  String get screenshotTaken => '*kamu mengambil tangkapan layar*';

  @override
  String get chatAttachImage => 'Lampirkan gambar';

  @override
  String get chatImageLabel => 'Gambar';

  @override
  String get chatImageTooLarge => 'Gambar terlalu besar — ​​coba foto lain';

  @override
  String get chatNostrExpiry => 'Nostr pertahankan';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Kirim ke $channel — publik';
  }

  @override
  String get settingsClearTitle => 'Hapus semua pesan';

  @override
  String get settingsClearSubtitle => 'Hapus semua obrolan di perangkat ini';

  @override
  String get settingsClearConfirmTitle => 'Hapus semua pesan?';

  @override
  String get settingsClearConfirmBody =>
      'Tindakan ini akan menghapus semua pesan chat di perangkat ini.\nRekan dan nama panggilan tidak dihapus.';

  @override
  String get settingsClearAction => 'Hapus data';

  @override
  String get settingsClearedSnack => 'Data dihapus';

  @override
  String settingsVersion(String version) {
    return 'versi $version';
  }

  @override
  String get meshBleScanning => 'BLE: memindai node';

  @override
  String get meshBleEsp32Scanning => 'ESP32: mencari node terdekat';

  @override
  String get meshBleSyncing => 'BLE: menyinkronkan dengan ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: penerbitan';

  @override
  String get meshBleIdle => 'BLE mesh aktif — belum ada telepon terdekat';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE mesh — $count ponsel di sekitar';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: diperlukan izin';

  @override
  String get meshBlePausedCamera => 'BLE dijeda untuk kamera — ketuk Mulai BLE';

  @override
  String get meshBleStopped =>
      'BLE mati — periksa Bluetooth aktif, lalu ketuk Mulai BLE';

  @override
  String get meshBleRestart => 'Mulai BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Lokasi $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Periksa izin & mulai BLE';

  @override
  String get meshNostrOffline => 'Nostr luring';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count rekan terdekat • LoRa $lora • sinkronisasi ~${meters}m';
  }

  @override
  String get meshLoraReady => 'siap';

  @override
  String get meshLoraNotReady => 'belum siap';

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
  String get meshGatewayReady => 'UDP Gerbang: siap';

  @override
  String get permissionTitle => 'Izinkan akses untuk memulai jaringan mesh BLE';

  @override
  String get permissionBody =>
      'Aplikasi ini memerlukan Bluetooth (memindai/menghubungkan/mengiklankan), Lokasi (untuk perangkat Android lama), dan Mikrofon (untuk catatan suara dalam obrolan dan pengumuman) untuk perpesanan komunitas.';

  @override
  String get permissionE2ee =>
      'Enkripsi Ujung-ke-Ujung (E2EE)\nNode relai tidak dapat membaca isi pesan';

  @override
  String get permissionReady => 'Izin sudah siap';

  @override
  String get permissionRequest => 'Izinkan dan lanjutkan';

  @override
  String get permissionNotReadySnack =>
      'Sistem belum siap — tunggu sebentar dan coba lagi';

  @override
  String get permissionDeniedSnack =>
      'Izin tidak lengkap — buka Pengaturan > ResilNet dan izinkan Bluetooth / Lokasi / Mikrofon';

  @override
  String get permissionMicDenied =>
      'Akses mikrofon ditolak — izinkan di Pengaturan untuk merekam catatan suara';

  @override
  String get permissionMicOpenSettings => 'Pengaturan';

  @override
  String get permissionCameraDenied =>
      'Akses kamera ditolak — izinkan di Pengaturan untuk memindai kode QR';

  @override
  String get permissionCameraFailed =>
      'Izin kamera diperlukan untuk memindai kode QR';

  @override
  String get permissionCameraOpenSettings => 'Pengaturan';

  @override
  String get permissionPhotosDenied =>
      'Akses perpustakaan foto ditolak — izinkan di Pengaturan untuk menyimpan kode QR Anda';

  @override
  String get permissionPhotosFailed =>
      'Izin perpustakaan foto diperlukan untuk menyimpan kode QR Anda';

  @override
  String get permissionPhotosOpenSettings => 'Pengaturan';

  @override
  String permissionFailedSnack(String error) {
    return 'Permintaan izin gagal: $error';
  }

  @override
  String get permissionFooter =>
      'ResilNet Arsitektur • Multi-hop Store-and-Forward';

  @override
  String get onboardingSkip => 'Melewati';

  @override
  String get onboardingNext => 'Berikutnya';

  @override
  String get onboardingStart => 'Mulailah';

  @override
  String get onboardingWelcomeTitle => 'Selamat datang di ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Ngobrol di ResilNet melalui jaringan mesh — bahkan tanpa internet';

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
      'Obrolan terenkripsi + saluran terdekat';

  @override
  String get onboardingChannelsBody =>
      'Ganti #mesh / Area (geohash) untuk menemukan rekan terdekat — pesan tetap E2EE melalui BLE mesh dan Nostr';

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
  String get chatTitle => 'Obrolan (E2EE)';

  @override
  String get chatScanTooltip => 'Pindai QR untuk menambahkan rekan';

  @override
  String get chatBlockTooltip => 'Blokir pengirim ini';

  @override
  String get chatBlockedSnack =>
      'Diblokir: tidak ada notifikasi / tidak ada relai';

  @override
  String get chatAliasTooltip => 'Tetapkan nama panggilan';

  @override
  String get chatReceiverPemLabel => 'Kunci publik penerima (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Rekatkan kunci publik teman Anda (dari QR / file yang dibagikan)';

  @override
  String get chatNeedPeerKey =>
      'Pindai QR rekan ini terlebih dahulu (diperlukan kunci publik terverifikasi)';

  @override
  String get chatPeerKeyMismatch =>
      'Kunci publik yang disimpan tidak cocok dengan ID rekan ini';

  @override
  String chatVoiceFailed(String error) {
    return 'Tidak dapat merekam audio: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Tidak dapat memutar catatan suara: $error';
  }

  @override
  String get chatPlayVoice => 'Putar catatan suara';

  @override
  String get chatPauseVoice => 'Berhenti sebentar';

  @override
  String get chatVoiceLabelSent => '🎤 Catatan suara (tersegel)';

  @override
  String get chatVoiceLabel => '🎤 Catatan suara';

  @override
  String get chatDecryptFailed => '[dekripsi gagal]';

  @override
  String chatSentSealed(String preview) {
    return '[disegel • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[tertutup]';

  @override
  String get chatComposeHint => 'Ketik pesan… (disegel saat dikirim)';

  @override
  String get chatEmptyThread =>
      'Belum ada pesan\nKetik di bawah ini untuk mengirimkan mesh';

  @override
  String chatLoadFailed(String error) {
    return 'Tidak dapat memuat percakapan: $error';
  }

  @override
  String get chatEmojiTooltip => 'emoji';

  @override
  String get statusPending => 'Tertunda';

  @override
  String get statusSent => 'Terkirim';

  @override
  String get statusRelayed => 'Disampaikan';

  @override
  String get statusDelivered => 'Terkirim';

  @override
  String get statusRead => 'Membaca';

  @override
  String get statusFailed => 'Gagal';

  @override
  String get chatCopy => 'Menyalin';

  @override
  String get chatDeleteLocal => 'Hapus di perangkat ini';

  @override
  String get chatDeletedLocalSnack => 'Dihapus di perangkat ini';

  @override
  String get chatRetry => 'Mencoba kembali';

  @override
  String get chatSendFailed => 'Tidak terkirim — ketuk Coba lagi';

  @override
  String get chatImageNeedInternet =>
      'Hubungkan ke internet untuk mengirim gambar';

  @override
  String get chatImageTooLargeOnline =>
      'Tidak dapat mengompres gambar dengan cukup untuk dikirim';

  @override
  String get chatOpenLinkFailed => 'Tidak dapat membuka tautan';

  @override
  String get identityTitle => 'Identitas';

  @override
  String get identityScanTooltip => 'Pindai QR dengan kamera';

  @override
  String get identityCopiedHash => 'Hash kunci publik disalin';

  @override
  String get identityPeerSaved => 'Rekan disimpan dari QR';

  @override
  String get identityGalleryDenied => 'Izin perpustakaan foto ditolak';

  @override
  String get identityQrSaved => 'QR disimpan ke perpustakaan foto';

  @override
  String identityQrSaveFailed(String error) {
    return 'Tidak dapat menyimpan QR: $error';
  }

  @override
  String get peersTitle => 'Anggota jaringan';

  @override
  String get qrScanTitle => 'Pindai QR untuk menambahkan teman';

  @override
  String get qrInvalid => 'Pemindaian gagal: QR tidak valid';

  @override
  String get qrIdKeyMismatch =>
      'QR ditolak: id tidak cocok dengan kunci publik';

  @override
  String get qrCameraNotReady => 'Kamera belum siap';

  @override
  String get qrRetrySettings => 'Coba lagi / buka Pengaturan';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Tidak dapat membuka kamera: $error';
  }

  @override
  String get qrScanAlignHint => 'Sejajarkan kode QR di dalam bingkai';

  @override
  String get firmwareDownloadTitle => 'Unduh firmware ESP32';

  @override
  String get firmwareSourceOnline => 'Terbaru (online)';

  @override
  String get firmwareSourceCached => 'Salinan tersimpan (offline)';

  @override
  String get firmwareSourceBaseline => 'Garis dasar yang dibundel (offline)';

  @override
  String get firmwareSourceUnavailable => 'Tidak ada firmware yang tersedia';

  @override
  String get firmwareBaselineIncompatible =>
      'Firmware yang dibundel terlalu lama — sambungkan ke internet untuk mengunduh versi yang lebih baru';

  @override
  String get firmwareChecksumFailed =>
      'Pemeriksaan integritas firmware gagal — flashing diblokir';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware siap: $source';
  }

  @override
  String get peersRefreshTooltip => 'Menyegarkan';

  @override
  String get peersBlocked => 'Diblokir';

  @override
  String get peersNearbyBle => 'Terdekat (BLE)';

  @override
  String get peersRecentlyOnline => 'Baru-baru ini daring';

  @override
  String get peersOnlineInArea => 'Daring di daerah';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Dilihat $minutes mnt yang lalu';
  }

  @override
  String get peersOffline => 'Luring';

  @override
  String peersBlockedSnack(String id) {
    return 'Diblokir $id';
  }

  @override
  String get peersUnblockedSnack => 'Tidak diblokir';

  @override
  String get peersEmpty =>
      'Belum ada anggota di database\nPindai QR atau tunggu BLE penemuan mesh';

  @override
  String get peersOpenChat => 'Buka obrolan';

  @override
  String get peersBlockAction => 'Memblokir';

  @override
  String get peersUnblockAction => 'Buka blokir';

  @override
  String get channelPickerTooltip => 'Obrolan / #mesh / Area';

  @override
  String get locationPickerTooltip => 'Saluran lokasi';

  @override
  String get transportPickerTooltip => 'Jaring / Internet / Otomatis';

  @override
  String get onlinePeopleTooltip => 'Orang daring';

  @override
  String get unreadDirectsTooltipEmpty => 'Pesan pribadi';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count pesan pribadi yang belum dibaca';
  }

  @override
  String get onlinePeopleTitle => 'rakyat';

  @override
  String get onlinePeopleEmpty => 'Belum ada seorang pun yang online di sini';

  @override
  String onlinePeopleCount(int count) {
    return '$count daring';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · sekitar + area';

  @override
  String get peerOnlineMeshTitle => 'Seseorang di dekatnya sedang terhubung';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name berada di dekat mesh';
  }

  @override
  String get peerOnlineAreaTitle => 'Seseorang sedang online di area tersebut';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name sedang online melalui Nostr';
  }

  @override
  String get locationSheetTitle => '#saluran lokasi';

  @override
  String get channelPinsTitle => 'Disematkan';

  @override
  String get channelPinsHint =>
      'Sematkan saluran yang sering Anda gunakan — saluran tersebut tetap berada di atas';

  @override
  String get channelPinTooltip => 'Sematkan saluran ini';

  @override
  String get channelUnpinTooltip => 'Membuka peniti';

  @override
  String get locationSheetIntro =>
      'Mengobrol dengan orang-orang terdekat menggunakan geohash kasar — ​​bukan GPS yang tepat. Kehadiran di Internet menggunakan kunci Nostr anonim.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Teleportasi';

  @override
  String homeComposeHint(String channel) {
    return 'Pesan $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Kirim ke $channel — publik';
  }

  @override
  String get messageExpiryTitle => 'habis masa berlakunya';

  @override
  String get voiceRecordTapToStart => 'Ketuk untuk merekam pesan suara';

  @override
  String get voiceRecordTooShort => 'Perekaman terlalu pendek — coba lagi';

  @override
  String get voiceRecordFailed => 'Tidak dapat menyimpan rekaman — coba lagi';

  @override
  String get voicePttHold => 'Tahan untuk merekam';

  @override
  String get voicePttRelease => 'Lepaskan untuk melihat pratinjau';

  @override
  String get voicePttRecording => 'Rekaman…';

  @override
  String get voicePttDraftReady => 'Catatan suara sudah siap';

  @override
  String get voicePttDiscard => 'Membuang';

  @override
  String get voicePttReRecord => 'Rekam lagi';

  @override
  String get voicePttSend => 'Kirim catatan suara';

  @override
  String get voicePttPlayPreview => 'Putar pratinjau';

  @override
  String get voicePttStopPreview => 'Hentikan pratinjau';

  @override
  String get noticesBackfilling => 'Memuat pemberitahuan…';

  @override
  String get noticesNostrOnline => 'Nostr daring';

  @override
  String get noticesNostrOffline =>
      'Nostr offline — buletin memerlukan Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Pemberitahuan $count dimuat';
  }

  @override
  String get noticePublishFailed =>
      'Tidak dapat mempublikasikan pemberitahuan ke dewan area. Periksa koneksi Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Disimpan secara lokal. Hubungkan ke radio mesh terdekat (atau gerbang Wi‑Fi) sehingga orang lain dapat menerimanya.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Buletin dikirim ke $count perangkat terdekat melalui BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Radio terdekat terlihat, namun BLE penulisan gagal. Biarkan kedua aplikasi tetap terbuka di layar Pemberitahuan dan coba lagi (atau gunakan relai ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Penerima BLE perangkat ini belum siap. Alihkan Bluetooth dan buka kembali Pemberitahuan.';

  @override
  String get noticeDelete => 'Hapus pemberitahuan';

  @override
  String get noticeDeleteConfirmTitle => 'Hapus pemberitahuan ini?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Tindakan ini hanya akan menghapusnya di perangkat ini. Orang lain yang sudah menerimanya akan tetap melihatnya.';

  @override
  String get noticeDeleted => 'Pemberitahuan dihapus';

  @override
  String get chatNoticeHidden => 'Pemberitahuan area — buka Pemberitahuan';

  @override
  String get identityDisplayNameTitle => 'Nama tampilan';

  @override
  String get identitySaveName => 'Simpan nama';

  @override
  String get identityUserIdLabel => 'ID Pengguna (Hash Kunci Publik)';

  @override
  String get identityCopyHashTooltip => 'Salin hash kunci publik';

  @override
  String get identityMyQrTitle => 'QR saya (id + pubKey + nama)';

  @override
  String identityQrFailed(String error) {
    return 'Tidak dapat membuat QR\n$error';
  }

  @override
  String get identitySaving => 'Penghematan…';

  @override
  String get identitySaveQr => 'Simpan QR ke perpustakaan foto';

  @override
  String get identityOpenScanner => 'Buka kamera untuk memindai QR';

  @override
  String get identityQrHelp =>
      'Mintalah seorang teman memindai ini untuk menyimpan kunci publik Anda dan (jika perlu) menetapkan Anda sebagai Penerbit Terverifikasi';

  @override
  String get identityChatTip =>
      'Tip: Anda juga dapat memindai QR di obrolan untuk menambahkan kunci publik untuk E2EE';

  @override
  String get infoOpen => 'Tentang / Info';

  @override
  String get docsGuideTitle => 'Panduan pengguna';

  @override
  String get docsGuideSubtitle => 'Terbuka di peramban';

  @override
  String get docsOpenAction => 'Buka panduan';

  @override
  String get docsOpenFailed => 'Tidak dapat membuka panduan pengguna';

  @override
  String get firmwareOtaGuideTitle => 'Panduan flash & protokol OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Membuka panduan web — unduhan .bin dan langkah lengkapnya';

  @override
  String get firmwareWebDownloadsTitle => 'Pengunduhan firmware di web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Tautan per versi dan checksum di situs dokumen';

  @override
  String get inviteCopyShortLink => 'Salin tautan pendek';

  @override
  String get inviteShareLink => 'Bagikan tautan';

  @override
  String get inviteShowFullLink => 'Tautan lengkap';

  @override
  String get inviteCopyFullLink => 'Salin tautan lengkap';

  @override
  String get inviteLinkCopied => 'Tautan disalin';

  @override
  String get inviteLongPressHint => 'Tekan lama untuk tindakan tautan';

  @override
  String get inviteSendInChat => 'Kirim ResilNet obrolan…';

  @override
  String get inviteSendInChatHint =>
      'Hanya orang-orang yang kunci publiknya sudah Anda miliki';

  @override
  String get inviteSendInChatEmpty =>
      'Belum ada obrolan yang dapat dikirimi pesan.\nPindai QR, buka Area/Mesh, atau bagikan tautan di luar aplikasi terlebih dahulu.';

  @override
  String get inviteSentToChat => 'Undangan dikirim dalam obrolan';

  @override
  String get infoTabInfo => 'Informasi';

  @override
  String get infoTabSettingsHint =>
      'Buka Pengaturan dari menu bahasa, E2EE, dan alat data';

  @override
  String get infoHowToTitle => 'Cara menggunakan';

  @override
  String get infoHowToBody =>
      '• Ketuk ikon saluran untuk beralih Obrolan / #mesh / Area\n• Ketuk tempat untuk memilih ukuran geohash\n• Ketuk orang untuk anggota atau siapa yang sedang online\n• Buka Identitas/QR dari ⋮ untuk bertukar kunci secara langsung\n• Area “publik” mengirimkan E2EE tersegel ke setiap rekan online — bukan ruang teks biasa';

  @override
  String get infoFeaturesTitle => 'Fitur';

  @override
  String get infoFeatureOffline =>
      'Pesan offline melalui Bluetooth Hemat Energi';

  @override
  String get infoFeatureE2ee =>
      'Enkripsi ujung ke ujung dengan RSA-OAEP + AES-GCM (bukan Noise)';

  @override
  String get infoFeatureMultihop =>
      'Pesan dapat berpindah melalui pesan terdekat untuk dikirim lebih jauh';

  @override
  String get infoFeatureBridge =>
      'Jaring hibrida ↔ internet (Nostr) untuk amplop tertutup';

  @override
  String get infoFeatureGeo =>
      'Saluran geohash lokal untuk orang-orang terdekat (discovery UX)';

  @override
  String get infoFeatureNotices =>
      'Pemberitahuan dengan masa berlaku untuk #mesh dan Area';

  @override
  String get infoPrivacyTitle => 'Pribadi';

  @override
  String get infoPrivacyNoRoom =>
      'Tidak ada desa teks biasa/ruang obrolan publik yang terhubung';

  @override
  String get infoPrivacyFanout =>
      'Pengiriman area = penyebaran 1:1 yang disegel ke rekan-rekan dengan kunci publik yang diketahui';

  @override
  String get infoPrivacyPresence =>
      'Kehadiran area internet menggunakan tombol Nostr sementara';

  @override
  String get infoSymbolsTitle => 'Simbol';

  @override
  String get infoSymBle => 'Tautan Bluetooth langsung';

  @override
  String get infoSymMesh => 'Dapat dijangkau melalui mesh (yang lain maju)';

  @override
  String get infoSymInternet => 'Melalui internet (Nostr) — amplop tertutup';

  @override
  String get infoSymBridge => 'Tiba melalui jalur jembatan mesh↔internet';

  @override
  String get infoSymOffline => 'Offline — tidak dapat dijangkau saat ini';

  @override
  String get infoSymInArea => 'Di area saluran lokasi ini';

  @override
  String get infoSymE2eeOk => 'Sesi terenkripsi ujung ke ujung';

  @override
  String get infoSymE2eeFail =>
      'Enkripsi tidak tersedia — jangan kirim teks sensitif';

  @override
  String get infoSymVerified => 'Identitas terverifikasi / kunci diketahui';

  @override
  String get infoSymBlocked => 'Diblokir';

  @override
  String get infoSymUnread => 'Pesan pribadi yang belum dibaca';

  @override
  String get infoEmergencyTitle => 'Modus darurat';

  @override
  String get infoEmergencyBody =>
      'Ketuk tiga kali judul ResilNet di layar utama untuk menghapus pesan, kunci, dan identitas di perangkat ini.';

  @override
  String get infoLegendNote =>
      'Beberapa ikon jalur didokumentasikan di sini untuk kejelasan; centang pengiriman di chat tetap menjadi status pengiriman utama.';

  @override
  String get dangerZoneTitle => 'Zona bahaya';

  @override
  String get dangerZoneSubtitle =>
      'Menghapus pesan, kunci enkripsi, identitas Nostr, rekan, dan nama panggilan di perangkat ini. Anda akan mengaturnya lagi.';

  @override
  String get panicWipeTitle => 'Penghapusan darurat';

  @override
  String get panicWipeSubtitle =>
      'Hapus semua yang bersifat lokal — sama seperti mengetuk tiga kali judul beranda (ketuk dua kali untuk menyegarkan radio)';

  @override
  String get panicWipeConfirmTitle => 'Hapus semua data lokal?';

  @override
  String get panicWipeConfirmBody =>
      'Tindakan ini akan menghapus obrolan, kunci, dan identitas di ponsel ini secara permanen.\nRekan harus menukarkan kembali kunci QR dengan identitas baru Anda.\nHal ini tidak dapat dibatalkan.';

  @override
  String get panicWipeAction => 'Bersihkan semuanya';

  @override
  String get panicWipeSnack => 'Identitas lokal dihapus — disiapkan kembali';

  @override
  String panicWipeFailed(String error) {
    return 'Gagal melakukan penghapusan: $error';
  }

  @override
  String get meshBridgeTitle => 'Jembatan jaring';

  @override
  String get meshBridgeSubtitle =>
      'Jika diaktifkan (default), amplop tersegel dapat menggunakan mesh BLE dan internet (Nostr) secara bersamaan sehingga pulau mesh di dekatnya dapat terhubung. Jika tidak aktif, pengiriman hanya menggunakan satu jalur — jangan pernah memasukkan teks biasa ke dalam kabel.';

  @override
  String get favoritesTitle => 'Favorit';

  @override
  String get favoritesAdd => 'Tambahkan ke favorit';

  @override
  String get favoritesRemove => 'Hapus dari favorit';

  @override
  String get favoritesEmpty =>
      'Belum ada favorit — bintangi rekan dari daftar anggota';

  @override
  String get favoritesNearbyTitle => 'Favorit di dekatnya';

  @override
  String favoritesNearbyBody(String name) {
    return '$name berada di dekat mesh';
  }

  @override
  String get favoritesInAreaTitle => 'Favorit di daerah';

  @override
  String favoritesInAreaBody(String name) {
    return '$name sedang online di area ini';
  }

  @override
  String get topologyTitle => 'Topologi jala';

  @override
  String get topologySubtitle =>
      'Petunjuk rekan dan koneksi dari pengumuman mesh (hanya baca)';

  @override
  String get topologyConnectedNow => 'Terhubung sekarang (BLE)';

  @override
  String get topologyNearby => 'Terdekat (BLE)';

  @override
  String get topologyKnown => 'Rekan-rekan yang dikenal';

  @override
  String get topologyEmpty =>
      'Belum ada rekan yang mempelajarinya — tetap berada di dekat Anda dengan BLE aktif';

  @override
  String get topologyYou => 'Anda';

  @override
  String topologyStats(int peers, int links) {
    return '$peers rekan · $links tautan';
  }

  @override
  String get topologyGraphHint =>
      'Diperkirakan dari penemuan mesh terdekat — perangkat Anda disorot. Ketuk rekan untuk membuka obrolan.';

  @override
  String get topologyOpen => 'Topologi jala';

  @override
  String get slashHelpTitle => 'Perintah';

  @override
  String get slashHelpBody =>
      '/bantuan — daftar ini\n/who — orang yang online di saluran saat ini\n/drop <teks> — menyematkan pemberitahuan tersegel di sini (penggerebekan E2EE)\n\nPanduan lengkap: gunakan Panduan terbuka di bawah, atau Pengaturan → Panduan pengguna.';

  @override
  String get slashWhoEmpty =>
      'Tidak ada seorang pun yang online di saluran ini saat ini';

  @override
  String slashWhoTitle(int count) {
    return 'Daring ($count)';
  }

  @override
  String get slashDropNeedText => 'Penggunaan: / jatuhkan teks catatan Anda';

  @override
  String slashDropDone(String channel) {
    return 'Pemberitahuan dibatalkan pada $channel';
  }

  @override
  String get slashUnknown => 'Perintah tidak dikenal — coba /bantu';

  @override
  String get announceOpen => 'Pengumuman';

  @override
  String get announceTitle => 'Pengumuman';

  @override
  String get announceEmpty =>
      'Belum ada papan — buatlah papan untuk memasang pemberitahuan terkunci atau terbuka';

  @override
  String get announceCreate => 'Buat papan';

  @override
  String get announceCreateHint => 'Nama papan';

  @override
  String get announceDefaultTitle => 'Dewan komunitas';

  @override
  String get announceSettings => 'Pengaturan papan';

  @override
  String get announceAllowLocked => 'Izinkan postingan terkunci (terenkripsi).';

  @override
  String get announceAllowLockedSub =>
      'Dienkripsi ke kunci papan — pembaca memerlukan akses';

  @override
  String get announceAllowOpen => 'Izinkan postingan terbuka (teks biasa).';

  @override
  String get announceAllowOpenSub =>
      'Bukan E2EE — dapat dibaca di mesh/relay. Mati secara default.';

  @override
  String get announceComposeHint => 'Tulis pengumuman…';

  @override
  String get announceMediaInternetOnly =>
      'Pengumuman foto/suara dikirim melalui internet (bukan BLE)';

  @override
  String get announceNeedInternet =>
      'Hubungkan ke internet untuk mengirim pengumuman foto atau suara';

  @override
  String announceVoiceFailed(String error) {
    return 'Tidak dapat merekam suara: $error';
  }

  @override
  String get announceImageTooLarge => 'Gambar terlalu besar (maks ~180 KB)';

  @override
  String get announcePlayVoice => 'Putar catatan suara';

  @override
  String get announceImageLabel => '📷 Gambar';

  @override
  String get announceAudioLabel => '🎤 Catatan suara';

  @override
  String get announceModeLocked => 'Terkunci';

  @override
  String get announceModeOpen => 'Membuka';

  @override
  String get announceOpenBadge => 'BUKA · tidak dienkripsi';

  @override
  String get announceLockedBadge => 'Terkunci';

  @override
  String get announceLockedPlaceholder =>
      'Terenkripsi — meminta akses untuk membaca';

  @override
  String get announceRequestAccess => 'Minta akses';

  @override
  String get announceRequestSent => 'Permintaan akses dikirim ke pemilik papan';

  @override
  String get announceRequestFailed =>
      'Tidak dapat meminta akses (membutuhkan kunci publik pemilik)';

  @override
  String get announceOpenConfirmTitle => 'Posting tanpa enkripsi?';

  @override
  String get announceOpenConfirmBody =>
      'Postingan terbuka bukan E2EE. Siapa pun di jalur (mesh/relay) dapat membacanya. Melanjutkan?';

  @override
  String get announcePostAction => 'Pos';

  @override
  String get announcePendingRequests => 'Akses permintaan';

  @override
  String get announceApprove => 'Menyetujui';

  @override
  String get announceDeny => 'Membantah';

  @override
  String get announceGranted =>
      'Anda dapat membaca postingan terkunci di forum ini';

  @override
  String get announceOwner => 'Anda pemilik papan ini';

  @override
  String get announceCopyInvite => 'Salin teks undangan';

  @override
  String get announceShowInviteQr => 'Tampilkan undangan QR';

  @override
  String get announceScanInviteQr => 'Pindai papan undangan QR';

  @override
  String get announceFollow => 'Ikuti papan dari undangan';

  @override
  String get announceFollowHint =>
      'Tempelkan teks undangan atau tautan ResilNet dari pemiliknya';

  @override
  String get announceFollowOk => 'Papan berikut';

  @override
  String announceFollowOkNamed(String title) {
    return 'Sekarang mengikuti “$title”';
  }

  @override
  String get announceFollowFail => 'Undangan tidak valid atau rusak';

  @override
  String get announceInviteCopied => 'Teks undangan disalin';

  @override
  String get announceInviteSaveQr => 'Simpan QR';

  @override
  String get announceInviteShare => 'Bagikan undangan';

  @override
  String get announceFollowFromCompose =>
      'Undangan papan terdeteksi di kotak pesan';

  @override
  String get peerConfirmAddTitle => 'Tambahkan anggota jaringan?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Tambahkan “$name” dengan kunci publiknya sehingga Anda dapat mengirim pesan secara pribadi?';
  }

  @override
  String get peerConfirmAdd => 'Tambahkan anggota';

  @override
  String peerAddedOk(String name) {
    return 'Menambahkan $name ke anggota jaringan';
  }

  @override
  String get peerAddFromCompose =>
      'Identitas/kunci publik terdeteksi di kotak pesan';

  @override
  String get peerHashCopied => 'Hash kunci publik disalin';

  @override
  String get peerHashOpenChat => 'Buka obrolan';

  @override
  String get peerHashAddHint =>
      'Hash disalin. Minta mereka untuk membagikan tautan identitas atau QR sehingga Anda dapat menambahkan kunci publik lengkap untuk E2EE.';

  @override
  String get peerQrNoCode => 'Tidak ditemukan ResilNet QR pada gambar ini';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet identitas: “$name”\nBuka tautan atau tempel di obrolan → Tambahkan anggota\nAtau scan identitas QR.';
  }

  @override
  String get identityShareInvite => 'Bagikan tautan identitas';

  @override
  String get identityInviteCopied => 'Tautan identitas disalin';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Undangan dewan: “$title”\nBuka ResilNet → Papan komunitas → Ikuti dari undangan\nAtau scan QR / tap link di bawah.';
  }

  @override
  String get announceConfirmFollowTitle => 'Ikuti papan ini?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Ikuti “$title” dari undangan ini?';
  }

  @override
  String get announceConfirmFollow => 'Mengikuti';
}

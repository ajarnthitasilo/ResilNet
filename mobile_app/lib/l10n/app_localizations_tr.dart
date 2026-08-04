// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'ResilNet yenileniyor…';

  @override
  String get appRefreshed => 'Yenilendi — radyolar ve keşif yeniden başlatıldı';

  @override
  String appRefreshFailed(String error) {
    return 'Yenileme başarısız oldu: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Çift dokunma = yumuşak yenileme. Uzun basma = sert kurtarma. Üç kez dokunma = acil durum silme.';

  @override
  String get softRefreshTipTitle => 'ResilNet sıkışmış hissediyorsa';

  @override
  String get softRefreshTipBody =>
      'Geçici radyo yenilemesi için ResilNet (sol üst) öğesine iki kez dokunun. Hala takılıp kalıyorsanız: başlığa uzun basın, ⋮ → Sert kurtarma veya Ayarlar\'ı kullanın. Üç kez dokunma yalnızca acil durum silme işlemidir.';

  @override
  String get softRefreshTipGotIt => 'Anladım';

  @override
  String get infoSoftRefreshTitle => 'Uygulama sıkışmış gibi görünüyorsa';

  @override
  String get infoSoftRefreshStepRefresh =>
      'ResilNet (sol üst) öğesine iki kez dokunun → radyoları ve yakındaki kişileri otomatik olarak yenileyin';

  @override
  String get infoSoftRefreshStepHard =>
      'Hala sıkıştınız mı? Başlığa uzun basın veya ⋮ / Ayarlar → Sert kurtarma';

  @override
  String get infoSoftRefreshStepWait =>
      'Sonuç atıştırmalık çubuğunu bekleyin ve ardından tekrar deneyin. Oturum sıfırlama anahtarlarınızı korur.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Üç kez dokunma = acil durum silme (yerel verileri siler) — yalnızca kasıtlıysa';

  @override
  String get appRecoverySection => 'Uygulama kurtarma';

  @override
  String get appRecoverySectionSubtitle =>
      'Uygulamanın donduğunu hissettiğinizde kullanın. Yumuşak = başlığa iki kez dokunun. Zor iyileşme daha güçlüdür. Oturum sıfırlama, anahtarları silmeden hizmetleri yeniden başlatır.';

  @override
  String get appHardRecoverAction => 'Zor kurtarma';

  @override
  String get appHardRecovering => 'İyileşmek zor…';

  @override
  String get appSessionResetAction => 'Oturumu sıfırla';

  @override
  String get appSessionResetRunning => 'Oturum sıfırlanıyor…';

  @override
  String get appSessionResetConfirmTitle => 'Oturum sıfırlansın mı?';

  @override
  String get appSessionResetConfirmBody =>
      'Bu cihazda ResilNet hizmetlerini yeniden başlatır. Kimlik anahtarlarınız saklanır.';

  @override
  String get appRecoveryBusy => 'Kurtarma zaten çalışıyor…';

  @override
  String get appRecoveryOk => 'Kurtarma tamamlandı';

  @override
  String get appRecoveryPartial =>
      'Kurtarma işlemi bazı adımların atlanmasıyla tamamlandı; hâlâ takılıp kalıyorsanız tekrar deneyin';

  @override
  String get appRecoveryFailed =>
      'Kurtarma başarısız oldu; Oturumu sıfırlamayı deneyin veya uygulamayı işletim sisteminden çıkmaya zorlayın';

  @override
  String get localWifiTitle => 'Yerel Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Yakındaki cihazları internet olmadan bağlayın; tek bir LAN\'da olmakla aynı şey.';

  @override
  String get localWifiNotGatewayHint =>
      'ESP32 LoRa ağ geçidi SoftAP değil. Bu yalnızca telefon↔telefon / LAN\'dır.';

  @override
  String get localWifiUnavailable =>
      'Yerel Wi‑Fi henüz hazır değil; uygulamanın başlatılmasını bekleyin.';

  @override
  String get lxmfBridgeTitle => 'Ana düğüm';

  @override
  String get lxmfBridgeSubtitle =>
      'Wi‑Fi cihazınızda mühürlü sohbetleri aktaran isteğe bağlı Mac veya Pi. Varsayılan olarak kapalıdır. Uçtan uca şifrelemenin yerini almaz.';

  @override
  String get lxmfBridgeEnable => 'Ana düğümü kullan';

  @override
  String get lxmfBridgeDisabledHint =>
      'Yalnızca köprü uygulaması bu ağdaki bir Mac veya Pi\'de çalışırken açın.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Çevrimiçi — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Ana düğüme ulaşılamıyor — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Ana düğüm adresi';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP veya http://IP:bağlantı noktası — örnek 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Eş → LXMF hedef (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Durumu kaydet ve yenile';

  @override
  String get lxmfBridgeLabHint => 'Gelişmiş: labs/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Ana düğüm ayarları';

  @override
  String get lxmfBridgeCheckConnection => 'Bağlantıyı kontrol edin';

  @override
  String get lxmfBridgeStatusOnline => 'Ev düğümüne bağlanıldı';

  @override
  String get lxmfBridgeStatusOffline => 'Ana düğüme ulaşılamıyor';

  @override
  String get lxmfBridgeYourDest =>
      'Bu düğümün adresi (arkadaşlarınızla paylaşın)';

  @override
  String get lxmfBridgeCopyDest => 'Adresi kopyala';

  @override
  String get lxmfBridgeDestCopied => 'Adres kopyalandı';

  @override
  String get lxmfBridgeLinkedPeers => 'Bağlantılı arkadaşlar';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Her arkadaşın ev düğümü adresine bir kez ihtiyacı vardır. Daha sonra mühürlü sohbetler bu yolu kullanabilir.';

  @override
  String get lxmfBridgeNoLinks => 'Henüz bağlı arkadaş yok.';

  @override
  String get lxmfBridgeAddLink => 'Bir arkadaşınızı bağlayın';

  @override
  String get lxmfBridgePickPeer => 'Arkadaş';

  @override
  String get lxmfBridgePeerDest => 'Ev düğümü adresi';

  @override
  String get lxmfBridgePeerDestHint =>
      'Ana düğüm ekranından 32 karakterlik kod';

  @override
  String get lxmfBridgeInvalidDest =>
      'Bu adres geçerli görünmüyor. Kodun tamamını ana düğümden yapıştırın.';

  @override
  String get lxmfBridgeRemoveLink => 'Bağlantıyı kaldır';

  @override
  String get lxmfBridgeSaveLink => 'Kaydetmek';

  @override
  String get lxmfBridgeLinkSaved => 'Arkadaş bağlantılı';

  @override
  String get lxmfBridgeNoPeers =>
      'Henüz mesaj gönderilebilecek kişi yok; önce bir arkadaş ekleyin.';

  @override
  String get lxmfBridgeHelp =>
      'Köprünün Mac/Pi\'de çalışır durumda kalmasını sağlayın. Bu yol LAN\'ınızda kalır; LoRa değildir ve internet veya Bluetooth ağının yerini almaz.';

  @override
  String get localWifiModeHotspot => 'Yakında';

  @override
  String get localWifiModeRouter => 'Yönlendirici';

  @override
  String get localWifiHotspotIntro =>
      'Bir cihaz Kişisel Erişim Noktasını paylaşır. Diğerleri bu erişim noktasına katılır, ardından ResilNet onları yerel ağda bulur.';

  @override
  String get localWifiHostAction => 'Ağ oluştur (Ana Bilgisayar)';

  @override
  String get localWifiJoinAction => 'Ağa katıl';

  @override
  String get localWifiHostSteps =>
      '1. iOS/Android Ayarlarını açın ve Kişisel Erişim Noktasını (veya İnternet Paylaşımını) açın.\n2. Arkadaşlarınıza erişim noktası adını (ve şifresini) söyleyin.\n3. Buraya geri gelin ve \"Erişim noktası açık — beklemeye başlayın\" seçeneğine dokunun.';

  @override
  String get localWifiHostReady => 'Erişim noktası açık — beklemeye başlayın';

  @override
  String get localWifiHostWaiting => 'Arkadaşların katılmasını bekliyorum...';

  @override
  String get localWifiJoinSteps =>
      '1. Sistem Ayarlarını açın ve arkadaşınızın Kişisel Erişim Noktasına katılın.\n2. Buraya dönün ve \"Bağlandım - ara\"ya dokunun.';

  @override
  String get localWifiJoinReady => 'Bağlandım — ara';

  @override
  String get localWifiRouterIntro =>
      'Her cihazı aynı Wi‑Fi yönlendiriciye/AP\'ye bağlayın. Yönlendiricinin internete ihtiyacı yoktur; yalnızca paylaşılan bir yerel ağ vardır.';

  @override
  String get localWifiRouterSearch => 'Bu Wi‑Fi üzerinde ara';

  @override
  String get localWifiRefreshNetwork => 'Wi‑Fi bilgisini yenile';

  @override
  String get localWifiRouterNoWifiTitle => 'Wi‑Fi üzerinde değil';

  @override
  String get localWifiRouterNoWifiBody =>
      'Sistem Ayarlarında yönlendiricinin Wi‑Fi öğesine katılın, ardından tekrar arayın.';

  @override
  String get localWifiDiscovering => 'Yerel Wi‑Fi aranıyor…';

  @override
  String get localWifiPeersFound => 'Bu ağdaki cihazlar';

  @override
  String get localWifiStop => 'Durmak';

  @override
  String get localWifiSsidUnknown => 'Wi‑Fi adı kullanılamıyor';

  @override
  String get localWifiStubBanner => 'LAN soketi bekleniyor…';

  @override
  String get localWifiLiveBanner =>
      'LAN keşfi canlı (UDP) — bu Wi‑Fi\'da duyuru + mühürlü sohbet';

  @override
  String get localWifiEmptyHotspot =>
      'Henüz cihaz yok.\nArkadaşlarınızın erişim noktanıza katılıp katılmadıklarını ve Yerel Ağ erişimine izin verip vermediklerini kontrol edin.';

  @override
  String get localWifiEmptyRouter =>
      'Henüz cihaz yok.\nAynı SSID\'yi mi? Yerel Ağa izin veriliyor mu? Bazı yönlendiriciler cihazdan cihaza trafiği engeller (AP izolasyonu).';

  @override
  String get localWifiIsolationHelp => 'Neden birbirimizi bulamıyoruz?';

  @override
  String get localWifiIsolationTitle =>
      'Yönlendirici istemcileri izole edebilir';

  @override
  String get localWifiIsolationBody =>
      'AP/İstemci izolasyonu (veya misafir ağı) açıksa, aynı Wi‑Fi üzerindeki telefonlar konuşamaz. Yalıtımı kapatın, ana SSID\'yi kullanın veya Yakın (Hotspot) moduna geçin.';

  @override
  String get localWifiPeerReady => 'Sohbete hazır (anahtarı var)';

  @override
  String get localWifiPeerNeedKey =>
      'Bulundu — anahtar alışverişi için QR\'yi tarayın';

  @override
  String get localWifiErrorTitle => 'Yerel Wi‑Fi hatası';

  @override
  String get localWifiErrorBody =>
      'Bir şeyler ters gitti. Durun ve tekrar deneyin.';

  @override
  String get preparingSystem => 'Sistem hazırlanıyor…';

  @override
  String get bootFailedTitle => 'Başlatılamadı';

  @override
  String get retry => 'Tekrar deneyin';

  @override
  String get bootRecoveryAction => 'Yeni kimlik başlat (yerel verileri sil)';

  @override
  String get bootRecoveryConfirmTitle => 'Yeni kimlik başlatılsın mı?';

  @override
  String get bootRecoveryConfirmBody =>
      'Bu işlem, bu cihazdaki yerel sohbetleri, anahtarları ve kimliği kalıcı olarak silecektir.\nEşlerinizin yeni kimliğinizle QR\'nizi tekrar taraması gerekir.\nBu geri alınamaz.';

  @override
  String get bootRecoveryRunning => 'Yerel kimlik sıfırlanıyor…';

  @override
  String get bootRecoverySuccess => 'Yerel kimlik sıfırlama işlemi tamamlandı';

  @override
  String bootRecoveryFailed(String error) {
    return 'Kimlik sıfırlanamadı: $error';
  }

  @override
  String get cancel => 'İptal etmek';

  @override
  String get save => 'Kaydetmek';

  @override
  String get close => 'Kapalı';

  @override
  String get start => 'Başlangıç';

  @override
  String get send => 'Göndermek';

  @override
  String get settings => 'Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get languageSubtitle =>
      'Uygulama varsayılan olarak telefonunuzun dilini takip eder (desteklendiğinde). Diğer diller İngilizceye geri dönüyor. Ayrıca burada bir dili de kilitleyebilirsiniz.';

  @override
  String get languageSystem => 'Sistem varsayılanı';

  @override
  String get languageThai => 'Tay dili';

  @override
  String get languageEnglish => 'İngilizce';

  @override
  String get notificationsTooltip => 'Bildirim ayarları';

  @override
  String get enableMessageNotifications => 'Mesaj bildirimlerini etkinleştir';

  @override
  String get settingsNotificationsSubtitle =>
      'Çevrimiçi 1:1 mesajlar ve kişiler (yerel uyarılar)';

  @override
  String get networkMembersTooltip => 'Ağ üyeleri';

  @override
  String get identityQrTooltip => 'Kimlik / QR';

  @override
  String get feedDirects => 'Sohbet';

  @override
  String get feedMesh => '#örgü';

  @override
  String get feedGeo => 'Alan';

  @override
  String get feedDirectsSubtitle => 'Özel E2EE mesajları';

  @override
  String get feedMeshSubtitle => 'Yakındaki eşler (BLE)';

  @override
  String get feedGeoSubtitle => 'Geohash keşif kanalı';

  @override
  String get peerIdHint =>
      'Sohbet başlatmak için Alıcı Kimliğini (Genel Anahtar Karması) yapıştırın';

  @override
  String get directsEmpty =>
      'Henüz sohbet yok; başlamak için bir QR tarayın veya Alıcı Kimliğini yapıştırın\nMesajlar gönderilmeden önce E2EE ile mühürlenir (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • sohbeti açmak için dokunun';

  @override
  String get meshIntro =>
      'BLE aralığındaki eşler — özel bir E2EE sohbeti için dokunun (#mesh\'te herkese açık oluşturma yapılmaz)\nHibrit yönlendirici aracılığıyla gönderir (çevrimiçiyken BLE + LoRa + Nostr)';

  @override
  String get meshEmptyRunning =>
      'Henüz yakınlarda eş yok; uygulamayı BLE menzilindeki başka bir cihazda açın';

  @override
  String get meshEmptyStopped =>
      'BLE çalışmıyor — Bluetooth / Konum izni verin';

  @override
  String get meshNearbyPrefix => 'Yakında';

  @override
  String get meshRetentionTitle => 'Mesajları otomatik sil';

  @override
  String get meshRetentionSubtitle =>
      'Daha eski yerel sohbet geçmişi otomatik olarak kaldırılır';

  @override
  String get meshRetentionKeep => 'Kale';

  @override
  String get meshRetention1Day => '1 gün';

  @override
  String get meshRetention3Days => '3 gün';

  @override
  String get meshRetention7Days => '7 gün';

  @override
  String get refreshLocationTooltip => 'Konumu yenile';

  @override
  String get geoIntro =>
      'Bu geohash\'taki çevrimiçi kişilere 1:1 veya alan geneline açık bir yayılımla mesaj gönderilebilir (hala eş başına E2EE mühürlüdür - düz metin değil)';

  @override
  String geoEmpty(String channel) {
    return '$channel bölgesinde henüz çevrimiçi kimse yok\nTaşıma → İnternet/Otomatik\'i kullanın, Nostr\'ı bekleyin, konumu yenileyin';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return '$channel\'da çevrimiçi • 1:1 E2EE için dokunun';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Yakınlarda (alan varlığı bekleniyor) • 1:1 E2EE için dokunun';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return '$channel\'de Nostr\'de görüldü • yalnızca keşif (eski)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Eski anonim varlık — bağlı bir eş için bekleyin veya QR alışverişi yapın';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE yakında — 1:1 E2EE\'yi başlatmak için QR\'yi tarayın';

  @override
  String get geoInternetDiscoverHint =>
      'Alan İnternet keşfi için Nostr bağlı olması gerekiyor (Ayarlar → Aktarım → İnternet/Otomatik)';

  @override
  String get geoEmptyNoLocation =>
      'Konum henüz çözülmedi — GPS\'e izin verin ve geohash\'ınızı Nostr üzerinde yayınlamak için yenileyin';

  @override
  String get geoEmptyNeedsPermission =>
      'Konum izni reddedildi — Ayarlar → Gizlilik → Konum\'da ResilNet\'ye izin verin';

  @override
  String get geoEmptyServicesDisabled =>
      'Konum Servisleri kapalı; bunları Ayarlar\'dan açın';

  @override
  String get geoEmptyNoGpsFix =>
      'GPS düzeltmesi alınamadı (Wi‑Fi iPad\'lerde yaygındır) — aşağıda geohash\'ı manuel olarak ayarlayın';

  @override
  String get geoEmptyTeleportHint =>
      'Yer simgesine dokunun → bir geohash girin (ör. w5) → Işınlan';

  @override
  String get geoSetGeohashManually => 'Geohash\'ı ayarla';

  @override
  String get geoTeleportHint =>
      'GPS yok mu? Geohash önekini girin (2-7 karakter, örneğin w5) ve Işınlan\'a dokunun';

  @override
  String get geoTeleportInvalid =>
      'Geçersiz geohash — yalnızca base32 harf/sayı kullanın (ör. w5 veya w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Alan $channel olarak ayarlandı';
  }

  @override
  String geoManualActive(String channel) {
    return 'Manuel alan: $channel (GPS yenilemesi geçersiz kılınacaktır)';
  }

  @override
  String get geoEmptyNoNostr =>
      'hazır Nostr değil — Yeniden Bağlan\'a dokunun (init başarılı olana kadar 0/0)';

  @override
  String get geoEmptyMeshOnly =>
      'Aktarım yalnızca Mesh\'tedir — Nostr üzerindeki eşleri keşfetmek için İnternet\'e veya Otomatik\'e geçin';

  @override
  String geoEmptyWaiting(String channel) {
    return '$channel bölgesinde henüz kimse yok — Alan + İnternet\'i her iki cihazda da açık tutun ve yaklaşık 60 saniye bekleyin';
  }

  @override
  String get geoChannelFallback => '#alan';

  @override
  String get geoRefreshLocation => 'Konumu yenile';

  @override
  String get settingsClearLocationTitle => 'Konumu temizle';

  @override
  String get settingsClearLocationSubtitle =>
      'GPS / ışınlanma geohash\'ını kaldırın (Alan #— olur)';

  @override
  String get settingsClearLocationConfirmTitle => 'Konumu temizle?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Bu cihazda depolanan geohash\'ı siler. Daha sonra GPS\'i yenileyebilir veya ışınlanabilirsiniz.';

  @override
  String get settingsClearLocationAction => 'Konumu temizle';

  @override
  String get settingsClearLocationSnack => 'Konum temizlendi';

  @override
  String get chatVoiceTooLarge => 'Sesli not çok büyük — maksimum ~30 saniye';

  @override
  String get chatVoiceNeedInternet =>
      'Sesli not için İnternet (Nostr) gerekiyor — tek başına BLE için çok büyük';

  @override
  String get chatVoiceSentInternet => 'İnternet üzerinden gönderilen sesli not';

  @override
  String get noticeAnonMention => 'değinmek';

  @override
  String get noticeAnonDm => 'doğrudan mesaj';

  @override
  String get noticeAnonHug => 'sarılmak';

  @override
  String get noticeAnonSlap => 'tokat';

  @override
  String get noticeAnonBlock => 'engellemek';

  @override
  String get noticeAnonNeedKey =>
      'Henüz ortak anahtar yok — önce QR\'yi 1:1 ile değiştirin';

  @override
  String get noticeAnonActionSent => 'Gönderilmiş';

  @override
  String noticeAnonBlocked(String anon) {
    return '$anon engellendi';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '* sarılıyor $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* $anon\'a tokat atar *';
  }

  @override
  String get geoReconnectNostr => 'Nostr\'i yeniden bağla';

  @override
  String get nostrSectionTitle => 'Nostr röleler';

  @override
  String get nostrSectionSubtitle =>
      'İnternet mesajlaşma ve Alan bulma bu aktarımları kullanır. Durum çevrimdışı kalırsa yeniden bağlan\'a dokunun.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Bağlandı $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Çevrimdışı — röleler listeleniyor ancak hiçbiri bağlı değil';

  @override
  String get nostrStatusNotInit =>
      'Başlatılmadı (0/0) — başlatmak için Yeniden Bağlan\'a dokunun';

  @override
  String get nostrReconnectAction => 'Nostr\'i yeniden bağla';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr bağlandı ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Hâlâ çevrimdışı — Wi‑Fi/hücresel\'i kontrol edin veya tekrar deneyin';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Başarısız: $error';
  }

  @override
  String get nostrReconnecting => 'Rölelere bağlanılıyor…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return '$channel bölgesinde İnternet (Nostr) • mühürlü sohbete hazır';
  }

  @override
  String get transportModeTitle => 'Bölge taşımacılığı';

  @override
  String get transportModeSubtitle =>
      'Ağ = Nostr olmadığında yakındaki BLE (radyo) · İnternet ve Otomatik = Nostr kişi listesi';

  @override
  String get transportModeMesh => 'ağ';

  @override
  String get transportModeInternet => 'internet';

  @override
  String get transportModeAuto => 'Otomatik';

  @override
  String get geoPublicHint => 'Bu alandaki çevrimiçi herkese genel mesaj';

  @override
  String get geoPublicSend => 'Halk';

  @override
  String geoPublicHelp(int count) {
    return '$count çevrimiçi akrana/eşlere mühürlü dağıtım — her biri özel bir zarf alır';
  }

  @override
  String geoPublicSent(int count) {
    return 'Bu bölgedeki $count akranlara gönderildi';
  }

  @override
  String get geoPublicSentNone =>
      'Çevrimiçi mesaj gönderilebilecek eş yok — Anahtarları olan eşlerle Alan/Mesh\'i açın veya BLE/Nostr\'yi bekleyin';

  @override
  String get areaPublicBadge => 'Alan kamu';

  @override
  String get geoErrorPermission =>
      'Konum okunamadı — konum iznini kontrol edin';

  @override
  String get geoPrecisionRegion => 'Bölge';

  @override
  String get geoPrecisionProvince => 'Vilayet';

  @override
  String get geoPrecisionCity => 'Şehir';

  @override
  String get geoPrecisionNeighborhood => 'Komşu';

  @override
  String get geoPrecisionBlock => 'Engellemek';

  @override
  String get aliasTitle => 'Takma adı ayarlayın (İletişim Takma Adı)';

  @override
  String get aliasHintBody =>
      'Bu takma ad yalnızca bu cihazda depolanıyor (yalnızca yerel)\nHiçbir zaman E2EE trafiğiyle gönderilmez';

  @override
  String get aliasLabel => 'Takma ad';

  @override
  String get aliasHint => 'örneğin “Köy muhtarı”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Cihazlar';

  @override
  String get settingsFirmwareTitle =>
      'ESP32 donanım yazılımını indirin / güncelleyin';

  @override
  String get settingsFirmwareSubtitle =>
      '.bin dosyalarını indirin ve ESP32 kartını OTA aracılığıyla güncelleyin';

  @override
  String get mtBridgeTitle => 'Meshtastic köprü';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Salt metin A/B köprüsü — ResilNet değil E2EE';

  @override
  String get mtBridgeIntro =>
      'Kısa düz metni Meshtastic ve ResilNet arasında taşıyın. A ve B modları aynı anda çalışamaz. Bu uçtan uca şifreleme değildir.';

  @override
  String get mtBridgeModeLabel => 'Mod';

  @override
  String get mtBridgeModeOff => 'Kapalı';

  @override
  String get mtBridgeModeA => 'A\'yı Al';

  @override
  String get mtBridgeModeB => 'Çıkış B';

  @override
  String get mtBridgeModeOffShort => 'Kapalı';

  @override
  String get mtBridgeModeAShort => 'A\'da';

  @override
  String get mtBridgeModeBShort => 'Çıkış B';

  @override
  String get mtBridgeMutexHint =>
      'Bir mod seçildiğinde diğeri otomatik olarak kapanır. Eşzamanlı A+B desteklenmez.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Demo (günlüğe kaydetme)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Gelen metin, Bildirimler altında #meshtastic olarak görünür. Örgü rölesi isteğe bağlıdır (varsayılan olarak kapalıdır).';

  @override
  String get mtBridgeRelayTitle => 'Ayrıca ResilNet ağ üzerinde geçiş yapın';

  @override
  String get mtBridgeRelayHint =>
      'Açıldığında imzalı kamu bültenleri yayınlanır. Kapalı = yalnızca bu telefonun Bildirimleri.';

  @override
  String get mtBridgeSimulateHint => 'Demo mesajı';

  @override
  String get mtBridgeSimulate => 'Meshtastic mesajını simüle et';

  @override
  String get mtBridgeIngestOk => 'Bildirimlere Alındı ​​(#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Uyarı: buraya gönderilen mesajlar ResilNet E2EE DEĞİLDİR. Meshtastic yolundaki herkes bunları okuyabilir.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Yayınlanacak metin';

  @override
  String get mtBridgeSend => 'Meshtastic\'a gönder';

  @override
  String get mtBridgeEgressOk =>
      'Meshtastic için sıraya alındı ​​(günlüğe/geçmişe bakın)';

  @override
  String get mtBridgeLastEgress => 'Son çıkış';

  @override
  String get mtBridgeEgressHistory => 'Son çıkış';

  @override
  String get mtBridgeOffHint =>
      'Köprüyü kullanmak için Alım (A) veya Çıkışı (B) açın.';

  @override
  String get mtBridgeNoticeBadge => 'MEŞTASTİK · E2EE değil';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'MQTT aktarımını kullan';

  @override
  String get mtBridgeUseMqttHint =>
      'Kapalı = yalnızca demo kaydı (MQTT gelenler göz ardı edilir). Bağlandığında giriş/çıkış için Açık = MQTT.';

  @override
  String get mtBridgeMqttHost => 'Komisyoncu ana bilgisayarı';

  @override
  String get mtBridgeMqttPort => 'Liman';

  @override
  String get mtBridgeMqttTls => 'TLS (mqtts) kullanın';

  @override
  String get mtBridgeMqttTlsHint =>
      'Tipik bağlantı noktası 8883. Sistem sertifikalarını kullanır; el sıkışma hatalarında yumuşak bir şekilde başarısız olur.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Otomatik yeniden bağlan';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Açık olduğunda istemci, düşmelerden sonra yeniden bağlanmaya çalışır. Durum, geri yüklenene kadar bağlanılıyor ifadesini gösterir.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Konu yardımcıları';

  @override
  String get mtBridgeMqttRegion => 'Bölge öneki (isteğe bağlı)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Ayarlandığında Uygula, kökü msh/<region>/2/json olarak yeniden oluşturur (konu kökünü geçersiz kılar).';

  @override
  String get mtBridgeMqttTopicRoot => 'JSON konu kökü';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Downlink kanal adı';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Kök uygula → abone ol / konuları yayınla';

  @override
  String get mtBridgeMqttAdvanced => 'Gelişmiş MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, yeniden bağlanma, konular, kimlik bilgileri';

  @override
  String get mtBridgeMqttTopicIn => 'Konuya abone ol';

  @override
  String get mtBridgeMqttTopicOut => 'Konuyu yayınla';

  @override
  String get mtBridgeMqttGatewayFrom => 'Ağ geçidi düğüm kimliği (kimden)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Ondalık kimlik veya !hex — metin gönderme bağlantısı için gereklidir';

  @override
  String get mtBridgeMqttChannelIndex => 'Örgü kanal dizini (isteğe bağlı 0–7)';

  @override
  String get mtBridgeMqttUser => 'Kullanıcı adı (isteğe bağlı)';

  @override
  String get mtBridgeMqttPass => 'Şifre (isteğe bağlı)';

  @override
  String get mtBridgeMqttPassStored =>
      'Bu cihazda bir şifre kayıtlıdır (gösterilmemiştir).';

  @override
  String get mtBridgeMqttPassReplace =>
      'Yeni şifre (saklamak için boş bırakın)';

  @override
  String get mtBridgeMqttPassReplaceHint =>
      'Saklanan şifreyi korumak için boş bırakın.';

  @override
  String get mtBridgeMqttPassClear => 'Şifreyi temizle';

  @override
  String get mtBridgeMqttSave => 'MQTT ayarlarını kaydet';

  @override
  String get mtBridgeMqttSaved => 'MQTT ayarlar kaydedildi';

  @override
  String get mtBridgeMqttConnect => 'Bağlamak';

  @override
  String get mtBridgeMqttDisconnect => 'Bağlantıyı kes';

  @override
  String get mtBridgeMqttConnected => 'MQTT bağlandı';

  @override
  String get mtBridgeMqttConnecting => 'MQTT bağlanılıyor…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT bağlantısı kesildi';

  @override
  String get mtBridgeMqttError => 'MQTT hatası';

  @override
  String get mtBridgeErrModeIngest => 'Önce Beslemeye (A) geçin';

  @override
  String get mtBridgeErrModeEgress => 'Önce Çıkışa (B) geçin';

  @override
  String get mtBridgeErrRate => 'Yavaşlayın — hız sınırlı';

  @override
  String get mtBridgeErrDedupe => 'Yinelenen ileti göz ardı edildi';

  @override
  String get mtBridgeErrLoop => 'Köprü döngüsünü önlemek için düştü';

  @override
  String get mtBridgeErrEmpty => 'Mesaj boş';

  @override
  String get mtBridgeErrPublish => 'Yayınlama başarısız oldu';

  @override
  String get mtBridgeErrNotConnected => 'MQTT bağlı değil';

  @override
  String get mtBridgeErrMissingHost => 'MQTT aracı ana bilgisayarını girin';

  @override
  String get mtBridgeErrMissingTopic => 'Abone olma ve konuları yayınlama';

  @override
  String get mtBridgeErrMissingFromNode =>
      'Gönderim metni için ağ geçidi düğüm kimliğini (kimden) girin';

  @override
  String get mtBridgeErrConnect => 'MQTT bağlantı başarısız oldu';

  @override
  String get mtBridgeErrConnectTls => 'MQTT TLS bağlantısı başarısız oldu';

  @override
  String get settingsData => 'Veri';

  @override
  String get settingsDataHint =>
      'Veritabanını küçültmek için yerel mesajları silin; kimlik, anahtarlar ve eşler korunur';

  @override
  String get settingsSaveHistoryTitle => 'Mesaj geçmişini kaydet';

  @override
  String get settingsSaveHistorySubtitle =>
      'Kapalıyken, mesajlar kabloda E2EE olarak kalır ve yalnızca bu oturum için saklanır (yerel sohbet geçmişinde değil). Kendi metniniz bu cihazda hâlâ düz metin olarak gösteriliyor.';

  @override
  String get settingsPrivacy => 'Mahremiyet';

  @override
  String get settingsE2eeTitle => 'Uçtan uca şifreleme';

  @override
  String get settingsE2eeSubtitle =>
      'Her zaman açık — mesajlar gönderilmeden önce RSA-OAEP + AES-GCM ile mühürlenir. Röleler ve yakındaki atlamalar içerikleri okuyamaz.';

  @override
  String get settingsScreenshotTitle => 'Ekran görüntüsü uyarıları';

  @override
  String get settingsScreenshotSubtitle =>
      'Bu cihaz ekranı yakaladığında sohbette bir sistem hattı göster';

  @override
  String get settingsNostrExpiryTitle => 'Nostr mesaj zaman tutma';

  @override
  String get settingsNostrExpirySubtitle =>
      'Nostr aracılığıyla çevrimiçi olduğunda mühürlü zarfların yerel olarak ne kadar süre kalması gerekir?';

  @override
  String get noticeExpiresIn => 'süresi doluyor';

  @override
  String get noticesTitle => 'Bildirimler';

  @override
  String get noticesMeshIntro =>
      'Genel bülten — radyo aralığındaki herkes tarafından görülebilir, şifrelenmez. Telefondan telefona çevrimdışı geçiş yapar ve yakındaki ResilNet geçiş kutuları bir kopyasını saklar, böylece daha sonra gelen kişiler onu görmeye devam eder.';

  @override
  String get noticesMeshPublicBadge => 'KAMU · şifrelenmemiş';

  @override
  String get noticesGeoIntro =>
      'Diğer ziyaretçilerin bulabilmesi için bu yerle ilgili kısa notlar ekleyin.';

  @override
  String get noticesEmpty => 'henüz bildirim yok';

  @override
  String get noticesEmptyHint =>
      'Buradaki insanlar için ilk bildirimi sabitleyin.';

  @override
  String get noticesComposeHint => 'bir duyuru yayınla...';

  @override
  String get noticesUrgent => 'acil';

  @override
  String get noticesOpen => 'Bildirimler';

  @override
  String get screenshotTaken => '* ekran görüntüsü aldın *';

  @override
  String get chatAttachImage => 'Resim ekle';

  @override
  String get chatImageLabel => 'Resim';

  @override
  String get chatImageTooLarge =>
      'Resim çok büyük — başka bir fotoğraf deneyin';

  @override
  String get chatNostrExpiry => 'Nostr sakla';

  @override
  String geoPublicComposeHint(String channel) {
    return '$channel\'a gönder — herkese açık';
  }

  @override
  String get settingsClearTitle => 'Tüm mesajları temizle';

  @override
  String get settingsClearSubtitle => 'Bu cihazdaki tüm sohbetleri sil';

  @override
  String get settingsClearConfirmTitle => 'Tüm mesajlar silinsin mi?';

  @override
  String get settingsClearConfirmBody =>
      'Bu işlem, bu cihazdaki tüm sohbet mesajlarını siler.\nAkranlar ve takma adlar kaldırılmaz.';

  @override
  String get settingsClearAction => 'Verileri temizle';

  @override
  String get settingsClearedSnack => 'Veriler temizlendi';

  @override
  String settingsVersion(String version) {
    return 'sürüm $version';
  }

  @override
  String get meshBleScanning => 'BLE: düğümler taranıyor';

  @override
  String get meshBleEsp32Scanning => 'ESP32: yakındaki bir düğüm aranıyor';

  @override
  String get meshBleSyncing => 'BLE: ESP32 ile senkronize ediliyor';

  @override
  String get meshNostrPublishing => 'Nostr: yayınlama';

  @override
  String get meshBleIdle => 'BLE ağ açık — henüz yakınlarda telefon yok';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE ağ — yakında $count telefon(lar)';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: izin gerekli';

  @override
  String get meshBlePausedCamera =>
      'BLE kamera için duraklatıldı — Başlat BLE\'a dokunun';

  @override
  String get meshBleStopped =>
      'BLE kapalı — Bluetooth\'un açık olduğunu kontrol edin ve ardından Başlat BLE öğesine dokunun';

  @override
  String get meshBleRestart => 'BLE\'ı başlat';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Lok $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'İzinleri kontrol edin ve BLE\'ı başlatın';

  @override
  String get meshNostrOffline => 'Nostr çevrimdışı';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count yakındaki eşler • LoRa $lora • senkronizasyon ~${meters}m';
  }

  @override
  String get meshLoraReady => 'hazır';

  @override
  String get meshLoraNotReady => 'hazır değil';

  @override
  String meshGatewayProgress(String label) {
    return 'Ağ Geçidi UDP\'si: $label';
  }

  @override
  String get meshGatewayReady => 'Ağ Geçidi UDP: hazır';

  @override
  String get permissionTitle => 'BLE ağ ağını başlatmak için erişime izin ver';

  @override
  String get permissionBody =>
      'Uygulamanın, topluluk mesajlaşması için Bluetooth\'a (tarama / bağlanma / reklam verme), Konum\'a (eski Android cihazlar için) ve Mikrofona (sohbet ve duyurulardaki sesli notlar için) ihtiyacı vardır.';

  @override
  String get permissionE2ee =>
      'Uçtan Uca Şifreleme (E2EE)\nAktarma düğümleri mesaj içeriğini okuyamıyor';

  @override
  String get permissionReady => 'İzinler hazır';

  @override
  String get permissionRequest => 'İzin ver ve devam et';

  @override
  String get permissionNotReadySnack =>
      'Sistem henüz hazır değil — biraz bekleyin ve tekrar deneyin';

  @override
  String get permissionDeniedSnack =>
      'İzinler tamamlanmadı — Ayarlar > ResilNet\'ı açın ve Bluetooth / Konum / Mikrofon\'a izin verin';

  @override
  String get permissionMicDenied =>
      'Mikrofon erişimi reddedildi; Ayarlar\'dan sesli not kaydetmesine izin verin';

  @override
  String get permissionMicOpenSettings => 'Ayarlar';

  @override
  String get permissionCameraDenied =>
      'Kamera erişimi reddedildi; Ayarlar\'dan QR kodlarını taramasına izin verin';

  @override
  String get permissionCameraFailed =>
      'QR kodlarını taramak için kamera izni gereklidir';

  @override
  String get permissionCameraOpenSettings => 'Ayarlar';

  @override
  String get permissionPhotosDenied =>
      'Fotoğraf kitaplığına erişim reddedildi; QR kodunuzu kaydetmesine Ayarlar\'dan izin verin';

  @override
  String get permissionPhotosFailed =>
      'QR kodunuzu kaydetmek için fotoğraf kitaplığı izni gereklidir';

  @override
  String get permissionPhotosOpenSettings => 'Ayarlar';

  @override
  String permissionFailedSnack(String error) {
    return 'İzin isteği başarısız oldu: $error';
  }

  @override
  String get permissionFooter => 'ResilNet Mimari • Sakla ve İlet Çoklu Atlama';

  @override
  String get onboardingSkip => 'Atlamak';

  @override
  String get onboardingNext => 'Sonraki';

  @override
  String get onboardingStart => 'Başlayın';

  @override
  String get onboardingWelcomeTitle => 'ResilNet\'a hoş geldiniz';

  @override
  String get onboardingWelcomeBody =>
      'İnternet olmasa bile ağ ağı üzerinden ResilNet üzerinde sohbet edin';

  @override
  String get onboardingFriendsTitle => 'Kolayca arkadaş ekleyin';

  @override
  String get onboardingFriendsBody =>
      'Identity\'den bir QR paylaşın veya genel anahtarları paylaşmak için bir arkadaşınızın QR\'sini tarayın';

  @override
  String get onboardingChannelsTitle => 'Şifreli sohbet + yakındaki kanallar';

  @override
  String get onboardingChannelsBody =>
      'Yakındaki eşleri bulmak için #mesh / Area (geohash) geçişini yapın — mesajlar BLE ağ ve Nostr üzerinden E2EE olarak kalır';

  @override
  String get chatTitle => 'Sohbet (E2EE)';

  @override
  String get chatScanTooltip => 'Bir eş eklemek için QR\'yi tarayın';

  @override
  String get chatBlockTooltip => 'Bu göndereni engelle';

  @override
  String get chatBlockedSnack => 'Engellendi: bildirim yok / aktarma yok';

  @override
  String get chatAliasTooltip => 'Takma adı ayarla';

  @override
  String get chatReceiverPemLabel => 'Alıcı ortak anahtarı (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Arkadaşınızın genel anahtarını yapıştırın (QR\'dan / paylaşılan dosyadan)';

  @override
  String get chatNeedPeerKey =>
      'Önce bu eşin QR\'sini tarayın (doğrulanmış ortak anahtar gereklidir)';

  @override
  String get chatPeerKeyMismatch =>
      'Saklanan ortak anahtar bu eş kimliğiyle eşleşmiyor';

  @override
  String chatVoiceFailed(String error) {
    return 'Ses kaydedilemedi: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Sesli not çalınamadı: $error';
  }

  @override
  String get chatPlayVoice => 'Sesli notu çal';

  @override
  String get chatPauseVoice => 'Duraklat';

  @override
  String get chatVoiceLabelSent => '🎤 Sesli not (mühürlü)';

  @override
  String get chatVoiceLabel => '🎤 Sesli not';

  @override
  String get chatDecryptFailed => '[şifre çözme başarısız oldu]';

  @override
  String chatSentSealed(String preview) {
    return '[mühürlü • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => 'Mühürlü';

  @override
  String get chatComposeHint => 'Bir mesaj yazın… (gönderildiğinde mühürlenir)';

  @override
  String get chatEmptyThread =>
      'Henüz mesaj yok\nAğ üzerinden göndermek için aşağıya yazın';

  @override
  String chatLoadFailed(String error) {
    return 'Konuşma yüklenemedi: $error';
  }

  @override
  String get chatEmojiTooltip => 'Emoji';

  @override
  String get statusPending => 'Askıda olması';

  @override
  String get statusSent => 'Gönderilmiş';

  @override
  String get statusRelayed => 'Aktarılan';

  @override
  String get statusDelivered => 'Teslim edilmiş';

  @override
  String get statusRead => 'Okumak';

  @override
  String get statusFailed => 'Arızalı';

  @override
  String get chatCopy => 'Kopyala';

  @override
  String get chatDeleteLocal => 'Bu cihazda sil';

  @override
  String get chatDeletedLocalSnack => 'Bu cihazda silindi';

  @override
  String get chatRetry => 'Yeniden dene';

  @override
  String get chatSendFailed => 'Teslim edilmedi; Yeniden Dene\'ye dokunun';

  @override
  String get chatImageNeedInternet =>
      'Görüntü göndermek için internete bağlanın';

  @override
  String get chatImageTooLargeOnline =>
      'Resim gönderilecek kadar sıkıştırılamadı';

  @override
  String get chatOpenLinkFailed => 'Bağlantı açılamadı';

  @override
  String get identityTitle => 'Kimlik';

  @override
  String get identityScanTooltip => 'QR\'yi kamerayla tarayın';

  @override
  String get identityCopiedHash => 'Ortak anahtar karması kopyalandı';

  @override
  String get identityPeerSaved => 'Eş QR\'den kaydedildi';

  @override
  String get identityGalleryDenied => 'Fotoğraf kitaplığı izni reddedildi';

  @override
  String get identityQrSaved => 'QR, fotoğraf kitaplığına kaydedildi';

  @override
  String identityQrSaveFailed(String error) {
    return 'QR kaydedilemedi: $error';
  }

  @override
  String get peersTitle => 'Ağ üyeleri';

  @override
  String get qrScanTitle => 'Arkadaş eklemek için QR\'yi tarayın';

  @override
  String get qrInvalid => 'Tarama başarısız oldu: geçersiz QR';

  @override
  String get qrIdKeyMismatch =>
      'QR reddedildi: kimlik genel anahtarla eşleşmiyor';

  @override
  String get qrCameraNotReady => 'Kamera hazır değil';

  @override
  String get qrRetrySettings => 'Tekrar deneyin / Ayarları açın';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Kamera açılamadı: $error';
  }

  @override
  String get qrScanAlignHint => 'QR kodunu çerçevenin içine hizalayın';

  @override
  String get firmwareDownloadTitle => 'ESP32 donanım yazılımını indirin';

  @override
  String get firmwareSourceOnline => 'En son (çevrimiçi)';

  @override
  String get firmwareSourceCached => 'Kaydedilen kopya (çevrimdışı)';

  @override
  String get firmwareSourceBaseline => 'Paketlenmiş temel (çevrimdışı)';

  @override
  String get firmwareSourceUnavailable => 'Firmware yok';

  @override
  String get firmwareBaselineIncompatible =>
      'Birlikte verilen ürün yazılımı çok eski; daha yeni bir sürümü indirmek için internete bağlanın';

  @override
  String get firmwareChecksumFailed =>
      'Ürün yazılımı bütünlük kontrolünde başarısız oldu — yanıp sönme engellendi';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Firmware hazır: $source';
  }

  @override
  String get peersRefreshTooltip => 'Yenile';

  @override
  String get peersBlocked => 'Engellendi';

  @override
  String get peersNearbyBle => 'Yakında (BLE)';

  @override
  String get peersRecentlyOnline => 'Son zamanlarda çevrimiçi';

  @override
  String get peersOnlineInArea => 'Bölgede çevrimiçi';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return '$minutes dakika önce görüldü';
  }

  @override
  String get peersOffline => 'Çevrimdışı';

  @override
  String peersBlockedSnack(String id) {
    return '$id engellendi';
  }

  @override
  String get peersUnblockedSnack => 'Engelleme kaldırıldı';

  @override
  String get peersEmpty =>
      'Veritabanında henüz üye yok\nBir QR tarayın veya BLE ağ keşfini bekleyin';

  @override
  String get peersOpenChat => 'Sohbeti aç';

  @override
  String get peersBlockAction => 'Engellemek';

  @override
  String get peersUnblockAction => 'Engellemeyi kaldır';

  @override
  String get channelPickerTooltip => 'Sohbet / #mesh / Alan';

  @override
  String get locationPickerTooltip => 'Konum kanalı';

  @override
  String get transportPickerTooltip => 'Ağ / İnternet / Otomatik';

  @override
  String get onlinePeopleTooltip => 'Çevrimiçi insanlar';

  @override
  String get unreadDirectsTooltipEmpty => 'Özel mesajlar';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count okunmamış özel mesajlar';
  }

  @override
  String get onlinePeopleTitle => 'insanlar';

  @override
  String get onlinePeopleEmpty => 'Henüz burada kimse çevrimiçi değil';

  @override
  String onlinePeopleCount(int count) {
    return '$count çevrimiçi';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · yakındaki + bölge';

  @override
  String get peerOnlineMeshTitle => 'Yakınlarda ağ üzerinde biri var';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name ağ üzerinde yakında';
  }

  @override
  String get peerOnlineAreaTitle => 'Bölgede çevrimiçi olan biri';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name Nostr aracılığıyla çevrimiçi';
  }

  @override
  String get locationSheetTitle => '#konum kanalları';

  @override
  String get channelPinsTitle => 'Sabitlendi';

  @override
  String get channelPinsHint =>
      'Sık kullandığınız kanalları sabitleyin; üstte kalırlar';

  @override
  String get channelPinTooltip => 'Bu kanalı sabitle';

  @override
  String get channelUnpinTooltip => 'Sabitlemeyi kaldır';

  @override
  String get locationSheetIntro =>
      'Hassas GPS yerine kaba geohash kullanarak yakınınızdaki kişilerle sohbet edin. İnternetteki varlık anonim Nostr anahtarlarını kullanır.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Işınlanma';

  @override
  String homeComposeHint(String channel) {
    return 'Mesaj $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return '$channel\'a gönder — herkese açık';
  }

  @override
  String get messageExpiryTitle => 'süresi doluyor';

  @override
  String get voiceRecordTapToStart => 'Sesli mesajı kaydetmek için dokunun';

  @override
  String get voiceRecordTooShort => 'Kayıt çok kısa; tekrar deneyin';

  @override
  String get voiceRecordFailed => 'Kayıt kaydedilemedi; tekrar deneyin';

  @override
  String get voicePttHold => 'Kaydetmek için basılı tutun';

  @override
  String get voicePttRelease => 'Önizlemek için yayınlayın';

  @override
  String get voicePttRecording => 'Kayıt…';

  @override
  String get voicePttDraftReady => 'Sesli not hazır';

  @override
  String get voicePttDiscard => 'At';

  @override
  String get voicePttReRecord => 'Tekrar kaydet';

  @override
  String get voicePttSend => 'Sesli not gönder';

  @override
  String get voicePttPlayPreview => 'Önizlemeyi oynat';

  @override
  String get voicePttStopPreview => 'Önizlemeyi durdur';

  @override
  String get noticesBackfilling => 'Bildirimler yükleniyor…';

  @override
  String get noticesNostrOnline => 'Nostr çevrimiçi';

  @override
  String get noticesNostrOffline =>
      'Nostr çevrimdışı — bültenin internete ihtiyacı var';

  @override
  String noticesBackfillLoaded(int count) {
    return '$count bildirimi yüklendi';
  }

  @override
  String get noticePublishFailed =>
      'Bölge kuruluna bildirim yayınlanamadı. Nostr bağlantısını kontrol edin.';

  @override
  String get noticeMeshPublishNoLink =>
      'Yerel olarak kaydedildi. Başkalarının alabilmesi için yakındaki bir ağ radyosuna (veya Wi‑Fi ağ geçidine) bağlanın.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bülten BLE üzerinden yakındaki $count cihaza/cihazlara gönderildi.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Yakındaki radyolar görüldü, ancak BLE yazma işlemi başarısız oldu. Bildirimler ekranında her iki uygulamayı da açık tutun ve tekrar deneyin (veya bir ESP32 geçişi kullanın).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Bu cihazın BLE alıcısı hazır değil. Bluetooth\'u değiştirin ve Bildirimleri yeniden açın.';

  @override
  String get noticeDelete => 'Bildirimi sil';

  @override
  String get noticeDeleteConfirmTitle => 'Bu bildirim silinsin mi?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Bu, onu yalnızca bu cihazda kaldırır. Zaten almış olan diğer kişiler bunu görmeye devam edecek.';

  @override
  String get noticeDeleted => 'Bildirim silindi';

  @override
  String get chatNoticeHidden => 'Bölge bildirimi — Bildirimleri aç';

  @override
  String get identityDisplayNameTitle => 'Ekran adı';

  @override
  String get identitySaveName => 'Adı kaydet';

  @override
  String get identityUserIdLabel => 'Kullanıcı Kimliği (Genel Anahtar Karması)';

  @override
  String get identityCopyHashTooltip => 'Genel anahtar karmasını kopyala';

  @override
  String get identityMyQrTitle => 'QR\'im (kimlik + pubKey + ad)';

  @override
  String identityQrFailed(String error) {
    return 'QR oluşturulamadı\n$error';
  }

  @override
  String get identitySaving => 'Kaydediliyor…';

  @override
  String get identitySaveQr => 'QR\'yi fotoğraf kitaplığına kaydet';

  @override
  String get identityOpenScanner => 'QR\'yi taramak için kamerayı açın';

  @override
  String get identityQrHelp =>
      'Bir arkadaşınızın genel anahtarınızı kaydetmesi ve (gerekirse) sizi Doğrulanmış Verici olarak ayarlaması için bunu taramasını sağlayın';

  @override
  String get identityChatTip =>
      'İpucu: E2EE için genel anahtar eklemek üzere sohbetteki QR\'yi de tarayabilirsiniz.';

  @override
  String get infoOpen => 'Hakkında / Bilgi';

  @override
  String get docsGuideTitle => 'Kullanım kılavuzu';

  @override
  String get docsGuideSubtitle => 'Tarayıcıda açılır';

  @override
  String get docsOpenAction => 'Kılavuzu aç';

  @override
  String get docsOpenFailed => 'Kullanım kılavuzu açılamadı';

  @override
  String get firmwareOtaGuideTitle => 'Flash kılavuzu ve OTA protokolü';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Web kılavuzunu açar - .bin indirmeleri ve tüm adımlar';

  @override
  String get firmwareWebDownloadsTitle => 'Web\'de bellenim indirmeleri';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Dokümanlar sitesinde sürüm başına bağlantılar ve sağlama toplamları';

  @override
  String get inviteCopyShortLink => 'Kısa bağlantıyı kopyala';

  @override
  String get inviteShareLink => 'Bağlantıyı paylaş';

  @override
  String get inviteShowFullLink => 'Tam bağlantı';

  @override
  String get inviteCopyFullLink => 'Bağlantının tamamını kopyala';

  @override
  String get inviteLinkCopied => 'Bağlantı kopyalandı';

  @override
  String get inviteLongPressHint => 'Bağlantı eylemleri için uzun basın';

  @override
  String get inviteSendInChat => 'ResilNet sohbete gönder…';

  @override
  String get inviteSendInChatHint =>
      'Yalnızca zaten ortak anahtarınız olan kişiler';

  @override
  String get inviteSendInChatEmpty =>
      'Henüz mesajlaşılabilir sohbet yok.\nBir QR tarayın, Alan/Mesh\'i açın veya bağlantıyı önce uygulamanın dışında paylaşın.';

  @override
  String get inviteSentToChat => 'Davet sohbette gönderildi';

  @override
  String get infoTabInfo => 'Bilgi';

  @override
  String get infoTabSettingsHint =>
      'Dil, E2EE ve veri araçları menüsünden Ayarlar\'ı açın';

  @override
  String get infoHowToTitle => 'Nasıl kullanılır';

  @override
  String get infoHowToBody =>
      '• Sohbet / #mesh / Alan arasında geçiş yapmak için kanal simgesine dokunun\n• Geohash boyutunu seçmek için yere dokunun\n• Üyeler veya kimlerin çevrimiçi olduğu için kişilere dokunun\n• Anahtarları şahsen değiştirmek için ⋮\'den Kimlik/QR\'yi açın\n• \"Herkese açık\" alan, düz metin odasına değil, her çevrimiçi eşe mühürlü E2EE gönderir';

  @override
  String get infoFeaturesTitle => 'Özellikler';

  @override
  String get infoFeatureOffline =>
      'Bluetooth Low Energy aracılığıyla çevrimdışı mesajlaşma';

  @override
  String get infoFeatureE2ee =>
      'RSA-OAEP + AES-GCM (Gürültü değil) ile uçtan uca şifreleme';

  @override
  String get infoFeatureMultihop =>
      'Mesajlar daha uzağa gitmek için yakındaki eşler arasında atlayabilir';

  @override
  String get infoFeatureBridge =>
      'Kapalı zarflar için hibrit ağ ↔ internet (Nostr)';

  @override
  String get infoFeatureGeo =>
      'Yakındaki kişiler için yerel geohash kanalları (keşif UX)';

  @override
  String get infoFeatureNotices =>
      '#mesh ve Area için geçerlilik süresi dolan bildirimler';

  @override
  String get infoPrivacyTitle => 'Mahremiyet';

  @override
  String get infoPrivacyNoRoom =>
      'Kabloda düz metin köyü / halka açık sohbet odası yok';

  @override
  String get infoPrivacyFanout =>
      'Alan gönderimi = bilinen ortak anahtarlara sahip eşlere mühürlü 1:1 yayılma';

  @override
  String get infoPrivacyPresence =>
      'İnternet alanı varlığı geçici Nostr tuşlarını kullanır';

  @override
  String get infoSymbolsTitle => 'Semboller';

  @override
  String get infoSymBle => 'Doğrudan Bluetooth bağlantısı';

  @override
  String get infoSymMesh => 'Ağ üzerinden ulaşılabilir (diğerleri ileri doğru)';

  @override
  String get infoSymInternet => 'İnternet üzerinden (Nostr) — mühürlü zarflar';

  @override
  String get infoSymBridge => 'Mesh↔internet köprüsü yoluyla ulaştı';

  @override
  String get infoSymOffline => 'Çevrimdışı — şu anda ulaşılamıyor';

  @override
  String get infoSymInArea => 'Bu konum kanalının alanında';

  @override
  String get infoSymE2eeOk => 'Uçtan uca şifrelenmiş oturum';

  @override
  String get infoSymE2eeFail =>
      'Şifreleme kullanılamıyor — hassas metin göndermeyin';

  @override
  String get infoSymVerified => 'Kimlik doğrulandı / bilinen anahtar';

  @override
  String get infoSymBlocked => 'Engellendi';

  @override
  String get infoSymUnread => 'Okunmamış özel mesaj';

  @override
  String get infoEmergencyTitle => 'Acil durum modu';

  @override
  String get infoEmergencyBody =>
      'Bu cihazdaki mesajları, anahtarları ve kimliği silmek için ana ekrandaki ResilNet başlığına üç kez dokunun.';

  @override
  String get infoLegendNote =>
      'Bazı yol simgeleri netlik sağlamak amacıyla burada belgelenmiştir; sohbetteki teslimat onay işaretleri birincil gönderme durumu olarak kalır.';

  @override
  String get dangerZoneTitle => 'Tehlike bölgesi';

  @override
  String get dangerZoneSubtitle =>
      'Bu cihazdaki mesajları, şifreleme anahtarlarını, Nostr kimliğini, eşleri ve takma adları siler. Tekrar kuracaksınız.';

  @override
  String get panicWipeTitle => 'Acil durum silme';

  @override
  String get panicWipeSubtitle =>
      'Yerel her şeyi silin; ana sayfa başlığına üç kez dokunmakla aynıdır (çift dokunma radyoları yeniler)';

  @override
  String get panicWipeConfirmTitle => 'Tüm yerel veriler silinsin mi?';

  @override
  String get panicWipeConfirmBody =>
      'Bu işlem, bu telefondaki sohbetleri, anahtarları ve kimliği kalıcı olarak siler.\nEşlerinizin QR anahtarlarını yeni kimliğinizle yeniden değiştirmesi gerekir.\nBu geri alınamaz.';

  @override
  String get panicWipeAction => 'Her şeyi sil';

  @override
  String get panicWipeSnack => 'Yerel kimlik silindi; yeniden kuruldu';

  @override
  String panicWipeFailed(String error) {
    return 'Silme başarısız oldu: $error';
  }

  @override
  String get meshBridgeTitle => 'Örgü köprü';

  @override
  String get meshBridgeSubtitle =>
      'Açık (varsayılan) olduğunda, kapalı zarflar hem BLE ağı hem de interneti (Nostr) birlikte kullanabilir, böylece yakındaki ağ adaları bağlanabilir. Kapalıyken, gönderimler yalnızca tek bir yol kullanır; hiçbir zaman kabloya düz metin koymaz.';

  @override
  String get favoritesTitle => 'Favoriler';

  @override
  String get favoritesAdd => 'Favorilere ekle';

  @override
  String get favoritesRemove => 'Favorilerden kaldır';

  @override
  String get favoritesEmpty =>
      'Henüz favori yok — üye listesinden bir arkadaşınıza yıldız ekleyin';

  @override
  String get favoritesNearbyTitle => 'Yakındaki favori';

  @override
  String favoritesNearbyBody(String name) {
    return '$name ağ üzerinde yakında';
  }

  @override
  String get favoritesInAreaTitle => 'Bölgedeki favori';

  @override
  String favoritesInAreaBody(String name) {
    return '$name bu bölgede çevrimiçi';
  }

  @override
  String get topologyTitle => 'Örgü topolojisi';

  @override
  String get topologySubtitle =>
      'Mesh duyurusundan eşler ve bağlantı ipuçları (salt okunur)';

  @override
  String get topologyConnectedNow => 'Şimdi bağlanıldı (BLE)';

  @override
  String get topologyNearby => 'Yakında (BLE)';

  @override
  String get topologyKnown => 'Bilinen akranlar';

  @override
  String get topologyEmpty =>
      'Henüz öğrenilen arkadaş yok — BLE açıkken yakınınızda kalın';

  @override
  String get topologyYou => 'Sen';

  @override
  String topologyStats(int peers, int links) {
    return '$peers eşler · $links bağlantılar';
  }

  @override
  String get topologyGraphHint =>
      'Yakındaki ağ keşfinden tahmin edilmiştir; cihazınız vurgulanmıştır. Sohbeti açmak için bir arkadaşınıza dokunun.';

  @override
  String get topologyOpen => 'Örgü topolojisi';

  @override
  String get slashHelpTitle => 'Komutlar';

  @override
  String get slashHelpBody =>
      '/help — bu liste\n/who — geçerli kanaldaki çevrimiçi kişiler\n/drop <metin> — buraya mühürlü bir bildirim sabitleyin (E2EE yayılımı)\n\nTam kılavuz: Aşağıdaki kılavuzu aç veya Ayarlar → Kullanım kılavuzu\'nu kullanın.';

  @override
  String get slashWhoEmpty => 'Şu anda bu kanalda çevrimiçi kimse yok';

  @override
  String slashWhoTitle(int count) {
    return 'Çevrimiçi ($count)';
  }

  @override
  String get slashDropNeedText => 'Kullanım: /not metninizi bırakın';

  @override
  String slashDropDone(String channel) {
    return '$channel ile ilgili bildirim bırakıldı';
  }

  @override
  String get slashUnknown => 'Bilinmeyen komut - /help\'i deneyin';

  @override
  String get announceOpen => 'Duyurular';

  @override
  String get announceTitle => 'Duyurular';

  @override
  String get announceEmpty =>
      'Henüz pano yok; kilitli veya açık bildirimleri yayınlamak için bir pano oluşturun';

  @override
  String get announceCreate => 'Pano oluştur';

  @override
  String get announceCreateHint => 'Yönetim kurulu adı';

  @override
  String get announceDefaultTitle => 'Topluluk kurulu';

  @override
  String get announceSettings => 'Kart ayarları';

  @override
  String get announceAllowLocked => 'Kilitli (şifreli) yayınlara izin ver';

  @override
  String get announceAllowLockedSub =>
      'Pano anahtarıyla şifrelendi — okuyucuların erişime ihtiyacı var';

  @override
  String get announceAllowOpen => 'Açık (düz metin) gönderilere izin ver';

  @override
  String get announceAllowOpenSub =>
      'E2EE değil — ağ/rölelerde okunabilir. Varsayılan olarak kapalıdır.';

  @override
  String get announceComposeHint => 'Bir duyuru yazın…';

  @override
  String get announceMediaInternetOnly =>
      'Fotoğraflı/sesli duyurular internet üzerinden gönderilir (BLE değil)';

  @override
  String get announceNeedInternet =>
      'Fotoğraflı veya sesli duyurular göndermek için internete bağlanın';

  @override
  String announceVoiceFailed(String error) {
    return 'Ses kaydedilemedi: $error';
  }

  @override
  String get announceImageTooLarge => 'Resim çok büyük (maks ~180 KB)';

  @override
  String get announcePlayVoice => 'Sesli notu çal';

  @override
  String get announceImageLabel => '📷 Resim';

  @override
  String get announceAudioLabel => '🎤 Sesli not';

  @override
  String get announceModeLocked => 'Kilitli';

  @override
  String get announceModeOpen => 'Açık';

  @override
  String get announceOpenBadge => 'AÇIK · şifrelenmemiş';

  @override
  String get announceLockedBadge => 'Kilitli';

  @override
  String get announceLockedPlaceholder => 'Şifreli — okuma erişimi isteyin';

  @override
  String get announceRequestAccess => 'Erişim iste';

  @override
  String get announceRequestSent => 'Pano sahibine erişim isteği gönderildi';

  @override
  String get announceRequestFailed =>
      'Erişim isteğinde bulunulamadı (sahibin ortak anahtarı gerekiyor)';

  @override
  String get announceOpenConfirmTitle => 'Şifreleme olmadan yayınlansın mı?';

  @override
  String get announceOpenConfirmBody =>
      'Açık gönderiler E2EE değildir. Yoldaki herkes (kafes/röleler) bunları okuyabilir. Devam etmek?';

  @override
  String get announcePostAction => 'Postalamak';

  @override
  String get announcePendingRequests => 'Erişim istekleri';

  @override
  String get announceApprove => 'Onaylamak';

  @override
  String get announceDeny => 'Reddetmek';

  @override
  String get announceGranted =>
      'Bu panodaki kilitli gönderileri okuyabilirsiniz';

  @override
  String get announceOwner => 'Bu panonun sahibi sizsiniz';

  @override
  String get announceCopyInvite => 'Davet metnini kopyala';

  @override
  String get announceShowInviteQr => 'Davet QR\'sini göster';

  @override
  String get announceScanInviteQr => 'Tarama panosu davet QR\'si';

  @override
  String get announceFollow => 'Davetiyeden panoyu takip et';

  @override
  String get announceFollowHint =>
      'Davet metnini veya sahibinden gelen ResilNet bağlantısını yapıştırın';

  @override
  String get announceFollowOk => 'Takip panosu';

  @override
  String announceFollowOkNamed(String title) {
    return 'Şimdi “$title” takip ediliyor';
  }

  @override
  String get announceFollowFail => 'Davet geçersiz veya hasarlı';

  @override
  String get announceInviteCopied => 'Davet metni kopyalandı';

  @override
  String get announceInviteSaveQr => 'QR\'yi kaydet';

  @override
  String get announceInviteShare => 'Daveti paylaş';

  @override
  String get announceFollowFromCompose =>
      'Mesaj kutusunda kurul daveti algılandı';

  @override
  String get peerConfirmAddTitle => 'Ağ üyesi eklensin mi?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Onlara özel olarak mesaj gönderebilmeniz için genel anahtarıyla birlikte “$name” eklensin mi?';
  }

  @override
  String get peerConfirmAdd => 'Üye ekle';

  @override
  String peerAddedOk(String name) {
    return 'Ağ üyelerine $name eklendi';
  }

  @override
  String get peerAddFromCompose =>
      'Mesaj kutusunda kimlik/ortak anahtar algılandı';

  @override
  String get peerHashCopied => 'Ortak anahtar karması kopyalandı';

  @override
  String get peerHashOpenChat => 'Sohbeti aç';

  @override
  String get peerHashAddHint =>
      'Hash kopyalandı. E2EE\'nin genel anahtarının tamamını ekleyebilmeniz için kimlik bağlantılarını veya QR\'lerini paylaşmalarını isteyin.';

  @override
  String get peerQrNoCode => 'Bu resimde ResilNet QR bulunamadı';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet kimliği: “$name”\nBağlantıyı açın veya sohbete yapıştırın → Üye ekle\nVeya kimlik QR\'sini tarayın.';
  }

  @override
  String get identityShareInvite => 'Kimlik bağlantısını paylaş';

  @override
  String get identityInviteCopied => 'Kimlik bağlantısı kopyalandı';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Kurul daveti: “$title”\nResilNet\'ı açın → Topluluk panoları → Davetten takip edin\nVeya QR\'yi tarayın / aşağıdaki bağlantıya dokunun.';
  }

  @override
  String get announceConfirmFollowTitle => 'Bu panoyu takip ediyor musun?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Bu davetteki “$title” takip edilsin mi?';
  }

  @override
  String get announceConfirmFollow => 'Takip etmek';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'ResilNet';

  @override
  String get communityTitle => 'ResilNet';

  @override
  String get appRefreshing => 'Đang làm mới ResilNet…';

  @override
  String get appRefreshed =>
      'Đã làm mới - radio và tính năng khám phá đã được khởi động lại';

  @override
  String appRefreshFailed(String error) {
    return 'Làm mới không thành công: $error';
  }

  @override
  String get appRefreshTitleHint =>
      'Nhấn đúp = làm mới nhẹ nhàng. Nhấn và giữ = khôi phục cứng. Nhấn ba lần = xóa khẩn cấp.';

  @override
  String get softRefreshTipTitle => 'Nếu ResilNet cảm thấy bế tắc';

  @override
  String get softRefreshTipBody =>
      'Nhấn đúp ResilNet (trên cùng bên trái) để làm mới đài phát thanh nhẹ. Nếu vẫn bị kẹt: nhấn và giữ tiêu đề, sử dụng ⋮ → Khôi phục cứng hoặc Cài đặt. Nhấn ba lần chỉ là thao tác xóa khẩn cấp.';

  @override
  String get softRefreshTipGotIt => 'Hiểu rồi';

  @override
  String get infoSoftRefreshTitle => 'Nếu ứng dụng cảm thấy bị kẹt';

  @override
  String get infoSoftRefreshStepRefresh =>
      'Nhấn đúp ResilNet (trên cùng bên trái) → radio làm mới nhẹ nhàng và những người ở gần';

  @override
  String get infoSoftRefreshStepHard =>
      'Vẫn bị mắc kẹt? Nhấn và giữ tiêu đề hoặc ⋮ / Cài đặt → Khôi phục cứng';

  @override
  String get infoSoftRefreshStepWait =>
      'Đợi thanh thông báo kết quả, sau đó thử lại. Đặt lại phiên sẽ giữ lại chìa khóa của bạn.';

  @override
  String get infoSoftRefreshStepWipe =>
      'Nhấn ba lần = xóa khẩn cấp (xóa dữ liệu cục bộ) - chỉ khi có chủ ý';

  @override
  String get appRecoverySection => 'Khôi phục ứng dụng';

  @override
  String get appRecoverySectionSubtitle =>
      'Sử dụng khi ứng dụng có cảm giác bị treo. Mềm = nhấn đúp vào tiêu đề. Phục hồi cứng mạnh hơn. Đặt lại phiên khởi động lại dịch vụ mà không xóa phím.';

  @override
  String get appHardRecoverAction => 'Phục hồi khó khăn';

  @override
  String get appHardRecovering => 'Khó phục hồi…';

  @override
  String get appSessionResetAction => 'Đặt lại phiên';

  @override
  String get appSessionResetRunning => 'Đang đặt lại phiên…';

  @override
  String get appSessionResetConfirmTitle => 'Đặt lại phiên?';

  @override
  String get appSessionResetConfirmBody =>
      'Khởi động lại các dịch vụ ResilNet trên thiết bị này. Khóa nhận dạng của bạn được lưu giữ.';

  @override
  String get appRecoveryBusy => 'Quá trình khôi phục đang chạy…';

  @override
  String get appRecoveryOk => 'Quá trình khôi phục đã hoàn tất';

  @override
  String get appRecoveryPartial =>
      'Quá trình khôi phục đã hoàn tất với một số bước bị bỏ qua — hãy thử lại nếu vẫn bị kẹt';

  @override
  String get appRecoveryFailed =>
      'Khôi phục không thành công - hãy thử Đặt lại phiên hoặc buộc thoát ứng dụng khỏi HĐH';

  @override
  String get localWifiTitle => 'Địa phương Wi‑Fi';

  @override
  String get localWifiSubtitle =>
      'Liên kết các thiết bị lân cận mà không cần internet — giống như trên một mạng LAN.';

  @override
  String get localWifiNotGatewayHint =>
      'Không phải cổng ESP32 LoRa SoftAP. Đây chỉ là điện thoại↔điện thoại/mạng LAN.';

  @override
  String get localWifiUnavailable =>
      'Wi‑Fi cục bộ chưa sẵn sàng - hãy đợi khởi động ứng dụng.';

  @override
  String get lxmfBridgeTitle => 'Nút nhà';

  @override
  String get lxmfBridgeSubtitle =>
      'Máy Mac hoặc Pi tùy chọn trên Wi‑Fi của bạn sẽ chuyển tiếp các cuộc trò chuyện kín. Tắt theo mặc định. Không thay thế mã hóa đầu cuối.';

  @override
  String get lxmfBridgeEnable => 'Sử dụng nút nhà';

  @override
  String get lxmfBridgeDisabledHint =>
      'Chỉ bật khi ứng dụng bridge đang chạy trên máy Mac hoặc Pi trên mạng này.';

  @override
  String lxmfBridgeOnline(String dest) {
    return 'Trực tuyến — $dest';
  }

  @override
  String lxmfBridgeOffline(String error) {
    return 'Không thể truy cập nút nhà — $error';
  }

  @override
  String get lxmfBridgeBaseUrl => 'Địa chỉ nút nhà';

  @override
  String get lxmfBridgeBaseUrlHelper =>
      'IP hoặc http://IP:port — ví dụ 192.168.1.10:8766';

  @override
  String get lxmfBridgeIdentityMap => 'Ngang hàng → LXMF đích (JSON)';

  @override
  String get lxmfBridgeRefresh => 'Lưu và làm mới trạng thái';

  @override
  String get lxmfBridgeLabHint => 'Nâng cao: phòng thí nghiệm/reticulum_lxmf';

  @override
  String get lxmfBridgeOpen => 'Cài đặt nút chủ';

  @override
  String get lxmfBridgeCheckConnection => 'Kiểm tra kết nối';

  @override
  String get lxmfBridgeStatusOnline => 'Đã kết nối với nút nhà';

  @override
  String get lxmfBridgeStatusOffline => 'Nút nhà không thể truy cập được';

  @override
  String get lxmfBridgeYourDest => 'Địa chỉ của nút này (chia sẻ với bạn bè)';

  @override
  String get lxmfBridgeCopyDest => 'Sao chép địa chỉ';

  @override
  String get lxmfBridgeDestCopied => 'Đã sao chép địa chỉ';

  @override
  String get lxmfBridgeLinkedPeers => 'Bạn bè được liên kết';

  @override
  String get lxmfBridgeLinkedPeersHint =>
      'Mỗi người bạn cần địa chỉ nút nhà của họ một lần. Sau đó, các cuộc trò chuyện kín có thể sử dụng đường dẫn này.';

  @override
  String get lxmfBridgeNoLinks => 'Chưa có bạn bè nào được liên kết.';

  @override
  String get lxmfBridgeAddLink => 'Liên kết một người bạn';

  @override
  String get lxmfBridgePickPeer => 'Bạn bè';

  @override
  String get lxmfBridgePeerDest => 'Địa chỉ nút nhà của họ';

  @override
  String get lxmfBridgePeerDestHint =>
      'Mã 32 ký tự từ màn hình nút Trang chủ của họ';

  @override
  String get lxmfBridgeInvalidDest =>
      'Địa chỉ đó có vẻ không hợp lệ. Dán mã đầy đủ từ nút nhà của họ.';

  @override
  String get lxmfBridgeRemoveLink => 'Hủy liên kết';

  @override
  String get lxmfBridgeSaveLink => 'Cứu';

  @override
  String get lxmfBridgeLinkSaved => 'Đã liên kết bạn bè';

  @override
  String get lxmfBridgeNoPeers =>
      'Chưa có địa chỉ liên hệ nào có thể nhắn tin — trước tiên hãy thêm một người bạn.';

  @override
  String get lxmfBridgeHelp =>
      'Giữ bridge chạy trên Mac/Pi. Đường dẫn này vẫn nằm trên mạng LAN của bạn — nó không phải là LoRa và không thay thế mạng Internet hoặc Bluetooth.';

  @override
  String get localWifiModeHotspot => 'lân cận';

  @override
  String get localWifiModeRouter => 'Bộ định tuyến';

  @override
  String get localWifiHotspotIntro =>
      'Một thiết bị chia sẻ Điểm truy cập cá nhân. Những người khác tham gia điểm phát sóng đó, sau đó ResilNet tìm thấy họ trên mạng cục bộ.';

  @override
  String get localWifiHostAction => 'Tạo mạng (Máy chủ)';

  @override
  String get localWifiJoinAction => 'Tham gia mạng';

  @override
  String get localWifiHostSteps =>
      '1. Mở Cài đặt iOS/Android và bật Điểm truy cập cá nhân (hoặc Chia sẻ Internet).\n2. Cho bạn bè biết tên điểm phát sóng (và mật khẩu).\n3. Quay lại đây và nhấn vào “Điểm phát sóng đang bật - bắt đầu chờ”.';

  @override
  String get localWifiHostReady => 'Điểm phát sóng đang bật - bắt đầu chờ';

  @override
  String get localWifiHostWaiting => 'Đang chờ bạn bè tham gia…';

  @override
  String get localWifiJoinSteps =>
      '1. Mở Cài đặt hệ thống và tham gia Điểm truy cập cá nhân của bạn bè bạn.\n2. Quay lại đây và nhấn vào “Tôi đã kết nối - tìm kiếm”.';

  @override
  String get localWifiJoinReady => 'Tôi đã kết nối - tìm kiếm';

  @override
  String get localWifiRouterIntro =>
      'Kết nối mọi thiết bị với cùng một bộ định tuyến/AP Wi‑Fi. Bộ định tuyến không cần internet - chỉ có mạng cục bộ được chia sẻ.';

  @override
  String get localWifiRouterSearch => 'Tìm kiếm trên Wi‑Fi này';

  @override
  String get localWifiRefreshNetwork => 'Làm mới thông tin Wi‑Fi';

  @override
  String get localWifiRouterNoWifiTitle => 'Không có trên Wi‑Fi';

  @override
  String get localWifiRouterNoWifiBody =>
      'Tham gia Wi‑Fi của bộ định tuyến trong Cài đặt hệ thống, sau đó tìm kiếm lại.';

  @override
  String get localWifiDiscovering => 'Đang tìm kiếm trên địa phương Wi‑Fi…';

  @override
  String get localWifiPeersFound => 'Các thiết bị trên mạng này';

  @override
  String get localWifiStop => 'Dừng lại';

  @override
  String get localWifiSsidUnknown => 'Tên Wi‑Fi không có sẵn';

  @override
  String get localWifiStubBanner => 'Đang chờ ổ cắm mạng LAN…';

  @override
  String get localWifiLiveBanner =>
      'Phát hiện mạng LAN trực tiếp (UDP) — thông báo + trò chuyện kín trên Wi‑Fi này';

  @override
  String get localWifiEmptyHotspot =>
      'Chưa có thiết bị nào.\nKiểm tra xem bạn bè đã tham gia điểm phát sóng của bạn và cho phép truy cập Mạng cục bộ hay chưa.';

  @override
  String get localWifiEmptyRouter =>
      'Chưa có thiết bị nào.\nSSID giống nhau? Mạng cục bộ được phép? Một số bộ định tuyến chặn lưu lượng truy cập từ thiết bị này đến thiết bị khác (cách ly AP).';

  @override
  String get localWifiIsolationHelp =>
      'Tại sao chúng ta không thể tìm thấy nhau?';

  @override
  String get localWifiIsolationTitle =>
      'Bộ định tuyến có thể cô lập khách hàng';

  @override
  String get localWifiIsolationBody =>
      'Nếu cách ly AP/Máy khách (hoặc mạng khách) được bật, các điện thoại trên cùng Wi‑Fi không thể đàm thoại. Tắt tính năng cách ly, sử dụng SSID chính hoặc chuyển sang chế độ Lân cận (Điểm phát sóng).';

  @override
  String get localWifiPeerReady => 'Sẵn sàng trò chuyện (có key)';

  @override
  String get localWifiPeerNeedKey => 'Đã tìm thấy - quét QR để trao đổi khóa';

  @override
  String get localWifiErrorTitle => 'Lỗi Wi‑Fi cục bộ';

  @override
  String get localWifiErrorBody => 'Đã xảy ra lỗi. Hãy dừng lại và thử lại.';

  @override
  String get preparingSystem => 'Hệ thống chuẩn bị…';

  @override
  String get bootFailedTitle => 'Không thể bắt đầu';

  @override
  String get retry => 'Thử lại';

  @override
  String get bootRecoveryAction => 'Bắt đầu danh tính mới (xóa dữ liệu cục bộ)';

  @override
  String get bootRecoveryConfirmTitle => 'Bắt đầu danh tính mới?';

  @override
  String get bootRecoveryConfirmBody =>
      'Thao tác này sẽ xóa vĩnh viễn các cuộc trò chuyện, khóa và danh tính cục bộ trên thiết bị này.\nĐồng nghiệp phải quét lại mã QR của bạn để xác định danh tính mới của bạn.\nĐiều này không thể hoàn tác được.';

  @override
  String get bootRecoveryRunning => 'Đang đặt lại danh tính cục bộ…';

  @override
  String get bootRecoverySuccess =>
      'Đã hoàn tất thiết lập lại danh tính cục bộ';

  @override
  String bootRecoveryFailed(String error) {
    return 'Không thể đặt lại danh tính: $error';
  }

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get save => 'Cứu';

  @override
  String get close => 'Đóng';

  @override
  String get start => 'Bắt đầu';

  @override
  String get send => 'Gửi';

  @override
  String get settings => 'Cài đặt';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSubtitle =>
      'Theo mặc định, ứng dụng tuân theo ngôn ngữ điện thoại của bạn (khi được hỗ trợ). Các ngôn ngữ khác quay trở lại tiếng Anh. Bạn cũng có thể khóa một ngôn ngữ ở đây.';

  @override
  String get languageSystem => 'Mặc định hệ thống';

  @override
  String get languageThai => 'tiếng Thái';

  @override
  String get languageEnglish => 'Tiếng Anh';

  @override
  String get notificationsTooltip => 'Cài đặt thông báo';

  @override
  String get enableMessageNotifications => 'Bật thông báo tin nhắn';

  @override
  String get settingsNotificationsSubtitle =>
      'Tin nhắn 1:1 và những người trực tuyến (cảnh báo cục bộ)';

  @override
  String get networkMembersTooltip => 'Thành viên mạng';

  @override
  String get identityQrTooltip => 'Danh tính / QR';

  @override
  String get feedDirects => 'Trò chuyện';

  @override
  String get feedMesh => '#lưới';

  @override
  String get feedGeo => 'Khu vực';

  @override
  String get feedDirectsSubtitle => 'Tin nhắn E2EE riêng tư';

  @override
  String get feedMeshSubtitle => 'Các đồng nghiệp lân cận (BLE)';

  @override
  String get feedGeoSubtitle => 'Kênh khám phá Geohash';

  @override
  String get peerIdHint =>
      'Dán ID người nhận (Băm khóa công khai) để bắt đầu trò chuyện';

  @override
  String get directsEmpty =>
      'Chưa có cuộc trò chuyện nào - quét QR hoặc dán ID người nhận để bắt đầu\nTin nhắn được niêm phong bằng E2EE trước khi gửi (BLE / LoRa / Nostr)';

  @override
  String get directsSubtitle => 'E2EE • nhấn để mở trò chuyện';

  @override
  String get meshIntro =>
      'Các đồng nghiệp trong phạm vi BLE — nhấn để trò chuyện E2EE riêng tư (không soạn thư công khai trên #mesh)\nGửi qua bộ định tuyến kết hợp (BLE + LoRa + Nostr khi trực tuyến)';

  @override
  String get meshEmptyRunning =>
      'Chưa có thiết bị ngang hàng nào ở gần — hãy mở ứng dụng trên một thiết bị khác trong phạm vi BLE';

  @override
  String get meshEmptyStopped =>
      'BLE không chạy — cấp quyền Bluetooth / Vị trí';

  @override
  String get meshNearbyPrefix => 'lân cận';

  @override
  String get meshRetentionTitle => 'Tự động xóa tin nhắn';

  @override
  String get meshRetentionSubtitle =>
      'Lịch sử trò chuyện cục bộ cũ hơn sẽ tự động bị xóa';

  @override
  String get meshRetentionKeep => 'Giữ';

  @override
  String get meshRetention1Day => '1 ngày';

  @override
  String get meshRetention3Days => '3 ngày';

  @override
  String get meshRetention7Days => '7 ngày';

  @override
  String get refreshLocationTooltip => 'Làm mới vị trí';

  @override
  String get geoIntro =>
      'Những người trực tuyến trong geohash này có thể được nhắn tin 1:1 hoặc với một khu vực phân phát công khai (vẫn được niêm phong E2EE cho mỗi ngang hàng - không phải văn bản thuần túy)';

  @override
  String geoEmpty(String channel) {
    return 'Chưa có ai trực tuyến trong $channel\nSử dụng Transport → Internet/Auto, đợi Nostr, làm mới vị trí';
  }

  @override
  String geoPeerSubtitle(String channel) {
    return 'Trực tuyến trong $channel • nhấn để có E2EE 1:1';
  }

  @override
  String get geoPeerNearbySubtitle =>
      'Lân cận (khu vực chờ hiện diện) • nhấn để có 1:1 E2EE';

  @override
  String geoPeerNostrSubtitle(String channel) {
    return 'Đã thấy trên Nostr trong $channel • chỉ khám phá (cũ)';
  }

  @override
  String get geoPeerDiscoverOnlySnack =>
      'Sự hiện diện ẩn danh kế thừa - chờ QR ngang hàng hoặc trao đổi bị ràng buộc';

  @override
  String get bleRadioNearbySubtitle =>
      'BLE lân cận — quét QR để bắt đầu 1:1 E2EE';

  @override
  String get geoInternetDiscoverHint =>
      'Khu vực cần khám phá Internet Nostr được kết nối (Cài đặt → Truyền tải → Internet/Tự động)';

  @override
  String get geoEmptyNoLocation =>
      'Vị trí chưa được giải quyết — cho phép GPS và làm mới để xuất bản geohash của bạn trên Nostr';

  @override
  String get geoEmptyNeedsPermission =>
      'Quyền vị trí bị từ chối — cho phép ResilNet trong Cài đặt → Quyền riêng tư → Vị trí';

  @override
  String get geoEmptyServicesDisabled =>
      'Dịch vụ định vị đang tắt — hãy bật chúng trong Cài đặt';

  @override
  String get geoEmptyNoGpsFix =>
      'Không thể sửa lỗi GPS (phổ biến trên Wi‑Fi iPad) — đặt geohash theo cách thủ công bên dưới';

  @override
  String get geoEmptyTeleportHint =>
      'Nhấn vào biểu tượng địa điểm → nhập geohash (ví dụ: w5) → Dịch chuyển tức thời';

  @override
  String get geoSetGeohashManually => 'Đặt geohash';

  @override
  String get geoTeleportHint =>
      'Không có GPS? Nhập tiền tố geohash (2–7 ký tự, ví dụ: w5) và nhấn Dịch chuyển tức thời';

  @override
  String get geoTeleportInvalid =>
      'Geohash không hợp lệ - chỉ sử dụng các chữ cái/số base32 (ví dụ: w5 hoặc w5jt8)';

  @override
  String geoTeleportOk(String channel) {
    return 'Khu vực được đặt thành $channel';
  }

  @override
  String geoManualActive(String channel) {
    return 'Vùng thủ công: $channel (làm mới GPS sẽ ghi đè)';
  }

  @override
  String get geoEmptyNoNostr =>
      'Nostr chưa sẵn sàng — nhấn Kết nối lại (0/0 cho đến khi init thành công)';

  @override
  String get geoEmptyMeshOnly =>
      'Truyền tải chỉ ở dạng Lưới — chuyển sang Internet hoặc Tự động để khám phá các thiết bị ngang hàng trên Nostr';

  @override
  String geoEmptyWaiting(String channel) {
    return 'Chưa có ai trong $channel — giữ Khu vực + Internet mở trên cả hai thiết bị và đợi ~60 giây';
  }

  @override
  String get geoChannelFallback => '#khu vực';

  @override
  String get geoRefreshLocation => 'Làm mới vị trí';

  @override
  String get settingsClearLocationTitle => 'Xóa vị trí';

  @override
  String get settingsClearLocationSubtitle =>
      'Xóa GPS / dịch chuyển geohash (Khu vực trở thành #-)';

  @override
  String get settingsClearLocationConfirmTitle => 'Xóa vị trí?';

  @override
  String get settingsClearLocationConfirmBody =>
      'Xóa geohash được lưu trữ trên thiết bị này. Bạn có thể làm mới GPS hoặc dịch chuyển lại sau đó.';

  @override
  String get settingsClearLocationAction => 'Xóa vị trí';

  @override
  String get settingsClearLocationSnack => 'Đã xóa vị trí';

  @override
  String get chatVoiceTooLarge => 'Ghi chú thoại quá lớn — tối đa ~30 giây';

  @override
  String get chatVoiceNeedInternet =>
      'Ghi chú thoại cần có Internet (Nostr) — quá lớn cho riêng BLE';

  @override
  String get chatVoiceSentInternet =>
      'Ghi chú bằng giọng nói được gửi qua Internet';

  @override
  String get noticeAnonMention => 'đề cập đến';

  @override
  String get noticeAnonDm => 'tin nhắn trực tiếp';

  @override
  String get noticeAnonHug => 'ôm';

  @override
  String get noticeAnonSlap => 'cái tát';

  @override
  String get noticeAnonBlock => 'khối';

  @override
  String get noticeAnonNeedKey =>
      'Chưa có khóa công khai - trước tiên hãy đổi QR lấy 1:1';

  @override
  String get noticeAnonActionSent => 'Đã gửi';

  @override
  String noticeAnonBlocked(String anon) {
    return 'Bị chặn $anon';
  }

  @override
  String noticeAnonHugMessage(String anon) {
    return '*ôm $anon *';
  }

  @override
  String noticeAnonSlapMessage(String anon) {
    return '* tát $anon *';
  }

  @override
  String get geoReconnectNostr => 'Kết nối lại Nostr';

  @override
  String get nostrSectionTitle => 'Nostr rơle';

  @override
  String get nostrSectionSubtitle =>
      'Nhắn tin Internet và khám phá khu vực sử dụng các rơle này. Nhấn vào kết nối lại nếu trạng thái vẫn ngoại tuyến.';

  @override
  String nostrStatusOnline(int connected, int total) {
    return 'Đã kết nối $connected/$total';
  }

  @override
  String get nostrStatusOffline =>
      'Ngoại tuyến - rơle được liệt kê nhưng không có kết nối nào';

  @override
  String get nostrStatusNotInit =>
      'Chưa bắt đầu (0/0) - nhấn Kết nối lại để khởi tạo';

  @override
  String get nostrReconnectAction => 'Kết nối lại Nostr';

  @override
  String nostrReconnectOk(int connected, int total) {
    return 'Nostr đã kết nối ($connected/$total)';
  }

  @override
  String get nostrReconnectFailed =>
      'Vẫn ngoại tuyến — hãy kiểm tra Wi‑Fi/mobile hoặc thử lại';

  @override
  String nostrReconnectFailedDetail(String error) {
    return 'Thất bại: $error';
  }

  @override
  String get nostrReconnecting => 'Đang kết nối với rơle…';

  @override
  String geoDiscoveryStatus(String channel, String relays) {
    return '$channel · Nostr $relays';
  }

  @override
  String geoPeerInternetSubtitle(String channel) {
    return 'Internet (Nostr) trong $channel • sẵn sàng trò chuyện kín';
  }

  @override
  String get transportModeTitle => 'Vận tải khu vực';

  @override
  String get transportModeSubtitle =>
      'Lưới = BLE lân cận (radio) khi không có Nostr · Internet & Auto = Nostr danh sách người';

  @override
  String get transportModeMesh => 'Lưới';

  @override
  String get transportModeInternet => 'internet';

  @override
  String get transportModeAuto => 'Tự động';

  @override
  String get geoPublicHint =>
      'Thông báo công khai tới mọi người trực tuyến trong khu vực này';

  @override
  String get geoPublicSend => 'Công cộng';

  @override
  String geoPublicHelp(int count) {
    return 'Phân phát kín tới $count đồng nghiệp trực tuyến — mỗi người nhận được một phong bì riêng';
  }

  @override
  String geoPublicSent(int count) {
    return 'Đã gửi tới $count đồng nghiệp trong khu vực này';
  }

  @override
  String get geoPublicSentNone =>
      'Không có đồng nghiệp nào có thể nhắn tin trực tuyến — mở Khu vực/Lưới với các đồng nghiệp có khóa hoặc đợi BLE/Nostr';

  @override
  String get areaPublicBadge => 'Khu vực công cộng';

  @override
  String get geoErrorPermission =>
      'Không thể đọc vị trí - hãy kiểm tra quyền truy cập vị trí';

  @override
  String get geoPrecisionRegion => 'Vùng đất';

  @override
  String get geoPrecisionProvince => 'Tỉnh';

  @override
  String get geoPrecisionCity => 'Thành phố';

  @override
  String get geoPrecisionNeighborhood => 'Hàng xóm';

  @override
  String get geoPrecisionBlock => 'Khối';

  @override
  String get aliasTitle => 'Đặt biệt danh (Bí danh liên hệ)';

  @override
  String get aliasHintBody =>
      'Bí danh này chỉ được lưu trữ trên thiết bị này (chỉ cục bộ)\nNó không bao giờ được gửi với lưu lượng E2EE';

  @override
  String get aliasLabel => 'Biệt hiệu';

  @override
  String get aliasHint => 'ví dụ. “trưởng thôn”, “P’Somchai”…';

  @override
  String get settingsDevices => 'Thiết bị';

  @override
  String get settingsFirmwareTitle =>
      'Tải xuống/cập nhật chương trình cơ sở ESP32';

  @override
  String get settingsFirmwareSubtitle =>
      'Tải xuống tệp .bin và cập nhật bảng ESP32 qua OTA';

  @override
  String get mtBridgeTitle => 'cầu Meshtastic';

  @override
  String get mtBridgeSettingsSubtitle =>
      'Cầu nối A/B chỉ có văn bản — không phải ResilNet E2EE';

  @override
  String get mtBridgeIntro =>
      'Di chuyển bản rõ ngắn giữa Meshtastic và ResilNet. Chế độ A và B không thể chạy cùng lúc. Đây không phải là mã hóa đầu cuối.';

  @override
  String get mtBridgeModeLabel => 'Cách thức';

  @override
  String get mtBridgeModeOff => 'Tắt';

  @override
  String get mtBridgeModeA => 'Ăn A';

  @override
  String get mtBridgeModeB => 'Lối ra B';

  @override
  String get mtBridgeModeOffShort => 'Tắt';

  @override
  String get mtBridgeModeAShort => 'ở A';

  @override
  String get mtBridgeModeBShort => 'Ra B';

  @override
  String get mtBridgeMutexHint =>
      'Chọn một chế độ sẽ tự động tắt chế độ khác. A+B đồng thời không được hỗ trợ.';

  @override
  String mtBridgeStatusLine(String mode, String transport) {
    return '$mode · $transport';
  }

  @override
  String get mtBridgeTransportDemo => 'Bản trình diễn (ghi nhật ký)';

  @override
  String get mtBridgeIngestSection => 'Meshtastic → ResilNet';

  @override
  String get mtBridgeIngestHint =>
      'Văn bản gửi đến xuất hiện bên dưới Thông báo dưới dạng #meshtastic. Rơle lưới là tùy chọn (tắt theo mặc định).';

  @override
  String get mtBridgeRelayTitle => 'Đồng thời chuyển tiếp trên lưới ResilNet';

  @override
  String get mtBridgeRelayHint =>
      'Khi bật, các bản tin công khai có chữ ký sẽ được phát sóng. Tắt = chỉ Thông báo của điện thoại này.';

  @override
  String get mtBridgeSimulateHint => 'Tin nhắn demo';

  @override
  String get mtBridgeSimulate => 'Mô phỏng tin nhắn Meshtastic';

  @override
  String get mtBridgeIngestOk => 'Đã nhập vào Thông báo (#meshtastic)';

  @override
  String get mtBridgeEgressWarning =>
      'Cảnh báo: tin nhắn được gửi ở đây KHÔNG phải là ResilNet E2EE. Bất kỳ ai trên đường dẫn Meshtastic đều có thể đọc chúng.';

  @override
  String get mtBridgeEgressSection => 'ResilNet → Meshtastic';

  @override
  String get mtBridgeComposeHint => 'Văn bản để xuất bản';

  @override
  String get mtBridgeSend => 'Gửi tới Meshtastic';

  @override
  String get mtBridgeEgressOk =>
      'Xếp hàng cho Meshtastic (xem nhật ký / lịch sử)';

  @override
  String get mtBridgeLastEgress => 'Lần ra cuối cùng';

  @override
  String get mtBridgeEgressHistory => 'Đi ra gần đây';

  @override
  String get mtBridgeOffHint =>
      'Bật Ingest (A) hoặc Egress (B) để sử dụng bridge.';

  @override
  String get mtBridgeNoticeBadge => 'MESHASTIC · không phải E2EE';

  @override
  String get mtBridgeSenderFallback => 'Meshtastic';

  @override
  String get mtBridgeUseMqtt => 'Sử dụng phương tiện di chuyển MQTT';

  @override
  String get mtBridgeUseMqttHint =>
      'Tắt = chỉ ghi nhật ký demo (MQTT lượt gửi đến bị bỏ qua). Bật = MQTT để nhập/xuất khi được kết nối.';

  @override
  String get mtBridgeMqttHost => 'Máy chủ môi giới';

  @override
  String get mtBridgeMqttPort => 'Cảng';

  @override
  String get mtBridgeMqttTls => 'Sử dụng TLS (mqtts)';

  @override
  String get mtBridgeMqttTlsHint =>
      'Cổng điển hình 8883. Sử dụng chứng chỉ hệ thống; không thành công trong các lỗi bắt tay.';

  @override
  String get mtBridgeMqttAutoReconnect => 'Tự động kết nối lại';

  @override
  String get mtBridgeMqttAutoReconnectHint =>
      'Khi bật, máy khách sẽ cố gắng kết nối lại sau khi bị rớt. Trạng thái hiển thị Đang kết nối cho đến khi được khôi phục.';

  @override
  String get mtBridgeMqttTopicHelpers => 'Người trợ giúp chủ đề';

  @override
  String get mtBridgeMqttRegion => 'Tiền tố vùng (tùy chọn)';

  @override
  String get mtBridgeMqttRegionHint =>
      'Khi được đặt, Áp dụng sẽ xây dựng lại gốc dưới dạng msh/<khu vực>/2/json (ghi đè gốc chủ đề).';

  @override
  String get mtBridgeMqttTopicRoot => 'Gốc chủ đề JSON';

  @override
  String get mtBridgeMqttDownlinkChannel => 'Tên kênh đường xuống';

  @override
  String get mtBridgeMqttApplyTopics =>
      'Áp dụng root → đăng ký / xuất bản chủ đề';

  @override
  String get mtBridgeMqttAdvanced => 'Nâng cao MQTT';

  @override
  String get mtBridgeMqttAdvancedHint =>
      'TLS, kết nối lại, chủ đề, thông tin xác thực';

  @override
  String get mtBridgeMqttTopicIn => 'Đăng ký chủ đề';

  @override
  String get mtBridgeMqttTopicOut => 'Xuất bản chủ đề';

  @override
  String get mtBridgeMqttGatewayFrom => 'Id nút cổng (từ)';

  @override
  String get mtBridgeMqttGatewayFromHint =>
      'Id thập phân hoặc !hex — bắt buộc đối với đường dẫn gửi văn bản xuống';

  @override
  String get mtBridgeMqttChannelIndex => 'Chỉ số kênh lưới (tùy chọn 0–7)';

  @override
  String get mtBridgeMqttUser => 'Tên người dùng (tùy chọn)';

  @override
  String get mtBridgeMqttPass => 'Mật khẩu (tùy chọn)';

  @override
  String get mtBridgeMqttPassStored =>
      'Mật khẩu được lưu trữ trên thiết bị này (không hiển thị).';

  @override
  String get mtBridgeMqttPassReplace => 'Mật khẩu mới (để trống để giữ)';

  @override
  String get mtBridgeMqttPassReplaceHint => 'Để trống để giữ mật khẩu đã lưu.';

  @override
  String get mtBridgeMqttPassClear => 'Xóa mật khẩu';

  @override
  String get mtBridgeMqttSave => 'Lưu cài đặt MQTT';

  @override
  String get mtBridgeMqttSaved => 'Đã lưu MQTT cài đặt';

  @override
  String get mtBridgeMqttConnect => 'Kết nối';

  @override
  String get mtBridgeMqttDisconnect => 'Ngắt kết nối';

  @override
  String get mtBridgeMqttConnected => 'MQTT đã kết nối';

  @override
  String get mtBridgeMqttConnecting => 'MQTT đang kết nối…';

  @override
  String get mtBridgeMqttDisconnected => 'MQTT bị ngắt kết nối';

  @override
  String get mtBridgeMqttError => 'lỗi MQTT';

  @override
  String get mtBridgeErrModeIngest => 'Chuyển sang Ingest (A) trước';

  @override
  String get mtBridgeErrModeEgress => 'Chuyển sang Đi ra (B) trước';

  @override
  String get mtBridgeErrRate => 'Chậm lại - tốc độ giới hạn';

  @override
  String get mtBridgeErrDedupe => 'Tin nhắn trùng lặp bị bỏ qua';

  @override
  String get mtBridgeErrLoop => 'Giảm để tránh vòng lặp cầu';

  @override
  String get mtBridgeErrEmpty => 'Tin nhắn trống';

  @override
  String get mtBridgeErrPublish => 'Xuất bản không thành công';

  @override
  String get mtBridgeErrNotConnected => 'MQTT không được kết nối';

  @override
  String get mtBridgeErrMissingHost => 'Nhập máy chủ môi giới MQTT';

  @override
  String get mtBridgeErrMissingTopic => 'Nhập chủ đề đăng ký và xuất bản';

  @override
  String get mtBridgeErrMissingFromNode => 'Nhập id nút cổng (từ) cho sendtext';

  @override
  String get mtBridgeErrConnect => 'MQTT kết nối không thành công';

  @override
  String get mtBridgeErrConnectTls => 'MQTT Kết nối TLS không thành công';

  @override
  String get settingsData => 'dữ liệu';

  @override
  String get settingsDataHint =>
      'Xóa tin nhắn cục bộ để thu nhỏ cơ sở dữ liệu - danh tính, khóa và ngang hàng được giữ lại';

  @override
  String get settingsSaveHistoryTitle => 'Lưu lịch sử tin nhắn';

  @override
  String get settingsSaveHistorySubtitle =>
      'Khi tắt, tin nhắn vẫn ở dạng E2EE trên mạng và chỉ được lưu giữ trong phiên này (không có trong lịch sử trò chuyện cục bộ). Văn bản của bạn vẫn hiển thị dưới dạng văn bản gốc trên thiết bị này.';

  @override
  String get settingsPrivacy => 'Sự riêng tư';

  @override
  String get settingsE2eeTitle => 'Mã hóa đầu cuối';

  @override
  String get settingsE2eeSubtitle =>
      'Luôn bật - tin nhắn được niêm phong bằng RSA-OAEP + AES-GCM trước khi gửi. Rơle và các bước nhảy gần đó không thể đọc được nội dung.';

  @override
  String get settingsScreenshotTitle => 'Cảnh báo ảnh chụp màn hình';

  @override
  String get settingsScreenshotSubtitle =>
      'Hiển thị dòng hệ thống trong cuộc trò chuyện khi thiết bị này chụp màn hình';

  @override
  String get settingsNostrExpiryTitle => 'Nostr thời gian lưu tin nhắn';

  @override
  String get settingsNostrExpirySubtitle =>
      'Phong bì niêm phong sẽ được giữ nguyên trong bao lâu khi trực tuyến qua Nostr';

  @override
  String get noticeExpiresIn => 'hết hạn vào';

  @override
  String get noticesTitle => 'Thông báo';

  @override
  String get noticesMeshIntro =>
      'Bản tin công khai - hiển thị cho mọi người trong phạm vi radio, không được mã hóa. Nó kết nối ngoại tuyến giữa điện thoại với điện thoại và các hộp chuyển tiếp ResilNet gần đó giữ một bản sao để những người đến sau vẫn nhìn thấy nó.';

  @override
  String get noticesMeshPublicBadge => 'CÔNG CỘNG · không được mã hóa';

  @override
  String get noticesGeoIntro =>
      'Thêm ghi chú ngắn cho địa điểm này để những khách truy cập khác có thể tìm thấy chúng.';

  @override
  String get noticesEmpty => 'chưa có thông báo nào';

  @override
  String get noticesEmptyHint =>
      'ghim thông báo đầu tiên cho mọi người quanh đây.';

  @override
  String get noticesComposeHint => 'đăng thông báo...';

  @override
  String get noticesUrgent => 'cấp bách';

  @override
  String get noticesOpen => 'Thông báo';

  @override
  String get screenshotTaken => '*bạn đã chụp ảnh màn hình*';

  @override
  String get chatAttachImage => 'Đính kèm hình ảnh';

  @override
  String get chatImageLabel => 'Hình ảnh';

  @override
  String get chatImageTooLarge => 'Hình ảnh quá lớn — hãy thử một ảnh khác';

  @override
  String get chatNostrExpiry => 'Nostr giữ lại';

  @override
  String geoPublicComposeHint(String channel) {
    return 'Gửi tới $channel — công khai';
  }

  @override
  String get settingsClearTitle => 'Xóa tất cả tin nhắn';

  @override
  String get settingsClearSubtitle =>
      'Xóa tất cả cuộc trò chuyện trên thiết bị này';

  @override
  String get settingsClearConfirmTitle => 'Xóa tất cả tin nhắn?';

  @override
  String get settingsClearConfirmBody =>
      'Thao tác này sẽ xóa tất cả tin nhắn trò chuyện trên thiết bị này.\nĐồng nghiệp và biệt danh không bị xóa.';

  @override
  String get settingsClearAction => 'Xóa dữ liệu';

  @override
  String get settingsClearedSnack => 'Đã xóa dữ liệu';

  @override
  String settingsVersion(String version) {
    return 'phiên bản $version';
  }

  @override
  String get meshBleScanning => 'BLE: quét tìm nút';

  @override
  String get meshBleEsp32Scanning => 'ESP32: tìm kiếm nút lân cận';

  @override
  String get meshBleSyncing => 'BLE: đồng bộ với ESP32';

  @override
  String get meshNostrPublishing => 'Nostr: xuất bản';

  @override
  String get meshBleIdle => 'BLE bật lưới — chưa có điện thoại nào ở gần';

  @override
  String meshBlePeersNearby(int count) {
    return 'BLE lưới — $count điện thoại ở gần';
  }

  @override
  String get meshBleNeedsPermission => 'BLE: cần có sự cho phép';

  @override
  String get meshBlePausedCamera =>
      'BLE đã tạm dừng đối với máy ảnh — nhấn vào Bắt đầu BLE';

  @override
  String get meshBleStopped =>
      'BLE tắt — kiểm tra xem Bluetooth đã bật rồi nhấn vào Bắt đầu BLE';

  @override
  String get meshBleRestart => 'Bắt đầu BLE';

  @override
  String meshBleStatusDetail(String bt, String loc, String ble) {
    return 'BT $bt · Lộc $loc · BLE $ble';
  }

  @override
  String get meshBleEnsureAction => 'Kiểm tra quyền và bắt đầu BLE';

  @override
  String get meshNostrOffline => 'Nostr ngoại tuyến';

  @override
  String meshNostrOnline(String relays) {
    return 'Nostr $relays';
  }

  @override
  String meshFooter(int count, String lora, int meters) {
    return '$count các đồng nghiệp lân cận • LoRa $lora • đồng bộ hóa ~${meters}m';
  }

  @override
  String get meshLoraReady => 'sẵn sàng';

  @override
  String get meshLoraNotReady => 'chưa sẵn sàng';

  @override
  String meshGatewayProgress(String label) {
    return 'Cổng UDP: $label';
  }

  @override
  String get meshGatewayReady => 'Cổng UDP: sẵn sàng';

  @override
  String get permissionTitle => 'Cho phép truy cập để khởi động mạng lưới BLE';

  @override
  String get permissionBody =>
      'Ứng dụng cần có Bluetooth (quét/kết nối/quảng cáo), Vị trí (dành cho thiết bị Android cũ hơn) và Micrô (để ghi chú thoại trong trò chuyện và thông báo) để nhắn tin cộng đồng.';

  @override
  String get permissionE2ee =>
      'Mã hóa đầu cuối (E2EE)\nCác nút chuyển tiếp không thể đọc nội dung tin nhắn';

  @override
  String get permissionReady => 'Quyền đã sẵn sàng';

  @override
  String get permissionRequest => 'Cho phép và tiếp tục';

  @override
  String get permissionNotReadySnack =>
      'Hệ thống chưa sẵn sàng - hãy đợi một lát và thử lại';

  @override
  String get permissionDeniedSnack =>
      'Quyền chưa đầy đủ — mở Cài đặt > ResilNet và cho phép Bluetooth / Vị trí / Micrô';

  @override
  String get permissionMicDenied =>
      'Quyền truy cập micrô bị từ chối - cho phép micrô trong Cài đặt ghi lại ghi chú giọng nói';

  @override
  String get permissionMicOpenSettings => 'Cài đặt';

  @override
  String get permissionCameraDenied =>
      'Quyền truy cập máy ảnh bị từ chối - cho phép máy ảnh trong Cài đặt quét mã QR';

  @override
  String get permissionCameraFailed =>
      'Cần có sự cho phép của máy ảnh để quét mã QR';

  @override
  String get permissionCameraOpenSettings => 'Cài đặt';

  @override
  String get permissionPhotosDenied =>
      'Quyền truy cập thư viện ảnh bị từ chối - cho phép nó trong Cài đặt để lưu mã QR của bạn';

  @override
  String get permissionPhotosFailed =>
      'Cần có sự cho phép của thư viện ảnh để lưu mã QR của bạn';

  @override
  String get permissionPhotosOpenSettings => 'Cài đặt';

  @override
  String permissionFailedSnack(String error) {
    return 'Yêu cầu cấp phép không thành công: $error';
  }

  @override
  String get permissionFooter =>
      'Kiến trúc ResilNet • Lưu trữ và chuyển tiếp đa bước nhảy';

  @override
  String get onboardingSkip => 'Nhảy';

  @override
  String get onboardingNext => 'Kế tiếp';

  @override
  String get onboardingStart => 'Bắt đầu';

  @override
  String get onboardingWelcomeTitle => 'Chào mừng đến với ResilNet';

  @override
  String get onboardingWelcomeBody =>
      'Trò chuyện trên ResilNet qua mạng lưới — ngay cả khi không có internet';

  @override
  String get onboardingFriendsTitle => 'Thêm bạn bè dễ dàng';

  @override
  String get onboardingFriendsBody =>
      'Chia sẻ mã QR từ Danh tính hoặc quét mã QR của bạn bè để trao đổi khóa công khai';

  @override
  String get onboardingChannelsTitle =>
      'Trò chuyện được mã hóa + các kênh lân cận';

  @override
  String get onboardingChannelsBody =>
      'Chuyển đổi #mesh / Area (geohash) để tìm các đồng nghiệp lân cận — các tin nhắn vẫn ở dạng E2EE trên BLE lưới và Nostr';

  @override
  String get chatTitle => 'Trò chuyện (E2EE)';

  @override
  String get chatScanTooltip => 'Quét QR để thêm bạn bè';

  @override
  String get chatBlockTooltip => 'Chặn người gửi này';

  @override
  String get chatBlockedSnack =>
      'Bị chặn: không có thông báo / không chuyển tiếp';

  @override
  String get chatAliasTooltip => 'Đặt biệt hiệu';

  @override
  String get chatReceiverPemLabel => 'Khóa công khai của người nhận (PEM)';

  @override
  String get chatReceiverPemHint =>
      'Dán khóa công khai của bạn bè bạn (từ QR/file chia sẻ)';

  @override
  String get chatNeedPeerKey =>
      'Trước tiên hãy quét QR của người ngang hàng này (yêu cầu khóa công khai đã được xác minh)';

  @override
  String get chatPeerKeyMismatch =>
      'Khóa công khai được lưu trữ không khớp với id ngang hàng này';

  @override
  String chatVoiceFailed(String error) {
    return 'Không thể ghi âm: $error';
  }

  @override
  String chatPlayVoiceFailed(String error) {
    return 'Không thể phát ghi chú thoại: $error';
  }

  @override
  String get chatPlayVoice => 'Phát ghi chú bằng giọng nói';

  @override
  String get chatPauseVoice => 'Tạm dừng';

  @override
  String get chatVoiceLabelSent => '🎤 Ghi chú bằng giọng nói (đã niêm phong)';

  @override
  String get chatVoiceLabel => '🎤 Ghi chú bằng giọng nói';

  @override
  String get chatDecryptFailed => '[giải mã không thành công]';

  @override
  String chatSentSealed(String preview) {
    return '[đã niêm phong • ct=$preview]';
  }

  @override
  String get chatSentSealedShort => '[niêm phong]';

  @override
  String get chatComposeHint => 'Gõ tin nhắn… (đóng dấu khi gửi)';

  @override
  String get chatEmptyThread =>
      'Chưa có tin nhắn nào\nNhập bên dưới để gửi qua lưới';

  @override
  String chatLoadFailed(String error) {
    return 'Không thể tải cuộc trò chuyện: $error';
  }

  @override
  String get chatEmojiTooltip => 'Biểu tượng cảm xúc';

  @override
  String get statusPending => 'Chưa giải quyết';

  @override
  String get statusSent => 'Đã gửi';

  @override
  String get statusRelayed => 'Đã chuyển tiếp';

  @override
  String get statusDelivered => 'Đã giao hàng';

  @override
  String get statusRead => 'Đọc';

  @override
  String get statusFailed => 'Thất bại';

  @override
  String get chatCopy => 'Sao chép';

  @override
  String get chatDeleteLocal => 'Xóa trên thiết bị này';

  @override
  String get chatDeletedLocalSnack => 'Đã xóa trên thiết bị này';

  @override
  String get chatRetry => 'Thử lại';

  @override
  String get chatSendFailed => 'Chưa gửi được — nhấn vào Thử lại';

  @override
  String get chatImageNeedInternet => 'Kết nối Internet để gửi hình ảnh';

  @override
  String get chatImageTooLargeOnline => 'Không thể nén hình ảnh đủ để gửi';

  @override
  String get chatOpenLinkFailed => 'Không thể mở liên kết';

  @override
  String get identityTitle => 'Danh tính';

  @override
  String get identityScanTooltip => 'Quét QR bằng máy ảnh';

  @override
  String get identityCopiedHash => 'Đã sao chép hàm băm khóa công khai';

  @override
  String get identityPeerSaved => 'Đã lưu ngang hàng từ QR';

  @override
  String get identityGalleryDenied => 'Quyền thư viện ảnh bị từ chối';

  @override
  String get identityQrSaved => 'Đã lưu QR vào thư viện ảnh';

  @override
  String identityQrSaveFailed(String error) {
    return 'Không lưu được QR: $error';
  }

  @override
  String get peersTitle => 'Thành viên mạng';

  @override
  String get qrScanTitle => 'Quét QR để thêm bạn bè';

  @override
  String get qrInvalid => 'Quét không thành công: QR không hợp lệ';

  @override
  String get qrIdKeyMismatch => 'QR bị từ chối: id không khớp với khóa chung';

  @override
  String get qrCameraNotReady => 'Máy ảnh chưa sẵn sàng';

  @override
  String get qrRetrySettings => 'Thử lại/mở Cài đặt';

  @override
  String qrCameraOpenFailed(String error) {
    return 'Không mở được camera: $error';
  }

  @override
  String get qrScanAlignHint => 'Căn chỉnh mã QR bên trong khung';

  @override
  String get firmwareDownloadTitle => 'Tải xuống chương trình cơ sở ESP32';

  @override
  String get firmwareSourceOnline => 'Mới nhất (trực tuyến)';

  @override
  String get firmwareSourceCached => 'Bản sao đã lưu (ngoại tuyến)';

  @override
  String get firmwareSourceBaseline => 'Đường cơ sở đi kèm (ngoại tuyến)';

  @override
  String get firmwareSourceUnavailable => 'Không có phần mềm cơ sở';

  @override
  String get firmwareBaselineIncompatible =>
      'Chương trình cơ sở đi kèm quá cũ - hãy kết nối Internet để tải xuống phiên bản mới hơn';

  @override
  String get firmwareChecksumFailed =>
      'Kiểm tra tính toàn vẹn của chương trình cơ sở không thành công - nhấp nháy bị chặn';

  @override
  String firmwareReadyFromSource(String source) {
    return 'Phần sụn đã sẵn sàng: $source';
  }

  @override
  String get peersRefreshTooltip => 'Làm cho khỏe lại';

  @override
  String get peersBlocked => 'Bị chặn';

  @override
  String get peersNearbyBle => 'Gần đây (BLE)';

  @override
  String get peersRecentlyOnline => 'Gần đây trực tuyến';

  @override
  String get peersOnlineInArea => 'Trực tuyến trong khu vực';

  @override
  String peersSeenMinutesAgo(int minutes) {
    return 'Đã xem $minutes phút trước';
  }

  @override
  String get peersOffline => 'Ngoại tuyến';

  @override
  String peersBlockedSnack(String id) {
    return 'Bị chặn $id';
  }

  @override
  String get peersUnblockedSnack => 'Đã bỏ chặn';

  @override
  String get peersEmpty =>
      'Chưa có thành viên nào trong cơ sở dữ liệu\nQuét QR hoặc chờ BLE khám phá lưới';

  @override
  String get peersOpenChat => 'Mở trò chuyện';

  @override
  String get peersBlockAction => 'Khối';

  @override
  String get peersUnblockAction => 'Bỏ chặn';

  @override
  String get channelPickerTooltip => 'Trò chuyện / #mesh / Khu vực';

  @override
  String get locationPickerTooltip => 'Kênh vị trí';

  @override
  String get transportPickerTooltip => 'Lưới / Internet / Tự động';

  @override
  String get onlinePeopleTooltip => 'Mọi người trực tuyến';

  @override
  String get unreadDirectsTooltipEmpty => 'Tin nhắn riêng tư';

  @override
  String unreadDirectsTooltip(int count) {
    return '$count tin nhắn riêng tư chưa đọc';
  }

  @override
  String get onlinePeopleTitle => 'mọi người';

  @override
  String get onlinePeopleEmpty => 'Chưa có ai trực tuyến ở đây';

  @override
  String onlinePeopleCount(int count) {
    return '$count trực tuyến';
  }

  @override
  String get onlinePeopleDirectsChannel => '1:1 · lân cận + khu vực';

  @override
  String get peerOnlineMeshTitle => 'Ai đó ở gần trên lưới';

  @override
  String peerOnlineMeshBody(String name) {
    return '$name ở gần trên lưới';
  }

  @override
  String get peerOnlineAreaTitle => 'Ai đó trực tuyến trong khu vực';

  @override
  String peerOnlineAreaBody(String name) {
    return '$name đang trực tuyến qua Nostr';
  }

  @override
  String get locationSheetTitle => '#kênh vị trí';

  @override
  String get channelPinsTitle => 'Đã ghim';

  @override
  String get channelPinsHint =>
      'Ghim các kênh bạn sử dụng thường xuyên — chúng luôn ở trên cùng';

  @override
  String get channelPinTooltip => 'Ghim kênh này';

  @override
  String get channelUnpinTooltip => 'Bỏ ghim';

  @override
  String get locationSheetIntro =>
      'Trò chuyện với những người ở gần bằng cách sử dụng geohash thô — không phải GPS chính xác. Sự hiện diện trên Internet sử dụng khóa Nostr ẩn danh.';

  @override
  String get locationMeshSubtitle => '#bluetooth • ~10–50 m';

  @override
  String get locationTeleportHint => '#geohash';

  @override
  String get locationTeleport => 'Dịch chuyển tức thời';

  @override
  String homeComposeHint(String channel) {
    return 'Tin nhắn $channel';
  }

  @override
  String homeComposePublicHint(String channel) {
    return 'Gửi tới $channel — công khai';
  }

  @override
  String get messageExpiryTitle => 'hết hạn vào';

  @override
  String get voiceRecordTapToStart => 'Nhấn để ghi tin nhắn thoại';

  @override
  String get voiceRecordTooShort => 'Ghi quá ngắn - thử lại';

  @override
  String get voiceRecordFailed => 'Không thể lưu bản ghi - hãy thử lại';

  @override
  String get voicePttHold => 'Giữ để ghi lại';

  @override
  String get voicePttRelease => 'Phát hành để xem trước';

  @override
  String get voicePttRecording => 'Đang ghi…';

  @override
  String get voicePttDraftReady => 'Ghi chú thoại đã sẵn sàng';

  @override
  String get voicePttDiscard => 'Loại bỏ';

  @override
  String get voicePttReRecord => 'Ghi lại';

  @override
  String get voicePttSend => 'Gửi ghi chú bằng giọng nói';

  @override
  String get voicePttPlayPreview => 'Phát bản xem trước';

  @override
  String get voicePttStopPreview => 'Dừng xem trước';

  @override
  String get noticesBackfilling => 'Đang tải thông báo…';

  @override
  String get noticesNostrOnline => 'Nostr trực tuyến';

  @override
  String get noticesNostrOffline =>
      'Nostr ngoại tuyến — bản tin cần có Internet';

  @override
  String noticesBackfillLoaded(int count) {
    return 'Đã tải $count thông báo';
  }

  @override
  String get noticePublishFailed =>
      'Không thể xuất bản thông báo cho hội đồng quản trị khu vực. Kiểm tra kết nối Nostr.';

  @override
  String get noticeMeshPublishNoLink =>
      'Đã lưu cục bộ. Kết nối với đài lưới gần đó (hoặc cổng Wi‑Fi) để người khác có thể nhận được.';

  @override
  String noticeMeshPublishSent(int count) {
    return 'Bản tin được gửi tới $count (các) thiết bị lân cận trên BLE.';
  }

  @override
  String get noticeMeshPublishBleFailed =>
      'Đã nhìn thấy các đài gần đó nhưng BLE ghi không thành công. Giữ cả hai ứng dụng mở trên màn hình Thông báo và thử lại (hoặc sử dụng rơle ESP32).';

  @override
  String get noticeMeshPublishNoGatt =>
      'Bộ thu BLE của thiết bị này chưa sẵn sàng. Chuyển đổi Bluetooth và mở lại Thông báo.';

  @override
  String get noticeDelete => 'Xóa thông báo';

  @override
  String get noticeDeleteConfirmTitle => 'Xóa thông báo này?';

  @override
  String get noticeDeleteLocalOnlyBody =>
      'Thao tác này chỉ xóa nó trên thiết bị này. Những người khác đã nhận được nó vẫn sẽ nhìn thấy nó.';

  @override
  String get noticeDeleted => 'Đã xóa thông báo';

  @override
  String get chatNoticeHidden => 'Thông báo khu vực — mở Thông báo';

  @override
  String get identityDisplayNameTitle => 'Tên hiển thị';

  @override
  String get identitySaveName => 'Lưu tên';

  @override
  String get identityUserIdLabel => 'ID người dùng (Băm khóa công khai)';

  @override
  String get identityCopyHashTooltip => 'Sao chép hàm băm khóa công khai';

  @override
  String get identityMyQrTitle => 'QR của tôi (id + pubKey + tên)';

  @override
  String identityQrFailed(String error) {
    return 'Không thể tạo QR\n$error';
  }

  @override
  String get identitySaving => 'Đang lưu…';

  @override
  String get identitySaveQr => 'Lưu QR vào thư viện ảnh';

  @override
  String get identityOpenScanner => 'Mở camera để quét QR';

  @override
  String get identityQrHelp =>
      'Nhờ một người bạn quét cái này để lưu khóa chung của bạn và (nếu cần) đặt bạn làm Nhà phát hành đã được xác minh';

  @override
  String get identityChatTip =>
      'Mẹo: bạn cũng có thể quét mã QR trong cuộc trò chuyện để thêm khóa chung cho E2EE';

  @override
  String get infoOpen => 'Giới thiệu / Thông tin';

  @override
  String get docsGuideTitle => 'Hướng dẫn sử dụng';

  @override
  String get docsGuideSubtitle => 'Mở trong trình duyệt';

  @override
  String get docsOpenAction => 'Mở hướng dẫn';

  @override
  String get docsOpenFailed => 'Không thể mở hướng dẫn sử dụng';

  @override
  String get firmwareOtaGuideTitle => 'Hướng dẫn flash & giao thức OTA';

  @override
  String get firmwareOtaGuideSubtitle =>
      'Mở hướng dẫn web — tải xuống .bin và các bước đầy đủ';

  @override
  String get firmwareWebDownloadsTitle =>
      'Tải xuống chương trình cơ sở trên web';

  @override
  String get firmwareWebDownloadsSubtitle =>
      'Liên kết mỗi phiên bản và tổng kiểm tra trên trang tài liệu';

  @override
  String get inviteCopyShortLink => 'Sao chép liên kết ngắn';

  @override
  String get inviteShareLink => 'Chia sẻ liên kết';

  @override
  String get inviteShowFullLink => 'Liên kết đầy đủ';

  @override
  String get inviteCopyFullLink => 'Sao chép liên kết đầy đủ';

  @override
  String get inviteLinkCopied => 'Đã sao chép liên kết';

  @override
  String get inviteLongPressHint =>
      'Nhấn và giữ để thực hiện các thao tác liên kết';

  @override
  String get inviteSendInChat => 'Gửi cuộc trò chuyện ResilNet…';

  @override
  String get inviteSendInChatHint =>
      'Chỉ những người mà bạn đã có khóa công khai';

  @override
  String get inviteSendInChatEmpty =>
      'Chưa có cuộc trò chuyện có thể nhắn tin nào.\nTrước tiên, hãy quét QR, mở Khu vực/Lưới hoặc chia sẻ liên kết bên ngoài ứng dụng.';

  @override
  String get inviteSentToChat => 'Lời mời đã được gửi trong cuộc trò chuyện';

  @override
  String get infoTabInfo => 'Thông tin';

  @override
  String get infoTabSettingsHint =>
      'Mở Cài đặt từ menu cho các công cụ ngôn ngữ, E2EE và dữ liệu';

  @override
  String get infoHowToTitle => 'Cách sử dụng';

  @override
  String get infoHowToBody =>
      '• Nhấn vào biểu tượng kênh để chuyển Trò chuyện / #mesh / Khu vực\n• Nhấn vào vị trí để chọn kích thước geohash\n• Nhấn vào mọi người để tìm thành viên hoặc những người đang trực tuyến\n• Mở Danh tính/QR từ ⋮ để trao đổi chìa khóa trực tiếp\n• Khu vực “công cộng” gửi E2EE đã được niêm phong tới từng thiết bị ngang hàng trực tuyến — không phải phòng văn bản gốc';

  @override
  String get infoFeaturesTitle => 'Đặc trưng';

  @override
  String get infoFeatureOffline =>
      'Nhắn tin ngoại tuyến qua Bluetooth Low Energy';

  @override
  String get infoFeatureE2ee =>
      'Mã hóa đầu cuối với RSA-OAEP + AES-GCM (không phải tiếng ồn)';

  @override
  String get infoFeatureMultihop =>
      'Tin nhắn có thể nhảy qua các đồng nghiệp ở gần để đi xa hơn';

  @override
  String get infoFeatureBridge =>
      'Lưới lai ↔ internet (Nostr) cho phong bì kín';

  @override
  String get infoFeatureGeo =>
      'Các kênh geohash cục bộ dành cho những người ở gần (khám phá UX)';

  @override
  String get infoFeatureNotices => 'Thông báo hết hạn cho #mesh và Area';

  @override
  String get infoPrivacyTitle => 'Sự riêng tư';

  @override
  String get infoPrivacyNoRoom =>
      'Không có làng bản rõ/phòng trò chuyện công cộng trên mạng';

  @override
  String get infoPrivacyFanout =>
      'Gửi khu vực = phân bổ theo tỷ lệ 1:1 kín cho các đồng nghiệp có khóa chung đã biết';

  @override
  String get infoPrivacyPresence =>
      'Sự hiện diện của khu vực Internet sử dụng các khóa Nostr tạm thời';

  @override
  String get infoSymbolsTitle => 'Biểu tượng';

  @override
  String get infoSymBle => 'Liên kết Bluetooth trực tiếp';

  @override
  String get infoSymMesh =>
      'Có thể truy cập thông qua lưới (những người khác chuyển tiếp)';

  @override
  String get infoSymInternet => 'Qua internet (Nostr) — phong bì dán kín';

  @override
  String get infoSymBridge => 'Đến qua đường dẫn cầu nối lưới↔internet';

  @override
  String get infoSymOffline => 'Ngoại tuyến - không thể truy cập ngay bây giờ';

  @override
  String get infoSymInArea => 'Trong khu vực kênh vị trí này';

  @override
  String get infoSymE2eeOk => 'Phiên được mã hóa hai đầu';

  @override
  String get infoSymE2eeFail => 'Không có mã hóa - không gửi văn bản nhạy cảm';

  @override
  String get infoSymVerified => 'Khóa đã được xác minh/đã biết danh tính';

  @override
  String get infoSymBlocked => 'Bị chặn';

  @override
  String get infoSymUnread => 'Tin nhắn riêng tư chưa đọc';

  @override
  String get infoEmergencyTitle => 'Chế độ khẩn cấp';

  @override
  String get infoEmergencyBody =>
      'Nhấn ba lần vào tiêu đề ResilNet trên màn hình chính để xóa tin nhắn, khóa và danh tính trên thiết bị này.';

  @override
  String get infoLegendNote =>
      'Một số biểu tượng đường dẫn được ghi lại ở đây để làm rõ; dấu tích gửi trong trò chuyện vẫn là trạng thái gửi chính.';

  @override
  String get dangerZoneTitle => 'Vùng nguy hiểm';

  @override
  String get dangerZoneSubtitle =>
      'Xóa tin nhắn, khóa mã hóa, danh tính Nostr, ngang hàng và biệt hiệu trên thiết bị này. Bạn sẽ thiết lập lại.';

  @override
  String get panicWipeTitle => 'Xóa khẩn cấp';

  @override
  String get panicWipeSubtitle =>
      'Xóa mọi thứ cục bộ - giống như nhấn ba lần vào tiêu đề nhà (nhấn đúp làm mới radio)';

  @override
  String get panicWipeConfirmTitle => 'Xóa tất cả dữ liệu cục bộ?';

  @override
  String get panicWipeConfirmBody =>
      'Thao tác này sẽ xóa vĩnh viễn các cuộc trò chuyện, khóa và danh tính trên điện thoại này.\nCác đồng nghiệp phải trao đổi lại khóa QR với danh tính mới của bạn.\nĐiều này không thể hoàn tác được.';

  @override
  String get panicWipeAction => 'Xóa sạch mọi thứ';

  @override
  String get panicWipeSnack => 'Danh tính cục bộ bị xóa - thiết lập lại';

  @override
  String panicWipeFailed(String error) {
    return 'Xóa không thành công: $error';
  }

  @override
  String get meshBridgeTitle => 'Cầu lưới';

  @override
  String get meshBridgeSubtitle =>
      'Khi bật (mặc định), các phong bì kín có thể sử dụng cả lưới BLE và internet (Nostr) cùng nhau để các đảo lưới gần đó có thể kết nối. Khi tắt, việc gửi chỉ sử dụng một đường dẫn - không bao giờ đưa văn bản gốc lên dây.';

  @override
  String get favoritesTitle => 'Yêu thích';

  @override
  String get favoritesAdd => 'Thêm vào mục yêu thích';

  @override
  String get favoritesRemove => 'Xóa khỏi mục yêu thích';

  @override
  String get favoritesEmpty =>
      'Chưa có mục yêu thích nào - gắn dấu sao cho một người ngang hàng trong danh sách thành viên';

  @override
  String get favoritesNearbyTitle => 'Yêu thích lân cận';

  @override
  String favoritesNearbyBody(String name) {
    return '$name ở gần trên lưới';
  }

  @override
  String get favoritesInAreaTitle => 'Yêu thích trong khu vực';

  @override
  String favoritesInAreaBody(String name) {
    return '$name đang trực tuyến ở khu vực này';
  }

  @override
  String get topologyTitle => 'Cấu trúc liên kết lưới';

  @override
  String get topologySubtitle =>
      'Gợi ý kết nối và ngang hàng từ thông báo lưới (chỉ đọc)';

  @override
  String get topologyConnectedNow => 'Đã kết nối ngay bây giờ (BLE)';

  @override
  String get topologyNearby => 'Gần đây (BLE)';

  @override
  String get topologyKnown => 'Đồng nghiệp đã biết';

  @override
  String get topologyEmpty =>
      'Chưa có đồng nghiệp nào học được — hãy ở gần khi bật BLE';

  @override
  String get topologyYou => 'Bạn';

  @override
  String topologyStats(int peers, int links) {
    return '$peers ngang hàng · $links liên kết';
  }

  @override
  String get topologyGraphHint =>
      'Được ước tính từ khám phá lưới lân cận — thiết bị của bạn được đánh dấu. Nhấn vào một người ngang hàng để mở trò chuyện.';

  @override
  String get topologyOpen => 'Cấu trúc liên kết lưới';

  @override
  String get slashHelpTitle => 'Lệnh';

  @override
  String get slashHelpBody =>
      '/trợ giúp - danh sách này\n/who - những người trực tuyến trong kênh hiện tại\n/drop <text> - ghim một thông báo được niêm phong ở đây (phân xuất E2EE)\n\nHướng dẫn đầy đủ: sử dụng Hướng dẫn mở bên dưới hoặc Cài đặt → Hướng dẫn sử dụng.';

  @override
  String get slashWhoEmpty => 'Hiện tại không có ai trực tuyến trên kênh này';

  @override
  String slashWhoTitle(int count) {
    return 'Trực tuyến ($count)';
  }

  @override
  String get slashDropNeedText => 'Cách sử dụng: /thả văn bản ghi chú của bạn';

  @override
  String slashDropDone(String channel) {
    return 'Đã bỏ thông báo vào $channel';
  }

  @override
  String get slashUnknown => 'Lệnh không xác định - thử /help';

  @override
  String get announceOpen => 'Thông báo';

  @override
  String get announceTitle => 'Thông báo';

  @override
  String get announceEmpty =>
      'Chưa có bảng nào - tạo một bảng để đăng thông báo bị khóa hoặc mở';

  @override
  String get announceCreate => 'Tạo bảng';

  @override
  String get announceCreateHint => 'Tên bảng';

  @override
  String get announceDefaultTitle => 'Ban cộng đồng';

  @override
  String get announceSettings => 'Cài đặt bảng';

  @override
  String get announceAllowLocked => 'Cho phép bài viết bị khóa (mã hóa)';

  @override
  String get announceAllowLockedSub =>
      'Được mã hóa vào khóa bảng - người đọc cần quyền truy cập';

  @override
  String get announceAllowOpen => 'Cho phép bài viết mở (bản rõ)';

  @override
  String get announceAllowOpenSub =>
      'Không phải E2EE - có thể đọc được trên lưới/rơle. Tắt theo mặc định.';

  @override
  String get announceComposeHint => 'Viết thông báo…';

  @override
  String get announceMediaInternetOnly =>
      'Thông báo bằng hình ảnh/giọng nói gửi qua internet (không phải BLE)';

  @override
  String get announceNeedInternet =>
      'Kết nối Internet để gửi thông báo bằng hình ảnh hoặc giọng nói';

  @override
  String announceVoiceFailed(String error) {
    return 'Không thể ghi âm giọng nói: $error';
  }

  @override
  String get announceImageTooLarge => 'Hình ảnh quá lớn (tối đa ~180 KB)';

  @override
  String get announcePlayVoice => 'Phát ghi chú bằng giọng nói';

  @override
  String get announceImageLabel => '📷 Hình ảnh';

  @override
  String get announceAudioLabel => '🎤 Ghi chú bằng giọng nói';

  @override
  String get announceModeLocked => 'Đã khóa';

  @override
  String get announceModeOpen => 'Mở';

  @override
  String get announceOpenBadge => 'MỞ · không được mã hóa';

  @override
  String get announceLockedBadge => 'Đã khóa';

  @override
  String get announceLockedPlaceholder =>
      'Đã mã hóa - yêu cầu quyền truy cập để đọc';

  @override
  String get announceRequestAccess => 'Yêu cầu quyền truy cập';

  @override
  String get announceRequestSent =>
      'Yêu cầu truy cập được gửi đến chủ sở hữu bảng';

  @override
  String get announceRequestFailed =>
      'Không thể yêu cầu quyền truy cập (cần khóa chung của chủ sở hữu)';

  @override
  String get announceOpenConfirmTitle => 'Đăng mà không cần mã hóa?';

  @override
  String get announceOpenConfirmBody =>
      'Mở bài viết không phải là E2EE. Bất kỳ ai trên đường dẫn (lưới/rơle) đều có thể đọc chúng. Tiếp tục?';

  @override
  String get announcePostAction => 'Bưu kiện';

  @override
  String get announcePendingRequests => 'Yêu cầu truy cập';

  @override
  String get announceApprove => 'Chấp thuận';

  @override
  String get announceDeny => 'Từ chối';

  @override
  String get announceGranted =>
      'Bạn có thể đọc các bài viết bị khóa trên diễn đàn này';

  @override
  String get announceOwner => 'Bạn sở hữu bảng này';

  @override
  String get announceCopyInvite => 'Sao chép văn bản mời';

  @override
  String get announceShowInviteQr => 'Hiển thị QR lời mời';

  @override
  String get announceScanInviteQr => 'Quét bảng mời QR';

  @override
  String get announceFollow => 'Theo dõi bảng từ lời mời';

  @override
  String get announceFollowHint =>
      'Dán văn bản mời hoặc liên kết ResilNet từ chủ sở hữu';

  @override
  String get announceFollowOk => 'Bảng theo dõi';

  @override
  String announceFollowOkNamed(String title) {
    return 'Đang theo dõi “$title”';
  }

  @override
  String get announceFollowFail => 'Lời mời không hợp lệ hoặc bị hỏng';

  @override
  String get announceInviteCopied => 'Đã sao chép văn bản mời';

  @override
  String get announceInviteSaveQr => 'Lưu mã QR';

  @override
  String get announceInviteShare => 'Chia sẻ lời mời';

  @override
  String get announceFollowFromCompose =>
      'Đã phát hiện thấy lời mời tham gia hội đồng trong hộp thông báo';

  @override
  String get peerConfirmAddTitle => 'Thêm thành viên mạng?';

  @override
  String peerConfirmAddBody(String name) {
    return 'Thêm “$name” bằng khóa chung của họ để bạn có thể nhắn tin riêng cho họ?';
  }

  @override
  String get peerConfirmAdd => 'Thêm thành viên';

  @override
  String peerAddedOk(String name) {
    return 'Đã thêm $name vào thành viên mạng';
  }

  @override
  String get peerAddFromCompose =>
      'Nhận dạng/khóa công khai được phát hiện trong hộp thông báo';

  @override
  String get peerHashCopied => 'Đã sao chép hàm băm khóa công khai';

  @override
  String get peerHashOpenChat => 'Mở trò chuyện';

  @override
  String get peerHashAddHint =>
      'Đã sao chép băm. Yêu cầu họ chia sẻ liên kết nhận dạng hoặc QR để bạn có thể thêm khóa công khai đầy đủ cho E2EE.';

  @override
  String get peerQrNoCode => 'Không tìm thấy ResilNet QR trong hình ảnh này';

  @override
  String identityInviteSharePreamble(String name) {
    return 'ResilNet danh tính: “$name”\nMở liên kết hoặc dán vào phần trò chuyện → Thêm thành viên\nHoặc quét mã QR nhận dạng.';
  }

  @override
  String get identityShareInvite => 'Chia sẻ liên kết nhận dạng';

  @override
  String get identityInviteCopied => 'Đã sao chép liên kết nhận dạng';

  @override
  String announceInviteSharePreamble(String title) {
    return 'Giấy mời vào hội đồng quản trị: “$title”\nMở ResilNet → Bảng cộng đồng → Theo dõi từ lời mời\nHoặc quét QR / nhấn vào liên kết bên dưới.';
  }

  @override
  String get announceConfirmFollowTitle => 'Theo dõi bảng này?';

  @override
  String announceConfirmFollowBody(String title) {
    return 'Theo dõi “$title” từ lời mời này?';
  }

  @override
  String get announceConfirmFollow => 'Theo';
}

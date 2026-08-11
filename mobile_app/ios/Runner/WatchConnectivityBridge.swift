import Foundation
import WatchConnectivity
import Flutter

/// Forwards AppState snapshots to the paired Apple Watch and routes
/// short-text / open-chat requests back to Flutter.
///
/// Critical: WCSession `replyHandler` must be called quickly. Never wait on
/// Flutter/Dart for the live reply — that causes Watch errors like
/// "Message reply took too long."
final class WatchConnectivityBridge: NSObject, WCSessionDelegate {
  static let shared = WatchConnectivityBridge()

  private static let snapshotDefaultsKey = "resilnet.watch.latestSnapshot"
  private static let pendingRequestKey = "resilnet.watch.pendingRequest"

  private var channel: FlutterMethodChannel?
  private var latestSnapshot: [String: Any] = [:]
  private var sessionActivated = false
  private let lock = NSLock()

  private override init() {
    super.init()
    if let saved = UserDefaults.standard.dictionary(forKey: Self.snapshotDefaultsKey),
       Self.isRealSnapshot(saved) {
      latestSnapshot = saved
      NSLog("[WatchBridge] restored cached snapshot keys=%@", Array(saved.keys).joined(separator: ","))
    }
  }

  /// Activate WCSession as early as possible — do not wait for Flutter.
  func activateSessionEarly() {
    ensureSession()
  }

  func tryAttachFromKeyWindow(_ window: UIWindow?) {
    guard channel == nil else { return }
    guard let messenger = Self.findFlutterMessenger(in: window?.rootViewController) else {
      return
    }
    attach(messenger: messenger)
  }

  /// Push cached or placeholder snapshot to the Watch (e.g. on foreground).
  func pushLatestToWatch() {
    ensureSession()
    let snap = snapshotCopy()
    guard Self.isRealSnapshot(snap) else {
      requestSnapshotFromFlutter()
      return
    }
    pushToWatch(snap)
  }

  private static func isRealSnapshot(_ snap: [String: Any]) -> Bool {
    if let b = snap["phoneReady"] as? Bool { return b }
    if let n = snap["phoneReady"] as? NSNumber { return n.boolValue }
    let id = snap["identityShort"] as? String ?? ""
    return !id.isEmpty && id != "—"
  }

  /// Flutter MethodChannel args arrive as NSDictionary — `[String: Any]` cast often fails.
  private static func stringKeyedDict(_ value: Any?) -> [String: Any] {
    if let d = value as? [String: Any] { return d }
    if let d = value as? [AnyHashable: Any] {
      var out: [String: Any] = [:]
      for (k, v) in d {
        out[String(describing: k)] = v
      }
      return out
    }
    if let d = value as? NSDictionary {
      var out: [String: Any] = [:]
      for (k, v) in d {
        out[String(describing: k)] = v
      }
      return out
    }
    return [:]
  }

  func attach(messenger: FlutterBinaryMessenger) {
    let ch = FlutterMethodChannel(
      name: "com.ajarnnarin.resilnet/watch",
      binaryMessenger: messenger
    )
    channel?.setMethodCallHandler(nil)
    channel = ch
    ch.setMethodCallHandler { [weak self] call, result in
      self?.handleFlutter(call, result: result)
    }
    NSLog("[WatchBridge] method channel attached")
    DispatchQueue.main.async { [weak self] in
      self?.ensureSession()
      self?.requestSnapshotFromFlutter()
    }
  }

  /// Ask Dart for a live snapshot; never push placeholder into applicationContext.
  private func requestSnapshotFromFlutter() {
    pingFlutter("requestSnapshot") { [weak self] response in
      guard let self else { return }
      if let map = response as? [String: Any], map["ok"] as? Bool == true {
        let snap = self.snapshotCopy()
        if snap["phoneReady"] as? Bool == true {
          self.pushToWatch(snap)
        }
      }
    }
  }

  private static func findFlutterMessenger(in vc: UIViewController?) -> FlutterBinaryMessenger? {
    if let fvc = vc as? FlutterViewController {
      return fvc.binaryMessenger
    }
    for child in vc?.children ?? [] {
      if let messenger = findFlutterMessenger(in: child) {
        return messenger
      }
    }
    if let presented = vc?.presentedViewController {
      return findFlutterMessenger(in: presented)
    }
    return nil
  }

  private func ensureSession() {
    guard WCSession.isSupported() else {
      NSLog("[WatchBridge] WCSession unsupported")
      return
    }
    let session = WCSession.default
    if session.delegate !== self {
      session.delegate = self
    }
    if session.activationState == .notActivated {
      sessionActivated = true
      session.activate()
      NSLog("[WatchBridge] WCSession activate requested")
    } else if session.activationState == .activated {
      sessionActivated = true
      let snap = snapshotCopy()
      if Self.isRealSnapshot(snap) {
        pushToWatch(snap)
      }
    }
  }

  private func snapshotCopy() -> [String: Any] {
    lock.lock()
    defer { lock.unlock() }
    return latestSnapshot
  }

  private func storeSnapshot(_ snap: [String: Any]) {
    let safe = Self.plistSafeDict(snap)
    lock.lock()
    latestSnapshot = safe
    lock.unlock()
    if Self.isRealSnapshot(safe) {
      UserDefaults.standard.set(safe, forKey: Self.snapshotDefaultsKey)
    }
    UserDefaults.standard.set(false, forKey: Self.pendingRequestKey)
    NSLog(
      "[WatchBridge] stored snapshot chats=%d identity=%@",
      (safe["chats"] as? [Any])?.count ?? -1,
      (safe["identityShort"] as? String) ?? "?"
    )
  }

  private func handleFlutter(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "updateSnapshotJson":
      guard let json = call.arguments as? String,
            let data = json.data(using: .utf8),
            let obj = try? JSONSerialization.jsonObject(with: data),
            let snap = obj as? [String: Any],
            !snap.isEmpty
      else {
        NSLog(
          "[WatchBridge] updateSnapshotJson bad args type=%@",
          String(describing: type(of: call.arguments))
        )
        result(["ok": false, "error": "bad_json"])
        return
      }
      NSLog(
        "[WatchBridge] updateSnapshotJson identity=%@ chats=%d",
        (snap["identityShort"] as? String) ?? "?",
        (snap["chats"] as? [Any])?.count ?? -1
      )
      storeSnapshot(snap)
      ensureSession()
      pushToWatch(snapshotCopy())
      result([
        "ok": true,
        "identityShort": snap["identityShort"] as? String ?? "",
        "chats": (snap["chats"] as? [Any])?.count ?? 0,
      ])

    case "updateSnapshot":
      // Legacy map path — keep for older builds.
      let snap = Self.stringKeyedDict(call.arguments)
      guard !snap.isEmpty else {
        result(["ok": false, "error": "empty_snapshot"])
        return
      }
      storeSnapshot(snap)
      ensureSession()
      pushToWatch(snapshotCopy())
      result([
        "ok": true,
        "identityShort": snap["identityShort"] as? String ?? "",
        "chats": (snap["chats"] as? [Any])?.count ?? 0,
      ])

    case "getBridgeStatus":
      let snap = snapshotCopy()
      result([
        "ok": true,
        "hasSnapshot": !snap.isEmpty,
        "phoneReady": Self.isRealSnapshot(snap),
        "identityShort": snap["identityShort"] as? String ?? "",
        "sessionActivated": sessionActivated,
        "channelAttached": channel != nil,
        "reachable": WCSession.isSupported() ? WCSession.default.isReachable : false,
        "activationState": WCSession.isSupported() ? WCSession.default.activationState.rawValue : -1,
      ])
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func pushToWatch(_ snap: [String: Any]) {
    guard WCSession.isSupported(), !snap.isEmpty else { return }
    let session = WCSession.default
    guard session.activationState == .activated else {
      NSLog("[WatchBridge] push skipped — session not activated")
      return
    }

    do {
      try session.updateApplicationContext(["snapshot": snap])
      NSLog("[WatchBridge] applicationContext updated")
    } catch {
      NSLog("[WatchBridge] updateApplicationContext failed: \(error)")
    }

    if session.isReachable {
      session.sendMessage(
        ["type": "snapshot", "snapshot": snap],
        replyHandler: { _ in },
        errorHandler: { err in
          NSLog("[WatchBridge] sendMessage snapshot failed: \(err)")
          // Fall back to queued transfer when live send fails.
          session.transferUserInfo(["snapshot": snap])
        }
      )
      // Also queue so Watch gets it even if the live reply races.
      session.transferUserInfo(["snapshot": snap])
    } else {
      session.transferUserInfo(["snapshot": snap])
      NSLog("[WatchBridge] transferUserInfo snapshot queued")
    }
  }

  private func pingFlutter(
    _ method: String,
    args: [String: Any] = [:],
    completion: ((Any?) -> Void)? = nil
  ) {
    guard let channel else {
      NSLog("[WatchBridge] pingFlutter skipped — no channel")
      completion?(nil)
      return
    }
    DispatchQueue.main.async {
      channel.invokeMethod(method, arguments: args) { response in
        if let map = response as? [String: Any] {
          NSLog("[WatchBridge] Flutter %@ -> %@", method, map)
        } else if let err = response as? FlutterError {
          NSLog("[WatchBridge] Flutter %@ error: %@", method, err.message ?? err.code)
        } else {
          NSLog("[WatchBridge] Flutter %@ done", method)
        }
        completion?(response)
      }
    }
  }

  private func forwardToFlutter(
    method: String,
    args: [String: Any],
    reply: (([String: Any]) -> Void)?
  ) {
    guard let channel else {
      NSLog("[WatchBridge] forwardToFlutter no channel method=%@", method)
      reply?(["ok": false, "error": "no_channel"])
      return
    }
    DispatchQueue.main.async {
      channel.invokeMethod(method, arguments: args) { response in
        if let map = response as? [String: Any] {
          var cleaned: [String: Any] = [:]
          for (k, v) in map {
            if v is NSNull { continue }
            cleaned[k] = v
          }
          NSLog("[WatchBridge] Flutter %@ reply ok=%@", method, String(describing: cleaned["ok"]))
          reply?(cleaned)
        } else if let dict = response as? NSDictionary {
          var cleaned: [String: Any] = [:]
          for (k, v) in dict {
            if v is NSNull { continue }
            cleaned[String(describing: k)] = v
          }
          NSLog("[WatchBridge] Flutter %@ nsdict ok=%@", method, String(describing: cleaned["ok"]))
          reply?(cleaned)
        } else if let err = response as? FlutterError {
          NSLog("[WatchBridge] Flutter %@ error %@", method, err.message ?? err.code)
          reply?(["ok": false, "error": err.message ?? err.code])
        } else {
          NSLog("[WatchBridge] Flutter %@ bad_response type=%@", method, String(describing: type(of: response)))
          reply?(["ok": false, "error": "bad_response"])
        }
      }
    }
  }

  /// Placeholder so Watch leaves the infinite "Waiting for iPhone sync" state.
  private func placeholderSnapshot() -> [String: Any] {
    [
      "identityShort": "—",
      "displayName": "ResilNet",
      "transport": "—",
      "unreadDirects": 0,
      "onlineCount": 0,
      "updatedAt": Int(Date().timeIntervalSince1970 * 1000),
      "chats": [] as [Any],
      "phoneReady": false,
      "hint": "Open ResilNet on iPhone",
    ]
  }

  // MARK: - WCSessionDelegate

  func session(
    _ session: WCSession,
    activationDidCompleteWith activationState: WCSessionActivationState,
    error: Error?
  ) {
    if let error {
      NSLog("[WatchBridge] activation error: \(error)")
    }
    NSLog("[WatchBridge] activationState=%d reachable=%d", activationState.rawValue, session.isReachable)
    if activationState == .activated {
      pushLatestToWatch()
    }
  }

  func sessionDidBecomeInactive(_ session: WCSession) {}

  func sessionDidDeactivate(_ session: WCSession) {
    session.activate()
  }

  func sessionReachabilityDidChange(_ session: WCSession) {
    NSLog("[WatchBridge] reachability -> %d", session.isReachable)
    let snap = snapshotCopy()
    if session.isReachable {
      if Self.isRealSnapshot(snap) {
        pushToWatch(snap)
      }
      requestSnapshotFromFlutter()
    }
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    handleWatchMessage(message, reply: nil)
  }

  func session(
    _ session: WCSession,
    didReceiveMessage message: [String: Any],
    replyHandler: @escaping ([String: Any]) -> Void
  ) {
    handleWatchMessage(message, reply: replyHandler)
  }

  func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
    handleWatchMessage(userInfo, reply: nil)
  }

  private func handleWatchMessage(_ message: [String: Any], reply: (([String: Any]) -> Void)?) {
    let type = message["type"] as? String ?? ""
    NSLog("[WatchBridge] from watch type=%@", type)
    switch type {
    case "requestSnapshot":
      UserDefaults.standard.set(true, forKey: Self.pendingRequestKey)
      var snap = snapshotCopy()
      let usingPlaceholder = snap.isEmpty
      if usingPlaceholder {
        snap = placeholderSnapshot()
      }
      // ALWAYS reply immediately — never wait for Dart.
      reply?([
        "ok": true,
        "snapshot": snap,
        "stale": usingPlaceholder,
        "placeholder": usingPlaceholder,
      ])
      if !usingPlaceholder {
        pushToWatch(snap)
      }
      requestSnapshotFromFlutter()

    case "sendShortText":
      let peerId = message["peerId"] as? String ?? ""
      let text = message["text"] as? String ?? ""
      guard let reply else {
        pingFlutter("sendShortText", args: ["peerId": peerId, "text": text])
        return
      }
      var finished = false
      let finish: ([String: Any]) -> Void = { payload in
        if finished { return }
        finished = true
        reply(payload)
      }
      forwardToFlutter(
        method: "sendShortText",
        args: ["peerId": peerId, "text": text],
        reply: { payload in
          // Prefer real Flutter result; never mask a hard failure as success.
          finish(payload)
          // After a successful send, refresh Watch chats.
          if let ok = payload["ok"] as? Bool, ok {
            self.requestSnapshotFromFlutter()
          } else if let n = payload["ok"] as? NSNumber, n.boolValue {
            self.requestSnapshotFromFlutter()
          }
        }
      )
      // Soft-queue ONLY if Flutter never answers (don't claim success early).
      DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) {
        finish([
          "ok": false,
          "queued": false,
          "error": "phone_busy",
        ])
      }

    case "openChat":
      let peerId = message["peerId"] as? String ?? ""
      reply?(["ok": true])
      pingFlutter("openChat", args: ["peerId": peerId])

    default:
      if message["snapshot"] != nil {
        reply?(["ok": true])
      } else {
        reply?(["ok": false, "error": "unknown_type"])
      }
    }
  }

  // MARK: - Plist sanitization (WCSession requires property-list types)

  private static func plistSafeDict(_ input: [String: Any]) -> [String: Any] {
    var out: [String: Any] = [:]
    for (k, v) in input {
      if let safe = plistSafe(v) {
        out[k] = safe
      }
    }
    return out
  }

  private static func plistSafe(_ value: Any) -> Any? {
    switch value {
    case is NSNull:
      return nil
    case let s as String:
      return s
    case let b as Bool:
      return b
    case let n as NSNumber:
      return n
    case let i as Int:
      return NSNumber(value: i)
    case let i as Int64:
      return NSNumber(value: i)
    case let i as UInt64:
      return NSNumber(value: i)
    case let d as Double:
      return NSNumber(value: d)
    case let a as [Any]:
      return a.compactMap { plistSafe($0) }
    case let a as [[String: Any]]:
      return a.map { plistSafeDict($0) }
    case let d as [String: Any]:
      return plistSafeDict(d)
    case let d as [AnyHashable: Any]:
      var out: [String: Any] = [:]
      for (k, v) in d {
        let key = String(describing: k)
        if let safe = plistSafe(v) {
          out[key] = safe
        }
      }
      return out
    default:
      NSLog("[WatchBridge] drop non-plist type %@", String(describing: type(of: value)))
      return nil
    }
  }
}

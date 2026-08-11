import Combine
import Foundation
import WatchConnectivity

struct WatchChatMessage: Identifiable, Hashable {
  let id: String
  let fromMe: Bool
  let text: String
  let ts: Int
}

struct WatchChat: Identifiable, Hashable {
  var id: String { peerId }
  let peerId: String
  let name: String
  let unread: Int
  let lastPreview: String
  let lastTs: Int
  let messages: [WatchChatMessage]
}

final class WatchSessionModel: NSObject, ObservableObject {
  static let shared = WatchSessionModel()

  @Published var identityShort: String = "—"
  @Published var displayName: String = ""
  @Published var transport: String = "auto"
  @Published var unreadDirects: Int = 0
  @Published var onlineCount: Int = 0
  @Published var chats: [WatchChat] = []
  @Published var phoneReachable: Bool = false
  @Published var lastError: String?
  @Published var sending: Bool = false
  @Published var refreshing: Bool = false
  @Published var lastSyncedAt: Date?
  @Published var hasSnapshot: Bool = false
  @Published var phoneReady: Bool = false
  @Published var hint: String = ""

  private override init() {
    super.init()
  }

  func activate() {
    guard WCSession.isSupported() else {
      lastError = "WatchConnectivity unavailable"
      return
    }
    let session = WCSession.default
    session.delegate = self
    if session.activationState == .notActivated {
      session.activate()
    } else {
      applyCachedContextIfAny(session)
      phoneReachable = session.isReachable
      requestSnapshot()
    }
  }

  /// Offline fallback so UI leaves the infinite "Waiting for iPhone" state.
  private static func localPlaceholder() -> [String: Any] {
    [
      "identityShort": "—",
      "displayName": "ResilNet",
      "transport": "—",
      "unreadDirects": 0,
      "onlineCount": 0,
      "updatedAt": Int(Date().timeIntervalSince1970 * 1000),
      "chats": [] as [Any],
      "phoneReady": false,
      "hint": "Open ResilNet on iPhone (foreground)",
    ]
  }

  private func applyPlaceholderIfNeeded() {
    guard !hasSnapshot else { return }
    applySnapshot(Self.localPlaceholder())
  }

  /// Pull the last phone snapshot even when iPhone is not currently reachable.
  private func applyCachedContextIfAny(_ session: WCSession) {
    let ctx = session.receivedApplicationContext
    if let snap = ctx["snapshot"] as? [String: Any], !snap.isEmpty {
      applySnapshot(snap)
    }
  }

  func requestSnapshot() {
    guard WCSession.isSupported() else {
      lastError = "WatchConnectivity unavailable"
      return
    }
    if refreshing { return }

    let session = WCSession.default
    phoneReachable = session.isReachable
    applyCachedContextIfAny(session)

    guard session.activationState == .activated else {
      lastError = "Watch session not ready — wait a moment"
      // Try activate again so next tap works.
      session.delegate = self
      session.activate()
      return
    }

    refreshing = true
    lastError = nil

    guard session.isReachable else {
      // Queue a wake-up ping so phone pushes when it can.
      session.transferUserInfo(["type": "requestSnapshot"])
      lastError = hasSnapshot
        ? "Queued refresh — unlock iPhone"
        : "Open ResilNet on iPhone, then Refresh again"
      // Brief spinner so the tap is visibly acknowledged.
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) { [weak self] in
        self?.refreshing = false
        self?.applyPlaceholderIfNeeded()
      }
      return
    }

    session.sendMessage(
      ["type": "requestSnapshot"],
      replyHandler: { [weak self] reply in
        DispatchQueue.main.async {
          self?.refreshing = false
          if let snap = reply["snapshot"] as? [String: Any], !snap.isEmpty {
            self?.applySnapshot(snap)
            if self?.phoneReady == true {
              self?.lastError = nil
            } else {
              // Phone replied with placeholder — ask again after Flutter has time to push.
              DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                guard self?.phoneReady != true else { return }
                self?.requestSnapshot()
              }
            }
          } else if reply["stale"] as? Bool == true || (reply["snapshot"] as? [String: Any])?.isEmpty == true {
            self?.applyCachedContextIfAny(WCSession.default)
            self?.lastError = self?.hasSnapshot == true
              ? "Keep ResilNet open on iPhone for a live sync"
              : "Open ResilNet on iPhone (foreground), then Refresh"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
              guard self?.phoneReady != true else { return }
              self?.requestSnapshot()
            }
          } else if reply["ok"] as? Bool != true {
            self?.lastError = Self.friendlyError(reply["error"] as? String)
          }
        }
      },
      errorHandler: { [weak self] err in
        DispatchQueue.main.async {
          self?.refreshing = false
          self?.applyCachedContextIfAny(WCSession.default)
          self?.applyPlaceholderIfNeeded()
          WCSession.default.transferUserInfo(["type": "requestSnapshot"])
          let raw = err.localizedDescription
          // Map WCSession noise to actionable copy.
          if raw.localizedCaseInsensitiveContains("not reachable") {
            self?.phoneReachable = false
            self?.lastError = self?.hasSnapshot == true
              ? "iPhone went away — showing last sync"
              : "Unlock iPhone and open ResilNet"
          } else if raw.localizedCaseInsensitiveContains("took too long") {
            self?.lastError = self?.hasSnapshot == true
              ? "iPhone slow — showing last sync. Keep app open."
              : "Open ResilNet on iPhone, wait a few seconds, Refresh"
          } else {
            self?.lastError = raw
          }
        }
      }
    )
  }

  func sendShortText(peerId: String, text: String, completion: @escaping (Bool) -> Void) {
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else {
      completion(false)
      return
    }
    guard trimmed.count <= 160 else {
      lastError = "Message too long (max 160)"
      completion(false)
      return
    }
    guard WCSession.isSupported() else {
      lastError = "WatchConnectivity unavailable"
      completion(false)
      return
    }
    let session = WCSession.default
    phoneReachable = session.isReachable

    guard session.activationState == .activated else {
      lastError = "Watch session not ready"
      completion(false)
      return
    }

    // Prefer live send; fall back to queued transferUserInfo when phone is away.
    if !session.isReachable {
      session.transferUserInfo([
        "type": "sendShortText",
        "peerId": peerId,
        "text": trimmed,
      ])
      lastError = nil
      sending = false
      // Optimistic local note — real confirmation comes after phone syncs.
      appendOptimisticMessage(peerId: peerId, text: trimmed)
      completion(true)
      return
    }

    sending = true
    lastError = nil
    session.sendMessage(
      ["type": "sendShortText", "peerId": peerId, "text": trimmed],
      replyHandler: { [weak self] reply in
        DispatchQueue.main.async {
          self?.sending = false
          let ok = Self.boolValue(reply["ok"], default: false)
          let queued = Self.boolValue(reply["queued"], default: false)
          if ok {
            self?.lastError = nil
            self?.appendOptimisticMessage(peerId: peerId, text: trimmed)
            if !queued {
              self?.requestSnapshot()
            }
            completion(true)
          } else {
            self?.lastError = Self.friendlyError(reply["error"] as? String)
            completion(false)
          }
        }
      },
      errorHandler: { [weak self] err in
        DispatchQueue.main.async {
          self?.sending = false
          WCSession.default.transferUserInfo([
            "type": "sendShortText",
            "peerId": peerId,
            "text": trimmed,
          ])
          self?.appendOptimisticMessage(peerId: peerId, text: trimmed)
          self?.lastError = "Queued — keep ResilNet open on iPhone"
          completion(true)
        }
      }
    )
  }

  func openChatOnPhone(peerId: String) {
    guard WCSession.isSupported() else {
      lastError = "WatchConnectivity unavailable"
      return
    }
    let session = WCSession.default
    let payload: [String: Any] = ["type": "openChat", "peerId": peerId]
    if session.isReachable {
      session.sendMessage(
        payload,
        replyHandler: { [weak self] reply in
          DispatchQueue.main.async {
            if reply["ok"] as? Bool == false {
              self?.lastError = Self.friendlyError(reply["error"] as? String)
            }
          }
        },
        errorHandler: { [weak self] err in
          DispatchQueue.main.async {
            self?.lastError = err.localizedDescription
          }
        }
      )
    } else {
      session.transferUserInfo(payload)
      lastError = "Queued — open ResilNet on iPhone"
    }
  }

  private func appendOptimisticMessage(peerId: String, text: String) {
    guard let idx = chats.firstIndex(where: { $0.peerId == peerId }) else { return }
    var chat = chats[idx]
    let msg = WatchChatMessage(
      id: "local-\(UUID().uuidString)",
      fromMe: true,
      text: text,
      ts: Int(Date().timeIntervalSince1970 * 1000)
    )
    var msgs = chat.messages
    msgs.append(msg)
    chat = WatchChat(
      peerId: chat.peerId,
      name: chat.name,
      unread: chat.unread,
      lastPreview: text,
      lastTs: msg.ts,
      messages: msgs
    )
    chats[idx] = chat
  }

  private static func boolValue(_ value: Any?, default def: Bool) -> Bool {
    if let b = value as? Bool { return b }
    if let n = value as? NSNumber { return n.boolValue }
    return def
  }

  private static func intValue(_ value: Any?, default def: Int = 0) -> Int {
    if let i = value as? Int { return i }
    if let n = value as? NSNumber { return n.intValue }
    if let d = value as? Double { return Int(d) }
    return def
  }

  private static func dictList(_ value: Any?) -> [[String: Any]] {
    if let a = value as? [[String: Any]] { return a }
    guard let arr = value as? [Any] else { return [] }
    return arr.compactMap { item -> [String: Any]? in
      if let d = item as? [String: Any] { return d }
      if let d = item as? [AnyHashable: Any] {
        var out: [String: Any] = [:]
        for (k, v) in d { out[String(describing: k)] = v }
        return out
      }
      if let d = item as? NSDictionary {
        var out: [String: Any] = [:]
        for (k, v) in d { out[String(describing: k)] = v }
        return out
      }
      return nil
    }
  }

  func applySnapshot(_ snap: [String: Any]) {
    guard !snap.isEmpty else { return }
    let ready = Self.boolValue(snap["phoneReady"], default: false)
    let id = snap["identityShort"] as? String ?? "—"
    // Never let a placeholder overwrite a real identity.
    if !ready, phoneReady, identityShort != "—", identityShort != id {
      return
    }

    identityShort = id
    displayName = snap["displayName"] as? String ?? ""
    transport = snap["transport"] as? String ?? "auto"
    unreadDirects = Self.intValue(snap["unreadDirects"])
    onlineCount = Self.intValue(snap["onlineCount"])
    phoneReady = ready
    hint = snap["hint"] as? String ?? ""

    if let ms = snap["updatedAt"] as? Int {
      lastSyncedAt = Date(timeIntervalSince1970: TimeInterval(ms) / 1000.0)
    } else if let n = snap["updatedAt"] as? NSNumber {
      lastSyncedAt = Date(timeIntervalSince1970: n.doubleValue / 1000.0)
    } else if let ms = snap["updatedAt"] as? Double {
      lastSyncedAt = Date(timeIntervalSince1970: ms / 1000.0)
    } else if ready {
      lastSyncedAt = Date()
    }

    let rawChats = Self.dictList(snap["chats"])
    chats = rawChats.compactMap { c -> WatchChat? in
      let peerId = c["peerId"] as? String ?? ""
      if peerId.isEmpty { return nil }
      let msgs = Self.dictList(c["messages"]).map { m in
        WatchChatMessage(
          id: m["id"] as? String ?? UUID().uuidString,
          fromMe: Self.boolValue(m["fromMe"], default: false),
          text: m["text"] as? String ?? "",
          ts: Self.intValue(m["ts"])
        )
      }
      return WatchChat(
        peerId: peerId,
        name: c["name"] as? String ?? "Peer",
        unread: Self.intValue(c["unread"]),
        lastPreview: c["lastPreview"] as? String ?? "",
        lastTs: Self.intValue(c["lastTs"]),
        messages: msgs
      )
    }
    hasSnapshot = ready && id != "—" && !id.isEmpty
    if !phoneReady {
      lastError = hint.isEmpty ? "Open ResilNet on iPhone (keep it open)" : hint
    } else {
      lastError = nil
    }
  }

  private static func friendlyError(_ code: String?) -> String {
    switch code {
    case "phone_busy":
      return "iPhone busy — keep ResilNet open, try again"
    case "phone_not_ready":
      return "iPhone app still starting — try again"
    case "no_peer_key", "send_failed":
      return "Can't send — peer has no key / E2EE"
    case "e2ee_off":
      return "E2EE is off on iPhone"
    case "too_long":
      return "Message too long (max 160)"
    case "invalid_args":
      return "Invalid message"
    case "no_channel":
      return "Watch bridge not ready — reopen iPhone app"
    case .some(let s) where !s.isEmpty:
      return s
    default:
      return "Send failed"
    }
  }
}

extension WatchSessionModel: WCSessionDelegate {
  func session(
    _ session: WCSession,
    activationDidCompleteWith activationState: WCSessionActivationState,
    error: Error?
  ) {
    DispatchQueue.main.async {
      self.phoneReachable = session.isReachable
      if let error {
        self.lastError = error.localizedDescription
      }
      self.applyCachedContextIfAny(session)
      if activationState == .activated {
        self.requestSnapshot()
      }
    }
  }

  func sessionReachabilityDidChange(_ session: WCSession) {
    DispatchQueue.main.async {
      self.phoneReachable = session.isReachable
      if session.isReachable {
        self.requestSnapshot()
      }
    }
  }

  func session(
    _ session: WCSession,
    didReceiveApplicationContext applicationContext: [String: Any]
  ) {
    DispatchQueue.main.async {
      if let snap = applicationContext["snapshot"] as? [String: Any] {
        self.applySnapshot(snap)
        self.lastError = nil
      }
    }
  }

  func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
    DispatchQueue.main.async {
      if let snap = message["snapshot"] as? [String: Any] {
        self.applySnapshot(snap)
        self.lastError = nil
      }
    }
  }

  func session(
    _ session: WCSession,
    didReceiveMessage message: [String: Any],
    replyHandler: @escaping ([String: Any]) -> Void
  ) {
    DispatchQueue.main.async {
      if let snap = message["snapshot"] as? [String: Any] {
        self.applySnapshot(snap)
        self.lastError = nil
      }
      replyHandler(["ok": true])
    }
  }

  func session(_ session: WCSession, didReceiveUserInfo userInfo: [String: Any] = [:]) {
    DispatchQueue.main.async {
      if let snap = userInfo["snapshot"] as? [String: Any] {
        self.applySnapshot(snap)
        self.lastError = nil
      }
    }
  }
}

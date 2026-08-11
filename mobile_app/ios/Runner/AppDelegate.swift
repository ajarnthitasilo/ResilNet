import Flutter
import UIKit

/// UITextField that never steals keyboard focus from Flutter.
private final class SecureHostField: UITextField {
  override var canBecomeFirstResponder: Bool { false }
}

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var secureEnabled = false
  private var secureField: SecureHostField?
  private weak var secureContainer: UIView?
  private var captureCover: UIView?
  private var captureObserver: NSObjectProtocol?
  private var lifecycleObserver: NSObjectProtocol?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    WatchConnectivityBridge.shared.activateSessionEarly()
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) { [weak self] in
      guard let self else { return }
      WatchConnectivityBridge.shared.tryAttachFromKeyWindow(self.keyWindow())
    }
    return result
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    WatchConnectivityBridge.shared.activateSessionEarly()
    WatchConnectivityBridge.shared.tryAttachFromKeyWindow(keyWindow())
    WatchConnectivityBridge.shared.pushLatestToWatch()
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Match SecureScreen: plugin registrar messenger is what Dart MethodChannels use.
    if let watchRegistrar = engineBridge.pluginRegistry.registrar(
      forPlugin: "WatchConnectivityBridge"
    ) {
      WatchConnectivityBridge.shared.attach(messenger: watchRegistrar.messenger())
    }
    // Also attach application registrar (some Flutter versions route app channels here).
    WatchConnectivityBridge.shared.attach(
      messenger: engineBridge.applicationRegistrar.messenger()
    )

    guard let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "SecureScreen") else {
      return
    }
    let channel = FlutterMethodChannel(
      name: "com.ajarnnarin.resilnet/secure_screen",
      binaryMessenger: registrar.messenger()
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else {
        result(nil)
        return
      }
      if call.method == "setSecure" {
        let args = call.arguments as? [String: Any]
        let enabled = args?["enabled"] as? Bool ?? false
        DispatchQueue.main.async {
          self.setSecure(enabled)
          result(nil)
        }
      } else {
        result(FlutterMethodNotImplemented)
      }
    }
  }

  private func keyWindow() -> UIWindow? {
    if let window = window {
      return window
    }
    return UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
      ?? UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first
  }

  private func flutterRootView(in window: UIWindow) -> UIView? {
    if let fvc = window.rootViewController as? FlutterViewController {
      return fvc.view
    }
    // Implicit-engine / nested hosts: walk for a FlutterView.
    return findFlutterView(in: window)
  }

  private func findFlutterView(in root: UIView) -> UIView? {
    let name = String(describing: type(of: root))
    if name.contains("FlutterView") { return root }
    for child in root.subviews {
      if let hit = findFlutterView(in: child) { return hit }
    }
    return nil
  }

  private func setSecure(_ enabled: Bool) {
    secureEnabled = enabled
    guard let window = keyWindow() else { return }

    if enabled {
      applySecureHosting(on: window)
      installCaptureObserver()
      installLifecycleObserver()
      updateCaptureCover(window: window, captured: UIScreen.main.isCaptured)
    } else {
      removeCaptureObserver()
      removeLifecycleObserver()
      removeCaptureCover()
      clearSecureHosting(on: window)
    }
  }

  /// Blank screenshots/recordings by hosting FlutterView inside a secure
  /// UITextField canvas (UIView reparent — not CALayer window.layer hacks).
  private func applySecureHosting(on window: UIWindow) {
    guard let flutterView = flutterRootView(in: window) else { return }

    if secureField == nil || secureField?.superview == nil {
      let field = SecureHostField(frame: window.bounds)
      field.isSecureTextEntry = true
      field.isUserInteractionEnabled = true
      field.backgroundColor = .clear
      field.textColor = .clear
      field.tintColor = .clear
      field.text = " "
      field.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      window.addSubview(field)
      field.setNeedsLayout()
      field.layoutIfNeeded()
      secureField = field
      secureContainer = resolveSecureContainer(in: field)
    }

    guard let container = secureContainer else { return }
    container.isUserInteractionEnabled = true
    container.frame = window.bounds
    container.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    if flutterView.superview !== container {
      flutterView.removeFromSuperview()
      container.addSubview(flutterView)
    }
    flutterView.frame = container.bounds
    flutterView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  }

  private func resolveSecureContainer(in field: UIView) -> UIView {
    for subview in field.subviews {
      let className = String(describing: type(of: subview))
      if className.contains("TextLayoutCanvasView")
        || className.contains("TextFieldCanvasView")
        || className.contains("Secure")
      {
        return subview
      }
    }
    return field.subviews.first ?? field
  }

  private func clearSecureHosting(on window: UIWindow) {
    guard let flutterView = flutterRootView(in: window) ?? secureContainer?.subviews.first else {
      cleanupSecureViews()
      return
    }
    if flutterView.superview !== window {
      flutterView.removeFromSuperview()
      window.insertSubview(flutterView, at: 0)
    }
    flutterView.frame = window.bounds
    flutterView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    cleanupSecureViews()
  }

  private func cleanupSecureViews() {
    secureField?.removeFromSuperview()
    secureField = nil
    secureContainer = nil
  }

  private func installLifecycleObserver() {
    if lifecycleObserver != nil { return }
    lifecycleObserver = NotificationCenter.default.addObserver(
      forName: UIApplication.didBecomeActiveNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      guard let self = self, self.secureEnabled, let window = self.keyWindow() else { return }
      self.applySecureHosting(on: window)
    }
  }

  private func removeLifecycleObserver() {
    if let obs = lifecycleObserver {
      NotificationCenter.default.removeObserver(obs)
      lifecycleObserver = nil
    }
  }

  private func installCaptureObserver() {
    if captureObserver != nil { return }
    captureObserver = NotificationCenter.default.addObserver(
      forName: UIScreen.capturedDidChangeNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      guard let self = self, self.secureEnabled, let window = self.keyWindow() else { return }
      self.updateCaptureCover(window: window, captured: UIScreen.main.isCaptured)
    }
  }

  private func removeCaptureObserver() {
    if let obs = captureObserver {
      NotificationCenter.default.removeObserver(obs)
      captureObserver = nil
    }
  }

  private func updateCaptureCover(window: UIWindow, captured: Bool) {
    if captured {
      if captureCover == nil {
        let cover = UIView(frame: window.bounds)
        cover.backgroundColor = .black
        cover.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        cover.isUserInteractionEnabled = false
        window.addSubview(cover)
        captureCover = cover
      }
      captureCover?.frame = window.bounds
      captureCover?.isHidden = false
      window.bringSubviewToFront(captureCover!)
    } else {
      captureCover?.isHidden = true
    }
  }

  private func removeCaptureCover() {
    captureCover?.removeFromSuperview()
    captureCover = nil
  }
}

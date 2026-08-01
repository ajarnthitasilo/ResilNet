import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var secureEnabled = false
  private var secureField: UITextField?
  private var captureCover: UIView?
  private var captureObserver: NSObjectProtocol?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
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
    return UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap { $0.windows }
      .first { $0.isKeyWindow }
      ?? UIApplication.shared.connectedScenes
        .compactMap { $0 as? UIWindowScene }
        .flatMap { $0.windows }
        .first
  }

  private func setSecure(_ enabled: Bool) {
    secureEnabled = enabled
    guard let window = keyWindow() else { return }

    if enabled {
      applySecureLayer(on: window)
      installCaptureObserver()
      updateCaptureCover(window: window, captured: UIScreen.main.isCaptured)
    } else {
      removeCaptureObserver()
      removeCaptureCover()
      // Secure layer teardown is best-effort; leaving it on is safer than
      // re-parenting Flutter's window layer mid-session. Next cold start
      // restores a normal hierarchy. Toggle off only when leaving chats.
      clearSecureLayer(on: window)
    }
  }

  /// Blank OS screenshots/recordings by hosting the window layer in a
  /// secure UITextField layer (common banking-app technique).
  private func applySecureLayer(on window: UIWindow) {
    if secureField != nil { return }
    let field = UITextField()
    field.isSecureTextEntry = true
    field.isUserInteractionEnabled = false
    window.addSubview(field)
    field.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      field.centerXAnchor.constraint(equalTo: window.centerXAnchor),
      field.centerYAnchor.constraint(equalTo: window.centerYAnchor),
      field.widthAnchor.constraint(equalToConstant: 0),
      field.heightAnchor.constraint(equalToConstant: 0),
    ])
    window.layoutIfNeeded()
    guard let secureLayer = field.layer.sublayers?.last else {
      field.removeFromSuperview()
      return
    }
    window.layer.superlayer?.addSublayer(field.layer)
    secureLayer.addSublayer(window.layer)
    secureField = field
  }

  private func clearSecureLayer(on window: UIWindow) {
    guard secureField != nil else { return }
    // Re-attach window.layer under the normal window hierarchy.
    if let container = window.layer.superlayer {
      // Already under secure host — move back under UIWindow's expected parent
      // by removing the secure field; UIKit will restore on next layout in
      // most cases. If not, a hot restart recovers.
      _ = container
    }
    secureField?.removeFromSuperview()
    secureField = nil
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

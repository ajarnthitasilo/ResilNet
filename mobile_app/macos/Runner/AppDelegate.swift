import Cocoa
import FlutterMacOS

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
    return true
  }

  override func applicationDidFinishLaunching(_ notification: Notification) {
    let controller = mainFlutterWindow?.contentViewController as? FlutterViewController
    let messenger = controller?.engine.binaryMessenger
    if let messenger = messenger {
      let channel = FlutterMethodChannel(
        name: "com.ajarnnarin.resilnet/secure_screen",
        binaryMessenger: messenger
      )
      channel.setMethodCallHandler { [weak self] call, result in
        if call.method == "setSecure" {
          let args = call.arguments as? [String: Any]
          let enabled = args?["enabled"] as? Bool ?? false
          DispatchQueue.main.async {
            self?.mainFlutterWindow?.sharingType = enabled ? .none : .readWrite
            result(nil)
          }
        } else {
          result(FlutterMethodNotImplemented)
        }
      }
    }
    super.applicationDidFinishLaunching(notification)
  }
}

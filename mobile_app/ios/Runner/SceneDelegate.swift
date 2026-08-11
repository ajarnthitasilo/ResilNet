import Flutter
import UIKit

class SceneDelegate: FlutterSceneDelegate {
  override func sceneDidBecomeActive(_ scene: UIScene) {
    super.sceneDidBecomeActive(scene)
    let window = (scene as? UIWindowScene)?.windows.first { $0.isKeyWindow }
      ?? (scene as? UIWindowScene)?.windows.first
    WatchConnectivityBridge.shared.activateSessionEarly()
    WatchConnectivityBridge.shared.tryAttachFromKeyWindow(window)
    WatchConnectivityBridge.shared.pushLatestToWatch()
  }
}

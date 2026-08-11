import SwiftUI
import WatchConnectivity

@main
struct ResilNetWatchApp: App {
  @ObservedObject private var session = WatchSessionModel.shared

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(session)
        .onAppear { session.activate() }
    }
  }
}

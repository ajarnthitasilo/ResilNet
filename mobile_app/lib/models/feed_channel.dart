/// Bitchat-inspired feed scopes for the home UI.
///
/// These are **views over discovery + E2EE directs**, not public plaintext rooms.
enum FeedChannel {
  /// 1:1 conversations (existing chat list).
  directs,

  /// Proximity: peers currently seen on BLE mesh.
  mesh,

  /// Geographic scope via geohash (local filter / channel label).
  geo,
}

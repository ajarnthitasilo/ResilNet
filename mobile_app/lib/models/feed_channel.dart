/// Bitchat-inspired feed scopes for the home UI.
///
/// - [directs]: 1:1 conversation list
/// - [mesh]: nearby BLE peers (private chat only) + local auto-delete settings
/// - [geo]: people online in the selected geohash; 1:1 and sealed area fan-out
enum FeedChannel {
  /// 1:1 conversations (existing chat list).
  directs,

  /// Proximity: peers currently seen on BLE mesh.
  mesh,

  /// Geographic scope via geohash presence + area messaging.
  geo,
}

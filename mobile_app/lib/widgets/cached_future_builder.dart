import 'package:flutter/material.dart';

/// [FutureBuilder] that starts its future once per [epoch] instead of once per
/// build.
///
/// A plain `FutureBuilder(future: db.query(...))` inside a widget that watches
/// [ChangeNotifier] state re-runs the query on *every* notification — in this
/// app that meant a SQLite read per BLE/Nostr tick, and a visible flicker as
/// the list fell back to its loading state. Wrap the load here and pass an
/// [epoch] that changes only when the underlying data does.
class CachedFutureBuilder<T> extends StatefulWidget {
  const CachedFutureBuilder({
    super.key,
    required this.epoch,
    required this.load,
    required this.builder,
  });

  /// Reload trigger: a new value (by `==`) restarts [load].
  final Object epoch;

  final Future<T> Function() load;

  final Widget Function(BuildContext context, AsyncSnapshot<T> snapshot)
  builder;

  @override
  State<CachedFutureBuilder<T>> createState() => _CachedFutureBuilderState<T>();
}

class _CachedFutureBuilderState<T> extends State<CachedFutureBuilder<T>> {
  late Future<T> _future = widget.load();

  @override
  void didUpdateWidget(CachedFutureBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.epoch != widget.epoch) {
      _future = widget.load();
    }
  }

  /// Force a reload even though the epoch did not change (pull-to-refresh).
  void reload() => setState(() => _future = widget.load());

  @override
  Widget build(BuildContext context) =>
      FutureBuilder<T>(future: _future, builder: widget.builder);
}

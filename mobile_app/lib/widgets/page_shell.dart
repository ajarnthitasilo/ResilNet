import 'package:flutter/material.dart';

import '../app/theme.dart';

/// Standard ResilNet page: the gradient wash sits *behind* the whole scaffold,
/// app bar included.
///
/// Screens used to each wire this up by hand, and some put the gradient inside
/// `body`, which left the app bar on a flat background. Use this instead.
class ResilNetPage extends StatelessWidget {
  const ResilNetPage({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: ResilNetTheme.pageDecoration(context),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';

import 'theme.dart';

/// Frosted liquid-glass [SnackBar] used app-wide.
class GlassSnackBar extends SnackBar {
  GlassSnackBar({
    super.key,
    required Widget content,
    SnackBarAction? action,
    super.duration,
    DismissDirection dismissDirection = DismissDirection.down,
    super.width,
    EdgeInsetsGeometry margin = const EdgeInsets.fromLTRB(12, 0, 12, 12),
  }) : super(
          dismissDirection: dismissDirection,
          backgroundColor: Colors.transparent,
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.zero,
          margin: width == null ? margin : null,
          content: _GlassSnackBarBody(content: content, action: action),
        );
}

class _GlassSnackBarBody extends StatelessWidget {
  const _GlassSnackBarBody({required this.content, this.action});

  final Widget content;
  final SnackBarAction? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textStyle = theme.textTheme.bodyMedium?.copyWith(color: cs.onSurface);

    Widget body = DefaultTextStyle.merge(
      style: textStyle,
      child: content,
    );

    if (action != null) {
      body = Row(
        children: [
          Expanded(child: body),
          const SizedBox(width: 8),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              action!.onPressed();
            },
            child: Text(action!.label),
          ),
        ],
      );
    }

    return ResilNetTheme.glassPanel(
      context: context,
      borderRadius: BorderRadius.circular(16),
      blurSigma: 26,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: body,
    );
  }
}

/// Frosted liquid-glass [AlertDialog] drop-in.
class GlassAlertDialog extends StatelessWidget {
  const GlassAlertDialog({
    super.key,
    this.icon,
    this.title,
    this.content,
    this.actions,
    this.scrollable = false,
    this.contentPadding,
    this.titlePadding,
    this.actionsPadding,
    this.insetPadding =
        const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
    this.actionsAlignment,
    this.actionsOverflowAlignment,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowDirection,
    this.clipBehavior = Clip.antiAlias,
    this.semanticLabel,
  });

  final Widget? icon;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;
  final bool scrollable;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? actionsPadding;
  final EdgeInsets insetPadding;
  final MainAxisAlignment? actionsAlignment;
  final OverflowBarAlignment? actionsOverflowAlignment;
  final double? actionsOverflowButtonSpacing;
  final VerticalDirection? actionsOverflowDirection;
  final Clip clipBehavior;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final dark = ResilNetTheme.isDark(context);
    final fill = dark
        ? ResilNetTheme.surface.withValues(alpha: 0.55)
        : const Color(0xFFEAF4F8).withValues(alpha: 0.58);
    final border = ResilNetTheme.glassBorder(context);

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
      child: AlertDialog(
        backgroundColor: fill,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: border),
        ),
        icon: icon,
        title: title,
        content: content,
        actions: actions,
        scrollable: scrollable,
        contentPadding: contentPadding,
        titlePadding: titlePadding,
        actionsPadding: actionsPadding,
        insetPadding: insetPadding,
        actionsAlignment: actionsAlignment,
        actionsOverflowAlignment: actionsOverflowAlignment,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowDirection: actionsOverflowDirection,
        clipBehavior: clipBehavior,
        semanticLabel: semanticLabel,
      ),
    );
  }
}

/// Frosted liquid-glass [Dialog] for custom content.
class GlassDialog extends StatelessWidget {
  const GlassDialog({
    super.key,
    required this.child,
    this.insetPadding = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.all(12),
    this.borderRadius = const BorderRadius.all(Radius.circular(20)),
  });

  final Widget child;
  final EdgeInsets insetPadding;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: insetPadding,
      child: ResilNetTheme.glassPanel(
        context: context,
        borderRadius: borderRadius,
        blurSigma: 26,
        padding: padding,
        child: child,
      ),
    );
  }
}

/// Modal bottom sheet with frosted liquid-glass chrome.
Future<T?> showGlassModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool isScrollControlled = false,
  bool showDragHandle = false,
  bool isDismissible = true,
  bool enableDrag = true,
  bool useSafeArea = false,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    showDragHandle: false,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    useSafeArea: useSafeArea,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.35),
    builder: (ctx) {
      const radius = BorderRadius.vertical(top: Radius.circular(20));
      final body = builder(ctx);
      return ResilNetTheme.glassPanel(
        context: ctx,
        borderRadius: radius,
        blurSigma: 28,
        child: showDragHandle
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Center(
                    child: Container(
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(ctx)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.28),
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                  ),
                  body,
                ],
              )
            : body,
      );
    },
  );
}

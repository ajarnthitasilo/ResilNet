import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../app/theme.dart';

class OnboardingDemoAction {
  const OnboardingDemoAction({
    required this.icon,
    required this.label,
    required this.hint,
  });

  final IconData icon;
  final String label;
  final String hint;
}

/// Simulated toolbar with looping tap highlight + explanation caption.
class OnboardingDemoPanel extends StatefulWidget {
  const OnboardingDemoPanel({
    super.key,
    required this.actions,
    this.height = 168,
  });

  final List<OnboardingDemoAction> actions;
  final double height;

  @override
  State<OnboardingDemoPanel> createState() => _OnboardingDemoPanelState();
}

class _OnboardingDemoPanelState extends State<OnboardingDemoPanel>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: math.max(2800, widget.actions.length * 2200),
      ),
    )..repeat();
  }

  @override
  void didUpdateWidget(covariant OnboardingDemoPanel oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.actions.length != widget.actions.length) {
      _ctrl.duration = Duration(
        milliseconds: math.max(2800, widget.actions.length * 2200),
      );
      _ctrl
        ..reset()
        ..repeat();
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final actions = widget.actions;
    if (actions.isEmpty) return SizedBox(height: widget.height);

    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, _) {
        final n = actions.length;
        final phase = (_ctrl.value * n) % n;
        final index = phase.floor().clamp(0, n - 1);
        final local = phase - index;
        // 0–0.22 approach, 0.22–0.45 tap pulse, 0.45–0.85 hold hint, 0.85–1 fade
        final tapPulse = local < 0.22
            ? 0.0
            : local < 0.45
                ? Curves.easeOut.transform((local - 0.22) / 0.23)
                : local < 0.85
                    ? 1.0
                    : Curves.easeIn.transform(1 - (local - 0.85) / 0.15);
        final hintOpacity = local < 0.28
            ? 0.0
            : local < 0.4
                ? (local - 0.28) / 0.12
                : local < 0.82
                    ? 1.0
                    : (1 - (local - 0.82) / 0.18).clamp(0.0, 1.0);

        final scheme = Theme.of(context).colorScheme;
        final dark = ResilNetTheme.isDark(context);
        final action = actions[index];

        return SizedBox(
          height: widget.height,
          child: ResilNetTheme.glassPanel(
            context: context,
            borderRadius: BorderRadius.circular(20),
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Column(
              children: [
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final cols = math.min(4, actions.length);
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          for (var i = 0; i < actions.length; i++)
                            _DemoChip(
                              action: actions[i],
                              selected: i == index,
                              tapPulse: i == index ? tapPulse : 0,
                              width: (constraints.maxWidth - (cols - 1) * 8) /
                                  cols,
                              scheme: scheme,
                              dark: dark,
                            ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 120),
                  opacity: hintOpacity.clamp(0.0, 1.0),
                  child: Row(
                    children: [
                      Icon(
                        action.icon,
                        size: 16,
                        color: ResilNetTheme.emerald,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          action.hint,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: scheme.onSurface.withValues(alpha: 0.78),
                                height: 1.3,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DemoChip extends StatelessWidget {
  const _DemoChip({
    required this.action,
    required this.selected,
    required this.tapPulse,
    required this.width,
    required this.scheme,
    required this.dark,
  });

  final OnboardingDemoAction action;
  final bool selected;
  final double tapPulse;
  final double width;
  final ColorScheme scheme;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final scale = 1 + 0.08 * tapPulse;
    final ring = tapPulse;
    return SizedBox(
      width: width.clamp(64, 120),
      child: Transform.scale(
        scale: scale,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (selected && ring > 0)
              Container(
                width: 44 + 18 * ring,
                height: 44 + 18 * ring,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ResilNetTheme.emerald.withValues(
                      alpha: 0.45 * (1 - ring * 0.35),
                    ),
                    width: 2,
                  ),
                ),
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: selected
                    ? ResilNetTheme.emerald.withValues(alpha: dark ? 0.22 : 0.16)
                    : scheme.onSurface.withValues(alpha: dark ? 0.06 : 0.05),
                border: Border.all(
                  color: selected
                      ? ResilNetTheme.emerald.withValues(alpha: 0.55)
                      : scheme.onSurface.withValues(alpha: 0.08),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    action.icon,
                    size: 20,
                    color: selected
                        ? ResilNetTheme.emerald
                        : scheme.onSurface.withValues(alpha: 0.7),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    action.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight:
                              selected ? FontWeight.w700 : FontWeight.w500,
                          color: scheme.onSurface.withValues(
                            alpha: selected ? 0.92 : 0.65,
                          ),
                          fontSize: 10,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

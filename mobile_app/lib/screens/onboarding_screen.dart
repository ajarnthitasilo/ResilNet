import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';
import '../widgets/onboarding/onboarding_illustrations.dart';

class _OnboardingPage {
  const _OnboardingPage({
    required this.titleOf,
    required this.bodyOf,
    required this.builder,
  });

  final String Function(AppLocalizations l10n) titleOf;
  final String Function(AppLocalizations l10n) bodyOf;
  final Widget Function(double t) builder;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _anim;
  final _pageController = PageController();
  int _page = 0;

  static final _pages = <_OnboardingPage>[
    _OnboardingPage(
      titleOf: (l) => l.onboardingWelcomeTitle,
      bodyOf: (l) => l.onboardingWelcomeBody,
      builder: (t) => MeshNetworkIllustration(t: t),
    ),
    _OnboardingPage(
      titleOf: (l) => l.onboardingFriendsTitle,
      bodyOf: (l) => l.onboardingFriendsBody,
      builder: (t) => QrFriendIllustration(t: t),
    ),
    _OnboardingPage(
      titleOf: (l) => l.onboardingChannelsTitle,
      bodyOf: (l) => l.onboardingChannelsBody,
      builder: (t) => ChatMessageIllustration(t: t),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _anim.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await context.read<AppState>().completeOnboarding();
  }

  void _next() {
    if (_page >= _pages.length - 1) {
      _finish();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [OnboardingPalette.bgTop, OnboardingPalette.bgBottom],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: Text(
                    l10n.onboardingSkip,
                    style: TextStyle(
                      color: OnboardingPalette.navySoft.withValues(alpha: 0.85),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) {
                    final p = _pages[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        children: [
                          const Spacer(),
                          AnimatedBuilder(
                            animation: _anim,
                            builder: (context, _) => p.builder(_anim.value),
                          ),
                          const SizedBox(height: 36),
                          Text(
                            p.titleOf(l10n),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: OnboardingPalette.navy,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            p.bodyOf(l10n),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: OnboardingPalette.navySoft,
                                  height: 1.45,
                                ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (i) {
                  final active = i == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 22 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: active
                          ? OnboardingPalette.emerald
                          : OnboardingPalette.emerald.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: OnboardingPalette.emerald,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: _next,
                    child: Text(
                      _page == _pages.length - 1
                          ? l10n.onboardingStart
                          : l10n.onboardingNext,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/app_state.dart';
import '../widgets/onboarding/onboarding_illustrations.dart';

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.body,
    required this.builder,
  });

  final String title;
  final String body;
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
      title: 'ยินดีต้อนรับสู่ ResilNet',
      body: 'สื่อสารในชุมชนบ้านปู่คำผ่านเครือข่าย Mesh แม้ไม่มีอินเทอร์เน็ต',
      builder: (t) => MeshNetworkIllustration(t: t),
    ),
    _OnboardingPage(
      title: 'เพิ่มเพื่อนได้ง่าย',
      body:
          'แชร์ QR จากหน้า “ตัวตน” หรือสแกน QR ของเพื่อนเพื่อแลกเปลี่ยน Public Key',
      builder: (t) => QrFriendIllustration(t: t),
    ),
    _OnboardingPage(
      title: 'แชทแบบเข้ารหัส',
      body:
          'ส่งข้อความส่วนตัวแบบ E2EE ผ่าน Bluetooth Mesh และ Nostr — ทำงานได้แม้ไม่มีเน็ตในพื้นที่',
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
                    'ข้าม',
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
                            p.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: OnboardingPalette.navy,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            p.body,
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
                          ? 'เริ่มต้นการใช้งาน'
                          : 'ถัดไป',
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

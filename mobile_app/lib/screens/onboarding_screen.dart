import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/theme.dart';
import '../l10n/l10n_ext.dart';
import '../state/app_state.dart';
import '../widgets/onboarding/onboarding_demo_panel.dart';

class _OnboardingPageSpec {
  const _OnboardingPageSpec({
    required this.titleOf,
    required this.bodyOf,
    required this.actionsOf,
  });

  final String Function(AppLocalizations l10n) titleOf;
  final String Function(AppLocalizations l10n) bodyOf;
  final List<OnboardingDemoAction> Function(AppLocalizations l10n) actionsOf;
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _page = 0;

  static List<_OnboardingPageSpec> _pages(AppLocalizations l) => [
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingWelcomeTitle,
          bodyOf: (x) => x.onboardingWelcomeBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.hub_outlined,
              label: x.onboardingWelcomeFeatMeshLabel,
              hint: x.onboardingWelcomeFeatMeshHint,
            ),
            OnboardingDemoAction(
              icon: Icons.lock_outline,
              label: x.onboardingWelcomeFeatE2eeLabel,
              hint: x.onboardingWelcomeFeatE2eeHint,
            ),
            OnboardingDemoAction(
              icon: Icons.cloud_off_outlined,
              label: x.onboardingWelcomeFeatOfflineLabel,
              hint: x.onboardingWelcomeFeatOfflineHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingIdentityTitle,
          bodyOf: (x) => x.onboardingIdentityBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.qr_code_2,
              label: x.onboardingIdentityFeatQrLabel,
              hint: x.onboardingIdentityFeatQrHint,
            ),
            OnboardingDemoAction(
              icon: Icons.ios_share,
              label: x.onboardingIdentityFeatShareLabel,
              hint: x.onboardingIdentityFeatShareHint,
            ),
            OnboardingDemoAction(
              icon: Icons.qr_code_scanner,
              label: x.onboardingIdentityFeatScanLabel,
              hint: x.onboardingIdentityFeatScanHint,
            ),
            OnboardingDemoAction(
              icon: Icons.badge_outlined,
              label: x.onboardingIdentityFeatNameLabel,
              hint: x.onboardingIdentityFeatNameHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingChannelsTitle,
          bodyOf: (x) => x.onboardingChannelsBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.lock_outline,
              label: x.onboardingChannelsFeatDirectsLabel,
              hint: x.onboardingChannelsFeatDirectsHint,
            ),
            OnboardingDemoAction(
              icon: Icons.hub_outlined,
              label: x.onboardingChannelsFeatMeshLabel,
              hint: x.onboardingChannelsFeatMeshHint,
            ),
            OnboardingDemoAction(
              icon: Icons.public,
              label: x.onboardingChannelsFeatGeoLabel,
              hint: x.onboardingChannelsFeatGeoHint,
            ),
            OnboardingDemoAction(
              icon: Icons.push_pin_outlined,
              label: x.onboardingChannelsFeatPinLabel,
              hint: x.onboardingChannelsFeatPinHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingToolbarTitle,
          bodyOf: (x) => x.onboardingToolbarBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.place_outlined,
              label: x.onboardingToolbarFeatLocationLabel,
              hint: x.onboardingToolbarFeatLocationHint,
            ),
            OnboardingDemoAction(
              icon: Icons.swap_horiz,
              label: x.onboardingToolbarFeatTransportLabel,
              hint: x.onboardingToolbarFeatTransportHint,
            ),
            OnboardingDemoAction(
              icon: Icons.campaign_outlined,
              label: x.onboardingToolbarFeatNoticesLabel,
              hint: x.onboardingToolbarFeatNoticesHint,
            ),
            OnboardingDemoAction(
              icon: Icons.mark_chat_unread_outlined,
              label: x.onboardingToolbarFeatUnreadLabel,
              hint: x.onboardingToolbarFeatUnreadHint,
            ),
            OnboardingDemoAction(
              icon: Icons.groups_outlined,
              label: x.onboardingToolbarFeatPeopleLabel,
              hint: x.onboardingToolbarFeatPeopleHint,
            ),
            OnboardingDemoAction(
              icon: Icons.more_vert,
              label: x.onboardingToolbarFeatMenuLabel,
              hint: x.onboardingToolbarFeatMenuHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingComposeTitle,
          bodyOf: (x) => x.onboardingComposeBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.image_outlined,
              label: x.onboardingComposeFeatImageLabel,
              hint: x.onboardingComposeFeatImageHint,
            ),
            OnboardingDemoAction(
              icon: Icons.mic_none,
              label: x.onboardingComposeFeatVoiceLabel,
              hint: x.onboardingComposeFeatVoiceHint,
            ),
            OnboardingDemoAction(
              icon: Icons.send,
              label: x.onboardingComposeFeatSendLabel,
              hint: x.onboardingComposeFeatSendHint,
            ),
            OnboardingDemoAction(
              icon: Icons.timer_outlined,
              label: x.onboardingComposeFeatExpiryLabel,
              hint: x.onboardingComposeFeatExpiryHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingChatTitle,
          bodyOf: (x) => x.onboardingChatBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.qr_code_scanner,
              label: x.onboardingChatFeatScanLabel,
              hint: x.onboardingChatFeatScanHint,
            ),
            OnboardingDemoAction(
              icon: Icons.block,
              label: x.onboardingChatFeatBlockLabel,
              hint: x.onboardingChatFeatBlockHint,
            ),
            OnboardingDemoAction(
              icon: Icons.edit_outlined,
              label: x.onboardingChatFeatAliasLabel,
              hint: x.onboardingChatFeatAliasHint,
            ),
            OnboardingDemoAction(
              icon: Icons.verified_user_outlined,
              label: x.onboardingChatFeatAcceptKeyLabel,
              hint: x.onboardingChatFeatAcceptKeyHint,
            ),
            OnboardingDemoAction(
              icon: Icons.mic_none,
              label: x.onboardingChatFeatMicLabel,
              hint: x.onboardingChatFeatMicHint,
            ),
            OnboardingDemoAction(
              icon: Icons.image_outlined,
              label: x.onboardingChatFeatImageLabel,
              hint: x.onboardingChatFeatImageHint,
            ),
            OnboardingDemoAction(
              icon: Icons.emoji_emotions_outlined,
              label: x.onboardingChatFeatEmojiLabel,
              hint: x.onboardingChatFeatEmojiHint,
            ),
            OnboardingDemoAction(
              icon: Icons.send,
              label: x.onboardingChatFeatSendLabel,
              hint: x.onboardingChatFeatSendHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingAnnounceTitle,
          bodyOf: (x) => x.onboardingAnnounceBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.add_box_outlined,
              label: x.onboardingAnnounceFeatCreateLabel,
              hint: x.onboardingAnnounceFeatCreateHint,
            ),
            OnboardingDemoAction(
              icon: Icons.qr_code_scanner,
              label: x.onboardingAnnounceFeatScanLabel,
              hint: x.onboardingAnnounceFeatScanHint,
            ),
            OnboardingDemoAction(
              icon: Icons.lock_open_outlined,
              label: x.onboardingAnnounceFeatAccessLabel,
              hint: x.onboardingAnnounceFeatAccessHint,
            ),
            OnboardingDemoAction(
              icon: Icons.post_add,
              label: x.onboardingAnnounceFeatPostLabel,
              hint: x.onboardingAnnounceFeatPostHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingWifiTitle,
          bodyOf: (x) => x.onboardingWifiBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.wifi_tethering,
              label: x.onboardingWifiFeatHostLabel,
              hint: x.onboardingWifiFeatHostHint,
            ),
            OnboardingDemoAction(
              icon: Icons.wifi_find,
              label: x.onboardingWifiFeatJoinLabel,
              hint: x.onboardingWifiFeatJoinHint,
            ),
            OnboardingDemoAction(
              icon: Icons.chat_bubble_outline,
              label: x.onboardingWifiFeatChatLabel,
              hint: x.onboardingWifiFeatChatHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingTransportTitle,
          bodyOf: (x) => x.onboardingTransportBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.bluetooth,
              label: x.onboardingTransportFeatMeshLabel,
              hint: x.onboardingTransportFeatMeshHint,
            ),
            OnboardingDemoAction(
              icon: Icons.language,
              label: x.onboardingTransportFeatInternetLabel,
              hint: x.onboardingTransportFeatInternetHint,
            ),
            OnboardingDemoAction(
              icon: Icons.auto_mode,
              label: x.onboardingTransportFeatAutoLabel,
              hint: x.onboardingTransportFeatAutoHint,
            ),
            OnboardingDemoAction(
              icon: Icons.bluetooth_searching,
              label: x.onboardingTransportFeatBleLabel,
              hint: x.onboardingTransportFeatBleHint,
            ),
            OnboardingDemoAction(
              icon: Icons.cloud_sync_outlined,
              label: x.onboardingTransportFeatNostrLabel,
              hint: x.onboardingTransportFeatNostrHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingGeoTitle,
          bodyOf: (x) => x.onboardingGeoBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.my_location,
              label: x.onboardingGeoFeatGpsLabel,
              hint: x.onboardingGeoFeatGpsHint,
            ),
            OnboardingDemoAction(
              icon: Icons.tune,
              label: x.onboardingGeoFeatPrecisionLabel,
              hint: x.onboardingGeoFeatPrecisionHint,
            ),
            OnboardingDemoAction(
              icon: Icons.flight,
              label: x.onboardingGeoFeatTeleportLabel,
              hint: x.onboardingGeoFeatTeleportHint,
            ),
            OnboardingDemoAction(
              icon: Icons.push_pin_outlined,
              label: x.onboardingGeoFeatPinLabel,
              hint: x.onboardingGeoFeatPinHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingAdvancedTitle,
          bodyOf: (x) => x.onboardingAdvancedBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.share_outlined,
              label: x.onboardingAdvancedFeatTopoLabel,
              hint: x.onboardingAdvancedFeatTopoHint,
            ),
            OnboardingDemoAction(
              icon: Icons.cell_tower_outlined,
              label: x.onboardingAdvancedFeatMtLabel,
              hint: x.onboardingAdvancedFeatMtHint,
            ),
            OnboardingDemoAction(
              icon: Icons.memory,
              label: x.onboardingAdvancedFeatEspLabel,
              hint: x.onboardingAdvancedFeatEspHint,
            ),
            OnboardingDemoAction(
              icon: Icons.home_work_outlined,
              label: x.onboardingAdvancedFeatLxmfLabel,
              hint: x.onboardingAdvancedFeatLxmfHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingSecurityTitle,
          bodyOf: (x) => x.onboardingSecurityBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.notifications_outlined,
              label: x.onboardingSecurityFeatNotifLabel,
              hint: x.onboardingSecurityFeatNotifHint,
            ),
            OnboardingDemoAction(
              icon: Icons.screenshot_monitor_outlined,
              label: x.onboardingSecurityFeatShotLabel,
              hint: x.onboardingSecurityFeatShotHint,
            ),
            OnboardingDemoAction(
              icon: Icons.history,
              label: x.onboardingSecurityFeatHistoryLabel,
              hint: x.onboardingSecurityFeatHistoryHint,
            ),
            OnboardingDemoAction(
              icon: Icons.delete_forever_outlined,
              label: x.onboardingSecurityFeatPanicLabel,
              hint: x.onboardingSecurityFeatPanicHint,
            ),
            OnboardingDemoAction(
              icon: Icons.healing_outlined,
              label: x.onboardingSecurityFeatRecoverLabel,
              hint: x.onboardingSecurityFeatRecoverHint,
            ),
            OnboardingDemoAction(
              icon: Icons.menu_book_outlined,
              label: x.onboardingSecurityFeatDocsLabel,
              hint: x.onboardingSecurityFeatDocsHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingWatchTitle,
          bodyOf: (x) => x.onboardingWatchBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.watch,
              label: x.onboardingWatchFeatStatusLabel,
              hint: x.onboardingWatchFeatStatusHint,
            ),
            OnboardingDemoAction(
              icon: Icons.chat_bubble_outline,
              label: x.onboardingWatchFeatChatsLabel,
              hint: x.onboardingWatchFeatChatsHint,
            ),
            OnboardingDemoAction(
              icon: Icons.short_text,
              label: x.onboardingWatchFeatSendLabel,
              hint: x.onboardingWatchFeatSendHint,
            ),
          ],
        ),
        _OnboardingPageSpec(
          titleOf: (x) => x.onboardingReadyTitle,
          bodyOf: (x) => x.onboardingReadyBody,
          actionsOf: (x) => [
            OnboardingDemoAction(
              icon: Icons.play_arrow_rounded,
              label: x.onboardingReadyFeatStartLabel,
              hint: x.onboardingReadyFeatStartHint,
            ),
            OnboardingDemoAction(
              icon: Icons.skip_next,
              label: x.onboardingReadyFeatSkipLabel,
              hint: x.onboardingReadyFeatSkipHint,
            ),
          ],
        ),
      ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await context.read<AppState>().completeOnboarding();
  }

  void _next(int total) {
    if (_page >= total - 1) {
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
    final pages = _pages(l10n);
    final scheme = Theme.of(context).colorScheme;
    final dark = ResilNetTheme.isDark(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: ResilNetTheme.pageDecoration(context),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        '${_page + 1}/${pages.length}',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              color: scheme.onSurface.withValues(alpha: 0.45),
                            ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: _finish,
                      child: Text(
                        l10n.onboardingSkip,
                        style: TextStyle(
                          color: scheme.onSurface.withValues(alpha: 0.72),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (i) => setState(() => _page = i),
                  itemBuilder: (context, i) {
                    final p = pages[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        children: [
                          const SizedBox(height: 8),
                          OnboardingDemoPanel(actions: p.actionsOf(l10n)),
                          const SizedBox(height: 22),
                          Text(
                            p.titleOf(l10n),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: scheme.onSurface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                p.bodyOf(l10n),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: scheme.onSurface
                                          .withValues(alpha: 0.72),
                                      height: 1.45,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: LinearProgressIndicator(
                    value: (_page + 1) / pages.length,
                    minHeight: 4,
                    backgroundColor:
                        scheme.onSurface.withValues(alpha: dark ? 0.12 : 0.1),
                    color: ResilNetTheme.emerald,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (i) {
                  final active = i == _page;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 2.5),
                    width: active ? 16 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: active
                          ? ResilNetTheme.emerald
                          : ResilNetTheme.emerald.withValues(alpha: 0.28),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: ResilNetTheme.emerald,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () => _next(pages.length),
                    child: Text(
                      _page == pages.length - 1
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

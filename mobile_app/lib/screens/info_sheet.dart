import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../core/docs_links.dart';
import '../l10n/l10n_ext.dart';

/// Bitchat-style About / Info sheet (how-to, features, privacy, symbols).
Future<void> showInfoSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _InfoSheet(),
  );
}

class _InfoSheet extends StatelessWidget {
  const _InfoSheet();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.88,
      minChildSize: 0.45,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            gradient: ResilNetTheme.scaffoldGradientFor(context),
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: onSurface.withValues(alpha: 0.24),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        l10n.infoOpen,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    IconButton(
                      tooltip: l10n.close,
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(16, 4, 16, 24 + bottom),
                  children: [
                    Text(
                      l10n.infoTabSettingsHint,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(context),
                          ),
                    ),
                    const SizedBox(height: 14),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.menu_book_outlined),
                      title: Text(l10n.docsGuideTitle),
                      subtitle: Text(l10n.docsGuideSubtitle),
                      trailing: const Icon(Icons.open_in_new, size: 20),
                      onTap: () => DocsLinks.openUserGuideOrSnack(context),
                    ),
                    const SizedBox(height: 10),
                    _sectionTitle(context, l10n.infoHowToTitle),
                    const SizedBox(height: 8),
                    Text(
                      l10n.infoHowToBody,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.45,
                            color: onSurface.withValues(alpha: 0.88),
                          ),
                    ),
                    const SizedBox(height: 22),
                    _sectionTitle(context, l10n.infoFeaturesTitle),
                    const SizedBox(height: 8),
                    _feature(
                      context,
                      Icons.wifi_off_outlined,
                      l10n.infoFeatureOffline,
                    ),
                    _feature(
                      context,
                      Icons.lock_outline,
                      l10n.infoFeatureE2ee,
                    ),
                    _feature(
                      context,
                      Icons.cell_tower_outlined,
                      l10n.infoFeatureMultihop,
                    ),
                    _feature(
                      context,
                      Icons.hub_outlined,
                      l10n.infoFeatureBridge,
                    ),
                    _feature(
                      context,
                      Icons.tag,
                      l10n.infoFeatureGeo,
                    ),
                    _feature(
                      context,
                      Icons.campaign_outlined,
                      l10n.infoFeatureNotices,
                    ),
                    const SizedBox(height: 18),
                    _sectionTitle(context, l10n.infoPrivacyTitle),
                    const SizedBox(height: 8),
                    _feature(
                      context,
                      Icons.visibility_off_outlined,
                      l10n.infoPrivacyNoRoom,
                    ),
                    _feature(
                      context,
                      Icons.mail_lock_outlined,
                      l10n.infoPrivacyFanout,
                    ),
                    _feature(
                      context,
                      Icons.swap_horiz,
                      l10n.infoPrivacyPresence,
                    ),
                    const SizedBox(height: 18),
                    _sectionTitle(context, l10n.infoEmergencyTitle),
                    const SizedBox(height: 8),
                    _feature(
                      context,
                      Icons.front_hand_outlined,
                      l10n.infoEmergencyBody,
                    ),
                    const SizedBox(height: 18),
                    _sectionTitle(context, l10n.infoSymbolsTitle),
                    const SizedBox(height: 8),
                    _symbol(context, Icons.bluetooth, l10n.infoSymBle),
                    _symbol(context, Icons.share_outlined, l10n.infoSymMesh),
                    _symbol(context, Icons.public, l10n.infoSymInternet),
                    _symbol(context, Icons.language, l10n.infoSymBridge),
                    _symbol(
                      context,
                      Icons.person_off_outlined,
                      l10n.infoSymOffline,
                    ),
                    _symbol(context, Icons.place_outlined, l10n.infoSymInArea),
                    _symbol(context, Icons.lock, l10n.infoSymE2eeOk),
                    _symbol(
                      context,
                      Icons.gpp_bad_outlined,
                      l10n.infoSymE2eeFail,
                    ),
                    _symbol(
                      context,
                      Icons.verified_outlined,
                      l10n.infoSymVerified,
                    ),
                    _symbol(context, Icons.block, l10n.infoSymBlocked),
                    _symbol(
                      context,
                      Icons.mark_email_unread_outlined,
                      l10n.infoSymUnread,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.infoLegendNote,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ResilNetTheme.mutedOnSurface(
                              context,
                              alpha: 0.5,
                            ),
                            height: 1.35,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _sectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: ResilNetTheme.emerald,
            fontWeight: FontWeight.w700,
          ),
    );
  }

  Widget _feature(BuildContext context, IconData icon, String text) {
    final onSurface = Theme.of(context).colorScheme.onSurface;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: onSurface.withValues(alpha: 0.75)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.35,
                    color: onSurface.withValues(alpha: 0.88),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _symbol(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 28,
            child: Icon(icon, size: 20, color: ResilNetTheme.channelGreen),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.35,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.8),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

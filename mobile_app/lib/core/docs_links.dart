import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';

/// ResilNet Docsify site (GitHub Pages). Open in the system browser only.
class DocsLinks {
  DocsLinks._();

  static const baseUrl = 'https://ajarnthitasilo.github.io/ResilNet/';

  /// Docsify hash routes: `#/th/` and `#/en/`.
  static String urlForLocale(Locale? locale) {
    final code = locale?.languageCode.toLowerCase();
    if (code == 'en') return '$baseUrl#/en/';
    return '$baseUrl#/th/';
  }

  /// Opens the user guide externally. Returns false if launch failed.
  static Future<bool> openUserGuide(BuildContext context) async {
    final locale = Localizations.maybeLocaleOf(context);
    final uri = Uri.parse(urlForLocale(locale));
    return launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  static Future<void> openUserGuideOrSnack(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await openUserGuide(context);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.docsOpenFailed)),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../app/glass_overlays.dart';

/// ResilNet Docsify site (GitHub Pages). Open in the system browser only.
class DocsLinks {
  DocsLinks._();

  static const baseUrl = 'https://ajarnthitasilo.github.io/ResilNet/';

  /// Invite landing (static): `…/go/?t=b|p&d=…`
  static const inviteGoBase = '${baseUrl}go/';

  /// Absolute CDN root for firmware binaries (not a Docsify hash route).
  static const firmwareCdnBase = '${baseUrl}firmware/';

  static String _lang(Locale? locale) {
    final code = locale?.languageCode.toLowerCase();
    return code == 'en' ? 'en' : 'th';
  }

  /// Docsify hash routes: `#/th/` and `#/en/`.
  static String urlForLocale(Locale? locale) {
    return '$baseUrl#/${_lang(locale)}/';
  }

  /// Firmware downloads + version table on the docs site.
  static String firmwareGuideUrl(Locale? locale) {
    return '$baseUrl#/${_lang(locale)}/firmware/';
  }

  /// Flash / BLE OTA user guide (more detail than in-app dialogs).
  static String otaGuideUrl(Locale? locale) {
    return '$baseUrl#/${_lang(locale)}/guide/esp32-ota';
  }

  static Future<bool> _openExternal(String url) {
    return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  /// Opens the user guide externally. Returns false if launch failed.
  static Future<bool> openUserGuide(BuildContext context) async {
    final locale = Localizations.maybeLocaleOf(context);
    return _openExternal(urlForLocale(locale));
  }

  static Future<void> openUserGuideOrSnack(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await openUserGuide(context);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(l10n.docsOpenFailed)),
      );
    }
  }

  static Future<bool> openOtaGuide(BuildContext context) async {
    final locale = Localizations.maybeLocaleOf(context);
    return _openExternal(otaGuideUrl(locale));
  }

  static Future<void> openOtaGuideOrSnack(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await openOtaGuide(context);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(l10n.docsOpenFailed)),
      );
    }
  }

  static Future<bool> openFirmwareGuide(BuildContext context) async {
    final locale = Localizations.maybeLocaleOf(context);
    return _openExternal(firmwareGuideUrl(locale));
  }

  static Future<void> openFirmwareGuideOrSnack(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await openFirmwareGuide(context);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlassSnackBar(content: Text(l10n.docsOpenFailed)),
      );
    }
  }
}

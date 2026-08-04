/// Locales shipped with ResilNet (must match `app_*.arb` / gen-l10n).
library;

import 'package:flutter/material.dart';

/// Default: follow the device. Override only when the user picks a language.
class AppLocaleOption {
  const AppLocaleOption({
    required this.id,
    required this.locale,
    required this.nativeName,
    required this.englishName,
  });

  /// Stable id stored in prefs (`en`, `th`, `zh_TW`, …).
  final String id;
  final Locale locale;
  final String nativeName;
  final String englishName;

  String get menuLabel =>
      nativeName == englishName ? nativeName : '$nativeName ($englishName)';
}

const List<AppLocaleOption> kAppLocaleOptions = [
  AppLocaleOption(
    id: 'en',
    locale: Locale('en'),
    nativeName: 'English',
    englishName: 'English',
  ),
  AppLocaleOption(
    id: 'th',
    locale: Locale('th'),
    nativeName: 'ไทย',
    englishName: 'Thai',
  ),
  AppLocaleOption(
    id: 'zh',
    locale: Locale('zh'),
    nativeName: '简体中文',
    englishName: 'Chinese (Simplified)',
  ),
  AppLocaleOption(
    id: 'zh_TW',
    locale: Locale('zh', 'TW'),
    nativeName: '繁體中文',
    englishName: 'Chinese (Traditional)',
  ),
  AppLocaleOption(
    id: 'ja',
    locale: Locale('ja'),
    nativeName: '日本語',
    englishName: 'Japanese',
  ),
  AppLocaleOption(
    id: 'ko',
    locale: Locale('ko'),
    nativeName: '한국어',
    englishName: 'Korean',
  ),
  AppLocaleOption(
    id: 'id',
    locale: Locale('id'),
    nativeName: 'Bahasa Indonesia',
    englishName: 'Indonesian',
  ),
  AppLocaleOption(
    id: 'vi',
    locale: Locale('vi'),
    nativeName: 'Tiếng Việt',
    englishName: 'Vietnamese',
  ),
  AppLocaleOption(
    id: 'ms',
    locale: Locale('ms'),
    nativeName: 'Bahasa Melayu',
    englishName: 'Malay',
  ),
  AppLocaleOption(
    id: 'my',
    locale: Locale('my'),
    nativeName: 'မြန်မာ',
    englishName: 'Myanmar (Burmese)',
  ),
  AppLocaleOption(
    id: 'ksw',
    locale: Locale('ksw'),
    nativeName: 'ကညီ',
    englishName: 'Karen (S\'gaw)',
  ),
  AppLocaleOption(
    id: 'hi',
    locale: Locale('hi'),
    nativeName: 'हिन्दी',
    englishName: 'Hindi',
  ),
  AppLocaleOption(
    id: 'bn',
    locale: Locale('bn'),
    nativeName: 'বাংলা',
    englishName: 'Bengali',
  ),
  AppLocaleOption(
    id: 'ta',
    locale: Locale('ta'),
    nativeName: 'தமிழ்',
    englishName: 'Tamil',
  ),
  AppLocaleOption(
    id: 'te',
    locale: Locale('te'),
    nativeName: 'తెలుగు',
    englishName: 'Telugu',
  ),
  AppLocaleOption(
    id: 'mr',
    locale: Locale('mr'),
    nativeName: 'मराठी',
    englishName: 'Marathi',
  ),
  AppLocaleOption(
    id: 'gu',
    locale: Locale('gu'),
    nativeName: 'ગુજરાતી',
    englishName: 'Gujarati',
  ),
  AppLocaleOption(
    id: 'kn',
    locale: Locale('kn'),
    nativeName: 'ಕನ್ನಡ',
    englishName: 'Kannada',
  ),
  AppLocaleOption(
    id: 'ml',
    locale: Locale('ml'),
    nativeName: 'മലയാളം',
    englishName: 'Malayalam',
  ),
  AppLocaleOption(
    id: 'pa',
    locale: Locale('pa'),
    nativeName: 'ਪੰਜਾਬੀ',
    englishName: 'Punjabi',
  ),
  AppLocaleOption(
    id: 'ur',
    locale: Locale('ur'),
    nativeName: 'اردو',
    englishName: 'Urdu',
  ),
  AppLocaleOption(
    id: 'ar',
    locale: Locale('ar'),
    nativeName: 'العربية',
    englishName: 'Arabic',
  ),
  AppLocaleOption(
    id: 'fa',
    locale: Locale('fa'),
    nativeName: 'فارسی',
    englishName: 'Persian',
  ),
  AppLocaleOption(
    id: 'he',
    locale: Locale('he'),
    nativeName: 'עברית',
    englishName: 'Hebrew',
  ),
  AppLocaleOption(
    id: 'tr',
    locale: Locale('tr'),
    nativeName: 'Türkçe',
    englishName: 'Turkish',
  ),
  AppLocaleOption(
    id: 'ru',
    locale: Locale('ru'),
    nativeName: 'Русский',
    englishName: 'Russian',
  ),
  AppLocaleOption(
    id: 'uk',
    locale: Locale('uk'),
    nativeName: 'Українська',
    englishName: 'Ukrainian',
  ),
  AppLocaleOption(
    id: 'pl',
    locale: Locale('pl'),
    nativeName: 'Polski',
    englishName: 'Polish',
  ),
  AppLocaleOption(
    id: 'de',
    locale: Locale('de'),
    nativeName: 'Deutsch',
    englishName: 'German',
  ),
  AppLocaleOption(
    id: 'fr',
    locale: Locale('fr'),
    nativeName: 'Français',
    englishName: 'French',
  ),
  AppLocaleOption(
    id: 'es',
    locale: Locale('es'),
    nativeName: 'Español',
    englishName: 'Spanish',
  ),
  AppLocaleOption(
    id: 'pt',
    locale: Locale('pt'),
    nativeName: 'Português',
    englishName: 'Portuguese',
  ),
  AppLocaleOption(
    id: 'it',
    locale: Locale('it'),
    nativeName: 'Italiano',
    englishName: 'Italian',
  ),
  AppLocaleOption(
    id: 'nl',
    locale: Locale('nl'),
    nativeName: 'Nederlands',
    englishName: 'Dutch',
  ),
  AppLocaleOption(
    id: 'sv',
    locale: Locale('sv'),
    nativeName: 'Svenska',
    englishName: 'Swedish',
  ),
  AppLocaleOption(
    id: 'fi',
    locale: Locale('fi'),
    nativeName: 'Suomi',
    englishName: 'Finnish',
  ),
  AppLocaleOption(
    id: 'cs',
    locale: Locale('cs'),
    nativeName: 'Čeština',
    englishName: 'Czech',
  ),
];

Locale? localeFromOverrideId(String? id) {
  if (id == null || id.isEmpty || id == 'system') return null;
  for (final o in kAppLocaleOptions) {
    if (o.id == id) return o.locale;
  }
  // Legacy single codes.
  if (id.length == 2) return Locale(id);
  final parts = id.split('_');
  if (parts.length == 2) return Locale(parts[0], parts[1]);
  return Locale(id);
}

String? overrideIdFromLocale(Locale locale) {
  for (final o in kAppLocaleOptions) {
    if (o.locale == locale) return o.id;
    if (o.locale.languageCode == locale.languageCode &&
        (o.locale.countryCode ?? '') == (locale.countryCode ?? '')) {
      return o.id;
    }
  }
  return locale.countryCode == null || locale.countryCode!.isEmpty
      ? locale.languageCode
      : '${locale.languageCode}_${locale.countryCode}';
}

/// Pick best shipped locale for the device locale list.
Locale resolveDeviceLocale(List<Locale>? deviceLocales) {
  if (deviceLocales == null || deviceLocales.isEmpty) {
    return const Locale('en');
  }
  for (final device in deviceLocales) {
    // Exact language+country first (zh_TW).
    for (final o in kAppLocaleOptions) {
      if (o.locale.languageCode == device.languageCode &&
          (o.locale.countryCode ?? '') == (device.countryCode ?? '') &&
          (o.locale.countryCode != null && o.locale.countryCode!.isNotEmpty)) {
        return o.locale;
      }
    }
    // language-only match (skip options that require a country when device
    // has a different country — still allow plain zh for zh_CN etc.).
    for (final o in kAppLocaleOptions) {
      if (o.locale.languageCode == device.languageCode &&
          (o.locale.countryCode == null || o.locale.countryCode!.isEmpty)) {
        return o.locale;
      }
    }
    // Fallback: any same language (e.g. device zh_HK → zh_TW or zh).
    for (final o in kAppLocaleOptions) {
      if (o.locale.languageCode == device.languageCode) {
        return o.locale;
      }
    }
  }
  return const Locale('en');
}

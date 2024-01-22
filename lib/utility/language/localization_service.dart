import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_strings.dart';
import 'en_DE.dart';
import 'en_IT.dart';
import 'en_JA.dart';
import 'en_US.dart';
import 'en_ZH.dart';
import 'en_es.dart';
import 'en_fr.dart';
// Import the missing language files

class LocalizationService extends Translations {
  static final locale = Locale('en', 'US');
  static final fallBackLocale = Locale('en', 'US');

  static final langs = [
    AppString.strEnglish,
    AppString.strFrench,
    AppString.strSpanish,
    AppString.strItalian,
    AppString.strGerman,
    AppString.strJapanese,
    AppString.strChinese,
    // Add missing language names
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
    Locale('es', 'ES'),
    Locale('it', 'IT'),
    Locale('de', 'DE'),
    Locale('ja', 'JA'),
    Locale('zh', 'CN'),
    // Add missing locales
  ];

  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'fr_FR': enFR,
    'es_ES': enES,
    'it_IT': enIT,
    'de_DE': enDE,
    'ja_JA': enJA,
    'zh_CN': enZH,
    // Add missing language keys
  };

  void changeLocale(String lang) {
    final locale = getLocalFromLanguage(lang);
    print("Locale $locale");
    Get.updateLocale(locale!);
  }

  Locale? getLocalFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}

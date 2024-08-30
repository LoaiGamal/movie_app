// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "top_rated": "الأعلى تقييم",
    "upcoming": "القادم",
    "now_playing": "يعرض الآن",
    "overview": "نظرة عامة:",
    "original_language": "اللغة الرسمية:",
    "language": "اللغة",
    "release_date": "تاريخ الإصدار:",
    "settings": "الإعدادات",
    "change_language": "تغيير اللغة"
  };
  static const Map<String, dynamic> en = {
    "top_rated": "Top Rated",
    "upcoming": "Upcoming",
    "now_playing": "Now Playing",
    "overview": "Overview:",
    "original_language": "Original Language:",
    "language": "Language",
    "release_date": "Release Date:",
    "settings": "Settings",
    "change_language": "Change Language"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}

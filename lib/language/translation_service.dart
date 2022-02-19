import 'package:financial_apps_prgi/language/english.dart';
import 'package:financial_apps_prgi/language/mandarin_simplified.dart';
import 'package:financial_apps_prgi/language/mandarin_traditional.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TranslationService extends Translations {

  static final fallbackLocale = Locale('en', 'US');
  static final appData = GetStorage();

  @override
  Map<String, Map<String, String>> get keys => {
    
        'zh_Hans': zh_Hans,
        'en_US': en_US,
        'zh_HK': zh_HK,
  };
}
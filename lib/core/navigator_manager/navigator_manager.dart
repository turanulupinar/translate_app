import 'package:flutter/material.dart';
import 'package:translate_app/core/data/shared_data.dart';
import 'package:translate_app/pages/homepage/homepage.dart';
import 'package:translate_app/pages/selected_language/selected_language.dart';
import 'package:translate_app/pages/splash_screen_page/splash_screen_page.dart';
import 'package:translate_app/util/test_page.dart';

import '../../pages/history_page/history_page.dart';
import '../../pages/privacy_policy_page/privacy_policy.dart';

import '../../pages/settingpage/setting_page.dart';

class NavigatorManager {
  bool? firstEnterMobileAplication;
// classın constructor yapısı =>
  NavigatorManager() {
    isfirstAplication();
  }

  Future<bool> isfirstAplication() async {
    firstEnterMobileAplication =
        await SharedManagerData().getSelectedLAnguageScreen() ?? false;
    return firstEnterMobileAplication ?? false;
  }

  final navigatorRoad = {
    "/": (context) => const SplashScreenPage(),
    "/homepage": (context) => FutureBuilder<bool>(
          future: NavigatorManager().isfirstAplication(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data == true) {
              return const SelectedLanguagePage();
            }
            return const HomePage();
          },
        ),
    "/searchpage": (context) => const HistoryPage(),
    "/selecetedLanguage": (context) => const SelectedLanguagePage(),
    "/testpage": (context) => const TestPage(),
    "/settingpage": (context) => const SettingPage(),
    "/privacypolicy": (context) => const PrivacyPolicy()
  };
}

enum NavigatorEnum {
  homepage,
  searchpage,
  selecetedLanguage,
  testpage,
  settingpage,
  privacypolicy
}

extension NavigatorExtension on NavigatorEnum {
  String get withParaf => "/$name";
}

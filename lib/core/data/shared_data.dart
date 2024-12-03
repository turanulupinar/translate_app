import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/shared_constant.dart';

class SharedManagerData {
  Future<SharedPreferences> initshared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  // karşılama sayfasındaki çıkan Türkçe mi ingilizce mi butonu için
  Future<bool> setLanguagedata(String value) async {
    final prefs = await initshared();
    return await prefs.setString(
        SharedPreferancesConstant.selectedLanguageKey, value);
  }

  Future getLanguageData() async {
    final prefs = await initshared();
    return prefs.getString(SharedPreferancesConstant.selectedLanguageKey);
  }

  // dil seçim kısmında, uygulama ilk açıldığında o sayfa çıkar daha sonra uygulamayı tekrar açtığında bu sayfa açılmaz

  Future<bool> setSelecetedLanguageScreen(bool value) async {
    final prefs = await initshared();
    return await prefs.setBool(
        SharedPreferancesConstant.firstAplicationEnter, value);
  }

  Future getSelectedLAnguageScreen() async {
    final prefs = await initshared();
    return prefs.getBool(SharedPreferancesConstant.firstAplicationEnter);
  }

  // selected language sayfasında seçilen dil translate sayfasında default olacak.
  Future setDefaultLanguage(String value) async {
    final prefs = await initshared();
    return prefs.setString(
        SharedPreferancesConstant.selectTranslatefirstItem, value);
  }

  Future getDefaultLanguage(String value) async {
    final prefs = await initshared();
    return prefs.getString(SharedPreferancesConstant.selectTranslatefirstItem);
  }

  // kaydedilenlerin sadece o dil ve hangi dilden çeviri yapıldığı ayrıca çevirilerin tutulduğu bir kartta kayddet
  Future<bool> setSaveLanguageCard(List<String> value) async {
    final prefs = await initshared();
    return await prefs.setStringList(
        SharedPreferancesConstant.saveLanguageCard, value);
  }

  Future<List<String?>?> getSaveLanguageCard() async {
    final prefs = await initshared();
    return prefs.getStringList(SharedPreferancesConstant.saveLanguageCard);
  }

// kaydedilen dataları temizleme şşlemi (starlanan kartlar)
  Future<void> clearSharedPreferences(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(value);
    log("kaydedilmiş sdatalar temizlendi");
  }

  Future<void> clearForIndex(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    log("kaydedilmiş sdatalar temizlendi");
  }

  // sadece çeviri yapılan kelime ve cümelelrin tutulduğu bir liste metosu
  Future<bool> setHistorySearch(List<String> value) async {
    final prefs = await initshared();
    return await prefs.setStringList(
        SharedPreferancesConstant.historySearchKey, value);
  }

  Future<List<String>?> getHistorySearch() async {
    final prefs = await initshared();
    return prefs.getStringList(SharedPreferancesConstant.historySearchKey);
  }
}

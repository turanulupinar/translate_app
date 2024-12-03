import 'package:flutter/material.dart';
import 'package:translate_app/core/navigator_manager/navigator_manager.dart';
import 'package:translate_app/util/text_to_easy_translate.dart';

final drawerView = {
  "translateImage": "assets/image/translate.png",
  "drawer_list": [
    {
      "icon": Icons.settings,
      "title": "ayarlar".transConvert,
      "subtitle": "ayarlar_dec".transConvert,
      "route": NavigatorEnum.settingpage.withParaf
    },
    {
      "icon": Icons.g_translate,
      "title": "dil_sec".transConvert,
      "subtitle": "dil_dec".transConvert,
      "route": NavigatorEnum.selecetedLanguage.withParaf
    },
    {
      "icon": Icons.share_outlined,
      "title": "paylas".transConvert,
      "subtitle": "sosyalmedyadapaylas".transConvert,
      "route": NavigatorEnum.homepage.withParaf
    },
    {
      "icon": Icons.privacy_tip_outlined,
      "title": "gizlilikpol".transConvert,
      "subtitle": "gizlilikpol_dec".transConvert,
      "route": NavigatorEnum.privacypolicy.withParaf
    },
    {
      "icon": Icons.comment_sharp,
      "title": "yorumlar".transConvert,
      "subtitle": "yorumlar_dec".transConvert,
      "route": NavigatorEnum.homepage.withParaf
    }
  ]
};

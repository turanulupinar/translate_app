import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final drawerView = {
  "translateImage": "assets/image/translate.png",
  "drawer_list": [
    {
      "icon": Icons.settings,
      "title": "ayarlar".tr(),
      "subtitle": "ayarlar_dec".tr(),
      "route": "/settingpage"
    },
    {
      "icon": Icons.g_translate,
      "title": "dil_sec".tr(),
      "subtitle": "dil_dec".tr(),
      "route": "/selecetedLanguage"
    },
    {
      "icon": Icons.share_outlined,
      "title": "paylas".tr(),
      "subtitle": "sosyalmedyadapaylas".tr()
    },
    {
      "icon": Icons.privacy_tip_outlined,
      "title": "gizlilikpol".tr(),
      "subtitle": "gizlilikpol_dec".tr(),
      "route": "/privacypolicy"
    },
    {
      "icon": Icons.comment_sharp,
      "title": "yorumlar".tr(),
      "subtitle": "yorumlar_dec".tr()
    }
  ]
};

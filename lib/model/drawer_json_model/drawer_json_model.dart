import 'package:flutter/material.dart';

class DrawerViewModel {
  String? translateImage;

  List<DrawerList>? drawerList;

  DrawerViewModel({this.translateImage, this.drawerList});

  DrawerViewModel.fromJson(Map<String, dynamic> json) {
    translateImage = json['translateImage'];

    if (json['drawer_list'] != null) {
      drawerList = <DrawerList>[];
      json['drawer_list'].forEach((v) {
        drawerList!.add(DrawerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['translateImage'] = translateImage;

    if (drawerList != null) {
      data['drawer_list'] = drawerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrawerList {
  IconData? icon;
  String? title;
  String? subtitle;
  String? route;

  DrawerList({this.icon, this.title, this.subtitle, this.route});

  DrawerList.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    title = json['title'];
    subtitle = json['subtitle'];
    route = json["route"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['icon'] = icon;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data["route"] = route;
    return data;
  }
}

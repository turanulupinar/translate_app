import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/navigator_manager/navigator_manager.dart';

class ScreenModelView {
  Future durationSec(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, NavigatorEnum.homepage.withParaf);
    });
  }
}

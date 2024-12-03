import 'dart:async';

import 'package:flutter/material.dart';

import 'package:translate_app/util/navigator_extension.dart';

class ScreenModelView {
  Future durationSec(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, NavigatorEnum.homepage.withParaf);
    });
  }
}

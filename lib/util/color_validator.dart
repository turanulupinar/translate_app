import 'package:flutter/material.dart';

enum ColorValE { darkblue, lightblack, lightblue, softgrey }

extension ColorExtension on ColorValE {
  Color get color {
    switch (this) {
      case ColorValE.darkblue:
        return const Color(0xff144C52);
      case ColorValE.lightblack:
        return const Color(0xff363636);
      case ColorValE.lightblue:
        return const Color(0xffADCCC7);
      case ColorValE.softgrey:
        return const Color(0xffFAF7F2);
      default:
        return Colors.red;
    }
  }
}

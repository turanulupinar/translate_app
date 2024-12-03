import 'package:flutter/material.dart';

class ColorValidator {
  static ColorValidator? _instance;
  static ColorValidator get instance => _instance ??= ColorValidator._();
  ColorValidator._();
  factory ColorValidator() => _instance ??= ColorValidator._();

  Color colValidator(String colorName) {
    switch (colorName) {
      case "orange":
        return const Color(0xff144C52);
      case "darkblue":
        return const Color(0xff363636);
      case "lightblue":
        return const Color(0xffADCCC7);
      case "grey":
        return const Color(0xffFAF7F2);
      default:
        return Colors.red;
    }
  }
}

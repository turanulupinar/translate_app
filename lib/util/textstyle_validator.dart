import 'package:flutter/material.dart';

class TextStyleValidator {
  static TextStyleValidator? _instance;
  static TextStyleValidator get instance =>
      _instance ??= TextStyleValidator._();
  TextStyleValidator._();
  factory TextStyleValidator() => _instance ??= TextStyleValidator._();

  TextStyle getStyleValidator(
      {required String fontName, required double fontsize}) {
    switch (fontName) {
      case "Bold":
        return TextStyle(fontFamily: "MostBol", fontSize: fontsize);
      case "Medium":
        return TextStyle(fontFamily: "MostMed", fontSize: fontsize);
      case "Regular":
        return TextStyle(fontFamily: "MostReg", fontSize: fontsize);
      default:
        return const TextStyle(
          fontSize: 25,
        );
    }
  }
}

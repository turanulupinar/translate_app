import 'package:flutter/material.dart';
import 'package:translate_app/util/text_to_easy_translate.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.data, this.style});
  final String data;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(data.transConvert, style: style);
  }
}

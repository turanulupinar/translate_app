import 'package:flutter/material.dart';
import 'package:translate_app/core/widget/customtextwidget.dart';

import 'package:translate_app/util/textstyle_validator.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.color,
      required this.title,
      required this.onPressed});
  final String title;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 30,
        width: 200,
        child: ElevatedButton(
            style:
                ElevatedButton.styleFrom(elevation: 5, backgroundColor: color),
            onPressed: onPressed,
            child: CustomTextWidget(
                data: title,
                style: customTextStyle("Medium", 16)
                    ?.copyWith(color: Colors.white))),
      ),
    );
  }
}

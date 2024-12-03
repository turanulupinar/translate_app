import 'package:flutter/material.dart';
import 'package:translate_app/util/textstyle_validator.dart';

import 'splash_screen_model_view.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  ScreenModelView screenTime = ScreenModelView();
  @override
  void initState() {
    screenTime.durationSec(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/translate.png"),
                ),
              ),
            ),
            Text(
              "Language Translate",
              style: TextStyleValidator()
                  .getStyleValidator(fontName: "black", fontsize: 28),
            )
          ],
        ),
      ),
    );
  }
}

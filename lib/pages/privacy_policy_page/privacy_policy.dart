import 'package:flutter/material.dart';
import 'package:translate_app/core/widget/custom_elevated_button.dart';
import 'package:translate_app/pages/privacy_policy_page/privacy_policy_model_view.dart';
import 'package:translate_app/util/color_validator.dart';
import 'package:translate_app/util/textstyle_validator.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    DummyPrivacyPolicy privacyModel =
        DummyPrivacyPolicy.fromJson(dummyPrivacyPolicy);

    return Scaffold(
      appBar: AppBar(
        title: Text(privacyModel.title.toString()),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                privacyModel.body.toString(),
                style: customTextStyle("Regular", 14),
              ),
            ),
          ),
          CustomElevatedButton(
              color: ColorValE.darkblue.color,
              title: "kabul_ediyorum",
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, privacyModel.route.toString());
              })
        ],
      ),
    );
  }
}

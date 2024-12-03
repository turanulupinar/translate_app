import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/core/data/shared_data.dart';
import 'package:translate_app/core/widget/customtextwidget.dart';

import 'package:translate_app/model/language_model.dart';
import 'package:translate_app/pages/selected_language/selected_language_modelview.dart';

import 'package:translate_app/util/color_validator.dart';

import 'package:translate_app/util/textstyle_validator.dart';

import '../../core/navigator_manager/navigator_manager.dart';
import '../../core/widget/custom_divider_wiget.dart';
import '../../core/widget/custom_elevated_button.dart';
import '../../core/widget/custom_switch_widget.dart';

class SelectedLanguagePage extends StatefulWidget {
  const SelectedLanguagePage({super.key});

  @override
  State<SelectedLanguagePage> createState() => _SelectedLanguagePageState();
}

class _SelectedLanguagePageState extends State<SelectedLanguagePage> {
  TextStyleValidator styleval = TextStyleValidator();

  AllLanguageModel selectedlanguage =
      AllLanguageModel(code: "tr", language: "Turkish"); //
  String? selectedOption;
  bool offlineMode = false;
  List<AllLanguageModel>? model;

  @override
  void initState() {
    initdata();
    super.initState();
  }

  initdata() async {
    model = await SelectedLanguageModelview().getdatafunc();
    selectedOption = await SharedManagerData().getLanguageData() ?? "tr";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: CustomElevatedButton(
          onPressed: () {
            SharedManagerData().setSelecetedLanguageScreen(false);
            Navigator.pushReplacementNamed(
                context, NavigatorEnum.homepage.withParaf);
          },
          color: ColorValE.darkblue.color,
          title: "başla"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: CupertinoSlidingSegmentedControl<String>(
                padding: const EdgeInsets.all(5),
                backgroundColor: ColorValE.softgrey.color,
                thumbColor: ColorValE.lightblue.color,
                groupValue: selectedOption,
                children: const {
                  "tr": CustomTextWidget(data: "türkce"),
                  "en": CustomTextWidget(data: "ingilizce"),
                },
                onValueChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                    SharedManagerData().setLanguagedata(selectedOption ?? "tr");
                    context.setLocale(Locale(selectedOption ?? "tr"));
                  });
                },
              ),
            ),
          ),
          ListTile(
              title: CustomTextWidget(
                  data: "cevrimici_mod", style: customTextStyle("Bold", 14)),
              leading: const Icon(Icons.wifi_channel_sharp),
              trailing: customSwitchWiget(
                  activeColor: ColorValE.darkblue.color,
                  isOff: offlineMode,
                  onchanged: (val) {
                    setState(() {
                      offlineMode != offlineMode;

                      offlineMode = val;
                    });
                  }),
              subtitle: CustomTextWidget(
                  data: "cevrimici_mod_mesaji",
                  style: customTextStyle("Medium", 14))),
          CustomDividerWidget(
            dividerColor: ColorValE.lightblack.color,
          ),
          CustomTextWidget(
              data: "varsayilan_dili_secin",
              style: customTextStyle("Bold", 16)),
          SizedBox(
            height: 500,
            width: 450,
            child: ListView.builder(
              itemCount: model?.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: Radio<AllLanguageModel?>(
                      activeColor: ColorValE.darkblue.color,
                      value: model?[index],
                      groupValue: selectedlanguage,
                      onChanged: (val) {
                        setState(() {
                          selectedlanguage = val ?? AllLanguageModel();
                        });
                      }),
                  title: Text(model?[index].language ?? "",
                      style: customTextStyle("Medium", 16)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

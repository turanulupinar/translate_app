import 'package:flutter/material.dart';
import 'package:translate_app/core/constant/shared_constant.dart';
import 'package:translate_app/core/data/shared_data.dart';
import 'package:translate_app/core/widget/custom_elevated_button.dart';
import 'package:translate_app/core/widget/customtextwidget.dart';

import 'package:translate_app/util/color_validator.dart';
import 'package:translate_app/util/first_name_uppercase.dart';

import 'package:translate_app/util/textstyle_validator.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  SharedManagerData sharedManager = SharedManagerData();
  List<String>? historySearchList = [];

  @override
  void initState() {
    initHistorySearchData();
    super.initState();
  }

  initHistorySearchData() async {
    historySearchList = await sharedManager.getHistorySearch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          historySearchList == null
              ? Center(
                  child: CustomTextWidget(
                      data: "aramayapilmadi",
                      style: customTextStyle("Medium", 18)),
                )
              : CustomElevatedButton(
                  color: ColorValE.darkblue.color,
                  title: "listeyitemizle",
                  onPressed: () {
                    SharedManagerData().clearSharedPreferences(
                        SharedPreferancesConstant.historySearchKey);
                  }),
          SizedBox(
            height: 500,
            width: 450,
            child: ListView.builder(
              itemCount: historySearchList?.length ?? 5,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onLongPress: () {
                    // SharedManagerData()
                    //     .clearForIndex(historySearchList?[index] ?? "");
                    setState(() {});
                  },
                  child: ListTile(
                    title: Text(historySearchList == []
                        ? ""
                        : firstNameUpperCase(historySearchList?[index] ?? "") ??
                            ""),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

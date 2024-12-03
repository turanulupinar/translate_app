import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:translate_app/core/data/shared_data.dart';
import 'package:translate_app/model/post_translate_model.dart';
import 'package:translate_app/util/color_validator.dart';
import 'package:translate_app/util/textstyle_validator.dart';

class StarSavePage extends StatefulWidget {
  const StarSavePage({super.key});

  @override
  State<StarSavePage> createState() => _StarSavePageState();
}

class _StarSavePageState extends State<StarSavePage> {
  List<PostTranslateModel>? saveStarList;

  @override
  void initState() {
    readUser();
    super.initState();
  }

  Future readUser() async {
    List<String?>? savedData = await SharedManagerData().getSaveLanguageCard();

    saveStarList = savedData
            ?.map((e) => PostTranslateModel.fromJson(jsonDecode(e ?? "")))
            .toList() ??
        [];

    if (savedData == null) {
      log("veri yüklenemedi");
    } else {
      log("shareddan gelen data: $savedData");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorValE.lightblue.color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1000,
              width: 450,
              child: ListView.builder(
                itemCount: saveStarList?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      width: 450,
                      decoration: BoxDecoration(
                          color: ColorValE.darkblue.color,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            saveStarList?[index]
                                    .jsonTranslate
                                    ?.title
                                    .toString() ??
                                "from metni",
                            style: customTextStyle("Medium", 18)
                                ?.copyWith(color: Colors.white),
                          ),
                          subtitle: Text(
                            saveStarList?[index]
                                    .jsonTranslate
                                    ?.author
                                    .toString() ??
                                "ing karşılığı yok",
                            style: customTextStyle("Regular", 14)
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Todo: gelen kelimer kullanıcı isteğine göre yıldızlanıp başka bir sayfada gösterilecektir. 
// senkron sorunun?? dan dolayı  kaydetme işlemi ger.elşmiyor
import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:translate_app/core/data/shared_data.dart';
import 'package:translate_app/core/widget/custom_elevated_button.dart';
import 'package:translate_app/core/widget/loading_widget.dart';
import 'package:translate_app/model/language_model.dart';

import 'package:translate_app/model/post_translate_model.dart';
import 'package:translate_app/pages/selected_language/selected_language_modelview.dart';
import 'package:translate_app/util/color_validator.dart';
import 'package:translate_app/util/textstyle_validator.dart';

import '../../core/widget/custom_dropdown_widget.dart';

import 'translate_model_view.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  TextEditingController languageFromController = TextEditingController();

  List<AllLanguageModel>?
      languageLists; // servisten gelen  diller (bütün diller var)
  AllLanguageModel? selectedFromLanguage; // çeviri yapılacak olan dil
  AllLanguageModel? selectedToLanguage; // çevrilen dil
  List<PostTranslateModel>? saveStarList =
      []; //shared için yıldızlanan kemlimerin tutlduğu liste
  SharedManagerData sharedManager = SharedManagerData();
  List<String> historySearchList =
      []; // yapılan aramalar için shared ile tutulan listeler
  SharedManagerData sharedmanager = SharedManagerData();

  PostTranslateModel? translatedModel;
  bool? isLoading = false;

  getSaveStarWord() async {
    List<String>? encodemodel =
        saveStarList?.map((e) => jsonEncode(e)).toList();
    final succes = SharedManagerData().setSaveLanguageCard(encodemodel ?? []);

    if (await succes) {
      log("veriler kaydedildi  $encodemodel");
    } else {
      log("veriler kaydedilmedi");
    }
  }

  @override
  void initState() {
    allLanguageInitData();
    readUser();
    super.initState();
  }

  allLanguageInitData() async {
    languageLists = await SelectedLanguageModelview().getdatafunc();
    setState(() {});
  }

  /// sil

  Future readUser() async {
    List<String?>? savedData = await SharedManagerData().getSaveLanguageCard();

    saveStarList = savedData
            ?.map((e) => PostTranslateModel.fromJson(jsonDecode(e ?? "")))
            .toList() ??
        [];

    if (savedData == null) {
      log("sharedam veri bulunamadı!");
    } else {
      log("sharedden gelen veri: $savedData");
    }

    setState(() {});
  }

  @override
  void dispose() {
    languageFromController.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 20, top: 20),
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 0.5,
                        offset: Offset(5, 5),
                      )
                    ],
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    color: ColorValidator().colValidator("grey"),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Kaynak dil seçimi
                      Expanded(
                        child: CustomDropDownWidget<AllLanguageModel>(
                          items: languageLists ?? [],
                          selectedValue: selectedFromLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedFromLanguage = value;
                            });
                          },
                          itembuild: (item) => item.language ?? "",
                          hintText: "dil_sec".tr(),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.compare_arrows),
                      const SizedBox(width: 8),
                      // Hedef dil seçimi
                      Expanded(
                        child: CustomDropDownWidget<AllLanguageModel>(
                          items: languageLists?.where((lang) {
                                return lang.code != selectedFromLanguage?.code;
                              }).toList() ??
                              [],
                          selectedValue: selectedToLanguage,
                          onChanged: (value) {
                            setState(() {
                              selectedToLanguage = value;
                            });
                          },
                          itembuild: (item) => item.language ?? "",
                          hintText: "dil_sec".tr(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: Stack(
                  children: [
                    TextField(
                      style: TextStyleValidator()
                          .getStyleValidator(fontName: "Regular", fontsize: 18),
                      maxLength: 200,
                      maxLines: 7,
                      controller: languageFromController,
                      decoration: InputDecoration(
                          hintText: "cevrilecek_metin".tr(),
                          hintStyle: TextStyleValidator().getStyleValidator(
                              fontName: "Regular", fontsize: 18),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 150, right: 10, left: 150, bottom: 10),
                      child: CustomElevatedButton(
                          onPressed: () async {
                            final model = PostTranslateModel(
                              jsonTranslate: JsonTranslate(
                                extra: Extra(
                                    commentCounts: 10,
                                    image: "hello.png",
                                    lastComment: LastComment(
                                        author: "not be translated",
                                        shortText: "asdad")),
                                author: "asdfasf",
                                rate: 4.56,
                                title: languageFromController.text,
                              ),
                              from: selectedFromLanguage?.code ?? "auto",
                              to: selectedToLanguage?.code ?? "en",
                              commonProtectedPaths: ["image"],
                              protectedPaths: ["extra.last_comment.author"],
                            );

                            try {
                              setState(() {});
                              isLoading = true;
                              translatedModel = await TranslateModelView()
                                  .postTranslateData(model);
                              List<String>? historySearchList =
                                  await sharedManager.getHistorySearch();
                              historySearchList
                                  ?.add(languageFromController.text);
                              await SharedManagerData()
                                  .setHistorySearch(historySearchList ?? []);

                              isLoading = false;
                              if (translatedModel != null) {
                                setState(() {});
                                log("gelen çeviri: ${translatedModel?.jsonTranslate?.title}");

                                // keyboardı kapatan func.
                                FocusScope.of(context).unfocus();
                              } else {
                                log("çeviri başarısız.");
                              }
                            } catch (e) {
                              log("Hata  $e");
                            }
                          },
                          color: ColorValidator().colValidator("orange"),
                          title: "cevir".tr()),
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 250,
                  width: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: ColorValidator().colValidator("lightblue"),
                        width: 3),
                  ),
                  child: isLoading == false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  translatedModel?.jsonTranslate?.title
                                          .toString() ??
                                      "",
                                  style: TextStyleValidator()
                                      .getStyleValidator(
                                          fontName: "Regular", fontsize: 18)
                                      .copyWith(
                                          color: ColorValidator()
                                              .colValidator("darkblue")),
                                ))
                          ],
                        )
                      : Center(
                          child: LoadingWidget().spinkit,
                        ),
                ),
                translatedModel?.jsonTranslate?.title == null
                    ? const SizedBox.shrink()
                    : Positioned(
                        bottom: 20,
                        top: 200,
                        right: 10,
                        left: 250,
                        child: IconButton(
                            onPressed: () async {
                              saveStarList?.add(PostTranslateModel(
                                from: selectedFromLanguage?.code ?? "auto",
                                to: selectedToLanguage?.code ?? "en",
                                jsonTranslate: JsonTranslate(
                                  title: translatedModel?.jsonTranslate?.title,
                                  author: languageFromController.text,
                                ),
                              ));

                              await getSaveStarWord();
                            },
                            icon: const Icon(Icons.star_border)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

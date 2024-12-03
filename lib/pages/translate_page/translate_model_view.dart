import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:translate_app/core/constant/service_constant.dart';
import 'package:translate_app/model/post_translate_model.dart';
import 'package:translate_app/service/language_service.dart';

class TranslateModelView {
//   Future postTranslateData(PostTranslateModel body) async {
//     PostTranslateModel? model;
//     Response response = await NetworkTranslateService()
//         .postData(ServiceConstant.postTranslate, body);
//     if (response.statusCode == 200) {
//       final data = response.data;
//       model = PostTranslateModel.fromJson(data);
//       return model;
//     }
//   }
// }
  ///-------------

  // Future<PostTranslateModel?>? postTranslateData(
  //     PostTranslateModel body) async {
  //   PostTranslateModel model;
  //   try {
  //     Response response = await NetworkTranslateService()
  //         .postData(ServiceConstant.postTranslate, body);
  //     if (response.statusCode == 200 && response.data != null) {
  //       final data = await response.data;
  //       model = PostTranslateModel.fromJson(data);
  //       return model;
  //     } else {
  //       log("Hata: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     log("TranslateModelView hatası: $e");
  //   }
  //   return null;
  // }

  // - - -- - - -
  Future<PostTranslateModel?> postTranslateData(PostTranslateModel body) async {
    try {
      Response response = await NetworkTranslateService()
          .postData(ServiceConstant.postTranslate, body);

      log("servisten gelen yanıt: ${response.data}");

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;
        // yanıtın içeriği!!!!!!!!!!!!!!!!!
        log("serviten gelen data: $data");
        return PostTranslateModel.fromJson(data);
      } else {
        log("hata:  -- --  ${response.data}");
      }
    } catch (e) {
      //eleman
      log("translateModelviewdan gelen hata:  $e");
    }
    return null;
  }
}

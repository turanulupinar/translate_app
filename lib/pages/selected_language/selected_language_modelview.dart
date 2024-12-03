import 'package:dio/dio.dart';

import '../../core/constant/service_constant.dart';
import '../../model/language_model.dart';
import '../../service/language_service.dart';

class SelectedLanguageModelview {
  Future getdatafunc() async {
    List<AllLanguageModel>? model;
    Response response = await NetworkTranslateService()
        .getData(ServiceConstant.allLanguagePath);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data;

      // serviste gelen cevapları ayıklamayı modelviewdan yaprask daha iyi olur.

      List<dynamic> filteredLanguage = data.where((e) {
        return (e['language'] != "Kurdish") &&
            (e['language'] != "Kurdish (Sorani)");
      }).toList();

      model = filteredLanguage
          .map((e) => AllLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return model;
    }
  }
}

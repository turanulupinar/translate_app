import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:translate_app/core/constant/service_constant.dart';
import 'package:translate_app/model/post_translate_model.dart';
import 'package:translate_app/util/dio_log.dart';

class NetworkTranslateService {
  late final Dio dio;

  BaseOptions baseop = BaseOptions(baseUrl: ServiceConstant.baseurl, headers: {
    "x-rapidapi-key": "6e10475b8fmsh1b2b930858b532ap1a2794jsnb2cea4da31db",
    "Content-Type": "application/json",
    "x-rapidapi-host": "google-translate113.p.rapidapi.com"
  });

  NetworkTranslateService() {
    dio = Dio(baseop);
  }

  Future getData(String path) async {
    Response response = await dio.get(path);
    return response;
  }

  // Future postData(String path, PostTranslateModel body) async {
  //   final Response response = await dio.post(path, data: body);
  //   dioLogger(dio);

  //   return response;
  // }

  Future postData(String path, PostTranslateModel body) async {
    try {
      final Response response = await dio.post(path, data: body);
      dioLogger(dio);
      return response;
    } catch (e) {
      log("hata : $e");
      rethrow;
    }
  }
}

import 'package:dio/dio.dart';

void dioLogger(Dio dio) {
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );
}

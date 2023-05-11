import 'package:dio/dio.dart';

Dio dio() {
  var dio = Dio(
    BaseOptions(
      baseUrl: 'URL',
      headers: {
        'accept': 'application/json',
        'content-type': 'application/json'
      },
      responseType: ResponseType.json,
    ),
  );

  return dio;
}

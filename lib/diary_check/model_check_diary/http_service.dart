import 'package:dio/dio.dart';
import 'package:doan_flutter/diary_check/model_check_diary/url_app.dart';

class HttpService {
  final Dio _dio = Dio();

  Future<Response?> request(String url, {APIMethod method = APIMethod.Get}) {
    try {
      switch (method) {
        case APIMethod.Get:
          return _dio.get(url);
        case APIMethod.Put:
          return _dio.put(url);
        case APIMethod.Delete:
          return _dio.delete(url);
        default:
          return _dio.post(url);
      }
    } catch (e) {
      rethrow;
    }
  }
}

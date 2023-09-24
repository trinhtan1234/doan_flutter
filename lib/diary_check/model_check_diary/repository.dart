import 'package:doan_flutter/diary_check/model_check_diary/http_service.dart';
import 'package:doan_flutter/diary_check/model_check_diary/url_app.dart';

class CheckDiaryRepository {
  final HttpService _service = HttpService();
  Future getCheckDiary() {
    return _service.request(UrlApp.getCheckDiary);
  }
}

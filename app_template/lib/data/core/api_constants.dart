import 'package:flutter/foundation.dart';

class ApiConstants {
  ApiConstants._();
  static String get baseUrl => domainUrl + slugUrl;
  static String get domainUrl =>
      kDebugMode ? "http://127.0.0.1:8000" : "http://143.244.138.169";
  static const String slugUrl = "/folldy_presentation/api/";
  static const String getData = "get_data";
}

getImageUrl(String url) {
  return ApiConstants.domainUrl + url;
}

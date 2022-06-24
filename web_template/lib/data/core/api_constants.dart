import 'package:flutter/foundation.dart';

class ApiConstants {
  ApiConstants._();
  // local
  static String get domainUrl =>
      kDebugMode ? "http://localhost" : "http://domainUrlHere";

  static String get baseUrl =>
      kDebugMode ? "$domainUrl:8000$slugUrl" : domainUrl + slugUrl;
  static const String slugUrl = "/slug_url_here";
}

getImageUrl(String url) {
  return ApiConstants.domainUrl + url;
}


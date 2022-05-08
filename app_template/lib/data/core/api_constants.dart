import 'package:flutter/foundation.dart';

class ApiConstants {
  ApiConstants._();
  // local
  static String get domainUrl =>
      kDebugMode ? "http://localhost" : "http://143.244.138.169";

  static String get baseUrl =>
      kDebugMode ? "$domainUrl:8000$slugUrl" : domainUrl + slugUrl;

  static String presentationEditorUrl =
      kDebugMode ? "$domainUrl:8002/" : "$domainUrl/presentation/";

  static String presentationViewerUrl =
      kDebugMode ? "$domainUrl:8003/" : "$domainUrl/presentation_view/";
  static const String slugUrl = "/folldy_admin/api/";
}

getImageUrl(String url) {
  return ApiConstants.domainUrl + url;
}

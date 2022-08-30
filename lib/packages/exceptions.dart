import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

class UnAuthorizedException implements Exception {
  final String message;
  UnAuthorizedException(this.message);
  @override
  String toString() => message;
}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);
  @override
  String toString() => message;
}

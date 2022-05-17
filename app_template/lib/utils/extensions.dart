import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

extension AppErrorTypeExtension on AppErrorType {
  String get message {
    switch (this) {
      case AppErrorType.api:
        return 'Api Error';
      case AppErrorType.network:
        return 'Network Error';
      case AppErrorType.database:
        return 'Database Error';
      case AppErrorType.unauthorised:
        return 'Unauthorised Error';
      case AppErrorType.sessionDenied:
        return 'Session Denied Error';
    }
  }

  String get svgImage {
    switch (this) {
      case AppErrorType.api:
        return 'assets/svgs/api_error.svg';
      case AppErrorType.network:
        return 'assets/svgs/network_error.svg';
      case AppErrorType.database:
        return 'assets/svgs/database_error.svg';
      case AppErrorType.unauthorised:
        return 'assets/svgs/unauthorised_error.svg';
      case AppErrorType.sessionDenied:
        return 'assets/svgs/session_denied_error.svg';
    }
  }
}


extension AppErrorExtension on AppError {
   handleError() {
    logger.info(appErrorType);
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(appErrorType.message),
      ),
    );
  }
}

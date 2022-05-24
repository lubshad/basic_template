import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';

extension AppErrorTypeExtension on AppErrorType {
   String get message {
    switch (this) {
      case AppErrorType.api:
        return "Something went wrong, please try again later";
      case AppErrorType.network:
        return 'Something went wrong , Please check your network connection';
      case AppErrorType.database:
        return 'Something went wrong , Please check your database connection';
      case AppErrorType.unauthorised:
        return "You are not authorised to perform this action";
      case AppErrorType.sessionDenied:
        return "Session Expired, Please login again";
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

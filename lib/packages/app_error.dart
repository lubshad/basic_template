import 'package:equatable/equatable.dart';

import 'logger.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;

  const AppError(this.appErrorType);

  @override
  List<Object> get props => [appErrorType];

  handleError() {
    logger.info(appErrorType);
  }
}

enum AppErrorType { api, network, database, unauthorised, sessionDenied }

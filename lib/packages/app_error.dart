import 'package:basic_template/basic_template.dart';
import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final AppErrorType appErrorType;
  final String? message;

  const AppError(this.appErrorType, {this.message});

  @override
  List<Object> get props => [appErrorType];
}

enum AppErrorType { api, network, database, unauthorised, sessionDenied }

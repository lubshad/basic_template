import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'app_error.dart';
import 'logger.dart';

mixin RepositoryExceptionMixin {
  Future<Either<AppError, T>> exceptionHandler<T>(
    FutureOr computation,
  ) async {
    try {
      final result = await computation;
      return Right(result);
    } on SocketException catch (e) {
      logger.severe("Check Network Connection", e);
      return const Left(AppError(AppErrorType.network));
    } on Exception catch (e) {
      logger.severe("Something went wrong", e);
      return const Left(AppError(AppErrorType.api));
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:basic_template/basic_template.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

mixin RepositoryExceptionMixin {
  Future<Either<AppError, T>> exceptionHandler<T>(
    FutureOr computation,
  ) async {
    try {
      final result = await computation;
      return Right(result);
    } on SocketException catch (e) {
      logError("Check Network Connection $e");
      return const Left(AppError(AppErrorType.network));
    } on ApiException catch (e) {
      logError("Something went wrong $e");
      return Left(AppError(AppErrorType.api, message: e.toString()));
    } on UnauthorizedException catch (e) {
      logInfo("Unauthorized  $e");
      return Left(AppError(AppErrorType.unauthorised, message: e.toString()));
    }
  }
}

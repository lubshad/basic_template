
import 'package:basic_template/packages/app_error.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}

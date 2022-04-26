

import 'package:basic_template/basic_template.dart';

abstract class DataRepository {
  Future<Either<AppError, dynamic>> getData(dynamic params);
}

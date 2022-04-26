import 'package:basic_template/basic_template.dart';

import '../data_sources/remote_data_source.dart';
import '../../domain/repositories/data_repository.dart';

class DataRepositoryImplementation extends DataRepository
    with RepositoryExceptionMixin {
  final RemoteDataSource _remoteDataSource;
  DataRepositoryImplementation(this._remoteDataSource);
  
  @override
  Future<Either<AppError, dynamic>> getData(params) async {
    return await exceptionHandler(_remoteDataSource.getData(params));
  }
}

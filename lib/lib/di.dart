import 'package:basic_template/basic_template.dart';

import 'data/core/api_constants.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/data_repository_implementation.dart';
import 'domain/repositories/data_repository.dart';

class DependencyInjection {
  static inject() {
    Get.lazyPut(() => ApiClient(Client(), baseUrl: ApiConstants.baseUrl));
    Get.lazyPut<RemoteDataSource>(
        () => RemoteDataSourceImplementation(Get.find()));
    Get.lazyPut<DataRepository>(() => DataRepositoryImplementation(Get.find()));
  }
}


import 'package:basic_template/basic_template.dart';

import '../core/api_constants.dart';

abstract class RemoteDataSource {
   getData(dynamic params);
}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImplementation(this._apiClient);
  @override
  Future<dynamic> getData(dynamic params) async {
    final response =
        await _apiClient.post(ApiConstants.baseUrl, params);
    return response;
  }
}

import 'package:basic_template/basic_template.dart';

import '../repositories/data_repository.dart';

class GetData extends UseCase<dynamic, Map<String, dynamic>> {
  final DataRepository _dataRepository;

  GetData(this._dataRepository);
  @override
  Future<Either<AppError, dynamic>> call(Map<String, dynamic> params) async {
    return _dataRepository.getData(params);
  }
}

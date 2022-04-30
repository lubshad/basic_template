

import '../basic_template.dart';

abstract class UseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}


class UploadFileParams {
  final Map<String, dynamic> data;
  final List<MultipartFile> files;
  final String path;

  UploadFileParams(this.data, this.files, this.path);
}

class DeleteWithID {
  final int id;

  DeleteWithID(this.id);

  toJson() {
    return {
      "id": id,
    };
  }
  
}

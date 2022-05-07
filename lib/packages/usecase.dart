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
  final int? id;
  final String? uuid;

  DeleteWithID({this.id, this.uuid});

  toJson() {
    return {"id": id, "uuid": uuid};
  }
}

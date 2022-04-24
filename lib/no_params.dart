import 'package:equatable/equatable.dart';

class NoParams extends Equatable {
  @override
  List<Object> get props => [];

  dynamic toJson() {
    return {"session": "session"};
  }
}

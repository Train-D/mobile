import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  //final int statusCode;
  final String statusMessage;
  //final bool success;

  const ErrorMessageModel({
    required this.statusMessage,
  });
  @override
  factory ErrorMessageModel.fromText(String text) {
    print(text);
    return ErrorMessageModel(statusMessage: text);
  }

  @override
  List<Object?> get props => [statusMessage];
}

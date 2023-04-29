import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';

class RegisterResponseModel extends ResponseEntity {
  @override
  // ignore: overridden_fields
  final String token;
  // ignore: annotate_overrides, overridden_fields
  final String message;
  const RegisterResponseModel({
    required this.token,
    required this.message
  }) : super(token: token, message:  message);
  factory RegisterResponseModel.fromjson(Map<String, dynamic> res) {
    return RegisterResponseModel(token: res["token"] ?? '', message: res["message"]);
  }
}

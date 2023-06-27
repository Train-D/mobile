import '../../domain/entities/response_entity.dart';

class AuthResponseModel extends ResponseEntity {
  @override
  // ignore: overridden_fields
  final String token;
  // ignore: annotate_overrides, overridden_fields
  final String message;
  const AuthResponseModel({
    required this.token,
    required this.message
  }) : super(token: token, message:  message);
  factory AuthResponseModel.fromjson(Map<String, dynamic> res) {
    return AuthResponseModel(token: res["token"] ?? '', message: res["message"]);
  }
}

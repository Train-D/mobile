import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';

class RegisterResponse extends Response {
  @override
  // ignore: overridden_fields
  String token;
  RegisterResponse({
    required this.token,
  }) : super(token: token);
  factory RegisterResponse.fromjson(Map<String, dynamic> res) {
    return RegisterResponse(token: res["token"]?? '');
  }
}

import '../../domain/entities/login_entity.dart';

class LoginRequestModel extends LoginEntity {
  const LoginRequestModel({
    required super.userName,
    required super.password,
  });

  Map<String, dynamic> tojson() {
    return {
      "userName": userName,
      "password": password
    };
  }
}

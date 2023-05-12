import '../../domain/entities/user_entity.dart';

class RegisterRequestModel extends UserData {
  const RegisterRequestModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.userName,
    required super.password,
  });
  Map<String, dynamic> tojson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userName": userName,
      "email": email,
      "password": password
    };
  }
}

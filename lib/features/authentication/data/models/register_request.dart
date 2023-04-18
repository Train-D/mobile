import '../../domain/entities/register_entity.dart';

class RegisterRequestModel extends RegisterEntity {
  const RegisterRequestModel(
      {required super.firstName,
      required super.lastName,
      required super.email,
      required super.password});
  Map<String, dynamic> tojson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "userName": '$firstName$lastName',
      "email": email,
      "password": password
    };
  }
}

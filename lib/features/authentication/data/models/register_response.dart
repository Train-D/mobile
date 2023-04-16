import 'dart:convert';

import 'package:traind_app/features/authentication/domain/entities/register_entity.dart';
import 'package:traind_app/features/authentication/domain/repository/register_repository.dart';

class RegisterResponse {
  String? token;
  RegisterResponse({
    required this.token,
  });
  factory RegisterResponse.fromjson(Map<String, String> res) {
    return RegisterResponse(token: res["token"]);
  }
}

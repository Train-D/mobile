import '../../domain/entities/google_sign_in_response_entity.dart';

class GoogleSignInResponseModel extends GoogleSignInResponseEntity {
  const GoogleSignInResponseModel({required super.message});

  factory GoogleSignInResponseModel.fromJson(Map<String, dynamic> json) {
    return GoogleSignInResponseModel(message: json['message']);
  }
}

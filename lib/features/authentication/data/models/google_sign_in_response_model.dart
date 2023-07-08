import '../../domain/entities/google_sign_in_request_entity.dart';

class GoogleSignInRequestModel extends GoogleSignInRequestEntity {
  const GoogleSignInRequestModel({required super.idToken});
  
  Map<String, dynamic> tojson() {
    return {
      "idToken": idToken,
    };
  }
}

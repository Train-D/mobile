import 'package:equatable/equatable.dart';
import '../../data/models/auth_response_model.dart';

class ResponseEntity extends Equatable {
  final String token;
  final String message;
  const ResponseEntity({
    required this.token,
    required this.message,
  });

  @override
  List<Object?> get props => [token, message];
  factory ResponseEntity.toEntity(AuthResponseModel registerResponse) {
    return ResponseEntity(
      token: registerResponse.token,
      message: registerResponse.message,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:traind_app/features/authentication/data/models/register_response.dart';

class ResponseEntity extends Equatable {
  final String token;
  final String message;
  const ResponseEntity({required this.token, required this.message});

  @override
  List<Object?> get props => [token, message];
  factory ResponseEntity.toEntity(RegisterResponseModel registerResponse) {
    return ResponseEntity(token: registerResponse.token, message: registerResponse.message);
  }
}

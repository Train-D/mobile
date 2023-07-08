// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class GoogleSignInRequestEntity extends Equatable {
  final String idToken;
  const GoogleSignInRequestEntity({
    required this.idToken,
  });

  @override
  List<Object?> get props => [idToken];
}

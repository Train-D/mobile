import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}

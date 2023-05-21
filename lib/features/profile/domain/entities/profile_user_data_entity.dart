// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProfileUserDataEntity extends Equatable {
  final String? email;
  final String? userName;
  final String? image;
  final String? firstName;
  final String? lastName;
  final String? city;
  final String? phoneNumber;

  const ProfileUserDataEntity({
    required this.email,
    required this.userName,
    required this.image,
    required this.firstName,
    required this.lastName,
    this.city,
    this.phoneNumber,
  });


  @override
  List<Object?> get props => [
        email,
        userName,
        image,
        firstName,
        lastName,
        city,
        phoneNumber,
      ];
}

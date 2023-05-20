// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProfileUserDataEntity extends Equatable {
   String email;
   String userName;
   String image;
   String firstName;
   String lastName;
   String? city;
   String? phoneNumber;

  ProfileUserDataEntity({
    required this.email,
    required this.userName,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.phoneNumber,
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

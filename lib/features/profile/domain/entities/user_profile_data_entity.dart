// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:traind_app/features/profile/data/models/user_profile_data_model.dart';

class UserProfileDataEntity extends Equatable {
  String email;
  String userName;
  String image;
  String firstName;
  String lastName;
  dynamic city;
  dynamic phoneNumber;
  factory UserProfileDataEntity.toEntity(
      UserProfileDataModel userProfileDataModel) {
    return UserProfileDataEntity(
        email: userProfileDataModel.email,
        userName: userProfileDataModel.userName,
        image: userProfileDataModel.image,
        firstName: userProfileDataModel.firstName,
        lastName: userProfileDataModel.lastName,
        city: userProfileDataModel.city,
        phoneNumber: userProfileDataModel.phoneNumber);
  }
  UserProfileDataEntity({
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

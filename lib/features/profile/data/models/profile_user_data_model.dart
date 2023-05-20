import 'package:traind_app/features/profile/domain/entities/profile_user_data_entity.dart';

class ProfileUserDataModel extends ProfileUserDataEntity {
  ProfileUserDataModel({
    required super.email,
    required super.userName,
    required super.image,
    required super.firstName,
    required super.lastName,
    required super.city,
    required super.phoneNumber,
  });

  // ProfileUserDataModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   userName = json['userName'];
  //   firstName = json['firstName'];
  //   lastName = json['lastName'];
  //   image = json['image'];
  //   city = json['city'];
  //   phoneNumber = json['phoneNumber'];
  // }
}

import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/profile/domain/entities/user_profile_data_entity.dart';

// ignore: must_be_immutable
class UserProfileDataModel extends UserProfileDataEntity {
  UserProfileDataModel(
      {required super.email,
      required super.userName,
      required super.image,
      required super.firstName,
      required super.lastName,
      required super.city,
      required super.phoneNumber});
  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) {
    return UserProfileDataModel(
        email: json["email"],
        userName: json["userName"],
        image: json["image"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        city:json["city"],
        phoneNumber: json["phoneNumber"] );
  }
  factory UserProfileDataModel.toJson(Map<String, dynamic> json) {
    return UserProfileDataModel(
        email: CacheHelper.getData(key: 'email'),
        userName: CacheHelper.getData(key: 'userName'),
        image: json["image"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        city:json["city"],
        phoneNumber: json["phoneNumber"] );
  }
}

import 'package:traind_app/features/settings/domain/entity/setting_user_data_entity.dart';

class SettingUserDataModel extends SettingUserDataEntity {
  SettingUserDataModel({required super.userName, required super.picture});
  factory SettingUserDataModel.fromJson(Map<String, dynamic> json) {
    return SettingUserDataModel(
        userName: json["username"], picture: json["image"]);
  }
}

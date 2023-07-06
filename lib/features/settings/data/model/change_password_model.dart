import 'package:traind_app/features/settings/domain/entity/change_password_entity.dart';

class ChangePasswordModel extends ChangePasswordEntity {
  ChangePasswordModel(
      {required super.currPassword, required super.newPassword});
  Map<String, dynamic> toJson() {
    return {
      "currentPassword": currPassword, 
      "newPassword": newPassword
      };
  }
}

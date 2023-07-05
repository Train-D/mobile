import '../../domain/entities/reset_password_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity {
  ResetPasswordModel({required super.resetPassword});
  Map<String, dynamic> toJson() {
    return {'Email': resetPassword};
  }

  factory ResetPasswordModel.fromJson(Map<String, dynamic> res) {
    return ResetPasswordModel(resetPassword: res['message']);
  }
}

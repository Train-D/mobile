import 'package:dio/dio.dart';

import '../../../../core/network/remote/api_constants.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../models/reset_password_model.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<ResetPasswordEntity> resetPassword(ResetPasswordModel model);
}

class ResetPasswordRemoteDataSourceImpl extends ResetPasswordRemoteDataSource {
  
  @override
  Future<ResetPasswordEntity> resetPassword(ResetPasswordModel model) async {
    var data = await Dio().post(
      '${ApiConstants.baseUrl}${ApiConstants.forgotPaswword}',
      data: model.toJson(),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    ResetPasswordEntity resetPasswordEntity = ResetPasswordModel.fromJson(data.data);
    return resetPasswordEntity;
  }
}

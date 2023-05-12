import 'package:dio/dio.dart';
import 'package:traind_app/core/network/api_constants.dart';
import 'package:traind_app/features/authentication/data/models/login_request_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/error_message_model.dart';
import '../models/auth_response_model.dart';

abstract class BaseLoginRemoteDataSource {
  Future<ResponseEntity> postLoginData(LoginRequestModel model);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  @override
  Future<ResponseEntity> postLoginData(LoginRequestModel model) async {
    final response = await Dio().post(
      data: model.tojson(),
      ApiConstants.loginPath,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      var temp = AuthResponseModel.fromjson(response.data);
      var loginEntity = ResponseEntity.toEntity(temp);
      return loginEntity;
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromText(response.data),
    );
  }
}

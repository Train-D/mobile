import 'package:dio/dio.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/api_constants.dart';
import 'package:traind_app/core/network/error_message_model.dart';
import 'package:traind_app/features/authentication/data/models/register_request_model.dart';
import 'package:traind_app/features/authentication/data/models/auth_response_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<ResponseEntity> postRegisterData(RegisterRequestModel model);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  @override
  Future<ResponseEntity> postRegisterData(RegisterRequestModel model) async {
    final response = await Dio().post(
      ApiConstants.registerPath,
      data: model.tojson(),
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      var temp = AuthResponseModel.fromjson(response.data);
      var registerEntity = ResponseEntity.toEntity(temp);
      return registerEntity;
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromText(response.data),
    );
  }
}

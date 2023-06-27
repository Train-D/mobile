import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/network/remote/error_message_model.dart';
import '../../domain/entities/response_entity.dart';
import '../models/auth_response_model.dart';
import '../models/register_request_model.dart';

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

import 'package:dio/dio.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/api_constants.dart';
import 'package:traind_app/core/network/error_message_model.dart';
import 'package:traind_app/features/authentication/data/models/register_request.dart';
import 'package:traind_app/features/authentication/data/models/register_response.dart';

abstract class BaseRegisterDataSource {
  Future<RegisterResponse> postRegisterData(RegisterRequestModel model);
}

class RegisterDataSource extends BaseRegisterDataSource {
  @override
  Future<RegisterResponse> postRegisterData(RegisterRequestModel model) async {
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
      return RegisterResponse.fromjson(response.data);
    }

    throw ServerException(
      errorMessageModel: ErrorMessageModel.fromText(response.data),
    );
  }
}

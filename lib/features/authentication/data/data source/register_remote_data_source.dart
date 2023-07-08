// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/authentication/data/models/google_sign_in_response_model.dart';
import 'package:traind_app/features/authentication/domain/entities/google_sign_in_request_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/network/remote/error_message_model.dart';
import '../../domain/entities/response_entity.dart';
import '../models/auth_response_model.dart';
import '../models/register_request_model.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<ResponseEntity> postRegisterData(RegisterRequestModel model);
  Future<ResponseEntity> postGoogeSignInIdToken(GoogleSignInRequestModel model);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  final ApiService apiService;
  RegisterRemoteDataSource(
    this.apiService,
  );

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

  @override
  Future<ResponseEntity> postGoogeSignInIdToken(
      GoogleSignInRequestModel model) async {
    var data = await apiService.post(
        endPoint: '/User/LoginWithGoogle/', data: model.tojson());
    var temp = AuthResponseModel.fromjson(data);
    var loginEntity = ResponseEntity.toEntity(temp);
    return loginEntity;
  }
}

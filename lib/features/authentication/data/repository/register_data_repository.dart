import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:traind_app/features/authentication/data/models/google_sign_in_response_model.dart';
import '../../domain/entities/google_sign_in_request_entity.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/response_entity.dart';
import '../../domain/repository/register_domain_repository.dart';
import '../data%20source/register_remote_data_source.dart';
import '../models/register_request_model.dart';

class RegisterRepository extends BaseRegisterRepository {
  final BaseRegisterRemoteDataSource baseRegisterDataSource;

  RegisterRepository(this.baseRegisterDataSource);
  @override
  Future<Either<Failure, ResponseEntity>> postRegisterData(
      RegisterRequestModel parameter) async {
    final result = await baseRegisterDataSource.postRegisterData(parameter);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ResponseEntity>> postGoogeSignInIdToken(
      GoogleSignInRequestModel model) async {
    try {
      var googleResp =
          await baseRegisterDataSource.postGoogeSignInIdToken(model);
      return Right(googleResp);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

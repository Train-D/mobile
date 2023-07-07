import 'package:dartz/dartz.dart';
import '../../domain/entities/google_sign_in_response_entity.dart';

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
  Future<Either<Failure, GoogleSignInResponseEntity>> postGoogeSignInIdToken(
      String idToken) async {
    try {
      var googleResp =
          await baseRegisterDataSource.postGoogeSignInIdToken(idToken);
      return Right(googleResp);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

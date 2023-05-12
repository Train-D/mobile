import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/authentication/data/data%20source/register_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/models/register_request_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/features/authentication/domain/repository/register_domain_repository.dart';

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
}

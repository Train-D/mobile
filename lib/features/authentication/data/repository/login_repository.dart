// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/authentication/data/data%20source/login_remote_data_source.dart';
import 'package:traind_app/features/authentication/data/models/login_request_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';
import 'package:traind_app/features/authentication/domain/repository/base_login_repository.dart';

class LoginRepository extends BaseLoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepository(
    this.loginRemoteDataSource,
  );

  @override
  Future<Either<Failure, ResponseEntity>> postLoginData(
      LoginRequestModel parameter) async{
    final result = await loginRemoteDataSource.postLoginData(parameter);
    try {
      return right(result);
    } on ServerException catch (falure) {
      return left(
        ServerFailure(
          falure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/settings/data/data%20source/change_password_remote_data_source.dart';
import 'package:traind_app/features/settings/data/model/change_password_model.dart';
import 'package:traind_app/features/settings/domain/repository/base_change_password_repository.dart';

class ChangePasswordRepository extends BaseChangePasswordRepository {
  final ChangePasswordRemoteDataSource changePasswordRemoteDataSource;

  ChangePasswordRepository(this.changePasswordRemoteDataSource);
  @override
  Future<Either<Failure, String>> changePasswordData(
      ChangePasswordModel parameters) async{
    try {
      // ignore: prefer_typing_uninitialized_variables
      var response = await changePasswordRemoteDataSource.changePasswordInfo(parameters);
      return Right(response);
    }on DioError catch (e) {
      return Left(ServerFailure(e.response!.data['message'].toString()));
    }
  }
}

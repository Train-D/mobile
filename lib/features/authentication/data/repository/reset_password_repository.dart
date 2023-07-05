import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../data%20source/reset_password_remote_data_source.dart';
import '../models/reset_password_model.dart';
import '../../domain/entities/reset_password_entity.dart';
import '../../domain/repository/base_reset_password_respository.dart';

class ResetPasswordRepository extends BaseResetPasswordRepository {
  final ResetPasswordRemoteDataSource resetPasswordRemoteDataSource;
  ResetPasswordRepository({
    required this.resetPasswordRemoteDataSource,
  });

  @override
  Future<Either<Failure, ResetPasswordEntity>> resetpassword(ResetPasswordModel parameters) async{
    try {
      var resetPaswword = await resetPasswordRemoteDataSource.resetPassword(parameters);
      return Right(resetPaswword);
    } on DioError catch (e) {
      return Left(ServerFailure(e.response!.data['message'].toString()));
    }
  }
}

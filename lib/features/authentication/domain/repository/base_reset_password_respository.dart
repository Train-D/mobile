import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/authentication/data/models/reset_password_model.dart';
import 'package:traind_app/features/authentication/domain/entities/reset_password_entity.dart';

abstract class BaseResetPasswordRepository {
  Future<Either<Failure, ResetPasswordEntity>> resetpassword(
      ResetPasswordModel parameters);
}

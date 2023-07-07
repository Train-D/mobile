import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/reset_password_model.dart';
import '../entities/reset_password_entity.dart';

abstract class BaseResetPasswordRepository {
  Future<Either<Failure, ResetPasswordEntity>> resetpassword(
      ResetPasswordModel parameters);
}

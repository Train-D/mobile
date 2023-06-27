import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/authentication/data/models/reset_password_model.dart';
import 'package:traind_app/features/authentication/domain/entities/reset_password_entity.dart';
import 'package:traind_app/features/authentication/domain/repository/base_reset_password_respository.dart';

class ResetPasswordUseCase
    extends BaseUsecase<ResetPasswordEntity, ResetPasswordModel> {
  final BaseResetPasswordRepository baseResetPasswordRepository;
  ResetPasswordUseCase({
    required this.baseResetPasswordRepository,
  });
  @override
  Future<Either<Failure, ResetPasswordEntity>> call(
      ResetPasswordModel parameters) async {
    return await baseResetPasswordRepository.resetpassword(parameters);
  }
}

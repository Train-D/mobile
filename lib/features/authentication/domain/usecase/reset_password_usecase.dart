import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../data/models/reset_password_model.dart';
import '../entities/reset_password_entity.dart';
import '../repository/base_reset_password_respository.dart';

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

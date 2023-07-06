import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/settings/data/model/change_password_model.dart';
import 'package:traind_app/features/settings/domain/repository/base_change_password_repository.dart';

class ChangePasswordUseCase
    extends BaseUsecase<String, ChangePasswordModel> {
  final BaseChangePasswordRepository baseChangePasswordRepository;

  ChangePasswordUseCase(this.baseChangePasswordRepository);
  @override
  Future<Either<Failure, String>> call(
      ChangePasswordModel parameters) async {
    return await baseChangePasswordRepository.changePasswordData(parameters);
  }
}

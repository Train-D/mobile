import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../data/model/change_password_model.dart';
import '../repository/base_change_password_repository.dart';

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

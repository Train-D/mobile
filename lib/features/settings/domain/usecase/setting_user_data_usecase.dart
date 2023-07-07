import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/settings/domain/entity/setting_user_data_entity.dart';
import 'package:traind_app/features/settings/domain/repository/base_setting_user_data_repository.dart';

class SettingUserDataUseCase
    extends BaseUsecase<SettingUserDataEntity, NoParameters> {
  final BaseSettingUserDataRepository baseSettingUserDataRepository;

  SettingUserDataUseCase(this.baseSettingUserDataRepository);
  @override
  Future<Either<Failure, SettingUserDataEntity>> call(
      NoParameters parameters) async {
    return await baseSettingUserDataRepository.getSettingUserData();
  }
}

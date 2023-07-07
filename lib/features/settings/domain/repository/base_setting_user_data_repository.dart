import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/settings/domain/entity/setting_user_data_entity.dart';

abstract class BaseSettingUserDataRepository {
  Future<Either<Failure, SettingUserDataEntity>> getSettingUserData();
}

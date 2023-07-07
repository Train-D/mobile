import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/settings/data/data%20source/setting_user_data_remote_data_source.dart';
import 'package:traind_app/features/settings/domain/entity/setting_user_data_entity.dart';
import 'package:traind_app/features/settings/domain/repository/base_setting_user_data_repository.dart';

class SettingUserDataRepository extends BaseSettingUserDataRepository {
  final SettingUserDataRemoteDataSource settingUserDataRemoteDataSource;
  SettingUserDataRepository({
    required this.settingUserDataRemoteDataSource,
  });
  @override
  Future<Either<Failure, SettingUserDataEntity>> getSettingUserData() async{
    try {
      var response = await settingUserDataRemoteDataSource.getUserData();
      return Right(response);
    }catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

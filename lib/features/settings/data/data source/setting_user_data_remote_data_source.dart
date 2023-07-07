import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/settings/data/model/setting_user_data_model.dart';
import 'package:traind_app/features/settings/domain/entity/setting_user_data_entity.dart';

abstract class SettingUserDataRemoteDataSource {
  Future<SettingUserDataEntity> getUserData();
}

class SettingUserDataRemoteDataSourceImpl
    extends SettingUserDataRemoteDataSource {
  final ApiService apiService;
  SettingUserDataRemoteDataSourceImpl({
    required this.apiService,
  });
  @override
  Future<SettingUserDataEntity> getUserData() async {
    var data =
        await apiService.get(endPoint: ApiConstants.settingUserDataEndPoint);
    SettingUserDataEntity settingUserDataEntity =
        SettingUserDataModel.fromJson(data);
    return settingUserDataEntity;
  }
}

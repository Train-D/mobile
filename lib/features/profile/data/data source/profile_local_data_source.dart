import 'dart:convert';

import '../../../../core/network/local/cache_helper.dart';
import '../../domain/entities/profile_user_data_entity.dart';
import '../models/profile_user_data_model.dart';

abstract class ProfileLocalDataSource {
  ProfileUserDataEntity? getProfileUserData();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  @override
  ProfileUserDataEntity? getProfileUserData() {
    //print(CacheHelper.getData(key: 'userData'));
    String? jsonData = CacheHelper.getData(key: 'userData');
    if (jsonData == null) return null;
    Map<String, dynamic> jsonDataIs = jsonDecode(jsonData);
    ProfileUserDataEntity profileUserData =
        ProfileUserDataModel.fromJson(jsonDataIs);

    return profileUserData;
  }
}

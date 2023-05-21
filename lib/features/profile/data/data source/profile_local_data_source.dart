import 'dart:convert';
import 'package:traind_app/core/network/local/cache_helper.dart';
import '../../domain/entities/profile_user_data_entity.dart';
import '../models/profile_user_data_model.dart';

abstract class ProfileLocalDataSource {
  ProfileUserDataEntity getProfileUserData();
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource {
  @override
  ProfileUserDataEntity getProfileUserData() {
    Map<String, dynamic> jsonDataIs =
        jsonDecode(CacheHelper.getData(key: 'userData'));
    ProfileUserDataEntity profileUserData =
        ProfileUserDataModel.fromJson(jsonDataIs);
    return profileUserData;
  }
}

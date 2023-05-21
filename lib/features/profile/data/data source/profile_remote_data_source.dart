// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/core/services/api_service.dart';
import 'package:traind_app/features/profile/data/models/profile_user_data_model.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../domain/entities/profile_user_data_entity.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileUserDataEntity> getProfileUserData();
  Future<ProfileUserDataEntity> putProfileUserData(ProfileUserDataModel model);
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;
  ProfileRemoteDataSourceImpl(
    this.apiService,
  );

  @override
  Future<ProfileUserDataEntity> getProfileUserData() async {
    var data = await apiService.get(endPoint: ApiConstants.profilePath);
    ProfileUserDataEntity profileUserData = ProfileUserDataModel.fromJson(data);
    
    storeProfileUserData(data);
    return profileUserData;
  }

  @override
  Future<ProfileUserDataEntity> putProfileUserData(
      ProfileUserDataModel model) async {
    var data = await apiService.put(
      endPoint: '/Profile/UpdateProfile',
      data: model.toJson(),
    );
    ProfileUserDataEntity profileUserData = ProfileUserDataModel.fromJson(data);
    //removeUserDataFromCache();
    storeProfileUserData(data);
    return profileUserData;
  }

  void removeUserDataFromCache() async {
    await CacheHelper.removeData(key: 'userData');
  }

  void storeProfileUserData(Map<String, dynamic> data) {
    String userData = jsonEncode(data);
    CacheHelper.saveData(key: 'userData', value: userData);
  }
}

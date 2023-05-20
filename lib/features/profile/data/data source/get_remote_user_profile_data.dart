import 'package:dio/dio.dart';
import 'package:traind_app/core/network/remote/api_constants.dart';
import 'package:traind_app/features/profile/data/models/user_profile_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/user_profile_data_entity.dart';

import '../../../../core/network/local/cache_helper.dart';

abstract class BaseGetRemoteUserProfileDataSource {
  Future<UserProfileDataEntity> getUserProfileRemoteData();
}
abstract class BasePutRemoteUserProfileDataSource {
  Future<UserProfileDataEntity> putUserProfileRemoteData();
}


class GetRemoteUserProfileDataSource extends BaseGetRemoteUserProfileDataSource{
  @override
  Future<UserProfileDataEntity> getUserProfileRemoteData() async{
    final headers = {
    'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}',
  };
    try{
      final dio = Dio();
      dio.options.headers = headers;
      final response = await dio.get(
        ApiConstants.getUserProfileDataPath,
      );
       var temp = UserProfileDataModel.fromJson(response.data);
      var userProfileData = UserProfileDataEntity.toEntity(temp);
      return userProfileData;
    }catch(e){
      throw Exception('Failed to get stations data: $e');
    }
  }

}
class PutRemoteUserProfileDataSource extends BasePutRemoteUserProfileDataSource{
  @override
  Future<UserProfileDataEntity> putUserProfileRemoteData() async{
    final headers = {
    'Authorization': 'Bearer ${CacheHelper.getData(key: "token")}',
  };
    try{
      final dio = Dio();
      dio.options.headers = headers;
      final response = await dio.put(
        ApiConstants.getUserProfileDataPath,
        data: UserProfileDataModel.toJson
      );
       var temp = UserProfileDataModel.fromJson(response.data);
      var userProfileData = UserProfileDataEntity.toEntity(temp);
      return userProfileData;
    }catch(e){
      throw Exception('Failed to get stations data: $e');
    }
  }

}

import 'dart:convert';

import 'package:traind_app/features/profile/data/models/profile_image_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_image_entity.dart';

import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';

abstract class ProfileImageRemoteDataSource {
  Future<ProfileImageEntity> getProfileImage();
  Future<ProfileImageEntity> putProfileImage(ProfileImageModel model);
}

class ProfileImageRemoteDataSourceimpl extends ProfileImageRemoteDataSource {
  final ApiService apiService;
  ProfileImageRemoteDataSourceimpl({
    required this.apiService,
  });
  @override
  Future<ProfileImageEntity> getProfileImage() async{
   var data = await apiService.get(endPoint: ApiConstants.ProfileImageGetEndPoint);
    ProfileImageEntity profileImageEntity = ProfileImageModel.fromJson(data);

    storeProfileImage(data);
    return profileImageEntity;
  }

  @override
  Future<ProfileImageEntity> putProfileImage(ProfileImageModel model)async {
    await apiService.put(
      endPoint: ApiConstants.ProfileImagePutEndPoint,
      data: model.toJson(),
    );
   var data = await apiService.get(endPoint: ApiConstants.ProfileImageGetEndPoint);
    ProfileImageEntity profileImageEntity = ProfileImageModel.fromJson(data);
    removeProfileIMageFromCache();
    storeProfileImage(data);
    return profileImageEntity;
  }
  void removeProfileIMageFromCache() async {
    await CacheHelper.removeData(key: 'profileImage');
  }

  void storeProfileImage(Map<String, dynamic> data) {
    String image = jsonEncode(data);
    CacheHelper.saveData(key: 'profileImage', value: image);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/profile/data/models/user_profile_data_model.dart';
import 'package:traind_app/features/profile/domain/usecase/user_profile_data_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.getUserProfileDataUseCase) : super(ProfileInitial()) {
    
    getUserProfileDataFromCache();
  }

  static ProfileCubit get(context) => BlocProvider.of(context);

  var profileFirstNameCon = TextEditingController();
  var profileLastNameCon = TextEditingController();
  var profileUsernameCon = TextEditingController();
  var profileEmailCon = TextEditingController();
  var profilePhoneCon = TextEditingController();
  var profileCityCon = TextEditingController();
  dynamic isProfileImage = CacheHelper.getData(key: 'setProfileImage');
  XFile? profileImage;
  final GetUserProfileDataUseCase getUserProfileDataUseCase;
  late UserProfileDataModel userProfileDataModel;
  Future<void> getUserProfileDataFromApi() async {
    emit(ProfileLoadingState());
    try {
      final result = await getUserProfileDataUseCase();
      result.fold((l) {}, (r) {
        userProfileDataModel = UserProfileDataModel.fromJson({
          "email": r.email,
          "userName": r.userName,
          "image": r.image,
          "firstName": r.firstName,
          "lastName": r.lastName,
          "city": r.city,
          "phoneNumber": r.phoneNumber
        });
        CacheHelper.saveData(key: "getUserProfileData", value: true);
        CacheHelper.saveData(key: "email", value: userProfileDataModel.email);
        CacheHelper.saveData(
            key: "userName", value: userProfileDataModel.userName);
        CacheHelper.saveData(key: "image", value: userProfileDataModel.image);

        CacheHelper.saveData(
            key: "city", value: userProfileDataModel.city ?? '');
        CacheHelper.saveData(
            key: "phoneNumber", value: userProfileDataModel.phoneNumber ?? '');

        CacheHelper.saveData(
            key: "firstName", value: userProfileDataModel.firstName);
        CacheHelper.saveData(
            key: "lastName", value: userProfileDataModel.lastName);
      });

      emit(ProfileSuccessState());
    } on ServerException catch (e) {
      emit(ProfileErrorState(e.toString()));
    } on DioError catch (e) {
      emit(ProfileErrorState(e.response));
    }
  }
  Future<void> putUserProfileDataFromApi() async {
    emit(ProfileLoadingState());
    try {
      final result = await getUserProfileDataUseCase();
      result.fold((l) {}, (r) {
        userProfileDataModel = UserProfileDataModel.fromJson({
          "email": r.email,
          "userName": r.userName,
          "image": r.image,
          "firstName": r.firstName,
          "lastName": r.lastName,
          "city": r.city,
          "phoneNumber": r.phoneNumber
        });
        CacheHelper.saveData(key: "getUserProfileData", value: true);
        CacheHelper.saveData(key: "email", value: userProfileDataModel.email);
        CacheHelper.saveData(
            key: "userName", value: userProfileDataModel.userName);
        CacheHelper.saveData(key: "image", value: userProfileDataModel.image);

        CacheHelper.saveData(
            key: "city", value: userProfileDataModel.city ?? '');
        CacheHelper.saveData(
            key: "phoneNumber", value: userProfileDataModel.phoneNumber ?? '');

        CacheHelper.saveData(
            key: "firstName", value: userProfileDataModel.firstName);
        CacheHelper.saveData(
            key: "lastName", value: userProfileDataModel.lastName);
      });

      emit(ProfileSuccessState());
    } on ServerException catch (e) {
      emit(ProfileErrorState(e.toString()));
    } on DioError catch (e) {
      emit(ProfileErrorState(e.response));
    }
  }
  Future<void> getUserProfileDataFromCache() async {
    profileFirstNameCon.text = CacheHelper.getData(key: "firstName")??'';
    profileLastNameCon.text = CacheHelper.getData(key: "lastName")??'';
    profileUsernameCon.text = CacheHelper.getData(key: "userName")??'';
    profileEmailCon.text = CacheHelper.getData(key: "email")??'';
    profilePhoneCon.text = CacheHelper.getData(key: "phoneNumber") ?? '';
    profileCityCon.text = CacheHelper.getData(key: "city") ?? '';
    profileImage = XFile(CacheHelper.getData(key: "image")??'');
  }

  Future<void> pickImageFromGallery() async {
    profileImage = (await ImagePicker().pickImage(source: ImageSource.gallery));
    if (profileImage != null) {
      CacheHelper.putData(key: 'setProfileImage', value: true);
    }
    emit(PickImageFromGalleryProfileState());
  }

  Future<void> pickImageFromCamera() async {
    profileImage = (await ImagePicker().pickImage(source: ImageSource.camera));
    if (profileImage != null) {
      CacheHelper.putData(key: 'setProfileImage', value: true);
    }
    emit(PickImageFromCameraProfileState());
  }

  void removeProfilePicture() {
    CacheHelper.saveData(key: 'setProfileImage', value: false);
    profileImage = null;
    emit(RemoveProfilePictureState());
  }
}

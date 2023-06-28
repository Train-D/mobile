// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/profile/data/models/profile_user_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_user_data_entity.dart';
import 'package:traind_app/features/profile/domain/usecase/get_profile_user_data_use_case.dart';
import 'package:traind_app/features/profile/domain/usecase/put_profile_user_data_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this.getProfileUserDataUsecase,
    this.putProfileUserDataUseCase,
  ) : super(ProfileInitial()) {
    CacheHelper.saveData(key: 'isProfileImage', value: false);
  }

  static ProfileCubit get(context) => BlocProvider.of(context);

  var profileFirstNameCon = TextEditingController();
  var profileLastNameCon = TextEditingController();
  var profileUsernameCon = TextEditingController();
  var profileEmailCon = TextEditingController();
  var profilePhoneCon = TextEditingController();
  var profileCityCon = TextEditingController();
  XFile? profileImage;
  returnToInitState() {
    emit(ProfileInitial());
  }

  String? base64Image;

  Future<void> pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      CacheHelper.saveData(key: 'isProfileImage', value: true);
      final imageBytes = await pickedImage.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
    emit(PickImageFromGalleryProfileState());
  }

  Future<void> pickImageFromCamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      CacheHelper.saveData(key: 'isProfileImage', value: true);
      final imageBytes = await pickedImage.readAsBytes();
      base64Image = base64Encode(imageBytes);
    }
    emit(PickImageFromCameraProfileState());
  }

  void removeProfilePicture() {
    CacheHelper.saveData(key: 'isProfileImage', value: false);
    base64Image = '';
    emit(RemoveProfilePictureState());
  }

  final GetProfileUserDataUsecase getProfileUserDataUsecase;

  Future<void> getProfileUserData() async {
    emit(ProfileLoadingUserDataState());
    var result = await getProfileUserDataUsecase.call(const NoParameters());
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(ProfileFailureUserDataState(message: failure.message));
    }, (userData) {
      if (userData.image != '') {
        CacheHelper.saveData(key: 'isProfileImage', value: true);
        base64Image = userData.image;
      }
      assignProfileUserDataToTextFields(userData);
      emit(ProfileSuccessUserDataState(profileUserDataEntity: userData));
    });
  }

  final PutProfileUserDataUseCase putProfileUserDataUseCase;

  Future<void> putProfileUserData({
    required String image,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String city,
  }) async {
    emit(ProfileLoadingPostUserDataState());
    var result = await putProfileUserDataUseCase.call(ProfileUserDataModel(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      city: city,
      image: image,
    ));
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(ProfileFailurePostUserDataState(failure.message));
    }, (userData) {
      if (userData.image != '') {
        CacheHelper.saveData(key: 'isProfileImage', value: true);
        base64Image = userData.image;
      }
      assignProfileUserDataToTextFields(userData);
      emit(ProfileSuccessPostUserDataState(userData));
    });
  }

  Image base64ToImage(String base64String) {
    final bytes = base64Decode(base64String);
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }

  void assignProfileUserDataToTextFields(ProfileUserDataEntity userData) {
    profileFirstNameCon.text = userData.firstName ?? '';
    profileLastNameCon.text = userData.lastName ?? '';
    profileUsernameCon.text = userData.userName ?? '';
    profileEmailCon.text = userData.email ?? '';
    profilePhoneCon.text = userData.phoneNumber ?? '';
    profileCityCon.text = userData.city ?? '';
  }
}

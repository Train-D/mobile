// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
  ) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  var profileFirstNameCon = TextEditingController();
  var profileLastNameCon = TextEditingController();
  var profileUsernameCon = TextEditingController();
  var profileEmailCon = TextEditingController();
  var profilePhoneCon = TextEditingController();
  var profileCityCon = TextEditingController();
  XFile? profileImage;
  bool isProfileImage = false;
  Future<void> pickImageFromGallery() async {
    profileImage = (await ImagePicker().pickImage(source: ImageSource.gallery));
    if (profileImage != null) {
      isProfileImage = true;
    }
    emit(PickImageFromGalleryProfileState());
  }

  Future<void> pickImageFromCamera() async {
    profileImage = (await ImagePicker().pickImage(source: ImageSource.camera));
    if (profileImage != null) {
      isProfileImage = true;
    }
    emit(PickImageFromCameraProfileState());
  }

  void removeProfilePicture() {
    isProfileImage = false;
    profileImage = null;
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
      print(userData);
      //profileImage = userData.image as XFile?;
      assignProfileUserDataToTextFields(userData);
      emit(ProfileSuccessUserDataState(profileUserDataEntity: userData));
    });
  }

  final PutProfileUserDataUseCase putProfileUserDataUseCase;

  Future<void> postProfileUserData({
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
      //profileImage = userData.image as XFile?;
      assignProfileUserDataToTextFields(userData);
      emit(ProfileSuccessPostUserDataState(userData));
    });
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

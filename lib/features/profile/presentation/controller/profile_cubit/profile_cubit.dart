import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

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
   // print(profileImage!.path);

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
  
}

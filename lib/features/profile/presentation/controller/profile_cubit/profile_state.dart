// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class PickImageFromGalleryProfileState extends ProfileState {}

class PickImageFromCameraProfileState extends ProfileState {}

class RemoveProfilePictureState extends ProfileState {}

class ProfileLoadingUserDataState extends ProfileState {}

class ProfileSuccessUserDataState extends ProfileState {
  final ProfileUserDataEntity profileUserDataEntity;
  ProfileSuccessUserDataState({
    required this.profileUserDataEntity,
  });
}

class ProfileFailureUserDataState extends ProfileState {
  final String message;
  ProfileFailureUserDataState({
    required this.message,
  });
}

class ProfileLoadingPostUserDataState extends ProfileState {}

class ProfileSuccessPostUserDataState extends ProfileState {
  final ProfileUserDataEntity profilePostUserDataEntity;

  ProfileSuccessPostUserDataState(this.profilePostUserDataEntity);
}

class ProfileFailurePostUserDataState extends ProfileState {
  final String message;

  ProfileFailurePostUserDataState(this.message);
}
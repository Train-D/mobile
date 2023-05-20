part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class PickImageFromGalleryProfileState extends ProfileState{}
class PickImageFromCameraProfileState extends ProfileState{}
class RemoveProfilePictureState extends ProfileState{}
class ProfileLoadingState extends ProfileState {}

class ProfileSuccessState extends ProfileState {}

// ignore: must_be_immutable
class ProfileErrorState extends ProfileState {
  dynamic message;
  ProfileErrorState (this.message);
  
}
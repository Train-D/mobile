part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class PickImageFromGalleryProfileState extends ProfileState{}
class PickImageFromCameraProfileState extends ProfileState{}
class RemoveProfilePictureState extends ProfileState{}
part of 'setting_user_data_cubit.dart';

abstract class SettingUserDataState{}

class SettingUserDataInitial extends SettingUserDataState {}

class SettingUserDataLoadingState extends SettingUserDataState{}
class SettingUserDataSuccessState extends SettingUserDataState{}
class SettingUserDataFailureState extends SettingUserDataState{}
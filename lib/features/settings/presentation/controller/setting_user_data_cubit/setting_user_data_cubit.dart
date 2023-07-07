// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traind_app/features/settings/domain/usecase/setting_user_data_usecase.dart';

import '../../../../../core/usecases/base_usecase.dart';

part 'setting_user_data_state.dart';

class SettingUserDataCubit extends Cubit<SettingUserDataState> {
  SettingUserDataCubit(this.settingUserDataUseCase)
      : super(SettingUserDataInitial()) {
    getSettingUserData();
  }

  static SettingUserDataCubit get(context) => BlocProvider.of(context);
  Image base64ToImage(String base64String) {
    final bytes = base64Decode(base64String);
    return Image.memory(
      bytes,
      fit: BoxFit.cover,
    );
  }

  final SettingUserDataUseCase settingUserDataUseCase;
  String image = '';
  String userName = '';
  Future<void> getSettingUserData() async {
    emit(SettingUserDataLoadingState());
    var result = await settingUserDataUseCase.call(const NoParameters());
    result.fold((failure) {
      print(failure.toString());
      emit(SettingUserDataFailureState());
    }, (data) {
      print(data);
      userName = data.userName;
      image = data.picture;
      emit(SettingUserDataSuccessState());
    });
  }
}

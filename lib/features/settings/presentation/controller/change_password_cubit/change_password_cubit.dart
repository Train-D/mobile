// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traind_app/features/authentication/data/models/reset_password_model.dart';
import 'package:traind_app/features/settings/data/model/change_password_model.dart';
import 'package:traind_app/features/settings/domain/usecase/change_password_usecase.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(
    this.changePasswordUseCase,
  ) : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context) => BlocProvider.of(context);

  String message = '';
  var changePasswordFormKey = GlobalKey<FormState>();
  var currPasswordCon = TextEditingController();
  var newPasswordCon = TextEditingController();
  var confirmPasswordCon = TextEditingController();
  bool currPasswordShown = true;
  bool newPasswordShown = true;
  bool confirmPasswordShown = true;
  IconData currPasswordSuffIcon = Icons.visibility_off_outlined;
  IconData newPasswordSuffIcon = Icons.visibility_off_outlined;
  IconData confirmPasswordSuffIcon = Icons.visibility_off_outlined;

  void changeCurrPasswordVisibility() {
    currPasswordSuffIcon = !currPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    currPasswordShown = !currPasswordShown;
    emit(CurrChangesPasswordVisibilityState());
  }

  void changeNewPasswordVisibility() {
    newPasswordSuffIcon = !newPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    newPasswordShown = !newPasswordShown;
    emit(NewChangesPasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    confirmPasswordSuffIcon = !confirmPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    confirmPasswordShown = !confirmPasswordShown;
    emit(ConfirmChangesPasswordVisibilityState());
  }

  final ChangePasswordUseCase changePasswordUseCase;
  Future<void> changePassword() async {
    emit(ChangePasswordLoadingState());
    var result = await changePasswordUseCase.call(ChangePasswordModel(currPassword: currPasswordCon.text, newPassword: newPasswordCon.text));
    result.fold((failure) {
      message = failure.message;
      debugPrint(failure.toString());
      emit(ChangePasswordFailureState());
    }, (changePassword) {
      print(changePassword);
      message = changePassword;
      emit(ChangePasswordSuccessState());
    });
  }
}

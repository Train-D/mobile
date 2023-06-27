// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/authentication/data/models/reset_password_model.dart';
import 'package:traind_app/features/authentication/domain/usecase/reset_password_usecase.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.resetPasswordUseCase) : super(ResetPasswordInitial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  String message = '';
  var userEmailAddressCon = TextEditingController();
  final ResetPasswordUseCase resetPasswordUseCase;

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase
        .call(ResetPasswordModel(resetPassword: userEmailAddressCon.text));
    result.fold((failure) {
      message = failure.message;
      debugPrint(failure.toString());
      emit(ResetPasswordFailureState());
    }, (resetPassword) {
      print(resetPassword);
      message = resetPassword.resetPassword;
      emit(ResetPasswordSuccessState());
    });
  }
}

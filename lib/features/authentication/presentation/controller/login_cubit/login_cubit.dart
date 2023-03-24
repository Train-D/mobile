import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var loginUsernameCon = TextEditingController();
  var loginPasswordCon = TextEditingController();

  
  bool loginPasswordShown = true;
  IconData loginSuffIcon = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    loginSuffIcon = !loginPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    loginPasswordShown = !loginPasswordShown;
    emit(LoginChangesPasswordVisibilityState());
  }
}

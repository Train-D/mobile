import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  var signUpUsernameCon = TextEditingController();
  var signUpPasswordCon = TextEditingController();
  var signUpFirstNameCon = TextEditingController();
  var signUpLastNameCon = TextEditingController();
  var signUpEmailCon = TextEditingController();


  bool signUpPasswordShown = true;
  IconData signUpSuffIcon = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    signUpSuffIcon = !signUpPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    signUpPasswordShown = !signUpPasswordShown;
    emit(SignUpChangesPasswordVisibilityState());
  }
}

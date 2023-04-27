import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/authentication/data/models/register_request.dart';
import 'package:traind_app/features/authentication/data/models/register_response.dart';
import 'package:traind_app/features/authentication/domain/usecase/register_usecase.dart';

import '../../../domain/repository/register_domain_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.postRegisterDataUseCae) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

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
    emit(RegisterChangesPasswordVisibilityState());
  }

  final PostRegisterDataUseCase postRegisterDataUseCae;
  Future<void> userRegister(
      {required String firstName,
      required String lastName,
      required String password,
      required String email}) async {
    //print('$firstName $lastName $password $email');
    emit(RegisterLoadingState());
    final result = await postRegisterDataUseCae(RegisterRequestModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password));
    print(result);
    result.fold((l) {
      print('${l.message}\n');
      emit(RegisterErrorState(l.message));
    }, (r) {
      //print('${r.token}\n');
      RegisterResponse(token: r.token);
      emit(RegisterSuccessState());
    });
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/authentication/data/models/register_request.dart';
import 'package:traind_app/features/authentication/data/models/register_response.dart';
import 'package:traind_app/features/authentication/domain/usecase/register_usecase.dart';
import '../../../../../core/error/exceptions.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.postRegisterDataUseCase) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  var signUpUsernameCon = TextEditingController();
  var signUpPasswordCon = TextEditingController();
  var signUpFirstNameCon = TextEditingController();
  var signUpLastNameCon = TextEditingController();
  var signUpEmailCon = TextEditingController();
  var autoValidationMode = AutovalidateMode.disabled;
  var toastColor = Colors.green;
  bool signUpPasswordShown = true;
  IconData signUpSuffIcon = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    signUpSuffIcon = !signUpPasswordShown
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    signUpPasswordShown = !signUpPasswordShown;
    emit(RegisterChangesPasswordVisibilityState());
  }

  void changeToastColor() {
    if (state is RegisterSuccessState) {
      toastColor = Colors.green;
    } else {
      toastColor = Colors.red;
    }
    emit(changeToastColorState());
  }

  void changeAutoValidationMode() {
    if (autoValidationMode == AutovalidateMode.disabled) {
      autoValidationMode = AutovalidateMode.onUserInteraction;
    }
    emit(ChangeAutoValidationModeState());
  }

  final PostRegisterDataUseCase postRegisterDataUseCase;
  late RegisterResponseModel registerResponseModel;
  Future<void> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      final result = await postRegisterDataUseCase(
        RegisterRequestModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        ),
      );
      result.fold((l) {}, (r) {
        registerResponseModel = RegisterResponseModel.fromjson(
            {"token": r.token, "message": r.message});
      });
      emit(RegisterSuccessState());
    } on ServerException catch (e) {
      registerResponseModel = RegisterResponseModel.fromjson(
          {"token": "", "message": e.toString()});
      emit(RegisterErrorState(e.toString()));
    } on DioError catch (e) {
      registerResponseModel = RegisterResponseModel.fromjson({
        "token": "",
        "message":
            (e.response!.statusCode == 404 ? e.message : e.response.toString())
      });
      emit(RegisterErrorState(e.response));
    }
  }

  // Future<void> userRegister({
  //   required String firstName,
  //   required String lastName,
  //   required String password,
  //   required String email,
  // }) async {
  //   emit(RegisterLoadingState());

  //   final result = await postRegisterDataUseCase(
  //     RegisterRequestModel(
  //       firstName: firstName,
  //       lastName: lastName,
  //       email: email,
  //       password: password,
  //     ),
  //   );
  //   result.fold((l) {
  //     emit(RegisterErrorState(l.message));
  //   }, (r) {
  //     RegisterResponse(token: r.token);
  //     emit(RegisterSuccessState());
  //   });
  // }
}

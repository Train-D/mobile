// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/authentication/data/models/google_sign_in_response_model.dart';
import 'package:traind_app/features/authentication/domain/entities/response_entity.dart';

import '../../../../../core/error/exceptions.dart';
import '../../../data/models/auth_response_model.dart';
import '../../../data/models/register_request_model.dart';
import '../../../domain/usecase/google_sign_in_usecase.dart';
import '../../../domain/usecase/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(
    this.postRegisterDataUseCase,
    this.googleSignInUsecase,
  ) : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var registerFormKey = GlobalKey<FormState>();
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
    emit(ChangeToastColorState());
  }

  void changeAutoValidationMode() {
    if (autoValidationMode == AutovalidateMode.disabled) {
      autoValidationMode = AutovalidateMode.onUserInteraction;
    }
    emit(ChangeAutoValidationModeState());
  }

  final PostRegisterDataUseCase postRegisterDataUseCase;
  late AuthResponseModel authResponseModel;
  Future<void> userRegister({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    try {
      final result = await postRegisterDataUseCase(
        RegisterRequestModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          userName: userName,
          password: password,
        ),
      );
      result.fold((l) {}, (r) {
        authResponseModel = AuthResponseModel.fromjson(
            {"token": r.token, "message": r.message});
      });
      emit(RegisterSuccessState());
    } on ServerException catch (e) {
      authResponseModel =
          AuthResponseModel.fromjson({"token": '', "message": e.toString()});
      emit(RegisterErrorState(e.toString()));
    } on DioError catch (e) {
      authResponseModel = AuthResponseModel.fromjson({
        "token": "",
        "message": (e.response!.statusCode == 404
            ? e.message
            : e.response!.data['message'])
      });
      emit(RegisterErrorState(e.response));
    }
  }

  void registerClearData() {
    signUpUsernameCon.clear();
    signUpPasswordCon.clear();
    signUpFirstNameCon.clear();
    signUpLastNameCon.clear();
    signUpEmailCon.clear();
    emit(RegisterClearDataState());
  }

  GoogleSignInUsecase googleSignInUsecase;

  late ResponseEntity googleModel;

  Future<void> getGoogleSignInTokenFromBack(String idToken) async {
    emit(GetGoogleSignInTokenFromBackLoadingState());
    var result = await googleSignInUsecase
        .call(GoogleSignInRequestModel(idToken: idToken));
    result.fold((failure) {
      emit(GetGoogleSignInTokenFromBackFailureState());
      print(failure.toString());
    }, (r) {
      googleModel = r;
      emit(GetGoogleSignInTokenFromBackSuccessState());
      print(r.toString());
    });
  }
}

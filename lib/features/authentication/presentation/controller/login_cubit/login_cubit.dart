// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/authentication/data/models/login_request_model.dart';
import 'package:traind_app/features/authentication/domain/usecase/login_usecase.dart';

import '../../../data/models/auth_response_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this.postLoginDataUseCase,
  ) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  var loginFormKey = GlobalKey<FormState>();
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

  final PostLoginDataUseCase postLoginDataUseCase;
  late AuthResponseModel authresponseModel;

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final result = await postLoginDataUseCase(
        LoginRequestModel(
          userName: userName,
          password: password,
        ),
      );

      result.fold((l) => null, (r) async {
        authresponseModel = AuthResponseModel.fromjson(
            {"token": r.token, "message": r.message});
        //print(r.token);
        await CacheHelper.saveData(key: "token", value: r.token);
        debugPrint("token of user: ${r.token} \n ${r.message}");
        emit(LoginSuccessState());
      });
    } on ServerException catch (error) {
      authresponseModel = AuthResponseModel.fromjson(
          {"token": '', "message": error.toString()});
      emit(LoginErrorState());
    } on DioError catch (error) {
      authresponseModel = AuthResponseModel.fromjson({
        "token": '',
        "message": error.response!.statusCode == 404
            ? error.message
            : error.response!.data['message']
      });
      emit(LoginErrorState());
    }
  }

  Color loginToastColor = Colors.green;

  void loginChangeToastColor() {
     if (state is LoginSuccessState) {
      loginToastColor = Colors.green;
    } else {
      loginToastColor = Colors.red;
    }
    emit(LoginChangeToastColorState());
  }

  var loginAutoValidationMode = AutovalidateMode.disabled;
  void loginChangeAutoValidationMode() {
    if (loginAutoValidationMode == AutovalidateMode.disabled) {
      loginAutoValidationMode = AutovalidateMode.onUserInteraction;
    }
    emit(LoginChangeAutoValidationModeState());
  }

  void loginClearData() {
    loginUsernameCon.clear();
    loginPasswordCon.clear();
    emit(LoginClearDataState());
  }
}

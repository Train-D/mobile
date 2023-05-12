part of 'login_cubit.dart';

abstract class LoginState{}

class LoginInitial extends LoginState {}
class LoginChangesPasswordVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {}
class LoginErrorState extends LoginState {}

class LoginChangeToastColorState extends LoginState {}
class LoginChangeAutoValidationModeState extends LoginState {}

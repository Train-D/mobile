part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterChangesPasswordVisibilityState extends RegisterState {}

class ChangeAutoValidationModeState extends RegisterState{}

class ChangeToastColorState extends RegisterState{}

class RegisterSuccessState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  final dynamic message;
  RegisterErrorState(this.message);
}
class RegisterClearDataState extends RegisterState{}

class GetGoogleSignInTokenFromBackLoadingState extends RegisterState{}
class GetGoogleSignInTokenFromBackSuccessState extends RegisterState{}
class GetGoogleSignInTokenFromBackFailureState extends RegisterState{}


part of 'reset_password_cubit.dart';

abstract class ResetPasswordState{}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadingState extends ResetPasswordState{}
class ResetPasswordSuccessState extends ResetPasswordState{}
class ResetPasswordFailureState extends ResetPasswordState{}
part of 'change_password_cubit.dart';

abstract class ChangePasswordState{}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState{}
class ChangePasswordSuccessState extends ChangePasswordState{}
class ChangePasswordFailureState extends ChangePasswordState{}
class CurrChangesPasswordVisibilityState extends ChangePasswordState {}
class NewChangesPasswordVisibilityState extends ChangePasswordState {}
class ConfirmChangesPasswordVisibilityState extends ChangePasswordState {}
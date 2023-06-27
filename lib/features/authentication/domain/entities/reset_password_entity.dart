import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String resetPassword;
  ResetPasswordEntity({
    required this.resetPassword,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [resetPassword];
}

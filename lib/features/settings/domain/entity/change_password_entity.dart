import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  final String currPassword;
  final String newPassword;
  ChangePasswordEntity({
    required this.currPassword,
    required this.newPassword,
  });
  @override
  // TODO: implement props
  List<Object?> get props =>[currPassword, newPassword];
}

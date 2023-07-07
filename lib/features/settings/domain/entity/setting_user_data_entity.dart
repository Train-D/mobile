import 'package:equatable/equatable.dart';

class SettingUserDataEntity extends Equatable {
  final String userName;
  final String picture;
  SettingUserDataEntity({
    required this.userName,
    required this.picture,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [userName, picture];
}

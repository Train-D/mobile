import 'package:equatable/equatable.dart';

class ProfileImageEntity extends Equatable {
  final String image;
  ProfileImageEntity({
    required this.image,
  });
  @override
  // TODO: implement props
  List<Object> get props => [image];
}

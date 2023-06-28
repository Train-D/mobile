import 'package:traind_app/features/profile/domain/entities/profile_image_entity.dart';

class ProfileImageModel extends ProfileImageEntity {
  ProfileImageModel({required super.image});
  Map<String, dynamic> toJson() {
    return {'image': image};
  }

  factory ProfileImageModel.fromJson(Map<String, dynamic> json) {
    return ProfileImageModel(image: json['image']);
  }
}

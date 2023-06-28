import 'package:dartz/dartz.dart';
import 'package:traind_app/features/profile/domain/entities/profile_image_entity.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/profile_image_model.dart';

abstract class BaseProfileImageRepository {
  Future<Either<Failure, ProfileImageEntity>> getProfileImageUserData();
  Future<Either<Failure, ProfileImageEntity>> putProfileIage(ProfileImageModel parameters);
}

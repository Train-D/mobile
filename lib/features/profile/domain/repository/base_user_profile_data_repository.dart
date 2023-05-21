import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/data/models/profile_user_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_user_data_entity.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, ProfileUserDataEntity>> getProfileUserData();
  Future<Either<Failure, ProfileUserDataEntity>> putProfileUserData(ProfileUserDataModel parameters);
}
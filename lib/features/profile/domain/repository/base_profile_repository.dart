import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/profile_user_data_model.dart';
import '../entities/profile_user_data_entity.dart';

abstract class BaseProfileRepository {
  Future<Either<Failure, ProfileUserDataEntity>> getProfileUserData();
  Future<Either<Failure, ProfileUserDataEntity>> putProfileUserData(ProfileUserDataModel parameters);
}

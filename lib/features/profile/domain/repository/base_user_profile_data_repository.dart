import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/domain/entities/user_profile_data_entity.dart';

import '../../data/models/user_profile_data_model.dart';

abstract class BaseUserProfileDataRepository {
  Future<Either<Failure, UserProfileDataEntity>> getUserProfileData();
}

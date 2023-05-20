import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/data/models/user_profile_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/user_profile_data_entity.dart';
import 'package:traind_app/features/profile/domain/repository/base_user_profile_data_repository.dart';

class GetUserProfileDataUseCase {
  BaseUserProfileDataRepository baseUserProfileDataRepository;
  GetUserProfileDataUseCase(
    this.baseUserProfileDataRepository,
  );
  Future<Either<Failure, UserProfileDataEntity>> call() async {
    return await baseUserProfileDataRepository.getUserProfileData();
  }
}
/*class PutUserProfileDataUseCase {
  BaseUserProfileDataRepository baseUserProfileDataRepository;
  PutUserProfileDataUseCase(
    this.baseUserProfileDataRepository,
  );
  Future<Either<Failure, UserProfileDataEntity>> call() async {
    return await baseUserProfileDataRepository.putUserProfileData();
  }
}*/

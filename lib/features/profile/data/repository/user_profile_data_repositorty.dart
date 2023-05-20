import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/profile/data/data%20source/get_remote_user_profile_data.dart';
import 'package:traind_app/features/profile/domain/entities/user_profile_data_entity.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/features/profile/domain/repository/base_user_profile_data_repository.dart';

class UserProfileDataRepository extends BaseUserProfileDataRepository {
  final BaseGetRemoteUserProfileDataSource baseGetRemoteUserProfileDataSource;
  UserProfileDataRepository(this.baseGetRemoteUserProfileDataSource);
  @override
  Future<Either<Failure, UserProfileDataEntity>> getUserProfileData() async {
    final result = await baseGetRemoteUserProfileDataSource.getUserProfileRemoteData();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
  
  /*@override
  Future<Either<Failure, UserProfileDataEntity>> putUserProfileData() async{
    final result = await basePutRemoteUserProfileDataSource.putUserProfileRemoteData();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }*/
}

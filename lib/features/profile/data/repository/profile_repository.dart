// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/data/data%20source/profile_local_data_source.dart';
import 'package:traind_app/features/profile/data/data%20source/profile_remote_data_source.dart';
import 'package:traind_app/features/profile/data/models/profile_user_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_user_data_entity.dart';
import 'package:traind_app/features/profile/domain/repository/base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  ProfileRepository(
    this.profileRemoteDataSource,
    this.profileLocalDataSource,
  );

  @override
  Future<Either<Failure, ProfileUserDataEntity>> getProfileUserData() async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var userData;
      userData = profileLocalDataSource.getProfileUserData();
      if (userData != null) {
        //print('cached');
        return Right(userData);
      }
      //print('Not Cached');
      userData = await profileRemoteDataSource.getProfileUserData();
      return Right(userData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileUserDataEntity>> putProfileUserData(
      ProfileUserDataModel parameters) async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var userData = await profileRemoteDataSource.putProfileUserData(parameters);
      return Right(userData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

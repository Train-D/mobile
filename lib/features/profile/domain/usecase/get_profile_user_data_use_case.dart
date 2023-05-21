// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/profile/domain/repository/base_profile_repository.dart';

import '../entities/profile_user_data_entity.dart';

class GetProfileUserDataUsecase extends BaseUsecase<ProfileUserDataEntity, NoParameters> {
  final BaseProfileRepository baseProfileRepository;

  GetProfileUserDataUsecase(
    this.baseProfileRepository,
  );
  
  @override
  Future<Either<Failure, ProfileUserDataEntity>> call(NoParameters parameters) async{
    return await baseProfileRepository.getProfileUserData();
  }
}

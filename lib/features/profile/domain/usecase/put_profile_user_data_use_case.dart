// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/profile/data/models/profile_user_data_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_user_data_entity.dart';

import '../repository/base_profile_repository.dart';

class PutProfileUserDataUseCase
    extends BaseUsecase<ProfileUserDataEntity, ProfileUserDataModel> {

  final BaseProfileRepository baseProfileRepository;
  
  PutProfileUserDataUseCase(this.baseProfileRepository);

  @override
  Future<Either<Failure, ProfileUserDataEntity>> call(ProfileUserDataModel parameters) async {
    return await baseProfileRepository.putProfileUserData(parameters);
  }
}

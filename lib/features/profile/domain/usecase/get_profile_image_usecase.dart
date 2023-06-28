import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/domain/entities/profile_image_entity.dart';

import '../../../../core/usecases/base_usecase.dart';
import '../repository/base_profile_image_repository.dart';

class GetProfileImageUseCase
    extends BaseUsecase<ProfileImageEntity, NoParameters> {
  final BaseProfileImageRepository baseProfileImageRepository;

  GetProfileImageUseCase(this.baseProfileImageRepository);
  @override
  Future<Either<Failure, ProfileImageEntity>> call(
      NoParameters parameters) async {
    return await baseProfileImageRepository.getProfileImageUserData();
  }
}

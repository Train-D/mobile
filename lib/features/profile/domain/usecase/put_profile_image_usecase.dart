import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/profile/data/models/profile_image_model.dart';
import 'package:traind_app/features/profile/domain/entities/profile_image_entity.dart';

import '../../../../core/usecases/base_usecase.dart';
import '../repository/base_profile_image_repository.dart';

class PutProfileImageUseCase
    extends BaseUsecase<ProfileImageEntity, ProfileImageModel> {
  final BaseProfileImageRepository baseProfileImageRepository;

  PutProfileImageUseCase(this.baseProfileImageRepository);

  @override
  Future<Either<Failure, ProfileImageEntity>> call(
      ProfileImageModel parameters) async {
    return await baseProfileImageRepository.putProfileIage(parameters);
  }
}

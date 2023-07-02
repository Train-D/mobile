// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/track/domain/entities/track_entity.dart';
import 'package:traind_app/features/track/domain/repository/base_track_repository.dart';

class GetTrackInfoUsecase extends BaseUsecase<TrackEntity, String> {
  final BaseTrackRepository baseTrackRepository;
  GetTrackInfoUsecase(
     this.baseTrackRepository,
  );
  @override
  Future<Either<Failure, TrackEntity>> call(String parameters) async {
    return await baseTrackRepository.getTrackInfo(parameters);
  }
}

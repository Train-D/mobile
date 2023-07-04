import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/track/data/data%20source/train_tracking_remote_data_source.dart';
import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';
import 'package:traind_app/features/track/domain/repository/base_train_tracking_repository.dart';

class TrainTrackingRepository extends BaseTrainTrackingRepository {
  final TrainTrackingRemoteDataSource trackingRemoteDataSource;
  TrainTrackingRepository({
    required this.trackingRemoteDataSource,
  });
  @override
  Future<Either<Failure, TrainTrackingEntity>> getTrainTrackingData() async {
    try {
      TrainTrackingEntity trainTrackingEntity =
          await trackingRemoteDataSource.getTrainTrackingInfo();
      return Right(trainTrackingEntity);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

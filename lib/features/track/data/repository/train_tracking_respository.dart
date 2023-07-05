import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/train_tracking_entity.dart';
import '../../domain/repository/base_train_tracking_repository.dart';
import '../data%20source/train_tracking_remote_data_source.dart';

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

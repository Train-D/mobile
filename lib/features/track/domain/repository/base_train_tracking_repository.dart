import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';

abstract class BaseTrainTrackingRepository {
  Future<Either<Failure, TrainTrackingEntity>> getTrainTrackingData();
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/train_tracking_entity.dart';

abstract class BaseTrainTrackingRepository {
  Future<Either<Failure, TrainTrackingEntity>> getTrainTrackingData();
}

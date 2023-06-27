import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/first%20screen/trip_info_model.dart';
import '../entities/second%20screen/train_info_entity.dart';

abstract class BaseTrainInfoRepository {
  Future<Either<Failure, TrainInfoEntity>> trainInfo(TripInfoModel parameters);
}

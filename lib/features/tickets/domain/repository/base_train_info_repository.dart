import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/trip_info_model.dart';
import 'package:traind_app/features/tickets/domain/entities/train_info_entity.dart';

abstract class BaseTrainInfoRepository {
  Future<Either<Failure, TrainInfoEntity>> trainInfo(TripInfoModel parameters);
}

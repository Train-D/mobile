import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/domain/entities/trip_times_entity.dart';

abstract class BaseTripTimesRepository {
  Future<Either<Failure, TripTimesEntity>> getTripTimesData(
      FromToDateModel parameter);
}

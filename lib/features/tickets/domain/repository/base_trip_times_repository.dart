import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/first%20screen/from_to_date_model.dart';
import '../entities/first%20screen/trip_times_entity.dart';

abstract class BaseTripTimesRepository {
  Future<Either<Failure, TripTimesEntity>> getTripTimesData(
      FromToDateModel parameter);
}

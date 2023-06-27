import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../data%20source/trip_times_remote_data_source.dart';
import '../models/first%20screen/from_to_date_model.dart';
import '../../domain/entities/first%20screen/trip_times_entity.dart';
import '../../domain/repository/base_trip_times_repository.dart';

class TripTimesRepository extends BaseTripTimesRepository {
  final BaseTripTimesRemoteDataSource baseTripTimesRemoteDataSource;

  TripTimesRepository(this.baseTripTimesRemoteDataSource);
  @override
  Future<Either<Failure, TripTimesEntity>> getTripTimesData(
      FromToDateModel parameter) async {
    final result = await baseTripTimesRemoteDataSource.tripTimesData(parameter);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}

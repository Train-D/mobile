import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/stations/domain/entities/station_details_entity.dart';

abstract class BaseStationDetailsRepository {
  Future<Either<Failure, StationDetailsEntity>> getStationDetailsByName(
      String stationName);
}

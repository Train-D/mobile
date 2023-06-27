import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/station_details_entity.dart';

abstract class BaseStationDetailsRepository {
  Future<Either<Failure, StationDetailsEntity>> getStationDetailsByName(
      String stationName);
}

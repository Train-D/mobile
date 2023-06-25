import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/domain/entities/first%20screen/stations_entity.dart';

abstract class BaseGetStationsRepository {
  Future<Either<Failure, StationsEntity>> getStations();
}

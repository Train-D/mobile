import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/first%20screen/stations_entity.dart';

abstract class BaseGetStationsRepository {
  Future<Either<Failure, StationsEntity>> getStations();
}

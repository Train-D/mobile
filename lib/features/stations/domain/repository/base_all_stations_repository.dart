import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/stations/domain/entities/all_stations_names_entity.dart';

abstract class BaseAllStationsNamesRepository {
  Future<Either<Failure, AllStationsNamesEntity>> getAllStationsNames();
}
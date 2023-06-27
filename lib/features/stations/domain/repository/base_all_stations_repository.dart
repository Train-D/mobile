import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/all_stations_names_entity.dart';

abstract class BaseAllStationsNamesRepository {
  Future<Either<Failure, AllStationsNamesEntity>> getAllStationsNames();
}
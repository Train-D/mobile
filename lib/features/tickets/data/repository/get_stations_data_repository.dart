import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/data%20source/get_remote_stations_data.dart';
import 'package:traind_app/features/tickets/domain/entities/stations_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/get_stations_repository.dart';

import '../data source/fromto_local_data_source.dart';

class StationsRepository extends BaseGetStationsRepository {
  final BaseGetRemoteStationsDataSource baseGetRemoteStationsDataSource;
  final FromToLocalDataSource fromToLocalDataSource;
  StationsRepository(
      this.baseGetRemoteStationsDataSource, this.fromToLocalDataSource);

  @override
  Future<Either<Failure, StationsEntity>> getStations() async {
    try {
      var fromToStations;
      fromToStations = fromToLocalDataSource.getFromToStations();
      if (fromToStations != null) {
        print('stations names cached');
        return Right(fromToStations);
      }
      print('stations names not cached');
      fromToStations = await baseGetRemoteStationsDataSource.getStationsData();
      return Right(fromToStations);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
}

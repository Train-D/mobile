import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../data%20source/get_remote_stations_data.dart';
import '../../domain/entities/first%20screen/stations_entity.dart';
import '../../domain/repository/base_stations_repository.dart';

import '../data source/fromto_local_data_source.dart';

class StationsRepository extends BaseGetStationsRepository {
  final BaseGetRemoteStationsDataSource baseGetRemoteStationsDataSource;
  final FromToLocalDataSource fromToLocalDataSource;
  StationsRepository(
      this.baseGetRemoteStationsDataSource, this.fromToLocalDataSource);

  @override
  Future<Either<Failure, StationsEntity>> getStations() async {
    try {
      StationsEntity? fromToStations;
      fromToStations = fromToLocalDataSource.getFromToStations();
      if (fromToStations != null) {
        //print('stations names cached');
        return Right(fromToStations);
      }
      //print('stations names not cached');
      fromToStations = await baseGetRemoteStationsDataSource.getStationsData();
      return Right(fromToStations);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
}

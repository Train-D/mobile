// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/stations/data/data%20source/station_details_local_data_source.dart';
import 'package:traind_app/features/stations/data/data%20source/station_details_remote_data_source.dart';
import 'package:traind_app/features/stations/domain/entities/station_details_entity.dart';
import 'package:traind_app/features/stations/domain/repository/base_station_details_repository.dart';

class StationDetailsRepository extends BaseStationDetailsRepository {
  final StationDetailsLocalDataSource stationDetailsLocalDataSource;
  final StationDetailsRemoteDataSource stationDetailsRemoteDataSource;

  StationDetailsRepository(
    this.stationDetailsLocalDataSource,
    this.stationDetailsRemoteDataSource,
  );

  @override
  Future<Either<Failure, StationDetailsEntity>> getStationDetailsByName(
      String stationName) async {
    try {
      var stationDetails;
      stationDetails =
          stationDetailsLocalDataSource.getStationDetailsByName(stationName);
      if (stationDetails != null) {
        print('Station Details Cached');
        return Right(stationDetails);
      }
      print('Station Details Not Cached');
      stationDetails = await stationDetailsRemoteDataSource
          .getStationDetailsByName(stationName);
      return Right(stationDetails);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

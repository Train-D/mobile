// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/stations/data/data%20source/all_stations_names_local_data_source.dart';
import 'package:traind_app/features/stations/data/data%20source/all_stations_names_remote_data_source.dart';
import 'package:traind_app/features/stations/domain/entities/all_stations_names_entity.dart';
import 'package:traind_app/features/stations/domain/repository/base_all_stations_repository.dart';

class AllStationsNamesRepository extends BaseAllStationsNamesRepository {
  final AllStationsNamesLocalDataSource allStationsNamesLocalDataSource;
  final AllStationsNamesRemoteDataSource allStationsNamesRemoteDataSource;
  AllStationsNamesRepository(
    this.allStationsNamesLocalDataSource,
    this.allStationsNamesRemoteDataSource,
  );

  @override
  Future<Either<Failure, AllStationsNamesEntity>> getAllStationsNames() async {
    try {
      AllStationsNamesEntity? allStationsNames;
      allStationsNames = allStationsNamesLocalDataSource.getAllStationsNames();
      if (allStationsNames != null) {
        //print('stations names cached');
        return Right(allStationsNames);
      }
      //print('stations names not cached');
      allStationsNames = await allStationsNamesRemoteDataSource.getAllStationsNames();
      return Right(allStationsNames);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

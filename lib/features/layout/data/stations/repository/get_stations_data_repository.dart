import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/layout/data/stations/data%20source/get_remote_stations_data.dart';
import 'package:traind_app/features/layout/domain/stations/entity/stations_entity.dart';
import 'package:traind_app/features/layout/domain/stations/repository/get_stations_repository.dart';

class StationsRepository extends BaseGetStationsRepository {
  final BaseGetRemoteStationsDataSource baseGetRemoteStationsDataSource;

  StationsRepository(this.baseGetRemoteStationsDataSource);

  @override
  Future<Either<Failure, StationsEntity>> getStations() async{
    final result = await baseGetRemoteStationsDataSource.getStationsData();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
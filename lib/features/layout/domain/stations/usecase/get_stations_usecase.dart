import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/features/layout/domain/stations/entity/stations_entity.dart';
import 'package:traind_app/features/layout/domain/stations/repository/get_stations_repository.dart';

class GetStationsUseCase {
  BaseGetStationsRepository baseGetStationsRepository;
  GetStationsUseCase(this.baseGetStationsRepository);
  @override
  Future<Either<Failure, StationsEntity>> call() async {
    return await baseGetStationsRepository.getStations();
  }
}

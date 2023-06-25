import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/features/tickets/domain/entities/first%20screen/stations_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_stations_repository.dart';

class GetStationsUseCase {
  BaseGetStationsRepository baseGetStationsRepository;
  GetStationsUseCase(this.baseGetStationsRepository);
  Future<Either<Failure, StationsEntity>> call() async {
    return await baseGetStationsRepository.getStations();
  }
}

import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/first%20screen/stations_entity.dart';
import '../repository/base_stations_repository.dart';

class GetStationsUseCase {
  BaseGetStationsRepository baseGetStationsRepository;
  GetStationsUseCase(this.baseGetStationsRepository);
  Future<Either<Failure, StationsEntity>> call() async {
    return await baseGetStationsRepository.getStations();
  }
}

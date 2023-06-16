import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/stations/domain/entities/all_stations_names_entity.dart';
import 'package:traind_app/features/stations/domain/repository/base_all_stations_repository.dart';

class GetAllStationsNamesUseCase
    extends BaseUsecase<AllStationsNamesEntity, NoParameters> {
  final BaseAllStationsNamesRepository baseAllStationsNamesRepository;

  GetAllStationsNamesUseCase(this.baseAllStationsNamesRepository);
  @override
  Future<Either<Failure, AllStationsNamesEntity>> call(
      NoParameters parameters) async {
    return await baseAllStationsNamesRepository.getAllStationsNames();
  }
}

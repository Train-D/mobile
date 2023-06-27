import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/all_stations_names_entity.dart';
import '../repository/base_all_stations_repository.dart';

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

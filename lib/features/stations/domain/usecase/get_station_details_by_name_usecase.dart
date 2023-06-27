import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/station_details_entity.dart';
import '../repository/base_station_details_repository.dart';

class GetStationDetailsByNameUseCase
    extends BaseUsecase<StationDetailsEntity, String> {
  final BaseStationDetailsRepository baseStationDetailsRepository;
  GetStationDetailsByNameUseCase(this.baseStationDetailsRepository);
  
  @override
  Future<Either<Failure, StationDetailsEntity>> call(String parameters) async {
    return await baseStationDetailsRepository
        .getStationDetailsByName(parameters);
  }
}

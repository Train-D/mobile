import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/stations/domain/entities/station_details_entity.dart';
import 'package:traind_app/features/stations/domain/repository/base_station_details_repository.dart';

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

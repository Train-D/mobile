import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';
import '../../data/models/first%20screen/from_to_date_model.dart';
import '../entities/first%20screen/trip_times_entity.dart';
import '../repository/base_trip_times_repository.dart';


class TripTimesDataUsecase extends BaseUsecase<TripTimesEntity,FromToDateModel>{
  final BaseTripTimesRepository baseTripTimesRepository;

  TripTimesDataUsecase(this.baseTripTimesRepository);

  @override
  Future<Either<Failure, TripTimesEntity>> call(FromToDateModel parameters) async{
    return await baseTripTimesRepository.getTripTimesData(parameters);
  } 
}


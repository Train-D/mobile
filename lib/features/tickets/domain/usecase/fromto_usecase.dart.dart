import 'package:dartz/dartz.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';
import 'package:traind_app/features/tickets/domain/repository/fromto_domain_repository.dart';
import '../../../../../core/error/failure.dart';
import '../../../../../core/usecases/base_usecase.dart';


class PostFromToDateDataUsecase extends BaseUsecase<ScheduleDataEntity,FromToDateModel>{
  final BaseFromToDateRepository baseFromToDateRepository;

  PostFromToDateDataUsecase(this.baseFromToDateRepository);

  @override
  Future<Either<Failure, ScheduleDataEntity>> call(FromToDateModel parameters) async{
    return await baseFromToDateRepository.postFromToDateData(parameters);
  } 
}


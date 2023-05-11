import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';

abstract class BaseFromToDateRepository {
  Future<Either<Failure, ScheduleDataEntity>> postFromToDateData(
      FromToDateModel parameter);
}

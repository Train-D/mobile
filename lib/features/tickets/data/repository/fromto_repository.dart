import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import 'package:traind_app/features/tickets/data/data%20source/fromto_data_sorce.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/domain/entities/schedule_data.dart';
import 'package:traind_app/features/tickets/domain/repository/fromto_domain_repository.dart';

class FromToDateRepository extends BaseFromToDateRepository {
  final BaseFromToDateRemoteDataSource baseFromToDateRemoteDataSource;

  FromToDateRepository(this.baseFromToDateRemoteDataSource);
  @override
  Future<Either<Failure, ScheduleDataEntity>> postFromToDateData(
      FromToDateModel parameter) async {
    final result = await baseFromToDateRemoteDataSource.postFromToDateData(parameter);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';

import '../../domain/entities/second screen/train_info_entity.dart';
import '../../domain/repository/base_train_info_repository.dart';
import '../data source/train_info_remote_data_source.dart';
import '../models/first screen/trip_info_model.dart';

class TrainInfoRepository extends BaseTrainInfoRepository {
  final TrainInfoRemoteDataSource trainInfoRemoteDataSource;
  TrainInfoRepository(
    this.trainInfoRemoteDataSource,
  );
  @override
  Future<Either<Failure, TrainInfoEntity>> trainInfo(
      TripInfoModel parameters) async {
    try {
      var trainInfoData = await trainInfoRemoteDataSource.trainInfo(parameters);
      return Right(trainInfoData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

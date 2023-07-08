// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';

import '../../data/models/first screen/trip_info_model.dart';
import '../entities/second screen/train_info_entity.dart';
import '../repository/base_train_info_repository.dart';

class TrainInfoUseCase extends BaseUsecase<TrainInfoEntity, TripInfoModel> {
  final BaseTrainInfoRepository baseTrainInfoRepository;
  TrainInfoUseCase(
    this.baseTrainInfoRepository,
  );
  @override
  Future<Either<Failure, TrainInfoEntity>> call(TripInfoModel parameters) async{
    return await baseTrainInfoRepository.trainInfo(parameters);
  }
}

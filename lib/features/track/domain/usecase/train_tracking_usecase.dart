import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';
import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';
import 'package:traind_app/features/track/domain/repository/base_train_tracking_repository.dart';

class TrainTrackingUseCase
    extends BaseUsecase<TrainTrackingEntity, NoParameters> {
  final BaseTrainTrackingRepository baseTrainTrackingRepository;

  TrainTrackingUseCase(this.baseTrainTrackingRepository);
  @override
  Future<Either<Failure, TrainTrackingEntity>> call(
      NoParameters parameters) async {
    return await baseTrainTrackingRepository.getTrainTrackingData();
  }
}

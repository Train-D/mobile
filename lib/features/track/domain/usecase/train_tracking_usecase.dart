import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/train_tracking_entity.dart';
import '../repository/base_train_tracking_repository.dart';

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

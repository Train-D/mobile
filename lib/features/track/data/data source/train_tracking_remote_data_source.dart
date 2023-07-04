import 'package:firebase_database/firebase_database.dart';

import 'package:traind_app/features/track/data/models/train_tracking_model.dart';
import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';

import '../../../../core/services/api_service.dart';

abstract class TrainTrackingRemoteDataSource {
  Future<TrainTrackingEntity> getTrainTrackingInfo();
}

class TrainTrackingRemoteDataSourceImpl extends TrainTrackingRemoteDataSource {
  final ApiService apiService;
  TrainTrackingRemoteDataSourceImpl({
    required this.apiService,
  });
  

  @override
  Future<TrainTrackingEntity> getTrainTrackingInfo() async{
    var data = await apiService.get(endPoint: 'https://esp32-gps-firebase-8ac4c-default-rtdb.firebaseio.com');
    TrainTrackingEntity trainTrackingEntity = TrainTrackingModel.fromJson(data);
    return trainTrackingEntity;
  }
}

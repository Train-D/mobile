import 'package:firebase_database/firebase_database.dart';
import 'package:traind_app/features/track/data/models/train_tracking_model.dart';
import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';

abstract class TrainTrackingRemoteDataSource {
  Future<TrainTrackingEntity> getTrainTrackingInfo();
}

class TrainTrackingRemoteDataSourceImpl extends TrainTrackingRemoteDataSource {
  DatabaseReference databaseReference = FirebaseDatabase.instance
      .ref('https://esp32-gps-firebase-8ac4c-default-rtdb.firebaseio.com/');

  @override
  Future<TrainTrackingEntity> getTrainTrackingInfo() async{
    
    TrainTrackingEntity trackingEntity = TrainTrackingModel.fromJson({});
    return trackingEntity;
  }
}

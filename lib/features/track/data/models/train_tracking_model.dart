import 'package:traind_app/features/track/domain/entities/train_tracking_entity.dart';

class TrainTrackingModel extends TrainTrackingEntity {
  TrainTrackingModel(
      {required super.latitude,
      required super.longitude,
      required super.speed});
  factory TrainTrackingModel.fromJson(Map<String, dynamic> json) {
    return TrainTrackingModel(
        latitude: json['latitude'].toDouble,
        longitude: json['longitude'].toDouble,
        speed: json['speed'].toDouble);
  }
}

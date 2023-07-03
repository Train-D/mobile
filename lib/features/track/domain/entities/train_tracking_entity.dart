import 'package:equatable/equatable.dart';

class TrainTrackingEntity extends Equatable {
  final double latitude;
  final double longitude;
  final double speed;
  TrainTrackingEntity({
    required this.latitude,
    required this.longitude,
    required this.speed,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [latitude, longitude, speed];
}

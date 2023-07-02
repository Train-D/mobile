// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TrackEntity extends Equatable {
  String fromStation;
  String startTime;
  String arrivalTime;
  int trainId;
  double longitude;
  double latitude;
  TrackEntity({
    required this.fromStation,
    required this.startTime,
    required this.arrivalTime,
    required this.trainId,
    required this.longitude,
    required this.latitude,
  });

  @override
  List<Object?> get props => [
        fromStation,
        startTime,
        arrivalTime,
        trainId,
        longitude,
        latitude,
      ];
}

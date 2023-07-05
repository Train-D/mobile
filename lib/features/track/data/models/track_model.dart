import '../../domain/entities/track_entity.dart';

class TrackModel extends TrackEntity {
  TrackModel({
    required super.fromStation,
    required super.startTime,
    required super.arrivalTime,
    required super.trainId,
    required super.longitude,
    required super.latitude,
  });

  factory TrackModel.fromJson(Map<String, dynamic> json) {
    return TrackModel(
      fromStation: json['fromStation'],
      startTime: json['startTime'],
      arrivalTime: json['arrivalTime'],
      trainId: json['trainId'],
      longitude: json['longitude'],
      latitude: json['latitude'],
    );
  }
}

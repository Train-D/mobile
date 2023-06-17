// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:traind_app/features/stations/domain/entities/station_details_entity.dart';

class StationDetailsModel extends StationDetailsEntity {
  StationDetailsModel({
    required super.stationName,
    required super.stationInfo,
    required super.address,
    required super.hoursOpen,
    required super.phone,
  });

  factory StationDetailsModel.fromJson(Map<String, dynamic> json) {
    return StationDetailsModel(
      stationName: json['stationName'],
      stationInfo: json['stationInfo'],
      address: json['address'],
      hoursOpen: json['hoursOpen'],
      phone: json['phone'],
    );
  }
}

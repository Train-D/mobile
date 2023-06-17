// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class StationDetailsEntity extends Equatable {
  String stationName;
  String stationInfo;
  String address;
  int hoursOpen;
  String phone;
  StationDetailsEntity({
    required this.stationName,
    required this.stationInfo,
    required this.address,
    required this.hoursOpen,
    required this.phone,
  });

  @override
  List<Object?> get props => [
        stationName,
        stationInfo,
        address,
        hoursOpen,
        phone,
      ];
}

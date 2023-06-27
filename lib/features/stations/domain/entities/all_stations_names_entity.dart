// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllStationsNamesEntity extends Equatable {
  Map<String, dynamic> allStationsNames;
  AllStationsNamesEntity({
    required this.allStationsNames,
  });

  @override
  List<Object?> get props => [
        allStationsNames,
      ];
}

// class StationEntity extends Equatable {
//   String stationChar;
//   List<String> stationCharNames;
//   StationEntity({
//     required this.stationChar,
//     required this.stationCharNames,
//   });

//   List<Object?> get props => [
//         stationChar,
//         stationCharNames,
//       ];
// }

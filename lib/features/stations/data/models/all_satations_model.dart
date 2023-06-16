import 'package:traind_app/features/stations/domain/entities/all_stations_names_entity.dart';

class AllStationsNamesModel extends AllStationsNamesEntity{
  AllStationsNamesModel({required super.allStationsNames});
  factory AllStationsNamesModel.fromJson(Map<String, dynamic> json){
    return AllStationsNamesModel(
      allStationsNames: json,
    );
  }
}
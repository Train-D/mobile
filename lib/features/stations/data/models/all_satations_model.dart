import '../../domain/entities/all_stations_names_entity.dart';

// ignore: must_be_immutable
class AllStationsNamesModel extends AllStationsNamesEntity{
  AllStationsNamesModel({required super.allStationsNames});
  factory AllStationsNamesModel.fromJson(Map<String, dynamic> json){
    return AllStationsNamesModel(
      allStationsNames: json,
    );
  }
}
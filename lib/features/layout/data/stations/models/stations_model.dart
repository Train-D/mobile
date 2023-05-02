
import 'package:traind_app/features/layout/domain/stations/entity/stations_entity.dart';

class StationsModel extends StationsEntity{
  
  const StationsModel({required super.stations});
  
  factory StationsModel.fromjson(Map<String, dynamic> s) {
    return StationsModel(stations: s);
  }
}
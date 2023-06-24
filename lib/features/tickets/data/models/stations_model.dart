
import 'package:traind_app/features/tickets/domain/entities/stations_entity.dart';

class StationsModel extends StationsEntity{
  
  const StationsModel({required super.stations});
  
  factory StationsModel.fromJson(Map<String, dynamic> s) {
    return StationsModel(stations: s);
  }

}
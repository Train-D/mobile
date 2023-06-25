import 'package:equatable/equatable.dart';
import 'package:traind_app/features/tickets/data/models/first%20screen/stations_model.dart';
class StationsEntity extends Equatable {
  final Map<String, dynamic> stations;
  const StationsEntity({
    required this.stations,
  });
  factory StationsEntity.toEntity(StationsModel stationsModel) {
    return StationsEntity(stations: stationsModel.stations);
  }
  @override
  List<Object?> get props =>[stations];

}

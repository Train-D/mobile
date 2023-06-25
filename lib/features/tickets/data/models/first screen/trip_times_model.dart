import 'package:traind_app/features/tickets/domain/entities/first%20screen/trip_times_entity.dart';

// ignore: must_be_immutable
class TripTimesModel extends TripTimesEntity{
  TripTimesModel({required super.tripTimes});
  factory TripTimesModel.fromjson(List<dynamic> res) {
    return TripTimesModel(tripTimes: res);
  }
}
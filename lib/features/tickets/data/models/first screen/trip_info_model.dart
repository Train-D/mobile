import '../../../domain/entities/first%20screen/trip_info_entity.dart';

class TripInfoModel extends TripInfoEntity {
  const TripInfoModel({
    required super.tripId,
    required super.tripDate,
  });
 Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic> {};
    data['tripId'] = tripId;
    data['date'] = tripDate;
    return data;
  }
}

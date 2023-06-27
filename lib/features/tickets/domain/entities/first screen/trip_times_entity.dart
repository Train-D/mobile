import 'package:equatable/equatable.dart';
import '../../../data/models/first%20screen/trip_times_model.dart';

// ignore: must_be_immutable
class TripTimesEntity extends Equatable {
  final List<dynamic> tripTimes;
  const TripTimesEntity({
    required this.tripTimes,
  });

  @override
  List<Object?> get props => [tripTimes];
  factory TripTimesEntity.toEntity(TripTimesModel scheduleModel) {
    return TripTimesEntity(tripTimes: scheduleModel.tripTimes);
  }
}

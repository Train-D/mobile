// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TripInfoEntity extends Equatable {
  final int tripId;
  final String tripDate;
  const TripInfoEntity({
    required this.tripId,
    required this.tripDate,
  });

  @override
  List<Object?> get props => [
        tripId,
        tripDate,
      ];
}

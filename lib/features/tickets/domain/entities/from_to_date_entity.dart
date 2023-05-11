import 'package:equatable/equatable.dart';

class FromToDateEntity extends Equatable {
  final String fromStation;
  final String toStation;
  final String date;

  const FromToDateEntity({required this.fromStation, required this.toStation, required this.date});

  @override
  List<Object?> get props => [
        fromStation,
        toStation,
        date
      ];
}

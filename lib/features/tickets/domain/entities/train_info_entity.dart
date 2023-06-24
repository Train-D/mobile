// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:traind_app/features/tickets/domain/entities/seat_entity.dart';

import 'class_entity.dart';

class TrainInfoEntity extends Equatable {
  final List<ClassEntity> classes;
  final List<SeatEntity> seats;
  const TrainInfoEntity({
    required this.classes,
    required this.seats,
  });
  @override
  List<Object?> get props => [
        classes,
        seats,
      ];
}



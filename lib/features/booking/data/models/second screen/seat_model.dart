
import '../../../domain/entities/second screen/seat_entity.dart';

class SeatModel extends SeatEntity {
  const SeatModel({
    required super.seatNumber,
    required super.coach,
    required super.classChar,
  });
  factory SeatModel.fromJson(Map<String, dynamic> json) {
    return SeatModel(
      seatNumber: json['seatNumber'],
      coach: json['coach'],
      classChar: json['class'],
    );
  }
}
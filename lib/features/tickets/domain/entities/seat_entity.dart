import 'package:equatable/equatable.dart';

class SeatEntity extends Equatable {
  final int seatNumber;
  final int coach;
  final String classChar;
  const SeatEntity({
    required this.seatNumber,
    required this.coach,
    required this.classChar,
  });
  @override
  List<Object?> get props => [
        seatNumber,
        coach,
        classChar,
      ];
}

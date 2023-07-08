import 'package:equatable/equatable.dart';

class BookingTicketEntity extends Equatable {
  final int tripId;
  final String date;
  final int seatNumber;
  final int coach;
  final String classs;
  final double amount;
  final String paymentId;
  const BookingTicketEntity({
    required this.tripId,
    required this.date,
    required this.seatNumber,
    required this.coach,
    required this.classs,
    required this.amount,
    required this.paymentId,
  });
  @override
  List<Object?> get props => [tripId, date, seatNumber, coach, classs, amount, paymentId];
}

import 'package:equatable/equatable.dart';

class TicketInfoEntity extends Equatable {
  final String from;
  final String to;
  final String startTime;
  final String endTime;
  final dynamic ticketId;
  final String passengerName;
  final String date;
  final String className;
  final int coachNumber;
  final int seatNumber;
  final double price;
  final String duration;
  TicketInfoEntity({
    required this.from,
    required this.to,
    required this.startTime,
    required this.endTime,
    required this.ticketId,
    required this.passengerName,
    required this.date,
    required this.className,
    required this.coachNumber,
    required this.seatNumber,
    required this.price,
    required this.duration
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        from,
        to,
        startTime,
        endTime,
        ticketId,
        passengerName,
        date,
        className,
        coachNumber,
        seatNumber,
        price
      ];
}

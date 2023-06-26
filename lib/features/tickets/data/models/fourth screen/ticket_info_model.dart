import 'package:traind_app/features/tickets/domain/entities/fourth%20screen/ticket_info_entity.dart';

class TicketInfoModel extends TicketInfoEntity {
  TicketInfoModel(
      {required super.from,
      required super.to,
      required super.startTime,
      required super.endTime,
      required super.ticketId,
      required super.passengerName,
      required super.date,
      required super.className,
      required super.coachNumber,
      required super.seatNumber,
      required super.price,
      required super.duration});
  factory TicketInfoModel.fromJson(Map<String, dynamic> json) {
    return TicketInfoModel(
        from: json['from'],
        to: json['to'],
        startTime: json['startTime'],
        endTime: json['endTime'],
        ticketId: json['ticketId'],
        passengerName: json['passengerName'],
        date: json['date'],
        className: json['className'],
        coachNumber: json['coachNumber'],
        seatNumber: json['seatNumber'],
        price: json['price'],
        duration: json['duration']);
  }
}

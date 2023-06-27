import '../../../domain/entities/fourth%20screen/booking_ticket_entity.dart';

class BookingTicketModel extends BookingTicketEntity {
  const BookingTicketModel(
      {required super.tripId,
      required super.date,
      required super.seatNumber,
      required super.coach,
      required super.classs,
      required super.amount,
      required super.paymentId});
  Map<String, dynamic> toJson() {
    return {
      "tripId": tripId,
      "date": date,
      "seatNumber": seatNumber,
      "coach": coach,
      "class": classs,
      "amount": amount,
      "paymentId": paymentId
    };
  }
}

import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/fourth%20screen/booking_ticket_model.dart';
import 'package:traind_app/features/tickets/domain/entities/fourth%20screen/ticket_info_entity.dart';

abstract class BaseBookingTicketRepository {
  Future<Either<Failure, TicketInfoEntity>> ticketInfor(
      BookingTicketModel parameters);
}

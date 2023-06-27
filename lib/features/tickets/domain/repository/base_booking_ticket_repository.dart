import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/fourth%20screen/booking_ticket_model.dart';
import '../entities/fourth%20screen/ticket_info_entity.dart';

abstract class BaseBookingTicketRepository {
  Future<Either<Failure, TicketInfoEntity>> ticketInfor(
      BookingTicketModel parameters);
}

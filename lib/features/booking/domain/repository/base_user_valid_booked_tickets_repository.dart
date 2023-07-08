import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/all tickets/cancel_payment_request_model.dart';
import '../entities/all tickets/cancel_payment_request_entity.dart';
import '../entities/all tickets/cancel_payment_response_entity.dart';
import '../entities/all%20tickets/user_valid_booked_tickets_entity.dart';

import '../entities/all tickets/cancel_ticket_response_entity.dart';

abstract class BaseUserValidBookedTicketsRepository {
  Future<Either<Failure, UserValidBookedTicketsEntity>>
      getUserValidBookedTickets();

  Future<Either<Failure, CancelTicketResponseEntity>> cancelTicket(
      String ticketId);

  Future<Either<Failure, CancelPaymentResponseEntity>> getPaymentId(
      String ticketId);

  Future<Either<Failure, CancelPaymentResponseEntity>> returnTicketPrice(CancelPaymentRequestModel parameters);
}

import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/domain/entities/user_valid_booked_tickets_entity.dart';

abstract class BaseUserValidBookedTicketsRepository {
  Future<Either<Failure, UserValidBookedTicketsEntity>>
      getUserValidBookedTickets();
}

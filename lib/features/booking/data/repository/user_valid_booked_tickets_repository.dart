import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/all tickets/cancel_payment_response_entity.dart';
import '../../domain/entities/all%20tickets/cancel_ticket_response_entity.dart';
import '../../domain/entities/all%20tickets/user_valid_booked_tickets_entity.dart';
import '../../domain/repository/base_user_valid_booked_tickets_repository.dart';
import '../data source/user_valid_booked_tickets_remote_data_source.dart';
import '../models/all tickets/cancel_payment_request_model.dart';

class UserValidBookedTicketsRepository
    extends BaseUserValidBookedTicketsRepository {
  final UserValidBookedTicketsRemoteDataSource
      userValidBookedTicketsRemoteDataSource;

  UserValidBookedTicketsRepository(this.userValidBookedTicketsRemoteDataSource);
  @override
  Future<Either<Failure, UserValidBookedTicketsEntity>>
      getUserValidBookedTickets() async {
    try {
      var userValidTickets = await userValidBookedTicketsRemoteDataSource
          .getUserValidBookedTickets();
      return Right(userValidTickets);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelTicketResponseEntity>> cancelTicket(
      String ticketId) async {
    try {
      var cancelTricketResp =
          await userValidBookedTicketsRemoteDataSource.cancelTicket(ticketId);
      return Right(cancelTricketResp);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelPaymentResponseEntity>> getPaymentId(
      String ticketId) async {
    try {
      var patmentId =
          await userValidBookedTicketsRemoteDataSource.getPaymentId(ticketId);
      return Right(patmentId);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CancelPaymentResponseEntity>> returnTicketPrice(
      CancelPaymentRequestModel parameters) async {
    try {
      var resp = await userValidBookedTicketsRemoteDataSource
          .returnTicketPrice(parameters);
      return Right(resp);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

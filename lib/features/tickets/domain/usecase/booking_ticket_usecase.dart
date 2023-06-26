import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/fourth%20screen/booking_ticket_model.dart';
import 'package:traind_app/features/tickets/domain/entities/fourth%20screen/ticket_info_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_booking_ticket_repository.dart';

import '../../../../core/usecases/base_usecase.dart';

class BookingTicketUsecase
    extends BaseUsecase<TicketInfoEntity, BookingTicketModel> {
  final BaseBookingTicketRepository bookingTicketRepository;

  BookingTicketUsecase(this.bookingTicketRepository);
  @override
  Future<Either<Failure, TicketInfoEntity>> call(
      BookingTicketModel parameters) async {
    return await bookingTicketRepository.ticketInfor(parameters);
  }
}

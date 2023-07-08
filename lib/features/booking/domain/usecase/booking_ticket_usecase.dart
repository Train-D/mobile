import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../data/models/fourth%20screen/booking_ticket_model.dart';
import '../entities/fourth%20screen/ticket_info_entity.dart';
import '../repository/base_booking_ticket_repository.dart';

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

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/fourth%20screen/ticket_info_entity.dart';
import '../../domain/repository/base_booking_ticket_repository.dart';
import '../data%20source/booking_ticket_remote_data_source.dart';
import '../models/fourth%20screen/booking_ticket_model.dart';

class BookingTicketRepository extends BaseBookingTicketRepository {
  final BookingTicketRemoteDataSource bookingTicketRemoteDataSource;
  BookingTicketRepository({
    required this.bookingTicketRemoteDataSource,
  });
  @override
  Future<Either<Failure, TicketInfoEntity>> ticketInfor(
      BookingTicketModel parameters) async{
    try {
      var ticketInfo = await bookingTicketRemoteDataSource.getTicketInfo(parameters);
      return Right(ticketInfo);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

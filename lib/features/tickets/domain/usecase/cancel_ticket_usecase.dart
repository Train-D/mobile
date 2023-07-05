// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/domain/entities/all%20tickets/cancel_ticket_response_entity.dart';

import '../../../../core/usecases/base_usecase.dart';
import '../repository/base_user_valid_booked_tickets_repository.dart';

class CancelTicketUsecase
    extends BaseUsecase<CancelTicketResponseEntity, String> {
  final BaseUserValidBookedTicketsRepository
      baseUserValidBookedTicketsRepository;

  CancelTicketUsecase({
    required this.baseUserValidBookedTicketsRepository,
  });
  
  @override
  Future<Either<Failure, CancelTicketResponseEntity>> call(String parameters) async{
    return await baseUserValidBookedTicketsRepository.cancelTicket(parameters);
  } 
}

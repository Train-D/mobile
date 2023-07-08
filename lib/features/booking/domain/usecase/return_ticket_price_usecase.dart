import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';

import '../../data/models/all tickets/cancel_payment_request_model.dart';

import '../entities/all tickets/cancel_payment_response_entity.dart';
import '../repository/base_user_valid_booked_tickets_repository.dart';

class ReturnTicketPriceUsecase extends BaseUsecase<CancelPaymentResponseEntity,
    CancelPaymentRequestModel> {
  final BaseUserValidBookedTicketsRepository
      baseUserValidBookedTicketsRepository;

  ReturnTicketPriceUsecase(this.baseUserValidBookedTicketsRepository);
  
  @override
  Future<Either<Failure, CancelPaymentResponseEntity>> call(CancelPaymentRequestModel parameters) async{
    return await baseUserValidBookedTicketsRepository
        .returnTicketPrice(parameters);
  }

 
}

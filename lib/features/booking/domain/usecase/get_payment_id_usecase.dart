// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/core/usecases/base_usecase.dart';

import '../entities/all tickets/cancel_payment_response_entity.dart';
import '../repository/base_user_valid_booked_tickets_repository.dart';

class GetPaymentIdUsecase
    extends BaseUsecase<CancelPaymentResponseEntity, String> {
  final BaseUserValidBookedTicketsRepository
      baseUserValidBookedTicketsRepository;
  GetPaymentIdUsecase(
    this.baseUserValidBookedTicketsRepository,
  );

  @override
  Future<Either<Failure, CancelPaymentResponseEntity>> call(
      String parameters) async {
    return await baseUserValidBookedTicketsRepository.getPaymentId(parameters);
  }
}

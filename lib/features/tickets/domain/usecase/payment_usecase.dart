import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/payment_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_payment_repository.dart';

import '../../../../core/usecases/base_usecase.dart';

class PaymentUseCase extends BaseUsecase<PaymentIdEntity, PaymentModel> {
  BasePaymentRepository basePaymentRepository;
  PaymentUseCase({
    required this.basePaymentRepository,
  });
  @override
  Future<Either<Failure, PaymentIdEntity>> call(PaymentModel parameters) async {
    return await basePaymentRepository.paymentInfo(parameters);
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../data/models/third%20screen/payment_model.dart';
import '../entities/third%20screen/payment_id_entity.dart';
import '../repository/base_payment_repository.dart';

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

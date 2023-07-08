import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../data/models/third%20screen/payment_model.dart';
import '../entities/third%20screen/payment_id_entity.dart';

abstract class BasePaymentRepository {
  Future<Either<Failure, PaymentIdEntity>> paymentInfo(PaymentModel parameters);
}

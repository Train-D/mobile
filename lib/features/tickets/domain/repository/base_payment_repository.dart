import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/payment_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';

abstract class BasePaymentRepository {
  Future<Either<Failure, PaymentIdEntity>> paymentInfo(PaymentModel parameters);
}

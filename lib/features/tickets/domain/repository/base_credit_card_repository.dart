import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/third%20screen/credit_card_model.dart';
import '../entities/third%20screen/customer_id_entity.dart';

abstract class BaseCreditCardRepository {
  Future<Either<Failure, CustomerIdEntity>> creditCardInfo(CreditCardModel parameters);
}
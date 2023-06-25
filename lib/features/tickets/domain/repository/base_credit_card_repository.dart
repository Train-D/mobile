import 'package:dartz/dartz.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/credit_card_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/customer_id_entity.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/first screen/trip_info_model.dart';

abstract class BaseCreditCardRepository {
  Future<Either<Failure, CustomerIdEntity>> creditCardInfo(CreditCardModel parameters);
}
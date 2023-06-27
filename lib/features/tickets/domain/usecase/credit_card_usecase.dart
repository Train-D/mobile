import 'package:dartz/dartz.dart';
import '../../data/models/third%20screen/credit_card_model.dart';
import '../entities/third%20screen/customer_id_entity.dart';
import '../repository/base_credit_card_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
class CreditCardUseCase extends BaseUsecase<CustomerIdEntity, CreditCardModel> {
  final BaseCreditCardRepository baseCreditCardRepository;
  CreditCardUseCase(
    this.baseCreditCardRepository,
  );
  @override
  Future<Either<Failure, CustomerIdEntity>> call(CreditCardModel parameters) async{
    return await baseCreditCardRepository.creditCardInfo(parameters);
  }
}
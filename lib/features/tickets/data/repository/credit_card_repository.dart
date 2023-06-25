import 'package:dartz/dartz.dart';
import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/data%20source/credit_card_remote_data_source.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/credit_card_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/customer_id_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_credit_card_repository.dart';

class CreditCardRepository extends BaseCreditCardRepository{
  final CreditCardRemoteDataSource creditCardRemoteDataSource;
  CreditCardRepository(
    this.creditCardRemoteDataSource,
  );
  @override
  Future<Either<Failure, CustomerIdEntity>> creditCardInfo(
      CreditCardModel parameters) async {
    try {
      var paymentCustomerData = await creditCardRemoteDataSource.creditCardInfo(parameters);
      return Right(paymentCustomerData);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  
}
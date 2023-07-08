import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/third%20screen/customer_id_entity.dart';
import '../../domain/repository/base_credit_card_repository.dart';
import '../data%20source/credit_card_remote_data_source.dart';
import '../models/third%20screen/credit_card_model.dart';

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
    } on DioError catch (e) {
      return Left(ServerFailure(e.response!.data['message'].toString()));
    }
  }
  
}
import 'package:dartz/dartz.dart';

import 'package:traind_app/core/error/failure.dart';
import 'package:traind_app/features/tickets/data/data%20source/payment_remote_data_source.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/payment_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';
import 'package:traind_app/features/tickets/domain/repository/base_payment_repository.dart';
import 'package:traind_app/features/tickets/domain/usecase/payment_usecase.dart';

class PaymentRepository extends BasePaymentRepository {
  final PaymentRemoteDataSource paymentRemoteDataSource;
  PaymentRepository({
    required this.paymentRemoteDataSource,
  });
  @override
  Future<Either<Failure, PaymentIdEntity>> paymentInfo(
      PaymentModel parameters) async {
    try {
      var customerIdData = await paymentRemoteDataSource.paymentInfo(parameters);
      return Right(customerIdData);
    } catch (e) {
      return Left(ServerFailure('hello, ${e.toString()}'));
    }
  
  }
}

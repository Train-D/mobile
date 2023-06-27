import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../data%20source/payment_remote_data_source.dart';
import '../models/third%20screen/payment_model.dart';
import '../../domain/entities/third%20screen/payment_id_entity.dart';
import '../../domain/repository/base_payment_repository.dart';

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

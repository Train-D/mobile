import 'package:traind_app/features/tickets/data/models/third%20screen/payment_id_model.dart';
import 'package:traind_app/features/tickets/data/models/third%20screen/payment_model.dart';
import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';
import 'package:traind_app/features/tickets/domain/usecase/payment_usecase.dart';

import '../../../../core/network/remote/api_constants.dart';
import '../../../../core/services/api_service.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentIdEntity> paymentInfo(PaymentModel model);
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource{
  final ApiService apiService;
  PaymentRemoteDataSourceImpl(
     this.apiService,
  );
  @override
  Future<PaymentIdEntity> paymentInfo(PaymentModel model) async{
    var data = await apiService.post(
      endPoint: ApiConstants.paymentEndPoint,
      data: model.toJson(),
    );

    PaymentIdEntity PaymentId = PaymentIdModel.fromJson(data);
    return PaymentId;
  }

}

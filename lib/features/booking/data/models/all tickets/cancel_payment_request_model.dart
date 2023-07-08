
import '../../../domain/entities/all tickets/cancel_payment_request_entity.dart';

class CancelPaymentRequestModel extends CancelPaymentRequestEntity{
  const CancelPaymentRequestModel({required super.paymentId, required super.amount});
  
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['amount'] = amount;
    return data;
  }
}
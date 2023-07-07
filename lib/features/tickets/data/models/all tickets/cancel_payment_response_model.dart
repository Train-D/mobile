
import '../../../domain/entities/all tickets/cancel_payment_response_entity.dart';

class CancelPaymentResponseModel extends CancelPaymentResponseEntity {
  const CancelPaymentResponseModel({required super.message});

  factory CancelPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return CancelPaymentResponseModel(message: json['message']);
  }
}

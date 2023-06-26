import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';

class PaymentIdModel extends PaymentIdEntity{
  PaymentIdModel({required super.message, required super.paymentId});
  factory PaymentIdModel.fromJson(Map<String, dynamic> json) {
    return PaymentIdModel(
      message: json['message'],
      paymentId: json['paymentId']
    );
  }
}
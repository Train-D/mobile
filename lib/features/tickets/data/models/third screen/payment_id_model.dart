import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_id_entity.dart';

class PaymentIdModel extends PaymentIdEntity{
  PaymentIdModel({required super.message, required super.customerId});
  factory PaymentIdModel.fromJson(Map<String, dynamic> json) {
    return PaymentIdModel(
      message: json['message'],
      customerId: json['customerId']
    );
  }
}
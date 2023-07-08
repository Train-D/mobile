import '../../../domain/entities/third%20screen/payment_id_entity.dart';

// ignore: must_be_immutable
class PaymentIdModel extends PaymentIdEntity{
  PaymentIdModel({required super.message, required super.paymentId});
  factory PaymentIdModel.fromJson(Map<String, dynamic> json) {
    return PaymentIdModel(
      message: json['message'],
      paymentId: json['paymentId']
    );
  }
}
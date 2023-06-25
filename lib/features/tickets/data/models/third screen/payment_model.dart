import 'package:traind_app/features/tickets/domain/entities/third%20screen/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel(
      {required super.customerId,
      required super.email,
      required super.description,
      required super.currency,
      required super.amount});
  Map<String, dynamic> toJson() {
    return {
      "customerId": customerId,
      "receiptEmail": email,
      "description": description,
      "currency": currency,
      "amount": amount
    };
  }
}

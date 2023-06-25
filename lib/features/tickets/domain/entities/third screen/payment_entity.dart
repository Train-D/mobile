import 'package:equatable/equatable.dart';

class PaymentEntity extends Equatable {
  String customerId;
  String email;
  String description;
  String currency;
  var amount;
  PaymentEntity({
    required this.customerId,
    required this.email,
    required this.description,
    required this.currency,
    required this.amount,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [customerId, email, description, currency, amount];
}

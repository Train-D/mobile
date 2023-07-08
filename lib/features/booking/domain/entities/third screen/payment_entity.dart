import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentEntity extends Equatable {
  String customerId;
  String email;
  String description;
  String currency;
  int amount;
  PaymentEntity({
    required this.customerId,
    required this.email,
    required this.description,
    required this.currency,
    required this.amount,
  });
  @override
  List<Object?> get props => [customerId, email, description, currency, amount];
}

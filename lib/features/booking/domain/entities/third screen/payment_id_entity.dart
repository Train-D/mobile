import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PaymentIdEntity extends Equatable {
  String message;
  String paymentId;
  PaymentIdEntity({
    required this.message,
    required this.paymentId,
  });

  @override
  List<Object?> get props => [message, paymentId];
}

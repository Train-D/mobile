import 'package:equatable/equatable.dart';

class PaymentIdEntity extends Equatable {
  String message;
  String paymentId;
  PaymentIdEntity({
    required this.message,
    required this.paymentId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [message, paymentId];
}

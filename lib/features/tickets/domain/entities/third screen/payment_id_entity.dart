import 'package:equatable/equatable.dart';

class PaymentIdEntity extends Equatable {
  String message;
  dynamic customerId;
  PaymentIdEntity({
    required this.message,
    required this.customerId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [message, customerId];
}

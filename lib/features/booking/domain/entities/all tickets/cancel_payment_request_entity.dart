// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CancelPaymentRequestEntity extends Equatable {
  final String paymentId;
  final int amount;
  const CancelPaymentRequestEntity({
    required this.paymentId,
    required this.amount,
  });

  @override
  List<Object?> get props => [
        paymentId,
        amount,
      ];
}

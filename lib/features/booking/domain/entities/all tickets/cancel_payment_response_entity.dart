// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CancelPaymentResponseEntity extends Equatable {
  final String message;
  const CancelPaymentResponseEntity({
    required this.message,
  });

  @override
  List<Object?> get props => throw [message];
}

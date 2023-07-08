import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CustomerIdEntity extends Equatable {
  String name;
  String email;
  String customerId;
  CustomerIdEntity({
    required this.name,
    required this.email,
    required this.customerId,
  });
  @override
  List<Object?> get props => [name, email, customerId];
}

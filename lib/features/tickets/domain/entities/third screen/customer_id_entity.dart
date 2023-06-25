import 'package:equatable/equatable.dart';

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
  // TODO: implement props
  List<Object?> get props => [name, email, customerId];
}

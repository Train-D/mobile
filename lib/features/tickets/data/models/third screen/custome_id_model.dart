import 'package:traind_app/features/tickets/domain/entities/third%20screen/customer_id_entity.dart';

class CustomerIdModel extends CustomerIdEntity{
  CustomerIdModel({required super.name, required super.email, required super.customerId});
  factory CustomerIdModel.fromJson(Map<String, dynamic> json) {
    return CustomerIdModel(
      name: json['name'],
      email: json['email'],
      customerId: json['customerId']
    );
  }
}
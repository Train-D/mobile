import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CreditCardEntity extends Equatable {
  String email;
  String name;
  Map<String, String> creditCard;
  CreditCardEntity({
    required this.email,
    required this.name,
    required this.creditCard,
  });
  
  @override
  List<Object?> get props => [email, name, creditCard];
}

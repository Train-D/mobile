import 'package:equatable/equatable.dart';

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
  // TODO: implement props
  List<Object?> get props => [email, name, creditCard];
}

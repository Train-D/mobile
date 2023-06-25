import 'package:traind_app/features/tickets/domain/entities/third%20screen/credit_card_entity.dart';

class CreditCardModel extends CreditCardEntity {
  CreditCardModel(
      {required super.email, required super.name, required super.creditCard});
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "name": name,
      "creditCard": {
        "name": name,
        "cardNumber": creditCard['cardNumber'],
        "expirationYear": creditCard['expirationYear'],
        "expirationMonth": creditCard['expirationMonth'],
        "cvc": creditCard['cvc']
      }
    };
  }
}

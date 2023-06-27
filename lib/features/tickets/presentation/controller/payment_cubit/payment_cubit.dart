// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(
  ) : super(PaymentInitial());

  static PaymentCubit get(context) => BlocProvider.of(context);

  var cardNumber = TextEditingController();
  var expiryYear = TextEditingController();
  var expiryMonth = TextEditingController();
  var email = TextEditingController();
  var cardHolderName = TextEditingController();
  var cvvCode = TextEditingController();
  bool saveCardData = false;
  void changeCheckboxValue() {
    saveCardData = !saveCardData;
    emit(PaymentSaveDataCheckboxChangeState());
  }
}

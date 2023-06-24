// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traind_app/features/tickets/data/models/trip_info_model.dart';
import 'package:traind_app/features/tickets/domain/usecase/train_info_usecase.dart';

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

  /*final TrainInfoUseCase trainInfoUseCase;
  var tripInfoModel = {"tripId": "7", "date": "2023-06-30"};

  Future<void> getTrainInfo(TripInfoModel model) async {
    emit(GetTrainInfoLoadingState());
    var result = await trainInfoUseCase.call(model);
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(GetTrainInfoFailureState());
    }, (trainInfoData) {
      print(trainInfoData);
      emit(GetTrainInfoSuccessState());
    });
  }*/
}

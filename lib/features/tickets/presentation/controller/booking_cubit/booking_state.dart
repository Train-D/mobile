part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class FromToInitial extends BookingState {}

class ChangeDropDownButtonValueState extends BookingState {}



class FromToStationsLoadingState extends BookingState {}
class FromToStationsSuccessState extends BookingState {}
class FromToStationsErrorState extends BookingState {
  String message;
  FromToStationsErrorState(this.message);
  
}


class GetTripsLoadingState extends BookingState {}
class GetTripsSuccessState extends BookingState {}

class GetTripsErrorState extends BookingState {
  String message;
  GetTripsErrorState({
    required this.message,
  });
  
}

class GetTrainInfoLoadingState extends BookingState {}
class GetTrainInfoSuccessState extends BookingState {}
class GetTrainInfoFailureState extends BookingState {}


class GetPaymentCustomerDataLoadingState extends BookingState {}
class GetPaymentCustomerDataSuccessState extends BookingState {}
class GetPaymentCustomerDataFailureState extends BookingState {}



class ChangeDefualtDateState extends BookingState {}

class GetToStationsDataState extends BookingState {}


class PaymentSaveDataCheckboxChangeState extends BookingState{}
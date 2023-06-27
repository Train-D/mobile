part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class   BookingInitial extends BookingState {}

class ChangeDropDownButtonValueState extends BookingState {}
class CleanCubitDataState extends BookingState {}


class FromToStationsLoadingState extends BookingState {}
class FromToStationsSuccessState extends BookingState {}
class FromToStationsErrorState extends BookingState {
  final String message;
  const FromToStationsErrorState(this.message);
}


class GetTripsLoadingState extends BookingState {}
class GetTripsSuccessState extends BookingState {}

class GetTripsErrorState extends BookingState {
  final String message;
  const GetTripsErrorState({
    required this.message,
  });
  
}

class GetTrainInfoLoadingState extends BookingState {}
class GetTrainInfoSuccessState extends BookingState {}
class GetTrainInfoFailureState extends BookingState {}

class ChooseSeatsBookSeatLoadingState extends BookingState {}
class ChooseSeatsBookSeatSuccessState extends BookingState {}
class ChooseSeatsBookSeatErrorState extends BookingState {}

class GetPaymentCustomerDataLoadingState extends BookingState {}
class GetPaymentCustomerDataSuccessState extends BookingState {}
class GetPaymentCustomerDataFailureState extends BookingState {}

class GetTicketDataLoadingState extends BookingState {}
class GetTicketDataSuccessState extends BookingState {}
class GetTicketDataFailureState extends BookingState {}

class ChangeDefualtDateState extends BookingState {}

class GetToStationsDataState extends BookingState {}


class PaymentSaveDataCheckboxChangeState extends BookingState{}

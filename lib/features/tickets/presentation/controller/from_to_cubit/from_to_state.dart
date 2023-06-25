part of 'from_to_cubit.dart';

abstract class FromToState extends Equatable {
  const FromToState();

  @override
  List<Object> get props => [];
}

class FromToInitial extends FromToState {}

class ChangeDropDownButtonValueState extends FromToState {}



class FromToStationsLoadingState extends FromToState {}
class FromToStationsSuccessState extends FromToState {}
class FromToStationsErrorState extends FromToState {
  String message;
  FromToStationsErrorState(this.message);
  
}


class GetTripsLoadingState extends FromToState {}
class GetTripsSuccessState extends FromToState {}

class GetTripsErrorState extends FromToState {
  String message;
  GetTripsErrorState({
    required this.message,
  });
  
}

class GetTrainInfoLoadingState extends FromToState {}
class GetTrainInfoSuccessState extends FromToState {}
class GetTrainInfoFailureState extends FromToState {}



class ChangeDefualtDateState extends FromToState {}

class GetToStationsDataState extends FromToState {}

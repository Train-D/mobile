part of 'from_to_cubit.dart';

abstract class FromToState extends Equatable {
  const FromToState();

  @override
  List<Object> get props => [];
}

class FromToInitial extends FromToState {}

class ChangeDropDownButtonValueState extends FromToState {}

class FromToLoadingState extends FromToState {}

class FromToSuccessState extends FromToState {}

// ignore: must_be_immutable
class FromToErrorState extends FromToState {
  String message;
  FromToErrorState(this.message);
  
}

class ChangeDefualtDateState extends FromToState {}

class GetToStationsDataState extends FromToState {}

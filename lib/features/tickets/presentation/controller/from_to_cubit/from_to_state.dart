part of 'from_to_cubit.dart';

abstract class FromToState extends Equatable {
  const FromToState();

  @override
  List<Object> get props => [];
}

class FromToInitial extends FromToState {}
class FromToStationsSuccessState extends FromToState {}
class FromToStationsLoadingState extends FromToState{}

class FromToStationsErrorState extends FromToState{
  final dynamic message;

  FromToStationsErrorState(this.message);
}

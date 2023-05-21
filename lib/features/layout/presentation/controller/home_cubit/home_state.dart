
abstract class HomeState{
}

class HomeInitial extends   HomeState {}
class HomeChangeBottomNavState extends HomeState{}

class StationsSuccessState extends HomeState {}

class StationsLoadingState extends HomeState {}
class ChangeGetStationsFromApiState extends HomeState{}
class StationsErrorState extends HomeState {
  final dynamic message;

  StationsErrorState(this.message);
}

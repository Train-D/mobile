
abstract class HomeState{
}

class HomeInitial extends   HomeState {}
class HomeChangeBottomNavState extends HomeState{}
class ChangeGetStationsFromApiState extends HomeState{}
class GetAllDataSuccessState extends HomeState {}

class GetAllDataLoadingState extends HomeState {}

class GetAllDataErrorState extends HomeState {
  final dynamic message;

  GetAllDataErrorState(this.message);
}
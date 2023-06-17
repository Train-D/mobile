part of 'all_stations_cubit.dart';

abstract class AllStationsState {}

class AllStationsInitial extends AllStationsState {}

class GetAllStationsNamesLoadingState extends AllStationsState {}
class GetAllStationsNamesSuccessState extends AllStationsState {}
class GetAllStationsNamesFailureState extends AllStationsState {}

class GetStationDetailsByNameLoadingState extends AllStationsState {}
class GetStationDetailsByNameSuccessState extends AllStationsState {}
class GetStationDetailsByNameFailureState extends AllStationsState {}
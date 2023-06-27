// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/features/stations/domain/usecase/get_all_stations_names_usecase.dart';

import '../../../../../core/usecases/base_usecase.dart';
import '../../../domain/usecase/get_station_details_by_name_usecase.dart';

part 'all_stations_state.dart';

class AllStationsCubit extends Cubit<AllStationsState> {
  AllStationsCubit(
    this.getAllStationsNamesUseCase,
    this.getStationDetails,
  ) : super(AllStationsInitial());

  static AllStationsCubit get(context) => BlocProvider.of(context);

  final GetAllStationsNamesUseCase getAllStationsNamesUseCase;
  dynamic allStationsNamesModel;

  Future<void> getAllStationsNames() async {
    emit(GetAllStationsNamesLoadingState());
    var result = await getAllStationsNamesUseCase.call(const NoParameters());
    result.fold((failure) {
      //print(failure.toString());
      emit(GetAllStationsNamesFailureState());
    }, (allStationsNames) {
      allStationsNamesModel = allStationsNames.allStationsNames;
      //print(allStationsNamesModel.keys);
      //print(allStationsNamesModel.values.toList()[0]);

      emit(GetAllStationsNamesSuccessState());
    });
  }

  final GetStationDetailsByNameUseCase getStationDetails;
  dynamic stationDetails;

  Future<void> getStationDetailsByName(String stationName) async {
    emit(GetStationDetailsByNameLoadingState());
    var result = await getStationDetails.call(stationName);
    result.fold((failure) {
      //print(failure.toString());
      emit(GetStationDetailsByNameFailureState());
    }, (stationDet) {
      stationDetails = stationDet;

      //print(stationDetails);

      emit(GetStationDetailsByNameSuccessState());
    });
  }
}

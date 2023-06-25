import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/data/models/trip_info_model.dart';
import 'package:traind_app/features/tickets/domain/usecase/trip_times_usecase.dart.dart';

import '../../../data/models/stations_model.dart';
import '../../../domain/usecase/stations_usecase.dart';
import '../../../data/models/trip_times_model.dart';
import '../../../domain/usecase/train_info_usecase.dart';

part 'from_to_state.dart';

class FromToCubit extends Cubit<FromToState> {
  FromToCubit(
      this.tripTimesDataUsecase, this.getStationsUseCase, this.trainInfoUseCase)
      : super(FromToInitial()) {
    getStationsFromApi();
  }
  static FromToCubit get(context) => BlocProvider.of(context);

  var fromToDateCon = TextEditingController();
  String fromDefaultValue = "Select";
  String toDefaultValue = "Select";
  String fromToDefaultDate = 'yyyy/mm/dd';
  dynamic errorMessage = 'Connection Error';
  List<String> allStations = ["Select"];
  List<String> toStations = ["Select"];

  //get from to stations from api
  final GetStationsUseCase getStationsUseCase;
  late StationsModel stationsModel;

  Future<void> getStationsFromApi() async {
    emit(FromToStationsLoadingState());
    try {
      final result = await getStationsUseCase();
      result.fold((l) {}, (r) {
        stationsModel = StationsModel.fromJson(r.stations);
        //print(stationsModel.stations);
        for (var station in stationsModel.stations.keys) {
          allStations.add(station);
        }
      });
      emit(FromToStationsSuccessState());
    } on ServerException catch (e) {
      stationsModel = StationsModel.fromJson(const {});
      emit(FromToStationsErrorState(e.toString()));
    } on DioError catch (e) {
      stationsModel = StationsModel.fromJson(const {});
      emit(FromToStationsErrorState(e.response.toString()));
    }
  }

  //after getting stations we set date and send data to api to get trip schedule
  final TripTimesDataUsecase tripTimesDataUsecase;
  late TripTimesModel tripTimesModel;
  Future<void> getTripTimes() async {
    emit(GetTripsLoadingState());

    try {
      final result = await tripTimesDataUsecase(FromToDateModel(
          fromStation: fromDefaultValue,
          toStation: toDefaultValue,
          date: fromToDefaultDate));
      result.fold((l) {}, (r) {
        tripTimesModel = TripTimesModel.fromjson(r.tripTimes);
      });
      emit(GetTripsSuccessState());
    } on ServerException catch (e) {
      errorMessage = 'Connection Error';
      emit(GetTripsErrorState(message: e.toString()));
    } on DioError catch (e) {
      errorMessage = e.response?.data['message'] ?? 'Connection Error';
      emit(GetTripsErrorState(message: e.message.toString()));
    }
  }

  //change UI of from to date screen
  void getToStationsData(String fromStation) {
    toStations.removeRange(1, toStations.length);
    if (fromStation != 'Select') {
      for (var station in stationsModel.stations[fromStation]) {
        toStations.add(station);
      }
    } else {
      toDefaultValue = "Select";
    }
    emit(GetToStationsDataState());
  }

  void changeDefualtDate(String newDate) {
    fromToDefaultDate = newDate;
    emit(ChangeDefualtDateState());
  }

  void changeDropDownButtonValue(int option, String newValue) {
    if (option == 1) {
      fromDefaultValue = newValue;
      toDefaultValue = "Select";
      emit(ChangeDropDownButtonValueState());
    } else {
      toDefaultValue = newValue;
      emit(ChangeDropDownButtonValueState());
    }
  }

  //
  //
  //
  final TrainInfoUseCase trainInfoUseCase;
  //late TripInfoModel tripInfoModel;

  Future<void> getTrainInfo(int tripId, String tripDate) async {
    emit(GetTrainInfoLoadingState());
    var result = await trainInfoUseCase.call(TripInfoModel(tripId: tripId, tripDate: tripDate));
    result.fold((failure) {
      debugPrint(failure.toString());
      emit(GetTrainInfoFailureState());
    }, (trainInfoData) {
      print(trainInfoData);
      emit(GetTrainInfoSuccessState());
    });
  }
}

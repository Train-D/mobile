import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/tickets/data/stations/models/stations_model.dart';
import 'package:traind_app/features/tickets/domain/stations/usecase/get_stations_usecase.dart';

part 'from_to_state.dart';

class FromToCubit extends Cubit<FromToState> {
  FromToCubit(this.getStationsUseCase) : super(FromToInitial());
  static FromToCubit get(context) => BlocProvider.of(context);

  var fromToDateCon = TextEditingController();
  List<String> allStations = [];
  List<String> fromToStations = [];
  final GetStationsUseCase getStationsUseCase;
  late StationsModel stationsModel;
  Future<void> getStations() async {
    emit(FromToStationsLoadingState());

    try {
      final result = await getStationsUseCase();
      result.fold((l) {}, (r) {
        stationsModel = StationsModel.fromjson(r.stations);
        for (var keys in stationsModel.stations.keys) {
          print(keys);
          allStations.add(keys);
        }
      });
      emit(FromToStationsSuccessState());
    } on ServerException catch (e) {
      print(e.toString());
      stationsModel = StationsModel.fromjson({});
      emit(FromToStationsErrorState(e.toString()));
    } on DioError catch (e) {
      print(e.response);
      stationsModel = StationsModel.fromjson({});
      emit(FromToStationsErrorState(e.response));
    }
  }

  getToStations(String fromStations) {
    fromToStations = stationsModel.stations[fromStations]!;
    emit(FromToStationsSuccessState());
  }
}

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/features/tickets/data/models/from_to_date_model.dart';
import 'package:traind_app/features/tickets/domain/fromto_usecase.dart.dart';

import '../../../data/models/schedule_model.dart';

part 'from_to_state.dart';

class FromToCubit extends Cubit<FromToState> {
  FromToCubit(this.postFromToDateDataUsecase) : super(FromToInitial()) {
    allStations.removeRange(1, allStations.length);
    for (var station in AppConstants.allFromToStations.keys) {
      allStations.add(station);
    }
    //fromDefaultValue = allStations.first;
  }
  static FromToCubit get(context) => BlocProvider.of(context);

  var fromToDateCon = TextEditingController();
  String fromDefaultValue = "Select";
  String toDefaultValue = "Select";
  String fromToDefaultDate = 'yyyy/mm/dd';
  dynamic errorMessage = 'Connection Error';
  List<String> allStations = ["Select"];
  List<String> toStations = ["Select"];
  void getToStationsData(String fromStation) {
    toStations.removeRange(1, toStations.length);
    //toStations.clear();
    for (var station in AppConstants.allFromToStations[fromStation])
      toStations.add(station);
    print(toStations);
    // toDefaultValue = toStations.first;
    print(toStations);
    emit(GetToStationsDataState());
  }

  void changeDefualtDate(String newDate) {
    fromToDefaultDate = newDate;
    emit(ChangeDefualtDateState());
  }

  void changeDropDownButtonValue(int option, String newValue) {
    //print(newValue);
    if (option == 1) {
      fromDefaultValue = newValue;
    } else {
      toDefaultValue = newValue;
    }
    //print(fromDefaultValue);
    emit(ChangeDropDownButtonValueState());
  }

  final PostFromToDateDataUsecase postFromToDateDataUsecase;
  late ScheduleModel scheduleModel;
  Future<void> tripTimes() async {
    emit(FromToLoadingState());

    try {
      final result = await postFromToDateDataUsecase(FromToDateModel(
          fromStation: fromDefaultValue,
          toStation: toDefaultValue,
          date: fromToDefaultDate));
      result.fold((l) {}, (r) {
        scheduleModel = ScheduleModel.fromjson(r.scheduleData);
        print(r);
      });
      emit(FromToSuccessState());
    } on ServerException catch (e) {
      scheduleModel = ScheduleModel.fromjson([]);
      errorMessage = e.toString();
      emit(FromToErrorState(e.toString()));
    } on DioError catch (e) {
      scheduleModel = ScheduleModel.fromjson([]);
      errorMessage = e.toString();
      emit(FromToErrorState(e.message.toString()));
    }
  }
}

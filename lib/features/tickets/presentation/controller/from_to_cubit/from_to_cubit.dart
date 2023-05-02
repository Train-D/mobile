import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/utils/app_constants.dart';

part 'from_to_state.dart';

class FromToCubit extends Cubit<FromToState> {
  FromToCubit() : super(FromToInitial()) {
    allStations.clear();
    for (var station in AppConstants.allFromToStations.keys) {
      allStations.add(station);
    }
    fromDefaultValue = allStations.first;
  }
  static FromToCubit get(context) => BlocProvider.of(context);

  var fromToDateCon = TextEditingController();
  String fromDefaultValue = "Select";
  String toDefaultValue = "Select";
  List<String> allStations = ["Select"];
  List<String> toStations = ["Select"];
  void getToStationsData(String fromStation) {
    //toStations.addAll(AppConstants.allFromToStations[fromStation]);
    //toDefaultValue = '';
    toStations.clear();
    for (var station in AppConstants.allFromToStations[fromStation])
      toStations.add(station);
    toDefaultValue = toStations.first;
    print(toStations);
    emit(GetToStationsDataState());
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
}

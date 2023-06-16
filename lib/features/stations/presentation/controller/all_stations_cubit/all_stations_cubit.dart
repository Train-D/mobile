// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:traind_app/features/profile/domain/usecase/get_profile_user_data_use_case.dart';
import 'package:traind_app/features/stations/domain/usecase/get_all_stations_names_usecase.dart';

import '../../../../../core/usecases/base_usecase.dart';

part 'all_stations_state.dart';

class AllStationsCubit extends Cubit<AllStationsState> {
  AllStationsCubit(
    this.getAllStationsNamesUseCase,
  ) : super(AllStationsInitial());

  static AllStationsCubit get(context) => BlocProvider.of(context);

  final List<Map<String, List<String>>> stations = [
    {
      "A": ["Alex", "Alla", "Az"]
    },
    {
      "C": ["Cairo", "CZ"]
    },
    {
      "I": ["Ismailia", "ISde"]
    },
    {
      "s": ["string", "shh", "ash"]
    },
  ];

  final GetAllStationsNamesUseCase getAllStationsNamesUseCase;
  dynamic allStationsNamesModel;

  Future<void> getAllStationsNames() async {
    emit(GetAllStationsNamesLoadingState());
    var result = await getAllStationsNamesUseCase.call(const NoParameters());
    result.fold((failure) {
      print(failure.toString());
      emit(GetAllStationsNamesFailureState());
    }, (allStationsNames) {
      allStationsNamesModel = allStationsNames.allStationsNames;
      //print(allStationsNamesModel.keys);
      print(allStationsNamesModel.values.toList()[0]);

      emit(GetAllStationsNamesSuccessState());
    });
  }
}

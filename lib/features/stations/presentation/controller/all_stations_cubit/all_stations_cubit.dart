import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_stations_state.dart';

class AllStationsCubit extends Cubit<AllStationsState> {
  AllStationsCubit() : super(AllStationsInitial());

  static AllStationsCubit get(context) =>  BlocProvider.of(context);

  final List<Map<String, List<String>>> stations = [
     {"A": ["Alex","Alla", "Az"]},
	   {"C": ["Cairo", "CZ"]},
	   {"I": ["Ismailia" , "ISde"]},
	   {"s": ["string" , "shh" , "ash"]},
  ];

}

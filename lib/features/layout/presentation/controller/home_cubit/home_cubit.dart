import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/error/exceptions.dart';
import 'package:traind_app/features/layout/data/stations/models/stations_model.dart';
import 'package:traind_app/features/layout/domain/stations/usecase/get_stations_usecase.dart';
import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../authentication/presentation/screens/profile_screen.dart';
import '../../../../settings/presentation/screens/settings_screen.dart';
import '../../screens/home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getStationsUseCase) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  bool getStationsFromApiIsDone = false;
  List<Widget> screens = const [
    ProfileScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];
  final GetStationsUseCase getStationsUseCase;
  late StationsModel stationsModel;

  Future<void> getStationsFromApi() async {
    emit(StationsLoadingState());

    try {
      final result = await getStationsUseCase();
      result.fold((l) {}, (r) {
        stationsModel = StationsModel.fromjson(r.stations);
        AppConstants.allFromToStations = stationsModel.stations;
      });
      emit(StationsSuccessState());
    } on ServerException catch (e) {
      print(e.toString());
      stationsModel = StationsModel.fromjson({});
      emit(StationsErrorState(e.toString()));
    } on DioError catch (e) {
      print(e.response);
      stationsModel = StationsModel.fromjson({});
      emit(StationsErrorState(e.response));
    }
  }

  void changeGetStationsFromApiIsDone() {
    getStationsFromApiIsDone = true;
    emit(ChangeGetStationsFromApiState());
  }

  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$profileIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$homeIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(
        AssetImage(
          '${AppConstants.imagesUrl}$settingsIcon',
        ),
        color: lightColor,
      ),
      label: '',
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }
}

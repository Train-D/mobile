import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/features/authentication/presentation/screens/profile_screen.dart';
import 'package:traind_app/features/layout/presentation/controller/home_cubit/home_state.dart';
import 'package:traind_app/features/layout/presentation/screens/home_screen.dart';
import 'package:traind_app/core/utils/app_constants.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  List<Widget> screens = const [
    ProfileScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

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

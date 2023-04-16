import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../authentication/presentation/screens/profile_screen.dart';
import 'home_state.dart';
import '../../screens/home_screen.dart';
import '../../../../../core/utils/app_constants.dart';

import '../../../../settings/presentation/screens/settings_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  List<Widget> screens = const [
    ProfileScreen(),
    HomeScreen(),
    SettingsScreen(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../tickets/presentation/screens/user_valid_booked_tickets_screen.dart';
import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../profile/presentation/controller/profile_cubit/profile_cubit.dart';
import '../../../../profile/presentation/screens/profile_screen.dart';
import '../../../../settings/presentation/screens/settings_screen.dart';
import '../../screens/home_screen.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileCubit profileCubit;
  HomeCubit({
    required this.profileCubit,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 1;
  bool getStationsFromApiIsDone = false;
  List<Widget> screens = const [
    ProfileScreen(),
    HomeScreen(),
    SettingsScreen(),
  ];

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

// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:traind_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/core/services/services_locator.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/features/app/presentation/screens/onboarding_one_screen.dart';
import 'package:traind_app/features/app/presentation/screens/splash_screen.dart';
import 'package:traind_app/features/authentication/presentation/screens/login_screen.dart';
import 'package:traind_app/features/layout/presentation/controller/home_cubit/home_cubit.dart';
import 'package:traind_app/features/layout/presentation/screens/home_screen.dart';
import 'package:traind_app/features/stations/presentation/controller/all_stations_cubit/all_stations_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/from_to_cubit/from_to_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/payment_cubit/payment_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/ticket_cubit/cubit/ticket_cubit.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'features/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'features/authentication/presentation/controller/register_cubit/register_cubit.dart';
import 'features/profile/presentation/controller/profile_cubit/profile_cubit.dart';
import 'features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'features/track/presentation/controller/tracking_cubit/tracking_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  dynamic boarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  Widget widget = LoginScreen();
  if (boarding == null) {
    widget = OnboardingOneScreen();
    
  } else {
    if (token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({
    Key? key,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(sl()),
        ),
        BlocProvider(
          create: (context) => FromToCubit(sl()),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(sl()),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(sl() , sl())..getProfileUserData(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(sl()),
        ),
        BlocProvider(
          create: (context) => TrackingCubit(),
        ),
        BlocProvider(
          create: (context) => PaymentCubit(),
        ),
        BlocProvider(
          create: (context) => TicketCubit(),
        ),
        BlocProvider(
          create: (context) => ChooseSeatsCubit()..initScrollCon(),
        ),
        BlocProvider(
          create: (context) => AllStationsCubit(),
        )
      ],
      child: ResponsiveSizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Train D',
            theme: lightTheme(),
            home: SplashScreen(nextScreen: widget,),
          );
        },
      ),
    );
  }
}

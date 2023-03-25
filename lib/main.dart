import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:traind_app/features/app/presentation/screens/splash_screen.dart';
import 'package:traind_app/features/authentication/presentation/controller/profile_cubit/profile_cubit.dart';
import 'package:traind_app/features/authentication/presentation/screens/profile_screen.dart';
import 'package:traind_app/features/tickets/presentation/controller/from_to_cubit/from_to_cubit.dart';
import 'package:traind_app/features/tickets/presentation/screens/from_to_screen.dart';

import 'features/authentication/presentation/controller/login_cubit/login_cubit.dart';
import 'features/authentication/presentation/controller/sign_up_cubit/sign_up_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => FromToCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
         BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: ResponsiveSizer(
        builder: (BuildContext, Orientation, ScreenType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Train D Edit Again',
            theme: lightTheme(),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

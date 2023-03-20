import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/theme_data/theme_data_light.dart';
import 'package:traind_app/features/app/presentation/screens/home_screen.dart';
import 'package:traind_app/features/app/presentation/screens/onboarding1_screen.dart';
import 'package:traind_app/features/app/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Train D Edit Again',
          theme: lightTheme(),
          home: SplashScreen(),
        );
      },
    );
  }
}

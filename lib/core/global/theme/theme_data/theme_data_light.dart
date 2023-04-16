import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Inria Serif',
      textTheme: ThemeData.light().textTheme.copyWith(
            displayLarge: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Inria Serif',
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: TextStyle(
              fontSize: 18.sp,
              fontFamily: 'Inria Serif',
              color: Colors.white,
            ),
            bodyLarge: const TextStyle(color: Colors.white),
            bodyMedium: const TextStyle(color: Colors.white),
          ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.brown,
      ).copyWith(
        secondary: Colors.brown,
      ),
    );





/*decoration: const BoxDecoration(
               gradient: LinearGradient(
               colors: [Colors.purple, Colors.blue],
              begin: Alignment.bottomLeft,
               end: Alignment.topRight,
               ),

               
               image filter
*/
/*Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xB3404232),Color(0xB36f5246)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),*/
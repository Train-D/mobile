import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      fontFamily: 'Inria Serif',
      textTheme: ThemeData.light().textTheme.copyWith(
            displayLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'Inria Serif',
                color: Colors.white,
                fontWeight: FontWeight.bold),
            displayMedium: const TextStyle(
                fontSize: 18,
                fontFamily: 'Inria Serif',
                color: Colors.white,
                
                //fontWeight: FontWeight.w400,
            ),
            bodyLarge: const TextStyle(color: Colors.white),
            bodyMedium: const TextStyle(color: Colors.white),
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
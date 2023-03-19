import 'package:flutter/material.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SharedComponents.defaultButton(function: (){}, text: 'test', width: 50.w, bgColor: Colors.teal, icon: Icons.abc),
      ),
    );
  }
}
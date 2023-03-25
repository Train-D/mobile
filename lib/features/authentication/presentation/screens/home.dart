import 'package:flutter/material.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/core/utils/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$home',
        context: context,
        child: Scaffold(
          backgroundColor: Colors.transparent,
        ));
  }
}

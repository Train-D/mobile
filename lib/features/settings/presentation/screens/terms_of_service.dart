import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/components.dart';

class TermsOfServiceScreen extends StatelessWidget {
  TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
              backgroundColor: transparent,
              appBar: SharedComponents.defaultAppBar(context: context),
              body: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.sp,
                ),
                
              ),
            ),
          ),
        );
      
  }
}

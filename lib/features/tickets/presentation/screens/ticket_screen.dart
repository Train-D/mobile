import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/components.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedComponents.linearGradientBg(
      colors: profileBg,
      child: Scaffold(
        backgroundColor: transparent,
        appBar: SharedComponents.defualtAppBar(context),
        body: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.sp),
              child: Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                  color: ticketColor,
                  borderRadius: BorderRadius.circular(30.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

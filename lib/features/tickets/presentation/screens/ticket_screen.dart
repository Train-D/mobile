import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/components.dart';

import '../../../../core/utils/app_strings.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SharedComponents.linearGradientBg(
      colors: profileBg,
      child: Scaffold(
        backgroundColor: transparent,
        appBar: SharedComponents.defualtAppBar(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.sp),
                child: Center(
                  child: Container(
                    width: 400,
                    height: 600,
                    decoration: BoxDecoration(
                      color: ticketColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    '${AppConstants.vectorsUrl}$ticketLogo'),
                              ),
                              const Text(
                                AppString.appName,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Grechen Fuemen',
                                  color: lightColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Image(
                                image: AssetImage(
                                    '${AppConstants.vectorsUrl}$ticketTrainVector'),
                              ),
                              Image(
                                image: AssetImage(
                                    '${AppConstants.vectorsUrl}$ticketCurveVector'),
                              ),
                              SizedBox(height: 50,),
                              Align(
                                alignment: Alignment.center,
                                child: Text('2h 20m'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

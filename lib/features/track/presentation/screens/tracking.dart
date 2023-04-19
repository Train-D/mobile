import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/track/presentation/components/tracking_components.dart';
import 'package:traind_app/features/track/presentation/controller/tracking_cubit/tracking_cubit.dart';
import 'package:swipe/swipe.dart';

class trackingScreen extends StatelessWidget {
  const trackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<TrackingCubit, TrackingState>(builder: (context, state) {
        TrackingCubit cubit = TrackingCubit.get(context);
        int currHour = DateTime.now().hour;
        int currMinInt = DateTime.now().minute;
        String currMin = (currMinInt < 10 ? '0$currMinInt' : '$currMinInt');
        String currTime =
            (currHour > 12 ? '${currHour % 12} : $currMin' : '$currHour');
        String formBegin = (currHour > 12 ? 'pm' : 'am');
        double fraction = 40 / 100;
        return SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: SharedComponents.defaultAppBar(context: context),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: AppSizes.height(context) * 0.87,
                      ),
                      Swipe(
                        onSwipeUp: () {
                          TrackingComponents.bottomModelSheet(
                              context, currTime, '8.30', formBegin, 'pm', fraction);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: smallTrackingCard,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.sp),
                                  topRight: Radius.circular(30.sp))),
                          child: Image.asset('${AppConstants.imagesUrl}$bar'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}

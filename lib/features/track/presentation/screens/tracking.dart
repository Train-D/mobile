import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';
import '../components/tracking_components.dart';
import '../controller/tracking_cubit/tracking_cubit.dart';
import 'package:swipe/swipe.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<TrackingCubit, TrackingState>(builder: (context, state) {
        //TrackingCubit cubit = TrackingCubit.get(context);
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
                      GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(37.42796133580664, -122.085749655962),
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          Completer<GoogleMapController>().complete(controller);
                        },
                      ),
                      SizedBox(
                        height: AppSizes.height(context) * 0.87,
                      ),
                      Swipe(
                        onSwipeUp: () {
                          TrackingComponents.bottomModelSheet(context, currTime,
                              '8.30', formBegin, 'pm', fraction);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 10.h,
                          decoration: BoxDecoration(
                              color: smallTrackingCard,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.sp),
                                  topRight: Radius.circular(30.sp))),
                          child: Image.asset(
                            '${AppConstants.imagesUrl}$bar',
                          ),
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

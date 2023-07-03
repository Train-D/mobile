
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';
import '../controller/tracking_cubit/tracking_cubit.dart';



class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          BlocBuilder<TrackingCubit, TrackingState>(builder: (context, state) {
        TrackingCubit cubit = TrackingCubit.get(context);
        return SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: SharedComponents.defaultAppBar(context: context),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: AppSizes.height(context) * 0.8,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.sp, vertical: 15.sp),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(cubit.trackModel.latitude,
                                  cubit.trackModel.longitude),
                              zoom: 14.5,
                            ),
                            markers: {
                              Marker(
                                  markerId: MarkerId('Souce'),
                                  position: cubit.sourceLocation),
                              Marker(
                                  markerId: MarkerId('destination'),
                                  position: LatLng(cubit.trackModel.latitude,
                                      cubit.trackModel.longitude))
                            },
                            polylines: {
                              Polyline(polylineId: PolylineId('Route'), points: cubit.polylineCoordinates, color: Colors.blueAccent, width: 6)
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height(context) * 0.047,
                    ),
                    //Spacer(),
                    /*Swipe(
                      onSwipeUp: () {
                        TrackingComponents.bottomModelSheet(context, currTime,
                            '8.30', formBegin, 'pm', fraction);
                      },
                      child: Container(
                        width: double.infinity,
                        height: AppSizes.height(context) * 0.1,
                        decoration: BoxDecoration(
                            color: smallTrackingCard,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.sp),
                                topRight: Radius.circular(30.sp))),
                        child: Image.asset(
                          '${AppConstants.imagesUrl}$bar',
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
            ));
      }),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe/swipe.dart';
import 'package:traind_app/features/track/presentation/components/tracking_components.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
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
                            onMapCreated: (controller) => cubit.mapController.complete(controller),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(cubit.trackModel.latitude,
                                  cubit.trackModel.longitude),
                              zoom: 8,
                            ),
                            markers: {
                              Marker(
                                  markerId: MarkerId('Souce'),
                                  position: LatLng(cubit.sourceLat, cubit.sourceLng) ),
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
                    Swipe(
                      onSwipeUp: () {
                        TrackingComponents.bottomModelSheet(context, cubit.trackModel.startTime,
                            cubit.trackModel.arrivalTime, 1, cubit.trackModel.fromStation);
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
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }
}

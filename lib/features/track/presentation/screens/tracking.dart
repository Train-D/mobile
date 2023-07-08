import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:swipe/swipe.dart';
import '../components/tracking_components.dart';
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
    return BlocBuilder<TrackingCubit, TrackingState>(builder: (context, state) {
      TrackingCubit cubit = TrackingCubit.get(context);
      return SharedComponents.linearGradientBg(
          colors: profileBg,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: SharedComponents.defaultAppBar(context: context),
            body: SingleChildScrollView(
              child: SizedBox(
                height: AppSizes.height(context),
                child: Stack(
                  
                  children: [
                    Container(
                      height: AppSizes.height(context) * 0.85,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16.sp,
                          left: 15.sp,
                          right: 15.sp,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: GoogleMap(
                            onMapCreated: (controller) =>
                                cubit.mapController.complete(controller),
                            initialCameraPosition: CameraPosition(
                              target: LatLng(cubit.trackModel.latitude,
                                  cubit.trackModel.longitude),
                              zoom: 8,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId('Souce'),
                                position:
                                    LatLng(cubit.sourceLat, cubit.sourceLng),
                              ),
                              Marker(
                                  markerId: MarkerId('destination'),
                                  position: LatLng(cubit.trackModel.latitude,
                                      cubit.trackModel.longitude))
                            },
                            polylines: {
                              Polyline(
                                  polylineId: PolylineId('Route'),
                                  points: cubit.polylineCoordinates,
                                  color: Colors.blueAccent,
                                  width: 6)
                            },
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: AppSizes.height(context) * 0.85,
                        ),
                        Container(
                          //alignment: Alignment.bottomCenter,
                          height: AppSizes.height(context) * 0.15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20.sp), topRight: Radius.circular(20.sp)),
                            gradient: LinearGradient(
                              colors: trackingContainerBg,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            //color: Colors.amber
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20.sp, horizontal: 25.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Station',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      cubit.trackModel.fromStation,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Time',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      cubit.TimeToArrive,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Distance',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                    Text(
                                      cubit.distanceToArrive,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18.5.sp,
                                              fontWeight: FontWeight.w100),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}

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

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import 'package:google_maps_flutter/google_maps_flutter.dart'
    show SphericalUtil;

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.sp, vertical: 15.sp),
                      child: Container(
                        height: AppSizes.height(context) * 0.8,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.sp),
                          child: /*GoogleMap(
                            //mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(37.42796133580664, -122.085749655962),
                              zoom: 14.4746,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              Completer<GoogleMapController>().complete(controller);
                            },
                          ),*/
                              GoogleMap(
                            //mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target:
                                  LatLng(37.42796133580664, -122.085749655962),
                              zoom: 14.4746,
                            ),
                            markers: {
                              Marker(
                                markerId: MarkerId('destination'),
                                position: LatLng(
                                    37.42796133580664, -122.085749655962),
                                infoWindow: InfoWindow(
                                  title: 'Destination',
                                  snippet:
                                      'Coordinates: 37.42796133580664, -122.085749655962',
                                ),
                              ),
                              Marker(
                                markerId: MarkerId('source'),
                                position: LatLng(
                                    37.42796133580664, -121.085749655962),
                                infoWindow: InfoWindow(
                                  title: 'Source',
                                  snippet:
                                      'Coordinates: 39.42796133580664, -122.085749655962',
                                ),
                              ),
                            },
                            polylines: {
                              Polyline(
                                polylineId: PolylineId('route'),
                                points: [
                                  LatLng(37.42796133580664, -121.085749655962),
                                  LatLng(37.42796133580664, -122.085749655962),
                                ],
                                color: Colors.blue,
                                width: 5,
                              ),
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.height(context) * 0.013,
                    ),
                    //Spacer(),
                    Swipe(
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
                    )
                  ],
                ),
              ),
            ));
      }),
    );
  }
}

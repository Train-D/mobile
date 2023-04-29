import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/stations/presentation/controller/all_stations_cubit/all_stations_cubit.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';
import 'station_details_screen.dart';

class StationsScreen extends StatelessWidget {
  const StationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$stations',
        context: context,
        child: SharedComponents.linearGradientBg(
          colors: stationsBgColor,
          child: BlocConsumer<AllStationsCubit, AllStationsState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = AllStationsCubit.get(context);
              return Scaffold(
                backgroundColor: transparent,
                appBar: SharedComponents.defaultAppBar(context: context),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.sp,
                      ),
                      SharedComponents.defaultTextField(
                        controller: TextEditingController(),
                        type: TextInputType.text,
                        validate: (e) {
                          return null;
                        },
                        label: 'Search',
                        radius: 14.sp,
                        bgColor: searchTextFieldBgColor,
                        preIconFound: true,
                        preIcon: Icons.search,
                        prePressed: () {},
                        suffIconFound: true,
                        suffIcon: Icons.keyboard_voice,
                        suffPressed: () {},
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Expanded(
                        child: Container(
                          width: AppSizes.width(context),
                          decoration: BoxDecoration(
                            color: stationsContainerBgColor,
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(20.sp),
                              topEnd: Radius.circular(20.sp),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(25.sp),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  
                                  Text(
                                    'A',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => InkWell(
                                      child: Text(
                                        'Apanpola',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      onTap: () {
                                        SharedComponents.navigateTo(
                                            const StationDetailsScreen(),
                                            context);
                                      },
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 20.sp,
                                    ),
                                    itemCount: 15,
                                  ),
                                  
                                  // SizedBox(
                                  //   height: 15.sp,
                                  // ),
                                  // InkWell(
                                  //   child: Text(
                                  //     'Apanpola',
                                  //     style: Theme.of(context)
                                  //         .textTheme
                                  //         .displayMedium,
                                  //   ),
                                  //   onTap: () {
                                  //     SharedComponents.navigateTo(
                                  //         const StationDetailsScreen(),
                                  //         context);
                                  //   },
                                  // ),
                                  
                                  // SizedBox(
                                  //   height: 20.sp,
                                  // ),
                                  // Text(
                                  //   'Agbopura',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .displayMedium,
                                  // ),
                                  // SizedBox(
                                  //   height: 20.sp,
                                  // ),
                                  // Text(
                                  //   'Apanbola',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .displayMedium,
                                  // ),
                                  // SizedBox(
                                  //   height: 20.sp,
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

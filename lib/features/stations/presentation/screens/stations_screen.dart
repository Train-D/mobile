import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controller/all_stations_cubit/all_stations_cubit.dart';

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
                            child: state is GetAllStationsNamesLoadingState ||
                                    state is GetAllStationsNamesFailureState
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : SingleChildScrollView(
                                   physics: const BouncingScrollPhysics(),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 25.sp,
                                        vertical: 20.sp,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ListView.separated(
                                            physics: const BouncingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cubit.allStationsNamesModel
                                                      .keys
                                                      .toList()[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                SizedBox(
                                                  height: 0.sp,
                                                ),
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, idx) =>
                                                      InkWell(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .only(
                                                        top: 15.sp,
                                                        bottom: 15.sp,
                                                      ),
                                                      child: Text(
                                                        cubit
                                                            .allStationsNamesModel
                                                            .values
                                                            .toList()[index]
                                                                [idx]
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium,
                                                      ),
                                                    ),
                                                    onTap: () async {
                                                      SharedComponents
                                                          .navigateTo(
                                                        StationDetailsScreen(
                                                          stationName: cubit
                                                              .allStationsNamesModel
                                                              .values
                                                              .toList()[index]
                                                                  [idx]
                                                              .toString(),
                                                        ),
                                                        context,
                                                      );
                                                      await cubit
                                                          .getStationDetailsByName(
                                                        cubit
                                                            .allStationsNamesModel
                                                            .values
                                                            .toList()[index]
                                                                [idx]
                                                            .toString(),
                                                      );
                                                    },
                                                  ),
                                                  itemCount: cubit
                                                      .allStationsNamesModel
                                                      .values
                                                      .toList()[index]
                                                      .length,
                                                ),
                                              ],
                                            ),
                                            separatorBuilder:
                                                (context, index) => SizedBox(
                                              height: 20.sp,
                                            ),
                                            itemCount: cubit
                                                .allStationsNamesModel.keys
                                                .toList()
                                                .length,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
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

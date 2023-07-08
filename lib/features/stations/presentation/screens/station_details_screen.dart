// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/stations/presentation/controller/all_stations_cubit/all_stations_cubit.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';

// ignore: must_be_immutable
class StationDetailsScreen extends StatelessWidget {
  String stationName;
  StationDetailsScreen({
    Key? key,
    required this.stationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllStationsCubit, AllStationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AllStationsCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: SharedComponents.defaultAppBar(context: context),
            body: Stack(
              children: [
                Image(
                  width: AppSizes.width(context),
                  height: MediaQuery.of(context).size.height / 2.2,
                  fit: BoxFit.cover,
                  image: AssetImage(
                    '${AppConstants.imagesUrl}$stationDetails',
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: AppSizes.width(context),
                    height: MediaQuery.of(context).size.height / 1.7,
                    decoration: BoxDecoration(
                      color: stationDetailsBgColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20.sp),
                        topEnd: Radius.circular(20.sp),
                      ),
                    ),
                    child: state is GetStationDetailsByNameSuccessState
                        ? Padding(
                            padding: EdgeInsets.all(15.sp),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Text(
                                    cubit.stationDetails.stationName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                  ),
                                  SizedBox(
                                    height: 20.sp,
                                  ),
                                  Text(
                                    cubit.stationDetails.stationInfo,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                  ),
                                  SizedBox(
                                    height: 25.sp,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address:  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          cubit.stationDetails.address,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium,
                                          maxLines: 5,
                                          overflow: TextOverflow.ellipsis,    
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Hours Open:  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        cubit.stationDetails.hoursOpen.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Phone:  ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        cubit.stationDetails.phone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25.sp,
                                  ),
                                  // Text(
                                  //   'General Information',
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .displayMedium!
                                  //       .copyWith(
                                  //         fontWeight: FontWeight.bold,
                                  //       ),
                                  // ),
                                  // SizedBox(
                                  //   height: 20.sp,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Telephones:  ',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium!
                                  //           .copyWith(
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //     ),
                                  //     Text(
                                  //       '+94114600111',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium,
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 15.sp,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Fax Nos:  ',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium!
                                  //           .copyWith(
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //     ),
                                  //     Text(
                                  //       '+94114600111',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium,
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 15.sp,
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'Email:  ',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium!
                                  //           .copyWith(
                                  //             fontWeight: FontWeight.bold,
                                  //           ),
                                  //     ),
                                  //     Text(
                                  //       'gmr@railway.gov.lk',
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .displayMedium,
                                  //     ),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 20.sp,
                                  // ),
                                
                                ],
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

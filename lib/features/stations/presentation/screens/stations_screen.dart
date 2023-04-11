import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/stations/presentation/screens/station_details_screen.dart';

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
          child: Scaffold(
            backgroundColor: transparent,
            appBar: SharedComponents.defualtAppBar(context),
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
                              InkWell(
                                child: Text(
                                  'Apanpola',
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                                onTap: () {
                                  SharedComponents.navigateTo(
                                      const StationDetailsScreen(), context);
                                },
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Agbopura',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                              Text(
                                'Apanbola',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              SizedBox(
                                height: 20.sp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

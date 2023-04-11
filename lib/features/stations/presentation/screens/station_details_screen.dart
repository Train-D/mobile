import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/components.dart';

class StationDetailsScreen extends StatelessWidget {
  const StationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SharedComponents.defualtAppBar(context),
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
                child: Padding(
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
                          'Fort Railway Station',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Text(
                          'Fort railway station is a major rail hub in Colombo, Sri Lanka. The station is served by Sri Lanka Railways, with many inter-city and commuter trains entering each day. Fort Station is the main rail gateway to central Colombo; it is the terminus of most intercity trains in the country.',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                        Row(
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
                            Text(
                              'Colombo',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Hours:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Open - 24 Hours',
                              style: Theme.of(context).textTheme.displayMedium,
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
                              '0112434215',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25.sp,
                        ),
                        Text(
                          'General Information',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Telephones:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '+94114600111',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Fax Nos:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              '+94114600111',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.sp,
                        ),
                        Row(
                          children: [
                            Text(
                              'Email:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'gmr@railway.gov.lk',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ],
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
    );
  }
}

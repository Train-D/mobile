// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/components.dart';
import '../../components/reusable_component/tickets_components.dart';
import '../../controller/booking_cubit/booking_cubit.dart';
import '../../screens/payment_screen.dart';

Widget chooseSeatsAlertDialogContent({
  required BuildContext context,
  required double price,
  required bool isBooked,
}) =>
    BlocConsumer<BookingCubit, BookingState>(
      listener: (context, state) {},
      builder: (context, state) {
        //BookingCubit cubit = BookingCubit.get(context);
        return Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 60,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !isBooked
                      ? TicketsComponents.priceRow(
                          context: context,
                          price: price,
                        )
                      : Text(
                          "Already Booked",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                        ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SharedComponents.defaultButton(
                    context: context,
                    function: () {
                      Navigator.pop(context);
                    },
                    text: AppString.cancel,
                    width: 100,
                    radius: AppSizes.defaultBottomRadius,
                    textSize: 16,
                    bgColor: chooseSeatsCancelButtonBg,
                    cancel: true,
                  ),
                  if (!isBooked)
                    SharedComponents.defaultButton(
                      context: context,
                      function: () {
                        Navigator.pop(context);
                        SharedComponents.navigateTo(
                          const PaymentScreen(),
                          context,
                        );
                      },
                      text: AppString.book,
                      width: 100,
                      radius: AppSizes.defaultBottomRadius,
                      textSize: 16,
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );

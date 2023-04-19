import 'package:flutter/material.dart';
import 'package:traind_app/core/utils/app_strings.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../screens/choose_seats_screen.dart';
import '../classes/seat_details.dart';

class ChooseSeatsComponents {
  static appBarTitle({
    required BuildContext context,
  }) =>
      Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 50,
          bottom: 30,
          end: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppString.chooseSeatsAppBarTitle,
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: trainUnAvailableSeatColor,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      );

  static Widget defaultSeat({
    required BuildContext context,
    required Seat seatDetails,
  }) =>
      InkWell(
        onTap: () {
          showChooseSeatsAlertDialog(
            context: context,
            seatNumber: seatDetails.seatNumber,
          );
        },
        child: Container(
          width: 33,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: seatDetails.isAvailable
                ? trainAvailableSeatColor
                : trainUnAvailableSeatColor,
            border: Border.all(
              width: 0.5,
              color: trainUnAvailableSeatColor,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(seatDetails.seatNumber,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color:
                          seatDetails.isAvailable ? trainUnAvailableSeatColor : lightColor,
                      fontSize: 18,
                    )),
          ),
        ),
      );

  static Widget twoSeats({
    required BuildContext context,
    required Seat seat1,
    required Seat seat2,
  }) =>
      Row(
        children: [
          ChooseSeatsComponents.defaultSeat(
            context: context,
             seatDetails: seat1,
          ),
          const SizedBox(
            width: 10,
          ),
          ChooseSeatsComponents.defaultSeat(
            context: context,
            seatDetails: seat2,
          ),
        ],
      );

  static Widget columnSeats({
    required BuildContext context,
    required Widget firstRowTwoSeats,
    required Widget secondRowTwoSeats,
    required Widget thirdRowTwoSeats,
    bool isfirst = false,
    Widget? fourthRowTwoSeats,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          children: [
            firstRowTwoSeats,
            const SizedBox(
              height: 35,
            ),
            secondRowTwoSeats,
            const SizedBox(
              height: 35,
            ),
            thirdRowTwoSeats,
            // if (!isfirst)
            //   const SizedBox(
            //     height: 35,
            //   ),
            //   fourthRowTwoSeats,
          ],
        ),
      );

  static defaultDividerLine({
    required double height,
  }) =>
      Container(
        height: height,
        width: 1,
        color: lightColor,
      );
}

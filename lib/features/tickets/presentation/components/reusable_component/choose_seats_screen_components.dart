import 'package:flutter/material.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../screens/choose_seats_screen.dart';
import '../classes/seat_details.dart';

class ChooseSeatsComponents {
  
  static appBarTitle({
    required BuildContext context,
  }) =>
      Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 40,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Choose Your Seats',
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
    required String seatNumber,
    required bool isAvailable,
  }) =>
      InkWell(
        onTap: () {
          showChooseSeatsAlertDialog(
            context: context,
            seatNumber: seatNumber,
          );
          debugPrint(seatNumber);
        },
        child: Container(
          width: 33,
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isAvailable
                ? trainAvailableSeatColor
                : trainUnAvailableSeatColor,
            border: Border.all(
              width: 0.5,
              color: trainUnAvailableSeatColor,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(seatNumber,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color:
                          isAvailable ? trainUnAvailableSeatColor : lightColor,
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
            seatNumber: seat1.seatNumber,
            isAvailable: seat1.isAvailable,
          ),
          const SizedBox(
            width: 10,
          ),
          ChooseSeatsComponents.defaultSeat(
            context: context,
            seatNumber: seat2.seatNumber,
            isAvailable: seat2.isAvailable,
          ),
        ],
      );

  static Widget columnSeats({
    required BuildContext context,
    required Widget firstRowTwoSeats,
    required Widget secondRowTwoSeats,
    required Widget thirdRowTwoSeats,
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
            thirdRowTwoSeats
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

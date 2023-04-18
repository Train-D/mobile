import 'package:flutter/material.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../screens/choose_seats_screen.dart';

class ChooseSeatsComponents {
  static defaultSeat({
    required BuildContext context,
    required String seatNumber,
    required bool isAvailable,
    //required Function onTap,
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

  static defaultDividerLine({
    required double height,
  }) =>
      Container(
        height: height,
        width: 1,
        color: lightColor,
      );
}

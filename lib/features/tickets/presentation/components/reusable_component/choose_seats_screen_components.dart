import 'package:flutter/material.dart';
import 'package:traind_app/core/utils/app_strings.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../data/models/second screen/seat_model.dart';
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
          start: 30,
          end: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
    required SeatModel seatDetails,
    required Function fun,
    required bool booked,
    double width = 33,
    double height = 44,
    double radius = 10,
    double borderWidth = 0.5,
  }) =>
      InkWell(
        onTap: () {
          fun();
          // showChooseSeatsAlertDialog(
          //   context: context,
          //   seatNumber: seatDetails.seatNumber.toString(),
          // );
        },
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: !booked ? trainAvailableSeatColor : trainUnAvailableSeatColor,
            border: Border.all(
              width: borderWidth,
              color: trainUnAvailableSeatColor,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(seatDetails.seatNumber.toString(),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: !booked ? trainUnAvailableSeatColor : lightColor,
                      fontSize: 18,
                    )),
          ),
        ),
      );

   static Widget twoSeats({
    required BuildContext context,
    required SeatModel seat1,
    required Function fun1,
    required Function fun2,
    required SeatModel seat2,
    required bool booked1,
    required bool booked2,
  }) =>
      Row(
        children: [
          ChooseSeatsComponents.defaultSeat(
            context: context,
            seatDetails: seat1,
            fun: fun1,
            booked: booked1, 
          ),
          const SizedBox(
            width: 10,
          ),
          ChooseSeatsComponents.defaultSeat(
            context: context,
            seatDetails: seat2,
            fun: fun2,
            booked: booked2,
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

  /*static buttonAndWordRow({
    required BuildContext context,
    required bool isAvailable,
    required String text,
  }) =>
      Row(
        children: [
          ChooseSeatsComponents.defaultSeat(
            context: context,
            seatDetails: Seat(
              seatNumber: '',
              isAvailable: isAvailable,
            ),
            width: 10,
            height: 13,
            radius: 3,
            borderWidth: 1,
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: trainUnAvailableSeatColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
          ),
        ],
      );
*/
  static trainCarClassText({
    required BuildContext context,
    required String carClass,
  }) =>
      Padding(
        padding: const EdgeInsetsDirectional.only(
          top: 70,
          bottom: 35,
        ),
        child: Text(
          carClass,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: trainUnAvailableSeatColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      );

  static trainSmallCarWithSelectedContainer({
    required String image,
    required Color showBorder,
  }) =>
      Container(
        width: 70,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: showBorder,
            width: 2,
          ),
        ),
        child: Image(
          image: AssetImage(
            '${AppConstants.vectorsUrl}$image',
          ),
        ),
      );
}

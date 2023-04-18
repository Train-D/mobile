// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_cubit.dart';
import 'package:traind_app/features/tickets/presentation/controller/choose_seats/choose_seats_state.dart';

import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../components/classes/seat_details.dart';
import '../components/classes/train_first_car_custom_paint.dart';
import '../components/reusable_component/choose_seats_screen_components.dart';
import '../components/reusable_component/tickets_components.dart';
import 'choose_seats/train_first_car.dart';

class ChooseSeatsScreen extends StatelessWidget {
  const ChooseSeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SharedComponents.linearGradientBg(
      colors: profileBg,
      child: BlocConsumer<ChooseSeatsCubit, ChooseSeatsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ChooseSeatsCubit cubit = ChooseSeatsCubit.get(context);
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: transparent,
            appBar: SharedComponents.defaultAppBar(context),
            body: Center(
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    width: 220,
                    height: 430,
                    child: 
                    CustomPaint(
                        painter: TrainFirstCarShape(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage(
                                    '${AppConstants.vectorsUrl}$trainCarOneFrontVector'),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                columnSeats(
                                  context: context,
                                  seat1: cubit.firstCarSeats[0],
                                  seat2: cubit.firstCarSeats[1],
                                ),
                                ChooseSeatsComponents.defaultDividerLine(
                                  height: 245,
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 15,
                                //   ),
                                //   child: Column(
                                //     children: [
                                //       twoSeats(
                                //         context: context,
                                //         firstSeatNumber: '03',
                                //         secondSeatNumber: '04',
                                //         firstSeatAvailable: true,
                                //         secondSeatAvailable: true,
                                //       ),
                                //       const SizedBox(
                                //         height: 35,
                                //       ),
                                //       twoSeats(
                                //         context: context,
                                //         firstSeatNumber: '07',
                                //         secondSeatNumber: '08',
                                //         firstSeatAvailable: false,
                                //         secondSeatAvailable: true,
                                //       ),
                                //       const SizedBox(
                                //         height: 35,
                                //       ),
                                //       twoSeats(
                                //         context: context,
                                //         firstSeatNumber: '11',
                                //         secondSeatNumber: '12',
                                //         firstSeatAvailable: false,
                                //         secondSeatAvailable: true,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        )),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    ));
  }
}

Widget twoSeats({
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
          //onTap: seat1.bookSeat,
        ),
        const SizedBox(
          width: 10,
        ),
        ChooseSeatsComponents.defaultSeat(
          context: context,
          seatNumber: seat2.seatNumber,
          isAvailable: seat2.isAvailable,
          //onTap: seat2.bookSeat,
        ),
      ],
    );

Widget columnSeats({
  required BuildContext context,
  required Seat seat1,
  required Seat seat2,
  // required Seat seat3,
  // required Seat seat4,
  // required Seat seat5,
  // required Seat seat6,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          twoSeats(
            context: context,
            seat1: Seat(
              seatNumber: seat1.seatNumber,
              isAvailable: seat1.isAvailable,
              //bookSeat: seat1.bookSeat,
            ),
            seat2: Seat(
              seatNumber: seat2.seatNumber,
              isAvailable: seat2.isAvailable,
              //bookSeat: seat2.bookSeat,
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          // twoSeats(
          //   context: context,
          //   seat1: Seat(
          //     seatNumber: '05',
          //     isAvailable: true,
          //     bookSeat: () {},
          //   ),
          //   seat2: Seat(
          //     seatNumber: '06',
          //     isAvailable: true,
          //     bookSeat: () {},
          //   ),
          // ),
          // const SizedBox(
          //   height: 35,
          // ),
          // twoSeats(
          //   context: context,
          //   seat1: Seat(
          //     seatNumber: '05',
          //     isAvailable: true,
          //     bookSeat: () {},
          //   ),
          //   seat2: Seat(
          //     seatNumber: '06',
          //     isAvailable: true,
          //     bookSeat: () {},
          //   ),
          // ),
        ],
      ),
    );

Widget chooseSeatsAlertDialogContent({
  required BuildContext context,
  required String seatNumber,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 60,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TicketsComponents.priceRow(
                context: context,
                price: 24.5,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SharedComponents.defaultButton(
            context: context,
            function: () {
              trainFirstCar(seatNumber: seatNumber, context: context);
            },
            text: AppString.book,
            width: 100,
            radius: AppSizes.defaultBottomRadius,
            textSize: 16,
          ),
        ],
      ),
    );

showChooseSeatsAlertDialog({
  required BuildContext context,
  required String seatNumber,
}) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return TicketsComponents.defaultAlertDialog(
        height: 190,
        content: trainFirstCar(
          context: context,
          seatNumber: seatNumber,
        ),
        // content: chooseSeatsAlertDialogContent(
        //   context: context,
        //   seatNumber: seatNumber,
        // ),
      );
    },
  );
}
